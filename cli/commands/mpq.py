"""
MPQ archive operations for Zeppelin-Craft CLI.

Wraps mpqcli to provide MPQ archive management for zpaks.

Commands:
    zep mpq pack <zpak>           Pack zpak assets to MPQ
    zep mpq extract <mpq> <dest>  Extract MPQ contents (or interactive zpak selection)
    zep mpq list [mpq|--name]     List MPQ contents
    zep mpq info                  Show client patch map and load order
"""

import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional

import click

from lib.manifest import load_manifest

# mpqcli binary location
MPQCLI_PATH = Path('/workspace/project/Zeppelin-Tools/mpqcli/mpqcli')

# CLI directory for path resolution
CLI_DIR = Path(__file__).parent.parent


def _discover_zpaks_with_mpq_info(craft_root: Path, mpq_capable_only: bool = False) -> List[Dict[str, Any]]:
    """Discover available zpaks with MPQ binary info.

    Args:
        craft_root: Path to the Zeppelin-Craft root directory.
        mpq_capable_only: If True, only return zpaks with type 'mpq' or 'hybrid'.

    Returns:
        List of dicts with 'name', 'description', 'path', 'has_mpq_binary', 'mpq_binary_path', 'mpq_filename'
    """
    zpaks = []

    for base in [craft_root / 'zpaks', craft_root / 'external']:
        if not base.exists():
            continue
        for pkg_dir in sorted(base.iterdir()):
            if not pkg_dir.is_dir():
                continue
            manifest_path = pkg_dir / 'zpak.json'
            if not manifest_path.exists():
                continue

            manifest = load_manifest(manifest_path)
            if not manifest:
                continue

            # Filter by zpak type if requested
            if mpq_capable_only and manifest.get('type') not in ['mpq', 'hybrid']:
                continue

            # Check for MPQ binary in mpq/source-binary/
            mpq_binary_dir = pkg_dir / 'mpq' / 'source-binary'
            mpq_files = list(mpq_binary_dir.glob('*.MPQ')) if mpq_binary_dir.exists() else []
            has_mpq_binary = len(mpq_files) > 0
            mpq_binary_path = mpq_files[0] if mpq_files else None
            mpq_filename = mpq_binary_path.name if mpq_binary_path else None

            # Get client_patch for display
            client_patch = manifest.get('client_patch', '')

            zpaks.append({
                'name': manifest.get('name', pkg_dir.name),
                'description': manifest.get('description', '')[:35],
                'path': pkg_dir,
                'has_mpq_binary': has_mpq_binary,
                'mpq_binary_path': mpq_binary_path,
                'mpq_filename': mpq_filename,
                'client_patch': client_patch,
            })

    return zpaks


def get_mpqcli() -> Path:
    """Get path to mpqcli binary, verifying it exists."""
    if not MPQCLI_PATH.exists():
        raise click.ClickException(
            f"mpqcli not found at {MPQCLI_PATH}\n"
            "See F-046 for installation instructions."
        )
    return MPQCLI_PATH


def run_mpqcli(args: list, capture_output: bool = False) -> subprocess.CompletedProcess:
    """Run mpqcli with the given arguments.

    Args:
        args: Command arguments (without mpqcli path)
        capture_output: Whether to capture stdout/stderr

    Returns:
        CompletedProcess instance
    """
    mpqcli = get_mpqcli()
    cmd = [str(mpqcli)] + args

    try:
        result = subprocess.run(
            cmd,
            capture_output=capture_output,
            text=True,
            check=False
        )
        return result
    except FileNotFoundError:
        raise click.ClickException(f"Failed to execute mpqcli: {mpqcli}")


