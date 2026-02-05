"""
SQL operations for Zeppelin-Craft CLI.

Commands:
    zep sql execute --changed      Execute new/modified SQL files (hash-based)
    zep sql execute --all          Execute all SQL files
    zep sql drop                   Drop world database and clear tracking
    zep sql reset                  Drop + execute azerothcore zpak
    zep sql format <target>        Format SQL files
    zep sql validate <target>      Validate SQL syntax
    zep sql history                Show execution history
"""

import hashlib
import json
import os
import subprocess
import sys
import tempfile
import time
from pathlib import Path
from typing import Dict, List, Optional, Tuple

import click
from dotenv import load_dotenv

# Load .env from cli directory
_cli_dir = Path(__file__).parent.parent
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)

# Database connection settings (from .env or defaults)
DB_HOST = os.getenv('DB_HOST', '192.168.0.55')
DB_PORT = os.getenv('DB_PORT', '3306')
DB_USER = os.getenv('DB_USER', 'acore')
DB_PASS = os.getenv('DB_PASS', 'acore')
DB_NAME = "acore_world"  # Always acore_world for this module

# Root credentials for privileged operations (DROP/CREATE DATABASE)
DB_ROOT_USER = os.getenv('DB_ROOT_USER', 'root')
DB_ROOT_PASS = os.getenv('DB_ROOT_PASS', '')


def _create_mysql_config() -> str:
    """Create a temporary MySQL config file with credentials.

    Uses --defaults-extra-file to avoid password warning on command line.
    Returns the path to the temp file (caller must delete).
    """
    fd, path = tempfile.mkstemp(suffix='.cnf')
    with os.fdopen(fd, 'w') as f:
        f.write("[client]\n")
        f.write(f"user={DB_USER}\n")
        f.write(f"password={DB_PASS}\n")
        f.write(f"host={DB_HOST}\n")
        f.write(f"port={DB_PORT}\n")
    return path


def get_mysql_command(database: str = DB_NAME, cnf_path: str = None) -> List[str]:
    """Get base MySQL command with connection settings.

    If cnf_path is provided, uses --defaults-extra-file (no password warning).
    Otherwise falls back to command line args (shows warning).
    If database is None, connects without selecting a database.
    """
    if cnf_path:
        cmd = [
            "mysql",
            f"--defaults-extra-file={cnf_path}",
        ]
        if database:
            cmd.append(database)
        return cmd
    else:
        cmd = [
            "mysql",
            "-h", DB_HOST,
            "-P", DB_PORT,
            "-u", DB_USER,
            f"-p{DB_PASS}",
        ]
        if database:
            cmd.append(database)
        return cmd


def run_mysql_query(query: str, database: str = DB_NAME) -> Tuple[bool, str]:
    """Run a MySQL query and return result.

    Uses temp config file to avoid password warning.
    """
    cnf_path = _create_mysql_config()
    try:
        cmd = get_mysql_command(database, cnf_path)
        result = subprocess.run(
            cmd + ["-e", query],
            capture_output=True,
            text=True
        )
        if result.returncode != 0:
            return False, result.stderr.strip()
        return True, result.stdout.strip()
    except Exception as e:
        return False, str(e)
    finally:
        os.unlink(cnf_path)


def run_mysql_query_as_root(query: str, database: str = None) -> Tuple[bool, str]:
    """Run a MySQL query as root user for privileged operations.

    Used for DROP DATABASE, CREATE DATABASE, etc.
    """
    fd, cnf_path = tempfile.mkstemp(suffix='.cnf')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write("[client]\n")
            f.write(f"user={DB_ROOT_USER}\n")
            f.write(f"password={DB_ROOT_PASS}\n")
            f.write(f"host={DB_HOST}\n")
            f.write(f"port={DB_PORT}\n")

        cmd = ["mysql", f"--defaults-extra-file={cnf_path}"]
        if database:
            cmd.append(database)
        cmd.extend(["-e", query])

        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            return False, result.stderr.strip()
        return True, result.stdout.strip()
    except Exception as e:
        return False, str(e)
    finally:
        os.unlink(cnf_path)


def ensure_tracking_table() -> bool:
    """Check that AC's updates table exists.

    We use AC's native `updates` table instead of our own tracking table.
    This ensures compatibility with ac-db-import and avoids duplicate tracking.
    """
    query = "SELECT 1 FROM `updates` LIMIT 1"
    success, _ = run_mysql_query(query)
    return success


def calculate_file_hash(filepath: Path) -> str:
    """Calculate SHA1 hash of file contents (uppercase, matching AC format)."""
    sha1 = hashlib.sha1()
    with open(filepath, 'rb') as f:
        sha1.update(f.read())
    return sha1.hexdigest().upper()


def get_stored_hash(filename: str) -> Optional[str]:
    """Get stored hash for a file from AC's updates table."""
    query = f"SELECT hash FROM `updates` WHERE name = '{filename}'"
    success, result = run_mysql_query(query)
    if success and result:
        lines = result.strip().split('\n')
        if len(lines) > 1:  # Has header + data
            return lines[1].strip().upper()
    return None


