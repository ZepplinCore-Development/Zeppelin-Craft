#!/usr/bin/env python3
"""
I-385: build SERVER terrain (.map) for the Lost Isles swap maps 659 (LostIslesPhase1) and
661 (LostIslesPhase2), so the core's phase-aware terrain (GridTerrainLoader swap overlay) gives
creatures in a swap phase the ground the client draws.

Why not map_extractor: the phase ADTs are Cataclysm SPLIT format (root + _obj0/_tex0/_tex1).
The root keeps everything the server needs (MCNK + MCVT heights, holes, MH2O liquid) but has no
MCIN, and the 3.3.5 extractor locates MCNKs only through MCIN. This script reads the MCNKs
directly and writes the same v9 .map the extractor writes (System.cpp ConvertADT), always as raw
floats (the packed int8/int16 modes are a size optimisation the loader does not need).

Area: copied from the BASE map-1 .map of the same tile. The swap must not change zone/area, and
the Cata MCNK area ids are not the ones our AreaTable uses for map 1.
Flight bounds (MFBO): omitted - the phase roots have none; without it getMinHeight() is unbounded.

Input : mpq/parsed-assets/WORLD/MAPS/LOSTISLESPHASE{1,2}/*_X_Y.adt  (already re-tiled to map-1
        coords by retile_phase.py)
Output: <data>/maps/{map:03}{Y:02}{X:02}.map   (ADT name is _X_Y; the .map name is Y then X)

Usage:
  python3 build_server_maps.py                       # write 659/661 into /workspace/project/data/maps
  python3 build_server_maps.py --verify-base 51 31   # convert KALIMDOR_51_31.ADT and diff it against
                                                     # the live 0013151.map (validates this writer)
  python3 build_server_maps.py --stage-navmesh /workspace/project/data/swapnav
                                                     # also stage the mmaps_generator input for 659/661
                                                     # (inside data/ so the ac-tools container sees it as /output/swapnav)
"""
import argparse, os, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
MAPS_IN = os.path.join(HERE, "mpq", "parsed-assets", "WORLD", "MAPS")
OA_KALIMDOR = os.path.normpath(os.path.join(
    HERE, "..", "patch-open-azeroth", "mpq", "parsed-assets", "WORLD", "MAPS", "KALIMDOR"))
DATA = "/workspace/project/data"

# Which maps the zone swaps to and their client directories come from data (phase_definitions +
# DBC Map.directory) via cli/lib/terrain_swaps.py - the same source gen_terrain_map.py uses for the
# client side, so server and client can't disagree. Lost Isles = 659 LostIslesPhase1, 661 LostIslesPhase2.
ZONE = 4720
sys.path.insert(0, os.path.normpath(os.path.join(HERE, "..", "..", "cli")))
from lib.dbc_utils import DBCConfig, run_sql           # noqa: E402
from lib.terrain_swaps import zone_swap_dirs           # noqa: E402
BASE_MAP = 1
# Tiles the 659/661 navmesh is built over (ADT X 50-55, Y 28-33 = the island and its shelf).
# The swapped tiles are inside; the rest are base copies so a path can leave a swapped tile.
ISLAND_X = range(50, 56)
ISLAND_Y = range(28, 34)

CELLS = 16           # ADT_CELLS_PER_GRID
CELL = 8             # ADT_CELL_SIZE
GRID = 128           # ADT_GRID_SIZE
MAP_VERSION = 9
BUILD = 12340
USE_MIN_HEIGHT = -500.0    # CONF_use_minHeight (liquid fill for hidden cells)

LIQ_WATER, LIQ_OCEAN, LIQ_MAGMA, LIQ_SLIME, LIQ_DARK = 0x01, 0x02, 0x04, 0x08, 0x10


def chunks(d, start=0, end=None):
    end = len(d) if end is None else end
    i = start
    while i + 8 <= end:
        tag = d[i:i+4][::-1].decode("ascii", "replace")
        sz = struct.unpack_from("<I", d, i+4)[0]
        yield tag, i + 8, sz
        i += 8 + sz


