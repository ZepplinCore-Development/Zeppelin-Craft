package main

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	ps "github.com/mitchellh/go-ps"
)

func isWowRunning() bool {
	processes, err := ps.Processes()
	if err != nil {
		logWarning(fmt.Sprintf("Failed to list processes: %v", err))
		return false
	}
	for _, p := range processes {
		if strings.EqualFold(p.Executable(), "Wow.exe") {
			return true
		}
	}
	return false
}

// stagedNames lists the files staged in the temp dir by member name: top-level files as-is, plus every
// file under Extensions/ by its slash-separated relative path (the name it was registered under).
func stagedNames(tempDir string) []string {
	entries, err := os.ReadDir(tempDir)
	if err != nil {
		return nil
	}
	var names []string
	for _, entry := range entries {
		if !entry.IsDir() {
			names = append(names, entry.Name())
		}
	}
	extRoot := filepath.Join(tempDir, wxlExtensionsDir)
	filepath.WalkDir(extRoot, func(path string, d os.DirEntry, err error) error {
		if err != nil || d.IsDir() {
			return nil
		}
		if rel, rerr := filepath.Rel(tempDir, path); rerr == nil {
			names = append(names, filepath.ToSlash(rel))
		}
		return nil
	})
	return names
}

func getPendingPatches(excludeDownloading string) []string {
	tempDir := getTempDownloadDir()

	var pending []string
	for _, name := range stagedNames(tempDir) {
		lower := strings.ToLower(name)
		_, isWxl := wxlSubdir(name)
		if strings.HasSuffix(lower, ".mpq") || strings.HasSuffix(lower, ".exe") || isWxl {
			if excludeDownloading != "" && name == excludeDownloading {
				continue
			}
			pending = append(pending, name)
		}
	}
	return pending
}

type InstallResult struct {
	InstalledCount   int
	FailedPatches    []string
	ValidationFailed []string
}

func installPendingPatches() InstallResult {
	tempDir := getTempDownloadDir()
	dataDir := filepath.Join(getAppDirectory(), DataDirectory)
	os.MkdirAll(dataDir, 0755)

	result := InstallResult{}

	for _, name := range stagedNames(tempDir) {
		lower := strings.ToLower(name)
		wxlSub, isWxl := wxlSubdir(name)
		if !strings.HasSuffix(lower, ".mpq") && !strings.HasSuffix(lower, ".exe") && !isWxl {
			continue
		}

		tempFile := filepath.Join(tempDir, name)

		var targetFile string
		if isWxl { // F-195: WarcraftXL binary → app dir (host under Utils/, extensions under Extensions/)
			dir := getAppDirectory()
			if wxlSub != "" {
				dir = filepath.Join(dir, wxlSub)
			}
			targetFile = filepath.Join(dir, name)
			os.MkdirAll(filepath.Dir(targetFile), 0755)
		} else if strings.HasSuffix(lower, ".mpq") {
			targetFile = filepath.Join(dataDir, name)
		} else {
			targetFile = filepath.Join(getAppDirectory(), name)
		}

		if !validatePendingPatchFile(name, tempFile) {
			logError(fmt.Sprintf("Pending patch validation failed: %s - removing", name))
			result.FailedPatches = append(result.FailedPatches, name)
			result.ValidationFailed = append(result.ValidationFailed, name)
			os.Remove(tempFile)
			continue
		}

		os.Remove(targetFile)
		if err := os.Rename(tempFile, targetFile); err != nil {
			result.FailedPatches = append(result.FailedPatches, name)
			logError(fmt.Sprintf("Failed to install pending patch %s: %v", name, err))
			continue
		}

		result.InstalledCount++
		logInfo(fmt.Sprintf("Installed pending patch: %s", name))
	}

	return result
}

func validatePendingPatchFile(filename, tempFile string) bool {
	var expectedSize int64
	if _, isWxl := wxlSubdir(filename); isWxl {
		expectedSize = getServerFileSize(WXLDownloadURL + filepath.ToSlash(filename))
	} else if strings.HasSuffix(strings.ToLower(filename), ".exe") {
		expectedSize = getServerFileSize(EXEDownloadURL + filename)
	} else {
		expectedSize = getServerFileSize(MPQDownloadURL + filename)
	}

	if expectedSize < 0 {
		logWarning(fmt.Sprintf("Could not get server file size for %s - skipping validation", filename))
		return true
	}

	info, err := os.Stat(tempFile)
	if err != nil {
		logError(fmt.Sprintf("Error stating pending patch %s: %v", filename, err))
		return false
	}

	if info.Size() == expectedSize {
		logInfo(fmt.Sprintf("Pending patch validation: PASSED for %s", filename))
		return true
	}
	logError(fmt.Sprintf("Pending patch validation: FAILED for %s (expected %d, got %d)", filename, expectedSize, info.Size()))
	return false
}

func getServerFileSize(url string) int64 {
	client := &http.Client{Timeout: time.Duration(Timeout) * time.Second}
	req, err := http.NewRequest("HEAD", url, nil)
	if err != nil {
		return -1
	}
	resp, err := client.Do(req)
	if err != nil {
		return -1
	}
	defer resp.Body.Close()
	return resp.ContentLength
}
