"""
SQL operations for Zeppelin-Craft CLI.

Main Commands:
    zep sql reset      Reset to stock AzerothCore
    zep sql rebuild    Full rebuild (reset + apply all zpak SQL)
    zep sql changed    Apply new/modified SQL files
    zep sql query      Run read-only SQL queries
    zep sql modify     Execute SQL modifications

Tool Commands:
    zep sql tool list           List SQL files
    zep sql tool history        Show execution history
    zep sql tool format         Format SQL files
    zep sql tool validate       Validate SQL syntax
    zep sql tool refresh-schema Refresh schema cache for formatter
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

from lib.manifest import is_feature_disabled

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

# Characters database connection (separate credentials)
CHARS_DB_HOST = os.getenv('CHARS_DB_HOST', '192.168.0.55')
CHARS_DB_PORT = os.getenv('CHARS_DB_PORT', '3306')
CHARS_DB_USER = os.getenv('CHARS_DB_USER', 'chars')
CHARS_DB_PASS = os.getenv('CHARS_DB_PASS', '')
CHARS_DB_NAME = os.getenv('CHARS_DB_NAME', 'acore_characters')

# Root credentials for privileged operations (DROP/CREATE DATABASE)
DB_ROOT_USER = os.getenv('DB_ROOT_USER', 'root')
DB_ROOT_PASS = os.getenv('DB_ROOT_PASS', '')


# =============================================================================
# Database Helpers
# =============================================================================

def _create_mysql_config(database: str = 'world') -> str:
    """Create a temporary MySQL config file with credentials.

    Args:
        database: 'world' for acore_world, 'characters' for acore_characters
    """
    fd, path = tempfile.mkstemp(suffix='.cnf')
    with os.fdopen(fd, 'w') as f:
        f.write("[client]\n")
        if database == 'characters':
            f.write(f"user={CHARS_DB_USER}\n")
            f.write(f"password=\"{CHARS_DB_PASS}\"\n")
            f.write(f"host={CHARS_DB_HOST}\n")
            f.write(f"port={CHARS_DB_PORT}\n")
        else:
            f.write(f"user={DB_USER}\n")
            f.write(f"password={DB_PASS}\n")
            f.write(f"host={DB_HOST}\n")
            f.write(f"port={DB_PORT}\n")
    return path


def get_mysql_command(database: str = DB_NAME, cnf_path: str = None) -> List[str]:
    """Get base MySQL command with connection settings."""
    if cnf_path:
        cmd = ["mysql", f"--defaults-extra-file={cnf_path}"]
        if database:
            cmd.append(database)
        return cmd
    else:
        cmd = ["mysql", "-h", DB_HOST, "-P", DB_PORT, "-u", DB_USER, f"-p{DB_PASS}"]
        if database:
            cmd.append(database)
        return cmd


def run_mysql_query(query: str, database: str = DB_NAME) -> Tuple[bool, str]:
    """Run a MySQL query and return result.

    Automatically uses characters DB credentials when targeting acore_characters.
    """
    db_type = 'characters' if database == CHARS_DB_NAME else 'world'
    cnf_path = _create_mysql_config(db_type)
    try:
        cmd = get_mysql_command(database, cnf_path)
        result = subprocess.run(cmd + ["-e", query], capture_output=True, text=True)
        if result.returncode != 0:
            return False, result.stderr.strip()
        return True, result.stdout.strip()
    except Exception as e:
        return False, str(e)
    finally:
        os.unlink(cnf_path)


def run_mysql_query_as_root(query: str, database: str = None) -> Tuple[bool, str]:
    """Run a MySQL query as root user for privileged operations."""
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


# =============================================================================
# Tracking Helpers (using AC's updates table)
# =============================================================================

def ensure_tracking_table() -> bool:
    """Check that AC's updates table exists."""
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
        if len(lines) > 1:
            return lines[1].strip().upper()
    return None


def update_tracking(filename: str, file_hash: str, zpak: str, execution_ms: int):
    """Record applied SQL in AC's updates table."""
    state = 'CUSTOM'
    query = f"""
    REPLACE INTO `updates` (name, hash, state, timestamp, speed)
    VALUES ('{filename}', '{file_hash}', '{state}', NOW(), {execution_ms})
    """
    run_mysql_query(query)


