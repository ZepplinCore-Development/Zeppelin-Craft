package main

import (
	"fmt"
	"image/color"
	"sort"
	"strings"
	"sync"
	"time"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/canvas"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/dialog"
	"fyne.io/fyne/v2/layout"
	"fyne.io/fyne/v2/widget"
)

// AppState holds all runtime state for the main window.
type AppState struct {
	mu sync.Mutex

	patchStates    map[string]string // filename -> "missing"|"downloading"|"updated"|"pending"
	downloadQueue  []string
	currentDL      string
	isUpdating     bool
	dlStartTime    time.Time
	lastKnownPatch map[string]string // filename -> version (for change detection)
	patchCheckCnt  int

	progressCh chan DownloadProgress
	resultCh   chan DownloadResult
	cancelCh   chan struct{}
}

// MainUI holds all UI widget references.
type MainUI struct {
	window fyne.Window
	engine *LauncherEngine

	// Hero overlays
	serverNameText  *canvas.Text
	buildText       *canvas.Text
	connectionText  *canvas.Text
	patchCountText  *canvas.Text

	// Patch list
	tableData      *PatchTableData
	patchList      *widget.List
	listContainer  *fyne.Container

	// Description
	descLabel *widget.Label

	// Progress
	progressBar   *widget.ProgressBar
	progressFrame *fyne.Container

	// Launch
	launchButton *widget.Button

	// Bottom status
	statusLabel *widget.Label

	state AppState
}

func buildMainWindow(app fyne.App, engine *LauncherEngine) *MainUI {
	w := app.NewWindow(ServerName + " Launcher v" + AppVersion)
	w.Resize(fyne.NewSize(900, 850))
	w.SetFixedSize(true)
	w.CenterOnScreen()

	ui := &MainUI{
		window: w,
		engine: engine,
		state: AppState{
			patchStates:    make(map[string]string),
			lastKnownPatch: make(map[string]string),
			progressCh:     make(chan DownloadProgress, 64),
			resultCh:       make(chan DownloadResult, 4),
			cancelCh:       make(chan struct{}),
		},
	}

	content := ui.buildContent()
	w.SetContent(content)

	// Confirm close during download
	w.SetCloseIntercept(func() {
		ui.state.mu.Lock()
		updating := ui.state.isUpdating
		ui.state.mu.Unlock()

		if updating {
			dialog.ShowConfirm("Download in Progress",
				"Downloads are in progress. Are you sure you want to exit?",
				func(ok bool) {
					if ok {
						close(ui.state.cancelCh)
						w.Close()
					}
				}, w)
		} else {
			w.Close()
		}
	})

	return ui
}

func (ui *MainUI) buildContent() *fyne.Container {
	// -- Hero section --
	heroImage := ui.buildHeroImage()

	// -- Patch list (with header row) --
	ui.tableData = NewPatchTableData()
	ui.patchList, ui.listContainer = CreatePatchList(ui.tableData, ui.onTableSelect)

	// -- Description panel --
	ui.descLabel = widget.NewLabel("Select a patch to view its description.")
	ui.descLabel.Wrapping = fyne.TextWrapWord

	// -- Progress bar (hidden by default) --
	ui.progressBar = widget.NewProgressBar()
	ui.progressFrame = container.NewStack(ui.progressBar)
	ui.progressFrame.Hide()

	// -- Launch button --
	ui.launchButton = widget.NewButton("LAUNCH GAME", ui.onLaunchGame)
	ui.launchButton.Importance = widget.HighImportance
	ui.launchButton.Disable()

	// -- Status label --
	ui.statusLabel = widget.NewLabel("Ready")

	// -- Layout --
	mainContent := container.NewBorder(
		// Top: hero
		heroImage,
		// Bottom: description, progress, launch, status
		container.NewVBox(
			ui.descLabel,
			ui.progressFrame,
			ui.launchButton,
			ui.statusLabel,
		),
		nil, nil,
		// Center: patch list fills remaining space
		ui.listContainer,
	)

	return mainContent
}

