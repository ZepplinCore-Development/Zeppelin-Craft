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
	Part       int // 3.3.0 split bundle: the piece being fetched (1-based) of Parts; 0 = a single file
	Parts      int
}

// bundleProgress turns one member's byte counts into the whole bundle's: Downloaded/Total cover every
// piece still to fetch, so the bar runs 0-100% once instead of restarting per ~1 GB piece.
type bundleProgress struct {
	offset, total int64
	part, parts   int
}

type DownloadResult struct {
	Filename   string
	Success    bool
	Message    string
	FinalState string // "updated", "pending", or "missing"
}

// wxlBinaries are the WarcraftXL client-framework files (F-195), served from WXL/ and installed next
// to Wow.exe. d3d9.dll is the proxy load vector (the client loads it ahead of system32 and it
// bootstraps WarcraftXL.dll, the framework); the host runs from Utils/. The value is the app-dir
// subfolder ("" = alongside Wow.exe). These are DLL/EXE loaded while the game runs, so — like Wow.exe —
// they stage to temp when WoW is open and install on the next check.
var wxlBinaries = map[string]string{
	"WarcraftXL.dll":     "",
	"d3d9.dll":           "",
	"WarcraftXLHost.exe": "Utils", // pre-1.1 asset host; v1.1 no longer ships it
	"wxl-assets":         "",      // pre-1.1 asset-pipeline marker; v1.1 no longer ships it
}

// wxlExtensionsDir is where WarcraftXL v1.1 discovers extensions: a bundle member named
// "Extensions/<Name>/<Name>.dll" is served from WXL/ at that path and installed at that same path next
// to Wow.exe. The subfolders are part of the member name, so these carry no extra subdir.
const wxlExtensionsDir = "Extensions"

func isWxlExtension(filename string) bool {
	return strings.HasPrefix(filepath.ToSlash(filename), wxlExtensionsDir+"/")
}

func wxlSubdir(filename string) (string, bool) {
	if isWxlExtension(filename) {
		return "", true
	}
	sub, ok := wxlBinaries[filename]
	return sub, ok
}

// isStagedPath reports whether localPath lies inside the temp staging dir (an extension stages at a
// nested path, so comparing the parent dir alone is not enough).
func isStagedPath(localPath string) bool {
	rel, err := filepath.Rel(getTempDownloadDir(), localPath)
	return err == nil && rel != "." && !strings.HasPrefix(rel, "..")
}

// wxlFilePath is the installed path of a bundle member: a WarcraftXL binary next to Wow.exe (host under
// Utils/) or a source-client binary next to the launcher (F-224).
func wxlFilePath(filename string) string {
	dir := getAppDirectory()
	if sub, ok := appBinarySubdir(filename); ok && sub != "" {
		dir = filepath.Join(dir, sub)
	}
	return filepath.Join(dir, filename)
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
	// A bundle entry (e.g. "WarcraftXL") is one launcher line backed by several real files; download each
	// under the bundle's display name so progress + version tracking stay on the single bundle row.
	if files, ok := pr.BundleFiles(filename); ok {
		anyPending, fetched := false, 0
		var todo []WxlFile
		var total int64
		for _, f := range files {
			if memberCurrent(pr, f) { // 3.3.0: only the members whose md5 changed are downloaded
				continue
			}
			if memberStaged(f) { // 3.3.2: already downloaded while the game ran, installs when it closes
				anyPending = true
				continue
			}
			todo = append(todo, f)
			total += int64(f.SizeMB * (1 << 20))
		}
		var offset int64
		for i, f := range todo {
			bp := &bundleProgress{offset: offset, total: total, part: i + 1, parts: len(todo)}
			r := downloadOne(f.Name, filename, f.Checksum, pr, progressCh, cancelCh, bp)
			offset += int64(f.SizeMB * (1 << 20))
			if !r.Success {
				return DownloadResult{filename, false, fmt.Sprintf("%s: %s", f.Name, r.Message), "missing"}
			}
			fetched++
			if r.FinalState == "pending" {
				anyPending = true
				recordStaged(f.Name, f.Checksum)
			} else {
				recordMember(f.Name, f.Checksum)
			}
		}
		logInfo(fmt.Sprintf("%s: %d of %d members downloaded, the rest already current", filename, fetched, len(files)))
		state := "updated"
		if anyPending {
			state = "pending"
		}
		return DownloadResult{filename, true, fmt.Sprintf("Downloaded %s", filename), state}
	}
	checksum := ""
	if info, ok := pr.GetPatchInfo(filename); ok {
		checksum = info.Checksum
	}
	return downloadOne(filename, filename, checksum, pr, progressCh, cancelCh, nil)
}