def liquid_soundbanks():
    """LiquidType id -> type (SoundBank: 0 water, 1 ocean, 2 magma, 3 slime) from OUR dbc."""
    from pathlib import Path
    config = DBCConfig.from_env(Path(HERE).parents[1] / "cli" / ".env")
    ok, out = run_sql("SELECT id, type FROM liquidtype", config, config.live)
    if not ok:
        raise SystemExit(f"liquidtype query failed: {out}")
    res = {}
    for line in out.splitlines():
        p = line.split("\t")
        if len(p) == 2 and p[0].isdigit():
            res[int(p[0])] = int(p[1])
    return res


# Modern MH2O: the instance's second word is a LiquidObject id (>= 42) instead of a vertex format,
# and type ids reach past our LiquidType.dbc. The CLIENT resolves both in WXL's FixupMh2o
# (wxl-modern-adt AdtParse.cpp) from LiquidRemapData.inc; the server must make the SAME choice or
# server liquid != drawn liquid. Mirrored here, reading WXL's own tables.
WXL_LIQUID_REMAP = ("/workspace/project/Zeppelin-Tools/WarcraftXL/wxl-core/extensions/"
                    "wxl-modern-adt/src/load/LiquidRemapData.inc")
LVF_ENTRY_BYTES = (5, 8, 1, 9)


def wxl_liquid_tables():
    import re
    src = open(WXL_LIQUID_REMAP).read()
    obj_part, lvf_part = src.split("kLiquidTypeLvf[", 1)
    redirect = {int(a): (int(b), int(c))
                for a, b, c in re.findall(r"\{(\d+),(\d+),(\d+)\}", obj_part.split("kLiquidObjectRedirect[", 1)[1])}
    type_lvf = {int(a): int(b) for a, b in re.findall(r"\{(\d+),(\d+)\}", lvf_part)}
    return redirect, type_lvf


