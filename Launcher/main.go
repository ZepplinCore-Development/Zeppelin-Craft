package main

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime/debug"

	"fyne.io/fyne/v2/app"
)

func main() {
	initLogger()

	// Catch panics and write to crash log (critical for -H windowsgui on Windows)
	defer func() {
		if r := recover(); r != nil {
			msg := fmt.Sprintf("FATAL PANIC: %v\n%s", r, debug.Stack())
			logError(msg)
			// Also write to a crash file in case logger isn't working
			crashPath := filepath.Join(getAppDirectory(), "crash.log")
			os.WriteFile(crashPath, []byte(msg), 0644)
		}
	}()

	logInfo(fmt.Sprintf("Zeppelin Launcher v%s starting", AppVersion))

	a := app.New()
	a.Settings().SetTheme(&zeppelinTheme{})

	engine := NewLauncherEngine()

	ui := buildMainWindow(a, engine)
	ui.window.SetIcon(resourceIconPng)

	ui.startApp()
	ui.window.ShowAndRun()
}
