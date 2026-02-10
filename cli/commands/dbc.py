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
    _format_pk_display,
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
    parse_sql_modifications,
    compare_modifications,
    extract_table_from_filename,
)
from lib.registry import Registry
from lib.manifest import load_manifest, is_feature_disabled, extract_feature_ids
from lib.logging_config import get_logger, log_subprocess, log_sql, log_command

from lib.env import DBCTOOL_PATH

logger = get_logger('cli.dbc')


def regenerate_spell_editor_views():
    """Regenerate spell_editor updatable views after DBC table changes.

    Views alias snake_case columns to PascalCase for WoW Spell Editor compatibility.
    """
    from lib.spell_editor_views import BINDINGS_DIR, execute_views

    if not BINDINGS_DIR.exists():
        logger.debug("Original bindings not found, skipping spell_editor views")
        return

    click.echo("  Regenerating spell_editor views...", nl=False)
    try:
        success_count, errors = execute_views()
        if errors:
            click.echo(click.style(f" OK ({success_count} statements, {len(errors)} warnings)", fg='yellow'))
            for err in errors[:3]:
                logger.warning(f"  spell_editor view: {err}")
        else:
            click.echo(click.style(" OK", fg='green'))
    except Exception as e:
        click.echo(click.style(f" FAILED: {e}", fg='yellow'))


# Paths
CRAFT_ROOT = CLI_DIR.parent
ENV_PATH = CRAFT_ROOT / 'Scripts' / 'Patch Builder' / '.env'


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

    # Scan zpaks - check manifest fields then scan DBC/SQL filenames
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

            # Check manifest feature_id field
            ids = set()
            if manifest.get('feature_id'):
                ids.add(manifest['feature_id'])

            # Scan DBC filenames for feature IDs
            dbc_dir = pkg_dir / 'dbc'
            if dbc_dir.exists():
                for f in dbc_dir.glob('*.sql'):
                    ids.update(extract_feature_ids(f.name))

            if feature_id in ids:
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
# Click Command Groups
# =============================================================================

@click.group()
@click.pass_context
def dbc(ctx):
    """DBC database commands.

    Subcommands organized by category:
      info  - Query and inspect DBC data
      edit  - Modify DBC database entries
      db    - Database-level operations
      bin   - Binary file import/export
    """
    pass


@dbc.group()
@click.pass_context
def info(ctx):
    """Query and inspect DBC data."""
    pass


@dbc.group()
@click.pass_context
def edit(ctx):
    """Modify DBC database entries."""
    pass


@dbc.group()
@click.pass_context
def db(ctx):
    """Database-level operations."""
    pass


@dbc.group('bin')
@click.pass_context
def dbc_bin(ctx):
    """Binary file import/export."""
    pass


# =============================================================================
# Query Command
# =============================================================================

@info.command('query')
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

@edit.command('modify')
@click.argument('sql', required=False)
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True),
              help='SQL file to execute')
@click.option('--task', '-t', 'task_id', required=True,
              help='Task ID (F-XXX or I-XXX)')
@click.option('--zpak', '-z', 'zpak_name',
              help='Target zpak name (required if task not registered to a zpak)')
@click.option('--description', '-d', 'description',
              help='Commit description (only with --commit)')
@click.option('--commit', is_flag=True,
              help='Create git commit (default: no commit)')
