#!/usr/bin/env python3
"""
Zeppelin-Craft CLI (zep)

Unified interface for managing Zeppelin Packages (zpaks) - self-contained
customization units for WoW 3.3.5a private server development.

Usage:
    zep                        Enter interactive shell
    zep shell                  Enter interactive shell
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
from lib.logging_config import setup_logging, get_logger

# Initialize logging at startup
setup_logging()
logger = get_logger('cli.main')

# Version info
__version__ = "0.2.0"


@click.group(invoke_without_command=True)
@click.version_option(version=__version__, prog_name="zep")
@click.pass_context
def cli(ctx):
    """Zeppelin-Craft CLI - Manage Zeppelin Packages (zpaks)"""
    ctx.ensure_object(dict)
    ctx.obj['craft_root'] = CRAFT_ROOT
    ctx.obj['registry'] = Registry(CRAFT_ROOT / 'registry.json')

    # If no command provided, enter interactive shell
    if ctx.invoked_subcommand is None:
        from commands.shell import run_shell
        run_shell(cli, ctx)


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
@click.argument('name', required=False)
@click.pass_context
def zpak_info(ctx, name):
    """Show detailed package information"""
    craft_root = ctx.obj['craft_root']

    # Interactive selection if no name provided
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Install with: pip install simple-term-menu\n"
                "Or specify zpak name: zep zpak info <name>"
            )

        # Collect zpaks
        zpaks = []
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if not base.exists():
                continue
            for pkg_dir in sorted(base.iterdir()):
                if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                    manifest = load_manifest(pkg_dir / 'zpak.json')
                    if manifest:
                        zpaks.append({
                            'name': manifest.get('name', pkg_dir.name),
                            'type': manifest.get('type', 'unknown'),
                            'description': manifest.get('description', '')[:35],
                            'enabled': manifest.get('enabled', True)
                        })

        if not zpaks:
            click.echo("No zpaks found")
            return

        # Build menu
        options = []
        for z in zpaks:
            status = "✓" if z['enabled'] else "○"
            options.append(f"{status} {z['name']:<25} [{z['type']:<15}] {z['description']}")

        options.append("─" * 60)
        options.append("[Cancel]")

        menu = TerminalMenu(
            options,
            title="\n  Select zpak to view:\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()

        if result is None or result >= len(zpaks):
            click.echo("Cancelled.")
            return

        name = zpaks[result]['name']

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
@click.argument('name', required=False)
@click.option('--type', '-t', 'pkg_type',
              type=click.Choice(['native', 'acore-extension', 'mpq', 'hybrid']),
              help='Package type')
@click.option('--description', '-d', default='', help='Package description')
@click.pass_context
def zpak_create(ctx, name, pkg_type, description):
    """Create a new internal package (interactive if no args)"""
    import json
    import re

    craft_root = ctx.obj['craft_root']

    # Interactive mode if no name provided
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Install with: pip install simple-term-menu\n"
                "Or specify: zep zpak create <name> --type <type>"
            )

        click.echo("\n  Create New Zpak\n")

        # Get name
        try:
            name = input("  Name (lowercase, hyphens ok): ").strip()
            if not name:
                click.echo("Cancelled.")
                return
        except (KeyboardInterrupt, EOFError):
            click.echo("\nCancelled.")
            return

        if not re.match(r'^[a-z0-9-]+$', name):
            raise click.ClickException("Name must be lowercase alphanumeric with hyphens only")

        # Check if exists
        pkg_dir = craft_root / 'zpaks' / name
        if pkg_dir.exists():
            raise click.ClickException(f"Package '{name}' already exists")

        # Get type
        if not pkg_type:
            type_options = [
                "mpq             Client-side assets (models, textures)",
                "acore-extension Wraps an AzerothCore module",
                "native          Pure Zeppelin content (SQL, Lua)",
                "hybrid          Combination of native + mpq",
                "─" * 50,
                "[Cancel]"
            ]

            click.echo()
            menu = TerminalMenu(
                type_options,
                title="  Select package type:\n",
                menu_cursor="> ",
                menu_cursor_style=("fg_cyan", "bold"),
                menu_highlight_style=("fg_cyan", "bold"),
            )

            result = menu.show()
            if result is None or result >= 4:
                click.echo("Cancelled.")
                return

            pkg_type = ['mpq', 'acore-extension', 'native', 'hybrid'][result]

        # Get description
        if not description:
            try:
                description = input(f"\n  Description (enter to skip): ").strip()
            except (KeyboardInterrupt, EOFError):
                click.echo("\nCancelled.")
                return

        # Confirm
        click.echo(f"\n  Creating zpak:")
        click.echo(f"    Name: {name}")
        click.echo(f"    Type: {pkg_type}")
        click.echo(f"    Desc: {description or '(none)'}")

        if not click.confirm("\n  Proceed?"):
            click.echo("Cancelled.")
            return

    else:
        # Non-interactive validation
        if not re.match(r'^[a-z0-9-]+$', name):
            click.echo("Error: Package name must be lowercase alphanumeric with hyphens only", err=True)
            sys.exit(1)

        pkg_dir = craft_root / 'zpaks' / name
        if pkg_dir.exists():
            click.echo(f"Error: Package '{name}' already exists", err=True)
            sys.exit(1)

        if not pkg_type:
            pkg_type = 'native'

    pkg_dir = craft_root / 'zpaks' / name

    # Create directory structure - always create full structure for consistency
    pkg_dir.mkdir(parents=True)

    # Standard folders (always created)
    standard_folders = [
        'mpq/source-binary',
        'mpq/source-assets',
        'mpq/parsed-assets',
        'patches',
        'sql',
        'dbc'
    ]

    for folder in standard_folders:
        folder_path = pkg_dir / folder
        folder_path.mkdir(parents=True, exist_ok=True)
        (folder_path / '.gitkeep').touch()

    # Create .gitignore for large binary files
    gitignore_content = """# Large binary files (not tracked in git)
