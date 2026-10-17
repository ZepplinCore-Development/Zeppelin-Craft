package main

// F-224: the x64 source-built client (WowClient64.exe) replaces the patched 32-bit Wow.exe + WarcraftXL.
//
// The patch register decides which client this install runs. When it carries the WowClient64 bundle, the
// launcher downloads that bundle from EXE64/, deletes the WarcraftXL files (WXL's 32-bit d3d9.dll proxy
// cannot load into a 64-bit process), ignores the legacy Wow.exe and WarcraftXL entries and launches
// WowClient64.exe. Without it, everything behaves exactly as before. That makes the cut-over a register
// change on the server (zep build exe source ship --activate), with no launcher-side switch.

import (
	"bufio"
	"debug/pe"
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"sync/atomic"
)

const (
	SourceClientBundle = "WowClient64"     // register key of the x64 client bundle
	SourceClientExe    = "WowClient64.exe" // its executable
	LegacyWowExe       = "Wow.exe"
	LegacyWxlBundle    = "WarcraftXL"
)

// clientBinaries are the members of the WowClient64 bundle: served from EXE64/, installed next to the
// launcher. Both are loaded while the game runs, so they stage to temp when WoW is open.
var clientBinaries = map[string]bool{
	SourceClientExe:   true,
	"XvidDecoder.dll": true,
}

// sourceClientMode is set from every successful register fetch.
var sourceClientMode atomic.Bool

func isSourceClientMode() bool { return sourceClientMode.Load() }

func isClientBinary(filename string) bool { return clientBinaries[filename] }

// legacyEntry reports whether a register entry belongs to the 32-bit client that the source client
// replaces. In source-client mode these are neither downloaded nor required for launch.
func legacyEntry(filename string) bool {
	return filename == LegacyWowExe || filename == LegacyWxlBundle
}

// gameExecutable is the client this install launches.
func gameExecutable() string {
	if isSourceClientMode() {
		return SourceClientExe
	}
	return WowExecutable
}

// appBinarySubdir reports whether filename is a binary installed into the app directory by member name
// (a WarcraftXL file or a source-client file) and the subfolder it goes in ("" = next to the launcher).
func appBinarySubdir(filename string) (string, bool) {
	if isClientBinary(filename) {
		return "", true
	}
	return wxlSubdir(filename)
}

// downloadBaseURL is the server folder a file is served from.
func downloadBaseURL(filename string) string {
	if isClientBinary(filename) {
		return EXE64DownloadURL
	}
	if _, ok := wxlSubdir(filename); ok {
		return WXLDownloadURL
	}
	if strings.HasSuffix(strings.ToLower(filename), ".exe") {
		return EXEDownloadURL
	}
	return MPQDownloadURL
}

// ================================================================
// WARCRAFTXL REMOVAL
// ================================================================

// wxlLeftovers are the WarcraftXL files a pre-F-224 install carries, relative to the app directory.
// d3d9.dll is handled separately: it is only removed when it is a 32-bit image, so a player's own 64-bit
// d3d9.dll (DXVK and the like) survives.
var wxlLeftovers = []string{
	"WarcraftXL.dll",
	filepath.Join("Utils", "WarcraftXLHost.exe"),
	"wxl-assets",
}

// is32BitPE reports whether path is a 32-bit (i386) PE image.
func is32BitPE(path string) bool {
	f, err := pe.Open(path)
	if err != nil {
		return false
	}
	defer f.Close()
	return f.Machine == pe.IMAGE_FILE_MACHINE_I386
}

// removeWarcraftXL deletes the WarcraftXL framework from appDir. It returns the paths it removed and the
// ones it could not; a 32-bit d3d9.dll that cannot be removed blocks the launch (see LaunchGame).
func removeWarcraftXL(appDir string) (removed, failed []string) {
	try := func(path string, all bool) {
		if _, err := os.Lstat(path); err != nil {
			return
		}
		var err error
		if all {
			err = os.RemoveAll(path)
		} else {
			err = os.Remove(path)
		}
		if err != nil {
			failed = append(failed, path)
			logWarning(fmt.Sprintf("WarcraftXL removal: %s: %v", path, err))
			return
		}
		removed = append(removed, path)
		logInfo("WarcraftXL removal: deleted " + path)
	}

	if d3d9 := filepath.Join(appDir, "d3d9.dll"); is32BitPE(d3d9) {
		try(d3d9, false)
	}
	for _, rel := range wxlLeftovers {
		try(filepath.Join(appDir, rel), false)
	}
	// WarcraftXL extensions live in Extensions/wxl-<name>/; anything else under Extensions/ is not ours.
	if entries, err := os.ReadDir(filepath.Join(appDir, wxlExtensionsDir)); err == nil {
		for _, e := range entries {
			if e.IsDir() && strings.HasPrefix(strings.ToLower(e.Name()), "wxl-") {
				try(filepath.Join(appDir, wxlExtensionsDir, e.Name()), true)
			}
		}
	}
	return removed, failed
}

// ================================================================
// LINUX: 64-BIT WINE PREFIX
// ================================================================

var errWine32 = errors.New("your Wine prefix is 32-bit; the Zeppelin client is 64-bit only")

// winePrefix is the prefix `wine` will use.
func winePrefix() string {
	if p := os.Getenv("WINEPREFIX"); p != "" {
		return p
	}
	home, _ := os.UserHomeDir()
	return filepath.Join(home, ".wine")
}

// winePrefixArch reads the "#arch=" marker Wine writes at the top of system.reg ("win32" or "win64").
// "" means unknown (no prefix yet: Wine creates a 64-bit one by default, unless WINEARCH says otherwise).
func winePrefixArch(prefix string) string {
	f, err := os.Open(filepath.Join(prefix, "system.reg"))
	if err != nil {
		return ""
	}
	defer f.Close()
	sc := bufio.NewScanner(f)
	for i := 0; i < 10 && sc.Scan(); i++ {
		if line := strings.TrimSpace(sc.Text()); strings.HasPrefix(line, "#arch=") {
			return strings.TrimPrefix(line, "#arch=")
		}
	}
	return ""
}

// checkWine64 refuses a 32-bit Wine prefix for the 64-bit client (Linux only).
func checkWine64() error {
	if runtime.GOOS == "windows" {
		return nil
	}
	arch := winePrefixArch(winePrefix())
	if arch == "" {
		arch = os.Getenv("WINEARCH")
	}
	if arch == "win32" {
		return fmt.Errorf("%w (%s). Create a 64-bit prefix (WINEARCH=win64) and point WINEPREFIX at it", errWine32, winePrefix())
	}
	return nil
}
