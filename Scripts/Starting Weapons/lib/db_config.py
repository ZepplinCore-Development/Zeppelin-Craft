"""
Database configuration and connection management.

Loads credentials from .env file and provides connection configs.
"""

import os
import sys
import pymysql


def load_env():
    """Load .env file from parent directory (same as main script)."""
    # Get the directory containing this module's file
    lib_dir = os.path.dirname(os.path.abspath(__file__))
    # Go up one level to the main script directory
    script_dir = os.path.dirname(lib_dir)
    env_path = os.path.join(script_dir, '.env')

    if not os.path.exists(env_path):
        print(f"ERROR: .env file not found at {env_path}")
        print("Please create .env file with database credentials.")
        sys.exit(1)

    env_vars = {}
    with open(env_path, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                env_vars[key.strip()] = value.strip()
    return env_vars


# Load environment variables once
ENV = load_env()

# Load weapon addition configuration
ADD_DK_MELEE_WEAPONS = ENV.get('ADD_DK_MELEE_WEAPONS', 'true').lower() == 'true'

# Load ranged weapon configuration
def parse_class_list(value):
    """Parse comma-separated class IDs into a set."""
    if not value:
        return set()
    return {int(x.strip()) for x in value.split(',') if x.strip()}

def parse_combo_list(value):
    """Parse race:class combinations into a set of tuples."""
    if not value:
        return set()
    combos = set()
    for combo in value.split(','):
        if ':' in combo:
            race, cls = combo.split(':', 1)
            combos.add((int(race.strip()), int(cls.strip())))
    return combos

RANGED_ALLOWED_CLASSES = parse_class_list(ENV.get('RANGED_ALLOWED_CLASSES', '3,4'))
RANGED_ALLOWED_COMBOS = parse_combo_list(ENV.get('RANGED_ALLOWED_COMBOS', '8:1'))


# Database connection configurations
ORIGINAL_DBC_CONFIG = {
    'host': ENV.get('DB_HOST', '192.168.0.55'),
    'port': int(ENV.get('DB_PORT', 3306)),
    'user': ENV.get('ORIGINAL_DBC_USER'),
    'passwd': ENV.get('ORIGINAL_DBC_PASS'),
    'db': ENV.get('ORIGINAL_DBC_NAME')
}

DBC_CONFIG = {
    'host': ENV.get('DB_HOST', '192.168.0.55'),
    'port': int(ENV.get('DB_PORT', 3306)),
    'user': ENV.get('DBC_USER'),
    'passwd': ENV.get('DBC_PASS'),
    'db': ENV.get('DBC_NAME')
}

ACORE_CONFIG = {
    'host': ENV.get('DB_HOST', '192.168.0.55'),
    'port': int(ENV.get('DB_PORT', 3306)),
    'user': ENV.get('ACORE_USER'),
    'passwd': ENV.get('ACORE_PASS'),
    'db': ENV.get('ACORE_NAME')
}


def get_connections():
    """
    Create and return database connections.

    Returns:
        tuple: (original_dbc_conn, dbc_conn, acore_conn)
    """
    try:
        original_dbc_conn = pymysql.connect(**ORIGINAL_DBC_CONFIG)
        dbc_conn = pymysql.connect(**DBC_CONFIG)
        acore_conn = pymysql.connect(**ACORE_CONFIG)
        return original_dbc_conn, dbc_conn, acore_conn
    except pymysql.Error as e:
        print(f"Database connection error: {e}")
        sys.exit(1)


def close_connections(original_dbc_conn, dbc_conn, acore_conn):
    """Close all database connections."""
    if original_dbc_conn:
        original_dbc_conn.close()
    if dbc_conn:
        dbc_conn.close()
    if acore_conn:
        acore_conn.close()
