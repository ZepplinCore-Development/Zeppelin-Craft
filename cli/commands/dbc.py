"""
DBC database operations for Zeppelin-Craft CLI.

Commands for managing DBC (DataBase Client) files used by WoW 3.3.5a.
Integrates with the four-database architecture for safe, traceable editing.

Commands:
    zep dbc query "..."              Query DBC database
    zep dbc query -f file.sql        Query from file
    zep dbc modify --task F-XXX "..."  Modify with tracking
    zep dbc clone <src> <dst> --task   Clone spell
    zep dbc status                   Check uncommitted changes
    zep dbc diff [--sql]             Show differences
    zep dbc sources [-v]             List zpak DBC sources
    zep dbc rebuild [--dry-run]      Rebuild from zpak sources
    zep dbc import-module            Import binary DBC
    zep dbc export                   Export to binary DBC
"""

import json
import os
import re
import subprocess
import sys
from pathlib import Path
from typing import Optional, List, Dict, Any, Tuple, Set

import click

# Add lib directory to path
CLI_DIR = Path(__file__).parent.parent
sys.path.insert(0, str(CLI_DIR))

from lib.dbc_utils import (
    DBCConfig,
    DBCConnection,
    is_modification,
    detect_modified_tables,
    validate_task_id,
    compare_databases,
    get_table_diff,
    generate_diff_sql,
    generate_full_diff_sql,
    run_sql,
    append_to_zpak_dbc,
    get_tables,
    get_row_count,
    get_primary_key,
    # DBC tracking functions
    ensure_dbc_tracking_table,
    calculate_file_hash,
    get_stored_dbc_hash,
    get_all_stored_dbc_hashes,
    update_dbc_tracking,
    clear_dbc_tracking,
    parse_sql_affected_ids,
    extract_table_from_filename,
)
from lib.registry import Registry
from lib.manifest import load_manifest
from lib.logging_config import get_logger, log_subprocess, log_sql, log_command

logger = get_logger('cli.dbc')


# Paths
CRAFT_ROOT = CLI_DIR.parent
ENV_PATH = CRAFT_ROOT / 'Scripts' / 'Patch Builder' / '.env'
DBCTOOL_PATH = Path('/workspace/project/Zeppelin-Tools/DBCTool/dbctool')


def get_dbc_config(ctx) -> DBCConfig:
    """Get DBC configuration from context."""
    registry = ctx.obj.get('registry')
    if registry:
        return DBCConfig.from_registry(registry._data, ENV_PATH)
    return DBCConfig.from_env(ENV_PATH)


def find_zpak_for_feature(craft_root: Path, feature_id: str, registry: Registry) -> Optional[Path]:
    """Find zpak path for a feature ID.

    First checks registry feature_index, then scans zpak.json files.

    Args:
        craft_root: Path to Zeppelin-Craft
        feature_id: Feature ID (F-XXX or I-XXX)
        registry: Registry instance

    Returns:
        Path to zpak directory or None
    """
    # Check registry first
    zpak_name = registry.get_zpak_for_feature(feature_id)
    if zpak_name:
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / zpak_name
            if candidate.exists():
                return candidate

    # Scan zpaks for feature_id
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        if not base.exists():
            continue
        for pkg_dir in base.iterdir():
            if not pkg_dir.is_dir():
                continue
            manifest_path = pkg_dir / 'zpak.json'
            if not manifest_path.exists():
                continue

            manifest = load_manifest(manifest_path)
            if manifest and manifest.get('feature_id') == feature_id:
                # Auto-register for future lookups
                registry.register_feature(feature_id, pkg_dir.name)
                registry.save()
                return pkg_dir

    return None


def git_commit_changes(craft_root: Path, files: List[Path], task_id: str,
                       description: str = None) -> bool:
    """Create a git commit with the specified files.

    Args:
        craft_root: Path to Zeppelin-Craft
        files: List of files to commit
        task_id: Task ID for commit message
        description: Optional description

    Returns:
        True if commit created
    """
    os.chdir(craft_root)

    # Check for changes
    result = subprocess.run(
        ['git', 'status', '--porcelain'] + [str(f) for f in files],
        capture_output=True, text=True
    )

    if not result.stdout.strip():
        return False

    # Stage files
    for f in files:
        subprocess.run(['git', 'add', str(f)], check=True)

    # Build commit message
    if description:
        commit_msg = f"WIP: {task_id} - {description}"
    else:
        commit_msg = f"WIP: {task_id} - DBC changes"

    commit_msg += "\n\n\U0001F916 Generated with [Claude Code](https://claude.com/claude-code)\n\nCo-Authored-By: Claude <noreply@anthropic.com>"

    # Create commit
    result = subprocess.run(
        ['git', 'commit', '-m', commit_msg],
        capture_output=True, text=True
    )

    return result.returncode == 0


# =============================================================================
# Click Command Group
# =============================================================================

# Command groupings for interactive menu
DBC_MENU_GROUPS = {
    'Search': {
        'description': 'Query and inspect DBC data',
        'commands': ['query', 'sources', 'status', 'conflicts']
    },
    'Edit': {
        'description': 'Modify DBC database entries',
        'commands': ['modify', 'clone']
    },
    'Database': {
        'description': 'Database-level operations',
        'commands': ['rebuild', 'apply', 'diff', 'extract']
    },
    'Binary': {
        'description': 'Binary file import/export',
        'commands': ['import-module', 'export', 'init-original']
    }
}

# Command descriptions for submenu display
DBC_COMMAND_DESCRIPTIONS = {
    'query': 'Query DBC database (read-only)',
    'sources': 'List zpak DBC sources',
    'status': 'Check for uncommitted changes',
    'conflicts': 'Scan zpaks for conflicting DBC edits',
    'modify': 'Modify DBC database with tracking',
    'clone': 'Clone a spell to a new ID',
    'rebuild': 'Rebuild DBC from zpak sources',
    'apply': 'Apply zpak DBC files to databases',
    'diff': 'Show differences (live vs expected)',
    'extract': 'Extract uncommitted changes as SQL',
    'import-module': 'Import binary DBC files into zpak',
    'export': 'Export DBC database to binary files',
    'init-original': 'Initialize original_dbc from vanilla',
}


@click.group(invoke_without_command=True)
@click.pass_context
def dbc(ctx):
    """DBC database commands"""
    if ctx.invoked_subcommand is not None:
        return

    # Interactive menu when no subcommand given
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        click.echo("Available commands: query, modify, clone, status, diff, sources, rebuild, apply, extract, import-module, export, init-original")
        click.echo("\nRun 'zep dbc <command> --help' for details")
        return

    # Show category menu
    group_names = list(DBC_MENU_GROUPS.keys())
    group_options = []
    for name in group_names:
        desc = DBC_MENU_GROUPS[name]['description']
        group_options.append(f"{name:<12} {desc}")

    menu = TerminalMenu(
        group_options,
        title="\n  DBC Operations - Select category (ESC to cancel):\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
    )

    result = menu.show()

    if result is None:
        click.echo("Cancelled.")
        return

    # Show command submenu for selected category
    selected_group = group_names[result]
    commands = DBC_MENU_GROUPS[selected_group]['commands']

    cmd_options = []
    for cmd in commands:
        desc = DBC_COMMAND_DESCRIPTIONS.get(cmd, '')
        cmd_options.append(f"{cmd:<16} {desc}")

    menu = TerminalMenu(
        cmd_options,
        title=f"\n  {selected_group} - Select command (ESC to go back):\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
    )

    cmd_result = menu.show()

    if cmd_result is None:
        # Go back to category menu - recurse
        ctx.invoke(dbc)
        return

    # Invoke the selected command
    selected_cmd = commands[cmd_result]
    cmd_func = dbc.get_command(ctx, selected_cmd)
    if cmd_func:
        ctx.invoke(cmd_func)


# =============================================================================
# Query Command
# =============================================================================

@dbc.command('query')
@click.argument('sql', required=False)
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True),
              help='SQL file to execute')
@click.option('--database', '-d', 'database',
              type=click.Choice(['live', 'original', 'expected', 'scratch']),
              default='live', help='Target database (default: live)')
@click.pass_context
def dbc_query(ctx, sql: Optional[str], sql_file: Optional[str], database: str):
    """Query DBC database.

    Run read-only SQL queries against DBC databases.

    Examples:
        zep dbc query "SELECT ID, SpellName0 FROM spell LIMIT 5"
        zep dbc query -f query.sql
        zep dbc query "SELECT * FROM spell WHERE ID=25392" -d original
    """
    # Get SQL from argument, file, or stdin
    if sql_file:
        with open(sql_file) as f:
            sql = f.read()
    elif not sql:
        if not sys.stdin.isatty():
            sql = sys.stdin.read()
        else:
            raise click.ClickException("No SQL provided. Use: zep dbc query \"SELECT ...\" or -f file.sql")

    if not sql.strip():
        raise click.ClickException("Empty SQL provided")

    # Warn if modification detected
    if is_modification(sql):
        raise click.ClickException(
            "Modification detected (INSERT/UPDATE/DELETE).\n"
            "Use 'zep dbc modify --task F-XXX \"...\"' for modifications."
        )

    # Get config and run query
    config = get_dbc_config(ctx)

    # Map database choice to actual database name
    db_map = {
        'live': config.live,
        'original': config.original,
        'expected': config.expected,
        'scratch': config.scratch,
    }
    target_db = db_map[database]

    click.echo(f"Running query on {target_db}...")

    success, output = run_sql(sql, config, target_db)

    if not success:
        raise click.ClickException(f"Query failed: {output}")

    if output.strip():
        click.echo(output)
    else:
        click.echo("Query completed (no results)")


