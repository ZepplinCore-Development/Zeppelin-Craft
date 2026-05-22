"""
Terrain validation commands for Zeppelin-Craft CLI.

Detects creature and gameobject spawns that are underground or
inaccessible due to terrain height changes.

Commands:
    zep world terrain check    Scan spawns against terrain heightmaps
    zep world terrain fix      Generate SQL to fix underground spawns
"""

import sys
from pathlib import Path

import click

from commands.sql import run_mysql_query
from lib.terrain_reader import MapHeightReader, INVALID_HEIGHT
from lib.dbc_utils import run_sql as run_dbc_query, DBCConfig


# Default maps directory
MAPS_DIR = Path('/workspace/project/data/maps')
MMAPS_DIR = Path('/workspace/project/data/mmaps')
MMAP_QUERY_BIN = Path(__file__).parent.parent / 'lib' / 'navmesh_checker' / 'mmap_query'

# Issue ID for all terrain/off-mesh fix SQL files
TERRAIN_ISSUE_ID = 'I-170'


def _run_navmesh_check(results: list, mmaps_dir: str) -> None:
    """Batch-check results against navmesh via mmap_query subprocess.

    Adds 'navmesh' key to each result dict: 'ON_MESH', 'OFF_MESH', or 'N/A'.
    """
    import subprocess

    if not MMAP_QUERY_BIN.exists():
        raise click.ClickException(
            f"mmap_query not found at {MMAP_QUERY_BIN}\n"
            f"Build it: cd {MMAP_QUERY_BIN.parent} && ./build.sh")

    # Build stdin batch
    stdin_lines = []
    for r in results:
        stdin_lines.append(f"{r['map']} {r['x']:.4f} {r['y']:.4f} {r['z']:.4f}")
    stdin_lines.append("QUIT")

    proc = subprocess.run(
        [str(MMAP_QUERY_BIN), mmaps_dir],
        input='\n'.join(stdin_lines),
        capture_output=True, text=True, timeout=120)

    if proc.returncode != 0:
        click.echo(f"  mmap_query error: {proc.stderr.strip()}", err=True)
        for r in results:
            r['navmesh'] = 'N/A'
        return

    # Parse output lines — same order as input
    # Format: <mapId> <x> <y> <z> <ON_MESH|OFF_MESH> <dist> <zDiff> <meshX> <meshY> <meshZ> <slope>
    out_lines = proc.stdout.strip().split('\n') if proc.stdout.strip() else []
    for i, r in enumerate(results):
        if i < len(out_lines):
            parts = out_lines[i].split()
            if len(parts) >= 11:
                r['navmesh'] = parts[4]     # ON_MESH or OFF_MESH
                r['mesh_dist'] = float(parts[5])
                r['mesh_z_diff'] = float(parts[6])
                r['mesh_x'] = float(parts[7])
                r['mesh_y'] = float(parts[8])
                r['mesh_z'] = float(parts[9])
                r['mesh_slope'] = float(parts[10])
            elif len(parts) >= 10:
                r['navmesh'] = parts[4]
                r['mesh_dist'] = float(parts[5])
                r['mesh_z_diff'] = float(parts[6])
                r['mesh_x'] = float(parts[7])
                r['mesh_y'] = float(parts[8])
                r['mesh_z'] = float(parts[9])
                r['mesh_slope'] = 0.0
            else:
                r['navmesh'] = 'N/A'
                r['mesh_dist'] = -1.0
                r['mesh_z_diff'] = 0.0
                r['mesh_x'] = r['x']
                r['mesh_y'] = r['y']
                r['mesh_z'] = r['z']
                r['mesh_slope'] = 0.0
        else:
            r['navmesh'] = 'N/A'
            r['mesh_dist'] = -1.0
            r['mesh_slope'] = 0.0


def _get_dbc_config():
    """Get DBC config from .env file."""
    env_path = Path(__file__).parent.parent / '.env'
    return DBCConfig.from_env(env_path)


def _dbc_query(sql: str):
    """Run a read-only query against the live DBC database."""
    config = _get_dbc_config()
    return run_dbc_query(sql, config, config.live)


# Open-world continents where terrain validation is relevant
CONTINENT_MAPS = [
    (0, 'Eastern Kingdoms'),
    (1, 'Kalimdor'),
    (530, 'Outland'),
    (571, 'Northrend'),
]


