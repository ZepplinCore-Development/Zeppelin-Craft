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
    format_version,
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
                click.echo(f"\n{pname} register updated "
                           f"(v{format_version(old_ver)} -> v{format_version(new_ver)})")
        else:
            click.echo(click.style("\nWarning: Failed to save patch register", fg='yellow'))

        # F-219: patches are symlinked into the test client, so only a NEW letter needs this.
        from commands.client import refresh_if_present
        refresh_if_present()

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
# build skin-check (F-151)
# =============================================================================

@build.command('skin-check')
@click.option('--race', '-r', 'races', multiple=True, type=int, help='Race id(s) to check (default: playable 1-11)')
@click.option('--sex', '-s', 'sexes', multiple=True, type=int, help='Sex id(s): 0 male, 1 female (default: both)')
@click.option('--colour', '-c', 'colours', multiple=True, type=int, help='Only report these skin colours')
@click.option('--face', '-f', 'faces', multiple=True, type=int, help='Only report these face types (face findings)')
@click.option('--baked', is_flag=True, help='Also run the baked-marking detector (slow: aim it with -r/-s)')
@click.pass_context
def skin_check_cmd(ctx, races, sexes, colours, faces, baked):
    """Check the playable character skins as a build would ship them.

    Resolves every CharSections texture through the enabled zpaks' parsed-assets in patch load order over the
    stock client: missing / undecodable files and HD models wearing classic art are errors; faces off-colour
    from their body, stray dark blobs, missing face types and duplicate rows are warnings. Writes
    logs/skin_check/report.txt, findings.json and faces.png (a sheet of every flagged face - look at it).
    Runs before packing PATCH-L and PATCH-Q (errors stop the build) and PATCH-Z (report only).

    \b
    --baked adds the F-230 baked-marking detector (a skin or face carrying paint / tattoos its plain siblings
    lack). It compares each skin with its race/sex siblings, so it always analyses a whole race and sex
    (cached), then reports only the --colour / --face you name. Builds never run it. Example, checking the
    skins an agent just reworked:
        zep build skin-check --baked -r 4 -s 0 -c 33 -c 40 -f 5
    """
    from lib import skin_check
    errors, text, png = skin_check.run(ctx.obj['craft_root'], races or skin_check.PLAYABLE, baked=baked,
                                       sexes=set(sexes) or None, colours=set(colours) or None,
                                       faces=set(faces) or None)
    click.echo(text)
    if png:
        click.echo(f'\nflagged faces: {png}')
    if errors:
        raise SystemExit(1)


# =============================================================================
# build register
# =============================================================================

@build.command('adt-place')
@click.option('--recipe', '-r', 'recipe_path', required=True,
              type=click.Path(exists=True, dir_okay=False),
              help='adt_placements.json to apply')
@click.option('--dry-run', '-n', is_flag=True, help='Report what would change, write nothing')
@click.option('--force', is_flag=True,
              help='Apply even if the tile no longer matches base_sha256')
