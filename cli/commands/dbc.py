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
    zep dbc rebuild [--dry-run]      Rebuild from zpak sources
    zep dbc import-module            Import binary DBC
    zep dbc export                   Export to binary DBC
"""

import json
import os
import subprocess
import sys
from pathlib import Path
from typing import Optional, List, Dict, Any, Tuple

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
)
from lib.registry import Registry
from lib.manifest import load_manifest


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

@click.group()
@click.pass_context
def dbc(ctx):
    """DBC database commands"""
    pass


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
              help='Commit description')
@click.option('--no-commit', is_flag=True,
              help='Skip git commit')
@click.pass_context
def dbc_modify(ctx, sql: Optional[str], sql_file: Optional[str], task_id: str,
               description: Optional[str], no_commit: bool):
    """Modify DBC database with tracking.

    Execute modifications (INSERT/UPDATE/DELETE) with proper tracking:
    - Validates task ID format
    - Saves SQL to zpak dbc/ folder
    - Applies to live and expected databases
    - Creates git commit

    Examples:
        zep dbc modify --task F-004 "UPDATE spell SET SpellName0='Test' WHERE ID=900001"
        zep dbc modify --task I-015 -f changes.sql
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

    # Git commit
    if not no_commit:
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
    all enabled zpak DBC sources in priority order.

    Examples:
        zep dbc rebuild --dry-run   # Preview what would be applied
        zep dbc rebuild             # Rebuild databases
        zep dbc rebuild --force     # Skip confirmation
    """
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
    for priority, name, dbc_path, sql_files in sources:
        click.echo(f"  [{priority:3}] {name} ({len(sql_files)} files)")

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
            for table in tables:
                if table.startswith("dbc_"):
                    continue
                click.echo(f"  Copying {table}...", nl=False)
                live_cursor.execute(f"TRUNCATE TABLE `{table}`")
                live_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{config.original}`.`{table}`")
                click.echo(" OK")

            live_conn.commit()
            live_cursor.close()

    except Exception as e:
        raise click.ClickException(f"Reset failed: {e}")

    click.echo(click.style("  Reset complete", fg='green'))

    # Apply sources
    click.echo(f"\nStep 3: Applying sources...")
    errors = []

    for priority, name, dbc_path, sql_files in sources:
        click.echo(f"  Applying {name}...")

        for sql_file in sql_files:
            try:
                with open(sql_file) as f:
                    sql = f.read()

                if sql.strip():
                    success, output = run_sql(sql, config, config.live)
                    # Show relative path from dbc_path for readability
                    rel_path = sql_file.relative_to(dbc_path)
                    if not success:
                        errors.append((name, str(rel_path), output))
                        click.echo(click.style(f"    {rel_path}: FAILED", fg='red'))
                    else:
                        click.echo(f"    {rel_path}: OK")

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
            for table in tables:
                if table.startswith("dbc_"):
                    continue
                expected_cursor.execute(f"TRUNCATE TABLE `{table}`")
                expected_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{config.live}`.`{table}`")

            expected_conn.commit()
            expected_cursor.close()

    except Exception as e:
        raise click.ClickException(f"Update expected failed: {e}")

    click.echo(click.style("  Expected state updated", fg='green'))

    # Summary
    click.echo()
    if errors:
        click.echo(click.style("Rebuild completed with errors:", fg='yellow'))
        for name, file, err in errors:
            click.echo(f"  {name}/{file}: {err[:80]}")
    else:
        click.echo(click.style("Rebuild complete!", fg='green'))


# =============================================================================
# Import Module Command
# =============================================================================

@dbc.command('import-module')
@click.option('--name', '-n', required=True,
              help='Module name for the zpak')
@click.option('--source', '-s', required=True, type=click.Path(exists=True),
              help='Path to DBC files directory')
@click.option('--priority', '-p', type=int, default=50,
              help='Priority (default: 50, lower = applied first)')
@click.pass_context
def dbc_import_module(ctx, name: str, source: str, priority: int):
    """Import binary DBC files as a new zpak.

    Imports DBC files using DBCTool, compares against original_dbc,
    and generates SQL files for any differences.

    Examples:
        zep dbc import-module --name worgoblin --source /path/to/dbc/
    """
    source_path = Path(source)
    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    # Find DBC files
    dbc_files = list(source_path.glob('*.dbc')) + list(source_path.glob('*.DBC'))
    if not dbc_files:
        raise click.ClickException(f"No .dbc files found in {source_path}")

    click.echo(click.style(f"Importing module: {name}", bold=True))
    click.echo(f"  Source: {source_path}")
    click.echo(f"  Priority: {priority}")
    click.echo(f"  DBC files: {len(dbc_files)}")

    if not DBCTOOL_PATH.exists():
        raise click.ClickException(f"DBCTool not found at {DBCTOOL_PATH}")

    # This is a complex operation - delegate to the existing dbc_manager.py
    # for now, but we'll refactor later
    click.echo(click.style("\nNote: Use Scripts/Patch Builder/dbc_manager.py import-module for now", fg='yellow'))
    click.echo(f"  python3 dbc_manager.py import-module --name {name} --source {source} --priority {priority}")


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

    result = subprocess.run(cmd, cwd=DBCTOOL_PATH.parent)

    if result.returncode != 0:
        raise click.ClickException(f"Export failed with code {result.returncode}")

    click.echo(click.style("Export complete", fg='green'))
