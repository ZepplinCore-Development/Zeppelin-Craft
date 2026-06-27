"""
Build operations for Zeppelin-Craft CLI.

Commands:
    zep build patch-mpq            Build client patches (MPQ files)
    zep build patch-register       Manage patch register
    zep build mpq-tools            MPQ archive operations
    zep build exe                  WoW.exe binary patcher
"""

import time
from pathlib import Path
from typing import Dict, List, Optional

import click

from lib.logging_config import get_logger
from lib.manifest import load_manifest
from lib.patch_builder import (
    build_patch as run_patch_build,
    discover_patches,
    get_zpak_parsed_assets,
    get_zpak_preprocessors,
)
from lib.patch_register import (
    DEFAULT_NGINX_PATH,
    format_register_summary,
    get_patch_output_path,
    load_register,
    regenerate_register,
    save_register,
    update_patch_entry,
)

logger = get_logger('commands.build')


@click.group(invoke_without_command=True)
@click.pass_context
def build(ctx):
    """Build operations."""
    if ctx.invoked_subcommand is None:
        # Interactive: choose patch-mpq or patch-register
        choice = _top_level_menu()
        if choice == 'patch-mpq':
            ctx.invoke(build_patch)
        elif choice == 'patch-register':
            ctx.invoke(build_register, show=True)


# =============================================================================
# build patch
# =============================================================================

@build.command('patch-mpq')
@click.option('--patch', '-p', 'patch_letter',
              help='Patch letter to build (e.g., Z, O, B)')
@click.option('--build', '-b', 'build_only', is_flag=True,
              help='Pack existing parsed-assets into MPQ (no preprocessing)')
@click.option('--parse', is_flag=True,
              help='Run preprocessors only (no packing)')
@click.option('--parse-build', 'parse_build', is_flag=True,
              help='Run preprocessors then pack into MPQ')
@click.option('--dry-run', '-n', is_flag=True,
              help='Show what would be built without building')
