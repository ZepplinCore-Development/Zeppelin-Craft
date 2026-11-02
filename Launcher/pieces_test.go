package main

import (
	"bytes"
	"fmt"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"sort"
	"testing"
	"time"
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

// 3.3.2: a piece cut off mid-download resumes from its .part file with a Range request instead of starting
// again at byte 0, and a part from another build (md5 in its name) is discarded.
func TestPieceResumesFromPart(t *testing.T) {
	body := make([]byte, 400<<10)
	for i := range body {
		body[i] = byte(i * 7)
	}
	var ranges []string
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ranges = append(ranges, r.Header.Get("Range"))
		http.ServeContent(w, r, "x", time.Time{}, bytes.NewReader(body))
	}))
	defer srv.Close()
	old := MPQDownloadURL
	MPQDownloadURL = srv.URL + "/MPQ/"
	defer func() { MPQDownloadURL = old }()
	memberStore = &VersionManager{versionFile: filepath.Join(t.TempDir(), "v.json"), versions: map[string]string{}}
	defer func() { memberStore = nil }()

	name, sum := "PATCH-Q-07.MPQ", md5Hex(body)
	tmp := filepath.Join(getTempDownloadDir(), name)
	defer os.Remove(memberPath(name))
	defer os.Remove(tmp)
	stale := tmp + ".deadbeef.part"
	os.WriteFile(stale, []byte("old build"), 0644)
	part := partPath(tmp, name, sum)
	os.WriteFile(part, body[:150<<10], 0644) // what a crash left behind
	if _, err := os.Stat(stale); err == nil {
		t.Error("part of another build kept")
	}

	pr := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{
		"PATCH-Q": {Version: 1, Files: []WxlFile{{Name: name, Checksum: sum, SizeMB: float64(len(body)) / (1 << 20)}}}}}}
	ch := make(chan DownloadProgress, 4096)
	res := performDownload("PATCH-Q", pr, ch, make(chan struct{}))
	close(ch)
	if !res.Success {
		t.Fatalf("download failed: %s", res.Message)
	}
	if len(ranges) != 1 || ranges[0] != fmt.Sprintf("bytes=%d-", 150<<10) {
		t.Errorf("requests %q, want one resume at 150 KB", ranges)
	}
	got, _ := os.ReadFile(memberPath(name))
	if md5Hex(got) != sum {
		t.Error("resumed piece is not the server's file")
	}
	if _, err := os.Stat(part); err == nil {
		t.Error(".part left behind")
	}
	if !memberCurrent(pr, pr.Register.Patches["PATCH-Q"].Files[0]) {
		t.Error("resumed piece not recorded")
	}
}

// 3.3.2: a piece staged in temp_patches/ (downloaded while the game ran) is not downloaded again when the
// launcher restarts before it is installed; installing it records the md5 it was staged at.
func TestStagedPieceNotDownloadedAgain(t *testing.T) {
	memberStore = &VersionManager{versionFile: filepath.Join(t.TempDir(), "v.json"), versions: map[string]string{}}
	defer func() { memberStore = nil }()
	name := "PATCH-Q-08.MPQ"
	tmp := filepath.Join(getTempDownloadDir(), name)
	os.WriteFile(tmp, []byte("staged"), 0644)
	defer os.Remove(tmp)
	f := WxlFile{Name: name, Checksum: "abc"}
	if memberStaged(f) {
		t.Error("unrecorded staged file counted")
	}
	recordStaged(name, "abc")
	if !memberStaged(f) || memberStaged(WxlFile{Name: name, Checksum: "newer"}) {
		t.Error("staged file at the register md5 should count, another build should not")
	}
	pr := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{"PATCH-Q": {Version: 1, Files: []WxlFile{{Name: name, Checksum: "newer"}}}}}}
	recordInstalledMember(pr, name)
	if memberStore.GetVersion(memberKeyPrefix+name) != "abc" || memberStore.GetVersion(stagedKeyPrefix+name) != "" {
		t.Errorf("install recorded %q, want the staged md5", memberStore.GetVersion(memberKeyPrefix+name))
	}
}

// 3.3.2 group bundle: an MPQ that used to be its own line (client_versions "PATCH-T.MPQ": "9") is current
// when the group lists it at that version, so moving T/V/X into a group downloads nothing.
func TestGroupMemberLegacyVersion(t *testing.T) {
	dataDir, _ := ensureDirectories()
	memberStore = &VersionManager{versionFile: filepath.Join(t.TempDir(), "v.json"), versions: map[string]string{}}
	defer func() { memberStore = nil }()
	name := "PATCH-T.MPQ"
	os.WriteFile(filepath.Join(dataDir, name), make([]byte, 1<<20), 0644)
	defer os.Remove(filepath.Join(dataDir, name))
	memberStore.SetVersion(name, "9")
	pr := &PatchRegisterClient{}
	if !memberCurrent(pr, WxlFile{Name: name, Checksum: "aaa", SizeMB: 1.0, Version: 9}) {
		t.Fatal("legacy install at the listed version not current")
	}
	if memberStore.GetVersion(memberKeyPrefix+name) != "aaa" {
		t.Error("legacy member not recorded at the register md5")
	}
	if memberCurrent(pr, WxlFile{Name: name, Checksum: "bbb", SizeMB: 1.0, Version: 10}) {
		t.Error("newer build counted as current")
	}
	memberStore.ClearVersion(memberKeyPrefix + name)
	if memberCurrent(pr, WxlFile{Name: name, Checksum: "aaa", SizeMB: 2.0, Version: 9}) {
		t.Error("size mismatch counted as current")
	}
}
