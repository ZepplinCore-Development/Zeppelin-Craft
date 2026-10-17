package main

import (
	"os"
	"path/filepath"
	"testing"
)

const (
	testWxlD3d9  = "/workspace/project/nginx/wow/WXL/d3d9.dll"
	testClient64 = "/workspace/project/Zeppelin-Tools/wowdecomp-build/src/bin/Win/WowClient64.exe"
)

func copyFile(t *testing.T, src, dst string) {
	t.Helper()
	b, err := os.ReadFile(src)
	if err != nil {
		t.Skipf("fixture %s unavailable: %v", src, err)
	}
	os.MkdirAll(filepath.Dir(dst), 0755)
	if err := os.WriteFile(dst, b, 0644); err != nil {
		t.Fatal(err)
	}
}

func TestIs32BitPE(t *testing.T) {
	dir := t.TempDir()
	copyFile(t, testWxlD3d9, filepath.Join(dir, "wxl.dll"))
	copyFile(t, testClient64, filepath.Join(dir, "x64.exe"))
	os.WriteFile(filepath.Join(dir, "junk.dll"), []byte("not a PE"), 0644)
	if !is32BitPE(filepath.Join(dir, "wxl.dll")) {
		t.Error("WXL d3d9.dll should be 32-bit")
	}
	if is32BitPE(filepath.Join(dir, "x64.exe")) {
		t.Error("WowClient64.exe should not be 32-bit")
	}
	if is32BitPE(filepath.Join(dir, "junk.dll")) || is32BitPE(filepath.Join(dir, "missing.dll")) {
		t.Error("non-PE / missing must not count as 32-bit")
	}
}

func TestRemoveWarcraftXL(t *testing.T) {
	dir := t.TempDir()
	copyFile(t, testWxlD3d9, filepath.Join(dir, "d3d9.dll"))
	for _, f := range []string{"WarcraftXL.dll", "Utils/WarcraftXLHost.exe", "wxl-assets",
		"Extensions/wxl-modern-m2/wxl-modern-m2.dll", "Extensions/wxl-db2/wxl-db2.dll",
		"Extensions/SomeoneElse/keep.dll", "Wow.exe", "Data/patch-Z.MPQ"} {
		p := filepath.Join(dir, f)
		os.MkdirAll(filepath.Dir(p), 0755)
		os.WriteFile(p, []byte("x"), 0644)
	}
	_, failed := removeWarcraftXL(dir)
	if len(failed) > 0 {
		t.Fatalf("failed: %v", failed)
	}
	for _, gone := range []string{"d3d9.dll", "WarcraftXL.dll", "Utils/WarcraftXLHost.exe", "wxl-assets", "Extensions/wxl-modern-m2", "Extensions/wxl-db2"} {
		if _, err := os.Stat(filepath.Join(dir, gone)); err == nil {
			t.Errorf("%s should be removed", gone)
		}
	}
	for _, kept := range []string{"Extensions/SomeoneElse/keep.dll", "Wow.exe", "Data/patch-Z.MPQ", "Utils"} {
		if _, err := os.Stat(filepath.Join(dir, kept)); err != nil {
			t.Errorf("%s should be kept", kept)
		}
	}
}

func TestRemoveWarcraftXLKeeps64BitD3d9(t *testing.T) {
	dir := t.TempDir()
	copyFile(t, testClient64, filepath.Join(dir, "d3d9.dll")) // any x64 PE stands in for e.g. DXVK
	removeWarcraftXL(dir)
	if !fileExists(filepath.Join(dir, "d3d9.dll")) {
		t.Error("a 64-bit d3d9.dll must be kept")
	}
}

func TestVersionNewer(t *testing.T) {
	cases := []struct {
		a, b string
		want bool
	}{
		{"3.1.0", "3.0.0", true}, {"3.0.0", "3.1.0", false}, {"3.1.0", "3.1.0", false},
		{"3.10.0", "3.9.9", true}, {"3.1", "3.1.0", false}, {"3.1.1", "3.1", true}, {"", "3.1.0", false},
	}
	for _, c := range cases {
		if got := versionNewer(c.a, c.b); got != c.want {
			t.Errorf("versionNewer(%q,%q)=%v want %v", c.a, c.b, got, c.want)
		}
	}
}

func TestDownloadRouting(t *testing.T) {
	cases := map[string]string{
		"WowClient64.exe": EXE64DownloadURL, "XvidDecoder.dll": EXE64DownloadURL,
		"Wow.exe": EXEDownloadURL, "d3d9.dll": WXLDownloadURL,
		"Extensions/wxl-db2/wxl-db2.dll": WXLDownloadURL, "PATCH-Z.MPQ": MPQDownloadURL,
	}
	for f, want := range cases {
		if got := downloadBaseURL(f); got != want {
			t.Errorf("%s -> %s, want %s", f, got, want)
		}
	}
	if sub, ok := appBinarySubdir("XvidDecoder.dll"); !ok || sub != "" {
		t.Error("XvidDecoder.dll must install next to the launcher")
	}
}

func TestWinePrefixArch(t *testing.T) {
	dir := t.TempDir()
	if winePrefixArch(dir) != "" {
		t.Error("no system.reg -> unknown")
	}
	os.WriteFile(filepath.Join(dir, "system.reg"), []byte("WINE REGISTRY Version 2\n;; All keys relative to \\\\Machine\n\n#arch=win32\n"), 0644)
	if winePrefixArch(dir) != "win32" {
		t.Error("expected win32")
	}
	os.WriteFile(filepath.Join(dir, "system.reg"), []byte("WINE REGISTRY Version 2\n#arch=win64\n"), 0644)
	if winePrefixArch(dir) != "win64" {
		t.Error("expected win64")
	}
	t.Setenv("WINEPREFIX", dir)
	if err := checkWine64(); err != nil {
		t.Errorf("win64 prefix refused: %v", err)
	}
	os.WriteFile(filepath.Join(dir, "system.reg"), []byte("#arch=win32\n"), 0644)
	if err := checkWine64(); err == nil {
		t.Error("win32 prefix accepted")
	}
}

func TestRegisterModeHidesLegacy(t *testing.T) {
	c := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{
		"Wow.exe": {Version: 12}, "WarcraftXL": {Version: 5}, "PATCH-Z.MPQ": {Version: 3},
	}}}
	sourceClientMode.Store(false)
	if len(c.GetAllFiles()) != 3 || gameExecutable() != "Wow.exe" {
		t.Fatal("legacy mode must list every entry and launch Wow.exe")
	}
	c.Register.Patches[SourceClientBundle] = PatchEntry{Version: 1}
	sourceClientMode.Store(true)
	defer sourceClientMode.Store(false)
	all := c.GetAllFiles()
	if _, ok := all["Wow.exe"]; ok || len(all) != 2 || gameExecutable() != SourceClientExe {
		t.Fatalf("source mode: got %v, exe %s", all, gameExecutable())
	}
}
