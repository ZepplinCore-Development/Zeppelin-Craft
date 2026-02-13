#!/usr/bin/env python3
"""
Elite Creature Scaler

Adjusts elite creature templates for balanced scaling within shared Autobalance zones.
Used for dungeons like BRS where UBRS and LBRS share Autobalance tuning but have
wildly different mob strength.

Usage:
    Standalone: python3 scripts/elite_scaler.py
    Via orchestrator: python3 creature_scaler.py --elite
"""

import mysql.connector
import random
import os
import json
from pathlib import Path


# Get base directory (parent of scripts/)
BASE_DIR = Path(__file__).parent.parent


# Power level constants
BOSS = 0
RARE = 1
TRASH = 2

# Power level stat modifiers
POWER_STATS = {
    BOSS: {
        "damage_min": 5.0, "damage_max": 7.0,
        "health_min": 8.0, "health_max": 10.0
    },
    RARE: {
        "damage_min": 4.0, "damage_max": 6.0,
        "health_min": 5.0, "health_max": 7.0
    },
    TRASH: {
        "damage_min": 3.0, "damage_max": 4.0,
        "health_min": 3.0, "health_max": 4.0
    }
}

# Column indices in creature_template
COL_NAME = 10
COL_DAMAGE_MODIFIER = 27
COL_HEALTH_MODIFIER = 53

# Output filename
OUTPUT_FILE = "zz_[AUTO,F-074]_elite_scaler.sql"


def load_config():
    """Load database configuration from .env file or environment variables."""
    env_file = BASE_DIR / ".env"

    config = {}

    if env_file.exists():
        with open(env_file, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#') and '=' in line:
                    key, value = line.split('=', 1)
                    config[key.strip()] = value.strip()

    db_config = {
        "host": config.get("DB_HOST", os.environ.get("DB_HOST", "192.168.0.55")),
        "port": int(config.get("DB_PORT", os.environ.get("DB_PORT", "3306"))),
        "user": config.get("DB_USER", os.environ.get("DB_USER")),
        "password": config.get("DB_PASSWORD", os.environ.get("DB_PASSWORD")),
        "database": config.get("DB_NAME", os.environ.get("DB_NAME", "acore_world"))
    }

    if not db_config["user"] or not db_config["password"]:
        raise ValueError("Database credentials not configured. Check .env file or environment variables.")

    return db_config


def load_creatures():
    """Load creature definitions from data/creatures_elite.json."""
    json_file = BASE_DIR / "data" / "creatures_elite.json"

    if not json_file.exists():
        raise FileNotFoundError(f"Creature definitions file not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    # Convert JSON to internal format
    area_data = {}
    for area_name, creatures in data.items():
        if area_name.startswith("_"):
            continue

        area_data[area_name] = {
            BOSS: creatures.get("boss", []),
            RARE: creatures.get("rare", []),
            TRASH: creatures.get("trash", [])
        }

    return area_data


def print_queries_and_save(queries, output_path, first_call=False):
    """Print queries and save to SQL file."""
    for query in queries:
        print(query)

    try:
        mode = 'w' if first_call else 'a'

        with open(output_path, mode, encoding='utf-8') as f:
            if first_call:
                f.write("-- SQL queries generated automatically\n")
                f.write("-- Created by Elite Creature Scaler script\n\n")

            for query in queries:
                f.write(query + "\n")

        if first_call:
            print(f"\n=== Created new SQL file: {output_path} ===")
    except Exception as e:
        print(f"\n!!! Error saving queries to file: {e} !!!")


def execute_queries(db_config, entry_value, power):
    """Execute database operations for a single creature."""
    queries = []
    conn = None

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Check if creature exists
        cursor.execute("SELECT * FROM creature_template WHERE entry = %s;", (entry_value,))
        result = cursor.fetchone()

        if result is not None:
            original_row = list(result)
            creature_name = original_row[COL_NAME]

            # Get stats for this power level
            stats = POWER_STATS[power]
            original_row[COL_DAMAGE_MODIFIER] = round(random.uniform(stats["damage_min"], stats["damage_max"]), 2)
            original_row[COL_HEALTH_MODIFIER] = round(random.uniform(stats["health_min"], stats["health_max"]), 2)

            # Format values for SQL
            formatted_values = []
            for i, value in enumerate(original_row[1:], 1):
                if value is None:
                    formatted_values.append("NULL")
                elif isinstance(value, str):
                    escaped = value.replace("'", "''")
                    formatted_values.append(f"'{escaped}'")
                else:
                    formatted_values.append(str(value))

            # Generate SQL
            queries.append(f"-- {creature_name}")
            queries.append(f"DELETE FROM `creature_template` WHERE entry = {entry_value};")
            queries.append(
                f"REPLACE INTO `creature_template` VALUES ({entry_value}, "
                f"{', '.join(formatted_values)});"
            )
            queries.append("")

    except Exception as err:
        print(f"Error processing entry {entry_value}: {err}")
    finally:
        if conn and conn.is_connected():
            conn.close()

    return queries


def run(db_config=None):
    """
    Main entry point for the Elite Creature Scaler.

    Args:
        db_config: Optional database configuration dict. If not provided,
                   will load from .env file.
    """
    if db_config is None:
        db_config = load_config()

    area_data = load_creatures()

    output_path = BASE_DIR / "output" / OUTPUT_FILE

    # Initialize output file
    print_queries_and_save([], output_path, first_call=True)

    for area_name, creatures in area_data.items():
        area_header = [f"-- {area_name}", ""]
        print_queries_and_save(area_header, output_path)

        # Process each power level
        for power in [BOSS, RARE, TRASH]:
            creature_ids = creatures.get(power, [])
            for entry_id in creature_ids:
                queries = execute_queries(db_config, entry_id, power)
                if queries:
                    print_queries_and_save(queries, output_path)

    print(f"\n=== Elite Creature Scaler complete. Output: {output_path} ===")


if __name__ == "__main__":
    run()