def update_tracking(filename: str, file_hash: str, zpak: str, execution_ms: int):
    """Record applied SQL in AC's updates table.

    Uses 'MODULE' state for acore-extension zpaks, 'CUSTOM' for others.
    This mirrors AC's own tracking and ensures compatibility with ac-db-import.
    """
    # Determine state based on zpak type (MODULE for AC modules, CUSTOM for our SQL)
    state = 'CUSTOM'

    query = f"""
    REPLACE INTO `updates` (name, hash, state, timestamp, speed)
    VALUES ('{filename}', '{file_hash}', '{state}', NOW(), {execution_ms})
    """
    run_mysql_query(query)


def execute_sql_file(sql_file: Path, dry_run: bool = False) -> Tuple[bool, str, int]:
    """Execute a SQL file against the database.

    Uses temp config file to avoid password warning.

    Returns:
        Tuple of (success, message, execution_ms)
    """
    if not sql_file.exists():
        return False, f"File not found: {sql_file}", 0

    if dry_run:
        return True, "Would execute", 0

    cnf_path = _create_mysql_config()
    try:
        start_time = time.time()
        cmd = get_mysql_command(DB_NAME, cnf_path)
        with open(sql_file, 'r') as f:
            result = subprocess.run(
                cmd,
                stdin=f,
                capture_output=True,
                text=True
            )
        execution_ms = int((time.time() - start_time) * 1000)

        if result.returncode != 0:
            error = result.stderr.strip() if result.stderr else "Unknown error"
            return False, f"Error: {error}", execution_ms

        return True, "OK", execution_ms

    except FileNotFoundError:
        return False, "MySQL client not found", 0
    except Exception as e:
        return False, f"Error: {str(e)}", 0
    finally:
        os.unlink(cnf_path)


def load_zpak_manifest(zpak_dir: Path) -> Optional[Dict]:
    """Load zpak.json manifest."""
    manifest_path = zpak_dir / 'zpak.json'
    if manifest_path.exists():
        with open(manifest_path) as f:
            return json.load(f)
    return None


def get_zpak_sql_paths(craft_root: Path, zpak_name: str, manifest: Dict) -> List[Tuple[Path, str]]:
    """Get SQL paths for a zpak based on type and manifest.

    Returns list of (path, subfolder_type) tuples where subfolder_type is 'base', 'updates', or 'root'
    """
    sql_paths = []
    zpak_dir = craft_root / 'zpaks' / zpak_name
    zpak_type = manifest.get('type', 'native')
    has_explicit_paths = False

    # Check for explicit sql_path (treated as 'base' folder)
    if 'sql_path' in manifest:
        override_path = craft_root / manifest['sql_path']
        if override_path.exists():
            sql_paths.append((override_path, 'base'))
            has_explicit_paths = True

    # Check for explicit sql_updates_path (treated as 'updates' folder)
    if 'sql_updates_path' in manifest:
        updates_override = craft_root / manifest['sql_updates_path']
        if updates_override.exists():
            sql_paths.append((updates_override, 'updates'))
            has_explicit_paths = True

    # For acore-extension WITHOUT explicit paths, check module's standard location
    if zpak_type == 'acore-extension' and 'acore' in manifest and not has_explicit_paths:
        module_name = manifest['acore'].get('module', '')
        if module_name and module_name != 'azerothcore':
            module_sql = craft_root / '..' / 'Zeppelin-Core' / 'modules' / module_name / 'data' / 'sql' / 'db-world'
            if module_sql.exists():
                base_path = module_sql / 'base'
                updates_path = module_sql / 'updates'
                if base_path.exists():
                    sql_paths.append((base_path, 'base'))
                if updates_path.exists():
                    sql_paths.append((updates_path, 'updates'))
                # Also check for SQL files directly in db-world (no subfolders)
                # Only add if base/updates don't exist (some modules have flat structure)
                if not base_path.exists() and not updates_path.exists():
                    sql_paths.append((module_sql, 'root'))

    # Always check zpak's own sql folder (for counter/override SQL)
    zpak_sql = zpak_dir / 'sql'
    if zpak_sql.exists():
        sql_paths.append((zpak_sql, 'zpak'))

    return sql_paths


def collect_sql_files_from_paths(paths: List[Tuple[Path, str]]) -> List[Tuple[Path, str]]:
    """Collect SQL files from paths, respecting order: base -> updates -> root/zpak.

    Returns list of (filepath, source_type) tuples.
    """
    files = []
    seen = set()

    # Process in order: base, updates, root, zpak
    for folder_type in ['base', 'updates', 'root', 'zpak']:
        for path, ptype in paths:
            if ptype != folder_type:
                continue
            if not path.exists():
                continue

            # Get SQL files recursively, sorted alphabetically
            for sql_file in sorted(path.glob('**/*.sql')):
                if sql_file not in seen:
                    seen.add(sql_file)
                    files.append((sql_file, folder_type))

    return files


def get_enabled_zpaks_by_priority(craft_root: Path) -> List[Tuple[str, Dict]]:
    """Get all enabled zpaks sorted by priority (lowest first)."""
    zpaks = []
    zpaks_dir = craft_root / 'zpaks'

    if not zpaks_dir.exists():
        return []

    for zpak_dir in zpaks_dir.iterdir():
        if not zpak_dir.is_dir():
            continue
        manifest = load_zpak_manifest(zpak_dir)
        if manifest and manifest.get('enabled', True):
            priority = manifest.get('priority', 100)
            zpaks.append((zpak_dir.name, manifest, priority))

    # Sort by priority
    zpaks.sort(key=lambda x: x[2])
    return [(name, manifest) for name, manifest, _ in zpaks]


