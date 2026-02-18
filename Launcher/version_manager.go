package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sync"
	"time"
)

type VersionData struct {
	FormatVersion string            `json:"format_version"`
	LastUpdated   string            `json:"last_updated"`
	Files         map[string]string `json:"files"`
}

type VersionManager struct {
	versionFile string
	versions    map[string]string
	mu          sync.Mutex
}

func NewVersionManager(dataDir string) *VersionManager {
	vm := &VersionManager{
		versionFile: filepath.Join(dataDir, "client_versions.json"),
		versions:    make(map[string]string),
	}
	vm.load()
	return vm
}

func (vm *VersionManager) load() {
	data, err := os.ReadFile(vm.versionFile)
	if err != nil {
		return
	}
	var vd VersionData
	if err := json.Unmarshal(data, &vd); err != nil {
		logWarning(fmt.Sprintf("Failed to parse versions: %v", err))
		return
	}
	if vd.Files != nil {
		vm.versions = vd.Files
	}
}

func (vm *VersionManager) save() {
	vd := VersionData{
		FormatVersion: "1.0",
		LastUpdated:   time.Now().UTC().Format(time.RFC3339),
		Files:         vm.versions,
	}
	data, err := json.MarshalIndent(vd, "", "  ")
	if err != nil {
		logError(fmt.Sprintf("Failed to marshal versions: %v", err))
		return
	}
	if err := os.WriteFile(vm.versionFile, data, 0644); err != nil {
		logError(fmt.Sprintf("Failed to save versions: %v", err))
	}
}

func (vm *VersionManager) GetVersion(filename string) string {
	vm.mu.Lock()
	defer vm.mu.Unlock()
	return vm.versions[filename]
}

func (vm *VersionManager) SetVersion(filename, version string) {
	vm.mu.Lock()
	vm.versions[filename] = version
	vm.mu.Unlock()
	vm.save()
}

func (vm *VersionManager) ClearVersion(filename string) {
	vm.mu.Lock()
	delete(vm.versions, filename)
	vm.mu.Unlock()
	vm.save()
}
