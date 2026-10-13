"""
NPC wardrobe commands (F-198): dress character-model NPCs in retail items.

Commands:
    zep wardrobe build     Build every outfit manifest in a zpak (assets, bakes, SQL)
    zep wardrobe item      Show how a retail item would import (what 3.3.5 can show)
    zep wardrobe pool      List the stock appearance pool for a race/sex

Manifests live in <zpak>/outfits/*.json. `kind` is "unique" (one appearance) or
"uniform" (up to 10 variants of one outfit). See the F-198 Joplin note for the format.
"""

import json
from pathlib import Path

import click

from lib.env import ASSET_LIBRARY_PATH

CLI_DIR = Path(__file__).parent.parent
CRAFT_ROOT = CLI_DIR.parent
ENV_PATH = CRAFT_ROOT / 'Scripts' / 'Patch Builder' / '.env'
TOOLS_ROOT = ASSET_LIBRARY_PATH.parent.parent
RETAIL_BUILD = '12.1.0.69875'
RETAIL_CACHE = TOOLS_ROOT / 'wago-retail-cache'
LISTFILE = TOOLS_ROOT / 'Retroport' / 'retroport_tools' / 'MultiConverter2' / 'listfile.csv'
WXL_CORE = TOOLS_ROOT / 'WarcraftXL' / 'wxl-core-main'
# client roots below our zpak, highest priority first (character/item art only): every ENABLED zpak's
# source assets by priority, then the Asset Library. Not just the HD pack: the client loads the custom
# orc skins' faces from zep-legacy (F-150), and the Asset Library holds an older classic file of the
# same name (OrcMaleFaceLower00_101) that baked a classic face onto the HD orc.
def _external_roots():
    from commands.sql import get_enabled_zpaks_by_priority
    roots = [CRAFT_ROOT / 'zpaks' / n / 'mpq' / 'source-assets' for n, _m in reversed(get_enabled_zpaks_by_priority(CRAFT_ROOT))]
    return [r for r in roots if r.is_dir() and r.parent.parent.name != 'zep-npc-wardrobe'] + [ASSET_LIBRARY_PATH]


EXTERNAL_ROOTS = _external_roots()


def _dbc_query_fn(database_attr: str):
    from lib.dbc_utils import DBCConfig, DBCConnection
    config = DBCConfig.from_env(ENV_PATH)
    conn = DBCConnection(config).get_connection(getattr(config, database_attr))

    def query(sql):
        cur = conn.cursor(dictionary=True)
        cur.execute(sql)
        rows = cur.fetchall()
        cur.close()
        return rows
    return query


def _world_query(sql):
    from commands.sql import run_mysql_query
    ok, out = run_mysql_query(sql)
    if not ok:
        raise click.ClickException(f'world query failed: {out}\n{sql}')
    lines = [l for l in out.splitlines() if l]
    if not lines:
        return []
    hdr = lines[0].split('\t')
    return [dict(zip(hdr, l.split('\t'))) for l in lines[1:]]


def _retail(build):
    from lib.wardrobe.retail import RetailData
    return RetailData(RETAIL_CACHE, build, LISTFILE)


@click.group()
def wardrobe():
    """NPC wardrobe: dress character-model NPCs in retail items (F-198)."""
    pass


@wardrobe.command('build')
@click.option('--zpak', 'zpak_name', default='zep-npc-wardrobe', show_default=True)
@click.option('--retail-build', default=RETAIL_BUILD, show_default=True)
def wardrobe_build(zpak_name, retail_build):
    """Build all outfit manifests in a zpak.

    Regenerates [AUTO,<task>] DBC/world SQL, item assets and NPC bakes, and removes
    files a previous build produced that are no longer needed. Apply afterwards with
    `zep dbc db apply --changed`, `zep world sql changed`, `zep build patch-mpq -p Z --parse-build`.
    """
    from lib.wardrobe.builder import WardrobeBuilder
    from lib.wardrobe.m2 import ensure_harness

    zpak = CRAFT_ROOT / 'zpaks' / zpak_name
    manifests = sorted((zpak / 'outfits').glob('*.json'))
    if not manifests:
        raise click.ClickException(f'no manifests in {zpak / "outfits"}')
    retail = _retail(retail_build)
    harness = ensure_harness(retail.dir, WXL_CORE)
    b = WardrobeBuilder(zpak, retail, EXTERNAL_ROOTS, _dbc_query_fn('live'), _dbc_query_fn('original'),
                        _world_query, harness, echo=click.echo)
    try:
        files = b.build(manifests)
    except (ValueError, FileNotFoundError) as e:
        raise click.ClickException(str(e))
    written = []
    for task, fs in files.items():
        for sub in ('dbc', 'sql'):
            for old in (zpak / sub).glob(f'*[[]AUTO,{task}]*'):
                if f'{sub}/{old.name}' not in fs:
                    old.unlink()
                    click.echo(f'   removed stale {sub}/{old.name}')
        for rel, content in fs.items():
            p = zpak / rel
            if not p.exists() or p.read_text() != content:
                p.write_text(content)
                written.append(rel)
    removed = b.finish()
    click.echo(f'\nSQL changed: {", ".join(written) or "none"}')
    if removed:
        click.echo(f'Removed {len(removed)} stale asset(s): ' + ', '.join(removed))
    click.echo(f'Assets: {len(b.produced)} files (asset_provenance.json)')


@wardrobe.command('item')
@click.argument('item_id', type=int)
@click.option('--mod', type=int, default=None, help='ItemAppearanceModifierID (default: lowest)')
@click.option('--race', type=int, default=2, show_default=True, help='Race used to filter race-specific parts')
@click.option('--retail-build', default=RETAIL_BUILD, show_default=True)
def wardrobe_item(item_id, mod, race, retail_build):
    """Show a retail item's parts and which ones 3.3.5 can show."""
    it = _retail(retail_build).resolve_item(item_id, mod)
    click.echo(f'{it.item_id} {it.name} | slot {it.slot} | appearance mod {it.appearance_mod} | display {it.display_id} | geosets {it.geosets[:3]}')
    regions = sorted({t.region for t in it.textures if t.race in (0, race)})
    if regions:
        click.echo(f'  textures  ✓ {", ".join(regions)}')
    for m in it.models:
        if m.race not in (0, race) and it.slot != 'helm':
            continue
        folder = (m.path or '?/?/?').split('/')[2]
        ok = it.slot in ('shoulders', 'weapon', 'helm')
        click.echo(f'  model     {"✓" if ok else "✗"} {m.path}' + ('' if ok else f'  ({folder}: no 3.3.5 support)'))


@wardrobe.command('pool')
@click.option('--race', type=int, required=True)
@click.option('--gender', type=int, required=True)
def wardrobe_pool(race, gender):
    """List the stock appearances (with shipped HD bakes) uniform manifests draw from."""
    from lib.wardrobe.builder import WardrobeBuilder
    b = WardrobeBuilder(CRAFT_ROOT / 'zpaks' / 'zep-npc-wardrobe', None, EXTERNAL_ROOTS, _dbc_query_fn('live'),
                        _dbc_query_fn('original'), _world_query, None)
    pool = b.appearance_pool(race, gender)
    for p in pool:
        click.echo(f'  extra {p["source_extra"]:>6}: skin {p["skin_color"]} face {p["face_type"]} '
                   f'hair {p["hair_style"]}/{p["hair_color"]} facial {p["facial_hair"]}')
    click.echo(f'{len(pool)} distinct appearances')