@click.pass_context
def build_patch(ctx, patch_letter: Optional[str],
                build_only: bool, parse: bool, parse_build: bool,
                dry_run: bool):
    """Build client patches (MPQ files).

    Interactive mode walks through patch selection and build options.
    Flags allow fully non-interactive builds for scripting.

    Examples:
        zep build patch-mpq                     # Interactive guided flow
        zep build patch-mpq -p Z               # Select PATCH-Z, choose build mode
        zep build patch-mpq -p Z --build       # Pack PATCH-Z (no preprocessing)
        zep build patch-mpq -p Z --parse       # Run preprocessors only (no pack)
        zep build patch-mpq -p Z --parse-build # Run preprocessors then pack
        zep build patch-mpq --dry-run          # Preview what would be built
    """
    # --parse = preprocessors only (no pack)
    # --parse-build = preprocessors + pack
    parse_only = False
    if parse:
        parse_only = True  # --parse means preprocess only
    if parse_build:
        parse = True       # --parse-build means preprocess + pack
        parse_only = False
    craft_root = ctx.obj['craft_root']
    nginx_path = DEFAULT_NGINX_PATH

    # Discover patches
    patches = discover_patches(craft_root)
    if not patches:
        click.echo("No zpaks with client_patch assignments found")
        return

    # Load register
    register = load_register(nginx_path)

    # --- Step 1: Select patch ---
    if patch_letter:
        letter = patch_letter.upper()
        if letter not in patches:
            click.echo(f"No zpaks assigned to PATCH-{letter}")
            click.echo(f"Available: {', '.join(sorted(patches.keys()))}")
            return
        selected = [letter]
        # If no explicit mode flags, show build mode menu
        if not parse and not build_only and not dry_run:
            mode = _build_mode_menu(letter, patches, register, nginx_path)
            if mode is None:
                return
            modes = {letter: mode}
        else:
            modes = {letter: {'parse': parse, 'parse_only': parse_only}}
    else:
        # Interactive: pick a patch
        result = _select_patch_menu(patches, register, nginx_path)
        if result is None:
            return
        if result == 'ALL':
            selected = sorted(patches.keys())
            all_mode = _build_all_mode_menu(patches)
            if all_mode is None:
                return
            modes = {letter: all_mode.copy() for letter in selected}
        else:
            selected = [result]
            # Show build mode menu
            mode = _build_mode_menu(result, patches, register, nginx_path)
            if mode is None:
                return
            modes = {result: mode}

    if dry_run:
        click.echo("\n[DRY RUN] Preview of build operations:\n")

    # --- Step 2: Build selected patches ---
    start = time.time()
    built = 0
    failed = 0
    built_patches = []

    # Capture old versions before building
    old_versions = {}
    for letter in selected:
        patch_name = f"PATCH-{letter}.MPQ"
        old_versions[patch_name] = register.get('patches', {}).get(patch_name, {}).get('version', 0)

    for letter in selected:
        zpaks = patches[letter]
        patch_name = f"PATCH-{letter}.MPQ"
        zpak_names = ', '.join(z['name'] for z in zpaks)
        mode = modes.get(letter, {})

        click.echo(f"\n{'=' * 60}")
        click.echo(f"  {patch_name}  ({zpak_names})")
        click.echo(f"{'=' * 60}")

        ok = run_patch_build(letter, zpaks, nginx_path, register,
                             parse=mode.get('parse', False),
                             parse_only=mode.get('parse_only', False),
                             dry_run=dry_run)

        if ok:
            built += 1
            built_patches.append(patch_name)
        else:
            failed += 1

    # Save register and regenerate to keep in sync with manifests
    if not dry_run and built > 0:
        if save_register(register, nginx_path):
            for pname in built_patches:
                new_ver = register.get('patches', {}).get(pname, {}).get('version', '?')
                old_ver = old_versions.get(pname, 0)
                click.echo(f"\n{pname} register updated (v{old_ver} -> v{new_ver})")
        else:
            click.echo(click.style("\nWarning: Failed to save patch register", fg='yellow'))

        # Auto-regenerate to sync metadata from zpak manifests
        regen = regenerate_register(craft_root, nginx_path)
        orphans = regen.get('orphans', [])
        if orphans:
            click.echo(f"  Cleaned {len(orphans)} orphan register entries")

        # PATCH-Z just exported the DBC database to .dbc files; regenerate the
        # talent browser from that same data so client + web stay in sync.
        if 'PATCH-Z.MPQ' in built_patches:
            click.echo(f"\n{'=' * 60}")
            click.echo("  Talent Tree Browser (F-185)")
            click.echo(f"{'=' * 60}")
            try:
                _deploy_talent_browser(ctx, nginx_path / 'talents')
            except Exception as e:
                click.echo(click.style(
                    f"  Talent browser regen failed (patch build OK): {e}", fg='yellow'))

        # PATCH-I carries the custom icons; sync them into the desktop TalentEditor's
        # on-disk overlay so new custom talent icons show there (no editor rebuild).
        if 'PATCH-I.MPQ' in built_patches:
            click.echo(f"\n{'=' * 60}")
            click.echo("  TalentEditor Icon Sync")
            click.echo(f"{'=' * 60}")
            try:
                _sync_talent_editor_icons(ctx)
            except Exception as e:
                click.echo(click.style(
                    f"  TalentEditor icon sync failed (patch build OK): {e}", fg='yellow'))

    # Summary
    elapsed = time.time() - start
    click.echo(f"\n{'=' * 60}")
    if dry_run:
        click.echo(f"  [DRY RUN] Would build {built} patch(es)")
    elif failed == 0 and built > 0:
        click.echo(click.style(f"  Built {built} patch(es) in {elapsed:.1f}s", fg='green'))
    elif failed > 0:
        click.echo(click.style(
            f"  Built {built}, failed {failed} in {elapsed:.1f}s", fg='yellow'))

# Tell zep-menu.py to skip flag picker — this command has its own interactive menus
build_patch.menu_passthrough = True


