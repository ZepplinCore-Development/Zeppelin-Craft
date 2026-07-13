package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
)

// LauncherEngine handles connection testing, file checks, game launching.
type LauncherEngine struct {
	VersionManager *VersionManager
	PatchRegister  *PatchRegisterClient
	dataDir        string
}

func NewLauncherEngine() *LauncherEngine {
	dataDir, _ := ensureDirectories()
	return &LauncherEngine{
		VersionManager: NewVersionManager(dataDir),
		PatchRegister:  NewPatchRegisterClient(),
		dataDir:        dataDir,
	}
}

func (le *LauncherEngine) TestConnection() bool {
	return le.PatchRegister.Fetch()
}

func (le *LauncherEngine) CheckFileExists(filename string) bool {
	if files, ok := le.PatchRegister.BundleFiles(filename); ok { // F-195 bundle: exists only if all members do
		for _, f := range files {
			if !fileExists(wxlFilePath(f.Name)) {
				return false
			}
		}
		return true
	}
	lower := strings.ToLower(filename)
	var filePath string
	if _, ok := wxlSubdir(filename); ok { // F-195: app dir, host under Utils/
		filePath = wxlFilePath(filename)
	} else if strings.HasSuffix(lower, ".mpq") {
		filePath = filepath.Join(getAppDirectory(), DataDirectory, filename)
	} else {
		filePath = filepath.Join(getAppDirectory(), filename)
	}
	return fileExists(filePath)
}

func (le *LauncherEngine) FindWowInstallation() string {
	appDir := getAppDirectory()
	wowExe := filepath.Join(appDir, WowExecutable)
	if fileExists(wowExe) {
		return appDir
	}

	commonPaths := []string{
		`C:\Program Files\World of Warcraft`,
		`C:\Program Files (x86)\World of Warcraft`,
		`C:\Games\World of Warcraft`,
		`D:\Games\World of Warcraft`,
		`E:\Games\World of Warcraft`,
	}

	home, err := os.UserHomeDir()
	if err == nil {
		commonPaths = append(commonPaths, filepath.Join(home, "Desktop", "World of Warcraft"))
	}

	for _, p := range commonPaths {
		if fileExists(filepath.Join(p, WowExecutable)) {
			return p
		}
	}
	return ""
}

func (le *LauncherEngine) LaunchGame() bool {
	wowPath := le.FindWowInstallation()
	if wowPath == "" {
		wowExe := filepath.Join(getAppDirectory(), WowExecutable)
		if !fileExists(wowExe) {
			logError("WoW executable not found")
			return false
		}
		wowPath = getAppDirectory()
	}

	le.updateRealmlist(wowPath)

	wowExe := filepath.Join(wowPath, WowExecutable)
	if !fileExists(wowExe) {
		logError(fmt.Sprintf("WoW executable not found: %s", wowExe))
		return false
	}

	logInfo(fmt.Sprintf("Launching game: %s", wowExe))

	var cmd *exec.Cmd
	if runtime.GOOS == "windows" {
		cmd = exec.Command(wowExe)
	} else {
		// Linux: use wine
		cmd = exec.Command("wine", wowExe)
	}
	cmd.Dir = wowPath

	if err := cmd.Start(); err != nil {
		logError(fmt.Sprintf("Failed to launch game: %v", err))
		return false
	}

	return true
}

func (le *LauncherEngine) updateRealmlist(wowPath string) {
	realmlistDir := filepath.Join(wowPath, "Data", "enUS")
	os.MkdirAll(realmlistDir, 0755)
	realmlistPath := filepath.Join(realmlistDir, "realmlist.wtf")

	// Extract server address from BaseURL
	addr := strings.TrimPrefix(BaseURL, "http://")
	addr = strings.TrimPrefix(addr, "https://")
	if idx := strings.Index(addr, ":"); idx >= 0 {
		addr = addr[:idx]
	}
	addr = strings.TrimRight(addr, "/")

	content := fmt.Sprintf("set realmlist %s\n", addr)
	if err := os.WriteFile(realmlistPath, []byte(content), 0644); err != nil {
		logWarning(fmt.Sprintf("Failed to update realmlist: %v", err))
		return
	}
	logInfo(fmt.Sprintf("Updated realmlist: %s", addr))
}
