#!/usr/bin/env python3
"""Tight offset fit: each map648 spawn must land on the map1 tile that carries
its OWN sub-area id. Removes the ocean-ring ambiguity."""
import sqlite3, re, math
T = 533.33333

# parse tile -> set(areas) from the scan report (Lost Isles section only)
tile_areas = {}
sec = None
for line in open("extract/adt_area_scan.txt"):
    if "LOST ISLES:" in line: sec = "lost"; continue
    if "KEZAN:" in line: sec = "kezan"; continue
    m = re.match(r"\s*\((\d+),\s*(\d+)\)\s+areas=\[([\d,\s]+)\]", line)
    if m and sec == "lost":
        x, y = int(m.group(1)), int(m.group(2))
        areas = set(int(a) for a in m.group(3).split(","))
        tile_areas[(x, y)] = areas

con = sqlite3.connect("neltharion.sqlite")
spawns = [(float(x), float(y), int(a.strip()))
          for x, y, a in con.execute(
          "SELECT position_x, position_y, area FROM creature WHERE TRIM(zone)='4720' AND TRIM(area)!=''")
          if a and a.strip().isdigit()]
# exclude generic top-level 4720 (present on almost every tile -> no constraint)
constr = [s for s in spawns if s[2] not in (4720, 4785)]
print("constrained spawns (specific sub-area):", len(constr), "of", len(spawns))

def map1_tile(x1, y1):
    return (math.floor(32 - y1 / T), math.floor(32 - x1 / T))

results = []
for di in range(20, 28):
    for dj in range(-2, 5):
        dX, dY = -dj * T, -di * T
        hits = sum(1 for x, y, a in constr
                   if a in tile_areas.get(map1_tile(x + dX, y + dY), ()))
        results.append((hits, di, dj, dX, dY))
results.sort(reverse=True)
print("\ntop candidates (area-constrained):")
for hits, di, dj, dX, dY in results[:6]:
    print("  di=%2d dj=%2d  ΔX=%+9.2f ΔY=%+10.2f  area-match %5d (%.1f%%)" %
          (di, dj, dX, dY, hits, 100.0*hits/len(constr)))

hits, di, dj, dX, dY = results[0]
print("\nBEST OFFSET (map 648 -> map 1):")
print("  map1_X = map648_X %+.4f" % dX)
print("  map1_Y = map648_Y %+.4f" % dY)
print("  map1_Z = map648_Z")
print("  (Δtiles: di=%d, dj=%d)" % (di, dj))
