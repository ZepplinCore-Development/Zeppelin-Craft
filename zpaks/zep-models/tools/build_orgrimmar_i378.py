#!/usr/bin/env python3
"""Rebuild the I-378 Orgrimmar fix: OA's city WMO with Blizzard's stairwell portals and stair-room headroom.

Two defects in Open Azeroth's re-exported Orgrimmar (PATCH-O), both at the alchemy stair house
(1964.7,-4468.1) and its siblings:

1. Camera clips through ceilings into grey void. OA saved every portal as a 4-vertex quad; Blizzard's
   original has 55 five-vertex portals, and OA cut a real corner off 54 of them - including every
   stairwell opening. A camera rising through the missing corner never crosses into the upper room.
   Fix: the 54 portals take Blizzard's vertex list back (MOPV/MOPT only; planes, sides and links unchanged).

2. Character renders black on the top steps of each flight. The steps sit just below the next floor's
   portal plane; the client places the character in the upper room, which has no face under it, so the
   lighting ray finds nothing. Blizzard's own data does the same once the portals are correct.
   Fix: 2 yd of bbox headroom (root MOGI + group MOGP z-max) on the four stair rooms, so a character on
   their top steps resolves into the room whose floor it stands on. No geometry changes.
   Groups: 051 Bottom04, 053 Mid04, 050 Top08, 049 Top07.

Verified in the F-219 client and in game (I-378). Output goes to mpq/source-assets; PATCH-Z overrides
PATCH-O. Inputs are pinned by sha256: OA's files from patch-open-azeroth parsed-assets, Blizzard's original
root from wago.tools (`wow_classic_titan` 3.80.2.69874, FDID 113576). Any mismatch aborts without writing.

Usage:
    python3 build_orgrimmar_i378.py           # build, verify, write
    python3 build_orgrimmar_i378.py --check   # verify the files already in source-assets
Then: delete zep-models parsed-assets/WORLD/WMO/KALIMDOR/OGRIMMAR (same-size skip) and
      zep build patch-mpq -p Z --parse-build
"""
import argparse
import hashlib
import json
import struct
import sys
import urllib.request
from pathlib import Path

HERE = Path(__file__).resolve().parent
ZPAKS = HERE.parent.parent
MANIFEST = HERE / 'orgrimmar_i378.json'
DEST = HERE.parent / 'mpq' / 'source-assets' / 'World' / 'wmo' / 'Kalimdor' / 'Ogrimmar'
OA_DIR = ZPAKS / 'patch-open-azeroth' / 'mpq' / 'parsed-assets' / 'WORLD' / 'WMO' / 'KALIMDOR' / 'OGRIMMAR'
CACHE = Path.home() / '.cache' / 'zep-wago'

MOGI_STRIDE = 32
MOGP_BBOX = 32          # MVER(12) + MOGP tag/size(8) + name/desc/flags(12) -> bbox min xyz, max xyz


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def fetch(fdid: int, build: str) -> bytes:
    path = CACHE / build / str(fdid)
    if not path.exists():
        path.parent.mkdir(parents=True, exist_ok=True)
        req = urllib.request.Request(f'https://wago.tools/api/casc/{fdid}?version={build}',
                                     headers={'User-Agent': 'zep-models/1.0'})
        with urllib.request.urlopen(req, timeout=120) as resp:
            path.write_bytes(resp.read())
    return path.read_bytes()


def chunks(data: bytes) -> list:
    out, i = [], 0
    while i + 8 <= len(data):
        size = struct.unpack_from('<I', data, i + 4)[0]
        out.append((data[i:i + 4][::-1].decode('latin1'), data[i + 8:i + 8 + size]))
        i += 8 + size
    return out


