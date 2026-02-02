#!/usr/bin/env python3
"""
Zeppelin-Craft CLI (zep)

Unified interface for managing Zeppelin Packages (zpaks) - self-contained
customization units for WoW 3.3.5a private server development.

Usage:
    zep zpak list              List all packages
    zep zpak info <name>       Show package details
    zep zpak create <name>     Create new package
    zep forge status           Check fork sync status
    zep dbc query "..."        Query DBC database
    zep sql format <target>    Format SQL files
    zep mpq pack <zpak>        Pack MPQ archive
    zep build all              Build everything
    zep doctor                 Verify toolchain
"""

import sys
from pathlib import Path

# Add cli directory to path for imports
CLI_DIR = Path(__file__).parent
CRAFT_ROOT = CLI_DIR.parent
sys.path.insert(0, str(CLI_DIR))

try:
    import click
except ImportError:
    print("Error: Click library not installed.")
    print("Install with: pip install click")
    sys.exit(1)

from lib.registry import Registry
from lib.manifest import load_manifest, validate_manifest

# Version info
__version__ = "0.1.0"


@click.group()
@click.version_option(version=__version__, prog_name="zep")
@click.pass_context
def cli(ctx):
    """Zeppelin-Craft CLI - Manage Zeppelin Packages (zpaks)"""
    ctx.ensure_object(dict)
    ctx.obj['craft_root'] = CRAFT_ROOT
    ctx.obj['registry'] = Registry(CRAFT_ROOT / 'registry.json')


# =============================================================================
# zpak command group
# =============================================================================

@cli.group()
@click.pass_context
def zpak(ctx):
    """Package management commands"""
    pass


@zpak.command('list')
@click.option('--all', '-a', 'show_all', is_flag=True, help='Include disabled packages')
@click.pass_context
def zpak_list(ctx, show_all):
    """List all packages with status"""
    registry = ctx.obj['registry']
    craft_root = ctx.obj['craft_root']

    # Scan internal zpaks
    zpaks_dir = craft_root / 'zpaks'
    external_dir = craft_root / 'external'

    packages = []

    # Internal packages
    if zpaks_dir.exists():
        for pkg_dir in sorted(zpaks_dir.iterdir()):
            if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                manifest = load_manifest(pkg_dir / 'zpak.json')
                if manifest:
                    packages.append({
                        'name': manifest.get('name', pkg_dir.name),
                        'type': manifest.get('type', 'unknown'),
                        'version': manifest.get('version', '?'),
                        'enabled': manifest.get('enabled', True),
                        'location': 'internal',
                        'description': manifest.get('description', '')[:50]
                    })

    # External packages
    if external_dir.exists():
        for pkg_dir in sorted(external_dir.iterdir()):
            if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                manifest = load_manifest(pkg_dir / 'zpak.json')
                if manifest:
                    packages.append({
                        'name': manifest.get('name', pkg_dir.name),
                        'type': manifest.get('type', 'unknown'),
                        'version': manifest.get('version', '?'),
                        'enabled': manifest.get('enabled', True),
                        'location': 'external',
                        'description': manifest.get('description', '')[:50]
                    })

    if not packages:
        click.echo("No packages found.")
        click.echo("\nCreate a package with: zep zpak create <name>")
        return

    # Filter disabled if not --all
    if not show_all:
        packages = [p for p in packages if p['enabled']]

    # Print table
    click.echo(f"\n{'Name':<25} {'Type':<15} {'Version':<10} {'Location':<10} {'Status':<8}")
    click.echo("-" * 75)

    for pkg in packages:
        status = click.style("ON", fg='green') if pkg['enabled'] else click.style("OFF", fg='red')
        click.echo(f"{pkg['name']:<25} {pkg['type']:<15} {pkg['version']:<10} {pkg['location']:<10} {status}")

    click.echo(f"\n{len(packages)} package(s) found")