const heroHeight = 300

func (ui *MainUI) buildHeroImage() fyne.CanvasObject {
	// Hero background image
	heroImg := canvas.NewImageFromResource(resourceHeroJpg)
	heroImg.FillMode = canvas.ImageFillStretch
	heroImg.SetMinSize(fyne.NewSize(900, heroHeight))

	// Gradient overlay (dark at bottom) — vertical
	grad := canvas.NewVerticalGradient(
		colorWithAlpha(colBgDark, 30),
		colorWithAlpha(colBgDark, 230),
	)

	// Top-left: server name + connection status
	ui.serverNameText = canvas.NewText(ServerName, color.White)
	ui.serverNameText.TextSize = 22
	ui.serverNameText.TextStyle.Bold = true
	ui.serverNameText.Move(fyne.NewPos(20, 15))

	ui.connectionText = canvas.NewText("Connecting...", colTextSecond)
	ui.connectionText.TextSize = 11
	ui.connectionText.Move(fyne.NewPos(20, 42))

	// Bottom-left: patch count
	ui.patchCountText = canvas.NewText("", colTextSecond)
	ui.patchCountText.TextSize = 11
	ui.patchCountText.Move(fyne.NewPos(20, heroHeight-25))

	// Bottom-right: build number
	ui.buildText = canvas.NewText("", colTextSecond)
	ui.buildText.TextSize = 11
	ui.buildText.Alignment = fyne.TextAlignTrailing
	ui.buildText.Move(fyne.NewPos(680, heroHeight-25))

	textOverlay := container.NewWithoutLayout(
		ui.serverNameText,
		ui.connectionText,
		ui.patchCountText,
		ui.buildText,
	)

	heroStack := container.NewStack(heroImg, grad, textOverlay)

	// Constrain height
	return container.New(
		layout.NewGridWrapLayout(fyne.NewSize(900, heroHeight)),
		heroStack,
	)
}

func (ui *MainUI) startApp() {
	// Background listener for download progress/results
	go ui.downloadListener()

	// Initial server check
	time.AfterFunc(200*time.Millisecond, func() {
		ui.refreshServerStatus()
	})

	// Install pending patches on startup
	time.AfterFunc(500*time.Millisecond, func() {
		ui.checkAndInstallPending()
	})

	// Periodic WoW check (10s)
	go func() {
		ticker := time.NewTicker(time.Duration(WowCheckIntervalSec) * time.Second)
		defer ticker.Stop()
		for range ticker.C {
			ui.periodicWowCheck()
		}
	}()

	// Periodic patch poll (20s)
	if PeriodicCheckEnabled {
		go func() {
			ticker := time.NewTicker(time.Duration(CheckIntervalSeconds) * time.Second)
			defer ticker.Stop()
			for range ticker.C {
				ui.periodicPatchCheck()
			}
		}()
		logInfo(fmt.Sprintf("Periodic patch checks every %ds", CheckIntervalSeconds))
	}
}

// ================================================================
// SERVER STATUS
// ================================================================

func (ui *MainUI) refreshServerStatus() {
	if ui.engine.TestConnection() {
		ui.connectionText.Text = "Online"
		ui.connectionText.Color = colSuccess
		ui.connectionText.Refresh()

		bn := ui.engine.PatchRegister.BuildNumber()
		if bn > 0 {
			ui.buildText.Text = fmt.Sprintf("Build #%d", bn)
			ui.buildText.Refresh()
		}

		allFiles := ui.engine.PatchRegister.GetAllFiles()
		ui.patchCountText.Text = fmt.Sprintf("%d patches", len(allFiles))
		ui.patchCountText.Refresh()

		ui.state.mu.Lock()
		updating := ui.state.isUpdating
		ui.state.mu.Unlock()
		if !updating {
			ui.populateTable()
		}
	} else {
		ui.connectionText.Text = "Offline"
		ui.connectionText.Color = colError
		ui.connectionText.Refresh()
	}
}

