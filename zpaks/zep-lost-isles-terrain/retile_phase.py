#!/usr/bin/env python3
"""
F-196 re-tile: move the Cata Lost Isles phase ADTs from map-648 tile coords to OA map-1 coords, so
PhasingHooks (which redirects base map-1 tiles to a same-named child tile) lines up with the base terrain.

Transform (F-011, verified): idxX_map1 = idxX_648 + 24 ; idxY_map1 = idxY_648 + 1
  world offset  X -533.3333 , Y -12800 , Z unchanged  (== one/24 tiles; matches MCNK.position exactly)

This pass does the VERIFIED parts:
  - rename every tile file (root + _tex0/_tex1/_obj0/_lod) to the new idx
  - root .adt: shift every MCNK.position by (-533.33, -12800, 0)   [verified against grid math]
  - rebuild the WDT MAIN present-table at the new coords            [what PhasingHooks reads]
  - copy .wdl / .tex verbatim
STAGED (next pass, needs the MDDF coord convention): shift the 1170 MDDF + 3 MODF placements in _obj0.
Until then _obj0 is copied unchanged, so doodads/WMOs render offset — terrain heightmap is correct.

Usage:  python3 retile_phase.py           (re-tiles all three phases -> mpq/parsed-assets/)

Lives in the zep-lost-isles-terrain zpak: reads the raw map-648-coord Cata ADTs from
mpq/source-binary/ (gitignored, host-only) and emits the map-1-coord tree straight into
mpq/parsed-assets/, which `zep build patch-mpq -p T --build` packs. Do NOT --parse-build
this zpak (source-assets is empty; it would clobber parsed-assets).
"""
import glob, os, re, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
SRC  = os.path.join(HERE, "mpq", "source-binary", "World", "Maps")
OUT  = os.path.join(HERE, "mpq", "parsed-assets", "World", "Maps")
PHASES = ("LostIsles", "LostIslesPhase1", "LostIslesPhase2")

DIDX_X, DIDX_Y = 24, 1
WDX, WDY = -533.3333, -12800.0          # MCNK.position px, py shift (Z unchanged)
MCNK_POS_OFF = 0x68                      # px,py,pz floats within the MCNK header
# _obj0 placement space is HALF-swapped (worldX=HALF-pos.z, worldY=HALF-pos.x), so the world offset
# (X-533.33, Y-12800) becomes pos.x+=12800, pos.z+=533.33 (height unchanged). Verified: world delta
# = exactly (-533.33, -12800), same as the terrain.
MDX, MDZ = 12800.0, 533.3333


def iter_chunks(d):
    i = 0
    while i + 8 <= len(d):
        tag = d[i:i+4][::-1].decode("ascii", "replace")
        sz = struct.unpack_from("<I", d, i+4)[0]
        yield tag, i+8, sz
        i += 8 + sz


def shift_root_mcnks(data: bytes) -> bytes:
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MCNK":
            px, py, pz = struct.unpack_from("<fff", b, off + MCNK_POS_OFF)
            struct.pack_into("<fff", b, off + MCNK_POS_OFF, px + WDX, py + WDY, pz)
    return bytes(b)


def shift_placements(data: bytes) -> bytes:
    """Shift MDDF (doodads) + MODF (WMOs, incl. their bounding boxes) by the same world offset the
    terrain moved, in placement space (pos.x += 12800, pos.z += 533.33; height unchanged)."""
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MDDF":
            for k in range(sz // 36):
                p = off + k*36 + 8                 # id(4) + uid(4), then position(3f)
                x, y, z = struct.unpack_from("<fff", b, p)
                struct.pack_into("<fff", b, p, x + MDX, y, z + MDZ)
        elif tag == "MODF":
            for k in range(sz // 64):
                base = off + k*64
                for foff in (8, 32, 44):           # position, lower-bounds, upper-bounds
                    x, y, z = struct.unpack_from("<fff", b, base + foff)
                    struct.pack_into("<fff", b, base + foff, x + MDX, y, z + MDZ)
    return bytes(b)


def rebuild_wdt(data: bytes) -> bytes:
    """Move the MAIN present grid so tile (x,y) -> (x+24, y+1). MAIN = 64x64 entries x 8 bytes,
    row-major MAIN[y*64 + x], flag bit0 = present (SFile-present flag preserved)."""
    b = bytearray(data)
    for tag, off, sz in iter_chunks(bytes(b)):
        if tag == "MAIN":
            old = bytes(b[off:off+0x8000])
            new = bytearray(0x8000)
            for y in range(64):
                for x in range(64):
                    e = struct.unpack_from("<I", old, (y*64 + x)*8)[0]
                    if e & 1:
                        nx, ny = x + DIDX_X, y + DIDX_Y
                        if 0 <= nx < 64 and 0 <= ny < 64:
                            struct.pack_into("<I", new, (ny*64 + nx)*8, e)
            b[off:off+0x8000] = new
            break
    return bytes(b)


def main():
    total = 0
    for phase in PHASES:
        pdir = os.path.join(SRC, phase)
        if not os.path.isdir(pdir):
            print(f"skip {phase}: not extracted"); continue
        outdir = os.path.join(OUT, phase); os.makedirs(outdir, exist_ok=True)
        n = 0
        for fn in sorted(os.listdir(pdir)):
            src = os.path.join(pdir, fn)
            data = open(src, "rb").read()
            m = re.match(rf"{phase}_(\d+)_(\d+)(.*)$", fn, re.I)   # tile file
            if m:
                x, y, suf = int(m.group(1)), int(m.group(2)), m.group(3)
                out = f"{phase}_{x+DIDX_X}_{y+DIDX_Y}{suf}"
                sl = suf.lower()
                if sl == ".adt":                        # root terrain -> shift MCNK heightmap origin
                    data = shift_root_mcnks(data)
                elif sl in ("_obj0.adt", "_obj1.adt"):  # placements -> shift doodads/WMOs
                    data = shift_placements(data)
                # _tex*/_lod copied verbatim under the new name
            elif fn.lower().endswith(".wdt"):
                out = fn; data = rebuild_wdt(data)
            else:                                       # .wdl / .tex / misc
                out = fn
            open(os.path.join(outdir, out), "wb").write(data)
            n += 1
        print(f"{phase}: re-tiled {n} files -> retiled/World/Maps/{phase}/")
        total += n
    print(f"done: {total} files. MCNK heightmap + MDDF/MODF doodads/WMOs re-positioned to map-1 coords.")


if __name__ == "__main__":
    main()