def execute_sql_file(sql_file: Path, dry_run: bool = False,
                     database: str = 'world') -> Tuple[bool, str, int]:
    """Execute a SQL file against the database.

    Args:
        database: 'world' for acore_world, 'characters' for acore_characters
    """
    if not sql_file.exists():
        return False, f"File not found: {sql_file}", 0

    if dry_run:
        return True, "Would execute", 0

    db_name = CHARS_DB_NAME if database == 'characters' else DB_NAME
    cnf_path = _create_mysql_config(database)
    try:
        start_time = time.time()
        cmd = get_mysql_command(db_name, cnf_path)
        with open(sql_file, 'r') as f:
            result = subprocess.run(cmd, stdin=f, capture_output=True, text=True)
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


# =============================================================================
# Zpak/SQL File Collection
# =============================================================================

def load_zpak_manifest(zpak_dir: Path) -> Optional[Dict]:
    """Load zpak.json manifest."""
    manifest_path = zpak_dir / 'zpak.json'
    if manifest_path.exists():
        with open(manifest_path) as f:
            return json.load(f)
    return None


def _resolve_content_globs(zpak_dir: Path, globs, folder_type: str) -> List[Tuple[Path, str]]:
    """Resolve contents.sql or contents.sql_characters glob patterns to paths."""
    paths = []
    if isinstance(globs, str):
        globs = [globs]
    for glob_pattern in globs:
        if glob_pattern.startswith('../'):
            resolved = (zpak_dir / glob_pattern).resolve()
            if resolved.is_dir():
                paths.append((resolved, folder_type))
            elif '*' in glob_pattern:
                parent = (zpak_dir / Path(glob_pattern).parent).resolve()
                if parent.exists():
                    paths.append((parent, folder_type))
        else:
            resolved = zpak_dir / glob_pattern.replace('/*.sql', '').replace('/**/*.sql', '')
            if resolved.exists() and resolved.is_dir():
                paths.append((resolved, folder_type))
    return paths


def get_zpak_sql_paths(craft_root: Path, zpak_name: str, manifest: Dict) -> List[Tuple[Path, str]]:
    """Get SQL paths for a zpak based on type and manifest.

    For acore-extension type zpaks, checks in order:
    1. Module's data/sql/db-world/ and db-characters/ (base/ and updates/ subfolders)
    2. SQL path specified in contents.sql / contents.sql_characters from zpak.json
    3. zpak/sql/ and zpak/sql_characters/ folders

    Folder types prefixed with 'chars_' target acore_characters instead of acore_world.
    """
    sql_paths = []
    zpak_dir = craft_root / 'zpaks' / zpak_name
    zpak_type = manifest.get('type', 'native')

    # 1. For acore-extension, check module's standard SQL locations
    if zpak_type == 'acore-extension' and 'acore' in manifest:
        module_name = manifest['acore'].get('module', '')
        if module_name and module_name != 'azerothcore':
            module_sql_base = craft_root / '..' / 'Zeppelin-Core' / 'modules' / module_name / 'data' / 'sql'

            # 1a. db-world (existing)
            module_sql = module_sql_base / 'db-world'
            if module_sql.exists():
                base_path = module_sql / 'base'
                updates_path = module_sql / 'updates'
                if base_path.exists():
                    sql_paths.append((base_path, 'base'))
                if updates_path.exists():
                    sql_paths.append((updates_path, 'updates'))
                if not base_path.exists() and not updates_path.exists():
                    sql_paths.append((module_sql, 'root'))

            # 1b. db-characters
            module_chars_sql = module_sql_base / 'db-characters'
            if module_chars_sql.exists():
                base_path = module_chars_sql / 'base'
                updates_path = module_chars_sql / 'updates'
                if base_path.exists():
                    sql_paths.append((base_path, 'chars_base'))
                if updates_path.exists():
                    sql_paths.append((updates_path, 'chars_updates'))
                if not base_path.exists() and not updates_path.exists():
                    sql_paths.append((module_chars_sql, 'chars_root'))

    # 1c. Check explicit sql_path / sql_updates_path from manifest (used by azerothcore zpak)
    if 'sql_path' in manifest:
        base_dir = (craft_root / manifest['sql_path']).resolve()
        if base_dir.exists():
            sql_paths.append((base_dir, 'base'))
    if 'sql_updates_path' in manifest:
        updates_dir = (craft_root / manifest['sql_updates_path']).resolve()
        if updates_dir.exists():
            sql_paths.append((updates_dir, 'updates'))

    # 2. Check contents.sql and contents.sql_characters paths from zpak.json
    contents = manifest.get('contents', {})
    if 'sql' in contents:
        sql_paths.extend(_resolve_content_globs(zpak_dir, contents['sql'], 'contents'))
    if 'sql_characters' in contents:
        sql_paths.extend(_resolve_content_globs(zpak_dir, contents['sql_characters'], 'chars_contents'))

    # 3. Check zpak's own sql/ and sql_characters/ folders
    zpak_sql = zpak_dir / 'sql'
    if zpak_sql.exists():
        sql_paths.append((zpak_sql, 'zpak'))

    zpak_chars_sql = zpak_dir / 'sql_characters'
    if zpak_chars_sql.exists():
        sql_paths.append((zpak_chars_sql, 'chars_zpak'))

    return sql_paths