def _resolve_mpq_path(craft_root: Path, mpq_file: Optional[str], name: Optional[str]) -> Path:
    """Resolve an MPQ binary path from either a direct file path or zpak name.

    Supports three modes:
        1. Direct file path (mpq_file provided)
        2. Named zpak lookup (--name provided)
        3. Interactive zpak selection (neither provided)

    Returns:
        Path to the MPQ binary file.
    """
    if mpq_file:
        return Path(mpq_file)

    if not name:
        # Interactive selection
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Specify an MPQ file path, use --name <zpak>, "
                "or install simple-term-menu for interactive selection"
            )

        all_zpaks = _discover_zpaks_with_mpq_info(craft_root, mpq_capable_only=True)
        if not all_zpaks:
            raise click.ClickException("No mpq/hybrid zpaks found")

        zpaks = [z for z in all_zpaks if z['has_mpq_binary']]
        if not zpaks:
            raise click.ClickException(
                "No zpaks with MPQ binaries found.\n"
                "MPQ files should be in: zpak/mpq/source-binary/*.MPQ"
            )

        options = []
        for zpak in zpaks:
            patch_info = f"[{zpak['client_patch']}]" if zpak['client_patch'] else ""
            options.append(f"{zpak['name']:<22} {patch_info:<10} {zpak['description']}")

        menu = TerminalMenu(
            options,
            title=f"\n  Select zpak ({len(zpaks)} with MPQ):\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()
        if result is None:
            raise SystemExit(0)

        selected = zpaks[result]
        click.echo(f"\nSelected: {selected['name']}")
        return selected['mpq_binary_path']

    # Named zpak lookup
    zpaks = _discover_zpaks_with_mpq_info(craft_root, mpq_capable_only=True)
    for zpak in zpaks:
        if zpak['name'] == name:
            if not zpak['mpq_binary_path']:
                raise click.ClickException(
                    f"Zpak '{name}' has no MPQ binary in mpq/source-binary/"
                )
            return zpak['mpq_binary_path']

    raise click.ClickException(f"Zpak '{name}' not found")


@click.group()
def mpq():
    """MPQ archive operations"""
    pass


@mpq.command('pack')
@click.option('--name', '-n',
              help='Package name (interactive selection if omitted)')
@click.option('--output', '-o', type=click.Path(),
              help='Output path for MPQ file (default: from zpak.json)')
@click.option('--version', '-v', type=click.Choice(['1', '2']), default='1',
              help='MPQ version (1 for classic, 2 for WotLK)')
@click.pass_context
def mpq_pack(ctx, name: Optional[str], output: Optional[str], version: str):
    """Pack zpak assets into an MPQ archive.

    Reads the zpak's assets/ directory and creates an MPQ archive
    as specified in the zpak.json manifest.

    Example:
        zep mpq pack --name hd-character-models
    """
    craft_root = ctx.obj['craft_root']

    # Interactive zpak selection if not specified
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Specify --name <zpak> or install simple-term-menu for interactive selection"
            )

        candidates = []
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if not base.exists():
                continue
            for pkg_dir in sorted(base.iterdir()):
                if not pkg_dir.is_dir():
                    continue
                manifest_path = pkg_dir / 'zpak.json'
                if not manifest_path.exists():
                    continue
                manifest = load_manifest(manifest_path)
                if not manifest:
                    continue
                if manifest.get('type') not in ['mpq', 'hybrid']:
                    continue
                candidates.append((manifest.get('name', pkg_dir.name), pkg_dir))

        if not candidates:
            raise click.ClickException("No mpq/hybrid zpaks found")

        options = [n for n, _ in candidates] + ["[Cancel]"]
        menu = TerminalMenu(options, title="\n  Select zpak to pack:\n")
        result = menu.show()
        if result is None or options[result] == "[Cancel]":
            return
        name = candidates[result][0]

    # Find the package
    pkg_path = None
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        candidate = base / name
        if candidate.exists() and (candidate / 'zpak.json').exists():
            pkg_path = candidate
            break

    if not pkg_path:
        raise click.ClickException(f"Package '{name}' not found")

    # Load manifest
    import json
    manifest_path = pkg_path / 'zpak.json'
    try:
        with open(manifest_path) as f:
            manifest = json.load(f)
    except (json.JSONDecodeError, FileNotFoundError) as e:
        raise click.ClickException(f"Failed to load manifest: {e}")

    # Verify this is an MPQ-capable package
    pkg_type = manifest.get('type', '')
    if pkg_type not in ['mpq', 'hybrid']:
        raise click.ClickException(
            f"Package '{name}' is type '{pkg_type}', not 'mpq' or 'hybrid'\n"
            "Only mpq/hybrid packages can be packed."
        )

    # Get assets directory
    assets_dir = pkg_path / 'assets'
    if not assets_dir.exists():
        raise click.ClickException(f"Assets directory not found: {assets_dir}")

    if not any(assets_dir.iterdir()):
        raise click.ClickException(f"Assets directory is empty: {assets_dir}")

    # Determine output path
    mpq_config = manifest.get('contents', {}).get('mpq', {})
    if output:
        output_path = Path(output)
    elif isinstance(mpq_config, dict) and mpq_config.get('output'):
        # Output filename from manifest, place in package directory
        output_path = pkg_path / mpq_config['output']
    else:
        # Default output name
        output_path = pkg_path / f"{name.upper()}.MPQ"

    # Ensure output directory exists
    output_path.parent.mkdir(parents=True, exist_ok=True)

    click.echo(f"Packing {name}...")
    click.echo(f"  Source: {assets_dir}")
    click.echo(f"  Output: {output_path}")

    # Build mpqcli command
    args = [
        'create',
        str(assets_dir),
        '-o', str(output_path),
        '-v', version
    ]

    result = run_mpqcli(args)

    if result.returncode != 0:
        if result.stderr:
            click.echo(result.stderr, err=True)
        raise click.ClickException(f"mpqcli create failed with code {result.returncode}")

    # Verify output was created
    if output_path.exists():
        size_mb = output_path.stat().st_size / (1024 * 1024)
        click.echo(click.style(f"Created: {output_path} ({size_mb:.2f} MB)", fg='green'))
    else:
        raise click.ClickException("MPQ file was not created")