@zpak.command('info')
@click.argument('name')
@click.pass_context
def zpak_info(ctx, name):
    """Show detailed package information"""
    craft_root = ctx.obj['craft_root']

    # Find package
    pkg_path = None
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        candidate = base / name / 'zpak.json'
        if candidate.exists():
            pkg_path = candidate
            break

    if not pkg_path:
        click.echo(f"Error: Package '{name}' not found", err=True)
        sys.exit(1)

    manifest = load_manifest(pkg_path)
    if not manifest:
        click.echo(f"Error: Could not load manifest for '{name}'", err=True)
        sys.exit(1)

    # Display info
    click.echo(f"\n{click.style(manifest['name'], bold=True)} v{manifest.get('version', '?')}")
    click.echo(f"Type: {manifest.get('type', 'unknown')}")
    click.echo(f"Author: {manifest.get('author', 'unknown')}")
    click.echo(f"Status: {'Enabled' if manifest.get('enabled', True) else 'Disabled'}")
    click.echo(f"Priority: {manifest.get('priority', 100)}")
    click.echo(f"\nDescription:\n  {manifest.get('description', 'No description')}")

    # Show contents
    contents = manifest.get('contents', {})
    if contents:
        click.echo("\nContents:")
        for content_type, patterns in contents.items():
            if patterns:
                if isinstance(patterns, list):
                    click.echo(f"  {content_type}: {', '.join(patterns)}")
                elif isinstance(patterns, dict):
                    click.echo(f"  {content_type}: {patterns}")

    # Show AC module info if applicable
    acore = manifest.get('acore')
    if acore:
        click.echo(f"\nAzerothCore Module:")
        click.echo(f"  Module: {acore.get('module')}")
        click.echo(f"  Source: {acore.get('source')}")
        click.echo(f"  Branch: {acore.get('branch', 'master')}")
        click.echo(f"  Patch Mode: {acore.get('patch_mode', 'single')}")

    # Show dependencies
    deps = manifest.get('dependencies', [])
    if deps:
        click.echo(f"\nDependencies: {', '.join(deps)}")

    # Show feature ID
    if manifest.get('feature_id'):
        click.echo(f"\nFeature: {manifest['feature_id']}")

    click.echo()


@zpak.command('create')
@click.argument('name')
@click.option('--type', '-t', 'pkg_type',
              type=click.Choice(['native', 'acore-extension', 'mpq', 'hybrid']),
              default='native', help='Package type')
@click.option('--description', '-d', default='', help='Package description')
@click.pass_context
def zpak_create(ctx, name, pkg_type, description):
    """Create a new internal package"""
    import json

    craft_root = ctx.obj['craft_root']
    pkg_dir = craft_root / 'zpaks' / name

    if pkg_dir.exists():
        click.echo(f"Error: Package '{name}' already exists", err=True)
        sys.exit(1)

    # Validate name
    import re
    if not re.match(r'^[a-z0-9-]+$', name):
        click.echo("Error: Package name must be lowercase alphanumeric with hyphens only", err=True)
        sys.exit(1)

    # Create directory structure
    pkg_dir.mkdir(parents=True)

    # Create subdirectories based on type
    if pkg_type in ['native', 'hybrid']:
        (pkg_dir / 'sql').mkdir()
        (pkg_dir / 'dbc').mkdir()

    if pkg_type in ['acore-extension', 'hybrid']:
        (pkg_dir / 'patches').mkdir()

    if pkg_type in ['mpq', 'hybrid']:
        (pkg_dir / 'assets').mkdir()

    # Create manifest
    manifest = {
        "$schema": "../../schemas/zpak.schema.json",
        "name": name,
        "version": "0.1.0",
        "description": description or f"Zeppelin Package: {name}",
        "author": "Zeppelin Team",
        "type": pkg_type,
        "contents": {}
    }

    # Add type-specific content declarations
    if pkg_type == 'native':
        manifest['contents'] = {
            "sql": ["sql/*.sql"],
            "dbc": ["dbc/*.sql"],
            "mpq": None
        }
    elif pkg_type == 'acore-extension':
        manifest['contents'] = {
            "patches": ["patches/*.patch"],
            "sql": ["sql/*.sql"],
            "dbc": ["dbc/*.sql"]
        }
        manifest['acore'] = {
            "module": f"mod-{name.replace('-zeppelin', '')}",
            "source": "https://github.com/CHANGEME/CHANGEME.git",
            "branch": "master",
            "patch_mode": "single"
        }
    elif pkg_type == 'mpq':
        manifest['contents'] = {
            "mpq": {
                "assets": ["assets/"],
                "output": f"PATCH-{name[0].upper()}.MPQ"
            }
        }
    elif pkg_type == 'hybrid':
        manifest['contents'] = {
            "patches": ["patches/*.patch"],
            "sql": ["sql/*.sql"],
            "dbc": ["dbc/*.sql"],
            "mpq": {
                "assets": ["assets/"],
                "output": f"PATCH-{name[0].upper()}.MPQ"
            }
        }

    manifest['enabled'] = True
    manifest['priority'] = 100

    # Write manifest
    with open(pkg_dir / 'zpak.json', 'w') as f:
        json.dump(manifest, f, indent=2)
        f.write('\n')

    click.echo(f"Created package: {name}")
    click.echo(f"Location: {pkg_dir}")
    click.echo(f"Type: {pkg_type}")
    click.echo("\nNext steps:")
    click.echo(f"  1. Edit {pkg_dir / 'zpak.json'} to update description and settings")
    if pkg_type == 'acore-extension':
        click.echo("  2. Update the 'acore.source' field with the upstream repository URL")
    click.echo(f"  3. Add your content to the appropriate subdirectories")


