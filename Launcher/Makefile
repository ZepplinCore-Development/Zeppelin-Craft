# Zeppelin Launcher v3 — Go + Fyne Build System
#
# Linux build requires: libgl1-mesa-dev, xorg-dev
# OR local dev headers at /tmp/localdev/ (see setup instructions)
#
# Windows cross-compile requires: MinGW (x86_64-w64-mingw32-gcc)
# OR LLVM-MinGW at /tmp/mingw/

.PHONY: build-linux build-windows build clean

# Local dev header prefix (if system packages unavailable)
LOCAL_DEV := /tmp/localdev
MINGW_DIR := $(or $(wildcard /tmp/mingw/llvm-mingw-*/bin),/usr/bin)

# CGO flags for local dev headers
export CGO_CFLAGS  ?= -I$(LOCAL_DEV)/usr/include
export CGO_LDFLAGS ?= -L$(LOCAL_DEV)/usr/lib/x86_64-linux-gnu
export PKG_CONFIG_PATH ?= $(LOCAL_DEV)/usr/lib/x86_64-linux-gnu/pkgconfig:$(LOCAL_DEV)/usr/share/pkgconfig

build-linux:
	@mkdir -p dist
	CGO_ENABLED=1 go build -o dist/Zeppelin .

build-windows:
	@mkdir -p dist
	CGO_ENABLED=1 \
	CC=$(MINGW_DIR)/x86_64-w64-mingw32-gcc \
	CXX=$(MINGW_DIR)/x86_64-w64-mingw32-g++ \
	GOOS=windows GOARCH=amd64 \
	go build -ldflags="-H windowsgui" -o dist/Zeppelin.exe .

build: build-linux build-windows

clean:
	rm -rf dist/