// partPath is where an archive downloads before it is complete (3.3.2). The name carries the md5 the
// register lists, so a part left by a crash or a dropped connection resumes only into the same build;
// parts of other builds of the same file are deleted. "" = no resume (no md5, or not an archive).
func partPath(localPath, filename, checksum string) string {
	if !isMPQ(filename) || len(checksum) < 8 {
		return ""
	}
	dir := filepath.Dir(localPath)
	want := filepath.Join(dir, fmt.Sprintf("%s.%s.part", filepath.Base(localPath), strings.ToLower(checksum[:8])))
	if old, _ := filepath.Glob(filepath.Join(dir, filepath.Base(localPath)+".*.part")); len(old) > 0 {
		for _, o := range old {
			if o != want {
				os.Remove(o)
			}
		}
	}
	return want
}

// downloadOne fetches a single file, reporting progress + the result under displayName (which is the
// bundle name for bundle members, the filename otherwise).
func downloadOne(
	filename string,
	displayName string,
	checksum string, // the register md5; names the resumable .part file
	pr *PatchRegisterClient,
	progressCh chan<- DownloadProgress,
	cancelCh <-chan struct{},
	bp *bundleProgress, // nil for a single file
) DownloadResult {
	fileURL := downloadBaseURL(filename) + filepath.ToSlash(filename)

	localPath := resolveDownloadPath(filename)

	logInfo(fmt.Sprintf("Downloading %s from %s", filename, fileURL))

	// An archive downloads into a .part file and resumes from it after a crash or a dropped connection
	// (3.3.2): a ~1 GB piece over a slow link used to start again from byte 0.
	writePath := localPath
	part := partPath(localPath, filename, checksum)
	var have int64
	if part != "" {
		writePath = part
		if info, err := os.Stat(part); err == nil {
			have = info.Size()
		}
	}

	req, err := http.NewRequest("GET", fileURL, nil)
	if err != nil {
		return DownloadResult{filename, false, fmt.Sprintf("Download failed: %v", err), "missing"}
	}
	if have > 0 {
		req.Header.Set("Range", fmt.Sprintf("bytes=%d-", have))
	}
	client := &http.Client{Timeout: 0} // no timeout for large downloads
	resp, err := client.Do(req)
	if err != nil {
		logError(fmt.Sprintf("Download failed for %s: %v", filename, err))
		return DownloadResult{filename, false, fmt.Sprintf("Download failed: %v", err), "missing"}
	}
	defer resp.Body.Close()

	flags := os.O_CREATE | os.O_WRONLY | os.O_TRUNC
	switch {
	case have > 0 && resp.StatusCode == http.StatusPartialContent:
		flags = os.O_CREATE | os.O_WRONLY | os.O_APPEND
		logInfo(fmt.Sprintf("Resuming %s at %.1f MB", filename, float64(have)/(1<<20)))
	case have > 0 && resp.StatusCode == http.StatusRequestedRangeNotSatisfiable:
		resp.Body.Close() // the part is complete or longer than the file: start over
		os.Remove(part)
		return downloadOne(filename, displayName, checksum, pr, progressCh, cancelCh, bp)
	case resp.StatusCode != http.StatusOK:
		logError(fmt.Sprintf("Download failed for %s: HTTP %s", filename, resp.Status))
		return DownloadResult{filename, false, fmt.Sprintf("Download failed: HTTP %s", resp.Status), "missing"}
	default:
		have = 0 // the server ignored the range: whole file
	}

	total := resp.ContentLength
	if total > 0 {
		total += have
	}

	// Create parent directory
	os.MkdirAll(filepath.Dir(localPath), 0755)

	out, err := os.OpenFile(writePath, flags, 0644)
	if err != nil {
		logError(fmt.Sprintf("Failed to create file %s: %v", writePath, err))
		return DownloadResult{filename, false, fmt.Sprintf("File creation failed: %v", err), "missing"}
	}

	buf := make([]byte, DownloadChunkSize)
	downloaded := have

	for {
		// Check for cancellation
		select {
		case <-cancelCh:
			out.Close()
			os.Remove(writePath)
			logInfo(fmt.Sprintf("Download cancelled: %s", filename))
			return DownloadResult{filename, false, "Cancelled", "missing"}
		default:
		}

		n, readErr := resp.Body.Read(buf)
		if n > 0 {
			if _, werr := out.Write(buf[:n]); werr != nil {
				out.Close()
				logError(fmt.Sprintf("Write error for %s: %v", filename, werr))
				return DownloadResult{filename, false, fmt.Sprintf("Write error: %v", werr), "missing"}
			}
			downloaded += int64(n)
			if bp != nil && bp.total > 0 {
				done := bp.offset + downloaded
				if done > bp.total {
					done = bp.total // size_mb is rounded to 0.1 MB
				}
				progressCh <- DownloadProgress{displayName, done, bp.total, bp.part, bp.parts}
			} else {
				progressCh <- DownloadProgress{displayName, downloaded, total, 0, 0}
			}
		}
		if readErr != nil {
			if readErr == io.EOF {
				break
			}
			out.Close()
			if part == "" { // an archive's .part stays and resumes on the next attempt
				os.Remove(writePath)
			}
			logError(fmt.Sprintf("Download read error for %s: %v", filename, readErr))
			return DownloadResult{filename, false, fmt.Sprintf("Read error: %v", readErr), "missing"}
		}
	}
	out.Close()

	// Validate size
	if total > 0 {
		info, err := os.Stat(writePath)
		if err != nil || info.Size() != total {
			os.Remove(writePath)
			actual := int64(0)
			if info != nil {
				actual = info.Size()
			}
			logError(fmt.Sprintf("Size mismatch for %s: expected %d, got %d", filename, total, actual))
			return DownloadResult{filename, false, "Size validation failed", "missing"}
		}
	}
	if part != "" {
		os.Remove(localPath)
		if err := os.Rename(part, localPath); err != nil {
			logError(fmt.Sprintf("Failed to move %s into place: %v", part, err))
			return DownloadResult{filename, false, fmt.Sprintf("Install failed: %v", err), "missing"}
		}
	}

	if !checksumMatches(pr, filename, localPath) { // client binaries: size alone cannot tell builds apart
		os.Remove(localPath)
		return DownloadResult{filename, false, "Checksum validation failed", "missing"}
	}

	finalState := installOrStage(filename, localPath)
	return DownloadResult{filename, true, fmt.Sprintf("Downloaded %s", filename), finalState}
}

func resolveDownloadPath(filename string) string {
	lower := strings.ToLower(filename)
	if strings.HasSuffix(lower, ".mpq") {
		return filepath.Join(getTempDownloadDir(), filename)
	}
	if sub, ok := appBinarySubdir(filename); ok { // WarcraftXL or source-client (F-224) binary
		if isWowRunning() { // in use while the game runs; stage and install on the next check
			logInfo("WoW running - staging " + filename + " to temp")
			return filepath.Join(getTempDownloadDir(), filename)
		}
		dir := getAppDirectory()
		if sub != "" {
			dir = filepath.Join(dir, sub)
		}
		return filepath.Join(dir, filename)
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

	if _, ok := appBinarySubdir(filename); ok {
		if isStagedPath(localPath) {
			return "pending" // WoW running; installed on the next check
		}
		return "updated"
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