@click.pass_context
def build_adt_place(ctx, recipe_path, dry_run, force):
    """Apply WMO/doodad placements to ADT tiles from a tracked recipe (F-209).

    ADT binaries are gitignored, so a Noggit edit leaves nothing reviewable.
    This replays placements from JSON and records the resulting sha256, the
    same provenance model as model_transforms.json (F-203). A recipe's `wdt`
    section sets or clears WDT MPHD flags the same way (I-119).
    """
    from lib.adt_placement import apply_recipe, apply_wdt_recipe, load_recipe, sha256

    craft_root = Path(__file__).resolve().parents[2]
    recipe_file = Path(recipe_path)
    recipe = load_recipe(recipe_file)
    target = craft_root / 'zpaks' / recipe['target_zpak'] / 'mpq' / 'parsed-assets'

    changed = False
    for rel, entry in recipe.get('wdt', {}).items():
        wdt = target / rel
        if not wdt.exists():
            raise click.ClickException(f'WDT not found: {wdt}')
        try:
            out, stats = apply_wdt_recipe(wdt, entry, strict=not force)
        except ValueError as exc:
            raise click.ClickException(str(exc))

        if stats.get('skipped'):
            click.echo(f'  {rel}: {stats["skipped"]}')
            continue

        click.echo(f'  {rel}: MPHD flags {stats["old_flags"]:#x} -> {stats["flags"]:#x}')
        if dry_run:
            click.echo(f'    [DRY RUN] would become {stats["result_sha256"][:16]}')
            continue
        wdt.write_bytes(out)
        if entry.get('result_sha256') != stats['result_sha256']:
            entry['result_sha256'] = stats['result_sha256']
            changed = True

    for rel, entry in recipe.get('placements', {}).items():
        adt = target / rel
        if not adt.exists():
            raise click.ClickException(f'tile not found: {adt}')
        try:
            out, stats = apply_recipe(adt, entry, strict=not force)
        except ValueError as exc:
            raise click.ClickException(str(exc))

        if stats.get('skipped'):
            click.echo(f'  {rel}: {stats["skipped"]}')
            continue

        click.echo(f'  {rel}: +{stats["wmos_added"]} WMO, +{stats["doodads_added"]} doodad, '
                   f'{stats["chunks_touched"]} MCNK updated, {stats["size_delta"]:+d} bytes')
        for cl in stats.get('terrain_cleared', []):
            click.echo(f'    terrain under WMO uid {cl["uid"]}: {cl["vertices_lowered"]} vertices lowered '
                       f'(max {cl["max_lower"]}), {cl["samples"]} floor samples, min floor-ground gap now '
                       f'{cl["min_gap_after"]}, {cl["tile_edge_vertices_lowered"]} on the tile edge, '
                       f'{len(cl["doodads_carried"])} doodads carried')
        if dry_run:
            click.echo(f'    [DRY RUN] would become {stats["result_sha256"][:16]}')
            continue
        adt.write_bytes(out)
        if entry.get('result_sha256') != stats['result_sha256']:
            entry['result_sha256'] = stats['result_sha256']
            changed = True

    if changed and not dry_run:
        import json as _json
        recipe_file.write_text(_json.dumps(recipe, indent=2) + '\n')
        click.echo('  recorded result_sha256 in the recipe')


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
            mpq_path = get_patch_output_path(nginx_path, key, result['register'])
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
    from lib import tooltip_gen as tg

    config = get_dbc_config(ctx)
    db_name = getattr(config, database, config.live)

    # Shared load + emit pipeline (lib.tooltip_gen) — identical to what the `tooltip-data`
    # patch-mpq preprocessor runs, so the CLI and the build produce byte-identical output.
    gen = tg.load(config, db_name, echo=click.echo)

    # --- targeted report ---
    for sid in spell_ids:
        rec = gen.classify(sid)
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
        result = gen.emit(family=family, spell_ids=spell_ids if spell_ids else None)
        if result["n_dummy"]:
            click.echo(click.style(
                f"\n  WARNING: {result['n_dummy']} spell(s) in scope carry a DUMMY effect "
                f"(Class-C blind spot — not derivable from DBC).", fg='yellow'))
        if out_path:
            desc_path = tg.write_outputs(out_path, result["lua"], result["desc"])
            click.echo(click.style(
                f"\nWrote {result['n_emit']} of {result['n_total']} records "
                f"(dropped {result['n_total'] - result['n_emit']} inert) -> {out_path}", fg='green'))
            if desc_path:
                click.echo(click.style(f"Wrote desc/tt templates -> {desc_path}", fg='green'))
        else:
            click.echo("\n" + result["lua"])


# =============================================================================
# build cinematic
# =============================================================================

@build.group('cinematic')
def build_cinematic():
    """Pre-rendered cinematic (.avi) conversion and validation."""


def _echo_checks(checks) -> bool:
    """Print a validation table. Returns True if no fatal check failed."""
    fatal_failures = 0
    for c in checks:
        if c.ok:
            mark, colour = 'OK  ', 'green'
        elif c.fatal:
            mark, colour = 'FAIL', 'red'
            fatal_failures += 1
        else:
            mark, colour = 'WARN', 'yellow'
        line = f'  [{mark}] {c.field:<28} expected {c.expected!s:<18} got {c.actual!s}'
        click.echo(click.style(line, fg=colour))
        if c.note and not c.ok:
            click.echo(f'         {c.note}')
    return fatal_failures == 0


@build_cinematic.command('check')
@click.argument('files', nargs=-1, required=True,
                type=click.Path(exists=True, dir_okay=False, path_type=Path))
@click.option('--any-resolution', is_flag=True,
              help='Skip the 1024x576 / 800x448 check (for post-I-279 testing)')
