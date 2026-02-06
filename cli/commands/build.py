"""
Build operations for Zeppelin-Craft CLI.

Commands:
    zep build patch               Build client patches (MPQ files)
    zep build register            Manage patch register
"""

import time
from pathlib import Path
from typing import Dict, List, Optional

import click

from lib.logging_config import get_logger
from lib.manifest import load_manifest
from lib.patch_builder import (
    build_generic_patch,
    build_patch_z,
    discover_patches,
    get_zpak_build_info,
    get_zpak_parsed_assets,
)
from lib.patch_register import (
    DEFAULT_NGINX_PATH,
    format_register_summary,
    get_patch_output_path,
    load_register,
    save_register,
    update_patch_entry,
)

logger = get_logger('commands.build')


@click.group(invoke_without_command=True)
@click.pass_context
def build(ctx):
    """Build operations."""
    if ctx.invoked_subcommand is None:
        # Interactive: choose client or register
        choice = _top_level_menu()
        if choice == 'patch':
            ctx.invoke(build_patch)
        elif choice == 'register':
            ctx.invoke(build_register, show=True)


# =============================================================================
# build patch
# =============================================================================

@build.command('patch')
@click.option('--patch', '-p', 'patch_letter',
              help='Patch letter to build (e.g., Z, O, B)')
@click.option('--all', '-a', 'build_all', is_flag=True,
              help='Build all patches with packable assets')
@click.option('--quick', '-q', is_flag=True,
              help='PATCH-Z: skip DBC export, repack only')
@click.option('--parse', is_flag=True,
              help='Run preprocessor (resource-parser) before packing')
@click.option('--dry-run', '-n', is_flag=True,
              help='Show what would be built without building')
@click.pass_context
def build_patch(ctx, patch_letter: Optional[str], build_all: bool,
                quick: bool, parse: bool, dry_run: bool):
    """Build client patches (MPQ files).

    Interactive mode walks through patch selection and build options.
    Flags allow fully non-interactive builds for scripting.

    Examples:
        zep build patch              # Interactive guided flow
        zep build patch -p Z         # Select PATCH-Z, choose build mode
        zep build patch -p Z --quick # Non-interactive quick PATCH-Z
        zep build patch --all        # Build all patches
        zep build patch --dry-run    # Preview what would be built
    """
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
    if build_all:
        selected = sorted(patches.keys())
        modes = {letter: {'quick': quick, 'parse': parse} for letter in selected}
    elif patch_letter:
        letter = patch_letter.upper()
        if letter not in patches:
            click.echo(f"No zpaks assigned to PATCH-{letter}")
            click.echo(f"Available: {', '.join(sorted(patches.keys()))}")
            return
        selected = [letter]
        # If no explicit mode flags, show build mode menu
        if not quick and not parse and not dry_run:
            mode = _build_mode_menu(letter, patches, register, nginx_path)
            if mode is None:
                return
            modes = {letter: mode}
        else:
            modes = {letter: {'quick': quick, 'parse': parse}}
    else:
        # Interactive: pick a patch
        result = _select_patch_menu(patches, register, nginx_path)
        if result is None:
            return
        if result == 'ALL':
            selected = sorted(patches.keys())
            modes = {letter: {'quick': False, 'parse': False} for letter in selected}
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

    for letter in selected:
        zpaks = patches[letter]
        patch_name = f"PATCH-{letter}.MPQ"
        zpak_names = ', '.join(z['name'] for z in zpaks)
        mode = modes.get(letter, {})

        click.echo(f"\n{'=' * 60}")
        click.echo(f"  {patch_name}  ({zpak_names})")
        click.echo(f"{'=' * 60}")

        if letter == 'Z':
            ok = build_patch_z(craft_root, nginx_path, register,
                               quick=mode.get('quick', False),
                               dry_run=dry_run)
        else:
            ok = build_generic_patch(letter, zpaks, nginx_path, register,
                                     parse=mode.get('parse', False),
                                     dry_run=dry_run)

        if ok:
            built += 1
        else:
            failed += 1

    # Save register
    if not dry_run and built > 0:
        if save_register(register, nginx_path):
            click.echo(f"\nPatch register updated")
        else:
            click.echo(click.style("\nWarning: Failed to save patch register", fg='yellow'))

    # Summary
    elapsed = time.time() - start
    click.echo(f"\n{'─' * 40}")
    if dry_run:
        click.echo(f"[DRY RUN] Would build {built} patch(es)")
    elif failed == 0 and built > 0:
        click.echo(click.style(f"Built {built} patch(es) in {elapsed:.1f}s", fg='green'))
    elif failed > 0:
        click.echo(click.style(
            f"Built {built}, failed {failed} in {elapsed:.1f}s", fg='yellow'))

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
        "Patch             Build MPQ patch files",
        "Register          View patch versions and checksums",
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
    return ['patch', 'register'][result]


def _select_patch_menu(patches: dict, register: dict,
                        nginx_path: Path) -> Optional[str]:
    """Show patch selection menu. Returns letter, 'ALL', or None."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        click.echo("Specify --patch <letter> or --all")
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

    Always shows a menu for consistent UX — even simple patches get
    a single "Build" option that acts as confirmation. Escape cancels.

    Returns dict with mode flags, or None if cancelled.
    """
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        return {'quick': False, 'parse': False}

    zpaks = patches.get(letter, [])
    patch_name = f"PATCH-{letter}.MPQ"
    reg_entry = register.get('patches', {}).get(patch_name, {})
    name = reg_entry.get('name', zpaks[0]['name'] if zpaks else letter)

    # Determine available modes based on patch type
    options = []
    modes = []

    if letter == 'Z':
        options = [
            "Full Build       Export DBC + reorder CharSections + pack MPQ",
            "Quick Build      Repack existing DBC files (skip export)",
        ]
        modes = [
            {'quick': False, 'parse': False},
            {'quick': True, 'parse': False},
        ]
    else:
        has_preprocessor = any(
            get_zpak_build_info(z['manifest']).get('preprocessor')
            for z in zpaks
        )
        has_assets = any(get_zpak_parsed_assets(z['path']) for z in zpaks)

        if has_preprocessor and has_assets:
            options = [
                "Build            Pack existing parsed-assets",
                "Build + Parse    Run preprocessor first, then pack",
            ]
            modes = [
                {'quick': False, 'parse': False},
                {'quick': False, 'parse': True},
            ]
        elif has_preprocessor:
            options = [
                "Build + Parse    Run preprocessor first, then pack",
            ]
            modes = [
                {'quick': False, 'parse': True},
            ]
        else:
            options = [
                f"Build            Pack into {patch_name}",
            ]
            modes = [
                {'quick': False, 'parse': False},
            ]

    menu = TerminalMenu(
        options,
        title=f"\n  PATCH-{letter} — {name}\n",
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

@build.command('register')
@click.option('--show', '-s', is_flag=True, help='Show current patch versions')
@click.option('--update', '-u', is_flag=True,
              help='Recalculate checksums and sizes for all existing patches')
@click.pass_context
def build_register(ctx, show, update):
    """Manage the patch register.

    The patch register tracks version, checksum, and size metadata
    for each MPQ patch file. The launcher uses this for update detection.

    Examples:
        zep build register --show     # Show current state
        zep build register --update   # Recalculate all checksums
    """
    nginx_path = DEFAULT_NGINX_PATH
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