def _pick_zone() -> str:
    """Two-step interactive zone picker: continent → zone, using TerminalMenu."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        raise click.ClickException(
            "Install simple-term-menu for interactive selection, "
            "or use --zone <name> directly")

    # Step 1: Pick continent
    continent_entries = [f"  {name}" for _, name in CONTINENT_MAPS]
    continent_entries.append("  [Cancel]")

    menu = TerminalMenu(
        continent_entries,
        title="\n  Select Continent:\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    idx = menu.show()

    if idx is None or idx == len(CONTINENT_MAPS):
        raise click.Abort()

    selected_map_id, selected_map_name = CONTINENT_MAPS[idx]

    # Step 2: Query zones for this continent
    ok, output = _dbc_query(
        f"SELECT id, name_enus FROM areatable "
        f"WHERE zone_id = 0 AND map_id = {selected_map_id} "
        f"ORDER BY name_enus"
    )
    if not ok or not output:
        raise click.ClickException(f"Failed to query zones for {selected_map_name}")

    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"No zones found for {selected_map_name}")

    zones = []
    for line in lines[1:]:
        parts = line.split('\t')
        if len(parts) >= 2:
            zones.append((int(parts[0]), parts[1]))

    zone_entries = [f"  {name}" for _, name in zones]
    zone_entries.append("  [Back]")

    menu = TerminalMenu(
        zone_entries,
        title=f"\n  Select Zone — {selected_map_name}:\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    idx = menu.show()

    if idx is None or idx == len(zones):
        # Back — restart from continent selection
        return _pick_zone()

    return zones[idx][1]


SPAWN_TYPE_CHOICES = [
    ('both', 'Creatures & Gameobjects'),
    ('creature', 'Creatures only'),
    ('gameobject', 'Gameobjects only'),
]


def _pick_spawn_type() -> str:
    """Interactive spawn type picker using TerminalMenu."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        raise click.ClickException(
            "Install simple-term-menu for interactive selection, "
            "or use --type <creature|gameobject|both> directly")

    entries = [f"  {label}" for _, label in SPAWN_TYPE_CHOICES]
    entries.append("  [Cancel]")

    menu = TerminalMenu(
        entries,
        title="\n  Select Spawn Type:\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    idx = menu.show()

    if idx is None or idx == len(SPAWN_TYPE_CHOICES):
        raise click.Abort()

    return SPAWN_TYPE_CHOICES[idx][0]


def _resolve_zone(zone_name: str, reader=None):
    """Resolve a zone name to area IDs, map ID, and coordinate bounding box.

    Flow:
      1. Look up zone by name in DBC areatable
      2. Find all child sub-areas
      3. Scan .map grid files to find which grids contain the zone's area IDs
      4. Compute a world-coordinate bounding box from those grids

    The bounding box allows the SQL query to pre-filter spawns by coordinates,
    so we don't have to pull the entire continent and filter in Python.

    Returns (map_id, area_ids_set, bbox_dict_or_none) or raises click.ClickException.
    bbox_dict: {'min_x': float, 'max_x': float, 'min_y': float, 'max_y': float}
    """
    # Find the zone by name (exact match first, then partial)
    safe_name = zone_name.replace("'", "''")
    ok, output = _dbc_query(
        f"SELECT id, name_enus, map_id FROM areatable "
        f"WHERE name_enus LIKE '{safe_name}' AND zone_id = 0"
    )
    if not ok or not output or len(output.strip().split('\n')) < 2:
        # Try partial match
        ok, output = _dbc_query(
            f"SELECT id, name_enus, map_id FROM areatable "
            f"WHERE name_enus LIKE '%{safe_name}%' AND zone_id = 0"
        )

    if not ok:
        raise click.ClickException(f"DBC query failed: {output}")
    if not output:
        raise click.ClickException(f"Zone not found: '{zone_name}'")

    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"Zone not found: '{zone_name}'")

    # If multiple matches, show them
    if len(lines) > 2:
        click.echo("Multiple zones match:", err=True)
        for line in lines[1:]:
            parts = line.split('\t')
            click.echo(f"  [{parts[0]}] {parts[1]} (map {parts[2]})", err=True)
        raise click.ClickException(
            "Ambiguous zone name. Use a more specific name.")

    parts = lines[1].split('\t')
    zone_id = int(parts[0])
    zone_display = parts[1]
    map_id = int(parts[2])

    # Find all child areas of this zone
    ok, output = _dbc_query(
        f"SELECT id FROM areatable WHERE zone_id = {zone_id}"
    )

    area_ids = {zone_id}
    if ok and output:
        for line in output.strip().split('\n')[1:]:
            area_ids.add(int(line.strip()))

    # Compute bounding box by scanning .map grid files for matching area IDs
    bbox = None
    if reader:
        bbox = _compute_zone_bbox(reader, map_id, area_ids)

    bbox_msg = ""
    if bbox:
        bbox_msg = (f", bbox X[{bbox['min_x']:.0f} to {bbox['max_x']:.0f}] "
                    f"Y[{bbox['min_y']:.0f} to {bbox['max_y']:.0f}]")
    click.echo(f"Zone: {zone_display} [ID {zone_id}] on map {map_id} "
               f"({len(area_ids)} area(s)){bbox_msg}", err=True)

    return map_id, area_ids, bbox