# =============================================================================
# Modify Command
# =============================================================================

@dbc.command('modify')
@click.argument('sql', required=False)
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True),
              help='SQL file to execute')
@click.option('--task', '-t', 'task_id', required=True,
              help='Task ID (F-XXX or I-XXX)')
@click.option('--description', '-d', 'description',
              help='Commit description (only with --commit)')
@click.option('--commit', is_flag=True,
              help='Create git commit (default: no commit)')
@click.pass_context
def dbc_modify(ctx, sql: Optional[str], sql_file: Optional[str], task_id: str,
               description: Optional[str], commit: bool):
    """Modify DBC database with tracking.

    Execute modifications (INSERT/UPDATE/DELETE) with proper tracking:
    - Validates task ID format
    - Saves SQL to zpak dbc/ folder (F-XXX_table.sql)
    - Applies to live and expected databases

    History is preserved in the zpak SQL files. Commit when ready with --commit
    or manually via git.

    Examples:
        zep dbc modify --task F-004 "UPDATE spell SET SpellName0='Test' WHERE ID=900001"
        zep dbc modify --task I-015 -f changes.sql
        zep dbc modify --task F-004 "..." --commit  # Also commit to git
    """
    # Validate task ID
    if not validate_task_id(task_id):
        raise click.ClickException(
            f"Invalid task ID: {task_id}\n"
            "Must be in format F-XXX or I-XXX"
        )

    # Get SQL
    if sql_file:
        with open(sql_file) as f:
            sql = f.read()
    elif not sql:
        if not sys.stdin.isatty():
            sql = sys.stdin.read()
        else:
            raise click.ClickException("No SQL provided")

    if not sql.strip():
        raise click.ClickException("Empty SQL provided")

    # Verify it's a modification
    if not is_modification(sql):
        raise click.ClickException(
            "No modification detected in SQL.\n"
            "Use 'zep dbc query' for read-only queries."
        )

    craft_root = ctx.obj['craft_root']
    registry = ctx.obj['registry']
    config = get_dbc_config(ctx)

    # Find zpak for this task
    zpak_path = find_zpak_for_feature(craft_root, task_id, registry)

    if not zpak_path:
        click.echo(click.style(f"Warning: No zpak found for {task_id}", fg='yellow'))
        click.echo("Creating generic DBC zpak...")

        # Create a generic zpak for unassigned tasks
        zpak_name = f"dbc-{task_id.lower()}"
        zpak_path = craft_root / 'zpaks' / zpak_name
        zpak_path.mkdir(parents=True, exist_ok=True)

        # Create minimal zpak.json
        manifest = {
            "$schema": "../../schemas/zpak.schema.json",
            "name": zpak_name,
            "version": "0.1.0",
            "description": f"DBC modifications for {task_id}",
            "author": "Zeppelin Team",
            "type": "native",
            "feature_id": task_id,
            "contents": {
                "dbc": ["dbc/*.sql"]
            },
            "enabled": True,
            "priority": 100
        }

        with open(zpak_path / 'zpak.json', 'w') as f:
            json.dump(manifest, f, indent=2)
            f.write('\n')

        # Register in feature_index
        registry.register_feature(task_id, zpak_name)
        registry.save()

        click.echo(f"Created zpak: {zpak_name}")

    # Detect which tables are being modified
    tables = detect_modified_tables(sql)
    if not tables:
        raise click.ClickException("Could not detect target tables from SQL")

    click.echo(f"Task: {task_id}")
    click.echo(f"Zpak: {zpak_path.name}")
    click.echo(f"Tables: {', '.join(sorted(tables))}")

    # Execute on live database
    click.echo(f"\nApplying to {config.live}...")
    success, output = run_sql(sql, config, config.live)
    if not success:
        raise click.ClickException(f"Failed to apply to live database: {output}")
    click.echo(click.style("  OK", fg='green'))

    # Execute on expected database
    click.echo(f"Applying to {config.expected}...")
    success, output = run_sql(sql, config, config.expected)
    if not success:
        click.echo(click.style(f"  Warning: {output}", fg='yellow'))
    else:
        click.echo(click.style("  OK", fg='green'))

    # Save SQL to zpak dbc/<feature>/ folder (per-feature, per-table files)
    # This enables easy reorganization - moving F-004 to another zpak
    # is simply moving the dbc/F-004/ folder
    modified_files = []
    for table in tables:
        sql_file_path = append_to_zpak_dbc(zpak_path, table, sql, feature_id=task_id)
        modified_files.append(sql_file_path)
        click.echo(f"Saved: {sql_file_path.relative_to(craft_root)}")

    # Git commit (only if --commit flag)
    if commit:
        desc = description or f"DBC: {', '.join(sorted(tables))}"
        if git_commit_changes(craft_root, modified_files + [zpak_path / 'zpak.json'], task_id, desc):
            click.echo(click.style(f"\nCommit created: WIP: {task_id}", fg='green'))
        else:
            click.echo(click.style("\nNo changes to commit", fg='yellow'))

    click.echo(click.style("\nModification complete", fg='green'))


# =============================================================================
# Clone Command
# =============================================================================

@dbc.command('clone')
@click.argument('source_id', type=int)
@click.argument('new_id', type=int)
@click.option('--task', '-t', 'task_id', required=True,
              help='Task ID (F-XXX or I-XXX)')
@click.option('--name', '-n', 'new_name',
              help='Custom name for cloned spell')
@click.pass_context
def dbc_clone(ctx, source_id: int, new_id: int, task_id: str, new_name: Optional[str]):
    """Clone a spell to a new ID.

    Creates a copy of an existing spell with a new ID, optionally with
    a new name. Tracks the change in the appropriate zpak.

    Examples:
        zep dbc clone 25392 900000 --task F-004
        zep dbc clone 25392 900000 --task F-004 --name "Custom Prayer"
    """
    # Validate task ID
    if not validate_task_id(task_id):
        raise click.ClickException(f"Invalid task ID: {task_id}")

    config = get_dbc_config(ctx)

    click.echo(f"Cloning spell {source_id} -> {new_id}")
    if new_name:
        click.echo(f"New name: {new_name}")

    # Check if source exists
    success, output = run_sql(
        f"SELECT ID, SpellName0 FROM spell WHERE ID = {source_id}",
        config, config.live
    )
    if not success or not output.strip() or str(source_id) not in output:
        raise click.ClickException(f"Source spell {source_id} not found")

    # Check if target exists
    success, output = run_sql(
        f"SELECT ID FROM spell WHERE ID = {new_id}",
        config, config.live
    )
    if success and output.strip() and str(new_id) in output:
        raise click.ClickException(f"Target spell {new_id} already exists")

    # Get columns
    success, output = run_sql(
        "SELECT COLUMN_NAME FROM information_schema.columns "
        "WHERE table_schema = DATABASE() AND table_name = 'spell' "
        "ORDER BY ORDINAL_POSITION",
        config, config.live
    )
    if not success:
        raise click.ClickException("Could not get spell table columns")

    columns = [line.strip() for line in output.strip().split('\n')[1:] if line.strip()]

    # Build clone SQL
    columns_str = ', '.join(f'`{col}`' for col in columns)

    select_parts = []
    for col in columns:
        if col == 'ID':
            select_parts.append(str(new_id))
        elif col == 'SpellName0' and new_name:
            escaped_name = new_name.replace("'", "\\'")
            select_parts.append(f"'{escaped_name}'")
        else:
            select_parts.append(f'`{col}`')

    select_str = ', '.join(select_parts)
    clone_sql = f"INSERT INTO spell ({columns_str}) SELECT {select_str} FROM spell WHERE ID = {source_id};"

    # Use modify command logic
    ctx.invoke(dbc_modify, sql=clone_sql, task_id=task_id,
               description=f"clone spell {source_id} -> {new_id}")


# =============================================================================
# Status Command
# =============================================================================

@dbc.command('status')
@click.pass_context
def dbc_status(ctx):
    """Check for uncommitted DBC changes.

    Compares live database against expected_dbc to detect modifications
    that haven't been tracked in a zpak.

    Example:
        zep dbc status
    """
    config = get_dbc_config(ctx)

    click.echo(f"Comparing {config.live} vs {config.expected}...\n")

    try:
        with DBCConnection(config) as db_conn:
            result = compare_databases(db_conn, config.live, config.expected)
    except Exception as e:
        raise click.ClickException(f"Database connection failed: {e}")

    if result["identical"]:
        click.echo(click.style("No uncommitted changes", fg='green'))
        return

    click.echo(click.style("Uncommitted changes detected:", fg='yellow'))
    click.echo()

    if result["tables_only_in_db1"]:
        click.echo(f"  Tables only in {config.live}:")
        for t in result["tables_only_in_db1"]:
            click.echo(f"    + {t}")
        click.echo()

    if result["tables_only_in_db2"]:
        click.echo(f"  Tables only in {config.expected}:")
        for t in result["tables_only_in_db2"]:
            click.echo(f"    - {t}")
        click.echo()

    if result["tables_with_differences"]:
        click.echo("  Tables with row differences:")
        for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
            diff = count1 - count2
            sign = "+" if diff > 0 else ""
            click.echo(f"    {table}: {count1} rows (live) vs {count2} rows (expected) [{sign}{diff}]")
        click.echo()

    click.echo("Run 'zep dbc diff' for detailed changes")
    click.echo("Run 'zep dbc rebuild' to reset from sources")


