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

// stagedKeyPrefix records the md5 of a member downloaded while the game ran and staged in temp_patches/
// (3.3.2). Kept apart from member:<name>, which describes the copy in Data/ until the staged one installs.
const stagedKeyPrefix = "staged:"

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

func recordStaged(name, checksum string) {
	if memberStore != nil && checksum != "" {
		memberStore.SetVersion(stagedKeyPrefix+name, strings.ToLower(checksum))
	}
}

// recordInstalledMember records a just-installed bundle member. A member staged by 3.3.2+ carries the md5
// it was downloaded at (staged:<name>); one staged by an older launcher falls back to the register md5.
func recordInstalledMember(pr *PatchRegisterClient, name string) {
	if memberStore != nil {
		if sum := memberStore.GetVersion(stagedKeyPrefix + name); sum != "" {
			memberStore.ClearVersion(stagedKeyPrefix + name)
			recordMember(name, sum)
			return
		}
	}
	if f, ok := pr.memberEntry(name); ok {
		recordMember(name, f.Checksum)
	}
}

// sizeMatches compares an archive's size with the register's size_mb (rounded to 0.1 MB).
func sizeMatches(f WxlFile, size int64) bool {
	return !isMPQ(f.Name) || f.SizeMB <= 0 || math.Abs(float64(size)/(1<<20)-f.SizeMB) <= 0.06
}

// memberStaged reports whether member f already sits in temp_patches/ at the register md5 (downloaded
// while the game ran, installed when it closes). Without this a launcher restart before the install
// downloaded every staged piece again (3.3.2).
func memberStaged(f WxlFile) bool {
	if memberStore == nil || f.Checksum == "" {
		return false
	}
	info, err := os.Stat(filepath.Join(getTempDownloadDir(), f.Name))
	if err != nil || memberStore.GetVersion(stagedKeyPrefix+f.Name) != strings.ToLower(f.Checksum) {
		return false
	}
	return sizeMatches(f, info.Size())
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
	if f.Checksum == "" || !sizeMatches(f, info.Size()) {
		return false
	}
	if memberStore.GetVersion(memberKeyPrefix+f.Name) != strings.ToLower(f.Checksum) {
		if !legacyMemberCurrent(f) {
			return false
		}
		recordMember(f.Name, f.Checksum)
	}
	return checksumMatches(pr, f.Name, path)
}

// legacyMemberCurrent: a group bundle (3.3.2) lists MPQs that used to be their own register lines, so an
// install holds them under their old key (client_versions "PATCH-T.MPQ": "9") and no member: record. The
// group carries each member's version; when the recorded one equals it, the file in Data/ is that build
// and is not downloaded again.
func legacyMemberCurrent(f WxlFile) bool {
	if f.Version <= 0 || memberStore.GetVersion(memberKeyPrefix+f.Name) != "" {
		return false
	}
	return memberStore.GetVersion(f.Name) == fmt.Sprintf("%d", f.Version)
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