def _compute_zone_bbox(reader, map_id: int, area_ids: set) -> dict:
    """Scan .map grid files to find world-coordinate bounding box for a zone.

    Checks the 16x16 area map in each grid tile. If any cell in the grid
    contains one of the zone's area IDs, that grid's world-coordinate
    extent is included in the bounding box.

    This is fast — just reads the area header from each grid file,
    not the full height data.
    """
    from lib.terrain_reader import (
        SIZE_OF_GRIDS, CENTER_GRID_ID, MAX_NUMBER_OF_GRIDS,
        AREA_MAGIC, AREA_HEADER_FORMAT, AREA_HEADER_SIZE,
        MAP_AREA_NO_AREA, FILE_HEADER_FORMAT, FILE_HEADER_SIZE,
        MAP_MAGIC, MAP_VERSION
    )
    import struct

    min_gx, max_gx = 64, -1
    min_gy, max_gy = 64, -1

    maps_dir = reader.maps_dir
    for gx in range(MAX_NUMBER_OF_GRIDS):
        for gy in range(MAX_NUMBER_OF_GRIDS):
            map_file = maps_dir / f"{map_id:03d}{gx:02d}{gy:02d}.map"
            if not map_file.exists():
                continue

            try:
                with open(map_file, 'rb') as f:
                    header_data = f.read(FILE_HEADER_SIZE)
                    if len(header_data) < FILE_HEADER_SIZE:
                        continue

                    vals = struct.unpack(FILE_HEADER_FORMAT, header_data)
                    magic, version = vals[0], vals[1]
                    area_offset, area_size = vals[3], vals[4]

                    if struct.pack('<I', magic) != MAP_MAGIC or version != MAP_VERSION:
                        continue
                    if not area_offset or not area_size:
                        continue

                    f.seek(area_offset)
                    area_hdr = f.read(AREA_HEADER_SIZE)
                    if len(area_hdr) < AREA_HEADER_SIZE:
                        continue

                    fourcc, flags, grid_area = struct.unpack(AREA_HEADER_FORMAT, area_hdr)
                    if fourcc != AREA_MAGIC:
                        continue

                    # Check if this grid contains any of our target areas
                    has_zone = False
                    if flags & MAP_AREA_NO_AREA:
                        # Uniform area — just check gridArea
                        has_zone = grid_area in area_ids
                    else:
                        # Read the 16x16 area map
                        area_data = f.read(16 * 16 * 2)
                        if len(area_data) == 16 * 16 * 2:
                            area_map = struct.unpack(f'<{16*16}H', area_data)
                            has_zone = bool(area_ids.intersection(area_map))

                    if has_zone:
                        min_gx = min(min_gx, gx)
                        max_gx = max(max_gx, gx)
                        min_gy = min(min_gy, gy)
                        max_gy = max(max_gy, gy)

            except Exception:
                continue

    if max_gx < 0:
        return None

    # Convert grid indices back to world coordinates
    # grid_x = int(32 - x / 533.33) → x = (32 - grid_x) * 533.33
    # We want the full extent of matching grids, so:
    #   min world_x = (32 - (max_gx + 1)) * SIZE_OF_GRIDS  (far edge of highest grid index)
    #   max world_x = (32 - min_gx) * SIZE_OF_GRIDS         (near edge of lowest grid index)
    return {
        'min_x': (CENTER_GRID_ID - (max_gx + 1)) * SIZE_OF_GRIDS,
        'max_x': (CENTER_GRID_ID - min_gx) * SIZE_OF_GRIDS,
        'min_y': (CENTER_GRID_ID - (max_gy + 1)) * SIZE_OF_GRIDS,
        'max_y': (CENTER_GRID_ID - min_gy) * SIZE_OF_GRIDS,
    }

