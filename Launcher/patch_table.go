package main

import (
	"fmt"
	"image/color"
	"sync"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/canvas"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/layout"
	"fyne.io/fyne/v2/widget"
)

// PatchRow represents one row in the patch table.
type PatchRow struct {
	Filename    string
	State       string
	DisplayName string
	VersionText string
	SizeText    string
	Description string
}

// PatchTableData is a thread-safe data model for the list.
type PatchTableData struct {
	mu   sync.RWMutex
	rows []PatchRow
}

func NewPatchTableData() *PatchTableData {
	return &PatchTableData{}
}

func (d *PatchTableData) Length() int {
	d.mu.RLock()
	defer d.mu.RUnlock()
	return len(d.rows)
}

func (d *PatchTableData) SetRows(rows []PatchRow) {
	d.mu.Lock()
	d.rows = rows
	d.mu.Unlock()
}

func (d *PatchTableData) GetRow(index int) (PatchRow, bool) {
	d.mu.RLock()
	defer d.mu.RUnlock()
	if index < 0 || index >= len(d.rows) {
		return PatchRow{}, false
	}
	return d.rows[index], true
}

// Column widths
const (
	colWStatus  float32 = 160
	colWPatch   float32 = 130
	colWName    float32 = 260
	colWVersion float32 = 100
	colWSize    float32 = 70
	rowHeight   float32 = 32
)

// CreatePatchList builds a widget.List with row-level hover/selection,
// plus a header row above it. Returns the list + combined container.
func CreatePatchList(data *PatchTableData, onSelect func(int)) (*widget.List, *fyne.Container) {
	list := widget.NewList(
		// length
		func() int {
			return data.Length()
		},
		// create row template
		func() fyne.CanvasObject {
			return makeRowTemplate()
		},
		// update row
		func(id widget.ListItemID, obj fyne.CanvasObject) {
			updateRow(data, id, obj)
		},
	)

	list.OnSelected = func(id widget.ListItemID) {
		if onSelect != nil {
			onSelect(id)
		}
	}

	headerRow := buildHeaderRow()
	combined := container.NewBorder(headerRow, nil, nil, nil, list)
	return list, combined
}

// makeRowTemplate creates a row with a background rectangle for alternating stripes.
func makeRowTemplate() fyne.CanvasObject {
	bg := canvas.NewRectangle(color.Transparent)

	status := canvas.NewText("placeholder", colTextPrimary)
	status.TextSize = 13
	patch := canvas.NewText("placeholder", colTextPrimary)
	patch.TextSize = 13
	name := canvas.NewText("placeholder", colTextPrimary)
	name.TextSize = 13
	version := canvas.NewText("placeholder", colTextSecond)
	version.TextSize = 13
	size := canvas.NewText("placeholder", colTextSecond)
	size.TextSize = 13

	rowContent := container.NewHBox(
		container.New(layout.NewGridWrapLayout(fyne.NewSize(colWStatus, rowHeight)), status),
		container.New(layout.NewGridWrapLayout(fyne.NewSize(colWPatch, rowHeight)), patch),
		container.New(layout.NewGridWrapLayout(fyne.NewSize(colWName, rowHeight)), name),
		container.New(layout.NewGridWrapLayout(fyne.NewSize(colWVersion, rowHeight)), version),
		container.New(layout.NewGridWrapLayout(fyne.NewSize(colWSize, rowHeight)), size),
	)

	return container.NewStack(bg, rowContent)
}

// updateRow populates a row template with data and alternating background.
func updateRow(data *PatchTableData, id int, obj fyne.CanvasObject) {
	row, ok := data.GetRow(id)
	if !ok {
		return
	}

	stack := obj.(*fyne.Container)
	bg := stack.Objects[0].(*canvas.Rectangle)
	hbox := stack.Objects[1].(*fyne.Container)

	// Alternating row backgrounds — semi-transparent so Fyne hover shows through
	if id%2 == 1 {
		bg.FillColor = color.NRGBA{R: colBgPanel.R, G: colBgPanel.G, B: colBgPanel.B, A: 180}
	} else {
		bg.FillColor = color.Transparent
	}
	bg.Refresh()

	// Each cell is a GridWrapLayout container holding a canvas.Text
	statusText := hbox.Objects[0].(*fyne.Container).Objects[0].(*canvas.Text)
	patchText := hbox.Objects[1].(*fyne.Container).Objects[0].(*canvas.Text)
	nameText := hbox.Objects[2].(*fyne.Container).Objects[0].(*canvas.Text)
	versionText := hbox.Objects[3].(*fyne.Container).Objects[0].(*canvas.Text)
	sizeText := hbox.Objects[4].(*fyne.Container).Objects[0].(*canvas.Text)

	// Status
	icon := StateIcons[row.State]
	label := stateDisplayText(row.State)
	statusText.Text = fmt.Sprintf("  %s  %s", icon, label)
	if c, ok := StateColors[row.State]; ok {
		statusText.Color = c
	} else {
		statusText.Color = colTextPrimary
	}
	statusText.Refresh()

	// Patch filename
	patchText.Text = row.Filename
	patchText.Color = colTextPrimary
	patchText.Refresh()

	// Display name
	nameText.Text = row.DisplayName
	nameText.Color = colTextPrimary
	nameText.Refresh()

	// Version
	versionText.Text = row.VersionText
	versionText.Color = colTextSecond
	versionText.Refresh()

	// Size
	sizeText.Text = row.SizeText
	sizeText.Color = colTextSecond
	sizeText.Refresh()
}

// buildHeaderRow creates a fixed row of header labels.
func buildHeaderRow() *fyne.Container {
	headers := []struct {
		name  string
		width float32
	}{
		{"Status", colWStatus},
		{"Patch", colWPatch},
		{"Name", colWName},
		{"Version", colWVersion},
		{"Size", colWSize},
	}

	cells := make([]fyne.CanvasObject, len(headers))
	for i, h := range headers {
		t := canvas.NewText(h.name, colTextSecond)
		t.TextSize = 11
		t.TextStyle.Bold = true
		cells[i] = container.New(
			layout.NewGridWrapLayout(fyne.NewSize(h.width, 24)),
			t,
		)
	}
	return container.NewHBox(cells...)
}

func stateDisplayText(state string) string {
	switch state {
	case "missing":
		return "Missing"
	case "downloading":
		return "Downloading..."
	case "updated":
		return "Up to date"
	case "pending":
		return "Pending install"
	}
	return "Unknown"
}