# =============================================================================
# Diff Command
# =============================================================================

@dbc.command('diff')
@click.option('--sql', 'output_sql', is_flag=True,
              help='Output SQL statements')
@click.option('--table', '-t', 'table_name',
              help='Show diff for specific table only')
@click.pass_context
def dbc_diff(ctx, output_sql: bool, table_name: Optional[str]):
    """Show detailed differences between live and expected DBC.

    Examples:
        zep dbc diff
        zep dbc diff --sql
        zep dbc diff --table spell
    """
    config = get_dbc_config(ctx)

    try:
        with DBCConnection(config) as db_conn:
            if output_sql:
                if table_name:
                    # Single table SQL
                    sql = generate_diff_sql(db_conn, table_name, config.live, config.expected)
                else:
                    # Full diff SQL
                    sql = generate_full_diff_sql(db_conn, config.live, config.expected)
                click.echo(sql)
                return

            # Human-readable diff
            click.echo(f"Detailed diff: {config.live} vs {config.expected}\n")

            result = compare_databases(db_conn, config.live, config.expected)

            if result["identical"]:
                click.echo(click.style("Databases are identical", fg='green'))
                return

            # Filter to specific table if requested
            tables_to_show = result["tables_with_differences"]
            if table_name:
                tables_to_show = [t for t in tables_to_show if t[0] == table_name]
                if not tables_to_show:
                    click.echo(f"Table '{table_name}' has no differences")
                    return

            for table, count1, count2, cs1, cs2 in tables_to_show:
                click.echo(click.style(f"Table: {table}", bold=True))
                click.echo(f"  Rows: {count1} (live) vs {count2} (expected)")

                try:
                    diff = get_table_diff(db_conn, table, config.live, config.expected)
                    pk = diff["primary_key"]

                    if diff["only_in_db1"]:
                        click.echo(click.style(f"  Added in live ({len(diff['only_in_db1'])}):", fg='green'))
                        for pk_val in diff["only_in_db1"][:5]:
                            click.echo(f"    + {pk}={pk_val}")
                        if len(diff["only_in_db1"]) > 5:
                            click.echo(f"    ... and {len(diff['only_in_db1']) - 5} more")

                    if diff["only_in_db2"]:
                        click.echo(click.style(f"  Removed from live ({len(diff['only_in_db2'])}):", fg='red'))
                        for pk_val in diff["only_in_db2"][:5]:
                            click.echo(f"    - {pk}={pk_val}")
                        if len(diff["only_in_db2"]) > 5:
                            click.echo(f"    ... and {len(diff['only_in_db2']) - 5} more")

                    if diff["modified"]:
                        click.echo(click.style(f"  Modified ({len(diff['modified'])}):", fg='yellow'))
                        for pk_val, changes in diff["modified"][:3]:
                            click.echo(f"    ~ {pk}={pk_val}:")
                            for col, old_val, new_val in changes[:3]:
                                old_str = str(old_val)[:50] + "..." if len(str(old_val)) > 50 else str(old_val)
                                new_str = str(new_val)[:50] + "..." if len(str(new_val)) > 50 else str(new_val)
                                click.echo(f"        {col}: {old_str} -> {new_str}")
                            if len(changes) > 3:
                                click.echo(f"        ... and {len(changes) - 3} more columns")
                        if len(diff["modified"]) > 3:
                            click.echo(f"    ... and {len(diff['modified']) - 3} more rows")

                except Exception as e:
                    click.echo(click.style(f"  Error getting row diff: {e}", fg='red'))

                click.echo()

    except Exception as e:
        raise click.ClickException(f"Database error: {e}")


# =============================================================================
# Rebuild Command
# =============================================================================

def collect_dbc_sources(craft_root: Path) -> List[Tuple[int, str, Path, List[Path]]]:
    """Collect all DBC sources from zpaks, sorted by priority.

    DBC files use flat structure with optional feature prefix:
        zpaks/worgoblin/dbc/spell.sql           (module - no prefix)
        zpaks/my-zpak/dbc/F-004_spell.sql       (feature - with prefix)
        zpaks/my-zpak/dbc/F-004_skillline.sql

    Args:
        craft_root: Path to Zeppelin-Craft

    Returns:
        List of (priority, name, dbc_dir, sql_files) tuples, sorted by priority
    """
    sources = []

    for base in [craft_root / 'zpaks', craft_root / 'external']:
        if not base.exists():
            continue

        for pkg_dir in base.iterdir():
            if not pkg_dir.is_dir():
                continue

            manifest_path = pkg_dir / 'zpak.json'
            if not manifest_path.exists():
                continue

            manifest = load_manifest(manifest_path)
            if not manifest:
                continue

            # Check if zpak is enabled
            if not manifest.get('enabled', True):
                continue

            # Check for dbc content
            dbc_dir = pkg_dir / 'dbc'
            if not dbc_dir.exists():
                continue

            # Collect SQL files (flat structure)
            sql_files = list(dbc_dir.glob('*.sql'))
            if not sql_files:
                continue

            priority = manifest.get('priority', 100)
            sources.append((priority, manifest['name'], dbc_dir, sorted(sql_files)))

    # Sort by priority (lower first)
    sources.sort(key=lambda x: x[0])
    return sources


@dbc.command('rebuild')
@click.option('--dry-run', is_flag=True,
              help='Preview without applying')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def dbc_rebuild(ctx, dry_run: bool, force: bool):
    """Rebuild DBC database from zpak sources.

    Resets live and expected databases from original_dbc, then applies
    all enabled zpak DBC sources in priority order. Also resets the
    file tracking table so --changed starts fresh.

    Examples:
        zep dbc rebuild --dry-run   # Preview what would be applied
        zep dbc rebuild             # Rebuild databases
        zep dbc rebuild --force     # Skip confirmation
    """
    import time

    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    click.echo(click.style(f"DBC Rebuild{' (DRY RUN)' if dry_run else ''}", bold=True))
    click.echo()

    # Safety check
    click.echo("Step 0: Safety check...")
    try:
        with DBCConnection(config) as db_conn:
            result = compare_databases(db_conn, config.live, config.expected)

            if not result["identical"]:
                click.echo(click.style("  Uncommitted changes detected:", fg='yellow'))
                for table, count1, count2, _, _ in result["tables_with_differences"]:
                    diff = count1 - count2
                    sign = "+" if diff > 0 else ""
                    click.echo(f"    {table}: {sign}{diff} rows")

                if not dry_run and not force:
                    if not click.confirm("\nThese changes will be LOST. Continue?"):
                        click.echo("Rebuild cancelled.")
                        return
            else:
                click.echo(click.style("  No uncommitted changes", fg='green'))

    except Exception as e:
        raise click.ClickException(f"Safety check failed: {e}")

    # Collect sources
    sources = collect_dbc_sources(craft_root)

    if not sources:
        click.echo(click.style("\nNo enabled DBC sources found", fg='yellow'))
        return

    click.echo(f"\nStep 1: Sources to apply ({len(sources)}):")
    total_files = 0
    for priority, name, dbc_path, sql_files in sources:
        click.echo(f"  [{priority:3}] {name} ({len(sql_files)} files)")
        total_files += len(sql_files)

    if dry_run:
        click.echo(click.style("\nDRY RUN - no changes made", fg='yellow'))
        return

    # Reset from original
    click.echo(f"\nStep 2: Resetting {config.live} from {config.original}...")

    try:
        with DBCConnection(config) as db_conn:
            orig_conn = db_conn.get_connection(config.original)
            live_conn = db_conn.get_connection(config.live)

            tables = get_tables(orig_conn)

            live_cursor = live_conn.cursor()
            # Disable foreign key checks for table recreation
            live_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")

            for table in tables:
                # Skip internal tables but preserve tracking table
                if table.startswith("dbc_") or table == "zep_dbc_updates":
                    continue
                click.echo(f"  Copying {table}...", nl=False)
                # Drop and recreate table to ensure matching schema
                live_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
                live_cursor.execute(f"CREATE TABLE `{table}` LIKE `{config.original}`.`{table}`")
                live_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{config.original}`.`{table}`")
                click.echo(" OK")

            live_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            live_conn.commit()
            live_cursor.close()

    except Exception as e:
        raise click.ClickException(f"Reset failed: {e}")

    click.echo(click.style("  Reset complete", fg='green'))

    # Clear and recreate tracking table
    click.echo("  Resetting file tracking...")
    ensure_dbc_tracking_table(config)
    clear_dbc_tracking(config)

    # Apply sources with tracking
    click.echo(f"\nStep 3: Applying sources...")
    errors = []
    applied_count = 0

    for priority, name, dbc_path, sql_files in sources:
        click.echo(f"  Applying {name}...")

        for sql_file in sql_files:
            try:
                with open(sql_file) as f:
                    sql = f.read()

                if sql.strip():
                    start_time = time.time()
                    success, output = run_sql(sql, config, config.live)
                    exec_ms = int((time.time() - start_time) * 1000)

                    # Show relative path from dbc_path for readability
                    rel_path = sql_file.relative_to(dbc_path)
                    if not success:
                        errors.append((name, str(rel_path), output))
                        click.echo(click.style(f"    {rel_path}: FAILED", fg='red'))
                    else:
                        click.echo(f"    {rel_path}: OK ({exec_ms}ms)")
                        applied_count += 1

                        # Track the applied file
                        file_hash = calculate_file_hash(sql_file)
                        update_dbc_tracking(config, sql_file.name, file_hash, name, exec_ms)

            except Exception as e:
                rel_path = sql_file.relative_to(dbc_path)
                errors.append((name, str(rel_path), str(e)))
                click.echo(click.style(f"    {rel_path}: ERROR - {e}", fg='red'))

    # Update expected
    click.echo(f"\nStep 4: Updating {config.expected}...")

    try:
        with DBCConnection(config) as db_conn:
            live_conn = db_conn.get_connection(config.live)
            expected_conn = db_conn.get_connection(config.expected)

            tables = get_tables(live_conn)

            expected_cursor = expected_conn.cursor()
            # Disable foreign key checks for table recreation
            expected_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")

            for table in tables:
                # Skip internal tables
                if table.startswith("dbc_") or table == "zep_dbc_updates":
                    continue
                # Drop and recreate table to ensure matching schema
                expected_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
                expected_cursor.execute(f"CREATE TABLE `{table}` LIKE `{config.live}`.`{table}`")
                expected_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{config.live}`.`{table}`")

            expected_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            expected_conn.commit()
            expected_cursor.close()

    except Exception as e:
        raise click.ClickException(f"Update expected failed: {e}")

    click.echo(click.style("  Expected state updated", fg='green'))

    # Summary
    click.echo()
    if errors:
        click.echo(click.style(f"Rebuild completed with errors: {applied_count}/{total_files} applied", fg='yellow'))
        for name, file, err in errors[:5]:
            click.echo(f"  {name}/{file}: {err[:80]}")
        if len(errors) > 5:
            click.echo(f"  ... and {len(errors) - 5} more errors")
    else:
        click.echo(click.style(f"Rebuild complete! {applied_count} files applied and tracked", fg='green'))


