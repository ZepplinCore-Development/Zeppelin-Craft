package main

// Split MPQ bundles (3.3.0, F-216 curated HD): the register lists PATCH-Q as ONE bundle entry whose members
// are ~1 GB archives (PATCH-Q-01.MPQ ...). The launcher shows one line for it, installs the pieces into
// Data/, and on an update downloads only the pieces whose md5 changed: each installed member's register md5
// is recorded (member:<name> in client_versions.json), so 15 GB is never re-hashed on a check.
// Pieces that leave the bundle, and the single PATCH-Q.MPQ it replaces, are deleted while the game is
// closed: PATCH-Q.MPQ sorts after PATCH-Q-*.MPQ, so a leftover would override every piece.

import (
	"fmt"
	"math"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// memberStore keeps the md5 each installed bundle member was downloaded at (set by NewLauncherEngine).
var memberStore *VersionManager

const memberKeyPrefix = "member:"

func isMPQ(name string) bool { return strings.HasSuffix(strings.ToLower(name), ".mpq") }

// memberPath is the installed path of a bundle member: an archive piece in Data/, a client binary or
// WarcraftXL file in the app directory.
func memberPath(name string) string {
	if isMPQ(name) {
		return filepath.Join(getAppDirectory(), DataDirectory, name)
	}
	return wxlFilePath(name)
}

// memberEntry is a member's register record (any bundle).
func (c *PatchRegisterClient) memberEntry(name string) (WxlFile, bool) {
	for _, entry := range c.Register.Patches {
		for _, f := range entry.Files {
			if f.Name == name {
				return f, true
			}
		}
	}
	return WxlFile{}, false
}

func recordMember(name, checksum string) {
	if memberStore != nil && checksum != "" {
		memberStore.SetVersion(memberKeyPrefix+name, strings.ToLower(checksum))
	}
}

// recordInstalledMember records a just-installed bundle member at its register md5.
func recordInstalledMember(pr *PatchRegisterClient, name string) {
	if f, ok := pr.memberEntry(name); ok {
		recordMember(name, f.Checksum)
	}
}

// memberCurrent reports whether member f is installed at the build the register lists: it exists, it was
// recorded at the register md5, and an archive's size matches (size_mb is rounded to 0.1 MB); a client
// binary is md5-checked as before (MemberChecksum covers only those).
func memberCurrent(pr *PatchRegisterClient, f WxlFile) bool {
	path := memberPath(f.Name)
	info, err := os.Stat(path)
	if err != nil || memberStore == nil {
		return false
	}
	if memberStore.GetVersion(memberKeyPrefix+f.Name) != strings.ToLower(f.Checksum) || f.Checksum == "" {
		return false
	}
	if isMPQ(f.Name) && f.SizeMB > 0 && math.Abs(float64(info.Size())/(1<<20)-f.SizeMB) > 0.06 {
		return false
	}
	return checksumMatches(pr, f.Name, path)
}

var pieceName = regexp.MustCompile(`(?i)^(patch-[a-z0-9]+)-[^.]+\.mpq$`)

// orphanPieces lists the files in dataDir that a split bundle makes obsolete: for each bundle whose
// members are PATCH-<L>-<piece>.MPQ, the single PATCH-<L>.MPQ and any PATCH-<L>-*.MPQ not in the bundle.
func orphanPieces(pr *PatchRegisterClient, dataDir string) []string {
	entries, err := os.ReadDir(dataDir)
	if err != nil {
		return nil
	}
	var out []string
	for _, entry := range pr.Register.Patches {
		prefix, members := "", map[string]bool{}
		for _, f := range entry.Files {
			if m := pieceName.FindStringSubmatch(f.Name); m != nil {
				prefix = strings.ToLower(m[1])
				members[strings.ToLower(f.Name)] = true
			}
		}
		if prefix == "" {
			continue
		}
		for _, d := range entries {
			n := strings.ToLower(d.Name())
			if d.IsDir() || members[n] {
				continue
			}
			if n == prefix+".mpq" || (strings.HasPrefix(n, prefix+"-") && strings.HasSuffix(n, ".mpq")) {
				out = append(out, d.Name())
			}
		}
	}
	return out
}

// removeOrphanPieces deletes the obsolete archives (orphanPieces) from Data/. Call only while the game is
// closed: the client holds its MPQs open.
func removeOrphanPieces(pr *PatchRegisterClient) []string {
	dataDir := filepath.Join(getAppDirectory(), DataDirectory)
	var removed []string
	for _, n := range orphanPieces(pr, dataDir) {
		if err := os.Remove(filepath.Join(dataDir, n)); err != nil {
			logWarning(fmt.Sprintf("Could not remove obsolete %s: %v", n, err))
			continue
		}
		if memberStore != nil {
			memberStore.ClearVersion(memberKeyPrefix + n)
			memberStore.ClearVersion(n)
		}
		removed = append(removed, n)
		logInfo("Removed obsolete " + n + " (replaced by a split bundle)")
	}
	return removed
}
