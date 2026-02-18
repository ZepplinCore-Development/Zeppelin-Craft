package main

const (
	AppVersion = "3.0.0"
	ServerName = "Zeppelin Craft"
	BaseURL    = "http://159.196.84.172:8111/"
	Timeout    = 30 // seconds

	PatchRegisterURL     = BaseURL + "patch_register.json"
	MandatoryDownloadURL = BaseURL + "mandatory/"
	OptionalDownloadURL  = BaseURL + "optional/"

	WowExecutable = "Wow.exe"
	DataDirectory = "Data"

	CheckUpdatesOnStart  = true
	MinimizeOnLaunch     = false
	PeriodicCheckEnabled = true
	CheckIntervalSeconds = 20
	WowCheckIntervalSec  = 10
	DownloadChunkSize    = 65536 // 64KB
)