def portals(c: dict):
    mopt = [struct.unpack_from('<HH4f', c['MOPT'], k * 20) for k in range(len(c['MOPT']) // 20)]
    mopv = [struct.unpack_from('<3f', c['MOPV'], k * 12) for k in range(len(c['MOPV']) // 12)]
    return mopt, [[mopv[t[0] + j] for j in range(t[1])] for t in mopt]


def restore_portals(oa: dict, orig: dict) -> tuple:
    """OA portals that lost a vertex take Blizzard's vertex list (matched by plane + vertex superset)."""
    mopt, verts = portals(oa)
    omopt, overts = portals(orig)
    key = lambda t: tuple(round(x, 3) for x in t[2:5]) + (round(t[5], 2),)
    rnd = lambda vs: {tuple(round(x, 2) for x in v) for v in vs}
    by_plane = {}
    for j, t in enumerate(omopt):
        by_plane.setdefault(key(t), []).append(j)
    restored = 0
    for i, t in enumerate(mopt):
        for j in by_plane.get(key(t), []):
            if len(overts[j]) > len(verts[i]) and rnd(verts[i]) <= rnd(overts[j]):
                verts[i] = overts[j]
                restored += 1
                break
    out_v, out_t = [], []
    for t, vs in zip(mopt, verts):
        out_t.append(struct.pack('<HH4f', len(out_v), len(vs), *t[2:]))
        out_v += vs
    return b''.join(struct.pack('<3f', *v) for v in out_v), b''.join(out_t), restored


def build_files(man: dict) -> dict:
    oa_root = (OA_DIR / 'OGRIMMAR.WMO').read_bytes()
    if sha256(oa_root) != man['oa_inputs']['OGRIMMAR.WMO']:
        sys.exit('OA root is not the one this recipe was built against - refusing')
    orig = fetch(man['original_root_fdid'], man['build'])
    if sha256(orig) != man['original_root_sha256']:
        sys.exit('original root changed upstream (sha256 mismatch) - refusing')

    order = chunks(oa_root)
    c = dict(order)
    c['MOPV'], c['MOPT'], restored = restore_portals(c, dict(chunks(orig)))
    if restored != man['portals_restored']:
        sys.exit(f"restored {restored} portals, expected {man['portals_restored']} - refusing")

    mogi = bytearray(c['MOGI'])
    files = {}
    for g in man['headroom_groups']:
        name = f'OGRIMMAR_{g:03d}.WMO'
        grp = bytearray((OA_DIR / name).read_bytes())
        if sha256(bytes(grp)) != man['oa_inputs'][name]:
            sys.exit(f'OA group {name} is not the one this recipe was built against - refusing')
        at = g * MOGI_STRIDE + 4
        bb = list(struct.unpack_from('<6f', mogi, at))
        hb = list(struct.unpack_from('<6f', grp, MOGP_BBOX))
        if abs(bb[5] - hb[5]) > 0.01:
            sys.exit(f'group {g}: root and header bbox disagree - refusing')
        bb[5] = hb[5] = bb[5] + man['headroom_yd']
        struct.pack_into('<6f', mogi, at, *bb)
        struct.pack_into('<6f', grp, MOGP_BBOX, *hb)
        files[f'Ogrimmar_{g:03d}.wmo'] = bytes(grp)
    c['MOGI'] = bytes(mogi)
    files['Ogrimmar.wmo'] = b''.join(t[::-1].encode() + struct.pack('<I', len(c[t])) + c[t] for t, _ in order)

    bad = [n for n, d in files.items() if sha256(d) != man['results'].get(n)]
    if bad or set(files) != set(man['results']):
        sys.exit(f'output differs from the pinned result for {bad} - refusing')
    return files


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--check', action='store_true', help='verify files already in source-assets')
    args = ap.parse_args()
    man = json.loads(MANIFEST.read_text())

    if args.check:
        bad = [n for n, h in man['results'].items()
               if not (DEST / n).exists() or sha256((DEST / n).read_bytes()) != h]
        print('OK' if not bad else f'MISMATCH: {bad}')
        sys.exit(1 if bad else 0)

    files = build_files(man)
    DEST.mkdir(parents=True, exist_ok=True)
    for name, data in files.items():
        (DEST / name).write_bytes(data)
    print(f'wrote {len(files)} files to {DEST}')


if __name__ == '__main__':
    main()