FOLDER_TYPE_ORDER = [
    'base', 'updates', 'root', 'contents', 'zpak',
    'chars_base', 'chars_updates', 'chars_root', 'chars_contents', 'chars_zpak',
]

CHARS_FOLDER_TYPES = {'chars_base', 'chars_updates', 'chars_root', 'chars_contents', 'chars_zpak'}


def folder_type_to_database(folder_type: str) -> str:
    """Map folder type to target database."""
    return 'characters' if folder_type in CHARS_FOLDER_TYPES else 'world'


def collect_sql_files_from_paths(paths: List[Tuple[Path, str]]) -> List[Tuple[Path, str]]:
    """Collect SQL files from paths, respecting folder type order.

    World DB types process first, then characters DB types.
    """
    files = []
    seen = set()

    for folder_type in FOLDER_TYPE_ORDER:
        for path, ptype in paths:
            if ptype != folder_type or not path.exists():
                continue
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

    zpaks.sort(key=lambda x: x[2])
    return [(name, manifest) for name, manifest, _ in zpaks]


def collect_all_sql_files(craft_root: Path, zpak_name: Optional[str] = None,
                          source_filter: Optional[List[str]] = None) -> List[Tuple[Path, str, str, str]]:
    """Collect all SQL files across zpaks in priority order.

    Returns list of (file_path, zpak_name, source_type, database) tuples.
    database is 'world' or 'characters'.
    """
    all_files = []

    if zpak_name:
        zpak_dir = craft_root / 'zpaks' / zpak_name
        manifest = load_zpak_manifest(zpak_dir)
        if manifest:
            disabled = set(manifest.get('disabled_features', []))
            paths = get_zpak_sql_paths(craft_root, zpak_name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                if source_filter is None or src in source_filter:
                    if not is_feature_disabled(f.name, disabled):
                        all_files.append((f, zpak_name, src, folder_type_to_database(src)))
    else:
        for name, manifest in get_enabled_zpaks_by_priority(craft_root):
            disabled = set(manifest.get('disabled_features', []))
            paths = get_zpak_sql_paths(craft_root, name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                if source_filter is None or src in source_filter:
                    if not is_feature_disabled(f.name, disabled):
                        all_files.append((f, name, src, folder_type_to_database(src)))

    return all_files


def _drop_world_database() -> Tuple[bool, str]:
    """Drop the entire acore_world database."""
    success, result = run_mysql_query_as_root(f"DROP DATABASE IF EXISTS `{DB_NAME}`")
    if not success:
        return False, f"Failed to drop database: {result}"
    return True, "Database dropped"


def _create_world_database() -> Tuple[bool, str]:
    """Create empty acore_world database."""
    success, result = run_mysql_query_as_root(
        f"CREATE DATABASE `{DB_NAME}` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
    )
    if not success:
        return False, f"Failed to create database: {result}"
    return True, "Database created"


# =============================================================================
# Core Execution Logic
# =============================================================================

def _execute_changed_files(craft_root: Path, dry_run: bool = False,
                           continue_on_error: bool = False) -> Tuple[int, int]:
    """Execute new/modified SQL files. Returns (success_count, error_count)."""
    # Collect files (exclude AC base, include AC updates + all zpak SQL)
    sql_files = collect_all_sql_files(craft_root)
    sql_files = [
        (f, z, s, db) for f, z, s, db in sql_files
        if z != 'azerothcore' or s in ('updates', 'zpak')
    ]

    if not sql_files:
        click.echo("No SQL files found")
        return 0, 0

    # Filter by hash - only include new/modified files
    files_to_execute = []
    skipped = 0

    for sql_file, zpak, source, database in sql_files:
        current_hash = calculate_file_hash(sql_file)
        stored_hash = get_stored_hash(sql_file.name)
        if stored_hash != current_hash:
            files_to_execute.append((sql_file, zpak, source, current_hash, database))
        else:
            skipped += 1

    if not files_to_execute:
        click.echo(f"No new or modified SQL files to execute ({skipped} unchanged)")
        return 0, 0

    click.echo(f"\n{'[DRY RUN] ' if dry_run else ''}Executing {len(files_to_execute)} file(s) ({skipped} unchanged)...")

    success_count = 0
    error_count = 0
    current_folder = None

    for sql_file, zpak, source, file_hash, database in files_to_execute:
        # Get folder path relative to craft_root or its parent
        try:
            rel_folder = sql_file.parent.relative_to(craft_root)
        except ValueError:
            try:
                rel_folder = sql_file.parent.relative_to(craft_root.parent)
            except ValueError:
                rel_folder = sql_file.parent

        # Print folder header when it changes
        if str(rel_folder) != current_folder:
            current_folder = str(rel_folder)
            db_tag = f" {click.style('[characters]', fg='cyan')}" if database == 'characters' else ""
            click.echo(f"\n  {rel_folder}/{db_tag}")

        success, message, exec_ms = execute_sql_file(sql_file, dry_run, database)

        if success:
            icon = click.style("✓", fg='green')
            time_str = f" ({exec_ms}ms)" if exec_ms > 0 else ""
            click.echo(f"    {icon} {sql_file.name}{time_str}")
            success_count += 1
            if not dry_run:
                update_tracking(sql_file.name, file_hash, zpak, exec_ms)
        else:
            icon = click.style("✗", fg='red')
            click.echo(f"    {icon} {sql_file.name}: {message}")
            error_count += 1
            if not continue_on_error and not dry_run:
                click.echo(f"\nStopped due to error. Use -k to continue on errors.")
                break

    return success_count, error_count


def _execute_reset(craft_root: Path) -> bool:
    """Reset to stock AzerothCore. Returns True on success."""
    # Step 1: Drop database
    click.echo("\n[1/3] Dropping acore_world database...")
    success, message = _drop_world_database()
    if not success:
        raise click.ClickException(message)
    click.echo(f"  {message}")

    # Step 2: Create empty database
    click.echo("  Recreating empty database...")
    success, message = _create_world_database()
    if not success:
        raise click.ClickException(message)
    click.echo(f"  {message}")

    # Step 3: Execute BASE files
    click.echo("\n[2/3] Executing base SQL files...")
    base_files = collect_all_sql_files(craft_root, 'azerothcore', source_filter=['base'])

    if not base_files:
        raise click.ClickException(
            "No base SQL files found in azerothcore zpak!\n"
            "Check that zpaks/azerothcore/zpak.json has correct sql_path settings."
        )

    click.echo(f"  Found {len(base_files)} base SQL files\n")

    base_success = 0
    base_errors = 0
    current_folder = None

    for sql_file, zpak, source, _db in base_files:
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
        return False

    # Step 4: Execute UPDATE files (skip those already in updates table from base)
    click.echo("\n[3/3] Executing update SQL files...")
    update_files = collect_all_sql_files(craft_root, 'azerothcore', source_filter=['updates'])
    click.echo(f"  Found {len(update_files)} update SQL files")

    updates_to_apply = []
    updates_skipped = 0

    for sql_file, zpak, source, _db in update_files:
        current_hash = calculate_file_hash(sql_file)
        stored_hash = get_stored_hash(sql_file.name)
        if stored_hash is None or stored_hash != current_hash:
            updates_to_apply.append((sql_file, zpak, source, current_hash))
        else:
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
        msg = f"✓ Reset complete! {base_success} base + {update_success} updates"
        if updates_skipped > 0:
            msg += f", {updates_skipped} skipped"
        click.echo(click.style(msg, fg='green'))
        return True
    else:
        click.echo(click.style(
            f"Reset completed with errors: {base_success} base, {update_success} updates OK, "
            f"{updates_skipped} skipped, {update_errors} failed",
            fg='yellow'
        ))
        return False


# =============================================================================
# CLI Commands
# =============================================================================

@click.group()
def sql():
    """SQL operations"""
    pass


# -----------------------------------------------------------------------------
# Main Commands
# -----------------------------------------------------------------------------

@sql.command('query')
@click.argument('sql_query', required=False, metavar='SQL')
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True), help='SQL file to execute')
@click.option('--database', '-d', 'database',
              type=click.Choice(['world', 'characters', 'auth']),
              default='world', help='Target database (default: world)')