mpq_pack.zpak_filter = 'mpq_capable'


@mpq.command('extract')
@click.argument('mpq_file', type=click.Path(exists=True), required=False)
@click.argument('destination', type=click.Path(), required=False)
@click.option('--name', '-n', help='Zpak name (interactive selection if omitted)')
@click.option('--file', '-f', 'target_file', help='Extract specific file only')
@click.option('--keep-structure', '-k', is_flag=True, help='Keep folder structure')
@click.pass_context
def mpq_extract(ctx, mpq_file: Optional[str], destination: Optional[str],
                name: Optional[str], target_file: Optional[str], keep_structure: bool):
    """Extract files from an MPQ archive.

    Can extract from a direct MPQ file path or interactively select a zpak
    with an MPQ binary in its source-binary directory.

    Examples:
        zep mpq extract                           # Interactive zpak selection
        zep mpq extract --name hd-water           # Extract specific zpak's MPQ
        zep mpq extract patch-z.mpq ./output/     # Direct file extraction
        zep mpq extract patch.mpq -f "DBFilesClient/Spell.dbc"
    """
    craft_root = ctx.obj['craft_root']

    # If no MPQ file provided, use interactive zpak selection
    if not mpq_file:
        # Check if --name was provided
        if not name:
            # Interactive selection
            try:
                from simple_term_menu import TerminalMenu
            except ImportError:
                raise click.ClickException(
                    "Interactive mode requires simple-term-menu.\n"
                    "Install with: pip install simple-term-menu"
                )

            all_zpaks = _discover_zpaks_with_mpq_info(craft_root, mpq_capable_only=True)
            if not all_zpaks:
                raise click.ClickException("No mpq/hybrid zpaks found")

            # Filter to only show zpaks with MPQ binaries
            zpaks = [z for z in all_zpaks if z['has_mpq_binary']]
            if not zpaks:
                raise click.ClickException(
                    "No zpaks with MPQ binaries found.\n"
                    "MPQ files should be in: zpak/mpq/source-binary/*.MPQ"
                )

            # Build menu options
            options = []
            for zpak in zpaks:
                patch_info = f"[{zpak['client_patch']}]" if zpak['client_patch'] else ""
                options.append(f"{zpak['name']:<22} {patch_info:<10} {zpak['description']}")

            menu = TerminalMenu(
                options,
                title=f"\n  Select zpak to extract MPQ from ({len(zpaks)} with MPQ):\n",
                menu_cursor="> ",
                menu_cursor_style=("fg_cyan", "bold"),
                menu_highlight_style=("fg_cyan", "bold"),
                cycle_cursor=True,
                clear_screen=True,
            )

            result = menu.show()

            if result is None:
                click.echo("Cancelled")
                return

            selected_zpak = zpaks[result]
            name = selected_zpak['name']
            mpq_path = selected_zpak['mpq_binary_path']
            zpak_path = selected_zpak['path']

            click.echo(f"\nSelected: {name}")
        else:
            # Find zpak by name
            zpaks = _discover_zpaks_with_mpq_info(craft_root, mpq_capable_only=True)
            selected_zpak = None
            for zpak in zpaks:
                if zpak['name'] == name:
                    selected_zpak = zpak
                    break

            if not selected_zpak:
                raise click.ClickException(f"Zpak '{name}' not found")

            mpq_path = selected_zpak['mpq_binary_path']
            zpak_path = selected_zpak['path']

            if not mpq_path:
                raise click.ClickException(
                    f"Zpak '{name}' has no MPQ binary in mpq/source-binary/"
                )

        # Default destination is zpak's mpq/source-assets
        if not destination:
            dest_path = zpak_path / 'mpq' / 'source-assets'
        else:
            dest_path = Path(destination)
    else:
        # Direct MPQ file path provided
        mpq_path = Path(mpq_file)
        if not mpq_path.exists():
            raise click.ClickException(f"MPQ file not found: {mpq_path}")

        # Default destination is mpq name without extension
        if not destination:
            dest_path = Path(str(mpq_path.stem) + '_extracted')
        else:
            dest_path = Path(destination)

    dest_path.mkdir(parents=True, exist_ok=True)

    click.echo(f"Extracting {mpq_path.name}...")
    click.echo(f"  Destination: {dest_path}")

    args = ['extract', str(mpq_path), '-o', str(dest_path)]

    if target_file:
        args.extend(['-f', target_file])
        click.echo(f"  File: {target_file}")

    if keep_structure:
        args.append('-k')

    result = run_mpqcli(args)

    if result.returncode != 0:
        if result.stderr:
            click.echo(result.stderr, err=True)
        raise click.ClickException(f"mpqcli extract failed with code {result.returncode}")

    click.echo(click.style("Extraction complete", fg='green'))