# =============================================================================
# Sources Command
# =============================================================================

@dbc.command('sources')
@click.option('--verbose', '-v', is_flag=True,
              help='Show individual SQL files')
@click.option('--changed', '-c', is_flag=True,
              help='Show only new/modified files (hash-based)')
@click.pass_context
def dbc_sources(ctx, verbose: bool, changed: bool):
    """List all zpak DBC sources that would be applied during rebuild.

    Shows all enabled zpaks with DBC content, sorted by priority order.
    This is exactly what 'zep dbc rebuild' will execute.

    With --changed, shows only files that have been modified since last apply.

    Examples:
        zep dbc sources          # Summary view
        zep dbc sources -v       # Show all SQL files
        zep dbc sources -c       # Show only changed files
    """
    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    sources = collect_dbc_sources(craft_root)

    if not sources:
        click.echo(click.style("No enabled DBC sources found", fg='yellow'))
        return

    # Get stored hashes if checking for changes
    stored_hashes = {}
    if changed:
        ensure_dbc_tracking_table(config)
        stored_hashes = get_all_stored_dbc_hashes(config)

    total_files = 0
    changed_files = 0
    new_files = 0

    if changed:
        click.echo(click.style("DBC Changed Files:", bold=True))
    else:
        click.echo(click.style("DBC Sources (rebuild order):", bold=True))
    click.echo()

    for priority, name, dbc_path, sql_files in sources:
        file_count = len(sql_files)
        total_files += file_count

        if changed:
            # Check each file for changes
            zpak_new = []
            zpak_modified = []

            for sql_file in sql_files:
                current_hash = calculate_file_hash(sql_file)
                stored = stored_hashes.get(sql_file.name)

                if stored is None:
                    zpak_new.append(sql_file.name)
                    new_files += 1
                elif stored[0] != current_hash:
                    zpak_modified.append(sql_file.name)
                    changed_files += 1

            if zpak_new or zpak_modified:
                click.echo(f"  [{priority:3}] {name}")

                if zpak_new:
                    click.echo(click.style(f"         New ({len(zpak_new)}):", fg='green'))
                    for f in zpak_new:
                        click.echo(f"           + {f}")

                if zpak_modified:
                    click.echo(click.style(f"         Modified ({len(zpak_modified)}):", fg='yellow'))
                    for f in zpak_modified:
                        click.echo(f"           ~ {f}")
        else:
            click.echo(f"  [{priority:3}] {name} ({file_count} files)")

            if verbose:
                for sql_file in sql_files:
                    rel_path = sql_file.name

                    # Show change status if we have stored hashes
                    if stored_hashes:
                        current_hash = calculate_file_hash(sql_file)
                        stored = stored_hashes.get(sql_file.name)

                        if stored is None:
                            status = click.style(" [NEW]", fg='green')
                        elif stored[0] != current_hash:
                            status = click.style(" [MODIFIED]", fg='yellow')
                        else:
                            status = ""
                    else:
                        status = ""

                    click.echo(f"         - {rel_path}{status}")

    click.echo()

    if changed:
        total_changed = new_files + changed_files
        if total_changed == 0:
            click.echo(click.style("No new or modified DBC files", fg='green'))
        else:
            click.echo(f"Summary: {new_files} new, {changed_files} modified ({total_changed} total)")
            click.echo()
            click.echo("Run 'zep dbc apply --changed' to apply these files")
    else:
        click.echo(f"Total: {len(sources)} zpak(s), {total_files} SQL file(s)")
        click.echo()
        click.echo("Run 'zep dbc rebuild' to apply these sources")
        click.echo("Run 'zep dbc sources --changed' to see pending changes")


# =============================================================================
# Conflicts Command
# =============================================================================

@dbc.command('conflicts')
@click.option('--table', '-t', 'filter_table',
              help='Check only specific table')
@click.option('--verbose', '-v', is_flag=True,
              help='Show detailed conflict info')
@click.pass_context
def dbc_conflicts(ctx, filter_table: Optional[str], verbose: bool):
    """Scan zpaks for conflicting DBC edits.

    Detects when multiple zpaks modify the same row in a DBC table.
    This is an intensive operation that parses all DBC SQL files.

    During rebuild, zpaks are applied in priority order (lower first),
    so higher-priority zpaks will overwrite lower-priority changes
    to the same rows.

    Examples:
        zep dbc conflicts              # Scan all tables
        zep dbc conflicts -t spell     # Check only spell table
        zep dbc conflicts -v           # Show all conflicting IDs
    """
    craft_root = ctx.obj['craft_root']

    click.echo(click.style("DBC Conflict Scanner", bold=True))
    click.echo()

    # Collect all DBC sources
    sources = collect_dbc_sources(craft_root)

    if not sources:
        click.echo("No DBC sources found in zpaks")
        return

    click.echo(f"Scanning {len(sources)} zpak(s) for conflicts...")
    click.echo()

    # Build mapping: table -> { id -> [(zpak_name, priority, file)] }
    # This tracks which zpaks modify which rows
    table_modifications: Dict[str, Dict[int, List[Tuple[str, int, str]]]] = {}

    for priority, zpak_name, dbc_path, sql_files in sources:
        for sql_file in sql_files:
            table_name = extract_table_from_filename(sql_file.name)
            if not table_name:
                continue

            # Skip if filtering to specific table
            if filter_table and table_name != filter_table.lower():
                continue

            # Read and parse SQL file
            try:
                sql_content = sql_file.read_text()
                affected_ids = parse_sql_affected_ids(sql_content, table_name)

                if affected_ids:
                    if table_name not in table_modifications:
                        table_modifications[table_name] = {}

                    for row_id in affected_ids:
                        if row_id not in table_modifications[table_name]:
                            table_modifications[table_name][row_id] = []
                        table_modifications[table_name][row_id].append(
                            (zpak_name, priority, sql_file.name)
                        )

            except Exception as e:
                logger.warning(f"Failed to parse {sql_file}: {e}")
                continue

    # Find conflicts (rows modified by 2+ zpaks)
    conflicts_found = False
    total_conflicts = 0
    tables_with_conflicts = 0

    for table_name in sorted(table_modifications.keys()):
        table_conflicts = []

        for row_id, modifiers in table_modifications[table_name].items():
            if len(modifiers) > 1:
                table_conflicts.append((row_id, modifiers))

        if table_conflicts:
            conflicts_found = True
            tables_with_conflicts += 1
            total_conflicts += len(table_conflicts)

            click.echo(click.style(f"{table_name}", fg='yellow', bold=True) +
                      f" ({len(table_conflicts)} conflict{'s' if len(table_conflicts) != 1 else ''})")

            # Sort conflicts by ID
            table_conflicts.sort(key=lambda x: x[0])

            # Show conflicts (limit unless verbose)
            display_limit = len(table_conflicts) if verbose else 5
            for row_id, modifiers in table_conflicts[:display_limit]:
                # Sort modifiers by priority (lower first = applied first)
                modifiers.sort(key=lambda x: x[1])

                click.echo(f"  ID {row_id}:")
                for zpak_name, priority, filename in modifiers:
                    click.echo(f"    [{priority:3}] {zpak_name} ({filename})")

            if not verbose and len(table_conflicts) > display_limit:
                click.echo(f"  ... and {len(table_conflicts) - display_limit} more conflicts")

            click.echo()

    # Summary
    if conflicts_found:
        click.echo(click.style("Summary:", bold=True))
        click.echo(f"  Tables with conflicts: {tables_with_conflicts}")
        click.echo(f"  Total conflicting rows: {total_conflicts}")
        click.echo()
        click.echo("Note: During rebuild, higher priority zpaks overwrite lower priority changes.")
        click.echo("      Lower priority number = applied first, higher = wins.")
    else:
        click.echo(click.style("No conflicts detected", fg='green'))
        click.echo()
        click.echo(f"Scanned {len(table_modifications)} table(s) across {len(sources)} zpak(s)")


# =============================================================================
# Apply Command
# =============================================================================

