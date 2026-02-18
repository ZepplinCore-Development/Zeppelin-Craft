package main

import (
	"fmt"
	"os"
	"path/filepath"
	"sync"
	"time"
)

var (
	logFile *os.File
	logMu   sync.Mutex
)

func initLogger() {
	logPath := filepath.Join(getAppDirectory(), "debug.log")
	f, err := os.OpenFile(logPath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err == nil {
		logFile = f
	}
}

func logMessage(level, message string) {
	timestamp := time.Now().Format("15:04:05")
	line := fmt.Sprintf("%s - %s - %s", timestamp, level, message)

	logMu.Lock()
	defer logMu.Unlock()

	fmt.Println(line)
	if logFile != nil {
		logFile.WriteString(line + "\n")
	}
}

func logInfo(msg string)    { logMessage("INFO", msg) }
func logError(msg string)   { logMessage("ERROR", msg) }
func logWarning(msg string) { logMessage("WARNING", msg) }