@zpak.command('validate')
@click.argument('name', required=False)
@click.pass_context
def zpak_validate(ctx, name):
    """Validate package manifest(s)"""
    craft_root = ctx.obj['craft_root']

    packages_to_check = []

    if name:
        # Validate specific package
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / name / 'zpak.json'
            if candidate.exists():
                packages_to_check.append(candidate)
                break

        if not packages_to_check:
            click.echo(f"Error: Package '{name}' not found", err=True)
            sys.exit(1)
    else:
        # Validate all packages
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if base.exists():
                for pkg_dir in base.iterdir():
                    manifest_path = pkg_dir / 'zpak.json'
                    if manifest_path.exists():
                        packages_to_check.append(manifest_path)

    if not packages_to_check:
        click.echo("No packages to validate")
        return

    errors = 0
    for manifest_path in packages_to_check:
        pkg_name = manifest_path.parent.name
        valid, error_msg = validate_manifest(manifest_path)

        if valid:
            click.echo(f"{click.style('OK', fg='green')} {pkg_name}")
        else:
            click.echo(f"{click.style('FAIL', fg='red')} {pkg_name}: {error_msg}")
            errors += 1

    click.echo(f"\nValidated {len(packages_to_check)} package(s), {errors} error(s)")

    if errors > 0:
        sys.exit(1)


# =============================================================================
# Placeholder command groups (to be implemented)
# =============================================================================

@cli.group()
def forge():
    """Fork sync commands (acore-extension packages)"""
    pass


@forge.command('status')
@click.argument('name', required=False)
def forge_status(name):
    """Check upstream sync status"""
    click.echo("TODO: Implement forge status (port from fork_sync.py)")
    click.echo("See F-037 Disposable Forks Architecture")


@cli.group()
def dbc():
    """DBC database commands"""
    pass


@dbc.command('query')
@click.argument('sql')
def dbc_query(sql):
    """Query DBC database"""
    click.echo("TODO: Implement dbc query (port from dbc.py)")
    click.echo("See F-040 DBC Management Framework")


@cli.group()
def sql():
    """SQL operations"""
    pass


@sql.command('format')
@click.argument('target')
def sql_format(target):
    """Format SQL files"""
    click.echo("TODO: Implement sql format (port from SQL Reformatter)")
    click.echo("See F-021 SQL Reformatter")


# Import mpq commands from module
from commands.mpq import mpq
cli.add_command(mpq)


@cli.group()
def build():
    """Build operations"""
    pass


@build.command('all')
def build_all():
    """Build everything (SQL + DBC + MPQ)"""
    click.echo("TODO: Implement build all")


@cli.command()
def doctor():
    """Verify toolchain and dependencies"""
    click.echo("Checking Zeppelin-Craft toolchain...\n")

    checks = []

    # Check Python
    import sys
    checks.append(('Python', f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}", True))

    # Check Click
    try:
        from importlib.metadata import version as get_version
        click_version = get_version('click')
    except Exception:
        click_version = 'installed'
    checks.append(('Click', click_version, True))

    # Check MySQL client
    import shutil
    mysql_path = shutil.which('mysql')
    checks.append(('MySQL client', mysql_path or 'NOT FOUND', bool(mysql_path)))

    # Check mpqcli
    mpqcli_path = Path('/workspace/project/Zeppelin-Tools/mpqcli/mpqcli')
    checks.append(('mpqcli', str(mpqcli_path) if mpqcli_path.exists() else 'NOT FOUND', mpqcli_path.exists()))

    # Check DBCTool
    dbctool_path = Path('/workspace/project/Zeppelin-Tools/DBCTool/dbctool')
    checks.append(('DBCTool', str(dbctool_path) if dbctool_path.exists() else 'NOT FOUND', dbctool_path.exists()))

    # Print results
    all_ok = True
    for name, value, ok in checks:
        status = click.style('OK', fg='green') if ok else click.style('MISSING', fg='red')
        click.echo(f"  {name:<15} {status:<12} {value}")
        if not ok:
            all_ok = False

    click.echo()
    if all_ok:
        click.echo(click.style("All checks passed!", fg='green'))
    else:
        click.echo(click.style("Some checks failed. Install missing dependencies.", fg='yellow'))
        sys.exit(1)


if __name__ == '__main__':
    cli()
