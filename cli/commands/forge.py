"""
Forge commands for Zeppelin-Craft CLI.

Manages AzerothCore module forks and patch synchronization.
Migrated from Scripts/Fork Synchroniser/fork_sync.py (F-037).

Commands:
    zep forge status [--name X]       Show sync status for all or specific zpak
    zep forge build-patch --name X    Build patches from current repo state
    zep forge apply-patch --name X    Reset to upstream, apply existing patches
    zep forge sync --name X           Full cycle: build, reset, apply
"""

import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any

import click

# CLI library path
CLI_DIR = Path(__file__).parent.parent
sys.path.insert(0, str(CLI_DIR))

from lib.manifest import load_manifest
from lib.forge import (
    Colors,
    run_git,
    ensure_upstream,
    get_divergence,
    has_uncommitted_changes,
    reset_to_upstream,
    apply_patches,
    generate_patches,
    get_patch_commit_count
)


# Mapping from zpak name to old fork_config module name (for migration compatibility)
ZPAK_TO_MODULE = {
    "core-azerothcore": "azerothcore",
    "mod-individual-progression": "mod-individual-progression",
    "mod-accountbound": "mod-accountbound",
    "mod-racial-trait-swap": "mod-racial-trait-swap",
    "mod-reagent-bank-account": "mod-reagent-bank-account",
    "mod-worgoblin": "mod-worgoblin",
    "mod-dungeon-respawn": "DungeonRespawn",
    "mod-reusable-potion": "ReusablePotion",
    "mod-autobalance": "mod-autobalance",
    "mod-ah-bot": "mod-ah-bot-plus",
    "mod-starter-guild": "mod-starter-guild"
}


def get_zeppelin_core(craft_root: Path) -> Path:
    """Get path to Zeppelin-Core repository."""
    return craft_root.parent / "Zeppelin-Core"


def discover_acore_zpaks(craft_root: Path) -> List[Tuple[str, Path, Dict[str, Any]]]:
    """Discover all acore-extension zpaks.

    Args:
        craft_root: Path to Zeppelin-Craft root

    Returns:
        List of (name, path, manifest) tuples for acore-extension packages
    """
    zpaks = []
    zpaks_dir = craft_root / 'zpaks'

    if not zpaks_dir.exists():
        return zpaks

    for pkg_dir in sorted(zpaks_dir.iterdir()):
        if not pkg_dir.is_dir():
            continue

        manifest_path = pkg_dir / 'zpak.json'
        if not manifest_path.exists():
            continue

        manifest = load_manifest(manifest_path)
        if not manifest:
            continue

        if manifest.get('type') != 'acore-extension':
            continue

        zpaks.append((manifest['name'], pkg_dir, manifest))

    return zpaks


def get_module_path(craft_root: Path, acore_config: Dict[str, Any]) -> Path:
    """Get path to the AzerothCore module directory.

    Args:
        craft_root: Path to Zeppelin-Craft root
        acore_config: The 'acore' section from zpak manifest

    Returns:
        Full path to the module directory
    """
    # Explicit path override: forge-tracked repos that are NOT AzerothCore modules
    # (e.g. the spell editor tool). Resolved relative to the project root (the parent
    # of Zeppelin-Craft) unless absolute.
    explicit = acore_config.get('path')
    if explicit:
        p = Path(explicit)
        return p if p.is_absolute() else (craft_root.parent / p).resolve()

    zcore = get_zeppelin_core(craft_root)
    module_name = acore_config.get('module', '')

    # Special case: azerothcore itself is the root
    if module_name == 'azerothcore':
        return zcore

    # Standard modules are in modules/<name>
    return zcore / 'modules' / module_name


def get_patch_files(zpak_path: Path) -> List[Path]:
    """Get list of patch files for a zpak, sorted alphabetically.

    Args:
        zpak_path: Path to the zpak directory

    Returns:
        Sorted list of patch file paths
    """
    patch_dir = zpak_path / 'patches'
    if not patch_dir.exists():
        return []

    return sorted(patch_dir.glob("*.patch"))