@click.pass_context
def sql_query(ctx, sql_query: Optional[str], sql_file: Optional[str], database: str):
    """Query AzerothCore database (read-only).

    Examples:
        zep sql query "SELECT entry, name FROM creature_template LIMIT 5"
        zep sql query -f query.sql
        zep sql query "SELECT * FROM characters" -d characters
    """
    if sql_file:
        with open(sql_file) as f:
            sql_query = f.read()
    elif not sql_query:
        if not sys.stdin.isatty():
            sql_query = sys.stdin.read()
        else:
            raise click.ClickException("No SQL provided. Use: zep sql query \"SELECT ...\" or -f file.sql")

    if not sql_query.strip():
        raise click.ClickException("Empty SQL provided")

    # Block modifications - use 'zep sql modify' instead
    sql_upper = sql_query.upper()
    for keyword in ['INSERT', 'UPDATE', 'DELETE', 'DROP', 'CREATE', 'ALTER', 'TRUNCATE', 'REPLACE']:
        if keyword in sql_upper:
            raise click.ClickException(f"Modification detected ({keyword}). Use 'zep sql modify' for write operations.")

    db_map = {'world': 'acore_world', 'characters': 'acore_characters', 'auth': 'acore_auth'}
    success, output = run_mysql_query(sql_query, db_map[database])

    if not success:
        raise click.ClickException(f"Query failed: {output}")

    click.echo(output if output.strip() else "Query completed (no results)")


