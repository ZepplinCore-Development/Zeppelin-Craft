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
# Apply Command
# =============================================================================

@dbc.command('apply')
@click.argument('target', required=False)
@click.option('--task', '-t', 'task_id',
              help='Apply only files for specific task (F-XXX or I-XXX)')
@click.option('--zpak', '-z', 'zpak_name',
              help='Apply from specific zpak only')
@click.option('--dry-run', is_flag=True,
              help='Preview without applying')
@click.pass_context
def dbc_apply(ctx, target: Optional[str], task_id: Optional[str], zpak_name: Optional[str],
              dry_run: bool):
    """Apply existing zpak DBC files to databases.

    Use this when you've manually created/edited DBC SQL files in a zpak
    and want to apply them without the modify command's save step.

    Examples:
        zep dbc apply                           # Apply all zpak DBC files
        zep dbc apply --task F-212              # Apply only F-212_*.sql files
        zep dbc apply --zpak mage-tanking       # Apply from specific zpak
        zep dbc apply zpaks/my-zpak/dbc/F-212_spell.sql  # Apply specific file
    """
    craft_root = ctx.obj['craft_root']
    config = get_dbc_config(ctx)

    files_to_apply = []

    if target:
        # Apply specific file
        target_path = Path(target)
        if not target_path.is_absolute():
            target_path = craft_root / target
        if not target_path.exists():
            raise click.ClickException(f"File not found: {target_path}")
        files_to_apply.append(target_path)
    else:
        # Collect files from zpaks
        sources = collect_dbc_sources(craft_root)

        for priority, name, dbc_path, sql_files in sources:
            # Filter by zpak name
            if zpak_name and name != zpak_name:
                continue

            for sql_file in sql_files:
                # Filter by task ID
                if task_id:
                    if not sql_file.name.startswith(f"{task_id}_"):
                        continue
                files_to_apply.append(sql_file)

    if not files_to_apply:
        click.echo("No files to apply")
        return

    click.echo(f"Files to apply ({len(files_to_apply)}):")
    for f in files_to_apply:
        click.echo(f"  {f.relative_to(craft_root)}")

    if dry_run:
        click.echo(click.style("\nDRY RUN - no changes made", fg='yellow'))
        return

    # Apply to live and expected databases
    errors = []
    for sql_file in files_to_apply:
        click.echo(f"\nApplying {sql_file.name}...")

        with open(sql_file) as f:
            sql = f.read()

        if not sql.strip():
            click.echo("  (empty file, skipped)")
            continue

        # Apply to live
        success, output = run_sql(sql, config, config.live)
        if not success:
            errors.append((sql_file.name, f"live: {output}"))
            click.echo(click.style(f"  {config.live}: FAILED", fg='red'))
        else:
            click.echo(click.style(f"  {config.live}: OK", fg='green'))

        # Apply to expected
        success, output = run_sql(sql, config, config.expected)
        if not success:
            errors.append((sql_file.name, f"expected: {output}"))
            click.echo(click.style(f"  {config.expected}: FAILED", fg='red'))
        else:
            click.echo(click.style(f"  {config.expected}: OK", fg='green'))

    click.echo()
    if errors:
        click.echo(click.style("Completed with errors:", fg='yellow'))
        for name, err in errors:
            click.echo(f"  {name}: {err[:60]}")
    else:
        click.echo(click.style("Apply complete!", fg='green'))


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

                # Use feature prefix if task_id provided
                if task_id:
                    sql_file = dbc_dir / f"{task_id}_{table}.sql"
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

    Imports DBC files using DBCTool into scratch_dbc, compares against
    original_dbc, and generates SQL files for any differences.

    Examples:
        zep dbc import-module --name worgoblin --source /path/to/dbc/
    """
    import shutil
    import tempfile

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
        meta_dir = DBCTOOL_PATH.parent / "meta"
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

        # Create temp config for DBCTool
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

            result = subprocess.run(
                [str(DBCTOOL_PATH), "import", "-f", "-n", dbc_name, "--config", str(scratch_config_path)],
                cwd=DBCTOOL_PATH.parent,
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                imported_tables.append(dbc_name)
                click.echo(click.style(" OK", fg='green'))
            else:
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

            # Step 4: Create zpak with SQL files
            click.echo(f"\nStep 4: Creating zpak...")

            zpak_path = craft_root / 'zpaks' / name
            if zpak_path.exists():
                raise click.ClickException(f"Zpak '{name}' already exists")

            zpak_path.mkdir(parents=True)
            dbc_dir = zpak_path / 'dbc'
            dbc_dir.mkdir()

            # Create manifest
            manifest = {
                "$schema": "../../schemas/zpak.schema.json",
                "name": name,
                "version": "1.0.0",
                "description": f"Imported from {source_path.name}",
                "author": "Zeppelin Team",
                "type": "acore-extension",
                "contents": {"dbc": ["dbc/*.sql"]},
                "enabled": True,
                "priority": priority
            }

            with open(zpak_path / 'zpak.json', 'w') as f:
                json.dump(manifest, f, indent=2)
                f.write('\n')

            # Generate per-table SQL files
            total_lines = 0
            for table in tables_with_changes:
                sql = generate_diff_sql(db_conn, table, config.scratch, config.original)

                sql_file = dbc_dir / f"{table}.sql"
                with open(sql_file, 'w') as f:
                    f.write(f"-- {name}: {table}\n")
                    f.write(f"-- Imported by zep dbc import-module\n\n")
                    f.write(sql)

                line_count = sql.count('\n') + 1
                total_lines += line_count
                click.echo(f"  {table}.sql: {line_count} lines")

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

    click.echo(click.style(f"\nImport complete!", fg='green'))
    click.echo(f"  Zpak: zpaks/{name}")
    click.echo(f"  Priority: {priority}")
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

    result = subprocess.run(cmd, cwd=DBCTOOL_PATH.parent)

    if result.returncode != 0:
        raise click.ClickException(f"Export failed with code {result.returncode}")

    click.echo(click.style("Export complete", fg='green'))
