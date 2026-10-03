#!/bin/bash
# Launch -> login screen -> character select -> world, screenshotting each stage.
#   drive.sh <outdir>      leaves the client running in-world; stop it with stop.sh
# Waits are generous because llvmpipe is slow. Override: LOGIN_WAIT, CHARSELECT_WAIT, WORLD_WAIT.
set -u
H=$(dirname "$(readlink -f "$0")")
. "$H/env.sh"
OUT=${1:?usage: drive.sh <outdir>}; mkdir -p "$OUT"
"$H/stop.sh"; sleep 2
"$H/run.sh" 3600 &
sleep "${LOGIN_WAIT:-60}";      "$H/shot.sh" "$OUT/01-login.png" && echo "shot 01-login"
"$H/login.sh" || exit 1
sleep "${CHARSELECT_WAIT:-40}"; "$H/shot.sh" "$OUT/02-charselect.png" && echo "shot 02-charselect"
xtool xdotool key Return
sleep "${WORLD_WAIT:-90}";      "$H/shot.sh" "$OUT/03-world.png" && echo "shot 03-world"
sleep 30;                       "$H/shot.sh" "$OUT/04-world-settled.png" && echo "shot 04-world-settled"