@sql.command('modify')
@click.argument('sql_query', required=False, metavar='SQL')
@click.option('--file', '-f', 'sql_file', type=click.Path(exists=True), help='SQL file to execute')
@click.option('--database', '-d', 'database',
              type=click.Choice(['world', 'characters', 'auth']),
              default='world', help='Target database (default: world)')
@click.pass_context
def sql_modify(ctx, sql_query: Optional[str], sql_file: Optional[str], database: str):
    """Execute SQL modifications (INSERT, UPDATE, DELETE, etc).

    Examples:
        zep sql modify "UPDATE creature_template SET name='Test' WHERE entry=1234"
        zep sql modify -f changes.sql
        zep sql modify "DELETE FROM character_spell WHERE guid=123" -d characters
    """
    if sql_file:
        with open(sql_file) as f:
            sql_query = f.read()
    elif not sql_query:
        if not sys.stdin.isatty():
            sql_query = sys.stdin.read()
        else:
            raise click.ClickException("No SQL provided. Use: zep sql modify \"UPDATE ...\" or -f file.sql")

    if not sql_query.strip():
        raise click.ClickException("Empty SQL provided")

    db_map = {'world': 'acore_world', 'characters': 'acore_characters', 'auth': 'acore_auth'}
    success, output = run_mysql_query(sql_query, db_map[database])

    if not success:
        raise click.ClickException(f"Query failed: {output}")

    click.echo(output if output.strip() else "Query completed successfully")


