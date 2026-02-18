package main

import (
	_ "embed"

	"fyne.io/fyne/v2"
)

//go:embed assets/hero.jpg
var heroJpgBytes []byte

//go:embed assets/icon.png
var iconPngBytes []byte

var resourceHeroJpg *fyne.StaticResource
var resourceIconPng *fyne.StaticResource

func init() {
	resourceHeroJpg = fyne.NewStaticResource("hero.jpg", heroJpgBytes)
	resourceIconPng = fyne.NewStaticResource("icon.png", iconPngBytes)
}