def normalize_zpak_name(name: str) -> str:
    """Normalize a name to zpak name format.

    Accepts both new zpak names (e.g., 'mod-accountbound') and bare module
    names (e.g., 'accountbound') for backwards compatibility with older calls.

    Args:
        name: Input name

    Returns:
        Normalized zpak name. If name matches an old module name in
        ZPAK_TO_MODULE, returns the corresponding zpak name. Otherwise
        returns the input name as-is (validation happens later).
    """
    # Check if it's already a valid zpak name in legacy mapping
    if name in ZPAK_TO_MODULE:
        return name

    # Check if it's an old module name
    for zpak_name, module_name in ZPAK_TO_MODULE.items():
        if name == module_name:
            return zpak_name

    # Return name as-is - validation happens when matching against discovered zpaks
    return name


@click.group()
def forge():
    """Fork sync commands (acore-extension packages)"""
    pass


@forge.command('status')
@click.option('--name', '-n', help='Package name')
@click.option('--all', '-a', 'process_all', is_flag=True, help='Show all packages')
@click.pass_context
def forge_status(ctx, name: Optional[str], process_all: bool):
    """Show upstream sync status.

    Without arguments, shows status for all acore-extension packages.
    With --name, shows status for that specific package.
    """
    craft_root = ctx.obj['craft_root']
    zpaks = discover_acore_zpaks(craft_root)

    if not zpaks:
        click.echo("No acore-extension packages found.")
        click.echo("\nCreate one with: zep zpak create <name> -t acore-extension")
        return

    # Filter to specific package if requested (--all or no args = show all)
    if name:
        normalized = normalize_zpak_name(name)
        if not normalized:
            click.echo(click.style(f"Error: Unknown package '{name}'", fg='red'))
            click.echo(f"\nAvailable packages: {', '.join(z[0] for z in zpaks)}")
            sys.exit(1)

        zpaks = [(n, p, m) for n, p, m in zpaks if n == normalized]
        if not zpaks:
            click.echo(click.style(f"Error: Package '{normalized}' not found", fg='red'))
            sys.exit(1)

    click.echo(f"\n{Colors.BOLD}=== Module Status ==={Colors.RESET}\n")

    # Calculate column width
    name_width = max(len(z[0]) for z in zpaks) + 2

    for zpak_name, zpak_path, manifest in zpaks:
        acore = manifest.get('acore', {})
        module_path = get_module_path(craft_root, acore)
        patch_files = get_patch_files(zpak_path)
        upstream_url = acore.get('source', '')
        upstream_branch = acore.get('branch', 'master')
        patch_mode = acore.get('patch_mode', 'single')

        # Check if module exists
        if not module_path.exists():
            click.echo(f"{zpak_name:<{name_width}} {Colors.RED}NOT FOUND{Colors.RESET}")
            continue

        # Check upstream
        ensure_upstream(module_path, upstream_url)
        ahead, behind = get_divergence(module_path, upstream_branch)

        # Build status string
        parts = []

        if ahead is not None:
            if ahead > 0:
                parts.append(f"{Colors.CYAN}+{ahead} ours{Colors.RESET}")
            if behind > 0:
                parts.append(f"{Colors.YELLOW}-{behind} behind{Colors.RESET}")
            if ahead == 0 and behind == 0:
                parts.append(f"{Colors.GREEN}in sync{Colors.RESET}")

        if patch_files:
            total_size = sum(p.stat().st_size for p in patch_files) / 1024
            if patch_mode == "single":
                parts.append(f"zeppelin.patch ({total_size:.1f}K)")
            else:
                parts.append(f"{len(patch_files)} patches ({total_size:.1f}K)")
        else:
            parts.append("no patches")

        # Show mode indicator for granular
        if patch_mode == "granular":
            parts.append(f"{Colors.BLUE}[granular]{Colors.RESET}")

        status = " | ".join(parts)
        click.echo(f"{zpak_name:<{name_width}} {status}")

    click.echo()

forge_status.zpak_filter = 'acore-extension'