mpq_extract.zpak_filter = 'mpq_capable'


@mpq.command('list')
@click.argument('mpq_file', type=click.Path(exists=True), required=False)
@click.option('--name', '-n', help='Zpak name (interactive selection if omitted)')
@click.option('--detailed', '-d', is_flag=True, help='Show detailed information')
@click.option('--all', '-a', 'show_all', is_flag=True, default=True, help='Include hidden files')
@click.pass_context
def mpq_list(ctx, mpq_file: Optional[str], name: Optional[str], detailed: bool, show_all: bool):
    """List contents of an MPQ archive.

    Can list from a direct MPQ file path or select a zpak by name.

    Examples:
        zep mpq list                              # Interactive zpak selection
        zep mpq list --name hd-water              # List specific zpak's MPQ
        zep mpq list patch-z.mpq                  # Direct file path
        zep mpq list patch.mpq --detailed
    """
    craft_root = ctx.obj['craft_root']
    mpq_path = _resolve_mpq_path(craft_root, mpq_file, name)

    args = ['list', str(mpq_path)]

    if detailed:
        args.append('-d')

    if show_all:
        args.append('-a')

    result = run_mpqcli(args, capture_output=True)

    if result.returncode != 0:
        if result.stderr:
            click.echo(result.stderr, err=True)
        raise click.ClickException(f"mpqcli list failed with code {result.returncode}")

    if result.stdout:
        click.echo(result.stdout)
    else:
        click.echo("Archive is empty or has no listfile")

mpq_list.zpak_filter = 'mpq_capable'


