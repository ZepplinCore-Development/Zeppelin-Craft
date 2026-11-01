#!/usr/bin/env python3
"""Water check for a spawn spot from the server's extracted .map tiles (F-094 / I-451).

The heightmap gives the terrain floor, which can be the bed of a pond: Elderbark's first spawn
(2185 -3140, z 90.8 from the heightmap) stood underwater. This reads the tile's liquid section
the way AzerothCore's GridTerrainData::LoadLiquidData / GetLiquidData do and prints ground z,
liquid level and depth.

  python3 Scripts/F-094/liquid_at.py X Y [X Y ...] [--map 1]
Run from Zeppelin-Craft.
"""
import argparse
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from cli.lib.terrain_reader import MapHeightReader  # noqa: E402

MAPS = Path(__file__).resolve().parents[3] / "data" / "maps"
GRID = 533.33333
NO_TYPE, NO_HEIGHT = 0x1, 0x2


def liquid(reader, mapid, x, y):
    gx, gy = reader.world_to_grid(x, y)[:2]
    path = reader.get_grid_file(mapid, gx, gy)
    d = Path(path).read_bytes()
    off = struct.unpack_from("<11I", d, 0)[7]
    if not off:
        return None
    fourcc, flags, lflags, ltype, offx, offy, w, h, level = struct.unpack_from("<IBBHBBBBf", d, off)
    p = off + 16
    xi = int(128 * (32 - x / GRID)) & 127
    yi = int(128 * (32 - y / GRID)) & 127
    cell_flags = lflags
    if not flags & NO_TYPE:
        cell_flags = d[p + 512 + (xi >> 3) * 16 + (yi >> 3)]
        p += 512 + 256
    if not cell_flags:
        return None
    if not flags & NO_HEIGHT:
        cx, cy = xi - offy, yi - offx
        if not (0 <= cx < h and 0 <= cy < w):
            return None
        level = struct.unpack_from("<f", d, p + 4 * (cx * w + cy))[0]
    return level


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("coords", type=float, nargs="+")
    ap.add_argument("--map", type=int, default=1)
    a = ap.parse_args()
    rd = MapHeightReader(MAPS)
    pts = list(zip(a.coords[::2], a.coords[1::2]))
    for x, y in pts:
        g = rd.get_height(a.map, x, y)
        lv = liquid(rd, a.map, x, y)
        if lv is None or lv <= g:
            print(f"{x:8.1f} {y:8.1f}  ground {g:7.1f}  dry")
        else:
            print(f"{x:8.1f} {y:8.1f}  ground {g:7.1f}  WATER level {lv:7.1f}  depth {lv - g:5.1f}")


if __name__ == "__main__":
    main()