def resolve_liquid(ltype, lvf, ovd, oeb, w, h, mh2o_size, banks, tables):
    """FixupMh2o, per instance -> (type, lvf, ovd, oeb) exactly as the client will read them."""
    redirect, type_lvf = tables
    if lvf >= 42:
        if lvf == 42:
            lvf = 2
        elif lvf in redirect:
            ltype, lvf = redirect[lvf]
        else:
            lvf = type_lvf.get(ltype, 0 if ovd else 2)
    if ovd == 0:
        lvf = 2
    if ovd:
        per = LVF_ENTRY_BYTES[lvf] if lvf < 4 else 0
        if per == 0 or ovd > mh2o_size or (w + 1) * (h + 1) * per > mh2o_size - ovd:
            ovd, lvf = 0, 2
    if oeb and (oeb > mh2o_size or (w * h + 7) // 8 > mh2o_size - oeb):
        oeb = 0
    if ltype not in banks:                  # all our rows have material 1-3, so "in dbc" == present
        ltype = 3 if lvf == 1 else 1
    return ltype, lvf, ovd, oeb


def read_base_area(path):
    """Return the raw AREA section (header + optional 16x16 ids) of an existing .map."""
    d = open(path, "rb").read()
    hdr = struct.unpack_from("<4sIIIIIIIIII", d, 0)
    off, size = hdr[3], hdr[4]
    return d[off:off+size]


def parse_adt(path):
    d = open(path, "rb").read()
    mcnks, mh2o = {}, None
    for tag, off, sz in chunks(d):
        if tag == "MCNK":
            ix, iy = struct.unpack_from("<II", d, off + 4)
            mcnks[(iy, ix)] = (off, sz)
        elif tag == "MH2O":
            mh2o = (off, sz)
    if len(mcnks) != CELLS * CELLS:
        raise SystemExit(f"{path}: {len(mcnks)} MCNKs, expected 256")
    return d, mcnks, mh2o


def convert(adt_path, area_section, banks, tables):
    d, mcnks, mh2o = parse_adt(adt_path)

    V9 = [[0.0] * (GRID + 1) for _ in range(GRID + 1)]
    V8 = [[0.0] * GRID for _ in range(GRID)]
    holes = [[0] * CELLS for _ in range(CELLS)]
    for (i, j), (off, sz) in mcnks.items():
        flags = struct.unpack_from("<I", d, off)[0]
        base_z = struct.unpack_from("<f", d, off + 0x68 + 8)[0]
        if flags & 0x10000:
            # Cata high-res holes: 8 bytes (1 bit per 1/8 cell) at 0x14 -> classic 4x4 low-res bits
            hr = d[off + 0x14: off + 0x1C]
            lo = 0
            for r in range(4):
                for c in range(4):
                    bits = [(hr[r*2 + dr] >> (c*2 + dc)) & 1 for dr in (0, 1) for dc in (0, 1)]
                    if all(bits):
                        lo |= 1 << (r * 4 + c)
            holes[i][j] = lo
        else:
            holes[i][j] = struct.unpack_from("<H", d, off + 0x3C)[0]
        mcvt = None
        for tag, soff, ssz in chunks(d, off + 128, off + sz):
            if tag == "MCVT":
                mcvt = struct.unpack_from("<145f", d, soff)
                break
        for y in range(CELL + 1):
            for x in range(CELL + 1):
                V9[i*CELL + y][j*CELL + x] = base_z + (mcvt[y*17 + x] if mcvt else 0.0)
        for y in range(CELL):
            for x in range(CELL):
                V8[i*CELL + y][j*CELL + x] = base_z + (mcvt[y*17 + 9 + x] if mcvt else 0.0)

    lo_h = min(min(min(r) for r in V9), min(min(r) for r in V8))
    hi_h = max(max(max(r) for r in V9), max(max(r) for r in V8))

    # ---- liquid (MH2O), same rules as ConvertADT ----
    l_entry = [[0] * CELLS for _ in range(CELLS)]
    l_flags = [[0] * CELLS for _ in range(CELLS)]
    l_show = [[False] * GRID for _ in range(GRID)]
    l_height = [[0.0] * (GRID + 1) for _ in range(GRID + 1)]
    if mh2o:
        b = mh2o[0]
        for i in range(CELLS):
            for j in range(CELLS):
                oi, used, oa = struct.unpack_from("<III", d, b + (i * CELLS + j) * 12)
                if not used or not oi:
                    continue
                ltype, fmt, mn, _mx, ox, oy, w, h, oeb, ovd = struct.unpack_from("<HHffBBBBII", d, b + oi)
                ltype, fmt, ovd, oeb = resolve_liquid(ltype, fmt, ovd, oeb, w, h, mh2o[1], banks, tables)
                deep = 0
                if oa:
                    deep = struct.unpack_from("<Q", d, b + oa + 8)[0]
                elif used:
                    deep = 0xFFFFFFFFFFFFFFFF
                exists = struct.unpack_from("<Q", d, b + oeb)[0] if oeb else 0xFFFFFFFFFFFFFFFF
                count = 0
                for y in range(h):
                    for x in range(w):
                        if exists & 1:
                            l_show[i*CELL + y + oy][j*CELL + x + ox] = True
                            count += 1
                        exists >>= 1
                l_entry[i][j] = ltype
                bank = banks.get(ltype)
                if bank == 0:
                    l_flags[i][j] |= LIQ_WATER
                elif bank == 1:
                    l_flags[i][j] |= LIQ_OCEAN | (LIQ_DARK if deep else 0)
                elif bank == 2:
                    l_flags[i][j] |= LIQ_MAGMA
                elif bank == 3:
                    l_flags[i][j] |= LIQ_SLIME
                else:
                    print(f"  WARN {os.path.basename(adt_path)} chunk {i},{j}: liquid type {ltype} not in our LiquidType.dbc")
                pos = 0
                for y in range(h + 1):
                    for x in range(w + 1):
                        # no height stream (depth-only / flat layer): the layer sits at its min level
                        # (the stock extractor writes 0.0 here, which is only right for sea level)
                        hv = mn
                        if ovd and fmt in (0, 1, 3):
                            hv = struct.unpack_from("<f", d, b + ovd + pos * 4)[0]
                        l_height[i*CELL + y + oy][j*CELL + x + ox] = hv
                        pos += 1

    # ---- assemble ----
    out = bytearray()
    sections = []
    height = struct.pack("<4sIff", b"MHGT", 0 if hi_h != lo_h else 0x1, lo_h, hi_h)
    if hi_h != lo_h:
        height += b"".join(struct.pack(f"<{GRID+1}f", *r) for r in V9)
        height += b"".join(struct.pack(f"<{GRID}f", *r) for r in V8)

    first_t, first_f = l_entry[0][0], l_flags[0][0]
    full_type = any(l_entry[y][x] != first_t or l_flags[y][x] != first_f
                    for y in range(CELLS) for x in range(CELLS))
    liquid = b""
    if first_f != 0 or full_type:
        minX = minY = 255
        maxX = maxY = 0
        lmx, lmn = -20000.0, 20000.0
        for y in range(GRID):
            for x in range(GRID):
                if l_show[y][x]:
                    minX, maxX = min(minX, x), max(maxX, x)
                    minY, maxY = min(minY, y), max(maxY, y)
                    lmx, lmn = max(lmx, l_height[y][x]), min(lmn, l_height[y][x])
                else:
                    l_height[y][x] = USE_MIN_HEIGHT
                    lmn = min(lmn, USE_MIN_HEIGHT)
        w, h = maxX - minX + 2, maxY - minY + 2
        fl = 0
        if lmx == lmn:
            fl |= 0x2
        if not full_type:
            fl |= 0x1
        liquid = struct.pack("<4sBBHBBBBf", b"MLIQ", fl,
                             first_f if not full_type else 0,
                             first_t if not full_type else 0,
                             minX, minY, w, h, lmn)
        if full_type:
            liquid += b"".join(struct.pack(f"<{CELLS}H", *r) for r in l_entry)
            liquid += b"".join(struct.pack(f"<{CELLS}B", *r) for r in l_flags)
        if not fl & 0x2:
            for y in range(h):
                liquid += struct.pack(f"<{w}f", *l_height[y + minY][minX:minX + w])

    hole_bytes = b""
    if any(holes[i][j] for i in range(CELLS) for j in range(CELLS)):
        hole_bytes = b"".join(struct.pack(f"<{CELLS}H", *r) for r in holes)

    hdr_size = 44
    area_off = hdr_size
    height_off = area_off + len(area_section)
    liquid_off = height_off + len(height) if liquid else 0
    holes_off = (height_off + len(height) + len(liquid)) if hole_bytes else 0
    hdr = struct.pack("<4sIIIIIIIIII", b"MAPS", MAP_VERSION, BUILD,
                      area_off, len(area_section), height_off, len(height),
                      liquid_off, len(liquid), holes_off, len(hole_bytes))
    return hdr + area_section + height + liquid + hole_bytes, (lo_h, hi_h)


def map_name(map_id, x, y):
    return f"{map_id:03}{y:02}{x:02}.map"


def read_heights(path):
    """V9 + V8 as floats from a .map (any packing), for --verify-base."""
    d = open(path, "rb").read()
    h = struct.unpack_from("<4sIIIIIIIIII", d, 0)
    off = h[5]
    _, flags, gmin, gmax = struct.unpack_from("<4sIff", d, off)
    p = off + 16
    n9, n8 = (GRID + 1) ** 2, GRID * GRID
    if flags & 0x1:
        return [gmin] * (n9 + n8)
    if flags & 0x2:
        v = struct.unpack_from(f"<{n9+n8}H", d, p)
        step = (gmax - gmin) / 65535
        return [gmin + a * step for a in v]
    if flags & 0x4:
        v = struct.unpack_from(f"<{n9+n8}B", d, p)
        step = (gmax - gmin) / 255
        return [gmin + a * step for a in v]
    return list(struct.unpack_from(f"<{n9+n8}f", d, p))


def stage_navmesh(stage, maps_dir, vmaps_dir, swaps):
    """mmaps_generator input tree for the 659/661 navmeshes (run on the UNRAID host, I-385).

    maps/  : the swapped tiles + a copy of the base map-1 tile for every other island tile
             (ISLAND_X x ISLAND_Y), so the navmesh covers the whole island and a path can leave a
             swapped tile. Only the swapped tiles go to the LIVE data/maps - the core loads every
             swap tile it finds as an overlay, and an identical copy there would just cost memory.
    vmaps/ : map 1's own collision under the swap ids (001.vmtree -> 659.vmtree, 001_X_Y.vmtile ->
             659_X_Y.vmtile) plus every model, all HARD links (no copy). vmtile names are ADT X_Y
             order (001_52_29 holds the Gallywix Labor Mine) - the OPPOSITE of the .map/.mmtile
             names ({map}YYXX). mmaps_generator bridges it with loadVMap(mapID, tileY, tileX); the
             Y_X-named tiles are a different patch of Kalimdor (I-385 fix 4). The server keeps map 1's
             vmaps for LoS/vmap height in every phase, so the swap navmesh must see the same
             objects. Phase-only WMOs (the Phase2 town) are NOT in any vmap - see I-385.
    mmaps/ : empty; mmaps_generator writes 659.mmap/661.mmap + tiles here -> copy into data/mmaps.
    """
    import shutil
    for sub in ("maps", "vmaps", "mmaps"):
        d = os.path.join(stage, sub)
        if sub != "mmaps" and os.path.isdir(d):
            shutil.rmtree(d)
        os.makedirs(d, exist_ok=True)
    smaps, svmaps = os.path.join(stage, "maps"), os.path.join(stage, "vmaps")
    for map_id in swaps:
        for x in ISLAND_X:
            for y in ISLAND_Y:
                own = os.path.join(maps_dir, map_name(map_id, x, y))
                base = os.path.join(maps_dir, map_name(BASE_MAP, x, y))
                src = own if os.path.exists(own) else base
                if os.path.exists(src):
                    shutil.copyfile(src, os.path.join(smaps, map_name(map_id, x, y)))
        os.link(os.path.join(vmaps_dir, f"{BASE_MAP:03}.vmtree"), os.path.join(svmaps, f"{map_id:03}.vmtree"))
        for x in ISLAND_X:
            for y in ISLAND_Y:
                t = os.path.join(vmaps_dir, f"{BASE_MAP:03}_{x:02}_{y:02}.vmtile")
                if os.path.exists(t):
                    os.link(t, os.path.join(svmaps, f"{map_id:03}_{x:02}_{y:02}.vmtile"))
    models = 0
    for f in os.listdir(vmaps_dir):
        if not f.endswith((".vmtree", ".vmtile")):
            os.link(os.path.join(vmaps_dir, f), os.path.join(svmaps, f))
            models += 1
    print(f"staged {stage}: {len(os.listdir(smaps))} maps, "
          f"{len(os.listdir(svmaps)) - models} vmap tree/tiles, {models} models")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", default=DATA)
    ap.add_argument("--verify-base", nargs=2, type=int, metavar=("X", "Y"))
    ap.add_argument("--stage-navmesh", metavar="DIR",
                    help="build the mmaps_generator input tree for the swap maps in DIR (see stage_navmesh)")
    a = ap.parse_args()
    maps_dir = os.path.join(a.data, "maps")
    banks = liquid_soundbanks()
    tables = wxl_liquid_tables()
    swaps = zone_swap_dirs(ZONE)

    if a.verify_base:
        x, y = a.verify_base
        base = os.path.join(maps_dir, map_name(BASE_MAP, x, y))
        adt = os.path.join(OA_KALIMDOR, f"KALIMDOR_{x}_{y}.ADT")
        data, _ = convert(adt, read_base_area(base), banks, tables)
        tmp = os.path.join(os.environ.get("TMPDIR", "/tmp"), "verify_base.map")
        open(tmp, "wb").write(data)
        a_h, b_h = read_heights(tmp), read_heights(base)
        diff = max(abs(p - q) for p, q in zip(a_h, b_h))
        print(f"{os.path.basename(adt)} vs {os.path.basename(base)}: max height diff {diff:.3f} yd over {len(a_h)} verts")
        return

    written = []
    for map_id, name in swaps.items():
        src = os.path.join(MAPS_IN, name.upper())
        for f in sorted(os.listdir(src)):
            parts = f[:-4].split("_")
            if not f.lower().endswith(".adt") or len(parts) != 3:
                continue
            x, y = int(parts[1]), int(parts[2])
            base = os.path.join(maps_dir, map_name(BASE_MAP, x, y))
            data, (lo, hi) = convert(os.path.join(src, f), read_base_area(base), banks, tables)
            out = os.path.join(maps_dir, map_name(map_id, x, y))
            open(out, "wb").write(data)
            written.append((map_id, x, y))
            print(f"{f} -> {os.path.basename(out)}  height {lo:.1f}..{hi:.1f}")

    if a.stage_navmesh:
        stage_navmesh(a.stage_navmesh, maps_dir, os.path.join(a.data, "vmaps"), swaps)

if __name__ == "__main__":
    main()