// ================================================================
// TABLE POPULATION
// ================================================================

func (ui *MainUI) populateTable() {
	pr := ui.engine.PatchRegister
	allFiles := pr.GetAllFiles()
	var toDownload []string

	// Sort filenames alphabetically — matches WoW's patch load order
	filenames := make([]string, 0, len(allFiles))
	for fn := range allFiles {
		filenames = append(filenames, fn)
	}
	sort.Strings(filenames)

	rows := make([]PatchRow, 0, len(filenames))

	for _, filename := range filenames {
		serverVersion := allFiles[filename]
		localVersion := ui.engine.VersionManager.GetVersion(filename)
		exists := ui.engine.CheckFileExists(filename)

		if localVersion != "" && !exists {
			ui.engine.VersionManager.ClearVersion(filename)
			localVersion = ""
		}

		needsUpdate := (localVersion != serverVersion) || !exists
		state := ui.determineState(filename, needsUpdate, exists)

		ui.state.mu.Lock()
		ui.state.patchStates[filename] = state
		ui.state.mu.Unlock()

		if state == "missing" && !ui.isQueuedOrDownloading(filename) {
			toDownload = append(toDownload, filename)
		}

		// Version text
		var versionText string
		if localVersion != "" && localVersion == serverVersion {
			versionText = "v" + serverVersion
		} else if localVersion != "" {
			versionText = fmt.Sprintf("v%s -> v%s", localVersion, serverVersion)
		} else {
			versionText = "v" + serverVersion
		}

		// Size text
		sizeText := ""
		if info, ok := pr.GetPatchInfo(filename); ok && info.SizeMB > 0 {
			if info.SizeMB >= 1000 {
				sizeText = fmt.Sprintf("%.1f GB", info.SizeMB/1024)
			} else {
				sizeText = fmt.Sprintf("%.1f MB", info.SizeMB)
			}
		}

		// Description
		desc := "No description available."
		if info, ok := pr.GetPatchInfo(filename); ok && info.Description != "" {
			desc = info.Description
		}

		// Display name (show filename if server has no name)
		displayName := pr.GetDisplayName(filename)

		rows = append(rows, PatchRow{
			Filename:    filename,
			State:       state,
			DisplayName: displayName,
			VersionText: versionText,
			SizeText:    sizeText,
			Description: desc,
		})
	}

	ui.tableData.SetRows(rows)
	ui.patchList.Refresh()
	ui.updateLaunchButton()

	// Auto-download missing
	if len(toDownload) > 0 {
		time.AfterFunc(500*time.Millisecond, func() {
			ui.autoDownload(toDownload)
		})
	}
}

func (ui *MainUI) determineState(filename string, needsUpdate, exists bool) string {
	ui.state.mu.Lock()
	defer ui.state.mu.Unlock()

	if ui.state.isUpdating && ui.state.currentDL == filename {
		return "downloading"
	}

	for _, q := range ui.state.downloadQueue {
		if q == filename {
			return "missing"
		}
	}

	exclude := ui.state.currentDL
	pending := getPendingPatches(exclude)
	for _, p := range pending {
		if p == filename {
			return "pending"
		}
	}

	if needsUpdate {
		return "missing"
	}
	return "updated"
}

func (ui *MainUI) isQueuedOrDownloading(filename string) bool {
	ui.state.mu.Lock()
	defer ui.state.mu.Unlock()
	if ui.state.currentDL == filename {
		return true
	}
	for _, q := range ui.state.downloadQueue {
		if q == filename {
			return true
		}
	}
	return false
}

// ================================================================
// TABLE INTERACTION
// ================================================================

