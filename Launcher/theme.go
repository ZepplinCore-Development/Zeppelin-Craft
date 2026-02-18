package main

import (
	"image/color"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/theme"
)

// Color palette from PySide6 styles.py
var (
	colBgDark      = parseHex("#0f0f23")
	colBgPanel     = parseHex("#1a1a2e")
	colBgInput     = parseHex("#16213e")
	colTextPrimary = parseHex("#e0e0e0")
	colTextSecond  = parseHex("#8888aa")
	colAccent      = parseHex("#0ea5e9")
	colSuccess     = parseHex("#22c55e")
	colWarning     = parseHex("#f59e0b")
	colError       = parseHex("#ef4444")
	colBorder      = parseHex("#2a2a4e")
	colRowSelect   = parseHex("#1f3460")
)

// State colors used by the patch table
var StateColors = map[string]color.NRGBA{
	"missing":     colWarning,
	"downloading": colAccent,
	"updated":     colSuccess,
	"pending":     colTextSecond,
}

// State icons — ASCII-safe, renders on all platforms
var StateIcons = map[string]string{
	"missing":     "!",
	"downloading": ">>",
	"updated":     "*",
	"pending":     "..",
}

// zeppelinTheme implements fyne.Theme for the dark launcher look.
type zeppelinTheme struct{}

func (z *zeppelinTheme) Color(name fyne.ThemeColorName, variant fyne.ThemeVariant) color.Color {
	switch name {
	case theme.ColorNameBackground:
		return colBgDark
	case theme.ColorNameButton:
		return colBgPanel
	case theme.ColorNameInputBackground:
		return colBgInput
	case theme.ColorNameForeground:
		return colTextPrimary
	case theme.ColorNamePlaceHolder:
		return colTextSecond
	case theme.ColorNamePrimary:
		return colAccent
	case theme.ColorNameSeparator:
		return color.NRGBA{A: 0} // transparent — alternating row colors replace separators
	case theme.ColorNameInputBorder:
		return colBorder
	case theme.ColorNameDisabledButton:
		return colBgInput
	case theme.ColorNameDisabled:
		return colTextSecond
	case theme.ColorNameScrollBar:
		return colBorder
	case theme.ColorNameHover:
		return colRowSelect
	case theme.ColorNameHeaderBackground:
		return parseHex("#0d0d1f")
	}
	return theme.DefaultTheme().Color(name, variant)
}

func (z *zeppelinTheme) Font(style fyne.TextStyle) fyne.Resource {
	return theme.DefaultTheme().Font(style)
}

func (z *zeppelinTheme) Icon(name fyne.ThemeIconName) fyne.Resource {
	return theme.DefaultTheme().Icon(name)
}

func (z *zeppelinTheme) Size(name fyne.ThemeSizeName) float32 {
	switch name {
	case theme.SizeNameText:
		return 13
	case theme.SizeNamePadding:
		return 6
	case theme.SizeNameInnerPadding:
		return 4
	}
	return theme.DefaultTheme().Size(name)
}

func parseHex(hex string) color.NRGBA {
	if len(hex) == 7 && hex[0] == '#' {
		r := hexByte(hex[1], hex[2])
		g := hexByte(hex[3], hex[4])
		b := hexByte(hex[5], hex[6])
		return color.NRGBA{R: r, G: g, B: b, A: 255}
	}
	return color.NRGBA{A: 255}
}

func hexByte(hi, lo byte) uint8 {
	return hexDigit(hi)*16 + hexDigit(lo)
}

func hexDigit(c byte) uint8 {
	switch {
	case c >= '0' && c <= '9':
		return c - '0'
	case c >= 'a' && c <= 'f':
		return c - 'a' + 10
	case c >= 'A' && c <= 'F':
		return c - 'A' + 10
	}
	return 0
}