def collect_all_sql_files(craft_root: Path, zpak_name: Optional[str] = None,
                          source_filter: Optional[List[str]] = None) -> List[Tuple[Path, str, str]]:
    """Collect all SQL files across zpaks in priority order.

    Args:
        craft_root: Path to Zeppelin-Craft root
        zpak_name: Optional specific zpak to collect from
        source_filter: Optional list of source types to include (e.g., ['base'] for base only)
                      If None, includes all source types.

    Returns list of (filepath, zpak_name, source_type) tuples.
    """
    all_files = []

    if zpak_name:
        # Specific zpak
        zpak_dir = craft_root / 'zpaks' / zpak_name
        manifest = load_zpak_manifest(zpak_dir)
        if manifest:
            paths = get_zpak_sql_paths(craft_root, zpak_name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                if source_filter is None or src in source_filter:
                    all_files.append((f, zpak_name, src))
    else:
        # All zpaks by priority
        for name, manifest in get_enabled_zpaks_by_priority(craft_root):
            paths = get_zpak_sql_paths(craft_root, name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                if source_filter is None or src in source_filter:
                    all_files.append((f, name, src))

    return all_files


@click.group()
def sql():
    """SQL operations"""
    pass


# =============================================================================
# Query Command
# =============================================================================

def is_modification(sql: str) -> bool:
    """Detect if SQL contains modification statements."""
    sql_upper = sql.upper()
    # Simple check for common modification keywords at statement start
    for keyword in ['INSERT', 'UPDATE', 'DELETE', 'DROP', 'CREATE', 'ALTER', 'TRUNCATE', 'REPLACE']:
        if keyword in sql_upper:
            return True
    return False


@sql.command('query')
@click.argument('sql_query', required=False, metavar='SQL')
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True),
              help='SQL file to execute')
@click.option('--database', '-d', 'database',
              type=click.Choice(['world', 'characters', 'auth']),
              default='world', help='Target database (default: world)')
@click.pass_context
def sql_query(ctx, sql_query: Optional[str], sql_file: Optional[str], database: str):
    """Query AzerothCore database (read-only).

    Run read-only SQL queries against AzerothCore databases without
    exposing credentials on the command line.

    Examples:
        zep sql query "SELECT entry, name FROM creature_template LIMIT 5"
        zep sql query -f query.sql
        zep sql query "SELECT * FROM characters" -d characters
        echo "SELECT COUNT(*) FROM item_template" | zep sql query
    """
    # Get SQL from argument, file, or stdin
    if sql_file:
        with open(sql_file) as f:
            sql_query = f.read()
    elif not sql_query:
        if not sys.stdin.isatty():
            sql_query = sys.stdin.read()
        else:
            raise click.ClickException(
                "No SQL provided. Use: zep sql query \"SELECT ...\" or -f file.sql"
            )

    if not sql_query.strip():
        raise click.ClickException("Empty SQL provided")

    # Block modification queries
    if is_modification(sql_query):
        raise click.ClickException(
            "Modification detected (INSERT/UPDATE/DELETE/etc).\n"
            "Use 'zep sql execute' for modifications."
        )

    # Map database choice to actual database name
    db_map = {
        'world': 'acore_world',
        'characters': 'acore_characters',
        'auth': 'acore_auth',
    }
    target_db = db_map[database]

    success, output = run_mysql_query(sql_query, target_db)

    if not success:
        raise click.ClickException(f"Query failed: {output}")

    if output.strip():
        click.echo(output)
    else:
        click.echo("Query completed (no results)")


def _get_zpaks_with_sql(craft_root: Path, count_changed: bool = False) -> List[Dict]:
    """Get all zpaks that have SQL files.

    Args:
        craft_root: Path to Zeppelin-Craft root
        count_changed: If True, also count changed files (slower, requires DB check)
    """
    zpaks = []
    zpaks_dir = craft_root / 'zpaks'

    if not zpaks_dir.exists():
        return []

    for zpak_dir in sorted(zpaks_dir.iterdir()):
        if not zpak_dir.is_dir():
            continue
        manifest = load_zpak_manifest(zpak_dir)
        if not manifest:
            continue

        # Check if zpak has SQL
        paths = get_zpak_sql_paths(craft_root, zpak_dir.name, manifest)
        file_count = 0
        changed_count = 0
        sql_files = []

        for path, _ in paths:
            if path.exists():
                for sql_file in path.glob('**/*.sql'):
                    file_count += 1
                    sql_files.append(sql_file)

        # Count changed files if requested
        if count_changed and sql_files:
            for sql_file in sql_files:
                current_hash = calculate_file_hash(sql_file)
                stored_hash = get_stored_hash(sql_file.name)
                if stored_hash != current_hash:
                    changed_count += 1

        if file_count > 0:
            zpaks.append({
                'name': zpak_dir.name,
                'enabled': manifest.get('enabled', True),
                'priority': manifest.get('priority', 100),
                'file_count': file_count,
                'changed_count': changed_count
            })

    # Sort by priority
    zpaks.sort(key=lambda x: x['priority'])
    return zpaks