@click.pass_context
def dbc_modify(ctx, sql: Optional[str], sql_file: Optional[str], task_id: str,
               zpak_name: Optional[str], description: Optional[str], commit: bool):
    """Modify DBC database with tracking.

    Execute modifications (INSERT/UPDATE/DELETE) with proper tracking:
    - Validates task ID format
    - Saves SQL to zpak dbc/ folder (F-XXX_table.sql)
    - Applies to live and expected databases

    History is preserved in the zpak SQL files. Commit when ready with --commit
    or manually via git.

    Examples:
        zep dbc modify --task F-004 "UPDATE spell SET SpellName0='Test' WHERE ID=900001"
        zep dbc modify --task I-015 -f changes.sql --zpak zepcraft-legacy
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
    zpak_path = None

    # If --zpak specified, use it directly
    if zpak_name:
        for base in [craft_root / 'zpaks', craft_root / 'external']:
            candidate = base / zpak_name
            if candidate.exists() and (candidate / 'zpak.json').exists():
                zpak_path = candidate
                break
        if not zpak_path:
            raise click.ClickException(
                f"Zpak '{zpak_name}' not found.\n"
                f"Use 'zep zpak list' to see available zpaks."
            )
    else:
        zpak_path = find_zpak_for_feature(craft_root, task_id, registry)

    if not zpak_path:
        raise click.ClickException(
            f"No zpak found for {task_id}.\n"
            f"Specify a target zpak with --zpak/-z, e.g.:\n"
            f"  zep dbc modify --task {task_id} --zpak <zpak-name> ..."
        )

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

@edit.command('clone')
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

@info.command('status')
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

@db.command('diff')
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
                    pk_cols = diff["primary_key"]

                    if diff["only_in_db1"]:
                        click.echo(click.style(f"  Added in live ({len(diff['only_in_db1'])}):", fg='green'))
                        for pk_vals in diff["only_in_db1"][:5]:
                            click.echo(f"    + {_format_pk_display(pk_cols, pk_vals)}")
                        if len(diff["only_in_db1"]) > 5:
                            click.echo(f"    ... and {len(diff['only_in_db1']) - 5} more")

                    if diff["only_in_db2"]:
                        click.echo(click.style(f"  Removed from live ({len(diff['only_in_db2'])}):", fg='red'))
                        for pk_vals in diff["only_in_db2"][:5]:
                            click.echo(f"    - {_format_pk_display(pk_cols, pk_vals)}")
                        if len(diff["only_in_db2"]) > 5:
                            click.echo(f"    ... and {len(diff['only_in_db2']) - 5} more")

                    if diff["modified"]:
                        click.echo(click.style(f"  Modified ({len(diff['modified'])}):", fg='yellow'))
                        for pk_vals, changes in diff["modified"][:3]:
                            click.echo(f"    ~ {_format_pk_display(pk_cols, pk_vals)}:")
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

            # Filter out files with disabled feature IDs
            disabled = set(manifest.get('disabled_features', []))
            sql_files = [f for f in sql_files if not is_feature_disabled(f.name, disabled)]
            if not sql_files:
                continue

            priority = manifest.get('priority', 100)
            sources.append((priority, manifest['name'], dbc_dir, sorted(sql_files)))

    # Sort by priority (lower first)
    sources.sort(key=lambda x: x[0])
    return sources


@db.command('rebuild')
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

    # Step 5: Regenerate spell_editor views
    click.echo(f"\nStep 5: Spell Editor compatibility...")
    regenerate_spell_editor_views()

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
# Wipe Command
# =============================================================================

@db.command('wipe')
@click.argument('table', required=False)
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def dbc_wipe(ctx, table: Optional[str], force: bool):
    """Reset live DBC database to original (stock) state.

    Copies data from original_dbc to live dbc database. Useful for testing
    or reverting changes without a full rebuild.

    If TABLE is specified, only that table is reset. Otherwise all tables
    are reset (excluding tracking tables).

    Examples:
        zep dbc wipe                # Reset all tables to stock
        zep dbc wipe spell          # Reset only spell table
        zep dbc wipe -f             # Skip confirmation
    """
    config = get_dbc_config(ctx)

    if table:
        click.echo(f"Resetting {config.live}.{table} from {config.original}...")
    else:
        click.echo(f"Resetting ALL tables in {config.live} from {config.original}...")

    if not force:
        msg = f"Reset {table if table else 'ALL tables'}? This will lose uncommitted changes."
        if not click.confirm(msg):
            click.echo("Cancelled.")
            return

    try:
        with DBCConnection(config) as db_conn:
            orig_conn = db_conn.get_connection(config.original)
            live_conn = db_conn.get_connection(config.live)

            if table:
                # Reset single table
                tables_to_reset = [table]
            else:
                # Reset all tables except tracking
                tables_to_reset = [t for t in get_tables(orig_conn)
                                   if not t.startswith('dbc_') and t != 'zep_dbc_updates']

            live_cursor = live_conn.cursor()
            live_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")

            for tbl in tables_to_reset:
                click.echo(f"  {tbl}...", nl=False)
                try:
                    live_cursor.execute(f"DROP TABLE IF EXISTS `{tbl}`")
                    live_cursor.execute(f"CREATE TABLE `{tbl}` LIKE `{config.original}`.`{tbl}`")
                    live_cursor.execute(f"INSERT INTO `{tbl}` SELECT * FROM `{config.original}`.`{tbl}`")
                    click.echo(" OK")
                except Exception as e:
                    click.echo(click.style(f" FAILED: {e}", fg='red'))

            live_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            live_conn.commit()
            live_cursor.close()

        click.echo(click.style(f"\nWipe complete! {len(tables_to_reset)} table(s) reset to stock", fg='green'))

        # Regenerate spell_editor views after full wipe
        if not table:
            regenerate_spell_editor_views()

    except Exception as e:
        raise click.ClickException(f"Wipe failed: {e}")


# =============================================================================
# Clean Command
# =============================================================================

@db.command('clean')
@click.option('--name', '-n',
              help='Zpak name (interactive selection if omitted)')
@click.option('--dry-run', is_flag=True,
              help='Preview without modifying files')
@click.pass_context
def dbc_clean(ctx, name: Optional[str], dry_run: bool):
    """Remove redundant DBC rows from a zpak.

    Scans all zpaks for conflicts, then removes rows from the target zpak
    that are exact duplicates of rows in other zpaks.

    Examples:
        zep dbc db clean --name zepcraft-legacy --dry-run   # Preview cleanup
        zep dbc db clean --name zepcraft-legacy              # Remove duplicates
    """
    from lib.dbc_utils import (
        detect_dbc_conflicts,
        remove_ids_from_dbc_file,
    )

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
                if not (pkg_dir / 'dbc').exists():
                    continue
                manifest = load_manifest(pkg_dir / 'zpak.json')
                if manifest:
                    candidates.append((manifest.get('name', pkg_dir.name), pkg_dir))

        if not candidates:
            raise click.ClickException("No zpaks with DBC files found")

        options = [c[0] for c in candidates] + ["[Cancel]"]
        menu = TerminalMenu(options, title="\n  Select zpak to clean:\n")
        result = menu.show()
        if result is None or options[result] == "[Cancel]":
            return
        name = candidates[result][0]

    # Find target zpak
    zpak_path = None
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        candidate = base / name
        if candidate.exists():
            zpak_path = candidate
            break

    if not zpak_path:
        raise click.ClickException(f"Zpak not found: {name}")

    dbc_dir = zpak_path / 'dbc'
    if not dbc_dir.exists():
        raise click.ClickException(f"No dbc directory in zpak: {name}")

    if dry_run:
        click.echo(click.style("=== DRY RUN MODE ===\n", fg='yellow'))

    # Run conflict detection
    sources = collect_dbc_sources(craft_root)
    if not sources:
        click.echo("No DBC sources found in zpaks")
        return

    click.echo(f"Scanning {len(sources)} zpak(s) for redundant rows...")
    _, all_redundants = detect_dbc_conflicts(sources)

    # Build tables_to_clean from redundants that involve the target zpak
    # Convert string row_keys ("123" or "1|2|3") to int tuples for remove_ids_from_dbc_file
    tables_to_clean: Dict[str, set] = {}
    for table_name, row_key, mods_with_values in all_redundants:
        zpak_names = {m[0] for m in mods_with_values}
        if name in zpak_names:
            if table_name not in tables_to_clean:
                tables_to_clean[table_name] = set()
            key_tuple = tuple(int(v) for v in row_key.split("|"))
            tables_to_clean[table_name].add(key_tuple)

    total_redundant = sum(len(ids) for ids in tables_to_clean.values())
    click.echo(f"Found {total_redundant} redundant rows in {len(tables_to_clean)} tables for {name}\n")

    if not tables_to_clean:
        click.echo(click.style("No redundant rows to clean.", fg='green'))
        return

    total_removed = 0
    files_modified = 0

    for table_name in sorted(tables_to_clean.keys()):
        ids = tables_to_clean[table_name]

        # Find the SQL file for this table
        pattern = f"*_{table_name}.sql"
        matches = list(dbc_dir.glob(pattern))

        if not matches:
            click.echo(f"  {table_name}: No file found, skipping")
            continue

        file_path = matches[0]
        lines_before, lines_after, removed, content_empty = remove_ids_from_dbc_file(
            file_path, ids, dry_run
        )

        if removed > 0:
            files_modified += 1
            total_removed += removed
            if content_empty:
                action = "Would delete" if dry_run else "Deleted"
                click.echo(f"  {table_name}: {action} {file_path.name} (all {removed} rows redundant)")
            else:
                action = "Would remove" if dry_run else "Removed"
                click.echo(f"  {table_name}: {action} {removed} rows ({lines_before} -> {lines_after} lines)")
        else:
            click.echo(f"  {table_name}: No matching rows found in file")

    click.echo("")
    action = "Would modify" if dry_run else "Modified"
    click.echo(f"{action} {files_modified} files")
    action = "Would remove" if dry_run else "Removed"
    click.echo(f"{action} {total_removed} redundant rows total")

    if dry_run:
        click.echo(click.style("\nRun without --dry-run to apply changes.", fg='cyan'))
    elif total_removed > 0:
        click.echo(click.style(f"\nCleanup complete!", fg='green'))

dbc_clean.zpak_filter = 'has_dbc'


# =============================================================================
# Squash Command
# =============================================================================

@db.command('squash')
@click.argument('target', required=False)
@click.option('--zpak', '-z', 'zpak_name',
              help='Squash all DBC files in zpak')
@click.option('--dry-run', '-n', is_flag=True,
              help='Preview without modifying files')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def dbc_squash(ctx, target: Optional[str], zpak_name: Optional[str], dry_run: bool, force: bool):
    """Squash DBC SQL file(s) by re-diffing through scratch database.

    Removes redundant edits within a file (e.g., multiple updates to same row
    become single final value). Useful after iterative development where you
    have commits like: damage=10, damage=20, damage=30 -> squashes to damage=30.

    Process per file:
      1. Reset scratch from original_dbc
      2. Apply the single SQL file to scratch
      3. Diff scratch vs original
      4. Rewrite file with squashed SQL

    Examples:
        zep dbc squash zpaks/my-zpak/dbc/[F-049]_spell.sql  # Single file
        zep dbc squash --zpak mage-tanking                   # All files in zpak
        zep dbc squash --zpak mage-tanking --dry-run         # Preview only
    """
    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    # Collect files to squash
    files_to_squash: List[Path] = []

    if target:
        # Single file
        target_path = Path(target)
        if not target_path.is_absolute():
            target_path = craft_root / target
        if not target_path.exists():
            raise click.ClickException(f"File not found: {target_path}")
        if not target_path.suffix == '.sql':
            raise click.ClickException(f"Not a SQL file: {target_path}")
        files_to_squash.append(target_path)

    elif zpak_name:
        # All files in zpak
        sources = collect_dbc_sources(craft_root)
        for priority, name, dbc_path, sql_files in sources:
            if name == zpak_name:
                files_to_squash.extend(sql_files)
                break
        if not files_to_squash:
            raise click.ClickException(f"No DBC files found in zpak: {zpak_name}")
    else:
        raise click.ClickException("Specify a file path or use --zpak")

    click.echo(click.style(f"DBC Squash{' (DRY RUN)' if dry_run else ''}", bold=True))
    click.echo(f"  Files to process: {len(files_to_squash)}")
    click.echo()

    if not force and not dry_run:
        if not click.confirm(f"Squash {len(files_to_squash)} file(s)? This will rewrite them."):
            click.echo("Cancelled.")
            return

    squashed_count = 0
    unchanged_count = 0
    error_count = 0

    for sql_file in files_to_squash:
        table_name = extract_table_from_filename(sql_file.name)
        if not table_name:
            click.echo(click.style(f"  {sql_file.name}: SKIP (can't determine table)", fg='yellow'))
            continue

        click.echo(f"  {sql_file.name}...", nl=False)

        try:
            # Read original file
            original_sql = sql_file.read_text()
            original_lines = len(original_sql.strip().split('\n'))

            # Step 1: Reset scratch from original
            with DBCConnection(config) as db_conn:
                orig_conn = db_conn.get_connection(config.original)
                scratch_conn = db_conn.get_connection(config.scratch)
                scratch_cursor = scratch_conn.cursor()

                # Only reset the specific table we need
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
                scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table_name}`")
                scratch_cursor.execute(f"CREATE TABLE `{table_name}` LIKE `{config.original}`.`{table_name}`")
                scratch_cursor.execute(f"INSERT INTO `{table_name}` SELECT * FROM `{config.original}`.`{table_name}`")
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
                scratch_conn.commit()
                scratch_cursor.close()

            # Step 2: Apply file to scratch
            success, output = run_sql(original_sql, config, config.scratch)
            if not success:
                click.echo(click.style(f" FAILED (apply): {output[:50]}", fg='red'))
                error_count += 1
                continue

            # Step 3: Diff scratch vs original
            with DBCConnection(config) as db_conn:
                diff = get_table_diff(db_conn, table_name, config.scratch, config.original)

                adds = len(diff["only_in_db1"])
                mods = len(diff["modified"])
                dels = len(diff["only_in_db2"])

                if adds == 0 and mods == 0 and dels == 0:
                    click.echo(click.style(" (no changes)", fg='cyan'))
                    unchanged_count += 1
                    continue

                # Step 4: Generate squashed SQL
                squashed_sql = generate_diff_sql(db_conn, table_name, config.scratch, config.original)

            # Preserve header comments from original file
            header_lines = []
            for line in original_sql.split('\n'):
                if line.startswith('--'):
                    header_lines.append(line)
                elif line.strip():
                    break  # Stop at first non-comment, non-empty line

            squashed_lines = len(squashed_sql.strip().split('\n'))

            if dry_run:
                reduction = original_lines - squashed_lines
                click.echo(f" {original_lines} -> {squashed_lines} lines ({reduction:+d})")
            else:
                # Write squashed file
                with open(sql_file, 'w') as f:
                    if header_lines:
                        f.write('\n'.join(header_lines) + '\n\n')
                    f.write(squashed_sql)
                    if not squashed_sql.endswith('\n'):
                        f.write('\n')

                reduction = original_lines - squashed_lines
                click.echo(f" {original_lines} -> {squashed_lines} lines ({reduction:+d})")
                squashed_count += 1

        except Exception as e:
            click.echo(click.style(f" ERROR: {e}", fg='red'))
            error_count += 1

    # Clean up scratch
    try:
        with DBCConnection(config) as db_conn:
            scratch_conn = db_conn.get_connection(config.scratch)
            scratch_cursor = scratch_conn.cursor()
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
            scratch_cursor.execute("SHOW TABLES")
            for (tbl,) in scratch_cursor.fetchall():
                scratch_cursor.execute(f"DROP TABLE IF EXISTS `{tbl}`")
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            scratch_conn.commit()
    except Exception:
        pass

    # Summary
    click.echo()
    if dry_run:
        click.echo(click.style("DRY RUN - no files modified", fg='yellow'))
    else:
        click.echo(click.style(f"Squash complete! {squashed_count} file(s) rewritten", fg='green'))
    if unchanged_count:
        click.echo(f"  Unchanged: {unchanged_count}")
    if error_count:
        click.echo(click.style(f"  Errors: {error_count}", fg='red'))


# =============================================================================
# Sources Command
# =============================================================================

@info.command('sources')
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

@info.command('conflicts')
@click.option('--table', '-t', 'filter_table',
              help='Check only specific table')
@click.option('--zpak', '-z', 'filter_zpak',
              help='Check only specific zpak (or comma-separated list)')
@click.option('--output', '-o', 'output_file', type=click.Path(),
              help='Write full results to log file (for CC to process)')
@click.pass_context
def dbc_conflicts(ctx, filter_table: Optional[str], filter_zpak: Optional[str], output_file: Optional[str]):
    """Scan zpaks for conflicting DBC edits.

    Detects when multiple zpaks modify the same row in a DBC table.
    Classifies conflicts as:
      - REDUNDANT: Same change in multiple files (can consolidate)
      - CONFLICT: Different changes to same row (order matters)

    Auto-logs to cli/logs/dbc_conflicts.log (overwritten each run).
    Use --output to write to a custom location instead.

    Examples:
        zep dbc info conflicts                    # Scan all zpaks
        zep dbc info conflicts -o conflicts.log  # Write to custom file
        zep dbc info conflicts -z worgoblin      # Check specific zpak
        zep dbc info conflicts -t spell          # Check only spell table
    """
    from datetime import datetime
    from lib.dbc_utils import detect_dbc_conflicts

    craft_root = ctx.obj['craft_root']

    # Auto-log to default location unless custom output specified
    log_dir = craft_root / 'cli' / 'logs'
    log_dir.mkdir(parents=True, exist_ok=True)
    default_log = log_dir / 'dbc_conflicts.log'

    log_path = Path(output_file) if output_file else default_log
    log_file = open(log_path, 'w')

    def log(msg: str, console: bool = True):
        """Write to both console and log file."""
        if console:
            click.echo(msg)
        # Strip ANSI codes for log file
        import re
        clean_msg = re.sub(r'\x1b\[[0-9;]*m', '', msg)
        log_file.write(clean_msg + '\n')

    def log_only(msg: str):
        """Write to log file only."""
        log_file.write(msg + '\n')

    log(click.style("DBC Conflict Scanner", bold=True))
    log(f"Log: {log_path}")
    log("")

    log_only(f"# DBC Conflict Report")
    log_only(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    log_only("")

    # Collect all DBC sources
    sources = collect_dbc_sources(craft_root)

    # Filter by zpak if specified
    if filter_zpak:
        zpak_filter = set(z.strip() for z in filter_zpak.split(','))
        sources = [s for s in sources if s[1] in zpak_filter]
        if not sources:
            log_file.close()
            raise click.ClickException(f"No zpaks found matching: {filter_zpak}")

    if not sources:
        log("No DBC sources found in zpaks")
        log_file.close()
        return

    log(f"[1/2] Scanning {len(sources)} zpak(s) for conflicts...")

    def progress(checked, total):
        click.echo(f"      Checked {checked}/{total}...", nl=False)
        click.echo('\r', nl=False)

    all_conflicts, all_redundants = detect_dbc_conflicts(
        sources, filter_table=filter_table, progress_callback=progress
    )

    if not all_conflicts and not all_redundants:
        log(click.style("\nNo conflicts detected", fg='green'))
        log_file.close()
        return

    # Report results
    log(f"\n[2/2] Results:")
    log("")

    # Group by table for display
    conflicts_by_table: Dict[str, List] = {}
    redundants_by_table: Dict[str, List] = {}

    for table, row_id, mods in all_conflicts:
        if table not in conflicts_by_table:
            conflicts_by_table[table] = []
        conflicts_by_table[table].append((row_id, mods))

    for table, row_id, mods in all_redundants:
        if table not in redundants_by_table:
            redundants_by_table[table] = []
        redundants_by_table[table].append((row_id, mods))

    all_tables = sorted(set(conflicts_by_table.keys()) | set(redundants_by_table.keys()))

    for table_name in all_tables:
        table_conflicts = conflicts_by_table.get(table_name, [])
        table_redundants = redundants_by_table.get(table_name, [])

        conflict_str = f"{len(table_conflicts)} conflict" if table_conflicts else ""
        if table_conflicts and len(table_conflicts) != 1:
            conflict_str += "s"
        redundant_str = f"{len(table_redundants)} redundant" if table_redundants else ""
        parts = [p for p in [conflict_str, redundant_str] if p]

        header = f"{table_name} ({', '.join(parts)})"
        log(click.style(header, fg='yellow' if table_conflicts else 'cyan', bold=True))
        log_only("")

        # Show conflicts (limited on console, full in log)
        if table_conflicts:
            table_conflicts.sort(key=lambda x: x[0])

            for i, (row_id, mods_with_values) in enumerate(table_conflicts):
                mods_with_values.sort(key=lambda x: x[1])
                if i < 5:  # Show first 5 on console
                    log(click.style(f"  ID {row_id}:", fg='yellow') + " (CONFLICT)")
                    for zpak_name, priority, filename, sql_mods in mods_with_values:
                        log(f"    [{priority:3}] {zpak_name} ({filename})")
                        # Show the SQL statement diff
                        for sql_mod in sql_mods:
                            stmt_preview = sql_mod.statement[:100] + '...' if len(sql_mod.statement) > 100 else sql_mod.statement
                            log(f"           {sql_mod.mod_type}: {stmt_preview}")
                else:
                    # Log file only (show full statements)
                    log_only(f"  ID {row_id}: (CONFLICT)")
                    for zpak_name, priority, filename, sql_mods in mods_with_values:
                        log_only(f"    [{priority:3}] {zpak_name} ({filename})")
                        for sql_mod in sql_mods:
                            log_only(f"           {sql_mod.mod_type}: {sql_mod.statement}")

            if len(table_conflicts) > 5:
                log(f"  ... and {len(table_conflicts) - 5} more conflicts (see log file)")

        # Show redundants (limited on console, full in log)
        if table_redundants:
            table_redundants.sort(key=lambda x: x[0])

            for i, (row_id, mods_with_values) in enumerate(table_redundants):
                mods_with_values.sort(key=lambda x: x[1])
                if i < 3:  # Show first 3 on console
                    log(click.style(f"  ID {row_id}:", fg='cyan') + " (REDUNDANT)")
                    for zpak_name, priority, filename, sql_mods in mods_with_values:
                        log(f"    [{priority:3}] {zpak_name} ({filename})")
                else:
                    # Log file only
                    log_only(f"  ID {row_id}: (REDUNDANT)")
                    for zpak_name, priority, filename, sql_mods in mods_with_values:
                        log_only(f"    [{priority:3}] {zpak_name} ({filename})")

            if len(table_redundants) > 3:
                log(f"  ... and {len(table_redundants) - 3} more redundants (see log file)")

        log("")
        log_only("")

    # ── Per-zpak breakdown table ──
    from collections import Counter
    zpak_stats: Dict[str, Dict] = {}

    def _tally(entries, kind):
        zpak_names = [zpak_name for zpak_name, _, _, _ in entries]
        for zpak_name, priority, _, _ in entries:
            if zpak_name not in zpak_stats:
                zpak_stats[zpak_name] = {
                    'priority': priority,
                    'conflicts': 0,
                    'redundants': 0,
                    'rivals': Counter(),
                }
            zpak_stats[zpak_name][kind] += 1
            for other in zpak_names:
                if other != zpak_name:
                    zpak_stats[zpak_name]['rivals'][other] += 1

    for _, _, mods in all_conflicts:
        _tally(mods, 'conflicts')
    for _, _, mods in all_redundants:
        _tally(mods, 'redundants')

    log(click.style("  Conflict Breakdown", bold=True))
    log("")
    log(f"  {'Zpak':<24} {'Pri':>3} {'Conflicts':>9} {'Redundant':>9} {'Total':>7}  Most Conflicted With")
    log(f"  {'─' * 24} {'─' * 3} {'─' * 9} {'─' * 9} {'─' * 7}  {'─' * 28}")

    for name in sorted(zpak_stats, key=lambda n: zpak_stats[n]['conflicts'], reverse=True):
        stats = zpak_stats[name]
        pri = stats['priority']
        conf = stats['conflicts']
        redn = stats['redundants']
        total = conf + redn
        top_rival, top_count = stats['rivals'].most_common(1)[0] if stats['rivals'] else ('—', 0)
        rival_str = f"{top_rival} ({top_count})"

        conf_str = f"{conf:>9}"
        if conf:
            conf_str = click.style(conf_str, fg='yellow')
        redn_str = f"{redn:>9}"
        if redn:
            redn_str = click.style(redn_str, fg='cyan')

        log(f"  {name:<24} {pri:>3} {conf_str} {redn_str} {total:>7}  {rival_str}")

    log("")
    log(f"  Tables with issues: {len(all_tables)}")
    if all_conflicts:
        log(click.style(f"  Real conflicts: {len(all_conflicts)}", fg='yellow') +
            " (different values, order matters)")
    if all_redundants:
        log(click.style(f"  Redundant: {len(all_redundants)}", fg='cyan') +
            " (identical changes, can consolidate)")
    log("")
    log("  Note: Higher priority zpaks overwrite lower priority changes.")
    log("        Lower priority number = applied first, higher = wins.")

    log_file.close()
    click.echo()
    click.echo(f"Found issues in {len(all_tables)} table(s) across {len(sources)} zpak(s)")


# =============================================================================
# Apply Command
# =============================================================================

def _check_apply_conflicts(changed_files: List[Tuple[Path, str, str]],
                           applied_hashes: Dict[str, Tuple[str, str]],
                           craft_root: Path) -> Tuple[List[Dict], List[Dict]]:
    """Check for row conflicts between changed files and already-applied files.

    Two-pass approach:
    1. First pass: Find row IDs that appear in multiple files
    2. Second pass: For conflicting IDs, compare values to classify as
       redundant (same change) vs legitimate conflict (different change)

    Args:
        changed_files: List of (filepath, zpak_name, hash) for files to be applied
        applied_hashes: Dict of filename -> (hash, zpak) for already-applied files
        craft_root: Path to Zeppelin-Craft

    Returns:
        Tuple of (conflicts, redundants) where each is a list of dicts with
        table, id, changed_file, applied_file info
    """
    conflicts = []
    redundants = []

    # Build map of table -> {id -> [(zpak, filename, priority, filepath)]} for changed files
    changed_modifications: Dict[str, Dict[int, List[Tuple[str, str, int, Path]]]] = {}

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
                        (zpak_name, filepath.name, priority, filepath)
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

            # Parse full modifications for redundancy check
            applied_mods = parse_sql_modifications(sql_content, table_name)

            for row_id in affected_ids:
                if row_id in changed_modifications[table_name]:
                    # Conflict found - check priority
                    for changed_zpak, changed_filename, changed_priority, changed_path in changed_modifications[table_name][row_id]:
                        # Only warn if applied file has HIGHER priority (applied later in rebuild)
                        # because applying changed file would overwrite higher-priority changes
                        if applied_priority > changed_priority:
                            # Second pass: check if redundant (same values) or real conflict
                            is_redundant = False
                            try:
                                changed_sql = changed_path.read_text()
                                changed_mods = parse_sql_modifications(changed_sql, table_name)

                                if row_id in changed_mods and row_id in applied_mods:
                                    is_redundant = compare_modifications(
                                        changed_mods[row_id],
                                        applied_mods[row_id]
                                    )
                            except Exception:
                                pass

                            conflict_info = {
                                'table': table_name,
                                'id': row_id,
                                'changed_file': changed_filename,
                                'changed_zpak': changed_zpak,
                                'changed_priority': changed_priority,
                                'applied_file': applied_filename,
                                'applied_zpak': applied_zpak,
                                'applied_priority': applied_priority,
                            }

                            if is_redundant:
                                redundants.append(conflict_info)
                            else:
                                conflicts.append(conflict_info)
        except Exception:
            continue

    return conflicts, redundants


@db.command('apply')
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
        conflicts, redundants = _check_apply_conflicts(changed_for_conflict, stored_hashes, craft_root)

        # Show redundants first (informational)
        if redundants:
            click.echo(click.style(f"\nRedundant changes: {len(redundants)} row(s)", fg='cyan'))
            click.echo("These files make identical changes to already-applied files (can be consolidated):\n")

            by_table: Dict[str, List] = {}
            for r in redundants:
                if r['table'] not in by_table:
                    by_table[r['table']] = []
                by_table[r['table']].append(r)

            for table, table_redundants in by_table.items():
                click.echo(f"  {table}:")
                for r in table_redundants[:3]:
                    click.echo(f"    ID {r['id']}: {r['changed_zpak']}/{r['changed_file']} = {r['applied_zpak']}/{r['applied_file']}")
                if len(table_redundants) > 3:
                    click.echo(f"    ... and {len(table_redundants) - 3} more")

        # Show real conflicts (warnings)
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

@db.command('extract')
@click.option('--name', '-n', required=True,
              help='Name for the extracted source (zpak name)')
@click.option('--task', '-t', 'task_id', required=True,
              help='Task ID (F-XXX or I-XXX) - REQUIRED for file naming')
@click.option('--priority', '-p', type=int, default=100,
              help='Priority (default: 100)')
@click.option('--zpak', '-z', 'zpak_name',
              help='Add to existing zpak instead of creating new one')
@click.pass_context
def dbc_extract(ctx, name: str, task_id: str, priority: int,
                zpak_name: Optional[str]):
    """Extract current uncommitted DBC changes as SQL files.

    Compares live database against original_dbc and generates SQL files
    for any differences found. Requires --task for file naming.

    Examples:
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

                # All DBC files require feature ID prefix
                sql_file = dbc_dir / f"[{task_id}]_{table}.sql"

                with open(sql_file, 'w') as f:
                    f.write(f"-- [{task_id}] {name}: {table}\n")
                    f.write(f"-- Extracted by zep dbc extract\n\n")
                    f.write(sql)

                line_count = sql.count('\n') + 1
                total_lines += line_count
                click.echo(f"  {sql_file.name}: {line_count} lines")

            click.echo(f"\nTotal: {total_lines} lines in {len(tables_with_changes)} files")

            # Register feature
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
        List of existing [BASE,F-XXX]_*.sql file paths for the feature
    """
    dbc_dir = zpak_path / 'dbc'
    if not dbc_dir.exists():
        return []

    # Note: glob treats [...] as a character class, so we must filter manually
    prefix = f"[BASE,{feature_id}]_" if feature_id else "[BASE,"
    return [f for f in dbc_dir.iterdir() if f.name.startswith(prefix) and f.suffix == '.sql']


def _import_single_module(ctx, zpak_path: Path, craft_root: Path) -> bool:
    """Import binary DBC files for a single zpak.

    Args:
        ctx: Click context
        zpak_path: Path to the zpak directory
        craft_root: Path to Zeppelin-Craft

    Returns:
        True if import succeeded, False if skipped or failed
    """
    name = zpak_path.name

    # Load zpak.json and validate required fields
    manifest = load_manifest(zpak_path / 'zpak.json')
    if not manifest:
        click.echo(click.style(f"  {name}: Failed to load zpak.json, skipping", fg='yellow'))
        return False

    # Feature ID is REQUIRED
    task_id = manifest.get('feature_id')
    if not task_id:
        click.echo(click.style(f"  {name}: Missing 'feature_id' in zpak.json, skipping", fg='yellow'))
        return False

    # DBC source path (optional in zpak.json, default to standard location)
    dbc_source = manifest.get('dbc_source')
    if dbc_source:
        source_path = Path(dbc_source)
        if not source_path.is_absolute():
            source_path = (zpak_path / source_path).resolve()
    else:
        source_path = zpak_path / 'mpq' / 'source-assets' / 'DBFilesClient'

    # Validate source path exists and has DBC files
    if not source_path.exists():
        click.echo(click.style(f"  {name}: DBC source path not found, skipping", fg='yellow'))
        return False

    dbc_files = list(source_path.glob('*.dbc')) + list(source_path.glob('*.DBC'))
    if not dbc_files:
        click.echo(click.style(f"  {name}: No DBC files found, skipping", fg='yellow'))
        return False

    existing_files = _get_existing_dbc_files(zpak_path, task_id)

    # Get config and registry
    config = get_dbc_config(ctx)
    registry = ctx.obj['registry']

    click.echo()
    click.echo(click.style(f"DBC Import: {name}", bold=True))
    click.echo(f"  Zpak: {zpak_path.relative_to(craft_root)}")
    click.echo(f"  Source: {source_path}")
    click.echo(f"  Feature: {task_id}")
    click.echo(f"  DBC files: {len(dbc_files)}")
    click.echo()

    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    # Reset only the specific tables being imported (not all 193 tables)
    # Get table names from DBC files (lowercase)
    tables_to_reset = [dbc_file.stem.lower() for dbc_file in dbc_files]
    click.echo(f"Step 1: Resetting {len(tables_to_reset)} table(s) in {config.scratch}...")

    try:
        with DBCConnection(config) as db_conn:
            orig_conn = db_conn.get_connection(config.original)
            orig_tables = get_tables(orig_conn)
            orig_tables_lower = {t.lower(): t for t in orig_tables}

            scratch_conn = db_conn.get_connection(config.scratch)
            scratch_cursor = scratch_conn.cursor()

            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")

            reset_count = 0
            for table_name in tables_to_reset:
                # Find the actual table name (case-insensitive match)
                if table_name in orig_tables_lower:
                    actual_table = orig_tables_lower[table_name]
                    scratch_cursor.execute(f"DROP TABLE IF EXISTS `{actual_table}`")
                    scratch_cursor.execute(f"CREATE TABLE `{actual_table}` LIKE `{config.original}`.`{actual_table}`")
                    scratch_cursor.execute(f"INSERT INTO `{actual_table}` SELECT * FROM `{config.original}`.`{actual_table}`")
                    reset_count += 1
                else:
                    click.echo(click.style(f"  Warning: Table '{table_name}' not found in {config.original}", fg='yellow'))

            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            scratch_conn.commit()
            scratch_cursor.close()

        click.echo(click.style(f"  Reset {reset_count} table(s)", fg='green'))

    except Exception as e:
        click.echo(click.style(f"  Failed to reset scratch database: {e}", fg='red'))
        return False

    # Import DBC files via DBCTool
    click.echo(f"\nStep 2: Importing DBC files via DBCTool...")

    meta_dir = DBCTOOL_PATH.parent / "meta"

    # Create config for DBCTool pointing directly at source path
    scratch_config = {
        "dbc": {
            "user": config.user,
            "password": config.password,
            "host": config.host,
            "port": str(config.port),
            "name": config.scratch
        },
        "paths": {
            "base": str(source_path),
            "export": str(source_path.parent),
            "meta": str(meta_dir)
        },
        "options": {"use_versioning": False}
    }

    scratch_config_path = craft_root / 'scratch_config.json'
    with open(scratch_config_path, 'w') as f:
        json.dump(scratch_config, f, indent=2)

    # Standardise DBC filenames to match DBCTool's expected casing from meta files.
    # Files extracted from MPQs can have arbitrary casing (e.g. Creaturedisplayinfo.dbc)
    # but DBCTool expects exact filenames from its meta files (e.g. CreatureDisplayInfo.dbc).
    meta_dir = DBCTOOL_PATH.parent / "meta"
    for dbc_file in dbc_files:
        meta_path = meta_dir / f"{dbc_file.stem.lower()}.meta.json"
        if meta_path.exists():
            with open(meta_path) as mf:
                expected_name = json.load(mf).get("file", dbc_file.name)
            if dbc_file.name != expected_name:
                dbc_file.rename(dbc_file.parent / expected_name)
    # Re-scan after rename
    dbc_files = sorted(source_path.glob("*.dbc"))

    try:
        # Import each DBC file
        imported_tables = []
        for dbc_file in dbc_files:
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

    finally:
        scratch_config_path.unlink(missing_ok=True)

    if not imported_tables:
        click.echo(click.style(f"  No tables were imported successfully for {name}", fg='red'))
        return False

    click.echo(f"  Imported {len(imported_tables)} table(s)")

    # Diff scratch vs original
    click.echo(f"\nStep 3: Analyzing differences...")

    try:
        with DBCConnection(config) as db_conn:
            result = compare_databases(db_conn, config.scratch, config.original)

            if result["identical"]:
                click.echo(click.style("  No differences found", fg='yellow'))
                # Clean up only the tables we imported
                scratch_conn = db_conn.get_connection(config.scratch)
                scratch_cursor = scratch_conn.cursor()
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
                for table_name in imported_tables:
                    scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table_name}`")
                scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
                scratch_conn.commit()
                return True

            tables_with_changes = []
            for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
                diff = get_table_diff(db_conn, table, config.scratch, config.original)
                adds = len(diff["only_in_db1"])
                mods = len(diff["modified"])
                dels = len(diff["only_in_db2"])
                if adds > 0 or mods > 0 or dels > 0:
                    tables_with_changes.append(table)
                    click.echo(f"    {table}: +{adds} ~{mods} -{dels}")

            # Write SQL files to zpak
            click.echo(f"\nStep 4: Writing SQL files to zpak...")

            dbc_dir = zpak_path / 'dbc'

            # Handle existing files - only remove the specific files we'll overwrite
            if existing_files:
                for f in existing_files:
                    f.unlink()
                click.echo(f"  Removed {len(existing_files)} existing file(s)")

            # Ensure dbc directory exists
            dbc_dir.mkdir(parents=True, exist_ok=True)

            # Generate per-table SQL files with [BASE,F-XXX]_ prefix
            # BASE first ensures imports sort before custom edits
            total_lines = 0
            for table in tables_with_changes:
                sql = generate_diff_sql(db_conn, table, config.scratch, config.original)

                sql_filename = f"[BASE,{task_id}]_{table}.sql"
                sql_file = dbc_dir / sql_filename
                with open(sql_file, 'w') as f:
                    f.write(f"-- [BASE,{task_id}] {name}: {table}\n")
                    f.write(f"-- Imported by zep dbc import-module - DO NOT EDIT\n")
                    f.write(f"-- To customize, create [{task_id}]_{table}.sql with overrides\n\n")
                    f.write(sql)

                line_count = sql.count('\n') + 1
                total_lines += line_count
                click.echo(f"  {sql_filename}: {line_count} lines")

            click.echo(f"\n  Total: {total_lines} lines")

            # Clean up only the tables we imported
            click.echo(f"\nStep 5: Cleaning up...")
            scratch_conn = db_conn.get_connection(config.scratch)
            scratch_cursor = scratch_conn.cursor()
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
            for table_name in imported_tables:
                scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table_name}`")
            scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
            scratch_conn.commit()
            click.echo(click.style(f"  Cleaned up {len(imported_tables)} table(s)", fg='green'))

    except Exception as e:
        click.echo(click.style(f"  Import failed: {e}", fg='red'))
        return False

    # Register feature in registry if task_id provided
    if task_id:
        registry.register_feature(task_id, name)
        registry.save()

    click.echo(click.style(f"\nImport complete!", fg='green'))
    click.echo(f"  Zpak: {zpak_path.relative_to(craft_root)}")
    if task_id:
        click.echo(f"  Feature: {task_id}")
    click.echo(f"  Tables: {', '.join(tables_with_changes)}")
    return True


@dbc_bin.command('import')
@click.option('--name', '-n',
              help='Zpak name (interactive selection if omitted)')
@click.option('--all', '-a', 'import_all', is_flag=True,
              help='Import all zpaks with DBC source files')
@click.option('--priority', '-p', type=int, default=50,
              help='Priority (default: 50, lower = applied first)')
@click.pass_context
def dbc_import_module(ctx, name: Optional[str], import_all: bool, priority: int):
    """Import binary DBC files into an existing zpak.

    Reads configuration from zpak.json:
      - feature_id: Required. Used for output file naming.
      - dbc_source: Optional. Path to DBC files (default: mpq/source-assets/DBFilesClient)

    Examples:
        zep dbc bin import                    # Interactive zpak selection
        zep dbc bin import --name worgoblin   # Import specific zpak
        zep dbc bin import --all              # Re-import all zpaks
    """
    craft_root = ctx.obj['craft_root']

    if import_all:
        # Import all zpaks with DBC source files
        all_zpaks = _discover_zpaks_with_info(craft_root)
        zpaks_with_dbc = [z for z in all_zpaks if z['has_dbc_source'] and z.get('feature_id')]
        if not zpaks_with_dbc:
            raise click.ClickException(
                "No zpaks with DBC source files and feature_id found.\n"
                "DBC files should be in: zpak/mpq/source-assets/DBFilesClient/"
            )

        click.echo(click.style(f"Importing all {len(zpaks_with_dbc)} zpak(s) with DBC sources", bold=True))
        click.echo()

        succeeded = 0
        failed = 0
        skipped = 0
        for zpak_info in zpaks_with_dbc:
            try:
                if _import_single_module(ctx, zpak_info['path'], craft_root):
                    succeeded += 1
                else:
                    skipped += 1
            except Exception as e:
                click.echo(click.style(f"  {zpak_info['name']}: Error - {e}", fg='red'))
                failed += 1
            click.echo()

        click.echo(click.style("=" * 50, bold=True))
        click.echo(f"Results: {succeeded} imported, {skipped} skipped, {failed} failed")
        return

    # Single zpak mode
    if not name:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            raise click.ClickException(
                "Interactive mode requires simple-term-menu.\n"
                "Install with: pip install simple-term-menu\n"
                "Or specify --name directly."
            )

        all_zpaks = _discover_zpaks_with_info(craft_root)
        if not all_zpaks:
            raise click.ClickException("No zpaks found in zpaks/ or external/")

        # Filter to only show zpaks with DBC source files
        zpaks = [z for z in all_zpaks if z['has_dbc_source']]
        if not zpaks:
            raise click.ClickException(
                "No zpaks with DBC files found.\n"
                "DBC files should be in: zpak/mpq/source-assets/DBFilesClient/"
            )

        # Build menu options
        options = []
        for zpak in zpaks:
            options.append(f"  {zpak['name']:<25} {zpak['description']}")

        menu = TerminalMenu(
            options,
            title=f"\n  Select zpak to import DBC files from ({len(zpaks)} with DBC):\n",
            menu_cursor="> ",
            menu_cursor_style=("fg_cyan", "bold"),
            menu_highlight_style=("fg_cyan", "bold"),
            cycle_cursor=True,
            clear_screen=True,
            status_bar="  Navigate | Enter: Select | q: Cancel",
            status_bar_style=("fg_gray",),
        )

        result = menu.show()

        if result is None:
            click.echo("Cancelled.")
            return

        selected_zpak = zpaks[result]
        name = selected_zpak['name']
        zpak_path = selected_zpak['path']

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

    _import_single_module(ctx, zpak_path, craft_root)

dbc_import_module.zpak_filter = 'has_dbc_source'


# =============================================================================
# Export Command
# =============================================================================

@dbc_bin.command('export')
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

@dbc_bin.command('init-original')
@click.option('--source', '-s', type=click.Path(exists=True),
              help='Path to vanilla DBC files (default: from config)')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def dbc_init_original(ctx, source: Optional[str], force: bool):
    """Initialize original_dbc from vanilla DBC files.

    Imports all vanilla DBC files into original_dbc using meta/
    schema (snake_case columns with Loc type expansion).

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
    click.echo(f"  Meta: meta/ (snake_case)")
    click.echo()

    if not force:
        click.echo(click.style("WARNING: This will DROP and recreate ALL tables in original_dbc!", fg='yellow'))
        if not click.confirm("Continue?"):
            click.echo("Cancelled.")
            return

    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    # Use meta/ for snake_case columns with Loc type
    meta_dir = DBCTOOL_PATH.parent / "meta"

    # Create config for DBCTool pointing directly at source path
    temp_config = {
        "dbc": {
            "user": config.user,
            "password": config.password,
            "host": config.host,
            "port": str(config.port),
            "name": config.original
        },
        "paths": {
            "base": str(source_path),
            "export": str(source_path.parent),
            "meta": str(meta_dir)
        },
        "options": {"use_versioning": False}
    }

    temp_config_path = CRAFT_ROOT / 'temp_init_config.json'
    with open(temp_config_path, 'w') as f:
        json.dump(temp_config, f, indent=2)

    try:

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

    finally:
        temp_config_path.unlink(missing_ok=True)

    click.echo()
    click.echo(click.style(f"Init complete: {imported} imported, {failed} failed", fg='green' if failed == 0 else 'yellow'))
    click.echo()
    click.echo("Next steps:")
    click.echo("  1. Run 'zep dbc rebuild' to copy original_dbc to dbc/expected_dbc")
    click.echo("  2. zpak SQL files will be applied during rebuild")