# =============================================================================
# Interactive Menus
# =============================================================================

def _top_level_menu() -> Optional[str]:
    """Show top-level build menu: client or register."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        click.echo("Specify a subcommand: client, register, all")
        return None

    options = [
        "Patch MPQ         Build MPQ patch files",
        "Patch Register    View patch versions and checksums",
    ]

    menu = TerminalMenu(
        options,
        title="\n  zep build\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    result = menu.show()

    if result is None:
        return None
    return ['patch-mpq', 'patch-register'][result]


def _select_patch_menu(patches: dict, register: dict,
                        nginx_path: Path) -> Optional[str]:
    """Show patch selection menu. Returns letter, 'ALL', or None."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        click.echo("Specify --patch <letter> (e.g., -p Z)")
        return None

    options = []
    letters = []

    for letter in sorted(patches.keys()):
        zpaks = patches[letter]
        patch_name = f"PATCH-{letter}.MPQ"
        reg_entry = register.get('patches', {}).get(patch_name, {})

        name = reg_entry.get('name', zpaks[0]['name'])

        # File size
        output_path = get_patch_output_path(nginx_path, patch_name, register)
        if output_path.exists():
            size_mb = output_path.stat().st_size / (1024 * 1024)
            size_str = f"{size_mb/1024:.1f} GB" if size_mb >= 1024 else f"{size_mb:.0f} MB"
        else:
            size_str = "not built"

        option = f"PATCH-{letter}   {name[:30]:<30} {size_str:>10}"
        options.append(option)
        letters.append(letter)

    options.append("Build All")

    menu = TerminalMenu(
        options,
        title="\n  Select a patch to build:\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    result = menu.show()

    if result is None:
        return None
    if result == len(options) - 1:  # "Build All"
        return 'ALL'
    return letters[result]


def _build_mode_menu(letter: str, patches: dict, register: dict,
                     nginx_path: Path) -> Optional[dict]:
    """Show build mode options for a specific patch.

    All patches get the same menu structure. If the patch has
    preprocessors or source-assets, shows Process + Build options.
    Otherwise just Build.

    Returns dict with mode flags, or None if cancelled.
    """
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        return {'parse': False}

    zpaks = patches.get(letter, [])
    patch_name = f"PATCH-{letter}.MPQ"
    reg_entry = register.get('patches', {}).get(patch_name, {})
    name = reg_entry.get('name', zpaks[0]['name'] if zpaks else letter)

    # Check if any zpak has source-assets or named preprocessors
    has_source_assets = any(
        (Path(z['path']) / 'mpq' / 'source-assets').exists()
        for z in zpaks
    )
    all_preprocessors = []
    for z in zpaks:
        all_preprocessors.extend(get_zpak_preprocessors(z))

    options = []
    modes = []

    if has_source_assets or all_preprocessors:
        # Build preprocessor summary for display
        steps = ['resource-parser']
        steps.extend(all_preprocessors)
        steps_str = ', '.join(steps)

        options = [
            "Build            Pack existing parsed-assets into MPQ",
            "Process          Run preprocessors only (no pack)",
            "Process + Build  Run preprocessors, then pack into MPQ",
        ]
        modes = [
            {'parse': False},
            {'parse': True, 'parse_only': True},
            {'parse': True},
        ]

        # Show what preprocessors will run
        title = f"\n  PATCH-{letter} — {name}\n  Preprocessors: {steps_str}\n"
    else:
        options = [
            f"Build            Pack into {patch_name}",
        ]
        modes = [
            {'parse': False},
        ]
        title = f"\n  PATCH-{letter} — {name}\n"

    menu = TerminalMenu(
        options,
        title=title,
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    result = menu.show()

    if result is None:
        return None
    return modes[result]


def _build_all_mode_menu(patches: dict) -> Optional[dict]:
    """Show build mode options when building all patches.

    Checks if any patch has a preprocessor and offers parse options
    accordingly. Returns dict with mode flags, or None if cancelled.
    """
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        return {'quick': False, 'parse': False}

    has_source_assets = any(
        (Path(z['path']) / 'mpq' / 'source-assets').exists()
        for zpaks in patches.values()
        for z in zpaks
    )

    options = []
    modes = []

    if has_source_assets:
        options = [
            "Build            Pack all patches from existing parsed-assets",
            "Process + Build  Run preprocessors first, then pack all",
            "Process Only     Run preprocessors only (no packing)",
        ]
        modes = [
            {'parse': False},
            {'parse': True},
            {'parse': True, 'parse_only': True},
        ]
    else:
        options = [
            "Build All        Pack all patches",
        ]
        modes = [
            {'parse': False},
        ]

    menu = TerminalMenu(
        options,
        title="\n  Build All Patches\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    result = menu.show()

    if result is None:
        return None
    return modes[result]


# =============================================================================
# build register
# =============================================================================

@build.command('patch-register')
@click.option('--show', '-s', is_flag=True, help='Show current patch versions')
@click.option('--update', '-u', is_flag=True,
              help='Recalculate checksums and sizes for all existing patches')
@click.option('--regenerate', '-r', is_flag=True,
              help='Regenerate register from zpak manifests, removing orphan entries')
@click.option('--dry-run', '-n', is_flag=True,
              help='Preview changes without modifying files (use with --regenerate)')
@click.pass_context
def build_register(ctx, show, update, regenerate, dry_run):
    """Manage the patch register.

    The patch register tracks version, checksum, and size metadata
    for each MPQ patch file. The launcher uses this for update detection.

    Examples:
        zep build patch-register --show              # Show current state
        zep build patch-register --update            # Recalculate all checksums
        zep build patch-register --regenerate        # Sync register with zpak manifests
        zep build patch-register -r --dry-run        # Preview regeneration
    """
    craft_root = ctx.obj['craft_root']
    nginx_path = DEFAULT_NGINX_PATH

    if regenerate:
        _run_regenerate(craft_root, nginx_path, dry_run)
        return

    register = load_register(nginx_path)

    if show or (not show and not update):
        click.echo(f"\nPatch Register ({nginx_path / 'patch_register.json'})\n")
        click.echo(format_register_summary(register, nginx_path))
        click.echo()
        return

    if update:
        patches = register.get('patches', {})
        updated = 0

        for patch_name, entry in patches.items():
            output_path = get_patch_output_path(nginx_path, patch_name, register)
            if output_path.exists():
                update_patch_entry(register, patch_name, output_path)
                updated += 1
                click.echo(f"  Updated {patch_name}: "
                           f"{entry.get('size_mb', 0)} MB, "
                           f"checksum {entry.get('checksum', '')[:12]}...")

        if save_register(register, nginx_path):
            click.echo(click.style(f"\nUpdated {updated} patch(es)", fg='green'))
        else:
            click.echo(click.style("\nFailed to save register", fg='red'))


def _run_regenerate(craft_root: Path, nginx_path: Path, dry_run: bool):
    """Execute register regeneration and display results."""
    prefix = "[DRY RUN] " if dry_run else ""

    click.echo(f"\n{prefix}Regenerating patch register from zpak manifests...\n")

    result = regenerate_register(craft_root, nginx_path, dry_run=dry_run)

    synced = result['synced']
    orphans = result['orphans']
    deleted_files = result['deleted_files']

    # Show synced entries
    if synced:
        click.echo(f"  {prefix}Synced {len(synced)} patch(es) from zpak manifests:")
        for key in synced:
            entry = result['register']['patches'][key]
            mpq_path = nginx_path / ('mandatory' if entry.get('is_mandatory') else 'optional') / key
            status = "ready" if mpq_path.exists() else "missing"
            click.echo(f"    {key:<16} {entry.get('name', '?'):<24} {status}")

    # Show orphans
    if orphans:
        click.echo(f"\n  {prefix}Removed {len(orphans)} orphan(s) (no matching zpak):")
        for key in orphans:
            click.echo(f"    {key}")

    # Show deleted files
    if deleted_files:
        click.echo(f"\n  {prefix}Deleted {len(deleted_files)} orphan MPQ file(s):")
        for path in deleted_files:
            click.echo(f"    {path}")
    elif orphans:
        click.echo(f"\n  No orphan MPQ files found on disk")

    # Summary
    click.echo()
    if dry_run:
        click.echo(click.style(
            f"[DRY RUN] Would sync {len(synced)} entries, "
            f"remove {len(orphans)} orphans, "
            f"delete {len(deleted_files)} MPQ files",
            fg='yellow'))
    else:
        click.echo(click.style(
            f"Register regenerated: {len(synced)} entries synced, "
            f"{len(orphans)} orphans removed, "
            f"{len(deleted_files)} MPQ files deleted",
            fg='green'))


# =============================================================================
# build atlasloot
# =============================================================================

@build.command('add-atlasloot')
@click.option('--dry-run', '-n', is_flag=True, help='Preview without modifying files')
@click.option('--verbose', '-v', is_flag=True, help='Detailed output')
@click.option('--rep', type=str, default=None,
              help='Generate rep vendor tables. Use "all", "tbc", or a faction name (e.g., CExpedition)')
@click.pass_context
def build_atlasloot(ctx, dry_run, verbose, rep):
    """Generate AtlasLoot Lua tables from database."""
    craft_root = ctx.obj['craft_root']
    addon_dir = craft_root / 'zpaks' / 'add-atlasloot' / 'mpq' / 'source-assets' / 'Interface' / 'AddOns'

    if not addon_dir.exists():
        click.echo(click.style(f"AddOns directory not found: {addon_dir}", fg='red'))
        raise SystemExit(1)

    from lib.atlasloot.core import run

    # Build targets based on options
    if rep:
        # Rep-only mode: only generate reputation vendor tables
        targets = {'rep': rep}
    else:
        targets = None  # Default: generate all boss loot (original behavior)

    success, failed = run(addon_base_dir=addon_dir, dry_run=dry_run,
                          targets=targets, verbose=verbose)

    if success > 0:
        click.echo(click.style(f"\nDone: {success} succeeded, {failed} failed", fg='green'))
    else:
        click.echo(click.style(f"\nFailed: 0 sections succeeded", fg='red'))
        raise SystemExit(1)



# =============================================================================
# Talent Tree Browser deploy (F-185)
# =============================================================================

def _deploy_talent_browser(ctx, dest: Path, database: str = 'live',
                           overwrite_icons: bool = False) -> bool:
    """Build + deploy the talent browser to dest. Returns True on success.

    Shared by the `talent-browser` command and the PATCH-Z post-build hook.
    The browser reads the live DBC database, which the PATCH-Z build has just
    exported to .dbc files, so the two stay in sync.
    """
    from lib.talent_export import deploy_site
    from commands.dbc import get_dbc_config

    craft_root = ctx.obj['craft_root']
    src = craft_root / 'web' / 'talent-browser'
    if not src.is_dir():
        click.echo(click.style(f"  Talent browser source not found: {src}", fg='yellow'))
        return False

    config = get_dbc_config(ctx)
    click.echo(f"  Exporting talents from {getattr(config, database, config.live)} -> {dest}")
    result = deploy_site(src, Path(dest), config, database=database,
                         overwrite_icons=overwrite_icons)
    data, icons = result['data'], result['icons']
    n_trees = sum(len(c['trees']) for c in data['classes'])
    n_talents = sum(len(t['talents']) for c in data['classes'] for t in c['trees'])
    click.echo(click.style(
        f"  {len(data['classes'])} classes, {n_trees} trees, {n_talents} talents, "
        f"{len(icons['converted'])} icons", fg='green'))
    if icons['missing']:
        click.echo(click.style(f"  Missing source BLP: {len(icons['missing'])}", fg='yellow'))
    if icons['failed']:
        click.echo(click.style(f"  Failed to decode: {len(icons['failed'])}", fg='yellow'))
    return True


def _sync_talent_editor_icons(ctx, overwrite: bool = False) -> bool:
    """Convert custom-zpak icons to PNG into the desktop TalentEditor overlay.

    The editor (Zeppelin-Tools/TalentEditor) embeds the stock icon set at build
    time but also reads a `custom_icons/` folder next to its binary at runtime.
    Dropping custom PNGs there makes new custom talent icons appear without
    rebuilding the editor. Run automatically at the end of a PATCH-I build.
    """
    from lib.talent_export import sync_editor_icons
    from commands.dbc import get_dbc_config

    craft_root = ctx.obj['craft_root']
    editor_root = craft_root.parent / 'Zeppelin-Tools' / 'TalentEditor'
    if not editor_root.is_dir():
        click.echo(click.style(f"  TalentEditor not found: {editor_root}", fg='yellow'))
        return False

    dest = editor_root / 'custom_icons'
    config = get_dbc_config(ctx)
    res = sync_editor_icons(config, dest, overwrite=overwrite)
    # 'missing' = talent icons not in the custom dirs (i.e. stock, already embedded).
    click.echo(f"  Custom talent icons -> {dest}")
    click.echo(click.style(
        f"  {len(res['converted'])} custom converted, "
        f"{len(res['missing'])} stock (embedded, skipped), {len(res['failed'])} failed",
        fg='green'))
    if res['failed']:
        click.echo(click.style(f"  Failed to decode: {', '.join(res['failed'][:8])}", fg='yellow'))
    return True


@build.command('talent-editor-icons')
@click.option('--overwrite', is_flag=True, help='Re-convert even if a PNG already exists')
@click.pass_context
def build_talent_editor_icons(ctx, overwrite):
    """Sync custom icons into the desktop TalentEditor overlay folder.

    Also runs automatically at the end of a PATCH-I build.
    """
    if not _sync_talent_editor_icons(ctx, overwrite=overwrite):
        raise click.ClickException("TalentEditor icon sync failed")


@build.command('talent-browser')
@click.option('--target', '-t', 'target', type=click.Path(), default=None,
              help='Deploy directory (default: <NGINX_PATH>/talents)')
@click.option('--database', '-d', 'database',
              type=click.Choice(['live', 'original', 'expected', 'scratch']),
              default='live', help='Source DBC database (default: live)')
@click.option('--overwrite-icons', is_flag=True,
              help='Re-convert icons even if a PNG already exists')
@click.pass_context
def build_talent_browser(ctx, target, database, overwrite_icons):
    """Deploy the Talent Tree Browser to the nginx webroot.

    Copies the static front-end (web/talent-browser) and regenerates
    data/talents.json + data/icons from the DBC database. Served at
    <site>/talents/. Also run automatically at the end of a PATCH-Z build.
    """
    from lib.env import NGINX_PATH

    dest = Path(target) if target else (NGINX_PATH / 'talents')
    if not _deploy_talent_browser(ctx, dest, database, overwrite_icons):
        raise click.ClickException("Talent browser deploy failed")
    click.echo(click.style(f"\nDeployed to {dest}", fg='green'))
    click.echo("Served at <site>/talents/  (ensure nginx /talents/ location is configured)")


# =============================================================================
# build tooltip-data  (F-190 Phase 1 — classifier / generator)
# =============================================================================

def _load_world_scaling():
    """Load SP/AP coefficients + F-189 stat scaling from acore_world.

    Returns (spell_bonus, stat_scaling, base_mana):
      spell_bonus  : {entry: {direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus}}
      stat_scaling : {spell_id: [{eff_index, stat_id, coeff}, ...]} — empty if the
                     F-189 `spell_stat_scaling` table does not exist yet.
      base_mana    : {classId: {level: basemana}} — for %-mana cost (player_class_stats).
    """
    from commands import sql as sqlmod
    try:
        import mysql.connector
    except ImportError:
        return {}, {}, {}

    conn = mysql.connector.connect(
        host=sqlmod.DB_HOST, port=int(sqlmod.DB_PORT),
        user=sqlmod.DB_USER, password=sqlmod.DB_PASS, database=sqlmod.DB_NAME,
    )
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus "
                "FROM spell_bonus_data")
    spell_bonus = {int(r["entry"]): r for r in cur.fetchall()}

    stat_scaling = {}
    try:
        cur.execute("SELECT spell_id, eff_index, stat_id, coeff FROM spell_stat_scaling")
        for r in cur.fetchall():
            stat_scaling.setdefault(int(r["spell_id"]), []).append(r)
    except mysql.connector.Error:
        pass  # F-189 spell_stat_scaling not created yet — fold in once it lands.

    base_mana = {}
    cur.execute("SELECT Class, Level, BaseMana FROM player_class_stats")
    for r in cur.fetchall():
        base_mana.setdefault(int(r["Class"]), {})[int(r["Level"])] = int(r["BaseMana"])
    cur.close()
    conn.close()
    return spell_bonus, stat_scaling, base_mana


@build.command('tooltip-data')
@click.option('--spell', '-s', 'spell_ids', multiple=True, type=int,
              help='Report classification for specific spell ID(s). Repeatable.')
@click.option('--family', '-f', 'family', type=int, default=None,
              help='Limit the Lua/report output to one SpellFamily (spell_class_set).')
@click.option('--out', '-o', 'out_path', type=click.Path(), default=None,
              help='Write the generated Lua data table to this path.')
@click.option('--database', '-d', 'database',
              type=click.Choice(['live', 'original', 'expected', 'scratch']),
              default='live', help='Source DBC database (default: live).')
@click.pass_context
def build_tooltip_data(ctx, spell_ids, family, out_path, database):
    """F-190 Phase 1: classify spells for the addon-driven tooltip engine.

    Builds the reverse-107/108 spellmod index from the DBC `spell` table and
    reports, per spell, the modifiers that affect it, whether it is
    casterDependent (ALE routing), and whether it carries a Class-C DUMMY
    effect (a generator blind spot). With --out, emits the Lua data table.
    """
    from commands.dbc import get_dbc_config
    from lib.dbc_utils import DBCConnection
    from lib import tooltip_gen as tg

    config = get_dbc_config(ctx)
    db_name = getattr(config, database, config.live)

    click.echo(f"Loading DBC `spell` from `{db_name}` ...")
    with DBCConnection(config) as db_conn:
        conn = db_conn.get_connection(db_name)
        cursor = conn.cursor(dictionary=True)
        cols = "`, `".join(tg.SPELL_COLUMNS)
        cursor.execute(f"SELECT `{cols}` FROM `spell`")
        spells = {int(r["ID"]): r for r in cursor.fetchall()}
        cursor.execute("SELECT `id`, `max_duration` FROM `spellduration`")
        durs = {int(r["id"]): int(r["max_duration"] or 0) for r in cursor.fetchall()}
        cursor.execute("SELECT `id`, `radius` FROM `spellradius`")
        rads = {int(r["id"]): float(r["radius"] or 0) for r in cursor.fetchall()}
        # talent rank -> spell map: lets the addon detect learned talent ranks via the talent
        # API even when the rank spell is a hidden passive (attr 0x80) IsSpellKnown can't see.
        rank_cols = "`, `".join("rank_%d" % i for i in range(1, 10))
        cursor.execute(f"SELECT `id`, `{rank_cols}` FROM `talent`")
        talent_rows = cursor.fetchall()
        cursor.close()
    # resolve $d duration (sec) and $aN radius (yards) per spell for desc templates
    for r in spells.values():
        r["_dur"] = durs.get(int(r.get("duration_index") or 0), 0) // 1000
        r["_rad"] = {i: rads.get(int(r.get(f"effect_radius_index_{i}") or 0), 0)
                     for i in (1, 2, 3) if rads.get(int(r.get(f"effect_radius_index_{i}") or 0), 0)}

    click.echo(f"Loaded {len(spells)} spells. Building reverse-107/108 index ...")
    mod_index = tg.build_modifier_index(spells)
    click.echo(f"Indexed {len(mod_index)} spellmod effects.")

    # --- Phase 1b: SP/AP coefficients + F-189 stat scaling (acore_world) ---
    spell_bonus, stat_scaling, base_mana = _load_world_scaling()
    click.echo(f"Loaded {len(spell_bonus)} spell_bonus_data rows; "
               f"{len(stat_scaling)} spell_stat_scaling spell(s).\n")

    def _classify(sid):
        return tg.classify(sid, spells, mod_index, spell_bonus, stat_scaling)

    # --- targeted report ---
    for sid in spell_ids:
        rec = _classify(sid)
        if rec is None:
            click.echo(click.style(f"  spell {sid}: NOT FOUND", fg='red'))
            continue
        if rec["casterDependent"]:
            cd = click.style("casterDependent", fg='yellow') + f" ({', '.join(rec['reasons'])})"
        else:
            cd = "self-only"
        dummy = click.style(" [DUMMY/Class-C!]", fg='red') if rec["dummyWarning"] else ""
        click.echo(f"  {sid}  {rec['name']}  (fam {rec['family']})  -> {cd}{dummy}")
        for m in rec["mods"]:
            click.echo(f"        <- spellmod {m['src']} {m['src_name']} "
                       f"[{m['kind']} op={m['op_name']} base={m['base']} eff{m['eff']}]")
        if rec["sp_ap"]:
            click.echo(f"        <- sp_ap {rec['sp_ap']}")
        if rec["stat_scaling"]:
            click.echo(f"        <- stat_scaling {rec['stat_scaling']}")
        if rec.get("weapon"):
            click.echo(f"        <- weapon {rec['weapon']}")
        if not rec["casterDependent"]:
            click.echo("        (locally derivable — no caster-dependent scaling)")

    # --- Lua emission ---
    if out_path or family is not None:
        if family is not None:
            scope_ids = [sid for sid, r in spells.items()
                         if tg._i(r, "spell_class_set") == family]
        elif spell_ids:
            scope_ids = list(spell_ids)
        else:
            scope_ids = list(spells.keys())

        records = [r for r in (_classify(s) for s in scope_ids) if r]
        dummies = [r for r in records if r["dummyWarning"]]
        if dummies:
            click.echo(click.style(
                f"\n  WARNING: {len(dummies)} spell(s) in scope carry a DUMMY effect "
                f"(Class-C blind spot — not derivable from DBC).", fg='yellow'))

        # Ship only records the addon can act on: weapon/stat_scaling (renderable now)
        # or casterDependent (drives aura-tt ALE routing). Inert self-only spells are
        # dropped — the addon no-ops on a missing key anyway, so this is lossless.
        emit = [r for r in records
                if r["casterDependent"] or r.get("renderable")]
        lua = (tg.emit_lua(emit) + "\n" + tg.emit_talent_ranks(emit, talent_rows)
               + "\n" + tg.emit_base_mana(base_mana))
        if out_path:
            Path(out_path).write_text(lua, encoding='utf-8')
            click.echo(click.style(
                f"\nWrote {len(emit)} of {len(records)} records "
                f"(dropped {len(records) - len(emit)} inert) -> {out_path}", fg='green'))
            # lazy-loaded desc/tt templates -> sibling ZepTooltipsDesc sub-addon (only for a
            # real addon-dir output; scratch --out paths just get the hot table)
            out_p = Path(out_path)
            if out_p.parent.name == "ZepTooltips":
                desc_path = out_p.parent.parent / "ZepTooltipsDesc" / "GeneratedDesc.lua"
                desc_path.parent.mkdir(parents=True, exist_ok=True)
                desc_path.write_text(tg.emit_desc(emit), encoding='utf-8')
                click.echo(click.style(f"Wrote desc/tt templates -> {desc_path}", fg='green'))
        else:
            click.echo("\n" + lua)