func (ui *MainUI) onTableSelect(rowIdx int) {
	row, ok := ui.tableData.GetRow(rowIdx)
	if !ok {
		return
	}
	ui.descLabel.SetText(row.Description)

	ui.state.mu.Lock()
	state := ui.state.patchStates[row.Filename]
	ui.state.mu.Unlock()
	if state == "missing" {
		ui.queueDownload(row.Filename)
	}
}

// ================================================================
// DOWNLOAD QUEUE
// ================================================================

func (ui *MainUI) autoDownload(files []string) {
	for _, fn := range files {
		ui.state.mu.Lock()
		s := ui.state.patchStates[fn]
		ui.state.mu.Unlock()
		if s == "missing" {
			ui.queueDownload(fn)
		}
	}
}

func (ui *MainUI) queueDownload(filename string) {
	if ui.isQueuedOrDownloading(filename) {
		return
	}

	ui.state.mu.Lock()
	ui.state.downloadQueue = append(ui.state.downloadQueue, filename)
	ui.state.mu.Unlock()

	logInfo(fmt.Sprintf("Queued: %s", filename))
	ui.populateTable()
	ui.processQueue()
}

func (ui *MainUI) processQueue() {
	ui.state.mu.Lock()
	if ui.state.isUpdating || len(ui.state.downloadQueue) == 0 {
		ui.state.mu.Unlock()
		return
	}
	filename := ui.state.downloadQueue[0]
	ui.state.downloadQueue = ui.state.downloadQueue[1:]
	ui.state.mu.Unlock()

	ui.startDownload(filename)
}

func (ui *MainUI) startDownload(filename string) {
	ui.state.mu.Lock()
	ui.state.isUpdating = true
	ui.state.currentDL = filename
	ui.state.dlStartTime = time.Now()
	ui.state.patchStates[filename] = "downloading"
	ui.state.cancelCh = make(chan struct{})
	ui.state.mu.Unlock()

	ui.populateTable()

	ui.progressBar.SetValue(0)
	ui.progressFrame.Show()
	ui.statusLabel.SetText(fmt.Sprintf("Preparing to download %s...", filename))

	StartDownload(filename, ui.engine.PatchRegister, ui.state.progressCh, ui.state.resultCh, ui.state.cancelCh)
}

// downloadListener runs in a goroutine, reading progress and result channels.
func (ui *MainUI) downloadListener() {
	for {
		select {
		case prog := <-ui.state.progressCh:
			ui.handleProgress(prog)
		case result := <-ui.state.resultCh:
			ui.handleResult(result)
		}
	}
}

func (ui *MainUI) handleProgress(prog DownloadProgress) {
	if prog.Total > 0 {
		pct := float64(prog.Downloaded) / float64(prog.Total)
		ui.progressBar.SetValue(pct)

		dlMB := float64(prog.Downloaded) / (1024 * 1024)
		totalMB := float64(prog.Total) / (1024 * 1024)

		ui.state.mu.Lock()
		elapsed := time.Since(ui.state.dlStartTime).Seconds()
		ui.state.mu.Unlock()

		if elapsed > 0 {
			speed := dlMB / elapsed
			remaining := 0.0
			if speed > 0 {
				remaining = (totalMB - dlMB) / speed
			}
			var eta string
			if remaining < 60 {
				eta = fmt.Sprintf("%.0fs", remaining)
			} else {
				eta = fmt.Sprintf("%.1fm", remaining/60)
			}
			ui.statusLabel.SetText(
				fmt.Sprintf("Downloading %s: %.1f/%.1f MB (%d%%) \u2014 %.1f MB/s \u2014 ETA: %s",
					prog.Filename, dlMB, totalMB, int(pct*100), speed, eta))
		} else {
			ui.statusLabel.SetText(
				fmt.Sprintf("Downloading %s: %.1f/%.1f MB (%d%%)",
					prog.Filename, dlMB, totalMB, int(pct*100)))
		}
	} else {
		ui.statusLabel.SetText(
			fmt.Sprintf("Downloading %s: %.0f KB", prog.Filename, float64(prog.Downloaded)/1024))
	}
}