@mpq.command('info')
@click.pass_context
def mpq_info(ctx):
    """Show client patch mapping and load order.

    Displays all zpaks with client_patch assignments, their patch letters,
    load priority, and build status from the patch register.

    The WoW 3.3.5a client loads patches in alphanumeric order by filename.
    Later patches override earlier ones (last-one-wins).

    Example:
        zep mpq info
    """
    import json

    craft_root = ctx.obj['craft_root']

    # Discover all zpaks with client_patch (including disabled)
    zpak_patches = {}  # letter -> list of zpak info
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        if not base.exists():
            continue
        for pkg_dir in sorted(base.iterdir()):
            if not pkg_dir.is_dir():
                continue
            manifest_path = pkg_dir / 'zpak.json'
            if not manifest_path.exists():
                continue
            manifest = load_manifest(manifest_path)
            if not manifest:
                continue
            client_patch = manifest.get('client_patch')
            if not client_patch:
                continue
            letter = client_patch.replace('PATCH-', '')

            # Check for MPQ binary
            mpq_binary_dir = pkg_dir / 'mpq' / 'source-binary'
            mpq_files = list(mpq_binary_dir.glob('*.MPQ')) if mpq_binary_dir.exists() else []

            zpak_patches.setdefault(letter, []).append({
                'name': manifest.get('name', pkg_dir.name),
                'type': manifest.get('type', ''),
                'enabled': manifest.get('enabled', True),
                'priority': manifest.get('priority', 100),
                'has_binary': len(mpq_files) > 0,
            })

    # Load patch register for build metadata
    register = {}
    register_path = craft_root / 'Scripts' / 'Patch Builder' / 'patch_register.json'
    if register_path.exists():
        try:
            with open(register_path) as f:
                register_data = json.load(f)
            register = register_data.get('patches', {})
        except (json.JSONDecodeError, PermissionError):
            pass

    # Merge: register may have patches not in zpaks (e.g. PATCH-X generated)
    all_letters = set(zpak_patches.keys())
    for patch_name in register:
        letter = patch_name.replace('PATCH-', '').replace('.MPQ', '')
        all_letters.add(letter)

    if not all_letters:
        raise click.ClickException("No client patches found")

    # Sort: numeric first, then alpha
    sorted_letters = sorted(all_letters, key=lambda l: (not l.isdigit(), l))

    click.echo()
    click.echo(click.style("  Client Patch Map", bold=True))
    click.echo(click.style("  Load order: alphanumeric (later overrides earlier)", dim=True))
    click.echo()

    # Header
    click.echo(f"  {'Patch':<10} {'Zpak':<24} {'Type':<8} {'Mandatory':<11} {'Size':<10} {'Source':<16} {'Status'}")
    click.echo(f"  {'─' * 10} {'─' * 24} {'─' * 8} {'─' * 11} {'─' * 10} {'─' * 16} {'─' * 12}")

    for letter in sorted_letters:
        patch_key = f"PATCH-{letter}.MPQ"
        reg = register.get(patch_key, {})
        zpaks_for_letter = zpak_patches.get(letter, [])

        mandatory = "yes" if reg.get('is_mandatory') else "no"
        size = reg.get('size_mb', 0)
        size_str = f"{size:.0f} MB" if size else "—"
        build_source = reg.get('build_source', '—')

        if not zpaks_for_letter:
            # Register-only entry (no zpak, e.g. generated patches)
            status = click.style("generated", fg='cyan')
            click.echo(f"  {click.style(f'PATCH-{letter}', bold=True):<20} {'—':<24} {'—':<8} {mandatory:<11} {size_str:<10} {build_source:<16} {status}")
        else:
            # Sort by priority within same letter
            zpaks_for_letter.sort(key=lambda z: z['priority'])
            for i, zpak in enumerate(zpaks_for_letter):
                patch_pad = f"PATCH-{letter}" if i == 0 else " " * 7
                name = zpak['name']
                ztype = zpak['type']

                if not zpak['enabled']:
                    status = click.style("disabled", fg='red')
                elif zpak['has_binary']:
                    status = click.style("ready", fg='green')
                else:
                    status = click.style("no binary", fg='yellow')

                click.echo(f"  {patch_pad:<10} {name:<24} {ztype:<8} {mandatory:<11} {size_str:<10} {build_source:<16} {status}")

                # Only show size/source on first row for multi-zpak patches
                size_str = ""
                build_source = ""
                mandatory = ""

    # Summary
    total_zpaks = sum(len(v) for v in zpak_patches.values())
    mandatory_count = sum(1 for r in register.values() if r.get('is_mandatory'))
    optional_count = len(all_letters) - mandatory_count

    click.echo()
    click.echo(f"  {len(all_letters)} patches ({mandatory_count} mandatory, {optional_count} optional) from {total_zpaks} zpaks")
    click.echo()