def _check_apply_conflicts(changed_files: List[Tuple[Path, str, str]],
                           applied_hashes: Dict[str, Tuple[str, str]],
                           craft_root: Path) -> List[Dict]:
    """Check for row conflicts between changed files and already-applied files.

    Args:
        changed_files: List of (filepath, zpak_name, hash) for files to be applied
        applied_hashes: Dict of filename -> (hash, zpak) for already-applied files
        craft_root: Path to Zeppelin-Craft

    Returns:
        List of conflict dicts with table, id, changed_file, applied_file info
    """
    conflicts = []

    # Build map of table -> {id -> [(zpak, filename, priority)]} for changed files
    changed_modifications: Dict[str, Dict[int, List[Tuple[str, str, int]]]] = {}

    # Get all sources to find priorities
    sources = collect_dbc_sources(craft_root)
    zpak_priorities = {name: priority for priority, name, _, _ in sources}

    for filepath, zpak_name, _ in changed_files:
        table_name = extract_table_from_filename(filepath.name)
        if not table_name:
            continue

        try:
            sql_content = filepath.read_text()
            affected_ids = parse_sql_affected_ids(sql_content, table_name)

            if affected_ids:
                if table_name not in changed_modifications:
                    changed_modifications[table_name] = {}

                priority = zpak_priorities.get(zpak_name, 100)
                for row_id in affected_ids:
                    if row_id not in changed_modifications[table_name]:
                        changed_modifications[table_name][row_id] = []
                    changed_modifications[table_name][row_id].append(
                        (zpak_name, filepath.name, priority)
                    )
        except Exception:
            continue

    # Now check applied files for overlapping IDs
    for applied_filename, (applied_hash, applied_zpak) in applied_hashes.items():
        # Skip if this file is in the changed set (will be re-applied)
        if any(f.name == applied_filename for f, _, _ in changed_files):
            continue

        table_name = extract_table_from_filename(applied_filename)
        if not table_name or table_name not in changed_modifications:
            continue

        # Find the actual file path
        applied_path = None
        for priority, name, dbc_path, sql_files in sources:
            if name == applied_zpak:
                for sf in sql_files:
                    if sf.name == applied_filename:
                        applied_path = sf
                        break
                break

        if not applied_path or not applied_path.exists():
            continue

        try:
            sql_content = applied_path.read_text()
            affected_ids = parse_sql_affected_ids(sql_content, table_name)
            applied_priority = zpak_priorities.get(applied_zpak, 100)

            for row_id in affected_ids:
                if row_id in changed_modifications[table_name]:
                    # Conflict found - check priority
                    for changed_zpak, changed_filename, changed_priority in changed_modifications[table_name][row_id]:
                        # Only warn if applied file has HIGHER priority (applied later in rebuild)
                        # because applying changed file would overwrite higher-priority changes
                        if applied_priority > changed_priority:
                            conflicts.append({
                                'table': table_name,
                                'id': row_id,
                                'changed_file': changed_filename,
                                'changed_zpak': changed_zpak,
                                'changed_priority': changed_priority,
                                'applied_file': applied_filename,
                                'applied_zpak': applied_zpak,
                                'applied_priority': applied_priority,
                            })
        except Exception:
            continue

    return conflicts


@dbc.command('apply')
@click.argument('target', required=False)
@click.option('--task', '-t', 'task_id',
              help='Apply only files for specific task (F-XXX or I-XXX)')
@click.option('--zpak', '-z', 'zpak_name',
              help='Apply from specific zpak only')
@click.option('--changed', '-c', is_flag=True,
              help='Only apply new/modified files (hash-based)')
@click.option('--all', '-a', 'run_all', is_flag=True,
              help='Apply all files regardless of state')
@click.option('--dry-run', '-n', is_flag=True,
              help='Preview without applying')
@click.option('--force', '-f', is_flag=True,
              help='Apply despite conflicts (no confirmation)')
@click.pass_context
def dbc_apply(ctx, target: Optional[str], task_id: Optional[str], zpak_name: Optional[str],
              changed: bool, run_all: bool, dry_run: bool, force: bool):
    """Apply existing zpak DBC files to databases.

    Use this when you've manually created/edited DBC SQL files in a zpak
    and want to apply them without the modify command's save step.

    With --changed, only applies files that have been modified since last apply.
    Before applying, checks for row conflicts with higher-priority already-applied
    files and warns if applying would overwrite those changes.

    Examples:
        zep dbc apply                           # Interactive or apply all
        zep dbc apply --changed                 # Only new/modified files
        zep dbc apply --task F-212              # Only [F-212]_*.sql files
        zep dbc apply --zpak mage-tanking       # From specific zpak
        zep dbc apply zpaks/my-zpak/dbc/[F-212]_spell.sql  # Specific file
    """
    import time

    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    # Ensure tracking table exists
    if not dry_run:
        ensure_dbc_tracking_table(config)

    # Build list of (priority, zpak_name, sql_files) tuples
    zpak_groups = []

    if target:
        # Apply specific file
        target_path = Path(target)
        if not target_path.is_absolute():
            target_path = craft_root / target
        if not target_path.exists():
            raise click.ClickException(f"File not found: {target_path}")
        # Single file goes into a "manual" group
        zpak_groups.append((0, "(file)", [target_path]))
    else:
        # Collect files from zpaks, preserving grouping
        sources = collect_dbc_sources(craft_root)

        for priority, name, dbc_path, sql_files in sources:
            # Filter by zpak name
            if zpak_name and name != zpak_name:
                continue

            # Filter by task ID if specified (uses [F-XXX]_ format)
            if task_id:
                sql_files = [f for f in sql_files if f.name.startswith(f"[{task_id}]_")]

            if sql_files:
                zpak_groups.append((priority, name, sql_files))

    # Count total files before filtering
    total_files = sum(len(files) for _, _, files in zpak_groups)

    if total_files == 0:
        click.echo("No files to apply")
        return

    # Filter by hash if --changed
    files_to_apply: List[Tuple[Path, str, int, str]] = []  # (path, zpak, priority, hash)

    if changed and not run_all:
        click.echo("Checking for changed files...")
        stored_hashes = get_all_stored_dbc_hashes(config)

        for priority, zpak, sql_files in zpak_groups:
            for sql_file in sql_files:
                current_hash = calculate_file_hash(sql_file)
                stored = stored_hashes.get(sql_file.name)
                stored_hash = stored[0] if stored else None

                if stored_hash != current_hash:
                    files_to_apply.append((sql_file, zpak, priority, current_hash))

        if not files_to_apply:
            click.echo(click.style("No new or modified DBC files to apply", fg='green'))
            return

        # Check for conflicts before applying
        changed_for_conflict = [(f, z, h) for f, z, p, h in files_to_apply]
        conflicts = _check_apply_conflicts(changed_for_conflict, stored_hashes, craft_root)

        if conflicts:
            click.echo(click.style(f"\nConflict warning: {len(conflicts)} row(s) affected", fg='yellow'))
            click.echo("These changed files modify rows that were also modified by higher-priority")
            click.echo("already-applied files. Applying will overwrite those changes.\n")

            # Group by table
            by_table: Dict[str, List] = {}
            for c in conflicts:
                if c['table'] not in by_table:
                    by_table[c['table']] = []
                by_table[c['table']].append(c)

            for table, table_conflicts in by_table.items():
                click.echo(f"  {table}:")
                shown = 0
                for c in table_conflicts[:5]:
                    click.echo(f"    ID {c['id']}: [{c['changed_priority']}] {c['changed_zpak']} vs [{c['applied_priority']}] {c['applied_zpak']}")
                    shown += 1
                if len(table_conflicts) > 5:
                    click.echo(f"    ... and {len(table_conflicts) - 5} more")

            click.echo()
            if not dry_run and not force:
                if not click.confirm("Apply anyway?"):
                    click.echo("Cancelled.")
                    return

        click.echo(f"\nApplying {len(files_to_apply)} changed file(s)...")
    else:
        # Apply all - build flat list with hashes
        for priority, zpak, sql_files in zpak_groups:
            for sql_file in sql_files:
                file_hash = calculate_file_hash(sql_file)
                files_to_apply.append((sql_file, zpak, priority, file_hash))

        click.echo(f"Applying {len(files_to_apply)} DBC file(s) from {len(zpak_groups)} zpak(s)")

    if dry_run:
        # Show preview grouped by zpak
        current_zpak = None
        for sql_file, zpak, priority, _ in files_to_apply:
            if zpak != current_zpak:
                current_zpak = zpak
                click.echo(f"\n[{priority}] {zpak}")
            click.echo(f"  {sql_file.name}")
        click.echo(click.style("\nDRY RUN - no changes made", fg='yellow'))
        return

    # Apply files in priority order (already sorted by collect_dbc_sources)
    errors = []
    success_count = 0
    current_zpak = None

    for sql_file, zpak, priority, file_hash in files_to_apply:
        if zpak != current_zpak:
            current_zpak = zpak
            click.echo(f"\n[{priority}] {click.style(zpak, bold=True)}")

        with open(sql_file) as f:
            sql = f.read()

        if not sql.strip():
            click.echo(f"  {sql_file.name:<40} (empty, skipped)")
            continue

        # Apply to both databases
        start_time = time.time()
        live_ok, live_out = run_sql(sql, config, config.live)
        exp_ok, exp_out = run_sql(sql, config, config.expected)
        exec_ms = int((time.time() - start_time) * 1000)

        # Build status string
        live_status = click.style("OK", fg='green') if live_ok else click.style("FAIL", fg='red')
        exp_status = click.style("OK", fg='green') if exp_ok else click.style("FAIL", fg='red')

        click.echo(f"  {sql_file.name:<40} dbc: {live_status}  expected: {exp_status}  ({exec_ms}ms)")

        if live_ok:
            # Update tracking
            update_dbc_tracking(config, sql_file.name, file_hash, zpak, exec_ms)
            success_count += 1
        else:
            errors.append((zpak, sql_file.name, f"dbc: {live_out}"))

        if not exp_ok:
            errors.append((zpak, sql_file.name, f"expected: {exp_out}"))

    click.echo()
    if errors:
        click.echo(click.style(f"Completed: {success_count} succeeded, {len(errors)} errors", fg='yellow'))
        for zpak, file, err in errors[:5]:
            click.echo(f"  [{zpak}] {file}: {err[:50]}")
        if len(errors) > 5:
            click.echo(f"  ... and {len(errors) - 5} more errors")
    else:
        click.echo(click.style(f"Apply complete! {success_count} file(s) applied", fg='green'))