def cinematic_check(files, any_resolution):
    """Validate .avi files against the format the client will actually play."""
    from lib.cinematic import read_avi_info, validate

    all_ok = True
    for path in files:
        click.echo(click.style(f'\n{path.name}', bold=True))
        try:
            info = read_avi_info(path)
        except ValueError as exc:
            click.echo(click.style(f'  [FAIL] {exc}', fg='red'))
            all_ok = False
            continue

        avih = info.get('avih', {})
        click.echo(f"  {avih.get('width')}x{avih.get('height')} @ {avih.get('fps')} fps, "
                   f"{avih.get('total_frames')} frames, "
                   f"{info['file_size'] / 1048576:.1f} MB")
        if not _echo_checks(validate(info, strict_resolution=not any_resolution)):
            all_ok = False

    if all_ok:
        click.echo(click.style('\nAll files match the playable format.', fg='green'))
    else:
        click.echo(click.style(
            '\nAt least one FAIL above — the client will ignore that file silently.',
            fg='red'))
    return all_ok


@build_cinematic.command('convert')
@click.argument('source', type=click.Path(exists=True, dir_okay=False, path_type=Path))
@click.option('--name', '-n', required=True,
              help='Base name, matching Movie.dbc movie_path (e.g. "Goblin")')
@click.option('--out', '-o', 'out_dir', default=None, type=click.Path(path_type=Path),
              help='Output dir (default: the zep-cinematics zpak source-assets)')
@click.option('--width', '-w', 'widths', multiple=True, type=int,
              help='Width variant(s) to emit; repeatable. Default: 1024 and 800')
@click.option('--fps', type=float, default=None, help='Force output frame rate')
@click.option('--bitrate', '-b', default=None, help='Video bitrate (e.g. 3M)')
@click.pass_context
def cinematic_convert(ctx, source, name, out_dir, widths, fps, bitrate):
    """Convert any video (MP4, MKV, ...) into client-playable .avi variants."""
    from lib.cinematic import (
        convert_all, find_ffmpeg, read_avi_info, validate,
    )

    if not find_ffmpeg():
        raise click.ClickException(
            'ffmpeg not found. Install it, or `pip install imageio-ffmpeg`.')

    if out_dir is None:
        out_dir = (ctx.obj['craft_root'] / 'zpaks' / 'zep-cinematics' /
                   'mpq' / 'source-assets' / 'Interface' / 'Cinematics')

    click.echo(f'Converting {source.name} -> {name}_<width>.avi in {out_dir}')

    try:
        results = convert_all(source, out_dir, name,
                              widths=list(widths) or None,
                              fps=fps, bitrate=bitrate)
    except (RuntimeError, ValueError) as exc:
        raise click.ClickException(str(exc))

    all_ok = True
    for width, path in results:
        click.echo(click.style(
            f'\n{path.name}  ({path.stat().st_size / 1048576:.1f} MB)', bold=True))
        if not _echo_checks(validate(read_avi_info(path))):
            all_ok = False

    if all_ok:
        click.echo(click.style('\nDone. Next steps:', fg='green'))
        click.echo('  zep build patch-mpq -p X --parse-build')
        click.echo('  in-game:  .debug play movie <id>   '
                   '(14 = stock Wrathgate control)')
    else:
        click.echo(click.style('\nConversion produced a non-conforming file.',
                               fg='red'))


# =============================================================================
# Minimap generator (F-217)
# =============================================================================

@build.command('minimap-gen')
@click.option('--wmo-root', 'wmo_root', default=None,
              help="Tree holding the WMO to render. Default: the patch-open-azeroth zpak, "
                   "because that is the copy the client loads - OA ships its own Orgrimmar WMO "
                   "(147 groups) and its group indices ARE the client's tile indices. The Asset "
                   "Library copy is a DIFFERENT build (145 groups) and its indices are wrong.")
@click.option('--wmo', 'wmo_rel', required=True,
              help="WMO path under world/wmo, e.g. kalimdor/ogrimmar/ogrimmar")
@click.option('--groups', 'groups_opt', default=None,
              help="Group indices: '137,124,78' or ranges '110-114'")
@click.option('--area', 'area_name', default=None,
              help="Resolve groups from WMOAreaTable by area name, e.g. 'Cleft of Shadow'")
@click.option('--wmo-id', 'wmo_id', type=int, default=None,
              help="WMOAreaTable wmo_id, required with --area")
@click.option('--zcut', default='auto',
              help="Roof cut: 'auto' (40%% of z-range), 'none', or a fraction like 0.35")
