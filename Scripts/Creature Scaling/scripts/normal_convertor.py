#!/usr/bin/env python3
"""
Normal Creature Convertor

Converts elite creatures to normal rank with adjusted stats.
Used to revert IPP zone file elite restorations - Zeppelin uses Autobalance
for difficulty scaling instead of vanilla elite mobs in open world zones.

Usage:
    Standalone: python3 scripts/normal_convertor.py
    Via orchestrator: python3 creature_scaler.py --normal
"""

import mysql.connector
import random
import os
import json
from pathlib import Path


# Get base directory (parent of scripts/)
BASE_DIR = Path(__file__).parent.parent


# Challenge type classes with stat modifiers
class named_solo_fight:
    health_min = 2.0
    health_max = 2.5
    damage_min = 2.0
    damage_max = 2.3
    rank = 0


class named_group_fight:
    health_min = 1.7
    health_max = 2.0
    damage_min = 1.5
    damage_max = 2.0
    rank = 0


class normal:
    health_min = 1.0
    health_max = 1.2
    damage_min = 1.0
    damage_max = 1.1
    rank = 0


class rare:
    health_min = 1.7
    health_max = 2.0
    damage_min = 1.5
    damage_max = 2.0
    rank = 2


# Map string names to classes for JSON loading
CHALLENGE_TYPES = {
    "named_solo_fight": named_solo_fight,
    "named_group_fight": named_group_fight,
    "normal": normal,
    "rare": rare
}

# Columns to fetch and modify
COLUMNS = ["name", "DamageModifier", "HealthModifier", "Rank", "spell_school_immune_mask"]

# Output filename
OUTPUT_FILE = "zz_de-L33TER.sql"


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
    """Load creature definitions from data/creatures.json."""
    json_file = BASE_DIR / "data" / "creatures.json"

    if not json_file.exists():
        raise FileNotFoundError(f"Creature definitions file not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    # Convert JSON structure to internal format with class references
    area_data = {}
    for area_name, challenges in data.items():
        if area_name.startswith("_"):  # Skip comment fields
            continue

        area_data[area_name] = {
            named_solo_fight: [],
            named_group_fight: [],
            normal: [],
            rare: []
        }

        for challenge_name, creature_ids in challenges.items():
            if challenge_name.startswith("_"):  # Skip comment fields
                continue
            if challenge_name in CHALLENGE_TYPES:
                challenge_class = CHALLENGE_TYPES[challenge_name]
                area_data[area_name][challenge_class] = creature_ids

    return area_data


def fetch_original_row(cursor, entry_value):
    """Fetch creature data from database."""
    column_names = ", ".join([f"`{col}`" for col in COLUMNS])
    query = f"SELECT {column_names} FROM `creature_template` WHERE `entry` = %s;"

    cursor.execute(query, (entry_value,))
    result = cursor.fetchone()

    if result:
        return dict(zip(COLUMNS, result))
    return None


def modify_original_row(original_row, challenge):
    """Modify creature stats based on challenge type."""
    creature_name = original_row["name"]

    modified_row = {
        "DamageModifier": round(random.uniform(challenge.damage_min, challenge.damage_max), 2),
        "HealthModifier": round(random.uniform(challenge.health_min, challenge.health_max), 2),
        "Rank": challenge.rank
    }

    # Strip spell school immunities if creature has any
    if original_row.get("spell_school_immune_mask", 0) != 0:
        modified_row["spell_school_immune_mask"] = 0

    return modified_row, creature_name


def generate_sql_queries(modified_row, entry_value, creature_name, challenge_name):
    """Generate SQL UPDATE queries for the creature."""
    queries = []

    # Add creature name as comment header
    queries.append(f"-- Processing: {creature_name} as {challenge_name}")
    queries.append("")

    # Build UPDATE query
    update_fields = []
    for col, value in modified_row.items():
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        else:
            update_fields.append(f"    `{col}` = {value}")

    queries.append("UPDATE `creature_template` SET")
    queries.append(",\n".join(update_fields))
    queries.append(f"WHERE `entry` = {entry_value};")
    queries.append("")

    return queries


def print_queries_and_save(queries, output_path, first_call=False):
    """Print queries and save to SQL file."""
    for query in queries:
        print(query)

    try:
        mode = 'w' if first_call else 'a'

        with open(output_path, mode, encoding='utf-8') as f:
            if first_call:
                f.write("-- SQL queries generated automatically\n")
                f.write("-- Created by Normal Creature Convertor script\n\n")

            for query in queries:
                f.write(query + "\n")

        if first_call:
            print(f"\n=== Created new SQL file: {output_path} ===")
    except Exception as e:
        print(f"\n!!! Error saving queries to file: {e} !!!")


def execute_queries(db_config, entry_value, challenge):
    """Execute database operations for a single creature."""
    conn = None
    queries = []

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        original_row = fetch_original_row(cursor, entry_value)
        if not original_row:
            print(f"Warning: No creature found with entry {entry_value}")
            return []

        modified_row, creature_name = modify_original_row(original_row, challenge)
        challenge_name = challenge.__class__.__name__
        queries = generate_sql_queries(modified_row, entry_value, creature_name, challenge_name)

    except mysql.connector.Error as db_err:
        print(f"Database error processing entry {entry_value}: {db_err}")
    except Exception as err:
        print(f"Unexpected error processing entry {entry_value}: {err}")
    finally:
        if conn and conn.is_connected():
            conn.close()

    return queries


def run(db_config=None):
    """
    Main entry point for the Normal Creature Convertor.

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

    # Process each area
    for area_name, challenges in area_data.items():
        area_header = [f"-- {area_name}", ""]
        print_queries_and_save(area_header, output_path)

        # Process each challenge type
        for challenge_class in [named_solo_fight, named_group_fight, normal, rare]:
            creature_ids = challenges.get(challenge_class, [])
            for entry_id in creature_ids:
                queries = execute_queries(db_config, entry_id, challenge_class())
                if queries:
                    print_queries_and_save(queries, output_path)

    print(f"\n=== Normal Creature Convertor complete. Output: {output_path} ===")


if __name__ == "__main__":
    run()