# Map ID -> name for display
MAP_NAMES = {
    0: 'Eastern Kingdoms',
    1: 'Kalimdor',
    13: 'Test',
    25: 'Scott Test',
    29: 'CashTest',
    30: 'Alterac Valley',
    33: 'Shadowfang Keep',
    34: 'Stormwind Stockade',
    35: 'StormwindPrison',
    36: 'Deadmines',
    37: 'Azshara Crater',
    42: 'Collin\'s Test',
    43: 'Wailing Caverns',
    44: 'Monastery',
    47: 'Razorfen Kraul',
    48: 'Blackfathom Deeps',
    70: 'Uldaman',
    90: 'Gnomeregan',
    109: 'Sunken Temple',
    129: 'Razorfen Downs',
    169: 'Emerald Dream',
    189: 'Scarlet Monastery',
    209: 'Zul\'Farrak',
    229: 'Blackrock Spire',
    230: 'Blackrock Depths',
    249: 'Onyxia\'s Lair',
    269: 'Caverns of Time',
    289: 'Scholomance',
    309: 'Zul\'Gurub',
    329: 'Stratholme',
    349: 'Maraudon',
    369: 'Deeprun Tram',
    389: 'Ragefire Chasm',
    409: 'Molten Core',
    429: 'Dire Maul',
    449: 'Alliance PVP Barracks',
    450: 'Horde PVP Barracks',
    469: 'Blackwing Lair',
    489: 'Warsong Gulch',
    509: 'Ruins of Ahn\'Qiraj',
    529: 'Arathi Basin',
    530: 'Outland',
    531: 'Ahn\'Qiraj Temple',
    532: 'Karazhan',
    533: 'Naxxramas',
    534: 'The Battle for Mount Hyjal',
    540: 'Hellfire Citadel: The Shattered Halls',
    542: 'Hellfire Citadel: The Blood Furnace',
    543: 'Hellfire Citadel: Ramparts',
    544: 'Magtheridon\'s Lair',
    545: 'Coilfang: The Steamvault',
    546: 'Coilfang: The Underbog',
    547: 'Coilfang: The Slave Pens',
    548: 'Coilfang: Serpentshrine Cavern',
    550: 'Tempest Keep',
    552: 'Tempest Keep: The Arcatraz',
    553: 'Tempest Keep: The Botanica',
    554: 'Tempest Keep: The Mechanar',
    555: 'Auchindoun: Shadow Labyrinth',
    556: 'Auchindoun: Sethekk Halls',
    557: 'Auchindoun: Mana-Tombs',
    558: 'Auchindoun: Auchenai Crypts',
    559: 'Nagrand Arena',
    560: 'The Escape From Durnholde',
    562: 'Blade\'s Edge Arena',
    564: 'Black Temple',
    565: 'Gruul\'s Lair',
    566: 'Eye of the Storm',
    568: 'Zul\'Aman',
    571: 'Northrend',
    574: 'Utgarde Keep',
    575: 'Utgarde Pinnacle',
    576: 'The Nexus',
    578: 'The Oculus',
    580: 'Sunwell Plateau',
    585: 'Magisters\' Terrace',
    595: 'The Culling of Stratholme',
    599: 'Halls of Stone',
    600: 'Drak\'Tharon Keep',
    601: 'Azjol-Nerub',
    602: 'Halls of Lightning',
    603: 'Ulduar',
    604: 'Gundrak',
    607: 'Strand of the Ancients',
    608: 'Violet Hold',
    609: 'Ebon Hold',
    615: 'The Obsidian Sanctum',
    616: 'The Eye of Eternity',
    617: 'Dalaran Sewers',
    618: 'The Ring of Valor',
    619: 'Ahn\'kahet: The Old Kingdom',
    624: 'Vault of Archavon',
    628: 'Isle of Conquest',
    631: 'Icecrown Citadel',
    632: 'The Forge of Souls',
    649: 'Trial of the Crusader',
    650: 'Trial of the Champion',
    658: 'Pit of Saron',
    668: 'Halls of Reflection',
    724: 'The Ruby Sanctum',
}


@click.group()
@click.pass_context
def terrain(ctx):
    """Terrain validation tools (F-170)."""
    pass


@terrain.command('check')
@click.option('--type', '-t', 'spawn_type', type=click.Choice(['creature', 'gameobject', 'both']),
              default=None, help='Type of spawns to check (prompted if not given)')
@click.option('--map', '-m', 'map_id', type=int, default=None,
              help='Only check spawns on this map ID')
@click.option('--zone', '-z', 'zone_name', type=str, default=None,
              help='Zone name (prompted if not given)')
@click.option('--limit', '-l', type=int, default=None,
              help='Limit number of results shown')
@click.option('--entry', '-e', type=int, default=None,
              help='Only check spawns with this entry ID')
@click.option('--maps-dir', type=click.Path(exists=True), default=str(MAPS_DIR),
              help='Path to extracted maps directory')
@click.option('--mmaps-dir', type=click.Path(exists=True), default=str(MMAPS_DIR),
              help='Path to mmaps directory')
