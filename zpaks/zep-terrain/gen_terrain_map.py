#!/usr/bin/env python3
"""F-196: generate the phasemask -> child-map-dir table inside ale/ZepTerrain.lua.

Single source of truth is acore_world.phase_definitions.terrainswapmap for the Lost Isles
zone, which carries the donor's own values (see zz_[F-196]_lost_isles_terrainswapmap.sql and
goblin_gen/phase.py). We only translate the swap MAP ID to the client-side map DIRECTORY
name; nothing about the mapping is decided here.

Run from the Craft root:  python3 zpaks/zep-terrain/gen_terrain_map.py
"""
import os
import re
import sys
from pathlib import Path

ZONE = 4720

# Map id -> the child map directory shipped in zpaks/zep-lost-isles-terrain (PATCH-T).
# Ids verified against Whitemane DBFilesClient/Map.dbc.
SWAP_DIRS = {
    659: "LostIslesPhase1",   # the island destruction: 12 tiles, burning / lava / volcano smoke
    661: "LostIslesPhase2",   # the Town-In-A-Box town: 1 tile (27_30 -> map-1 51_31)
}

HERE = Path(__file__).resolve().parent
LUA = HERE / "ale" / "ZepTerrain.lua"
BEGIN = "-- >>> BEGIN GENERATED TERRAIN MAP"
END = "-- <<< END GENERATED TERRAIN MAP"


def world_conn():
    import pymysql
    from dotenv import load_dotenv
    load_dotenv(HERE.parents[1] / "cli" / ".env")
    return pymysql.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "acore"),
        passwd=os.getenv("DB_PASS", "acore"),
        db="acore_world",
        cursorclass=pymysql.cursors.DictCursor,
    )


def main():
    conn = world_conn()
    with conn.cursor() as cur:
        cur.execute(
            "SELECT phaseMask, terrainswapmap, COUNT(*) n FROM phase_definitions "
            "WHERE zoneId=%s AND terrainswapmap<>0 GROUP BY phaseMask, terrainswapmap "
            "ORDER BY phaseMask", (ZONE,))
        rows = cur.fetchall()
    conn.close()

    if not rows:
        sys.exit("no phase_definitions rows with terrainswapmap for zone %d -- apply "
                 "zz_[F-196]_lost_isles_terrainswapmap.sql first" % ZONE)

    # A phasemask must not want two different terrains.
    seen = {}
    for r in rows:
        pm, tsm = int(r["phaseMask"]), int(r["terrainswapmap"])
        if tsm not in SWAP_DIRS:
            sys.exit("phasemask %d wants unknown swap map %d -- add it to SWAP_DIRS and ship "
                     "the tiles in zep-lost-isles-terrain" % (pm, tsm))
        if pm in seen and seen[pm] != tsm:
            sys.exit("phasemask %d maps to BOTH %d and %d" % (pm, seen[pm], tsm))
        seen[pm] = tsm

    lines = [BEGIN, "local TERRAIN = {"]
    for pm in sorted(seen):
        lines.append('    [%-6d] = "%s",' % (pm, SWAP_DIRS[seen[pm]]))
    lines.append("}")
    lines.append(END)
    block = "\n".join(lines)

    src = LUA.read_text(encoding="utf8")
    pat = re.compile(re.escape(BEGIN) + r".*?" + re.escape(END), re.S)
    if not pat.search(src):
        sys.exit("markers not found in %s" % LUA)
    LUA.write_text(pat.sub(lambda _: block, src, count=1), encoding="utf8")
    print("wrote %d phasemask(s) into %s" % (len(seen), LUA))
    for pm in sorted(seen):
        print("   %-6d -> %s (map %d)" % (pm, SWAP_DIRS[seen[pm]], seen[pm]))


if __name__ == "__main__":
    main()
