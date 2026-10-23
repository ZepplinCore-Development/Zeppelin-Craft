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
	vm := NewVersionManager(dataDir)
	memberStore = vm // 3.3.0: per-member md5s of split bundles share the version store
	return &LauncherEngine{
		VersionManager: vm,
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
			if !fileExists(memberPath(f.Name)) { // an archive piece lives in Data/
				return false
			}
		}
		return true
	}
	lower := strings.ToLower(filename)
	var filePath string
	if _, ok := appBinarySubdir(filename); ok { // F-195/F-224: app dir, WXL host under Utils/
		filePath = wxlFilePath(filename)
	} else if strings.HasSuffix(lower, ".mpq") {
		filePath = filepath.Join(getAppDirectory(), DataDirectory, filename)
	} else {
		filePath = filepath.Join(getAppDirectory(), filename)
	}
	return fileExists(filePath)
}

func (le *LauncherEngine) FindWowInstallation() string {
	exe := gameExecutable()
	appDir := getAppDirectory()
	if fileExists(filepath.Join(appDir, exe)) {
		return appDir
	}
	if isSourceClientMode() { // F-224: the x64 client is only ever installed next to the launcher
		return ""
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
		if fileExists(filepath.Join(p, exe)) {
			return p
		}
	}
	return ""
}

// LaunchGame starts the client. The error says why it could not.
func (le *LauncherEngine) LaunchGame() error {
	exe := gameExecutable()
	wowPath := le.FindWowInstallation()
	if wowPath == "" {
		logError("WoW executable not found: " + exe)
		return fmt.Errorf("%s was not found in the game directory", exe)
	}

	if isSourceClientMode() { // F-224
		if err := checkWine64(); err != nil {
			logError(err.Error())
			return err
		}
		removeWarcraftXL(wowPath)
		if d3d9 := filepath.Join(wowPath, "d3d9.dll"); is32BitPE(d3d9) {
			logError("32-bit d3d9.dll still present: " + d3d9)
			return fmt.Errorf("the old WarcraftXL d3d9.dll could not be removed from %s; delete it and launch again", wowPath)
		}
	}

	le.updateRealmlist(wowPath)

	wowExe := filepath.Join(wowPath, exe)
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
		return fmt.Errorf("could not start %s: %v", exe, err)
	}
	// Reap the game when it exits. Unreaped, it stays a zombie whose name still matches in the process
	// list, so isWowRunning reported it running until the launcher closed and staged patches never installed.
	go cmd.Wait()

	return nil
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