@click.option('--headroom', type=float, default=None,
              help="Floor mode: keep the highest surface within N yards of the LOCAL floor. "
                   "Follows sloping ground and drops roofs without punching holes. "
                   "Try 6-12; overrides --zcut behaviour when set.")
@click.option('--px-per-yard', 'px_per_yard', type=float, default=2.0,
              help="Uniform render scale. Stock tile dims are pow2(yards*2), so 2.0 matches; "
                   "the tile covers W/scale x H/scale yards from the bbox minimum.")
@click.option('--gamma', type=float, default=0.70,
              help="Midtone lift (<1 brightens). Stock-matched linear lighting leaves halls "
                   "too dark to read; 0.70 brightens the floor without blowing highlights.")
@click.option('--preview', is_flag=True, help="Write PNG previews only, change nothing")
@click.option('--zpak', 'zpak_name', default='zep-legacy', help="Zpak that ships the tiles")
@click.option('--task', 'task_id', default='F-217', help="Task ID for the emitted SQL")
@click.option('--allow-multi', is_flag=True, help="(legacy, unused - the client only reads _00_00)")
@click.option('--composite/--no-composite', default=False,
              help="Composite every overlapping group into each tile. OFF by default: stock "
                   "tiles hold only their OWN group's geometry, and compositing makes adjacent "
                   "tiles redraw shared geometry at different offsets, which reads as a muddled, "
                   "badly scaled map in game.")
@click.option('--client-offset', type=int, default=0,
              help="Add N to the group index when naming the tile. Our Asset Library's "
                   "Ogrimmar.wmo is numbered 9 LOWER than the client's, so Orgrimmar needs 9 "
                   "(proven in game: library groups 110-114 = Grommash Hold = client tiles 119-123).")
