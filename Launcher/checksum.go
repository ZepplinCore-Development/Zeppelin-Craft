package main

// Client binaries are checked by md5 against the register, not by size (F-224). Every WowClient64.exe
// build is the same size, so a size check passed a stale exe: a copy staged while the game ran, installed
// after a newer build shipped, was installed and recorded as the newest version. MPQs keep the size check
// (their size changes from build to build, and hashing PATCH-Q's 8 GB on every check is not affordable).

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"io"
	"os"
	"strings"
)

// fileMD5 hashes the whole file on every call: only client binaries (tens of MB) are checked, and a
// cache keyed by size and mtime would miss a same-size rewrite inside one mtime tick.
func fileMD5(path string) (string, error) {
	f, err := os.Open(path)
	if err != nil {
		return "", err
	}
	defer f.Close()
	h := md5.New()
	if _, err := io.Copy(h, f); err != nil {
		return "", err
	}
	return hex.EncodeToString(h.Sum(nil)), nil
}

// MemberChecksum is the register md5 of a client binary (a member of a bundle such as WowClient64 or
// WarcraftXL), or "" when the register does not list it.
func (c *PatchRegisterClient) MemberChecksum(name string) string {
	if _, ok := appBinarySubdir(name); !ok {
		return ""
	}
	for _, entry := range c.Register.Patches {
		for _, f := range entry.Files {
			if f.Name == name {
				return strings.ToLower(f.Checksum)
			}
		}
	}
	return ""
}

// checksumMatches reports whether path holds the build the register lists for member name. A member
// the register has no checksum for always matches.
func checksumMatches(pr *PatchRegisterClient, name, path string) bool {
	want := pr.MemberChecksum(name)
	if want == "" {
		return true
	}
	got, err := fileMD5(path)
	if err != nil {
		return false
	}
	if got != want {
		logWarning(fmt.Sprintf("Checksum mismatch for %s: expected %s, got %s", name, want, got))
		return false
	}
	return true
}

// staleBundleMembers lists the installed members of a bundle whose md5 is not the registered one.
func staleBundleMembers(pr *PatchRegisterClient, bundle string) []string {
	files, ok := pr.BundleFiles(bundle)
	if !ok {
		return nil
	}
	var stale []string
	for _, f := range files {
		if p := wxlFilePath(f.Name); fileExists(p) && !checksumMatches(pr, f.Name, p) {
			stale = append(stale, f.Name)
		}
	}
	return stale
}