@sql.command('reset')
@click.option('--force', '-f', is_flag=True, help='Skip confirmation prompt')
@click.pass_context
def sql_reset(ctx, force: bool):
    """Reset acore_world to stock AzerothCore.

    Drops the database and reloads AC base + updates.
    Use 'zep sql rebuild' to also apply zpak customizations.

    Examples:
        zep sql reset      # Reset with confirmation
        zep sql reset -f   # Reset without confirmation
    """
    craft_root = ctx.obj['craft_root']

    click.echo(click.style("\n⚠️  WARNING: This will reset acore_world to stock AzerothCore!", fg='red', bold=True))
    click.echo("All custom SQL changes will be lost.")
    click.echo("Characters and auth databases are NOT affected.\n")

    if not force and not click.confirm("Are you sure you want to continue?"):
        click.echo("Cancelled.")
        return

    _execute_reset(craft_root)


@sql.command('rebuild')
@click.option('--force', '-f', is_flag=True, help='Skip confirmation prompt')
@click.pass_context
def sql_rebuild(ctx, force: bool):
    """Full rebuild: reset to stock AC + apply all zpak SQL.

    This is equivalent to: zep sql reset && zep sql changed

    Examples:
        zep sql rebuild      # Rebuild with confirmation
        zep sql rebuild -f   # Rebuild without confirmation
    """
    craft_root = ctx.obj['craft_root']

    click.echo(click.style("\n⚠️  WARNING: This will rebuild the entire acore_world database!", fg='red', bold=True))
    click.echo("All data will be reset and zpak customizations re-applied.")
    click.echo("Characters and auth databases are NOT affected.\n")

    if not force and not click.confirm("Are you sure you want to continue?"):
        click.echo("Cancelled.")
        return

    # Step 1: Reset to stock AC
    if not _execute_reset(craft_root):
        return

    # Step 2: Apply zpak changes
    click.echo("\n" + "="*60)
    click.echo("Applying zpak customizations...")
    click.echo("="*60)

    success_count, error_count = _execute_changed_files(craft_root)

    click.echo()
    if error_count == 0:
        click.echo(click.style(f"✓ Rebuild complete! {success_count} zpak file(s) applied", fg='green'))
    else:
        click.echo(click.style(f"Rebuild completed with errors: {success_count} succeeded, {error_count} failed", fg='yellow'))
        sys.exit(1)


@sql.command('changed')
@click.option('--dry-run', '-n', is_flag=True, help='Show what would be executed without running')
@click.option('--continue-on-error', '-k', is_flag=True, help='Continue executing even if a file fails')
@click.pass_context
def sql_changed(ctx, dry_run: bool, continue_on_error: bool):
    """Apply new/modified SQL files.

    Checks each file against AC's updates table and only executes
    files that are new or have a different hash.

    Examples:
        zep sql changed      # Apply changed files
        zep sql changed -n   # Dry run (show what would execute)
        zep sql changed -k   # Continue on errors
    """
    craft_root = ctx.obj['craft_root']

    if not dry_run and not ensure_tracking_table():
        click.echo("Error: updates table not found. Run 'zep sql reset' first.", err=True)
        sys.exit(1)

    success_count, error_count = _execute_changed_files(craft_root, dry_run, continue_on_error)

    if not dry_run:
        click.echo()
        if error_count == 0:
            if success_count > 0:
                click.echo(click.style(f"✓ All {success_count} file(s) executed successfully", fg='green'))
        else:
            click.echo(click.style(f"Completed: {success_count} succeeded, {error_count} failed", fg='yellow'))
            sys.exit(1)


# -----------------------------------------------------------------------------
# Tool Subgroup
# -----------------------------------------------------------------------------

@sql.group('tool')
def sql_tool():
    """SQL utility commands"""
    pass