@click.pass_context
def terrain_check(ctx, spawn_type, map_id, limit, entry, zone_name, maps_dir, mmaps_dir):
    """Scan spawns for navmesh accessibility.

    Checks every spawn in a zone against the navigation mesh. Any spawn
    that is OFF_MESH (not on walkable terrain) is reported as a defect.
    Terrain delta (distance from ground surface) is shown for context.

    Examples:
        zep world terrain check --zone "Un'Goro Crater"
        zep world terrain check --type gameobject --zone Elwynn
    """
    if not spawn_type:
        spawn_type = _pick_spawn_type()
    if not zone_name:
        zone_name = _pick_zone()

    reader = MapHeightReader(Path(maps_dir))

    # Resolve zone name to area IDs and bounding box
    zone_map_id, zone_area_ids, zone_bbox = _resolve_zone(zone_name, reader)
    if map_id is None:
        map_id = zone_map_id
    elif map_id != zone_map_id:
        raise click.ClickException(
            f"Zone '{zone_name}' is on map {zone_map_id}, "
            f"but --map {map_id} was specified")

    # Collect all spawns in zone
    all_spawns = []
    tables = []
    if spawn_type in ('creature', 'both'):
        tables.append(('creature', 'guid', 'id1', 'map', 'position_x', 'position_y', 'position_z'))
    if spawn_type in ('gameobject', 'both'):
        tables.append(('gameobject', 'guid', 'id', 'map', 'position_x', 'position_y', 'position_z'))

    for table, guid_col, entry_col, map_col, x_col, y_col, z_col in tables:
        click.echo(f"Querying {table} spawns...", err=True)

        where_parts = []
        if map_id is not None:
            where_parts.append(f"c.{map_col} = {map_id}")
        if entry is not None:
            where_parts.append(f"c.{entry_col} = {entry}")
        if zone_bbox:
            where_parts.append(f"c.{x_col} BETWEEN {zone_bbox['min_x']:.2f} AND {zone_bbox['max_x']:.2f}")
            where_parts.append(f"c.{y_col} BETWEEN {zone_bbox['min_y']:.2f} AND {zone_bbox['max_y']:.2f}")

        where_clause = f" WHERE {' AND '.join(where_parts)}" if where_parts else ""

        if table == 'creature':
            name_join = f"LEFT JOIN creature_template ct ON c.{entry_col} = ct.entry"
        else:
            name_join = f"LEFT JOIN gameobject_template ct ON c.{entry_col} = ct.entry"

        query = (
            f"SELECT c.{guid_col}, c.{entry_col}, ct.name, "
            f"c.{map_col}, c.{x_col}, c.{y_col}, c.{z_col} "
            f"FROM {table} c {name_join}{where_clause}"
        )

        ok, output = run_mysql_query(query)
        if not ok:
            click.echo(f"Error querying {table}: {output}", err=True)
            continue
        if not output:
            click.echo(f"  No {table} spawns found matching criteria", err=True)
            continue

        lines = output.strip().split('\n')
        if len(lines) < 2:
            continue

        zone_filtered = 0
        skipped = 0
        for line in lines[1:]:
            parts = line.split('\t')
            if len(parts) < 7:
                continue

            guid = int(parts[0])
            entry_id = int(parts[1])
            name = parts[2] if parts[2] != 'NULL' else '(unknown)'
            spawn_map = int(parts[3])
            pos_x = float(parts[4])
            pos_y = float(parts[5])
            pos_z = float(parts[6])

            if zone_area_ids is not None:
                area_id = reader.get_area(spawn_map, pos_x, pos_y)
                if area_id not in zone_area_ids:
                    zone_filtered += 1
                    continue

            terrain_z = reader.get_height(spawn_map, pos_x, pos_y)
            if terrain_z == INVALID_HEIGHT:
                skipped += 1
                continue

            all_spawns.append({
                'type': table,
                'guid': guid,
                'entry': entry_id,
                'name': name,
                'map': spawn_map,
                'x': pos_x,
                'y': pos_y,
                'z': pos_z,
                'terrain_z': terrain_z,
                'delta': pos_z - terrain_z,
            })

        zone_msg = f", Zone filtered: {zone_filtered}" if zone_area_ids else ""
        table_count = len([s for s in all_spawns if s['type'] == table])
        click.echo(f"  Found {table_count} {table} spawn(s) in zone, Skipped: {skipped}{zone_msg}", err=True)

    if not all_spawns:
        click.echo("\nNo spawns found to check.", err=True)
        return

    # ── Navmesh check ────────────────────────────────────────────────────
    click.echo(f"\nChecking {len(all_spawns)} spawn(s) against navmesh...", err=True)
    _run_navmesh_check(all_spawns, mmaps_dir)

    # Filter to OFF_MESH only
    results = [s for s in all_spawns if s.get('navmesh') == 'OFF_MESH']
    on_mesh = len(all_spawns) - len(results)
    click.echo(f"  {on_mesh} OK, {len(results)} OFF_MESH", err=True)

    if not results:
        click.echo("\nAll spawns are on walkable navmesh.", err=True)
        return

    # Sort by X coordinate for spatial grouping
    results.sort(key=lambda r: r['x'])

    if limit:
        results = results[:limit]

    # ── Output ───────────────────────────────────────────────────────────
    click.echo(f"\n{'Type':<10} {'GUID':<8} {'Entry':<8} {'Name':<26} "
               f"{'X':>10} {'Y':>10} {'Spawn Z':>9} {'Terr Z':>9} "
               f"{'Delta':>8} {'MeshDist':>9}")
    click.echo("-" * 126)

    for r in results:
        name_display = r['name'][:24] + '..' if len(r['name']) > 26 else r['name']
        delta = r['delta']
        delta_color = 'red' if delta < -5 else 'yellow' if delta > 5 else None
        click.echo(
            f"{r['type']:<10} {r['guid']:<8} {r['entry']:<8} {name_display:<26} "
            f"{r['x']:>10.1f} {r['y']:>10.1f} {r['z']:>9.2f} {r['terrain_z']:>9.2f} "
            f"{click.style('{:>7.2f}'.format(delta), fg=delta_color)} "
            f"{r.get('mesh_dist', -1):>9.2f}"
        )

    click.echo(f"\n{len(results)} off-mesh spawn(s) found")


