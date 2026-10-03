# F-219 Track B offscreen test client - shared environment. Source it, don't run it.
#   HARNESS     = this directory (scripts, tracked in Zeppelin-Craft)
#   WOWTEST_DIR = the assembled client (data, logs, WTF, account.txt; NOT tracked)
HARNESS=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
WOWTEST_DIR=${WOWTEST_DIR:-$HOME/wowtest}
XROOT=${XROOT:-$HOME/.local/xvfb/usr}
WINE=${WINE:-$HOME/.local/wine/bin/wine}
WINESERVER=${WINESERVER:-$HOME/.local/wine/bin/wineserver}
export DISPLAY=${WOWTEST_DISPLAY:-:77}
export WINEPREFIX=${WINEPREFIX:-$HOME/.wine-wowtest}
export WINEDEBUG=${WINEDEBUG:-err+all}
# d3d9=n,b loads the WXL proxy shipped next to Wow.exe; WOW_D3D9=b bypasses it.
export WINEDLLOVERRIDES="d3d9=${WOW_D3D9:-n,b};mscoree,mshtml="
export LIBGL_ALWAYS_SOFTWARE=1

# Run an X tool from the locally unpacked .debs (they need their own lib dir).
xtool() { LD_LIBRARY_PATH=$XROOT/lib/x86_64-linux-gnu "$XROOT/bin/$1" "${@:2}"; }

# Start Xvfb if it isn't already serving $DISPLAY. Screen is larger than the 1280x800 client
# window on purpose: at 1280x800 Wine shrinks the window to 1224x765 to fit.
xvfb_up() {
  # Our Xvfb is binary-patched to look for xkbcomp in /tmp/xkb (setup.sh); /tmp is not persistent.
  [ -x /tmp/xkb/xkbcomp ] || { mkdir -p /tmp/xkb; printf '#!/bin/sh\nLD_LIBRARY_PATH=%s/lib/x86_64-linux-gnu exec %s/bin/xkbcomp "$@"\n' "$XROOT" "$XROOT" > /tmp/xkb/xkbcomp; chmod +x /tmp/xkb/xkbcomp; }
  python3 "$HARNESS/grab.py" --probe 2>/dev/null && return 0
  (LD_LIBRARY_PATH=$XROOT/lib/x86_64-linux-gnu nohup "$XROOT/bin/Xvfb" "$DISPLAY" -screen 0 1600x1000x24 -nolisten tcp $XVFB_ARGS >/tmp/xvfb${DISPLAY#:}.log 2>&1 &)
  for _ in 1 2 3 4 5 6 7 8 9 10; do python3 "$HARNESS/grab.py" --probe 2>/dev/null && return 0; sleep 0.5; done
  echo "Xvfb failed to start, see /tmp/xvfb${DISPLAY#:}.log" >&2; return 1
}

# Sets WX WY WW WH to the client window's geometry. Returns 1 if no client window.
wow_geom() {
  local g; g=$(xtool xdotool search --name 'World of Warcraft' getwindowgeometry --shell 2>/dev/null | head -5) || return 1
  [ -n "$g" ] || return 1
  eval "$(echo "$g" | sed 's/^X=/WX=/;s/^Y=/WY=/;s/^WIDTH=/WW=/;s/^HEIGHT=/WH=/;s/^WINDOW=/WID=/')"
}

# Click at coordinates relative to the client window's top-left.
wow_click() { wow_geom || return 1; xtool xdotool mousemove $((WX+$1)) $((WY+$2)) click 1; }
