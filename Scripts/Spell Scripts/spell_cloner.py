#!/usr/bin/env python3
"""
Spell Cloner - Clone spells in the DBC database.

Copies all 234 columns from a source spell to a new spell ID.
Optionally allows setting a custom name for the cloned spell.

Usage:
    python3 spell_cloner.py <source_id> <new_id> [--name "New Spell Name"]

Examples:
    python3 spell_cloner.py 25392 900000
    python3 spell_cloner.py 25392 900000 --name "Custom Prayer of Fortitude"
"""

import argparse
import os
import sys

import pymysql


def load_env():
    """Load .env file from script directory."""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    env_path = os.path.join(script_dir, '.env')

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


def get_db_connection(env):
    """Create database connection to DBC database."""
    try:
        conn = pymysql.connect(
            host=env.get('DB_HOST', '192.168.0.55'),
            port=int(env.get('DB_PORT', 3306)),
            user=env.get('DBC_USER'),
            passwd=env.get('DBC_PASS'),
            db=env.get('DBC_NAME'),
            cursorclass=pymysql.cursors.DictCursor
        )
        return conn
    except pymysql.Error as e:
        print(f"Database connection error: {e}")
        sys.exit(1)


def get_spell_columns(cursor):
    """Get all column names from the spell table."""
    cursor.execute("""
        SELECT COLUMN_NAME
        FROM information_schema.columns
        WHERE table_schema = DATABASE() AND table_name = 'spell'
        ORDER BY ORDINAL_POSITION
    """)
    return [row['COLUMN_NAME'] for row in cursor.fetchall()]


def clone_spell(source_id, new_id, new_name=None):
    """
    Clone a spell from source_id to new_id.

    Args:
        source_id: The spell ID to clone from
        new_id: The new spell ID to create
        new_name: Optional custom name for the cloned spell

    Returns:
        True if successful, False otherwise
    """
    env = load_env()
    conn = get_db_connection(env)

    try:
        with conn.cursor() as cursor:
            # Get column names
            columns = get_spell_columns(cursor)

            # Fetch source spell
            cursor.execute(f"SELECT * FROM spell WHERE ID = %s", (source_id,))
            source_spell = cursor.fetchone()

            if not source_spell:
                print(f"ERROR: Source spell ID {source_id} not found")
                return False

            # Check if new_id already exists
            cursor.execute("SELECT ID, SpellName0 FROM spell WHERE ID = %s", (new_id,))
            existing = cursor.fetchone()
            if existing:
                print(f"ERROR: Target spell ID {new_id} already exists: '{existing['SpellName0']}'")
                return False

            # Build INSERT statement
            # Replace ID and optionally name
            values = []
            for col in columns:
                if col == 'ID':
                    values.append(new_id)
                elif col == 'SpellName0' and new_name:
                    values.append(new_name)
                else:
                    values.append(source_spell[col])

            placeholders = ', '.join(['%s'] * len(columns))
            columns_str = ', '.join([f'`{col}`' for col in columns])

            insert_sql = f"INSERT INTO spell ({columns_str}) VALUES ({placeholders})"
            cursor.execute(insert_sql, values)
            conn.commit()

            # Report success
            final_name = new_name if new_name else source_spell['SpellName0']
            print(f"SUCCESS: Cloned spell {source_id} -> {new_id}")
            print(f"  Source: [{source_id}] {source_spell['SpellName0']}")
            print(f"  Clone:  [{new_id}] {final_name}")

            return True

    except pymysql.Error as e:
        print(f"Database error: {e}")
        return False
    finally:
        conn.close()


def main():
    parser = argparse.ArgumentParser(
        description='Clone a spell in the DBC database.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 spell_cloner.py 25392 900000
      Clone Prayer of Fortitude (25392) to new ID 900000

  python3 spell_cloner.py 25392 900000 --name "Custom Prayer"
      Clone with a custom spell name
"""
    )
    parser.add_argument('source_id', type=int, help='Source spell ID to clone from')
    parser.add_argument('new_id', type=int, help='New spell ID to create')
    parser.add_argument('--name', '-n', type=str, help='Custom name for cloned spell')

    args = parser.parse_args()

    # Validate IDs
    if args.source_id <= 0:
        print("ERROR: source_id must be positive")
        sys.exit(1)
    if args.new_id <= 0:
        print("ERROR: new_id must be positive")
        sys.exit(1)
    if args.source_id == args.new_id:
        print("ERROR: source_id and new_id must be different")
        sys.exit(1)

    success = clone_spell(args.source_id, args.new_id, args.name)
    sys.exit(0 if success else 1)


if __name__ == '__main__':
    main()
