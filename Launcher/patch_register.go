package main

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"time"
)

type PatchEntry struct {
	Name               string   `json:"name"`
	Description        string   `json:"description"`
	IsMandatory        bool     `json:"is_mandatory"`
	IsEnabledByDefault bool     `json:"is_enabled_by_default"`
	AutoUpdate         bool     `json:"auto_update"`
	Requires           []string `json:"requires"`
	RequiredFor        []string `json:"required_for"`
	BuildSource        string   `json:"build_source"`
	Version            int      `json:"version"`
	SizeMB             float64  `json:"size_mb"`
	Checksum           string   `json:"checksum"`
	LastModified       string   `json:"last_modified"`
}

type ServerMetadata struct {
	BuildNumber         int    `json:"build_number"`
	LastBuildTimestamp   string `json:"last_build_timestamp"`
	DBCVersion          int    `json:"dbc_version"`
	PatchBuilderVersion string `json:"patch_builder_version"`
}

type PatchRegister struct {
	FormatVersion  string                `json:"format_version"`
	LastUpdated    string                `json:"last_updated"`
	ServerMetadata ServerMetadata        `json:"server_metadata"`
	Patches        map[string]PatchEntry `json:"patches"`
}

type PatchRegisterClient struct {
	Register PatchRegister
	fetched  bool
}

func NewPatchRegisterClient() *PatchRegisterClient {
	return &PatchRegisterClient{}
}

func (c *PatchRegisterClient) Fetch() bool {
	client := &http.Client{Timeout: time.Duration(Timeout) * time.Second}
	resp, err := client.Get(PatchRegisterURL)
	if err != nil {
		logError(fmt.Sprintf("Failed to fetch patch register: %v", err))
		return false
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		logError(fmt.Sprintf("Failed to read patch register: %v", err))
		return false
	}

	var reg PatchRegister
	if err := json.Unmarshal(body, &reg); err != nil {
		logError(fmt.Sprintf("Failed to parse patch register: %v", err))
		return false
	}

	c.Register = reg
	c.fetched = true
	return true
}

func (c *PatchRegisterClient) BuildNumber() int {
	return c.Register.ServerMetadata.BuildNumber
}

func (c *PatchRegisterClient) GetAllFiles() map[string]string {
	result := make(map[string]string)
	for filename, entry := range c.Register.Patches {
		result[filename] = fmt.Sprintf("%d", entry.Version)
	}
	return result
}

func (c *PatchRegisterClient) IsMandatory(filename string) bool {
	entry, ok := c.Register.Patches[filename]
	if !ok {
		return false
	}
	return entry.IsMandatory
}

func (c *PatchRegisterClient) GetPatchInfo(filename string) (PatchEntry, bool) {
	entry, ok := c.Register.Patches[filename]
	return entry, ok
}

func (c *PatchRegisterClient) GetDisplayName(filename string) string {
	entry, ok := c.Register.Patches[filename]
	if !ok || entry.Name == "" {
		return filename
	}
	return entry.Name
}
