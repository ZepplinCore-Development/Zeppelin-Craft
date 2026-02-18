package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
)

type DownloadProgress struct {
	Filename   string
	Downloaded int64
	Total      int64
}

type DownloadResult struct {
	Filename   string
	Success    bool
	Message    string
	FinalState string // "updated", "pending", or "missing"
}

func StartDownload(
	filename string,
	patchRegister *PatchRegisterClient,
	progressCh chan<- DownloadProgress,
	resultCh chan<- DownloadResult,
	cancelCh <-chan struct{},
) {
	go func() {
		result := performDownload(filename, patchRegister, progressCh, cancelCh)
		resultCh <- result
	}()
}

func performDownload(
	filename string,
	pr *PatchRegisterClient,
	progressCh chan<- DownloadProgress,
	cancelCh <-chan struct{},
) DownloadResult {
	// Determine URL from is_mandatory flag
	isMandatory := true
	if pr != nil {
		isMandatory = pr.IsMandatory(filename)
	}
	var baseURL string
	if isMandatory {
		baseURL = MandatoryDownloadURL
	} else {
		baseURL = OptionalDownloadURL
	}
	fileURL := baseURL + filename

	localPath := resolveDownloadPath(filename)

	logInfo(fmt.Sprintf("Downloading %s from %s", filename, fileURL))

	// Make the request (no timeout for large downloads)
	client := &http.Client{Timeout: 0}
	resp, err := client.Get(fileURL)
	if err != nil {
		logError(fmt.Sprintf("Download failed for %s: %v", filename, err))
		return DownloadResult{filename, false, fmt.Sprintf("Download failed: %v", err), "missing"}
	}
	defer resp.Body.Close()

	total := resp.ContentLength

	// Create parent directory
	os.MkdirAll(filepath.Dir(localPath), 0755)

	out, err := os.Create(localPath)
	if err != nil {
		logError(fmt.Sprintf("Failed to create file %s: %v", localPath, err))
		return DownloadResult{filename, false, fmt.Sprintf("File creation failed: %v", err), "missing"}
	}

	buf := make([]byte, DownloadChunkSize)
	var downloaded int64

	for {
		// Check for cancellation
		select {
		case <-cancelCh:
			out.Close()
			os.Remove(localPath)
			logInfo(fmt.Sprintf("Download cancelled: %s", filename))
			return DownloadResult{filename, false, "Cancelled", "missing"}
		default:
		}

		n, readErr := resp.Body.Read(buf)
		if n > 0 {
			out.Write(buf[:n])
			downloaded += int64(n)
			progressCh <- DownloadProgress{filename, downloaded, total}
		}
		if readErr != nil {
			if readErr == io.EOF {
				break
			}
			out.Close()
			os.Remove(localPath)
			logError(fmt.Sprintf("Download read error for %s: %v", filename, readErr))
			return DownloadResult{filename, false, fmt.Sprintf("Read error: %v", readErr), "missing"}
		}
	}
	out.Close()

	// Validate size
	if total > 0 {
		info, err := os.Stat(localPath)
		if err != nil || info.Size() != total {
			os.Remove(localPath)
			actual := int64(0)
			if info != nil {
				actual = info.Size()
			}
			logError(fmt.Sprintf("Size mismatch for %s: expected %d, got %d", filename, total, actual))
			return DownloadResult{filename, false, "Size validation failed", "missing"}
		}
	}

	finalState := installOrStage(filename, localPath)
	return DownloadResult{filename, true, fmt.Sprintf("Downloaded %s", filename), finalState}
}

func resolveDownloadPath(filename string) string {
	lower := strings.ToLower(filename)
	if strings.HasSuffix(lower, ".mpq") {
		return filepath.Join(getTempDownloadDir(), filename)
	}
	if lower == "wow.exe" && isWowRunning() {
		logInfo("WoW running - downloading " + filename + " to temp")
		return filepath.Join(getTempDownloadDir(), filename)
	}
	return filepath.Join(getAppDirectory(), filename)
}

func installOrStage(filename, localPath string) string {
	lower := strings.ToLower(filename)

	if strings.HasSuffix(lower, ".mpq") {
		if !isWowRunning() {
			dataDir := filepath.Join(getAppDirectory(), DataDirectory)
			os.MkdirAll(dataDir, 0755)
			finalPath := filepath.Join(dataDir, filename)
			os.Remove(finalPath)
			if err := os.Rename(localPath, finalPath); err != nil {
				logWarning(fmt.Sprintf("Failed to install %s: %v", filename, err))
				return "pending"
			}
			logInfo(fmt.Sprintf("Installed %s to Data/", filename))
			return "updated"
		}
		logInfo(fmt.Sprintf("WoW running - %s staged for later install", filename))
		return "pending"
	}

	if lower == "wow.exe" {
		tempDir := getTempDownloadDir()
		if filepath.Dir(localPath) == tempDir {
			return "pending"
		}
		return "updated"
	}

	return "updated"
}