# =============================================================================
# Extract Command
# =============================================================================

@dbc.command('extract')
@click.option('--name', '-n', required=True,
              help='Name for the extracted source (zpak name or feature ID)')
@click.option('--task', '-t', 'task_id',
              help='Task ID (F-XXX or I-XXX) - creates feature file prefix')
@click.option('--priority', '-p', type=int, default=100,
              help='Priority (default: 100)')
@click.option('--zpak', '-z', 'zpak_name',
              help='Add to existing zpak instead of creating new one')
@click.pass_context
def dbc_extract(ctx, name: str, task_id: Optional[str], priority: int,
                zpak_name: Optional[str]):
    """Extract current uncommitted DBC changes as SQL files.

    Compares live database against original_dbc and generates SQL files
    for any differences found.

    Examples:
        zep dbc extract --name my-customizations
        zep dbc extract --name mage-tanking --task F-014
        zep dbc extract --name frost-shield --task F-212 --zpak class-overhauls
    """
    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)
    registry = ctx.obj['registry']

    click.echo(click.style(f"Extracting DBC customizations: {name}", bold=True))
    click.echo(f"  Comparing: {config.live} vs {config.original}")
    click.echo()

    # Compare databases
    click.echo("Analyzing differences...")
    try:
        with DBCConnection(config) as db_conn:
            result = compare_databases(db_conn, config.live, config.original)

            if result["identical"]:
                click.echo(click.style("No differences found - nothing to extract", fg='green'))
                return

            # Show summary
            total_tables = len(result["tables_with_differences"])
            click.echo(f"  Found changes in {total_tables} table(s):")

            tables_with_changes = []
            for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
                diff = get_table_diff(db_conn, table, config.live, config.original)
                adds = len(diff["only_in_db1"])
                mods = len(diff["modified"])
                dels = len(diff["only_in_db2"])
                if adds > 0 or mods > 0 or dels > 0:
                    tables_with_changes.append(table)
                    click.echo(f"    {table}: +{adds} ~{mods} -{dels}")

            if not tables_with_changes:
                click.echo(click.style("No significant differences after filtering", fg='yellow'))
                return

            # Determine output zpak
            if zpak_name:
                # Add to existing zpak
                zpak_path = None
                for base in [craft_root / 'zpaks', craft_root / 'external']:
                    candidate = base / zpak_name
                    if candidate.exists():
                        zpak_path = candidate
                        break
                if not zpak_path:
                    raise click.ClickException(f"Zpak '{zpak_name}' not found")
            else:
                # Create new zpak
                zpak_path = craft_root / 'zpaks' / name
                if zpak_path.exists():
                    raise click.ClickException(f"Zpak '{name}' already exists")

                zpak_path.mkdir(parents=True)
                manifest = {
                    "$schema": "../../schemas/zpak.schema.json",
                    "name": name,
                    "version": "0.1.0",
                    "description": f"Extracted DBC customizations",
                    "author": "Zeppelin Team",
                    "type": "native",
                    "contents": {"dbc": ["dbc/*.sql"]},
                    "enabled": True,
                    "priority": priority
                }
                if task_id:
                    manifest["feature_id"] = task_id

                with open(zpak_path / 'zpak.json', 'w') as f:
                    json.dump(manifest, f, indent=2)
                    f.write('\n')

                click.echo(f"\nCreated zpak: {zpak_path.relative_to(craft_root)}")

            # Generate per-table SQL files
            click.echo("\nGenerating SQL files...")
            dbc_dir = zpak_path / 'dbc'
            dbc_dir.mkdir(parents=True, exist_ok=True)

            total_lines = 0
            for table in tables_with_changes:
                sql = generate_diff_sql(db_conn, table, config.live, config.original)

                # Use [F-XXX]_ prefix for custom changes if task_id provided
                if task_id:
                    sql_file = dbc_dir / f"[{task_id}]_{table}.sql"
                else:
                    sql_file = dbc_dir / f"{table}.sql"

                with open(sql_file, 'w') as f:
                    f.write(f"-- {name}: {table}\n")
                    f.write(f"-- Extracted by zep dbc extract\n\n")
                    f.write(sql)

                line_count = sql.count('\n') + 1
                total_lines += line_count
                click.echo(f"  {sql_file.name}: {line_count} lines")

            click.echo(f"\nTotal: {total_lines} lines in {len(tables_with_changes)} files")

            # Register feature if task_id provided
            if task_id:
                registry.register_feature(task_id, zpak_path.name)
                registry.save()

            click.echo(click.style(f"\nExtraction complete!", fg='green'))
            click.echo(f"  Zpak: {zpak_path.relative_to(craft_root)}")
            click.echo(f"  Tables: {', '.join(tables_with_changes)}")

    except Exception as e:
        raise click.ClickException(f"Extract failed: {e}")


# =============================================================================
# Import Module Command
# =============================================================================

