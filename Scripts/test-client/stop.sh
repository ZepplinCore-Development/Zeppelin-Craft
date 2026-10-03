#!/bin/bash
# Stop the test client. (Don't use `pkill -f Wow.exe`: it matches and kills the calling shell.)
. "$(dirname "$(readlink -f "$0")")/env.sh"
"$WINESERVER" -k 2>/dev/null; true
