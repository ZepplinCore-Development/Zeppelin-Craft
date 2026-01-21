#!/usr/bin/env python3
"""
DBC Database Tool - Unified interface for DBC database operations.

Automatically detects modifications (INSERT/UPDATE/DELETE) and handles
Patch Builder + git commit workflow. Query-only operations run directly.

Usage:
    # Query (no commit needed)
    python3 dbc.py "SELECT ID, SpellName0 FROM spell WHERE ID=25392"
    python3 dbc.py -f query.sql

    # Modification (auto-detects, requires --task, runs Patch Builder + commits)
    python3 dbc.py --task F-004 "UPDATE spell SET SpellName0='Test' WHERE ID=900001"
    python3 dbc.py --task I-015 -f changes.sql

    # Clone spell (convenience wrapper)
    python3 dbc.py clone 25392 900000 --task F-004 [--name "Custom Name"]

Examples:
    # Research query
    python3 dbc.py "SELECT * FROM spell WHERE SpellName0 LIKE '%Prayer%'"

    # Modify spell for feature
    python3 dbc.py --task F-004 "UPDATE spell SET Description0='New desc' WHERE ID=900001"

    # Clone spell for issue fix
    python3 dbc.py clone 25392 900000 --task I-042 --name "Fixed Prayer"
"""

import argparse
import os
import re
import subprocess
import sys


# Script directories
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
CRAFT_DIR = os.path.dirname(os.path.dirname(SCRIPT_DIR))  # Zeppelin-Craft
PATCH_BUILDER_DIR = os.path.join(CRAFT_DIR, 'Scripts', 'Patch Builder')
UPDATES_DIR = os.path.join(PATCH_BUILDER_DIR, 'Updates')
UPDATE_SPELL_FILE = os.path.join(UPDATES_DIR, 'update_spell.sql')


