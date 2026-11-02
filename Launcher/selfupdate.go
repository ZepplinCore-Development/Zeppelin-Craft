package main

// F-224: launcher self-update.
//
// The register may carry a top-level "launcher" block naming the current launcher version and one binary
// per OS, served from LAUNCHER/. When it is newer than this build, the launcher downloads its own
// replacement next to itself, verifies the md5, swaps it in (Windows: the running exe is renamed to .old,
// which Windows allows; Linux: renamed over the running binary) and restarts. Launchers older than 3.1.0
// ignore the block, so they are replaced once by hand.

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strconv"
	"strings"
	"time"
)

type LauncherAsset struct {
	File     string  `json:"file"`
	Checksum string  `json:"checksum"`
	SizeMB   float64 `json:"size_mb"`
}

type LauncherRelease struct {
	Version string         `json:"version"`
	Windows *LauncherAsset `json:"windows,omitempty"`
	Linux   *LauncherAsset `json:"linux,omitempty"`
}

// asset is the binary for this OS, or nil.
func (r *LauncherRelease) asset() *LauncherAsset {
	if r == nil {
		return nil
	}
	if runtime.GOOS == "windows" {
		return r.Windows
	}
	return r.Linux
}

// versionNewer reports whether dotted version a is newer than b ("3.10.0" > "3.9.2").
func versionNewer(a, b string) bool {
	pa, pb := strings.Split(a, "."), strings.Split(b, ".")
	for i := 0; i < len(pa) || i < len(pb); i++ {
		var x, y int
		if i < len(pa) {
			x, _ = strconv.Atoi(pa[i])
		}
		if i < len(pb) {
			y, _ = strconv.Atoi(pb[i])
		}
		if x != y {
			return x > y
		}
	}
	return false
}

func selfPath() (string, error) {
	exe, err := os.Executable()
	if err != nil {
		return "", err
	}
	if real, err := filepath.EvalSymlinks(exe); err == nil {
		return real, nil
	}
	return exe, nil
}

// cleanupSelfUpdate removes the previous binary a Windows self-update left behind.
func cleanupSelfUpdate() {
	if self, err := selfPath(); err == nil {
		os.Remove(self + ".old")
		os.Remove(self + ".new")
	}
}

// updateAttemptFile records the version last attempted, so a release whose binary still reports an older
// version cannot make the launcher update and restart in a loop.
func updateAttemptFile() string {
	return filepath.Join(getAppDirectory(), "logs", "launcher_update_attempt")
}

// selfUpdate replaces and restarts the launcher when the register names a newer release. It returns
// without doing anything when there is none, and logs and returns when any step fails, so the current
// launcher keeps working. On success it does not return.
func selfUpdate(rel *LauncherRelease, status func(string)) {
	a := rel.asset()
	if a == nil || a.File == "" || !versionNewer(rel.Version, AppVersion) {
		return
	}
	if prev, err := os.ReadFile(updateAttemptFile()); err == nil && strings.TrimSpace(string(prev)) == rel.Version {
		logWarning(fmt.Sprintf("Launcher update to v%s was already attempted and this is still v%s - skipping", rel.Version, AppVersion))
		return
	}
	self, err := selfPath()
	if err != nil {
		logError(fmt.Sprintf("Launcher update: cannot locate own binary: %v", err))
		return
	}

	status(fmt.Sprintf("Updating launcher to v%s...", rel.Version))
	logInfo(fmt.Sprintf("Launcher update: v%s -> v%s from %s", AppVersion, rel.Version, LauncherURL+a.File))
	// The attempt is recorded only once the new binary is installed (3.3.2). Recording it up front made a
	// single failed download (slow link, dropped connection) skip that release for good, leaving the
	// player on the old launcher.

	newPath := self + ".new"
	fail := func(msg string, err error) {
		os.Remove(newPath)
		logError(fmt.Sprintf("Launcher update: %s: %v", msg, err))
		status("Launcher update failed - see the log")
	}

	client := &http.Client{Timeout: 60 * time.Minute} // ~35 MB; a slow remote link needs far more than 10 min
	resp, err := client.Get(LauncherURL + a.File)
	if err != nil {
		fail("download", err)
		return
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		fail("download", fmt.Errorf("HTTP %s", resp.Status))
		return
	}
	out, err := os.OpenFile(newPath, os.O_CREATE|os.O_TRUNC|os.O_WRONLY, 0755)
	if err != nil {
		fail("create "+newPath, err)
		return
	}
	_, err = io.Copy(out, resp.Body)
	out.Close()
	if err != nil {
		fail("download", err)
		return
	}
	if sum, err := fileMD5(newPath); err != nil || !strings.EqualFold(sum, a.Checksum) {
		fail("checksum", fmt.Errorf("got %s, register says %s", sum, a.Checksum))
		return
	}

	if runtime.GOOS == "windows" {
		// A running exe cannot be replaced but can be renamed; the .old copy is removed on the next start.
		os.Remove(self + ".old")
		if err := os.Rename(self, self+".old"); err != nil {
			fail("rename running launcher", err)
			return
		}
		if err := os.Rename(newPath, self); err != nil {
			os.Rename(self+".old", self)
			fail("install new launcher", err)
			return
		}
	} else if err := os.Rename(newPath, self); err != nil {
		fail("install new launcher", err)
		return
	}

	os.MkdirAll(filepath.Dir(updateAttemptFile()), 0755)
	os.WriteFile(updateAttemptFile(), []byte(rel.Version), 0644) // loop guard: see updateAttemptFile

	cmd := exec.Command(self, os.Args[1:]...)
	cmd.Dir = filepath.Dir(self)
	if err := cmd.Start(); err != nil {
		logError(fmt.Sprintf("Launcher update: installed v%s but could not restart it: %v", rel.Version, err))
		status(fmt.Sprintf("Launcher updated to v%s - please restart it", rel.Version))
		return
	}
	logInfo(fmt.Sprintf("Launcher update: v%s installed, restarting", rel.Version))
	os.Exit(0)
}
