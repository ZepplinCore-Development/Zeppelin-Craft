#!/bin/bash
# Launch the test client offscreen. Blocks until the client exits, so run it in the background.
#   run.sh [timeout_secs=1800]       env: WOW_ARGS (e.g. -opengl), WOW_D3D9=b (bypass WXL proxy)
. "$(dirname "$(readlink -f "$0")")/env.sh"
xvfb_up || exit 1
cd "$WOWTEST_DIR" && exec timeout "${1:-1800}" "$WINE" Wow.exe $WOW_ARGS > "$WOWTEST_DIR/wine.log" 2>&1