*.mpq
*.MPQ
*.m2
*.M2
*.blp
*.BLP
*.skin
*.anim
*.bone
*.wmo
*.WMO
*.adt
*.ADT
*.wdt
*.WDT
*.wdl
*.WDL
*.zmp
*.dbc
*.DBC
*.tex
*.trs
"""
    (pkg_dir / '.gitignore').write_text(gitignore_content)

    # Create manifest
    manifest = {
        "$schema": "../../schemas/zpak.schema.json",
        "name": name,
        "version": "0.1.0",
        "description": description or f"Zeppelin Package: {name}",
        "author": "Zeppelin Team",
        "type": pkg_type,
    }

    # Add type-specific settings
    if pkg_type == 'native':
        manifest['contents'] = {
            "sql": ["sql/*.sql"],
            "dbc": ["dbc/*.sql"]
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
        # MPQ assets are in mpq/parsed-assets by convention - no need to declare
        manifest['client_patch'] = "PATCH-X"  # User should update this
    elif pkg_type == 'hybrid':
        manifest['contents'] = {
            "patches": ["patches/*.patch"],
            "sql": ["sql/*.sql"],
            "dbc": ["dbc/*.sql"]
        }
        manifest['client_patch'] = "PATCH-X"  # User should update this

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


@zpak.command('toggle')
@click.argument('name', required=False)
@click.pass_context
def zpak_toggle(ctx, name):
    """Enable or disable a package"""
    import json

    craft_root = ctx.obj['craft_root']

    # Interactive selection if no name
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Or specify: zep zpak toggle <name>"
            )

        # Collect zpaks
        zpaks = []
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if not base.exists():
                continue
            for pkg_dir in sorted(base.iterdir()):
                if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                    manifest = load_manifest(pkg_dir / 'zpak.json')
                    if manifest:
                        zpaks.append({
                            'name': manifest.get('name', pkg_dir.name),
                            'enabled': manifest.get('enabled', True),
                            'path': pkg_dir
                        })

        if not zpaks:
            click.echo("No zpaks found")
            return

        options = []
        for z in zpaks:
            status = "✓ Enabled " if z['enabled'] else "○ Disabled"
            options.append(f"{status}  {z['name']}")

        options.append("─" * 40)
        options.append("[Cancel]")

        menu = TerminalMenu(
            options,
            title="\n  Select zpak to toggle:\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()
        if result is None or result >= len(zpaks):
            click.echo("Cancelled.")
            return

        selected = zpaks[result]
        name = selected['name']
        pkg_path = selected['path']
    else:
        # Find by name
        pkg_path = None
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / name
            if candidate.exists() and (candidate / 'zpak.json').exists():
                pkg_path = candidate
                break

        if not pkg_path:
            raise click.ClickException(f"Package '{name}' not found")

    # Load and toggle
    manifest_path = pkg_path / 'zpak.json'
    manifest = load_manifest(manifest_path)
    if not manifest:
        raise click.ClickException(f"Could not load manifest for '{name}'")

    current = manifest.get('enabled', True)
    manifest['enabled'] = not current

    with open(manifest_path, 'w') as f:
        json.dump(manifest, f, indent=2)
        f.write('\n')

    new_status = "enabled" if manifest['enabled'] else "disabled"
    click.echo(f"{name}: {new_status}")


@zpak.command('edit')
@click.argument('name', required=False)
@click.pass_context
def zpak_edit(ctx, name):
    """Edit package settings interactively"""
    import json

    craft_root = ctx.obj['craft_root']

    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        raise click.ClickException(
            "This command requires simple-term-menu.\n"
            "Install with: pip install simple-term-menu"
        )

    # Select zpak if not provided
    if not name:
        zpaks = []
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if not base.exists():
                continue
            for pkg_dir in sorted(base.iterdir()):
                if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                    manifest = load_manifest(pkg_dir / 'zpak.json')
                    if manifest:
                        zpaks.append({
                            'name': manifest.get('name', pkg_dir.name),
                            'path': pkg_dir
                        })

        if not zpaks:
            click.echo("No zpaks found")
            return

        options = [z['name'] for z in zpaks]
        options.append("─" * 30)
        options.append("[Cancel]")

        menu = TerminalMenu(
            options,
            title="\n  Select zpak to edit:\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()
        if result is None or result >= len(zpaks):
            click.echo("Cancelled.")
            return

        name = zpaks[result]['name']
        pkg_path = zpaks[result]['path']
    else:
        pkg_path = None
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / name
            if candidate.exists() and (candidate / 'zpak.json').exists():
                pkg_path = candidate
                break

        if not pkg_path:
            raise click.ClickException(f"Package '{name}' not found")

    manifest_path = pkg_path / 'zpak.json'
    manifest = load_manifest(manifest_path)
    if not manifest:
        raise click.ClickException(f"Could not load manifest for '{name}'")

    # Editable fields
    editable_fields = [
        ('description', 'Description', str),
        ('version', 'Version', str),
        ('author', 'Author', str),
        ('priority', 'Priority', int),
        ('feature_id', 'Feature ID', str),
        ('dbc_source', 'DBC Source Path', str),
    ]

    while True:
        # Build field menu
        options = []
        for field, label, _ in editable_fields:
            current = manifest.get(field, '')
            display = str(current)[:40] if current else '(not set)'
            options.append(f"{label:<18} {display}")

        options.append("─" * 50)
        options.append("[Save & Exit]")
        options.append("[Cancel]")

        menu = TerminalMenu(
            options,
            title=f"\n  Editing: {name}\n  Select field to edit:\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()

        if result is None or result == len(editable_fields) + 2:  # Cancel
            click.echo("Cancelled (changes discarded).")
            return

        if result == len(editable_fields) + 1:  # Save & Exit
            with open(manifest_path, 'w') as f:
                json.dump(manifest, f, indent=2)
                f.write('\n')
            click.echo(f"Saved: {manifest_path}")
            return

        if result < len(editable_fields):
            field, label, field_type = editable_fields[result]
            current = manifest.get(field, '')

            click.echo(f"\n  {label}")
            click.echo(f"  Current: {current or '(not set)'}")

            try:
                new_value = input("  New value (empty to clear): ").strip()
            except (KeyboardInterrupt, EOFError):
                continue

            if new_value:
                if field_type == int:
                    try:
                        manifest[field] = int(new_value)
                    except ValueError:
                        click.echo("  Invalid number")
                        input("  Press Enter to continue...")
                        continue
                else:
                    manifest[field] = new_value
            elif field in manifest:
                del manifest[field]


@zpak.command('delete')
@click.argument('name', required=False)
@click.option('--force', '-f', is_flag=True, help='Skip confirmation')
@click.pass_context
def zpak_delete(ctx, name, force):
    """Delete a package"""
    import shutil

    craft_root = ctx.obj['craft_root']

    # Interactive selection if no name
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Or specify: zep zpak delete <name>"
            )

        zpaks = []
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            if not base.exists():
                continue
            for pkg_dir in sorted(base.iterdir()):
                if pkg_dir.is_dir() and (pkg_dir / 'zpak.json').exists():
                    manifest = load_manifest(pkg_dir / 'zpak.json')
                    if manifest:
                        zpaks.append({
                            'name': manifest.get('name', pkg_dir.name),
                            'path': pkg_dir,
                            'type': manifest.get('type', 'unknown')
                        })

        if not zpaks:
            click.echo("No zpaks found")
            return

        options = [f"{z['name']:<25} [{z['type']}]" for z in zpaks]
        options.append("─" * 40)
        options.append("[Cancel]")

        menu = TerminalMenu(
            options,
            title="\n  Select zpak to DELETE:\n  (This cannot be undone!)\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_red", "bold"),
            menu_highlight_style=("fg_red", "bold"),
            cycle_cursor=True,
            clear_screen=True,
        )

        result = menu.show()
        if result is None or result >= len(zpaks):
            click.echo("Cancelled.")
            return

        name = zpaks[result]['name']
        pkg_path = zpaks[result]['path']
    else:
        pkg_path = None
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / name
            if candidate.exists() and (candidate / 'zpak.json').exists():
                pkg_path = candidate
                break

        if not pkg_path:
            raise click.ClickException(f"Package '{name}' not found")

    # Show what will be deleted
    file_count = sum(1 for _ in pkg_path.rglob('*') if _.is_file())
    click.echo(f"\nPackage: {name}")
    click.echo(f"Path: {pkg_path}")
    click.echo(f"Files: {file_count}")

    if not force:
        click.echo(click.style("\nThis will permanently delete the package!", fg='red'))
        if not click.confirm("Are you sure?"):
            click.echo("Cancelled.")
            return

    shutil.rmtree(pkg_path)
    click.echo(f"Deleted: {name}")


# =============================================================================
# Placeholder command groups (to be implemented)
# =============================================================================

# Import forge commands from module
from commands.forge import forge
cli.add_command(forge)

# Import config commands under zpak group
from commands.config import config
zpak.add_command(config)

# Import dbc commands from module
from commands.dbc import dbc
cli.add_command(dbc)


# Import sql commands from module
from commands.sql import sql
cli.add_command(sql)


# Import mpq commands from module
from commands.mpq import mpq
cli.add_command(mpq)


@cli.group()
@click.pass_context
def build(ctx):
    """Build operations"""
    pass


@build.command('sql')
@click.option('--changed', '-c', is_flag=True, help='Only execute changed files (git-based)')
@click.option('--zpak', '-z', 'zpak_name', help='Execute SQL from specific zpak')
@click.option('--all', '-a', 'run_all', is_flag=True, help='Execute all zpak SQL files')
@click.option('--dry-run', '-n', is_flag=True, help='Show what would be executed')
@click.pass_context
def build_sql(ctx, changed, zpak_name, run_all, dry_run):
    """Execute SQL files on acore_world.

    Examples:
        zep build sql --changed      # Only uncommitted changes
        zep build sql --zpak core    # Specific zpak
        zep build sql --all          # All enabled zpaks
    """
    from commands.sql import find_zpak_sql_files, execute_sql_file, get_git_changed_files

    craft_root = ctx.obj['craft_root']
    sql_files = []

    if changed:
        sql_files = get_git_changed_files(craft_root, ['.sql'])
        if not sql_files:
            click.echo("No changed SQL files found")
            return
    elif zpak_name:
        sql_files = find_zpak_sql_files(craft_root, zpak_name)
        if not sql_files:
            click.echo(f"No SQL files found in zpak '{zpak_name}'")
            return
    elif run_all:
        sql_files = find_zpak_sql_files(craft_root)
        if not sql_files:
            click.echo("No SQL files found in any zpak")
            return
    else:
        click.echo("Specify --changed, --zpak <name>, or --all")
        return

    click.echo(f"\n{'[DRY RUN] ' if dry_run else ''}Executing {len(sql_files)} SQL file(s)...\n")

    success = 0
    errors = 0
    for sql_file in sql_files:
        try:
            rel_path = sql_file.relative_to(craft_root)
        except ValueError:
            rel_path = sql_file

        ok, msg = execute_sql_file(sql_file, dry_run)
        if ok:
            click.echo(f"  {click.style('✓', fg='green')} {rel_path}")
            success += 1
        else:
            click.echo(f"  {click.style('✗', fg='red')} {rel_path}: {msg}")
            errors += 1

    click.echo()
    if errors == 0:
        click.echo(click.style(f"All {success} file(s) executed successfully", fg='green'))
    else:
        click.echo(click.style(f"Completed: {success} succeeded, {errors} failed", fg='yellow'))


@build.command('all')
@click.pass_context
def build_all(ctx):
    """Build everything (SQL + DBC + MPQ)"""
    click.echo("TODO: Implement build all")
    click.echo("Will run: build sql, build dbc, build mpq")


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


@cli.command()
@click.pass_context
def shell(ctx):
    """Enter interactive shell mode"""
    from commands.shell import run_shell
    run_shell(cli, ctx)


if __name__ == '__main__':
    cli()