func (ui *MainUI) handleResult(result DownloadResult) {
	ui.state.mu.Lock()
	if result.Success {
		ui.state.patchStates[result.Filename] = result.FinalState

		if result.FinalState == "updated" {
			allFiles := ui.engine.PatchRegister.GetAllFiles()
			if ver, ok := allFiles[result.Filename]; ok {
				ui.engine.VersionManager.SetVersion(result.Filename, ver)
			}
		}
	} else {
		ui.state.patchStates[result.Filename] = "missing"
	}

	ui.state.isUpdating = false
	ui.state.currentDL = ""
	hasMore := len(ui.state.downloadQueue) > 0
	ui.state.mu.Unlock()

	ui.statusLabel.SetText(result.Message)
	ui.progressFrame.Hide()
	ui.populateTable()

	if hasMore {
		time.AfterFunc(300*time.Millisecond, func() {
			ui.processQueue()
		})
	}
}

// ================================================================
// LAUNCH BUTTON
// ================================================================

func (ui *MainUI) updateLaunchButton() {
	ui.state.mu.Lock()
	allReady := true
	hasPatch := false
	for _, s := range ui.state.patchStates {
		hasPatch = true
		if s != "updated" {
			allReady = false
			break
		}
	}
	ui.state.mu.Unlock()

	if allReady || !hasPatch {
		ui.launchButton.Enable()
	} else {
		ui.launchButton.Disable()
	}
}

func (ui *MainUI) onLaunchGame() {
	ui.statusLabel.SetText("Launching game...")
	if ui.engine.LaunchGame() {
		ui.statusLabel.SetText("Game launched successfully")
		if MinimizeOnLaunch {
			ui.window.Hide()
		}
	} else {
		ui.statusLabel.SetText("Failed to launch game")
		dialog.ShowError(
			fmt.Errorf("could not launch the game — check that %s exists in the game directory", WowExecutable),
			ui.window,
		)
	}
}

// ================================================================
// PERIODIC CHECKS
// ================================================================

func (ui *MainUI) periodicWowCheck() {
	ui.state.mu.Lock()
	exclude := ui.state.currentDL
	ui.state.mu.Unlock()

	pending := getPendingPatches(exclude)
	if len(pending) > 0 && !isWowRunning() {
		logInfo(fmt.Sprintf("WoW closed - installing %d pending patches...", len(pending)))
		ui.statusLabel.SetText("Installing pending patches...")

		installResult := installPendingPatches()

		for _, fn := range installResult.ValidationFailed {
			ui.engine.VersionManager.ClearVersion(fn)
		}

		if installResult.InstalledCount > 0 || len(installResult.ValidationFailed) > 0 {
			ui.updateVersionsForInstalled(pending, installResult.FailedPatches)

			msg := fmt.Sprintf("Installed %d pending patch(es)", installResult.InstalledCount)
			if len(installResult.ValidationFailed) > 0 {
				msg += fmt.Sprintf(", %d incomplete removed", len(installResult.ValidationFailed))
			} else if len(installResult.FailedPatches) > 0 {
				msg += fmt.Sprintf(", %d failed", len(installResult.FailedPatches))
			}
			ui.statusLabel.SetText(msg)

			ui.state.mu.Lock()
			updating := ui.state.isUpdating
			ui.state.mu.Unlock()
			if !updating {
				ui.refreshServerStatus()
			}
		}
	}
}

