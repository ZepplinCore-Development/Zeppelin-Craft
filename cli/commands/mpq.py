"""
MPQ archive operations for Zeppelin-Craft CLI.

Wraps mpqcli to provide MPQ archive management for zpaks.

Commands:
    zep mpq pack <zpak>           Pack zpak assets to MPQ
    zep mpq extract <mpq> <dest>  Extract MPQ contents (or interactive zpak selection)
    zep mpq list <mpq>            List MPQ contents
    zep mpq info <mpq>            Show MPQ archive info
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


def _discover_zpaks_with_mpq_info(craft_root: Path) -> List[Dict[str, Any]]:
    """Discover available zpaks with MPQ binary info.

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


@click.group()
def mpq():
    """MPQ archive operations"""
    pass


@mpq.command('pack')
@click.argument('name')
@click.option('--output', '-o', type=click.Path(),
              help='Output path for MPQ file (default: from zpak.json)')
@click.option('--version', '-v', type=click.Choice(['1', '2']), default='1',
              help='MPQ version (1 for classic, 2 for WotLK)')
@click.pass_context
def mpq_pack(ctx, name: str, output: Optional[str], version: str):
    """Pack zpak assets into an MPQ archive.

    Reads the zpak's assets/ directory and creates an MPQ archive
    as specified in the zpak.json manifest.

    Example:
        zep mpq pack hd-character-models
    """
    craft_root = ctx.obj['craft_root']

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


@mpq.command('extract')
@click.argument('mpq_file', type=click.Path(exists=True), required=False)
@click.argument('destination', type=click.Path(), required=False)
@click.option('--name', '-n', 'zpak_name', help='Zpak name (interactive selection if omitted)')
@click.option('--file', '-f', 'target_file', help='Extract specific file only')
@click.option('--keep-structure', '-k', is_flag=True, help='Keep folder structure')
@click.pass_context
def mpq_extract(ctx, mpq_file: Optional[str], destination: Optional[str],
                zpak_name: Optional[str], target_file: Optional[str], keep_structure: bool):
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
        if not zpak_name:
            # Interactive selection
            try:
                from simple_term_menu import TerminalMenu
            except ImportError:
                raise click.ClickException(
                    "Interactive mode requires simple-term-menu.\n"
                    "Install with: pip install simple-term-menu"
                )

            all_zpaks = _discover_zpaks_with_mpq_info(craft_root)
            if not all_zpaks:
                raise click.ClickException("No zpaks found in zpaks/ or external/")

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
                options.append(f"📦 {zpak['name']:<22} {patch_info:<10} {zpak['description']}")

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
            zpak_name = selected_zpak['name']
            mpq_path = selected_zpak['mpq_binary_path']
            zpak_path = selected_zpak['path']

            click.echo(f"\nSelected: {zpak_name}")
        else:
            # Find zpak by name
            zpaks = _discover_zpaks_with_mpq_info(craft_root)
            selected_zpak = None
            for zpak in zpaks:
                if zpak['name'] == zpak_name:
                    selected_zpak = zpak
                    break

            if not selected_zpak:
                raise click.ClickException(f"Zpak '{zpak_name}' not found")

            mpq_path = selected_zpak['mpq_binary_path']
            zpak_path = selected_zpak['path']

            if not mpq_path:
                raise click.ClickException(
                    f"Zpak '{zpak_name}' has no MPQ binary in mpq/source-binary/"
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


@mpq.command('list')
@click.argument('mpq_file', type=click.Path(exists=True))
@click.option('--detailed', '-d', is_flag=True, help='Show detailed information')
@click.option('--all', '-a', 'show_all', is_flag=True, default=True, help='Include hidden files')
def mpq_list(mpq_file: str, detailed: bool, show_all: bool):
    """List contents of an MPQ archive.

    Example:
        zep mpq list patch-z.mpq
        zep mpq list patch.mpq --detailed
    """
    mpq_path = Path(mpq_file)

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


@mpq.command('info')
@click.argument('mpq_file', type=click.Path(exists=True))
def mpq_info(mpq_file: str):
    """Show information about an MPQ archive.

    Example:
        zep mpq info patch-z.mpq
    """
    mpq_path = Path(mpq_file)

    result = run_mpqcli(['info', str(mpq_path)], capture_output=True)

    if result.returncode != 0:
        if result.stderr:
            click.echo(result.stderr, err=True)
        raise click.ClickException(f"mpqcli info failed with code {result.returncode}")

    if result.stdout:
        click.echo(result.stdout)