@sql_tool.command('list')
@click.option('--zpak', '-z', 'zpak_name', help='List SQL for specific zpak')
@click.option('--changed', '-c', is_flag=True, help='Show only changed files')
@click.pass_context
def tool_list(ctx, zpak_name, changed):
    """List SQL files.

    Examples:
        zep sql tool list              # All files
        zep sql tool list --changed    # Changed only
        zep sql tool list --zpak name  # Specific zpak
    """
    craft_root = ctx.obj['craft_root']

    if changed:
        if not ensure_tracking_table():
            click.echo("Error: updates table not found. Run 'zep sql reset' first.", err=True)
            return

        sql_files = collect_all_sql_files(craft_root, zpak_name)
        if zpak_name != 'azerothcore':
            sql_files = [(f, z, s, db) for f, z, s, db in sql_files if z != 'azerothcore' or s in ('updates', 'zpak')]

        if not sql_files:
            click.echo("No SQL files found")
            return

        click.echo("\nChecking for changed SQL files...\n")

        new_files = []
        modified_files = []
        unchanged_count = 0

        for sql_file, zpak, source, database in sql_files:
            current_hash = calculate_file_hash(sql_file)
            stored_hash = get_stored_hash(sql_file.name)

            db_tag = f" {click.style('[characters]', fg='cyan')}" if database == 'characters' else ""
            if stored_hash is None:
                new_files.append((sql_file, zpak, db_tag))
            elif stored_hash != current_hash:
                modified_files.append((sql_file, zpak, db_tag))
            else:
                unchanged_count += 1

        if new_files:
            click.echo(click.style("New files:", fg='green'))
            for sql_file, zpak, db_tag in new_files:
                click.echo(f"  + [{zpak}] {sql_file.name}{db_tag}")

        if modified_files:
            click.echo(click.style("\nModified files:", fg='yellow'))
            for sql_file, zpak, db_tag in modified_files:
                click.echo(f"  ~ [{zpak}] {sql_file.name}{db_tag}")

        if not new_files and not modified_files:
            click.echo("No changes detected")

        click.echo(f"\nSummary: {len(new_files)} new, {len(modified_files)} modified, {unchanged_count} unchanged")
        return

    # Show all files (including disabled, with markers)
    # Collect without feature filtering so we can show disabled markers
    all_files_raw = []
    disabled_map = {}  # zpak_name -> set of disabled feature IDs

    if zpak_name:
        zpak_dir = craft_root / 'zpaks' / zpak_name
        manifest = load_zpak_manifest(zpak_dir)
        if manifest:
            disabled_map[zpak_name] = set(manifest.get('disabled_features', []))
            paths = get_zpak_sql_paths(craft_root, zpak_name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                all_files_raw.append((f, zpak_name, src, folder_type_to_database(src)))
    else:
        for name, manifest in get_enabled_zpaks_by_priority(craft_root):
            disabled_map[name] = set(manifest.get('disabled_features', []))
            paths = get_zpak_sql_paths(craft_root, name, manifest)
            files = collect_sql_files_from_paths(paths)
            for f, src in files:
                all_files_raw.append((f, name, src, folder_type_to_database(src)))

    if not all_files_raw:
        click.echo("No SQL files found")
        return

    disabled_count = sum(
        1 for f, z, s, db in all_files_raw
        if is_feature_disabled(f.name, disabled_map.get(z, set()))
    )
    active_count = len(all_files_raw) - disabled_count
    click.echo(f"\nSQL files ({active_count} active, {disabled_count} disabled, {len(all_files_raw)} total):\n")

    current_zpak = None
    current_folder = None

    for sql_file, zpak, source, database in all_files_raw:
        if zpak != current_zpak:
            current_zpak = zpak
            current_folder = None
            manifest = load_zpak_manifest(craft_root / 'zpaks' / zpak)
            priority = manifest.get('priority', 100) if manifest else 100
            click.echo(f"\n[{zpak}] (priority: {priority})")

        folder = sql_file.parent
        try:
            rel_folder = folder.relative_to(craft_root)
        except ValueError:
            try:
                rel_folder = folder.relative_to(craft_root.parent)
            except ValueError:
                rel_folder = folder

        if str(rel_folder) != current_folder:
            current_folder = str(rel_folder)
            source_tag = f" ({source})" if source in ['base', 'updates', 'chars_base', 'chars_updates'] else ""
            db_tag = f" {click.style('[characters]', fg='cyan')}" if database == 'characters' else ""
            click.echo(f"  {rel_folder}/{source_tag}{db_tag}")

        if is_feature_disabled(sql_file.name, disabled_map.get(zpak, set())):
            click.echo(f"    {sql_file.name}  {click.style('[DISABLED]', fg='yellow')}")
        else:
            click.echo(f"    {sql_file.name}")


@sql_tool.command('history')
@click.option('--state', '-s', 'state_filter',
              type=click.Choice(['all', 'custom', 'module', 'released']),
              default='all', help='Filter by state')
@click.option('--limit', '-l', default=50, help='Number of records to show')
@click.pass_context
def tool_history(ctx, state_filter, limit):
    """Show SQL execution history.

    Examples:
        zep sql tool history
        zep sql tool history --state custom
        zep sql tool history --limit 20
    """
    if not ensure_tracking_table():
        click.echo("Error: updates table not found. Run 'zep sql reset' first.", err=True)
        sys.exit(1)

    where_clause = "" if state_filter == 'all' else f"WHERE state = '{state_filter.upper()}'"

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


@sql_tool.command('format')
@click.argument('target')
@click.option('--output', '-o', type=click.Path(), help='Output file')
@click.option('--dry-run', '-n', is_flag=True, help='Show formatted output without saving')
@click.option('--verbose', '-v', is_flag=True, help='Enable verbose output')
@click.pass_context
def tool_format(ctx, target, output, dry_run, verbose):
    """Format SQL files using SQL Reformatter.

    Examples:
        zep sql tool format path/to/file.sql
        zep sql tool format path/to/file.sql --dry-run
    """
    craft_root = ctx.obj['craft_root']
    reformatter_dir = craft_root / 'Scripts' / 'SQL Reformatter'

    if not reformatter_dir.exists():
        click.echo(f"Error: SQL Reformatter not found at {reformatter_dir}", err=True)
        sys.exit(1)

    sys.path.insert(0, str(reformatter_dir))

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location("sql_reformatter", reformatter_dir / "SQL Reformatter.py")
        reformatter = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(reformatter)
    except Exception as e:
        click.echo(f"Error loading SQL Reformatter: {e}", err=True)
        sys.exit(1)

    target_path = Path(target)
    if not target_path.is_absolute():
        target_path = craft_root / target

    sql_files = []
    if target_path.is_file():
        sql_files = [target_path]
    elif target_path.is_dir():
        sql_files = sorted(target_path.glob('**/*.sql'))
    else:
        zpak_dir = craft_root / 'zpaks' / target / 'sql'
        if zpak_dir.exists():
            sql_files = sorted(zpak_dir.glob('*.sql'))
        else:
            click.echo(f"Error: '{target}' is not a file, directory, or zpak name", err=True)
            sys.exit(1)

    if not sql_files:
        click.echo("No SQL files found to format")
        return

    try:
        reformatter.load_schema()
    except SystemExit:
        click.echo("Error: Schema cache not found. Run 'zep sql tool refresh-schema' first.", err=True)
        sys.exit(1)

    click.echo(f"\nFormatting {len(sql_files)} SQL file(s)...\n")

    for sql_file in sql_files:
        try:
            rel_path = sql_file.relative_to(craft_root)
        except ValueError:
            rel_path = sql_file

        try:
            with open(sql_file, 'r') as f:
                input_query = f.read()

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


@sql_tool.command('refresh-schema')
@click.pass_context
def tool_refresh_schema(ctx):
    """Refresh table structures cache for SQL formatter."""
    craft_root = ctx.obj['craft_root']
    reformatter_dir = craft_root / 'Scripts' / 'SQL Reformatter'

    if not reformatter_dir.exists():
        click.echo(f"Error: SQL Reformatter not found at {reformatter_dir}", err=True)
        sys.exit(1)

    sys.path.insert(0, str(reformatter_dir))

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location("sql_reformatter", reformatter_dir / "SQL Reformatter.py")
        reformatter = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(reformatter)

        click.echo("Refreshing schema cache from database...")
        reformatter.refresh_schema()
        click.echo(click.style("Schema cache updated successfully", fg='green'))

    except Exception as e:
        click.echo(f"Error: {e}", err=True)
        sys.exit(1)


@sql_tool.command('validate')
@click.argument('target')
@click.pass_context
def tool_validate(ctx, target):
    """Validate SQL syntax.

    TARGET can be a file path or zpak name.
    """
    click.echo("TODO: Implement SQL validation")