@sql.command('execute')
@click.argument('target', required=False)
@click.option('--zpak', '-z', 'zpak_name', help='Execute SQL from specific zpak')
@click.option('--changed', '-c', is_flag=True, help='Only execute new/modified files (hash-based)')
@click.option('--all', '-a', 'run_all', is_flag=True, help='Execute all SQL files regardless of state')
@click.option('--rebuildworld', is_flag=True, help='Drop all tables and rebuild from scratch')
@click.option('--dry-run', '-n', is_flag=True, help='Show what would be executed without running')
@click.option('--continue-on-error', '-k', is_flag=True, help='Continue executing even if a file fails')
@click.pass_context
def sql_execute(ctx, target, zpak_name, changed, run_all, rebuildworld, dry_run, continue_on_error):
    """Execute SQL files on acore_world database.

    Interactive mode when no arguments provided.

    Examples:
        zep sql execute                  # Interactive
        zep sql execute path/to/file.sql
        zep sql execute --zpak instance-tuning
        zep sql execute --changed
        zep sql execute --all
        zep sql execute --rebuildworld
    """
    craft_root = ctx.obj['craft_root']

    # Interactive mode if no arguments
    if not target and not zpak_name and not changed and not run_all and not rebuildworld:
        try:
            from simple_term_menu import TerminalMenu
        except ImportError:
            click.echo("Error: Specify a target, --zpak, --changed, --all, or --rebuildworld", err=True)
            click.echo("\nExamples:")
            click.echo("  zep sql execute path/to/file.sql")
            click.echo("  zep sql execute --zpak instance-tuning")
            click.echo("  zep sql execute --changed")
            click.echo("  zep sql execute --all")
            click.echo("  zep sql execute --rebuildworld")
            return

        # Main menu
        main_options = [
            "Changed only     Execute new/modified SQL files",
            "All files        Execute all SQL files",
            "Rebuild world    Drop all tables and rebuild (DANGER!)",
        ]

        menu = TerminalMenu(
            main_options,
            title="\n  SQL Execute - Select mode (ESC to cancel):\n",
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

        if result == 2:  # Rebuild world
            rebuildworld = True
            run_all = True
        else:
            # Show zpak selection submenu
            # For "Changed only" mode, count changed files; for "All" show total
            is_changed_mode = (result == 0)

            if is_changed_mode:
                click.echo("Checking for changed SQL files...", nl=False)

            zpaks = _get_zpaks_with_sql(craft_root, count_changed=is_changed_mode)

            if is_changed_mode:
                click.echo(" done.")

            if not zpaks:
                click.echo("No zpaks with SQL files found")
                return

            # Filter out zpaks with no changed files in "Changed only" mode
            if is_changed_mode:
                zpaks = [z for z in zpaks if z['changed_count'] > 0]
                if not zpaks:
                    click.echo("No zpaks with changed SQL files")
                    return

            zpak_options = ["[All zpaks]"]
            for z in zpaks:
                status = "✓" if z['enabled'] else "○"
                if is_changed_mode:
                    zpak_options.append(f"{status} {z['name']:<25} ({z['changed_count']} changed)")
                else:
                    zpak_options.append(f"{status} {z['name']:<25} ({z['file_count']} files)")

            menu = TerminalMenu(
                zpak_options,
                title="\n  Select zpak (ESC to cancel):\n",
                menu_cursor="> ",
                menu_cursor_style=("fg_cyan", "bold"),
                menu_highlight_style=("fg_cyan", "bold"),
                cycle_cursor=True,
                clear_screen=True,
            )

            zpak_result = menu.show()

            if zpak_result is None:
                click.echo("Cancelled.")
                return

            if zpak_result == 0:
                # All zpaks
                zpak_name = None
            else:
                zpak_name = zpaks[zpak_result - 1]['name']

            if is_changed_mode:
                changed = True
            else:
                run_all = True

    # Ensure tracking table exists
    if not dry_run:
        if not ensure_tracking_table():
            click.echo("Warning: Could not create tracking table", err=True)

    # Handle --rebuildworld
    if rebuildworld:
        if not dry_run:
            click.echo(click.style("\n⚠️  WARNING: This will DROP the acore_world database!", fg='red', bold=True))
            click.echo("All world data will be lost and rebuilt from SQL files.\n")
            if not click.confirm("Are you sure you want to continue?"):
                click.echo("Aborted.")
                return

            click.echo("\nDropping acore_world database...")
            success, message = _drop_world_database()
            if not success:
                raise click.ClickException(message)
            click.echo(message)

            # Recreate empty database for our SQL execution
            click.echo("Recreating empty database...")
            success, result = run_mysql_query_as_root(
                f"CREATE DATABASE `{DB_NAME}` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
            )
            if not success:
                raise click.ClickException(f"Failed to create database: {result}")

            # Ensure tracking table exists
            ensure_tracking_table()

        # Now execute all files
        run_all = True

    # Collect files to execute
    sql_files = []

    if target:
        target_path = Path(target)
        if not target_path.is_absolute():
            target_path = craft_root / target

        if target_path.is_file():
            sql_files = [(target_path, 'manual', 'file')]
        elif target_path.is_dir():
            for f in sorted(target_path.glob('**/*.sql')):
                sql_files.append((f, 'manual', 'dir'))
        else:
            # Maybe it's a zpak name
            zpak_dir = craft_root / 'zpaks' / target
            if zpak_dir.exists():
                sql_files = collect_all_sql_files(craft_root, target)
            else:
                click.echo(f"Error: '{target}' is not a file, directory, or zpak name", err=True)
                sys.exit(1)

    elif zpak_name:
        sql_files = collect_all_sql_files(craft_root, zpak_name)
        if not sql_files:
            click.echo(f"No SQL files found for zpak '{zpak_name}'", err=True)
            sys.exit(1)

    elif changed or run_all:
        sql_files = collect_all_sql_files(craft_root)
        # Exclude azerothcore BASE files - those are handled by 'zep sql reset'
        # Include azerothcore UPDATES (so new AC updates get applied via --changed)
        # Include azerothcore 'zpak' folder (custom overrides)
        sql_files = [
            (f, z, s) for f, z, s in sql_files
            if z != 'azerothcore' or s in ('updates', 'zpak')
        ]

    else:
        click.echo("Error: Specify a target, --zpak, --changed, --all, or --rebuildworld", err=True)
        click.echo("\nExamples:")
        click.echo("  zep sql execute path/to/file.sql")
        click.echo("  zep sql execute --zpak instance-tuning")
        click.echo("  zep sql execute --changed")
        click.echo("  zep sql execute --all")
        click.echo("  zep sql execute --rebuildworld")
        sys.exit(1)

    if not sql_files:
        click.echo("No SQL files to execute")
        return

    # Filter by hash if --changed
    if changed and not run_all:
        filtered = []
        for sql_file, zpak, source in sql_files:
            current_hash = calculate_file_hash(sql_file)
            stored_hash = get_stored_hash(sql_file.name)
            if stored_hash != current_hash:
                filtered.append((sql_file, zpak, source, current_hash))

        if not filtered:
            click.echo("No new or modified SQL files to execute")
            return

        sql_files_with_hash = filtered
    else:
        # Calculate hashes for all files
        sql_files_with_hash = [
            (f, z, s, calculate_file_hash(f)) for f, z, s in sql_files
        ]

    # Execute files
    mode = "REBUILD" if rebuildworld else ("CHANGED" if changed else "ALL")
    click.echo(f"\n{'[DRY RUN] ' if dry_run else ''}[{mode}] Executing {len(sql_files_with_hash)} SQL file(s)...\n")

    success_count = 0
    error_count = 0
    current_zpak = None

    for sql_file, zpak, source, file_hash in sql_files_with_hash:
        # Show zpak header when it changes
        if zpak != current_zpak:
            current_zpak = zpak
            click.echo(f"\n  [{zpak}]")

        # Show relative path for cleaner output
        try:
            rel_path = sql_file.relative_to(craft_root)
        except ValueError:
            try:
                rel_path = sql_file.relative_to(craft_root.parent)
            except ValueError:
                rel_path = sql_file.name

        success, message, exec_ms = execute_sql_file(sql_file, dry_run)

        if success:
            icon = click.style("✓", fg='green')
            time_str = f" ({exec_ms}ms)" if exec_ms > 0 else ""
            click.echo(f"    {icon} {rel_path}{time_str}")
            success_count += 1

            # Update tracking table
            if not dry_run:
                update_tracking(sql_file.name, file_hash, zpak, exec_ms)
        else:
            icon = click.style("✗", fg='red')
            click.echo(f"    {icon} {rel_path}: {message}")
            error_count += 1

            if not continue_on_error and not dry_run:
                click.echo(f"\nStopped due to error. Use -k to continue on errors.")
                break

    # Summary
    click.echo()
    if error_count == 0:
        click.echo(click.style(f"All {success_count} file(s) executed successfully", fg='green'))
    else:
        click.echo(click.style(f"Completed: {success_count} succeeded, {error_count} failed", fg='yellow'))
        sys.exit(1)


def _show_changed_files(craft_root: Path, zpak_name: Optional[str] = None):
    """Show changed SQL files (helper for sql list --changed)."""
    # Ensure tracking table exists
    if not ensure_tracking_table():
        click.echo("Error: updates table not found. Run 'zep sql reset' first.", err=True)
        return

    # Collect all SQL files
    sql_files = collect_all_sql_files(craft_root, zpak_name)

    # Exclude azerothcore BASE unless specifically requested (handled by reset)
    # Include azerothcore UPDATES (so new AC updates show as changed)
    if zpak_name != 'azerothcore':
        sql_files = [
            (f, z, s) for f, z, s in sql_files
            if z != 'azerothcore' or s in ('updates', 'zpak')
        ]

    if not sql_files:
        click.echo("No SQL files found")
        return

    click.echo("\nChecking for changed SQL files...\n")

    new_files = []
    modified_files = []
    unchanged_count = 0

    for sql_file, zpak, source in sql_files:
        current_hash = calculate_file_hash(sql_file)
        stored_hash = get_stored_hash(sql_file.name)

        if stored_hash is None:
            new_files.append((sql_file, zpak, current_hash))
        elif stored_hash != current_hash:
            modified_files.append((sql_file, zpak, current_hash, stored_hash))
        else:
            unchanged_count += 1

    if new_files:
        click.echo(click.style("New files:", fg='green'))
        for sql_file, zpak, _ in new_files:
            click.echo(f"  + [{zpak}] {sql_file.name}")

    if modified_files:
        click.echo(click.style("\nModified files:", fg='yellow'))
        for sql_file, zpak, _, _ in modified_files:
            click.echo(f"  ~ [{zpak}] {sql_file.name}")

    if not new_files and not modified_files:
        click.echo("No changes detected")

    click.echo(f"\nSummary: {len(new_files)} new, {len(modified_files)} modified, {unchanged_count} unchanged")


@sql.command('history')
@click.option('--state', '-s', 'state_filter',
              type=click.Choice(['all', 'custom', 'module', 'released']),
              default='all', help='Filter by state (default: all)')
@click.option('--limit', '-l', default=50, help='Number of records to show')
@click.pass_context
def sql_history(ctx, state_filter, limit):
    """Show SQL execution history from AC's updates table.

    Examples:
        zep sql history
        zep sql history --state custom
        zep sql history --state module
        zep sql history --limit 20
    """
    if not ensure_tracking_table():
        click.echo("Error: updates table not found. Run ac-db-import first.", err=True)
        sys.exit(1)

    where_clause = ""
    if state_filter != 'all':
        where_clause = f"WHERE state = '{state_filter.upper()}'"

    query = f"""
    SELECT name, state, timestamp, speed as ms
    FROM `updates`
    {where_clause}
    ORDER BY timestamp DESC
    LIMIT {limit}
    """

    success, result = run_mysql_query(query)

    if not success:
        click.echo(f"Error querying history: {result}", err=True)
        sys.exit(1)

    if not result or result.count('\n') < 1:
        click.echo("No execution history found")
        return

    click.echo(f"\nSQL Execution History (last {limit}):\n")
    click.echo(result)


def _drop_world_database() -> Tuple[bool, str]:
    """Drop the entire acore_world database.

    Dropping the entire database (not just tables) allows AC's db-import
    tool to properly recreate it with all required base tables (updates,
    updates_include, version, etc).

    Returns:
        Tuple of (success, message)
    """
    # Use root credentials for DROP DATABASE (requires elevated privileges)
    success, result = run_mysql_query_as_root(
        f"DROP DATABASE IF EXISTS `{DB_NAME}`"
    )

    if not success:
        return False, f"Failed to drop database: {result}"

    return True, "Database dropped"


@sql.command('drop')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def sql_drop(ctx, force: bool):
    """Drop the acore_world database entirely.

    This command drops the ENTIRE acore_world database (not just tables).
    This allows AC's db-import tool to properly recreate it with all
    required base tables (updates, updates_include, version, etc).

    Workflow after dropping:
    1. Run ac-db-import to recreate base AC database
    2. Run 'zep sql execute --all' to apply custom zpak SQL

    NOTE: This command only works on the world database. Characters and
    auth databases cannot be dropped to prevent accidental data loss.

    Examples:
        zep sql drop           # Drop world DB (with confirmation)
        zep sql drop -f        # Drop without confirmation
    """
    click.echo(click.style("\n⚠️  WARNING: This will DROP the acore_world database!", fg='red', bold=True))
    click.echo("All world data will be lost. Characters and auth are NOT affected.\n")

    if not force:
        if not click.confirm("Are you sure you want to continue?"):
            click.echo("Cancelled.")
            return

    click.echo("Dropping acore_world database...")
    success, message = _drop_world_database()

    if success:
        click.echo(click.style(f"✓ {message}", fg='green'))
        click.echo("\nTo rebuild, run:")
        click.echo("  1. ac-db-import        # Recreate base AC database")
        click.echo("  2. zep sql execute --all  # Apply custom zpak SQL")
    else:
        raise click.ClickException(message)


@sql.command('reset')
@click.option('--force', '-f', is_flag=True,
              help='Skip confirmation prompt')
@click.pass_context
def sql_reset(ctx, force: bool):
    """Reset acore_world database to stock AzerothCore state.

    This command:
    1. Drops ALL tables in acore_world (zep sql drop)
    2. Executes the azerothcore zpak SQL files (zep sql execute --zpak azerothcore)

    This effectively resets the world database to vanilla AzerothCore,
    removing all custom zpak changes. Use 'zep sql execute --all' after
    to re-apply your zpak customizations.

    NOTE: This command only works on the world database. Characters and
    auth databases cannot be reset to prevent accidental data loss.

    Examples:
        zep sql reset           # Reset world DB to stock AC (with confirmation)
        zep sql reset -f        # Reset without confirmation
    """
    craft_root = ctx.obj['craft_root']

    click.echo(click.style("\n⚠️  WARNING: This will reset acore_world to stock AzerothCore!", fg='red', bold=True))
    click.echo("All custom SQL changes will be lost.")
    click.echo("Characters and auth databases are NOT affected.\n")

    if not force:
        if not click.confirm("Are you sure you want to continue?"):
            click.echo("Cancelled.")
            return

    # Step 1: Drop database
    click.echo("\n[1/3] Dropping acore_world database...")
    success, message = _drop_world_database()
    if not success:
        raise click.ClickException(message)
    click.echo(f"  {message}")

    # Step 1b: Recreate empty database for our SQL execution
    click.echo("  Recreating empty database...")
    success, result = run_mysql_query_as_root(
        f"CREATE DATABASE `{DB_NAME}` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    )
    if not success:
        raise click.ClickException(f"Failed to create database: {result}")
    click.echo("  Database recreated")

    # Step 2: Execute BASE files
    click.echo("\n[2/3] Executing base SQL files...")

    base_files = collect_all_sql_files(craft_root, 'azerothcore', source_filter=['base'])

    if not base_files:
        raise click.ClickException(
            "No base SQL files found in azerothcore zpak!\n"
            "Check that zpaks/azerothcore/zpak.json has correct sql_path settings."
        )

    click.echo(f"  Found {len(base_files)} base SQL files to execute\n")

    base_success = 0
    base_errors = 0
    current_folder = None

    for sql_file, zpak, source in base_files:
        file_hash = calculate_file_hash(sql_file)
        folder = sql_file.parent.name
        if folder != current_folder:
            current_folder = folder
            click.echo(f"  {folder}/")

        success, message, exec_ms = execute_sql_file(sql_file)

        if success:
            base_success += 1
            update_tracking(sql_file.name, file_hash, zpak, exec_ms)
            if exec_ms > 1000:
                click.echo(f"    {sql_file.name} ({exec_ms}ms)")
        else:
            icon = click.style("✗", fg='red')
            click.echo(f"    {icon} {sql_file.name}: {message}")
            base_errors += 1

    if base_errors > 0:
        click.echo(click.style(f"\nReset failed: {base_success} succeeded, {base_errors} failed", fg='red'))
        return

    # Step 3: Execute UPDATE files (skip files already registered in updates table from base)
    # This mirrors AC's db-import logic: base/updates.sql pre-registers squashed updates,
    # so we only execute updates newer than the base cutoff date.
    click.echo("\n[3/3] Executing update SQL files...")

    update_files = collect_all_sql_files(craft_root, 'azerothcore', source_filter=['updates'])
    click.echo(f"  Found {len(update_files)} update SQL files")

    # Filter to only files not already in updates table (or with changed hash)
    updates_to_apply = []
    updates_skipped = 0
    for sql_file, zpak, source in update_files:
        current_hash = calculate_file_hash(sql_file)
        stored_hash = get_stored_hash(sql_file.name)
        if stored_hash is None:
            # New file, not in updates table
            updates_to_apply.append((sql_file, zpak, source, current_hash))
        elif stored_hash != current_hash:
            # File changed since last apply
            updates_to_apply.append((sql_file, zpak, source, current_hash))
        else:
            # Already applied with same hash
            updates_skipped += 1

    click.echo(f"  Skipping {updates_skipped} (already in base), applying {len(updates_to_apply)}\n")

    update_success = 0
    update_errors = 0
    current_folder = None

    for sql_file, zpak, source, file_hash in updates_to_apply:
        folder = sql_file.parent.name
        if folder != current_folder:
            current_folder = folder
            click.echo(f"  {folder}/")

        success, message, exec_ms = execute_sql_file(sql_file)

        if success:
            update_success += 1
            update_tracking(sql_file.name, file_hash, zpak, exec_ms)
        else:
            icon = click.style("✗", fg='red')
            click.echo(f"    {icon} {sql_file.name}: {message}")
            update_errors += 1

    # Summary
    click.echo()
    if update_errors == 0:
        msg = f"✓ Reset complete! {base_success} base + {update_success} updates executed"
        if updates_skipped > 0:
            msg += f", {updates_skipped} skipped (already in base)"
        click.echo(click.style(msg, fg='green'))
        click.echo("\nTo apply your custom zpak changes, run:")
        click.echo("  zep sql execute --all")
    else:
        click.echo(click.style(
            f"Reset completed with errors: {base_success} base, {update_success} updates OK, "
            f"{updates_skipped} skipped, {update_errors} failed",
            fg='yellow'
        ))


@sql.command('list')
@click.option('--zpak', '-z', 'zpak_name', help='List SQL for specific zpak')
@click.option('--changed', '-c', is_flag=True, help='Show only changed files')
@click.option('--all', '-a', 'show_all', is_flag=True, help='Show all files')
@click.pass_context
def sql_list(ctx, zpak_name, changed, show_all):
    """List SQL files.

    Interactive mode when no flags provided.

    Examples:
        zep sql list              # Interactive
        zep sql list --all        # All files
        zep sql list --changed    # Changed only
        zep sql list --zpak name  # Specific zpak
    """
    craft_root = ctx.obj['craft_root']

    # Interactive mode if no flags
    if not changed and not show_all and not zpak_name:
        try:
            from simple_term_menu import TerminalMenu

            options = [
                "All files       List all SQL files in execution order",
                "Changed only    List new/modified files (hash-based)",
            ]

            menu = TerminalMenu(
                options,
                title="\n  SQL List - Select mode (ESC to cancel):\n",
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

            if result == 1:
                changed = True
            else:
                show_all = True

        except ImportError:
            # Default to all
            show_all = True

    # Handle changed mode
    if changed:
        _show_changed_files(craft_root, zpak_name)
        return

    # Show all files
    sql_files = collect_all_sql_files(craft_root, zpak_name)

    if not sql_files:
        click.echo("No SQL files found")
        return

    click.echo(f"\nSQL files ({len(sql_files)} total):\n")

    current_zpak = None
    current_folder = None

    for sql_file, zpak, source in sql_files:
        # New zpak header
        if zpak != current_zpak:
            current_zpak = zpak
            current_folder = None
            manifest = load_zpak_manifest(craft_root / 'zpaks' / zpak)
            priority = manifest.get('priority', 100) if manifest else 100
            click.echo(f"\n[{zpak}] (priority: {priority})")

        # Get folder path relative to project
        folder = sql_file.parent
        try:
            rel_folder = folder.relative_to(craft_root)
        except ValueError:
            try:
                rel_folder = folder.relative_to(craft_root.parent)
            except ValueError:
                rel_folder = folder

        # New folder header
        if str(rel_folder) != current_folder:
            current_folder = str(rel_folder)
            source_tag = f" ({source})" if source in ['base', 'updates'] else ""
            click.echo(f"  {rel_folder}/{source_tag}")

        # Just the filename
        click.echo(f"    {sql_file.name}")


# Keep existing commands for backwards compatibility

@sql.command('format')
@click.argument('target')
@click.option('--output', '-o', type=click.Path(), help='Output file (default: overwrite in place)')
@click.option('--dry-run', '-n', is_flag=True, help='Show formatted output without saving')
@click.option('--verbose', '-v', is_flag=True, help='Enable verbose debug output')
@click.pass_context
def sql_format(ctx, target, output, dry_run, verbose):
    """Format SQL files using SQL Reformatter.

    Strips default values, converts to DELETE+INSERT format, preserves comments.

    TARGET can be a file path or zpak name.

    Examples:
        zep sql format path/to/file.sql
        zep sql format path/to/file.sql --dry-run
        zep sql format --zpak instance-tuning
    """
    craft_root = ctx.obj['craft_root']

    # Add SQL Reformatter to path
    reformatter_dir = craft_root / 'Scripts' / 'SQL Reformatter'
    if not reformatter_dir.exists():
        click.echo(f"Error: SQL Reformatter not found at {reformatter_dir}", err=True)
        sys.exit(1)

    sys.path.insert(0, str(reformatter_dir))

    try:
        # Import the reformatter module (note: space in filename requires special handling)
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "sql_reformatter",
            reformatter_dir / "SQL Reformatter.py"
        )
        reformatter = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(reformatter)
    except Exception as e:
        click.echo(f"Error loading SQL Reformatter: {e}", err=True)
        sys.exit(1)

    # Determine target files
    target_path = Path(target)
    if not target_path.is_absolute():
        target_path = craft_root / target

    sql_files = []
    if target_path.is_file():
        sql_files = [target_path]
    elif target_path.is_dir():
        sql_files = sorted(target_path.glob('**/*.sql'))
    else:
        # Try as zpak name
        zpak_dir = craft_root / 'zpaks' / target / 'sql'
        if zpak_dir.exists():
            sql_files = sorted(zpak_dir.glob('*.sql'))
        else:
            click.echo(f"Error: '{target}' is not a file, directory, or zpak name", err=True)
            sys.exit(1)

    if not sql_files:
        click.echo("No SQL files found to format")
        return

    # Load schema cache
    try:
        reformatter.load_schema()
    except SystemExit:
        click.echo("Error: Schema cache not found. Run 'zep sql refresh-schema' first.", err=True)
        sys.exit(1)

    # Process each file
    click.echo(f"\nFormatting {len(sql_files)} SQL file(s)...\n")

    for sql_file in sql_files:
        try:
            rel_path = sql_file.relative_to(craft_root)
        except ValueError:
            rel_path = sql_file

        try:
            with open(sql_file, 'r') as f:
                input_query = f.read()

            # Capture output
            import io
            from contextlib import redirect_stdout

            output_buffer = io.StringIO()
            with redirect_stdout(output_buffer):
                reformatter.format_query(input_query, verbose=verbose)

            formatted = output_buffer.getvalue()

            if dry_run:
                click.echo(f"--- {rel_path} ---")
                click.echo(formatted)
                click.echo()
            else:
                output_path = Path(output) if output else sql_file
                with open(output_path, 'w') as f:
                    f.write(formatted)
                click.echo(f"  {click.style('✓', fg='green')} {rel_path}")

        except Exception as e:
            click.echo(f"  {click.style('✗', fg='red')} {rel_path}: {e}")
            if verbose:
                import traceback
                traceback.print_exc()


@sql.command('refresh-schema')
@click.pass_context
def sql_refresh_schema(ctx):
    """Refresh table structures cache from database.

    Required before using 'sql format' for the first time.
    """
    craft_root = ctx.obj['craft_root']
    reformatter_dir = craft_root / 'Scripts' / 'SQL Reformatter'

    if not reformatter_dir.exists():
        click.echo(f"Error: SQL Reformatter not found at {reformatter_dir}", err=True)
        sys.exit(1)

    sys.path.insert(0, str(reformatter_dir))

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "sql_reformatter",
            reformatter_dir / "SQL Reformatter.py"
        )
        reformatter = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(reformatter)

        click.echo("Refreshing schema cache from database...")
        reformatter.refresh_schema()
        click.echo(click.style("Schema cache updated successfully", fg='green'))

    except Exception as e:
        click.echo(f"Error: {e}", err=True)
        sys.exit(1)


@sql.command('validate')
@click.argument('target')
@click.pass_context
def sql_validate(ctx, target):
    """Validate SQL syntax.

    TARGET can be a file path or zpak name.
    """
    # TODO: Implement SQL validation
    click.echo("TODO: Implement sql validate")