@forge.command('build-patch')
@click.option('--name', '-n', help='Package name')
@click.option('--all', '-a', 'process_all', is_flag=True, help='Process all packages')
@click.option('--force', '-f', is_flag=True, help='Overwrite patches even if repo has fewer commits')
@click.pass_context
def forge_build_patch(ctx, name: Optional[str], process_all: bool, force: bool):
    """Build patches from current repo state.

    Saves current commits as patches without modifying the repo.
    Use when tuning or cleaning up repos.

    WARNING: If the repo has fewer commits than existing patches, this will
    lose work. Use --force to override, or run apply-patch first.
    """
    craft_root = ctx.obj['craft_root']
    zpaks = discover_acore_zpaks(craft_root)

    if not zpaks:
        click.echo("No acore-extension packages found.")
        return

    # Determine which packages to process
    if process_all:
        targets = zpaks
    elif name:
        normalized = normalize_zpak_name(name)
        targets = [(n, p, m) for n, p, m in zpaks if n == normalized]
        if not targets:
            click.echo(click.style(f"Error: Package '{normalized}' not found", fg='red'))
            sys.exit(1)
    else:
        click.echo("Error: Specify --name <package> or use --all")
        sys.exit(1)

    click.echo(f"\n{Colors.BOLD}=== Building Patches for {len(targets)} package(s) ==={Colors.RESET}\n")

    results = {"success": 0, "failed": 0}

    for zpak_name, zpak_path, manifest in targets:
        acore = manifest.get('acore', {})
        module_path = get_module_path(craft_root, acore)
        patch_dir = zpak_path / 'patches'
        upstream_url = acore.get('source', '')
        upstream_branch = acore.get('branch', 'master')
        patch_mode = acore.get('patch_mode', 'single')

        if not module_path.exists():
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Module not found at {module_path}")
            results["failed"] += 1
            continue

        # Ensure upstream is available
        if not ensure_upstream(module_path, upstream_url):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to fetch upstream")
            results["failed"] += 1
            continue

        # Safety check: warn if repo has fewer commits than existing patches
        if not force:
            ahead, _ = get_divergence(module_path, upstream_branch)
            existing_count = get_patch_commit_count(patch_dir, patch_mode)
            if existing_count > 0 and ahead is not None and ahead < existing_count:
                click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Repo has {ahead} commits but patches contain {existing_count}")
                click.echo(f"   This may indicate a partial apply-patch. Run apply-patch first or use --force to overwrite.")
                results["failed"] += 1
                continue

        # Generate patches
        success, message = generate_patches(module_path, patch_dir, upstream_branch, patch_mode)

        if success:
            click.echo(f"{Colors.GREEN}✓{Colors.RESET} {zpak_name}: {message}")
            results["success"] += 1
        else:
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: {message}")
            results["failed"] += 1

    click.echo(f"\n{Colors.BOLD}Summary:{Colors.RESET} {results['success']} succeeded, {results['failed']} failed\n")

    if results["failed"] > 0:
        sys.exit(1)

forge_build_patch.zpak_filter = 'acore-extension'


@forge.command('apply-patch')
@click.option('--name', '-n', help='Package name')
@click.option('--all', '-a', 'process_all', is_flag=True, help='Process all packages')
@click.pass_context
def forge_apply_patch(ctx, name: Optional[str], process_all: bool):
    """Reset to upstream and apply existing patches.

    Resets repo to upstream and applies patches from zpak.
    Does NOT regenerate patches first.
    """
    craft_root = ctx.obj['craft_root']
    zpaks = discover_acore_zpaks(craft_root)

    if not zpaks:
        click.echo("No acore-extension packages found.")
        return

    # Determine which packages to process
    if process_all:
        targets = zpaks
    elif name:
        normalized = normalize_zpak_name(name)
        targets = [(n, p, m) for n, p, m in zpaks if n == normalized]
        if not targets:
            click.echo(click.style(f"Error: Package '{normalized}' not found", fg='red'))
            sys.exit(1)
    else:
        click.echo("Error: Specify --name <package> or use --all")
        sys.exit(1)

    click.echo(f"\n{Colors.BOLD}=== Applying Patches for {len(targets)} package(s) ==={Colors.RESET}\n")

    results = {"success": 0, "failed": 0}

    for zpak_name, zpak_path, manifest in targets:
        acore = manifest.get('acore', {})
        module_path = get_module_path(craft_root, acore)
        patch_files = get_patch_files(zpak_path)
        upstream_url = acore.get('source', '')
        upstream_branch = acore.get('branch', 'master')

        if not module_path.exists():
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Module not found at {module_path}")
            results["failed"] += 1
            continue

        if not patch_files:
            click.echo(f"{Colors.GREEN}✓{Colors.RESET} {zpak_name}: No patches to apply")
            results["success"] += 1
            continue

        # Ensure upstream is available
        if not ensure_upstream(module_path, upstream_url):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to fetch upstream")
            results["failed"] += 1
            continue

        # Reset to upstream
        if not reset_to_upstream(module_path, upstream_branch):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to reset to upstream")
            results["failed"] += 1
            continue

        # Apply patches
        applied, error = apply_patches(module_path, patch_files)

        if error:
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: {error} ({applied}/{len(patch_files)} applied)")
            results["failed"] += 1
        else:
            click.echo(f"{Colors.GREEN}✓{Colors.RESET} {zpak_name}: Applied {applied} patches to upstream")
            results["success"] += 1

    click.echo(f"\n{Colors.BOLD}Summary:{Colors.RESET} {results['success']} succeeded, {results['failed']} failed\n")

    if results["failed"] > 0:
        sys.exit(1)