func (ui *MainUI) periodicPatchCheck() {
	if !PeriodicCheckEnabled {
		return
	}

	ui.state.mu.Lock()
	ui.state.patchCheckCnt++
	cnt := ui.state.patchCheckCnt
	ui.state.mu.Unlock()

	if !ui.engine.PatchRegister.Fetch() {
		return
	}

	current := ui.engine.PatchRegister.GetAllFiles()

	ui.state.mu.Lock()
	var newPatches []string
	var updatedPatches []struct{ Filename, OldVer, NewVer string }

	for filename, version := range current {
		if _, known := ui.state.lastKnownPatch[filename]; !known {
			if cnt > 1 {
				newPatches = append(newPatches, filename)
			}
		} else if ui.state.lastKnownPatch[filename] != version {
			updatedPatches = append(updatedPatches, struct{ Filename, OldVer, NewVer string }{
				filename, ui.state.lastKnownPatch[filename], version,
			})
		}
	}
	ui.state.lastKnownPatch = current
	updating := ui.state.isUpdating
	ui.state.mu.Unlock()

	if len(newPatches) > 0 || len(updatedPatches) > 0 {
		ui.notifyPatchChanges(newPatches, updatedPatches)
		if !updating {
			ui.populateTable()
		}
	}
}

func (ui *MainUI) checkAndInstallPending() {
	ui.state.mu.Lock()
	exclude := ui.state.currentDL
	ui.state.mu.Unlock()

	pending := getPendingPatches(exclude)

	if len(pending) > 0 && !isWowRunning() {
		logInfo(fmt.Sprintf("Startup: installing %d pending patches...", len(pending)))
		ui.statusLabel.SetText("Installing pending patches...")

		installResult := installPendingPatches()

		for _, fn := range installResult.ValidationFailed {
			ui.engine.VersionManager.ClearVersion(fn)
		}

		if installResult.InstalledCount > 0 {
			ui.updateVersionsForInstalled(pending, installResult.FailedPatches)
			msg := fmt.Sprintf("Installed %d pending patch(es)", installResult.InstalledCount)
			if len(installResult.FailedPatches) > 0 {
				msg += fmt.Sprintf(", %d failed", len(installResult.FailedPatches))
			}
			ui.statusLabel.SetText(msg)
		}

		ui.state.mu.Lock()
		updating := ui.state.isUpdating
		ui.state.mu.Unlock()
		if !updating {
			ui.refreshServerStatus()
		}
	} else if len(pending) > 0 && isWowRunning() {
		ui.statusLabel.SetText(fmt.Sprintf("%d patches waiting for WoW to close", len(pending)))
	}
}

func (ui *MainUI) updateVersionsForInstalled(pending, failed []string) {
	allFiles := ui.engine.PatchRegister.GetAllFiles()
	failedSet := make(map[string]bool)
	for _, f := range failed {
		failedSet[f] = true
	}

	for _, filename := range pending {
		if !failedSet[filename] {
			if ver, ok := allFiles[filename]; ok {
				ui.engine.VersionManager.SetVersion(filename, ver)
				logInfo(fmt.Sprintf("Updated version tracking for %s", filename))
			}
		}
	}
}

func (ui *MainUI) notifyPatchChanges(newPatches []string, updatedPatches []struct{ Filename, OldVer, NewVer string }) {
	pr := ui.engine.PatchRegister
	var messages []string

	if len(newPatches) > 0 {
		if len(newPatches) == 1 {
			messages = append(messages, fmt.Sprintf("New patch: %s", pr.GetDisplayName(newPatches[0])))
		} else {
			messages = append(messages, fmt.Sprintf("%d new patches available", len(newPatches)))
		}
	}

	for _, up := range updatedPatches {
		name := pr.GetDisplayName(up.Filename)
		messages = append(messages, fmt.Sprintf("Updated: %s (v%s -> v%s)", name, up.OldVer, up.NewVer))
	}

	if len(messages) > 0 {
		text := strings.Join(messages, " | ")
		logInfo("PATCH UPDATE: " + text)
		ui.statusLabel.SetText(text)
	}
}

// colorWithAlpha returns a color.NRGBA with modified alpha.
func colorWithAlpha(c color.NRGBA, a uint8) color.NRGBA {
	return color.NRGBA{R: c.R, G: c.G, B: c.B, A: a}
}
