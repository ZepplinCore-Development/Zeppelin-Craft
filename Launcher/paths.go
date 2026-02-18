package main

import (
	"os"
	"path/filepath"
)

func getAppDirectory() string {
	exe, err := os.Executable()
	if err != nil {
		wd, _ := os.Getwd()
		return wd
	}
	// Resolve symlinks to get the real path
	real, err := filepath.EvalSymlinks(exe)
	if err != nil {
		return filepath.Dir(exe)
	}
	return filepath.Dir(real)
}

func ensureDirectories() (dataDir, logsDir string) {
	appDir := getAppDirectory()
	dataDir = filepath.Join(appDir, DataDirectory)
	logsDir = filepath.Join(appDir, "logs")

	os.MkdirAll(dataDir, 0755)
	os.MkdirAll(logsDir, 0755)

	return dataDir, logsDir
}

func getTempDownloadDir() string {
	dir := filepath.Join(getAppDirectory(), "temp_patches")
	os.MkdirAll(dir, 0755)
	return dir
}

func fileExists(path string) bool {
	info, err := os.Stat(path)
	return err == nil && !info.IsDir()
}