forge_apply_patch.zpak_filter = 'acore-extension'


@forge.command('sync')
@click.option('--name', '-n', help='Package name')
@click.option('--all', '-a', 'process_all', is_flag=True, help='Process all packages')
@click.pass_context
def forge_sync(ctx, name: Optional[str], process_all: bool):
    """Full sync cycle: build patches, reset, apply.

    Extracts current commits as patches, resets to latest upstream,
    then replays patches. Use to bring repos up to date with upstream
    while preserving all custom changes.
    """
    craft_root = ctx.obj['craft_root']
    zpaks = discover_acore_zpaks(craft_root)

    if not zpaks:
        click.echo("No acore-extension packages found.")
        return

    # Determine which packages to process
    if process_all:
        targets = zpaks
    elif name:
        normalized = normalize_zpak_name(name)
        targets = [(n, p, m) for n, p, m in zpaks if n == normalized]
        if not targets:
            click.echo(click.style(f"Error: Package '{normalized}' not found", fg='red'))
            sys.exit(1)
    else:
        click.echo("Error: Specify --name <package> or use --all")
        sys.exit(1)

    click.echo(f"\n{Colors.BOLD}=== Syncing {len(targets)} package(s) ==={Colors.RESET}\n")

    results = {"success": 0, "failed": 0}

    for zpak_name, zpak_path, manifest in targets:
        acore = manifest.get('acore', {})
        module_path = get_module_path(craft_root, acore)
        patch_dir = zpak_path / 'patches'
        upstream_url = acore.get('source', '')
        upstream_branch = acore.get('branch', 'master')
        patch_mode = acore.get('patch_mode', 'single')

        if not module_path.exists():
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Module not found at {module_path}")
            results["failed"] += 1
            continue

        # Check for uncommitted changes
        if has_uncommitted_changes(module_path):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Uncommitted changes - commit or stash first")
            results["failed"] += 1
            continue

        # Ensure upstream is available
        if not ensure_upstream(module_path, upstream_url):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to fetch upstream")
            results["failed"] += 1
            continue

        # Check if there are any changes to sync
        ahead, _ = get_divergence(module_path, upstream_branch)
        if ahead == 0:
            click.echo(f"{Colors.GREEN}✓{Colors.RESET} {zpak_name}: Already in sync with upstream")
            results["success"] += 1
            continue

        # Step 1: Generate patches from current state
        success, message = generate_patches(module_path, patch_dir, upstream_branch, patch_mode)
        if not success:
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to generate patches - {message}")
            results["failed"] += 1
            continue

        # Get updated patch list
        patch_files = get_patch_files(zpak_path)
        if not patch_files:
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: No patches generated")
            results["failed"] += 1
            continue

        # Step 2: Reset to upstream
        if not reset_to_upstream(module_path, upstream_branch):
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: Failed to reset to upstream")
            results["failed"] += 1
            continue

        # Step 3: Apply patches
        applied, error = apply_patches(module_path, patch_files)

        if error:
            click.echo(f"{Colors.RED}✗{Colors.RESET} {zpak_name}: {error} ({applied}/{len(patch_files)} applied)")
            results["failed"] += 1
        else:
            total_size = sum(p.stat().st_size for p in patch_files) / 1024
            click.echo(f"{Colors.GREEN}✓{Colors.RESET} {zpak_name}: Refreshed: {applied} patches ({total_size:.1f}K) replayed on latest upstream")
            results["success"] += 1

    click.echo(f"\n{Colors.BOLD}Summary:{Colors.RESET} {results['success']} succeeded, {results['failed']} failed\n")

    if results["failed"] > 0:
        sys.exit(1)

forge_sync.zpak_filter = 'acore-extension'