def _discover_zpaks_with_info(craft_root: Path) -> List[Dict[str, Any]]:
    """Discover available zpaks with additional info.

    Returns:
        List of dicts with 'name', 'description', 'path', 'has_dbc_source', 'dbc_source_path'
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

            # Determine DBC source path
            # Priority: 1) dbc_source from manifest, 2) mpq/source-assets/DBFilesClient
            dbc_source = manifest.get('dbc_source')
            if dbc_source:
                # Resolve relative paths from zpak directory
                dbc_source_path = Path(dbc_source)
                if not dbc_source_path.is_absolute():
                    dbc_source_path = (pkg_dir / dbc_source_path).resolve()
                has_dbc_source = dbc_source_path.exists()
            else:
                # Fallback to mpq/source-assets/DBFilesClient
                dbc_source_path = pkg_dir / 'mpq' / 'source-assets' / 'DBFilesClient'
                has_dbc_source = dbc_source_path.exists()

            zpaks.append({
                'name': manifest.get('name', pkg_dir.name),
                'description': manifest.get('description', '')[:40],
                'path': pkg_dir,
                'has_dbc_source': has_dbc_source,
                'dbc_source_path': dbc_source_path,
                'dbc_source_defined': dbc_source is not None,
                'feature_id': manifest.get('feature_id')
            })

    return zpaks


def _normalize_feature_id(value: str) -> str:
    """Normalize feature ID input to F-XXX format.

    Accepts: '004', '4', 'F-004', 'f-004', 'F004'
    Returns: 'F-004'
    """
    if not value:
        return None

    value = value.strip().upper()

    # Already in correct format
    if value.startswith('F-') or value.startswith('I-'):
        return value

    # Handle F004 format (no dash)
    if value.startswith('F') or value.startswith('I'):
        prefix = value[0]
        num = value[1:]
        if num.isdigit():
            return f"{prefix}-{num.zfill(3)}"

    # Just a number - assume Feature
    if value.isdigit():
        return f"F-{value.zfill(3)}"

    return None


def _get_existing_dbc_files(zpak_path: Path, feature_id: Optional[str] = None) -> List[Path]:
    """Get existing imported DBC SQL files for a zpak.

    Args:
        zpak_path: Path to zpak directory
        feature_id: Feature ID to look for (e.g., 'F-049')

    Returns:
        List of existing [F-XXX,BASE]_*.sql file paths for the feature
    """
    dbc_dir = zpak_path / 'dbc'
    if not dbc_dir.exists():
        return []

    if feature_id:
        # Look for BASE files matching this feature ID: [F-049,BASE]_*.sql
        return list(dbc_dir.glob(f"[{feature_id},BASE]_*.sql"))
    else:
        # No feature ID - return all BASE-tagged files
        return list(dbc_dir.glob("[*,BASE]_*.sql"))


@dbc.command('import-module')
@click.option('--name', '-n',
              help='Zpak name (interactive selection if omitted)')
@click.option('--source', '-s', type=click.Path(),
              help='Path to DBC files (default: zpaks/<name>/mpq/DBFilesClient)')
@click.option('--task', '-t', 'task_id',
              help='Override feature ID (default: uses feature_id from zpak.json)')
@click.option('--priority', '-p', type=int, default=50,
              help='Priority (default: 50, lower = applied first)')
@click.option('--force', '-f', is_flag=True,
              help='Overwrite existing DBC diff files without confirmation')
@click.pass_context
def dbc_import_module(ctx, name: Optional[str], source: Optional[str], task_id: Optional[str],
                      priority: int, force: bool):
    """Import binary DBC files into an existing zpak.

    Feature ID is read from zpak.json 'feature_id' field automatically.
    Use --task to override if needed.

    Examples:
        zep dbc import-module                              # Interactive
        zep dbc import-module --name open-azeroth          # Uses zpak's feature_id
        zep dbc import-module --name worgoblin --task 050  # Override feature_id
    """
    import shutil
    import tempfile

    craft_root = ctx.obj['craft_root']
    manifest_feature_id = None  # Will be set from zpak.json if available

    # Step 0: Interactive zpak selection if not provided
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Install with: pip install simple-term-menu\n"
                "Or specify --name directly."
            )

        zpaks = _discover_zpaks_with_info(craft_root)
        if not zpaks:
            raise click.ClickException("No zpaks found in zpaks/ or external/")

        # Build menu options
        options = []
        for zpak in zpaks:
            indicator = "📦" if zpak['has_dbc_source'] else "  "
            options.append(f"{indicator} {zpak['name']:<25} {zpak['description']}")

        menu = TerminalMenu(
            options,
            title="\n  Select zpak to import DBC files into:\n  (📦 = has DBC source)\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
            status_bar="↑/↓: Navigate | Enter: Select | q: Cancel",
            status_bar_style=("fg_gray",),
        )

        result = menu.show()

        if result is None:
            click.echo("Cancelled.")
            return

        selected_zpak = zpaks[result]
        name = selected_zpak['name']
        zpak_path = selected_zpak['path']
        default_source = selected_zpak['dbc_source_path']
        manifest_feature_id = selected_zpak.get('feature_id')

        click.echo(f"\nSelected: {name}")
    else:
        # Find zpak by name
        zpak_path = None
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / name
            if candidate.exists() and (candidate / 'zpak.json').exists():
                zpak_path = candidate
                break

        if not zpak_path:
            raise click.ClickException(f"Zpak '{name}' not found")

        # Load manifest to check for dbc_source and feature_id
        manifest = load_manifest(zpak_path / 'zpak.json')
        dbc_source = manifest.get('dbc_source') if manifest else None
        manifest_feature_id = manifest.get('feature_id') if manifest else None

        if dbc_source:
            default_source = Path(dbc_source)
            if not default_source.is_absolute():
                default_source = (zpak_path / default_source).resolve()
        else:
            default_source = zpak_path / 'mpq' / 'DBFilesClient'

    # Step 1: Determine source path

    if not source:
        try:
            from simple_term_menu import TerminalMenu

            # Display path - use relative if under craft_root, otherwise show full path
            try:
                display_path = default_source.relative_to(craft_root)
            except ValueError:
                # Path is outside craft_root (e.g., Zeppelin-Core module)
                try:
                    display_path = default_source.relative_to(craft_root.parent)
                except ValueError:
                    display_path = default_source

            exists_indicator = "" if default_source.exists() else " (not found)"
            options = [
                f"Default: {display_path}{exists_indicator}",
                "Specify custom path"
            ]

            click.echo(f"\nDBC source location:")
            menu = TerminalMenu(
                options,
                menu_cursor="> ",
                menu_cursor_style=("fg_cyan", "bold"),
                menu_highlight_style=("fg_cyan", "bold"),
            )

            result = menu.show()

            if result is None:
                click.echo("Cancelled.")
                return

            if result == 0:
                source_path = default_source
            else:
                try:
                    custom_path = input("\n  Enter path to DBC files: ").strip()
                    if not custom_path:
                        click.echo("Cancelled.")
                        return
                    source_path = Path(custom_path)
                except (KeyboardInterrupt, EOFError):
                    click.echo("\nCancelled.")
                    return

        except ImportError:
            # Fallback to default
            source_path = default_source
    else:
        source_path = Path(source)

    if not source_path.exists():
        raise click.ClickException(f"Source path not found: {source_path}")

    # Step 2: Determine feature ID
    # Priority: CLI --task > zpak.json feature_id > error
    # Feature ID is REQUIRED for file naming to enable change tracking
    if task_id:
        # Normalize CLI-provided task ID
        task_id = _normalize_feature_id(task_id)
        if not task_id:
            raise click.ClickException(
                f"Invalid feature ID format.\n"
                "Use a number (049) or full ID (F-049)"
            )
    elif manifest_feature_id:
        # Use feature_id from zpak.json
        task_id = manifest_feature_id
        click.echo(f"  Using feature_id from zpak.json: {task_id}")
    else:
        raise click.ClickException(
            f"No feature_id found in zpak.json and no --task provided.\n"
            "Feature ID is required for file naming (enables change tracking).\n"
            "Either add 'feature_id' to zpak.json or use --task F-XXX"
        )

    # Step 3: Check for existing DBC files and confirm if needed
    existing_files = _get_existing_dbc_files(zpak_path, task_id)
    if existing_files and not force:
        click.echo(click.style(f"\nExisting DBC diff files found ({len(existing_files)}):", fg='yellow'))
        for f in existing_files[:5]:
            click.echo(f"  - {f.name}")
        if len(existing_files) > 5:
            click.echo(f"  ... and {len(existing_files) - 5} more")

        if not click.confirm("\nOverwrite existing DBC diff files?"):
            click.echo("Cancelled.")
            return

    # Get config and registry
    config = get_dbc_config(ctx)
    registry = ctx.obj['registry']

    # Find DBC files
    dbc_files = list(source_path.glob('*.dbc')) + list(source_path.glob('*.DBC'))
    if not dbc_files:
        raise click.ClickException(f"No .dbc files found in {source_path}")

    click.echo()
    click.echo(click.style(f"DBC Import: {name}", bold=True))
    click.echo(f"  Zpak: {zpak_path.relative_to(craft_root)}")
    click.echo(f"  Source: {source_path}")
    if task_id:
        click.echo(f"  Feature: {task_id}")
    click.echo(f"  DBC files: {len(dbc_files)}")
    click.echo()

    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    # Step 1: Reset scratch_dbc from original_dbc
    click.echo(f"Step 1: Resetting {config.scratch} from {config.original}...")

    try:
        with DBCConnection(config) as db_conn:
            orig_conn = db_conn.get_connection(config.original)
            orig_tables = get_tables(orig_conn)

            scratch_conn = db_conn.get_connection(config.scratch)
            scratch_cursor = scratch_conn.cursor()

            # Drop existing tables
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
            scratch_cursor.execute("SHOW TABLES")
            for (table,) in scratch_cursor.fetchall():
                scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")

            # Copy from original
            for table in orig_tables:
                if table.startswith("dbc_"):
                    continue
                scratch_cursor.execute(f"CREATE TABLE `{table}` LIKE `{config.original}`.`{table}`")
                scratch_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{config.original}`.`{table}`")

            scratch_conn.commit()
            scratch_cursor.close()

        click.echo(click.style(f"  Reset with {len(orig_tables)} tables", fg='green'))

    except Exception as e:
        raise click.ClickException(f"Failed to reset scratch database: {e}")

    # Step 2: Import DBC files via DBCTool
    click.echo(f"\nStep 2: Importing DBC files via DBCTool...")

    temp_dbc_dir = Path(tempfile.mkdtemp(prefix="dbc_import_"))
    env_path = CRAFT_ROOT / 'Scripts' / 'Patch Builder' / '.env'

    try:
        # Build meta file map for case matching
        # Use spelleditor_meta for WoW Spell Editor compatible column names
        meta_dir = DBCTOOL_PATH.parent / "spelleditor_meta"
        meta_file_map = {}
        for meta_file in meta_dir.glob("*.meta.json"):
            try:
                with open(meta_file) as f:
                    meta_data = json.load(f)
                    if "file" in meta_data:
                        original_file = meta_data["file"]
                        lowercase_stem = Path(original_file).stem.lower()
                        meta_file_map[lowercase_stem] = original_file
            except:
                pass

        # Create symlinks with correct case
        for dbc_file in dbc_files:
            lowercase_stem = dbc_file.stem.lower()
            if lowercase_stem in meta_file_map:
                target_name = meta_file_map[lowercase_stem]
            else:
                target_name = dbc_file.name
            symlink_path = temp_dbc_dir / target_name
            if not symlink_path.exists():
                symlink_path.symlink_to(dbc_file)

        # Create temp config for DBCTool with spelleditor_meta
        scratch_config = {
            "dbc": {
                "user": config.user,
                "password": config.password,
                "host": config.host,
                "port": str(config.port),
                "name": config.scratch
            },
            "paths": {
                "base": str(temp_dbc_dir),
                "export": str(temp_dbc_dir),
                "meta": str(meta_dir)
            },
            "options": {"use_versioning": False}
        }

        scratch_config_path = craft_root / 'scratch_config.json'
        with open(scratch_config_path, 'w') as f:
            json.dump(scratch_config, f, indent=2)

        # Import each DBC file
        imported_tables = []
        for dbc_file in sorted(dbc_files):
            dbc_name = dbc_file.stem.lower()
            click.echo(f"  Importing {dbc_file.stem}...", nl=False)

            cmd = [str(DBCTOOL_PATH), "import", "-f", "-n", dbc_name, "--config", str(scratch_config_path)]
            result = subprocess.run(
                cmd,
                cwd=DBCTOOL_PATH.parent,
                capture_output=True,
                text=True
            )

            # Log full output for debugging
            log_subprocess(cmd, result.returncode, result.stdout, result.stderr)

            if result.returncode == 0:
                imported_tables.append(dbc_name)
                click.echo(click.style(" OK", fg='green'))
            else:
                logger.error(f"DBCTool import failed for {dbc_name}: {result.stderr}")
                click.echo(click.style(f" FAILED: {result.stderr.strip()[:50]}", fg='yellow'))

        scratch_config_path.unlink(missing_ok=True)

    finally:
        shutil.rmtree(temp_dbc_dir, ignore_errors=True)

    if not imported_tables:
        raise click.ClickException("No tables were imported successfully")

    click.echo(f"  Imported {len(imported_tables)} table(s)")

    # Step 3: Diff scratch vs original
    click.echo(f"\nStep 3: Analyzing differences...")

    try:
        with DBCConnection(config) as db_conn:
            result = compare_databases(db_conn, config.scratch, config.original)

            if result["identical"]:
                click.echo(click.style("  No differences found", fg='yellow'))
                # Clean up scratch
                scratch_conn = db_conn.get_connection(config.scratch)
                scratch_cursor = scratch_conn.cursor()
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
                scratch_cursor.execute("SHOW TABLES")
                for (table,) in scratch_cursor.fetchall():
                    scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
                scratch_conn.commit()
                return

            tables_with_changes = []
            for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
                diff = get_table_diff(db_conn, table, config.scratch, config.original)
                adds = len(diff["only_in_db1"])
                mods = len(diff["modified"])
                dels = len(diff["only_in_db2"])
                if adds > 0 or mods > 0 or dels > 0:
                    tables_with_changes.append(table)
                    click.echo(f"    {table}: +{adds} ~{mods} -{dels}")

            # Step 4: Write SQL files to zpak
            click.echo(f"\nStep 4: Writing SQL files to zpak...")

            dbc_dir = zpak_path / 'dbc'

            # Handle existing files - only remove the specific files we'll overwrite
            if existing_files:
                for f in existing_files:
                    f.unlink()
                click.echo(f"  Removed {len(existing_files)} existing file(s)")

            # Ensure dbc directory exists
            dbc_dir.mkdir(parents=True, exist_ok=True)

            # Generate per-table SQL files with [F-XXX,BASE]_ prefix
            # BASE tag indicates imported DBC diff - do not edit directly
            total_lines = 0
            for table in tables_with_changes:
                sql = generate_diff_sql(db_conn, table, config.scratch, config.original)

                sql_filename = f"[{task_id},BASE]_{table}.sql"
                sql_file = dbc_dir / sql_filename
                with open(sql_file, 'w') as f:
                    f.write(f"-- [{task_id},BASE] {name}: {table}\n")
                    f.write(f"-- Imported by zep dbc import-module - DO NOT EDIT\n")
                    f.write(f"-- To customize, create [{task_id}]_{table}.sql with overrides\n\n")
                    f.write(sql)

                line_count = sql.count('\n') + 1
                total_lines += line_count
                click.echo(f"  {sql_filename}: {line_count} lines")

            click.echo(f"\n  Total: {total_lines} lines")

            # Step 5: Clean up scratch
            click.echo(f"\nStep 5: Cleaning up...")
            scratch_conn = db_conn.get_connection(config.scratch)
            scratch_cursor = scratch_conn.cursor()
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
            scratch_cursor.execute("SHOW TABLES")
            for (table,) in scratch_cursor.fetchall():
                scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            scratch_conn.commit()
            click.echo(click.style("  Cleared scratch database", fg='green'))

    except Exception as e:
        raise click.ClickException(f"Import failed: {e}")

    # Register feature in registry if task_id provided
    if task_id:
        registry.register_feature(task_id, name)
        registry.save()

    click.echo(click.style(f"\nImport complete!", fg='green'))
    click.echo(f"  Zpak: {zpak_path.relative_to(craft_root)}")
    if task_id:
        click.echo(f"  Feature: {task_id}")
    click.echo(f"  Tables: {', '.join(tables_with_changes)}")


# =============================================================================
# Export Command
# =============================================================================

@dbc.command('export')
@click.option('--table', '-t', 'table_name',
              help='Export specific table only')
@click.pass_context
def dbc_export(ctx, table_name: Optional[str]):
    """Export DBC database to binary files.

    Uses DBCTool to export the live DBC database to binary .dbc files.

    Examples:
        zep dbc export
        zep dbc export --table spell
    """
    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    click.echo("Exporting DBC database to binary files...")

    cmd = [str(DBCTOOL_PATH), "export"]
    if table_name:
        cmd.extend(["--name", table_name])

    logger.info(f"Running DBCTool export: {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=DBCTOOL_PATH.parent, capture_output=True, text=True)
    log_subprocess(cmd, result.returncode, result.stdout, result.stderr)

    if result.returncode != 0:
        logger.error(f"Export failed: {result.stderr}")
        raise click.ClickException(f"Export failed with code {result.returncode}")

    click.echo(click.style("Export complete", fg='green'))


# =============================================================================
# Init Original Command
# =============================================================================

@dbc.command('init-original')
@click.option('--source', '-s', type=click.Path(exists=True),
              help='Path to vanilla DBC files (default: from config)')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def dbc_init_original(ctx, source: Optional[str], force: bool):
    """Initialize original_dbc from vanilla DBC files.

    Imports all vanilla DBC files into original_dbc using spelleditor_meta
    schema (PascalCase columns compatible with WoW Spell Editor).

    This should be run once to set up the baseline database, or when
    switching meta schemas.

    Examples:
        zep dbc init-original
        zep dbc init-original --source /path/to/dbc/files
        zep dbc init-original --force
    """
    import shutil
    import tempfile

    config = get_dbc_config(ctx)

    # Get source path
    if source:
        source_path = Path(source)
    else:
        # Default from DBCTool config
        dbctool_config = DBCTOOL_PATH.parent / "config.json"
        if dbctool_config.exists():
            with open(dbctool_config) as f:
                cfg = json.load(f)
                source_path = Path(cfg.get("paths", {}).get("base", ""))
        else:
            raise click.ClickException("No source specified and no DBCTool config found")

    if not source_path.exists():
        raise click.ClickException(f"Source path not found: {source_path}")

    dbc_files = list(source_path.glob('*.dbc')) + list(source_path.glob('*.DBC'))
    if not dbc_files:
        raise click.ClickException(f"No .dbc files found in {source_path}")

    click.echo(click.style("Initialize original_dbc", bold=True))
    click.echo(f"  Source: {source_path}")
    click.echo(f"  Target: {config.original}")
    click.echo(f"  DBC files: {len(dbc_files)}")
    click.echo(f"  Meta: spelleditor_meta (PascalCase)")
    click.echo()

    if not force:
        click.echo(click.style("WARNING: This will DROP and recreate ALL tables in original_dbc!", fg='yellow'))
        if not click.confirm("Continue?"):
            click.echo("Cancelled.")
            return

    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    # Use spelleditor_meta for PascalCase columns
    meta_dir = DBCTOOL_PATH.parent / "spelleditor_meta"

    # Build meta file map for case matching
    meta_file_map = {}
    for meta_file in meta_dir.glob("*.meta.json"):
        try:
            with open(meta_file) as f:
                meta_data = json.load(f)
                if "file" in meta_data:
                    original_file = meta_data["file"]
                    lowercase_stem = Path(original_file).stem.lower()
                    meta_file_map[lowercase_stem] = original_file
        except:
            pass

    # Create temp directory with correct file casing
    temp_dbc_dir = Path(tempfile.mkdtemp(prefix="dbc_init_"))

    try:
        # Create symlinks with correct case
        for dbc_file in dbc_files:
            lowercase_stem = dbc_file.stem.lower()
            if lowercase_stem in meta_file_map:
                target_name = meta_file_map[lowercase_stem]
            else:
                target_name = dbc_file.name
            symlink_path = temp_dbc_dir / target_name
            if not symlink_path.exists():
                symlink_path.symlink_to(dbc_file)

        # Create temp config for DBCTool targeting original_dbc
        temp_config = {
            "dbc": {
                "user": config.user,
                "password": config.password,
                "host": config.host,
                "port": str(config.port),
                "name": config.original
            },
            "paths": {
                "base": str(temp_dbc_dir),
                "export": str(temp_dbc_dir),
                "meta": str(meta_dir)
            },
            "options": {"use_versioning": False}
        }

        temp_config_path = CRAFT_ROOT / 'temp_init_config.json'
        with open(temp_config_path, 'w') as f:
            json.dump(temp_config, f, indent=2)

        # Import each DBC file
        click.echo("Importing DBC files...")
        imported = 0
        failed = 0

        for dbc_file in sorted(dbc_files):
            dbc_name = dbc_file.stem.lower()
            click.echo(f"  {dbc_file.stem}...", nl=False)

            cmd = [str(DBCTOOL_PATH), "import", "-f", "-n", dbc_name, "--config", str(temp_config_path)]
            result = subprocess.run(
                cmd,
                cwd=DBCTOOL_PATH.parent,
                capture_output=True,
                text=True
            )

            # Log full output for debugging
            log_subprocess(cmd, result.returncode, result.stdout, result.stderr)

            if result.returncode == 0:
                imported += 1
                click.echo(click.style(" OK", fg='green'))
            else:
                failed += 1
                logger.error(f"DBCTool import failed for {dbc_name}: {result.stderr}")
                click.echo(click.style(" FAILED", fg='yellow'))

        temp_config_path.unlink(missing_ok=True)

    finally:
        shutil.rmtree(temp_dbc_dir, ignore_errors=True)

    click.echo()
    click.echo(click.style(f"Init complete: {imported} imported, {failed} failed", fg='green' if failed == 0 else 'yellow'))
    click.echo()
    click.echo("Next steps:")
    click.echo("  1. Run 'zep dbc rebuild' to copy original_dbc to dbc/expected_dbc")
    click.echo("  2. zpak SQL files will be applied during rebuild")