def load_env():
    """Load .env file from script directory."""
    env_path = os.path.join(SCRIPT_DIR, '.env')

    if not os.path.exists(env_path):
        print(f"ERROR: .env file not found at {env_path}")
        print("Please copy .env.example to .env and configure credentials.")
        sys.exit(1)

    env_vars = {}
    with open(env_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                env_vars[key.strip()] = value.strip()
    return env_vars


def get_mysql_cmd(env):
    """Build mysql command from .env credentials."""
    host = env.get('DB_HOST')
    port = env.get('DB_PORT', '3306')
    user = env.get('DBC_USER')
    password = env.get('DBC_PASS')
    database = env.get('DBC_NAME')

    if not all([host, user, password, database]):
        print("ERROR: Missing database credentials in .env")
        print("Required: DB_HOST, DBC_USER, DBC_PASS, DBC_NAME")
        sys.exit(1)

    return [
        'mysql',
        '-h', host,
        '-P', port,
        '-u', user,
        f"-p{password}",
        database
    ]


def is_modification(sql):
    """
    Detect if SQL contains modification statements.
    Returns True if INSERT, UPDATE, or DELETE found.
    """
    # Remove comments and string literals for accurate detection
    # Simple approach: look for keywords at statement boundaries
    sql_upper = sql.upper()

    # Pattern matches these keywords at word boundaries (not inside strings ideally)
    # This is a simple heuristic - could be fooled by comments but good enough
    modification_pattern = r'\b(INSERT|UPDATE|DELETE)\b'

    return bool(re.search(modification_pattern, sql_upper))


def run_sql(sql, env=None):
    """
    Execute SQL against the DBC database.
    Returns (success, output).
    """
    if env is None:
        env = load_env()

    mysql_cmd = get_mysql_cmd(env)

    result = subprocess.run(
        mysql_cmd,
        input=sql,
        capture_output=True,
        text=True
    )

    if result.returncode != 0:
        return False, result.stderr

    return True, result.stdout


def run_patch_builder_diff():
    """Run Patch Builder in db-diff-only mode."""
    patch_builder = os.path.join(PATCH_BUILDER_DIR, 'Patch Builder.py')

    print("\nRunning Patch Builder (db-diff-only mode)...")
    result = subprocess.run(
        [sys.executable, patch_builder, '--db-diff-only'],
        cwd=PATCH_BUILDER_DIR,
        capture_output=True,
        text=True
    )

    if result.returncode != 0:
        print(f"ERROR: Patch Builder failed")
        print(result.stderr)
        return False

    # Show relevant output
    for line in result.stdout.split('\n'):
        if any(kw in line.lower() for kw in ['spell', 'generated', 'updated', 'item']):
            print(f"  {line}")

    return True


def git_commit_changes(task_id, description=None):
    """
    Create a git commit with the current DBC diff changes.
    Returns True if commit was created, False otherwise.
    """
    os.chdir(CRAFT_DIR)

    # Check for any changes in Updates directory
    result = subprocess.run(
        ['git', 'status', '--porcelain', UPDATES_DIR],
        capture_output=True, text=True
    )

    if not result.stdout.strip():
        print("No DBC changes to commit")
        return False

    # Stage all changes in Updates directory
    subprocess.run(['git', 'add', UPDATES_DIR], check=True)

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

    if result.returncode != 0:
        print(f"ERROR: Git commit failed")
        print(result.stderr)
        return False

    print(f"\nCommit created: WIP: {task_id}")
    return True


def clone_spell(source_id, new_id, new_name=None):
    """
    Clone a spell from source_id to new_id.
    Returns True if successful, False otherwise.
    """
    env = load_env()

    # Check if source exists
    success, output = run_sql(f"SELECT ID, SpellName0 FROM spell WHERE ID = {source_id}", env)
    if not success or not output.strip():
        print(f"ERROR: Source spell ID {source_id} not found")
        return False

    # Check if target already exists
    success, output = run_sql(f"SELECT ID, SpellName0 FROM spell WHERE ID = {new_id}", env)
    if success and output.strip() and str(new_id) in output:
        print(f"ERROR: Target spell ID {new_id} already exists")
        return False

    # Get column names
    success, output = run_sql(
        "SELECT COLUMN_NAME FROM information_schema.columns "
        "WHERE table_schema = DATABASE() AND table_name = 'spell' "
        "ORDER BY ORDINAL_POSITION",
        env
    )
    if not success:
        print("ERROR: Could not get spell table columns")
        return False

    columns = [line.strip() for line in output.strip().split('\n')[1:] if line.strip()]

    # Build clone SQL
    columns_str = ', '.join(f'`{col}`' for col in columns)

    # Build SELECT with ID replacement and optional name replacement
    select_parts = []
    for col in columns:
        if col == 'ID':
            select_parts.append(str(new_id))
        elif col == 'SpellName0' and new_name:
            select_parts.append(f"'{new_name}'")
        else:
            select_parts.append(f'`{col}`')

    select_str = ', '.join(select_parts)

    clone_sql = f"INSERT INTO spell ({columns_str}) SELECT {select_str} FROM spell WHERE ID = {source_id}"

    success, output = run_sql(clone_sql, env)
    if not success:
        print(f"ERROR: Clone failed: {output}")
        return False

    # Get the name for display
    if new_name:
        final_name = new_name
    else:
        success, output = run_sql(f"SELECT SpellName0 FROM spell WHERE ID = {source_id}", env)
        final_name = output.strip().split('\n')[-1] if success else "Unknown"

    print(f"SUCCESS: Cloned spell {source_id} -> {new_id}")
    print(f"  Name: {final_name}")
    return True


def cmd_query(args):
    """Handle direct SQL query/execution."""
    # Get SQL from args, file, or stdin
    if args.file:
        with open(args.file, 'r') as f:
            sql = f.read()
    elif args.sql:
        sql = ' '.join(args.sql)
    elif not sys.stdin.isatty():
        # Read from stdin (piped input)
        sql = sys.stdin.read()
    else:
        sql = ''

    if not sql.strip():
        print("ERROR: No SQL provided")
        print("Usage: python3 dbc.py \"SELECT ...\"")
        print("       python3 dbc.py -f file.sql")
        print("       python3 dbc.py < file.sql")
        print("       cat file.sql | python3 dbc.py")
        return 1

    # Check if this is a modification
    is_mod = is_modification(sql)

    if is_mod and not args.task:
        print("ERROR: Modification detected (INSERT/UPDATE/DELETE)")
        print("       You must provide --task F-XXX or --task I-XXX for DBC modifications")
        print("\nDetected SQL:")
        print(f"  {sql[:100]}{'...' if len(sql) > 100 else ''}")
        return 1

    if args.task and not is_mod:
        print("WARNING: --task provided but no modification detected. Running as query.")

    # Execute the SQL
    print(f"{'Executing modification' if is_mod else 'Running query'}...")
    success, output = run_sql(sql)

    if not success:
        print(f"ERROR: {output}")
        return 1

    if output.strip():
        print(output)

    # If modification, run Patch Builder and commit
    if is_mod and args.task:
        if not run_patch_builder_diff():
            return 1

        desc = f"apply {os.path.basename(args.file)}" if args.file else "DBC modification"
        if not git_commit_changes(args.task, desc):
            print("\nWARNING: No changes to commit (Patch Builder found no diff)")

        print(f"\n{'='*60}")
        print("DBC MODIFICATION COMPLETE")
        print(f"{'='*60}")

    return 0


def cmd_clone(args):
    """Handle clone subcommand."""
    print(f"\n{'='*60}")
    print(f"DBC - Clone Spell")
    print(f"{'='*60}")
    print(f"Task:   {args.task}")
    print(f"Source: {args.source_id}")
    print(f"Target: {args.new_id}")
    if args.name:
        print(f"Name:   {args.name}")
    print(f"{'='*60}\n")

    # Clone the spell
    if not clone_spell(args.source_id, args.new_id, args.name):
        return 1

    # Run Patch Builder
    if not run_patch_builder_diff():
        return 1

    # Commit
    description = f"clone spell {args.source_id} -> {args.new_id}"
    if args.name:
        description += f" ({args.name})"

    if not git_commit_changes(args.task, description):
        print("\nWARNING: No commit created")
        return 1

    print(f"\n{'='*60}")
    print("CLONE COMPLETE")
    print(f"{'='*60}")
    return 0


def main():
    parser = argparse.ArgumentParser(
        description='Unified DBC database tool with auto-detection of modifications.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )

    subparsers = parser.add_subparsers(dest='command')

    # Clone subcommand
    clone_parser = subparsers.add_parser('clone', help='Clone a spell')
    clone_parser.add_argument('source_id', type=int, help='Source spell ID')
    clone_parser.add_argument('new_id', type=int, help='New spell ID')
    clone_parser.add_argument('--task', '-t', required=True, help='Task ID (F-XXX or I-XXX)')
    clone_parser.add_argument('--name', '-n', help='Custom name for cloned spell')
    clone_parser.set_defaults(func=cmd_clone)

    # Default: SQL query/execution
    parser.add_argument('sql', nargs='*', help='SQL to execute')
    parser.add_argument('--file', '-f', help='SQL file to execute')
    parser.add_argument('--task', '-t', help='Task ID (F-XXX or I-XXX) - required for modifications')

    args = parser.parse_args()

    # Validate task ID format if provided
    if args.task and not re.match(r'^[FI]-\d+$', args.task):
        print(f"ERROR: Task ID must be in format F-XXX or I-XXX (got: {args.task})")
        return 1

    # Route to appropriate handler
    if args.command == 'clone':
        return args.func(args)
    else:
        return cmd_query(args)


if __name__ == '__main__':
    sys.exit(main())
