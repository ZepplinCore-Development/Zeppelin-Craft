#!/bin/bash
# Log the running client in with $WOWTEST_DIR/account.txt (line 1 user, line 2 password).
#   login.sh [--enter-world]    --enter-world presses Enter at character select (first character)
# Clicks are relative to the client window, so they survive window placement changes.
. "$(dirname "$(readlink -f "$0")")/env.sh"
[ -r "$WOWTEST_DIR/account.txt" ] || { echo "no $WOWTEST_DIR/account.txt - run create_account.py" >&2; exit 1; }
ACC=$(sed -n 1p "$WOWTEST_DIR/account.txt"); PW=$(sed -n 2p "$WOWTEST_DIR/account.txt")
wow_geom || { echo "client window not found" >&2; exit 1; }
wow_click $((WW/2)) $((WH*431/800)) || exit 1     # account-name box on the 3.3.5 login screen
sleep 1
xtool xdotool type --delay 60 "$ACC"; xtool xdotool key Tab
xtool xdotool type --delay 60 "$PW"; xtool xdotool key Return
if [ "$1" = "--enter-world" ]; then
  sleep "${CHARSELECT_WAIT:-40}"
  xtool xdotool key Return
fi
