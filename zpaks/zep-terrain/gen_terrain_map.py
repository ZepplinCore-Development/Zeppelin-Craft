#!/usr/bin/env python3
"""F-196: generate the phasemask -> child-map-dir table inside ale/ZepTerrain.lua.

Nothing about the mapping is decided here. cli/lib/terrain_swaps.py reads it from data:
acore_world.phase_definitions.terrainswapmap (the donor's own values - see
zz_[F-196]_lost_isles_terrainswapmap.sql and goblin_gen/phase.py) says which map each phasemask
swaps to, and the DBC Map.directory of that map is the client-side directory name.
zpaks/zep-lost-isles-terrain/build_server_maps.py reads the same helper for the server side.

Run from the Craft root:  python3 zpaks/zep-terrain/gen_terrain_map.py
"""
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parents[1] / "cli"))
from lib.terrain_swaps import swap_map_dirs, zone_swap_rows   # noqa: E402

ZONE = 4720

LUA = HERE / "ale" / "ZepTerrain.lua"
BEGIN = "-- >>> BEGIN GENERATED TERRAIN MAP"
END = "-- <<< END GENERATED TERRAIN MAP"


def main():
    rows = zone_swap_rows(ZONE)
    if not rows:
        sys.exit("no phase_definitions rows with terrainswapmap for zone %d -- apply "
                 "zz_[F-196]_lost_isles_terrainswapmap.sql first" % ZONE)
    swap_dirs = swap_map_dirs(m for _, m in rows)

    # A phasemask must not want two different terrains.
    seen = {}
    for pm, tsm in rows:
        if pm in seen and seen[pm] != tsm:
            sys.exit("phasemask %d maps to BOTH %d and %d" % (pm, seen[pm], tsm))
        seen[pm] = tsm

    lines = [BEGIN, "local TERRAIN = {"]
    for pm in sorted(seen):
        lines.append('    [%-6d] = "%s",' % (pm, swap_dirs[seen[pm]]))
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
        print("   %-6d -> %s (map %d)" % (pm, swap_dirs[seen[pm]], seen[pm]))


if __name__ == "__main__":
    main()
