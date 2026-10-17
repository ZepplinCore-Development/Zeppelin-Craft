package main

// AppVersion and BaseURL are variables so a test build can set them with
// -ldflags "-X main.AppVersion=... -X main.BaseURL=..."; release builds use these values.
var (
	AppVersion = "3.1.0"
	BaseURL    = "http://159.196.84.172:8111/"
)

var (
	PatchRegisterURL = BaseURL + "patch_register.json"
	MPQDownloadURL   = BaseURL + "MPQ/"
	EXEDownloadURL   = BaseURL + "EXE/"
	EXE64DownloadURL = BaseURL + "EXE64/"    // F-224: the x64 source client bundle (WowClient64)
	WXLDownloadURL   = BaseURL + "WXL/"      // F-195: WarcraftXL client framework binaries
	LauncherURL      = BaseURL + "LAUNCHER/" // F-224: launcher self-update downloads
)

const (
	ServerName = "Zeppelin Craft"
	Timeout    = 30 // seconds

	WowExecutable = "Wow.exe" // the legacy 32-bit client; see gameExecutable() for the one launched
	DataDirectory = "Data"

	CheckUpdatesOnStart  = true
	MinimizeOnLaunch     = false
	PeriodicCheckEnabled = true
	CheckIntervalSeconds = 20
	WowCheckIntervalSec  = 10
	DownloadChunkSize    = 65536 // 64KB
)
