#!/bin/bash
# Screenshot the client window to PNG:  shot.sh <out.png> [--full]
# Uses XGetImage directly (grab.py). NEVER use xwd here (I-380): with any private-colormap window
# open (Wine always makes one) xwd writes 24bpp, and a 32bpp decode looks like a grey, striped,
# 3/4-width render bug.
. "$(dirname "$(readlink -f "$0")")/env.sh"
crop=""
if [ "$2" != "--full" ] && wow_geom; then crop="$WX,$WY,$WW,$WH"; fi
python3 "$HARNESS/grab.py" "$1" $crop
