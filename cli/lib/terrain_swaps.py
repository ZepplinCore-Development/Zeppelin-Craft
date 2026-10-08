"""F-196 terrain swaps: which maps a zone swaps its terrain to, and where their tiles live.

Both answers come from data, never from a table in code:
  - WHAT swaps:  acore_world.phase_definitions.terrainswapmap (phasemask -> swap map id, per zone)
  - WHERE:       the live DBC Map.directory of each swap map id (659 -> LostIslesPhase1)

Used by zpaks/zep-terrain/gen_terrain_map.py (the client driver's phasemask table) and
zpaks/zep-lost-isles-terrain/build_server_maps.py (server .map files + navmesh staging), so a new
swap map needs a phase_definitions row and a Map.dbc row - nothing else.
"""
import sys
from pathlib import Path

CLI = Path(__file__).resolve().parents[1]
if str(CLI) not in sys.path:
    sys.path.insert(0, str(CLI))

from commands.sql import run_mysql_query          # noqa: E402
from lib.dbc_utils import DBCConfig, run_sql      # noqa: E402


def _rows(ok_out):
    ok, out = ok_out
    if not ok:
        raise SystemExit(f"query failed: {out}")
    lines = [l for l in out.splitlines() if l.strip()]
    return [l.split("\t") for l in lines[1:]]     # drop the header row


def zone_swap_rows(zone_id):
    """[(phasemask, swap_map_id)] for every phase_definitions row of the zone that swaps terrain."""
    return [(int(pm), int(m)) for pm, m in _rows(run_mysql_query(
        "SELECT DISTINCT phaseMask, terrainswapmap FROM phase_definitions "
        f"WHERE zoneId = {int(zone_id)} AND terrainswapmap <> 0 ORDER BY phaseMask"))]


def swap_map_dirs(map_ids):
    """{map_id: client directory} from the live DBC Map table. Exits if a map has no row."""
    ids = sorted(set(int(m) for m in map_ids))
    if not ids:
        return {}
    config = DBCConfig.from_env(CLI / ".env")
    dirs = {int(i): d for i, d in _rows(run_sql(
        f"SELECT id, directory FROM map WHERE id IN ({','.join(map(str, ids))})", config, config.live))}
    missing = [m for m in ids if m not in dirs]
    if missing:
        raise SystemExit(f"swap map(s) {missing} have no row in the DBC Map table - add Map.dbc rows first")
    return dirs


def zone_swap_dirs(zone_id):
    """{swap_map_id: client directory} for every map the zone swaps to."""
    return swap_map_dirs(m for _, m in zone_swap_rows(zone_id))
