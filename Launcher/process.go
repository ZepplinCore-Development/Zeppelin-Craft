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

func getPendingPatches(excludeDownloading string) []string {
	tempDir := getTempDownloadDir()
	entries, err := os.ReadDir(tempDir)
	if err != nil {
		return nil
	}

	var pending []string
	for _, entry := range entries {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
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

	entries, err := os.ReadDir(tempDir)
	if err != nil {
		return result
	}

	for _, entry := range entries {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
		lower := strings.ToLower(name)
		wxlSub, isWxl := wxlSubdir(name)
		if !strings.HasSuffix(lower, ".mpq") && !strings.HasSuffix(lower, ".exe") && !isWxl {
			continue
		}

		tempFile := filepath.Join(tempDir, name)

		var targetFile string
		if isWxl { // F-195: WarcraftXL binary → app dir (host under Utils/)
			dir := getAppDirectory()
			if wxlSub != "" {
				dir = filepath.Join(dir, wxlSub)
				os.MkdirAll(dir, 0755)
			}
			targetFile = filepath.Join(dir, name)
		} else if strings.HasSuffix(lower, ".mpq") {
			targetFile = filepath.Join(dataDir, name)
		} else {
			targetFile = filepath.Join(getAppDirectory(), name)
		}

		if !validatePendingPatchFile(tempFile) {
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

func validatePendingPatchFile(tempFile string) bool {
	filename := filepath.Base(tempFile)

	var expectedSize int64
	if strings.HasSuffix(strings.ToLower(filename), ".exe") {
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