@click.pass_context
def build_minimap_gen(ctx, wmo_root, wmo_rel, groups_opt, area_name, wmo_id, zcut, headroom,
                      px_per_yard, gamma, preview, zpak_name, task_id, allow_multi, client_offset, composite):
    """Render minimap tiles from our own WMO geometry (F-217).

    A stock tile holds only its own group's geometry, so a large room renders as
    sparse pockets (I-371). This composites every group overlapping each tile's
    cell and cuts roof geometry away, giving a complete local floor map.

    Manual by design - point it at a flagged area, check --preview, then write.

    Examples:
        zep build minimap-gen --wmo kalimdor/ogrimmar/ogrimmar --groups 110-114 --preview
        zep build minimap-gen --wmo kalimdor/ogrimmar/ogrimmar --area "Cleft of Shadow" --wmo-id 759
    """
    import struct
    import numpy as np
    from lib.minimap_gen import (AssetIndex, Renderer, group_data, tiles_for,
                                 auto_zcut, tile_resolution, CELL, TILE_PX)
    from lib.blp_image import write_minimap_blp

    craft_root = ctx.obj['craft_root']
    lib_root = Path('/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS')
    oa_root = (Path(craft_root) / 'zpaks' / 'patch-open-azeroth' / 'mpq' / 'source-assets')
    root = Path(wmo_root) if wmo_root else oa_root
    def _ci(base: Path, *parts) -> Path:
        """Resolve a path case-insensitively - zpak trees are UPPERCASE, the
        Asset Library is lowercase."""
        cur = Path(base)
        for want in parts:
            if not cur.is_dir():
                return cur / want
            hit = next((c for c in cur.iterdir()
                        if c.is_dir() and c.name.lower() == str(want).lower()), None)
            cur = hit if hit else cur / want
        return cur
    wmo_dir = _ci(root, 'world', 'wmo', *Path(wmo_rel).parent.parts)
    stem = Path(wmo_rel).name
    root_wmo = next((f for f in (wmo_dir.iterdir() if wmo_dir.is_dir() else [])
                     if f.name.lower() == f"{stem}.wmo".lower()), None)
    if root_wmo is None:
        raise click.ClickException(f"root WMO not found under {wmo_dir}")
    click.echo(f"WMO source: {wmo_dir}")

    # map group index -> MOGP groupID, and bbox
    byname = {f.name.lower(): f for f in wmo_dir.iterdir() if f.is_file()}
    info = {}
    for i in range(1000):
        p = byname.get(f"{stem}_{i:03d}.wmo".lower(), wmo_dir / f"{stem}_{i:03d}.wmo")
        if not p.exists():
            if i > 8 and not info:
                break
            continue
        b = p.read_bytes()[:96]
        if b[12:16][::-1] != b"MOGP":
            continue
        info[i] = dict(gid=struct.unpack_from("<I", b, 20 + 56)[0],
                       bbox=struct.unpack_from("<6f", b, 32),
                       flags=struct.unpack_from("<I", b, 20 + 8)[0])
    if not info:
        raise click.ClickException("no group files found")
    click.echo(f"{stem}: {len(info)} groups")

    targets = []
    if groups_opt:
        for part in groups_opt.split(','):
            part = part.strip()
            if '-' in part:
                a, bnd = part.split('-', 1)
                targets += list(range(int(a), int(bnd) + 1))
            elif part:
                targets.append(int(part))
    elif area_name:
        if wmo_id is None:
            raise click.ClickException("--area requires --wmo-id")
        from lib.dbc_utils import DBCConnection, DBCConfig
        cfg = DBCConfig.from_env(Path(craft_root) / 'cli' / '.env')
        gids = []
        with DBCConnection(cfg) as conn:
            cur = conn.get_connection(cfg.live).cursor()
            cur.execute("SELECT wmo_group_id FROM wmoareatable WHERE wmo_id=%s AND name_enus=%s",
                        (wmo_id, area_name))
            gids = [r[0] for r in cur.fetchall()]
            cur.close()
        by_gid = {v['gid']: k for k, v in info.items()}
        targets = sorted({by_gid[g] for g in gids if g in by_gid})
        click.echo(f"area '{area_name}': {len(gids)} rows -> {len(targets)} groups")
    else:
        raise click.ClickException("pass --groups or --area")

    targets = [t for t in targets if t in info]
    if not targets:
        raise click.ClickException("no valid target groups")

    assets = AssetIndex([root, lib_root])
    rend = Renderer(wmo_dir, stem, assets)

    rel_dir = Path(str(Path(wmo_rel).parent).lower())
    out_dir = (craft_root / 'zpaks' / zpak_name / 'mpq' / 'source-assets' /
               'Textures' / 'Minimap' / rel_dir)
    prev_dir = Path('/tmp/minimap-preview')
    (prev_dir if preview else out_dir).mkdir(parents=True, exist_ok=True)

    # reuse the casing an existing md5translate row already uses, so a generated
    # layer never downgrades 'WMO\\Kalimdor\\Ogrimmar\\...' to lowercase
    existing_src = {}
    try:
        from lib.dbc_utils import DBCConnection, DBCConfig
        _cfg = DBCConfig.from_env(Path(craft_root) / 'cli' / '.env')
        with DBCConnection(_cfg) as _c:
            _cur = _c.get_connection(_cfg.live).cursor()
            _cur.execute("SELECT `src` FROM `md5translate`")
            existing_src = {r[0].lower(): r[0] for r in _cur.fetchall()}
            _cur.close()
    except Exception:
        pass

    rows, skipped = [], []
    for gi in targets:
        bbox = info[gi]['bbox']
        if zcut == 'none':
            zc = None
        elif zcut == 'auto':
            zc = auto_zcut(bbox)
        else:
            zc = auto_zcut(bbox, float(zcut))
        # Stock tiles hold only their own group's geometry and tile cleanly next
        # to each other. Compositing neighbours duplicates shared geometry across
        # adjacent tiles, so it is opt-in only.
        indoor = bool(info[gi]['flags'] & 0x2000)
        res = tile_resolution(bbox)
        # The cell: fixed 2 px/yd, anchored at the bbox MINIMUM (measured in game).
        cover = (bbox[0], bbox[1], bbox[2],
                 bbox[0] + res[0] / px_per_yard,
                 bbox[1] + res[1] / px_per_yard,
                 bbox[5])
        if composite:
            # Composite every overlapping group of the SAME indoor/outdoor kind.
            # A coverage threshold was tried and abandoned: the cell is fixed by
            # the group's OWN bbox, so tile 123's cell contains 0% of the corridor
            # (122) and 0% of room 2 (121) - no threshold can put them in. Each
            # tile is a window fixed by its own bbox, so the picture necessarily
            # changes as the client swaps tiles. That transition "pop" is
            # STRUCTURAL to per-group tiles, not a tile-content bug. Plain overlap
            # maximises what each tile carries, which is the best available.
            over = [j for j, v in info.items()
                    if v['bbox'][3] > bbox[0] and v['bbox'][0] < bbox[3]
                    and v['bbox'][4] > bbox[1] and v['bbox'][1] < bbox[4]
                    and bool(v['flags'] & 0x2000) == indoor]
        else:
            over = [gi]
        # clamp to this room's own vertical extent (small margin for thresholds)
        zwin = (bbox[2] - 3.0, bbox[5] + 3.0) if indoor else None

        # The client only ever requests _00_00 - confirmed in game, every cell
        # index read 00,00 - so one tile covers the whole group.
        # Cut EVERY composited group at its OWN height, not the target's. Sharing
        # one plane made the corridor render differently depending on whose tile
        # drew it, which is what changed on entering the tunnel (I-371).
        if headroom is not None:
            zc_map = None
        elif zcut == 'none':
            zc_map = None
        else:
            frac = 0.40 if zcut == 'auto' else float(zcut)
            zc_map = {j: auto_zcut(info[j]['bbox'], frac) for j in over}
        img = rend.render(over, cover, size=res,
                          zcut=zc_map,
                          headroom=headroom, gamma=gamma, zwindow=zwin)
        lit = float((img.mean(axis=2) > 40).mean())
        ci = gi + client_offset
        name = f"{stem}_{ci:03d}_00_00.blp"
        if preview:
            from PIL import Image
            Image.fromarray(img).save(prev_dir / name.replace('.blp', '.png'))
        else:
            write_minimap_blp(out_dir / name, img)
            src = (f"WMO\\{Path(wmo_rel).parent.as_posix().replace('/', chr(92))}"
                   f"\\{stem}_{ci:03d}_00_00.blp")
            src = existing_src.get(src.lower(), src)
            if src.lower() not in existing_src and existing_src:
                # New row: no stored casing to reuse. Copy the casing of a sibling
                # row in the same directory rather than emitting a lowercase path -
                # every stock row is 'WMO\\Kalimdor\\Ogrimmar\\Ogrimmar_...'.
                pre = src.rsplit('\\', 1)[0].lower() + '\\' + stem.lower() + '_'
                for k, v in existing_src.items():
                    if k.startswith(pre):          # same directory AND same WMO stem
                        sib_dir, sib_file = v.rsplit('\\', 1)
                        stem_cased = sib_file[:len(stem)]
                        tail = src.rsplit('\\', 1)[1][len(stem) + 1:]
                        src = f"{sib_dir}\\{stem_cased}_{tail}"
                        break
            dst = f"{str(rel_dir).replace('/', chr(92))}\\{name}"
            rows.append((src, dst))
        click.echo(f"  group {gi:03d} -> tile {ci:03d}  {res[0]}x{res[1]}px covering "
                   f"{cover[3]-cover[0]:.0f}x{cover[4]-cover[1]:.0f} yd "
                   f"({res[0]/(cover[3]-cover[0]):.1f}x{res[1]/(cover[4]-cover[1]):.1f} px/yd)"
                   f"  lit {lit:.0%}")

    for gi, why in skipped:
        click.echo(click.style(f"  group {gi:03d} SKIPPED ({why}) - "
                               f"use --allow-multi once tile orientation is calibrated", fg='yellow'))
    if preview:
        click.echo(click.style(f"\nPreviews written to {prev_dir} (nothing else changed)", fg='green'))
        return
    if rows:
        from lib.trs_utils import sql_str
        sql_dir = craft_root / 'zpaks' / zpak_name / 'dbc'
        sql_dir.mkdir(parents=True, exist_ok=True)
        f = sql_dir / f"[{task_id}]_md5translate_{Path(wmo_rel).parent.name.lower()}.sql"
        d = f"WMO\\{Path(wmo_rel).parent.as_posix().replace('/', chr(92))}"
        body = [f"-- [{task_id}] minimap rows for tiles generated by 'zep build minimap-gen'",
                f"-- Source: our own {stem}.wmo geometry, composited per cell with a roof cut.", ""]
        body.append("DELETE FROM `md5translate` WHERE `src` IN (%s);" %
                    ", ".join(sql_str(s) for s, _ in rows))
        body.append("INSERT INTO `md5translate` (`src`, `dst`, `dir`) VALUES")
        body.append(",\n".join(f"({sql_str(s)}, {sql_str(dd)}, {sql_str(d)})" for s, dd in rows) + ";")
        f.write_text("\n".join(body) + "\n")
        click.echo(click.style(f"\n{len(rows)} tiles -> {out_dir}", fg='green'))
        click.echo(click.style(f"rows -> {f}", fg='green'))
        click.echo("next: zep dbc db rebuild -t md5translate && zep build patch-mpq -p Z --parse-build")
