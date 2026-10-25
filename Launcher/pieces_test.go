package main

import (
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"sort"
	"testing"
)

func splitRegister(pieces map[string]string) *PatchRegisterClient {
	var files []WxlFile
	for n, sum := range pieces {
		files = append(files, WxlFile{Name: n, Checksum: sum, SizeMB: 0})
	}
	return &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{
		"PATCH-Q":     {Version: 2, Files: files},
		"PATCH-Z.MPQ": {Version: 9},
	}}}
}

// An archive piece installs into Data/, a client binary next to the launcher.
func TestMemberPathPieceInData(t *testing.T) {
	if got, want := memberPath("PATCH-Q-01.MPQ"), filepath.Join(getAppDirectory(), DataDirectory, "PATCH-Q-01.MPQ"); got != want {
		t.Errorf("piece path %s, want %s", got, want)
	}
	if memberPath(SourceClientExe) != wxlFilePath(SourceClientExe) {
		t.Error("client binary moved")
	}
}

// Only the pieces whose md5 changed are downloaded: a piece recorded at the register md5 is current, a
// piece whose register md5 moved on (or that was never recorded, or is missing) is not.
func TestOnlyChangedPiecesDownload(t *testing.T) {
	dataDir, _ := ensureDirectories()
	memberStore = &VersionManager{versionFile: filepath.Join(t.TempDir(), "v.json"), versions: map[string]string{}}
	defer func() { memberStore = nil }()
	for _, n := range []string{"PATCH-Q-01.MPQ", "PATCH-Q-02.MPQ"} {
		os.WriteFile(filepath.Join(dataDir, n), []byte("x"), 0644)
		defer os.Remove(filepath.Join(dataDir, n))
	}
	recordMember("PATCH-Q-01.MPQ", "aaa")
	recordMember("PATCH-Q-02.MPQ", "bbb")
	pr := splitRegister(map[string]string{"PATCH-Q-01.MPQ": "aaa", "PATCH-Q-02.MPQ": "ccc", "PATCH-Q-03.MPQ": "ddd"})
	files, _ := pr.BundleFiles("PATCH-Q")
	current := map[string]bool{}
	for _, f := range files {
		current[f.Name] = memberCurrent(pr, f)
	}
	if !current["PATCH-Q-01.MPQ"] || current["PATCH-Q-02.MPQ"] || current["PATCH-Q-03.MPQ"] {
		t.Errorf("current = %v, want only 01", current)
	}
	// installing a staged piece records it
	recordInstalledMember(pr, "PATCH-Q-02.MPQ")
	if f := (WxlFile{Name: "PATCH-Q-02.MPQ", Checksum: "ccc"}); !memberCurrent(pr, f) {
		t.Error("installed piece not current")
	}
}

// The single PATCH-Q.MPQ and pieces that left the bundle are obsolete; other patches and current pieces
// are not (names compared case-insensitively: Windows clients may hold patch-q.mpq).
func TestOrphanPieces(t *testing.T) {
	dir := t.TempDir()
	for _, n := range []string{"patch-Q.MPQ", "PATCH-Q-01.MPQ", "PATCH-Q-07.MPQ", "PATCH-R.MPQ", "PATCH-Z.MPQ", "patch-q-02.mpq"} {
		os.WriteFile(filepath.Join(dir, n), []byte("x"), 0644)
	}
	pr := splitRegister(map[string]string{"PATCH-Q-01.MPQ": "a", "PATCH-Q-02.MPQ": "b"})
	got := orphanPieces(pr, dir)
	sort.Strings(got)
	want := []string{"PATCH-Q-07.MPQ", "patch-Q.MPQ"}
	sort.Strings(want)
	if len(got) != len(want) || got[0] != want[0] || got[1] != want[1] {
		t.Errorf("orphans %v, want %v", got, want)
	}
	// no split bundle in the register: nothing is obsolete
	plain := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{"PATCH-Q.MPQ": {Version: 1}}}}
	if o := orphanPieces(plain, dir); len(o) != 0 {
		t.Errorf("orphans without a split bundle: %v", o)
	}
}

// A split bundle reports ONE progress run over every piece it fetches: Downloaded never goes back when the
// next piece starts, Part counts the pieces, and the last report is the bundle total (players took the
// per-piece bar restarting as a failure).
func TestBundleProgressIsCumulative(t *testing.T) {
	pieces := map[string][]byte{"PATCH-Q-01.MPQ": make([]byte, 300<<10), "PATCH-Q-02.MPQ": make([]byte, 200<<10)}
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write(pieces[filepath.Base(r.URL.Path)])
	}))
	defer srv.Close()
	old := MPQDownloadURL
	MPQDownloadURL = srv.URL + "/MPQ/"
	defer func() { MPQDownloadURL = old }()
	memberStore = &VersionManager{versionFile: filepath.Join(t.TempDir(), "v.json"), versions: map[string]string{}}
	defer func() { memberStore = nil }()
	var files []WxlFile
	for _, n := range []string{"PATCH-Q-01.MPQ", "PATCH-Q-02.MPQ"} {
		files = append(files, WxlFile{Name: n, Checksum: md5Hex(pieces[n]), SizeMB: float64(len(pieces[n])) / (1 << 20)})
		defer os.Remove(memberPath(n))
		defer os.Remove(filepath.Join(getTempDownloadDir(), n))
	}
	pr := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{"PATCH-Q": {Version: 1, Files: files}}}}
	ch := make(chan DownloadProgress, 4096)
	res := performDownload("PATCH-Q", pr, ch, make(chan struct{}))
	close(ch)
	if !res.Success {
		t.Fatalf("download failed: %s", res.Message)
	}
	var last DownloadProgress
	n := 0
	for p := range ch {
		if p.Downloaded < last.Downloaded || p.Total != 500<<10 || p.Parts != 2 {
			t.Fatalf("progress %+v after %+v", p, last)
		}
		last, n = p, n+1
	}
	if n == 0 || last.Downloaded != last.Total || last.Part != 2 {
		t.Errorf("last progress %+v (%d reports), want the bundle total on piece 2", last, n)
	}
}
