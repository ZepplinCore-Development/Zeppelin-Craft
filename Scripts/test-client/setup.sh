#!/bin/bash
# Build or refresh the F-219 Track B offscreen client. Idempotent - re-run any time, and always
# after a Wow.exe or WarcraftXL ship (those are COPIED). PATCH-*.MPQ are SYMLINKED to nginx/wow/MPQ,
# so rebuilt patches are live immediately; re-run only when a new patch letter appears.
#
# Needs (no root): portable Wine at ~/.local/wine (see Joplin "Retroport Toolchain"), python3+PIL,
# network access to archive.ubuntu.com. Creates:
#   ~/.local/xvfb/   Xvfb, xdotool, xkbcomp unpacked from Ubuntu jammy .debs
#   $WOWTEST_DIR     client: stock MPQs + our patches + exe/WXL + stock DLLs + WTF
set -euo pipefail
. "$(dirname "$(readlink -f "$0")")/env.sh"
STOCK=${STOCK_DIR:-/workspace/project/Zeppelin-Tools/Asset Library/STOCK}
NGINX=${NGINX_WOW:-/workspace/project/nginx/wow}
REALM=${REALM_ADDR:-192.168.0.55}
CACHE=${XDEB_CACHE:-$HOME/.cache/zep-test-client/debs}

[ -x "$WINE" ] || { echo "Wine not found at $WINE (Joplin: Retroport Toolchain)" >&2; exit 1; }

# --- 1. X tools from .debs ---------------------------------------------------------------------
if [ ! -x "$XROOT/bin/Xvfb" ] || [ ! -x "$XROOT/bin/xdotool" ]; then
  echo "== fetching Xvfb/xdotool .debs"
  mkdir -p "$CACHE"
  python3 - "$CACHE" <<'PY'
import gzip, os, sys, urllib.request
cache = sys.argv[1]
base = 'http://archive.ubuntu.com/ubuntu'
want = ['xvfb', 'xserver-common', 'x11-xkb-utils', 'libunwind8', 'x11-apps', 'xdotool', 'libxdo3']
found = {}
for dist in ('jammy-updates', 'jammy'):          # newest first
    for comp in ('main', 'universe'):
        idx = gzip.decompress(urllib.request.urlopen(f'{base}/dists/{dist}/{comp}/binary-amd64/Packages.gz').read()).decode()
        for stanza in idx.split('\n\n'):
            f = dict(l.split(': ', 1) for l in stanza.splitlines() if ': ' in l and not l.startswith(' '))
            if f.get('Package') in want and f['Package'] not in found:
                found[f['Package']] = f['Filename']
missing = set(want) - set(found)
if missing:
    sys.exit(f'not in index: {missing}')
for pkg, fn in found.items():
    dst = os.path.join(cache, os.path.basename(fn))
    if not os.path.exists(dst):
        urllib.request.urlretrieve(f'{base}/{fn}', dst)
    print(dst)
PY
  mkdir -p "$(dirname "$XROOT")"
  for f in "$CACHE"/*.deb; do dpkg-deb -x "$f" "$(dirname "$XROOT")"; done
fi

# Xvfb has xkbcomp's dir compiled in as /usr/bin (no runtime flag, no root to install there).
# Rewrite that string to the same-length /tmp/xkb; env.sh puts an xkbcomp wrapper there.
python3 - "$XROOT/bin/Xvfb" <<'PY'
import shutil, sys
p = sys.argv[1]
b = bytearray(open(p, 'rb').read())
old, new = b'/usr/bin\x00/usr/share/X11/xkb', b'/tmp/xkb\x00/usr/share/X11/xkb'
if new in b:
    sys.exit(0)
i = b.find(old)
if i < 0 or b.find(old, i + 1) >= 0:
    sys.exit('Xvfb: xkbcomp dir string not found exactly once - package changed, re-derive the patch')
shutil.copy2(p, p + '.orig')
b[i:i + 8] = b'/tmp/xkb'
open(p, 'wb').write(b)
print('patched Xvfb xkbcomp dir -> /tmp/xkb')
PY

# --- 2. client ---------------------------------------------------------------------------------
echo "== assembling $WOWTEST_DIR"
mkdir -p "$WOWTEST_DIR/Data/enUS" "$WOWTEST_DIR/WTF"
cd "$WOWTEST_DIR"

# Speech MPQs were left out when STOCK/MPQ was extracted; the client won't start without them.
for n in speech-enUS expansion-speech-enUS lichking-speech-enUS; do
  if [ ! -f "$STOCK/MPQ/enUS/$n.MPQ" ]; then
    echo "   extracting $n.MPQ from the client zip"
    python3 - "$STOCK" "$n" <<'PY'
import shutil, sys, zipfile
stock, n = sys.argv[1], sys.argv[2]
with zipfile.ZipFile(f'{stock}/ChromieCraft_3.3.5a.zip') as z, \
        z.open(f'ChromieCraft_3.3.5a/Data/enUS/{n}.MPQ') as a, open(f'{stock}/MPQ/enUS/{n}.MPQ', 'wb') as b:
    shutil.copyfileobj(a, b, 1 << 22)
PY
  fi
done
for f in "$STOCK"/MPQ/*.MPQ; do ln -sfn "$f" Data/; done
for f in "$STOCK"/MPQ/enUS/*.MPQ; do ln -sfn "$f" Data/enUS/; done

# Our patches = exactly what the launcher serves.
find Data -maxdepth 1 -name 'PATCH-*.MPQ' -type l -delete
for f in "$NGINX"/MPQ/PATCH-*.MPQ; do ln -sfn "$f" Data/; done

cp -f "$NGINX/EXE/Wow.exe" .
cp -f "$NGINX"/WXL/*.dll .
[ -f "$NGINX/WXL/wxl-assets" ] && cp -f "$NGINX/WXL/wxl-assets" . || rm -f wxl-assets
# Copy over the top rather than rm -rf + cp: on the UNRAID share rm -rf races and fails with
# "Directory not empty". Then prune extensions that are no longer shipped.
mkdir -p Extensions && cp -rf "$NGINX/WXL/Extensions/." Extensions/
for e in Extensions/*/; do [ -d "$NGINX/WXL/Extensions/$(basename "$e")" ] || rm -rf "$e"; done
cp -n "$STOCK"/files/enUS/base-enUS/*.dll . 2>/dev/null || true   # DivxDecoder etc.; never overwrite WXL's d3d9

echo "set realmlist $REALM" > Data/enUS/realmlist.wtf
[ -f WTF/Config.wtf ] || cat > WTF/Config.wtf <<CFG
SET gxWindow "1"
SET gxMaximize "0"
SET gxResolution "1280x800"
SET readTOS "1"
SET readEULA "1"
SET readTerminationWithoutNotice "1"
SET locale "enUS"
SET checkAddonVersion "0"
SET movie "0"
SET Sound_EnableAllSound "0"
SET hwDetect "0"
SET accounttype "LK"
SET realmList "$REALM"
CFG

[ -f account.txt ] || echo "NOTE: no account.txt yet - run: python3 $HARNESS/create_account.py"
echo "== done. start: $HARNESS/run.sh &   then: $HARNESS/shot.sh out.png"