@terrain.command('fix')
@click.option('--type', '-t', 'spawn_type', type=click.Choice(['creature', 'gameobject', 'both']),
              default=None, help='Type of spawns to fix (prompted if not given)')
@click.option('--map', '-m', 'map_id', type=int, default=None,
              help='Only fix spawns on this map ID')
@click.option('--zone', '-z', 'zone_name', type=str, default=None,
              help='Zone name (prompted if not given)')
@click.option('--offset', type=float, default=None,
              help='Z offset above terrain (default: 0.5 for gameobjects, 0.0 for creatures)')
@click.option('--entry', '-e', type=int, default=None,
              help='Only fix spawns with this entry ID')
@click.option('--maps-dir', type=click.Path(exists=True), default=str(MAPS_DIR),
              help='Path to extracted maps directory')
@click.option('--mmaps-dir', type=click.Path(exists=True), default=str(MMAPS_DIR),
              help='Path to mmaps directory')
@click.pass_context
def terrain_fix(ctx, spawn_type, map_id, offset, entry, zone_name, maps_dir, mmaps_dir):
    """Fix off-mesh spawns by moving them to nearest walkable navmesh point.

    Generates two SQL files per zone/type in open-azeroth zpak:
        z_[AUTO,I-170]_mesh_raw_<type>_<zone>.sql  — stock positions (revert)
        zz_[AUTO,I-170]_mesh_fix_<type>_<zone>.sql — navmesh-corrected positions

    Re-running automatically resets to stock first, then re-scans.

    Examples:
        zep world terrain fix --zone "Un'Goro Crater"
        zep world terrain fix --type gameobject --zone Elwynn
    """
    import re as _re

    if not spawn_type:
        spawn_type = _pick_spawn_type()
    if not zone_name:
        zone_name = _pick_zone()

    reader = MapHeightReader(Path(maps_dir))

    # Resolve zone name to area IDs and bounding box
    zone_map_id, zone_area_ids, zone_bbox = _resolve_zone(zone_name, reader)
    if map_id is None:
        map_id = zone_map_id
    elif map_id != zone_map_id:
        raise click.ClickException(
            f"Zone '{zone_name}' is on map {zone_map_id}, "
            f"but --map {map_id} was specified")

    # Reset to stock positions if raw files exist (so re-runs scan from original)
    craft_root = Path(__file__).parent.parent.parent
    zpak_sql_dir = craft_root / 'zpaks' / 'patch-open-azeroth' / 'sql'
    zone_slug = _re.sub(r'[^a-z0-9]+', '_', zone_name.lower()).strip('_')
    issue_tag = TERRAIN_ISSUE_ID

    reset_types = []
    if spawn_type in ('creature', 'both'):
        reset_types.append('creature')
    if spawn_type in ('gameobject', 'both'):
        reset_types.append('gameobject')

    for stype in reset_types:
        raw_file = zpak_sql_dir / f"z_[AUTO,{issue_tag}]_mesh_raw_{stype}_{zone_slug}.sql"
        if raw_file.exists():
            click.echo(f"Resetting {stype} to stock positions ({raw_file.name})...", err=True)
            from commands.sql import execute_sql_file
            ok, msg, ms = execute_sql_file(raw_file)
            if ok:
                click.echo(f"  Reset OK ({ms}ms)", err=True)
            else:
                click.echo(f"  Reset failed: {msg}", err=True)

    # Collect all spawns in zone
    all_spawns = []
    tables = []
    if spawn_type in ('creature', 'both'):
        tables.append(('creature', 'guid', 'id1', 'map', 'position_x', 'position_y', 'position_z'))
    if spawn_type in ('gameobject', 'both'):
        tables.append(('gameobject', 'guid', 'id', 'map', 'position_x', 'position_y', 'position_z'))

    for table, guid_col, entry_col, map_col, x_col, y_col, z_col in tables:
        click.echo(f"Querying {table} spawns...", err=True)

        where_parts = []
        if map_id is not None:
            where_parts.append(f"c.{map_col} = {map_id}")
        if entry is not None:
            where_parts.append(f"c.{entry_col} = {entry}")
        if zone_bbox:
            where_parts.append(f"c.{x_col} BETWEEN {zone_bbox['min_x']:.2f} AND {zone_bbox['max_x']:.2f}")
            where_parts.append(f"c.{y_col} BETWEEN {zone_bbox['min_y']:.2f} AND {zone_bbox['max_y']:.2f}")

        where_clause = f" WHERE {' AND '.join(where_parts)}" if where_parts else ""

        query = (
            f"SELECT c.{guid_col}, c.{entry_col}, c.{map_col}, "
            f"c.{x_col}, c.{y_col}, c.{z_col} "
            f"FROM {table} c{where_clause}"
        )

        ok, result = run_mysql_query(query)
        if not ok:
            click.echo(f"Error querying {table}: {result}", err=True)
            continue
        if not result:
            continue

        lines = result.strip().split('\n')
        if len(lines) < 2:
            continue

        zone_filtered = 0
        skipped = 0
        for line in lines[1:]:
            parts = line.split('\t')
            if len(parts) < 6:
                continue

            guid = int(parts[0])
            entry_id = int(parts[1])
            spawn_map = int(parts[2])
            pos_x = float(parts[3])
            pos_y = float(parts[4])
            pos_z = float(parts[5])

            if zone_area_ids is not None:
                area_id = reader.get_area(spawn_map, pos_x, pos_y)
                if area_id not in zone_area_ids:
                    zone_filtered += 1
                    continue

            terrain_z = reader.get_height(spawn_map, pos_x, pos_y)
            if terrain_z == INVALID_HEIGHT:
                skipped += 1
                continue

            z_off = offset if offset is not None else (0.5 if table == 'gameobject' else 0.0)
            all_spawns.append({
                'type': table,
                'guid': guid,
                'entry': entry_id,
                'map': spawn_map,
                'x': pos_x,
                'y': pos_y,
                'z': pos_z,
                'terrain_z': terrain_z,
                'delta': pos_z - terrain_z,
                'guid_col': guid_col,
                'z_col': z_col,
                'z_offset': z_off,
            })

        table_count = len([s for s in all_spawns if s['type'] == table])
        click.echo(f"  Found {table_count} {table} spawn(s) in zone", err=True)

    if not all_spawns:
        click.echo("\nNo spawns found.", err=True)
        return

    # Navmesh check
    click.echo(f"\nChecking {len(all_spawns)} spawn(s) against navmesh...", err=True)
    _run_navmesh_check(all_spawns, mmaps_dir)

    # Flag both OFF_MESH and ON_MESH-but-steep as needing fixes
    # mmap_query already does flat-surface fallback for steep polys
    MAX_SLOPE = 40.0  # degrees — above this the spawn is on a cliff face
    off_mesh = [s for s in all_spawns if s.get('navmesh') == 'OFF_MESH']
    steep_on_mesh = [s for s in all_spawns
                     if s.get('navmesh') == 'ON_MESH'
                     and s.get('mesh_slope', 0) > MAX_SLOPE]
    ok_count = len(all_spawns) - len(off_mesh) - len(steep_on_mesh)

    if steep_on_mesh:
        click.echo(f"  {ok_count} OK, {len(off_mesh)} OFF_MESH, "
                    f"{len(steep_on_mesh)} on steep cliff (>{MAX_SLOPE:.0f}°)", err=True)
    else:
        click.echo(f"  {ok_count} OK, {len(off_mesh)} OFF_MESH", err=True)

    # Combine both lists — all need fixing
    needs_fix = off_mesh + steep_on_mesh

    if not needs_fix:
        click.echo("\nNo fixes needed — all spawns are on flat navmesh.", err=True)
        return

    off_mesh = needs_fix

    # ── Generate SQL files per spawn type ────────────────────────────────
    #
    # Two files per zone/type:
    #   z_[AUTO,I-170]_mesh_raw_<type>_<zone>.sql  — restores stock positions (z_ runs first)
    #   zz_[AUTO,I-170]_mesh_fix_<type>_<zone>.sql — applies navmesh-corrected positions
    #
    # The raw file preserves original DB positions so fixes can be reverted
    # without a full world rebuild. On re-run, existing raw entries are kept
    # (preserving the true stock value) and new guids are appended.

    # Look up object/creature names for all entries
    name_map = {}  # (type, entry) -> name
    for stype in set(s['type'] for s in off_mesh):
        entries = sorted(set(s['entry'] for s in off_mesh if s['type'] == stype))
        if not entries:
            continue
        template_table = f"{stype}_template"
        entry_list = ','.join(str(e) for e in entries)
        ok, result = run_mysql_query(
            f"SELECT entry, name FROM {template_table} WHERE entry IN ({entry_list})")
        if ok and result:
            for line in result.strip().split('\n')[1:]:
                parts = line.split('\t', 1)
                if len(parts) == 2:
                    name_map[(stype, int(parts[0]))] = parts[1]

    written_files = []
    spawn_types_in_results = sorted(set(s['type'] for s in off_mesh))

    for stype in spawn_types_in_results:
        type_results = [s for s in off_mesh if s['type'] == stype]
        if not type_results:
            continue

        raw_filename = f"z_[AUTO,{issue_tag}]_mesh_raw_{stype}_{zone_slug}.sql"
        fix_filename = f"zz_[AUTO,{issue_tag}]_mesh_fix_{stype}_{zone_slug}.sql"
        raw_filepath = zpak_sql_dir / raw_filename
        fix_filepath = zpak_sql_dir / fix_filename

        # Load existing raw entries (preserve stock positions from prior runs)
        existing_raw = {}  # guid -> raw SQL line
        if raw_filepath.exists():
            for line in raw_filepath.read_text().splitlines():
                line = line.strip()
                if not line.startswith('UPDATE'):
                    continue
                # Extract guid from WHERE clause
                m = _re.search(r'WHERE `\w+` = (\d+)', line)
                if m:
                    existing_raw[int(m.group(1))] = line

        # Build raw + fix entries
        raw_lines = [
            f"-- Auto-generated by terrain fix ({issue_tag})",
            f"-- Zone: {zone_name}, Type: {stype}",
            f"-- Stock/original positions — run this to revert fixes",
            "",
        ]
        fix_lines = [
            f"-- Auto-generated by terrain fix ({issue_tag})",
            f"-- Zone: {zone_name}, Type: {stype}, Count: {len(type_results)}",
            f"-- Moves off-mesh spawns to nearest walkable navmesh point",
            "",
        ]

        spawn_cmd_prefix = ".gobject add temp" if stype == 'gameobject' else ".npc add temp"

        for s in type_results:
            guid = s['guid']
            guid_col = s['guid_col']
            z_col = s['z_col']
            entry_id = s['entry']
            obj_name = name_map.get((stype, entry_id), f'Unknown {stype}')

            # Raw: keep existing stock position if we've seen this guid before
            if guid in existing_raw:
                raw_lines.append(existing_raw[guid])
            else:
                raw_lines.append(
                    f"UPDATE `{stype}` SET "
                    f"`position_x` = {s['x']:.6f}, "
                    f"`position_y` = {s['y']:.6f}, "
                    f"`{z_col}` = {s['z']:.6f} "
                    f"WHERE `{guid_col}` = {guid};"
                )

            # Fix: navmesh-corrected position
            mesh_x = s['mesh_x']
            mesh_y = s['mesh_y']
            mesh_z = s['mesh_z'] + s['z_offset']
            fix_lines.append(f"-- {obj_name} (guid {guid}, entry {entry_id}) — moved {s['mesh_dist']:.1f} yds")
            fix_lines.append(
                f"UPDATE `{stype}` SET "
                f"`position_x` = {mesh_x:.6f}, "
                f"`position_y` = {mesh_y:.6f}, "
                f"`{z_col}` = {mesh_z:.6f} "
                f"WHERE `{guid_col}` = {guid};")
            fix_lines.append(f"-- .go xyz {mesh_x:.1f} {mesh_y:.1f} {mesh_z:.1f} {s['map']}")
            fix_lines.append(f"-- {spawn_cmd_prefix} {entry_id}")
            fix_lines.append("")

        raw_filepath.write_text('\n'.join(raw_lines) + '\n')
        fix_filepath.write_text('\n'.join(fix_lines) + '\n')
        written_files.extend([raw_filepath, fix_filepath])
        click.echo(f"  Wrote {raw_filename}", err=True)
        click.echo(f"  Wrote {fix_filename} ({len(type_results)} fixes)", err=True)

    # ── Apply via zep world sql changed ──────────────────────────────────
    click.echo(f"\nApplying via sql changed...", err=True)
    import subprocess
    result = subprocess.run(
        [sys.executable, '-m', 'cli.zep', 'world', 'sql', 'changed'],
        cwd=str(craft_root),
        capture_output=True, text=True)

    if result.returncode == 0:
        click.echo(click.style(
            f"Applied {len(off_mesh)} fix(es) successfully", fg='green'), err=True)
        click.echo(f"\nSQL files in zpak:", err=True)
        for f in written_files:
            click.echo(f"  {f.relative_to(craft_root)}", err=True)
    else:
        click.echo(click.style(f"Error applying: {result.stderr.strip()}", fg='red'), err=True)
        click.echo("SQL files were still written — apply manually with: zep world sql changed", err=True)
        sys.exit(1)


@terrain.command('height')
@click.argument('map_id', type=int)
@click.argument('x', type=float)
@click.argument('y', type=float)
@click.option('--maps-dir', type=click.Path(exists=True), default=str(MAPS_DIR),
              help='Path to extracted maps directory')
def terrain_height(map_id, x, y, maps_dir):
    """Query terrain height at a specific coordinate.

    Useful for debugging and spot-checking.

    Examples:
        zep world terrain height 0 -8949.95 -132.493
        zep world terrain height 571 5807.0 588.0
    """
    reader = MapHeightReader(Path(maps_dir))
    height = reader.get_height(map_id, x, y)

    map_name = MAP_NAMES.get(map_id, f'Map {map_id}')

    if height == INVALID_HEIGHT:
        click.echo(f"No terrain data at ({x}, {y}) on {map_name} [{map_id}]")
    else:
        grid_x, grid_y, local_x, local_y = reader.world_to_grid(x, y)
        click.echo(f"Map:      {map_name} [{map_id}]")
        click.echo(f"World:    ({x:.4f}, {y:.4f})")
        click.echo(f"Grid:     ({grid_x}, {grid_y})")
        click.echo(f"Height:   {height:.6f}")
