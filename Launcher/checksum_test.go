package main

import (
	"crypto/md5"
	"encoding/hex"
	"os"
	"path/filepath"
	"testing"
)

func md5Hex(b []byte) string {
	s := md5.Sum(b)
	return hex.EncodeToString(s[:])
}

// The stale-exe case: two client builds of identical size. The register lists the new one; the old one
// is staged (downloaded while the game ran) and installed. Size validation passed it, md5 must not.
func TestStaleSameSizeClientRejected(t *testing.T) {
	oldExe, newExe := []byte("build-B-AAAA"), []byte("build-C-BBBB")
	pr := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{
		SourceClientBundle: {Version: 12, Files: []WxlFile{{Name: SourceClientExe, Checksum: md5Hex(newExe)}}},
	}}}

	staged := filepath.Join(getTempDownloadDir(), SourceClientExe)
	os.WriteFile(staged, oldExe, 0644)
	defer os.Remove(staged)
	if validatePendingPatchFile(pr, SourceClientExe, staged) {
		t.Error("stale same-size staged exe passed validation")
	}
	discardStaleStaged(pr)
	if fileExists(staged) {
		t.Error("stale staged exe was not discarded")
	}
	os.WriteFile(staged, newExe, 0644)
	if !validatePendingPatchFile(pr, SourceClientExe, staged) {
		t.Error("current staged exe failed validation")
	}
	discardStaleStaged(pr)
	if !fileExists(staged) {
		t.Error("current staged exe was discarded")
	}

	installed := wxlFilePath(SourceClientExe)
	os.WriteFile(installed, oldExe, 0644)
	defer os.Remove(installed)
	if stale := staleBundleMembers(pr, SourceClientBundle); len(stale) != 1 {
		t.Errorf("installed stale exe not detected: %v", stale)
	}
	os.WriteFile(installed, newExe, 0644)
	if stale := staleBundleMembers(pr, SourceClientBundle); len(stale) != 0 {
		t.Errorf("installed current exe flagged: %v", stale)
	}
}

func TestMemberChecksumOnlyForClientBinaries(t *testing.T) {
	pr := &PatchRegisterClient{Register: PatchRegister{Patches: map[string]PatchEntry{
		"PATCH-L.MPQ": {Version: 64, Checksum: "abc"},
	}}}
	if pr.MemberChecksum("PATCH-L.MPQ") != "" {
		t.Error("MPQs keep size validation")
	}
	if pr.MemberChecksum(SourceClientExe) != "" {
		t.Error("an unlisted member has no checksum")
	}
}
