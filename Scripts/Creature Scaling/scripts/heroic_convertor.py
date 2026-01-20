#!/usr/bin/env python3
"""
Heroic Creature Convertor

Creates heroic and mythic versions of dungeon creatures with scaled stats.
Duplicates creature templates with new IDs and links them via difficulty_entry fields.

Usage:
    Standalone: python3 scripts/heroic_convertor.py
    Via orchestrator: python3 creature_scaler.py --heroic
"""

import mysql.connector
import random
import os
import json
from pathlib import Path


# Get base directory (parent of scripts/)
BASE_DIR = Path(__file__).parent.parent


# Columns to fetch and modify
COLUMNS = [
    "difficulty_entry_1",
    "difficulty_entry_2",
    "name",
    "subname",
    "minlevel",
    "maxlevel",
    "DamageModifier",
    "lootid",
    "AIName",
    "HealthModifier",
    "ScriptName"
]

# Output filename
OUTPUT_FILE = "zz_heroic_convertor.sql"


class HeroicStats:
    """Stat modifiers for Heroic difficulty."""
    boss_health_min = 5.8
    boss_health_max = 6.5
    boss_damage_min = 4.9
    boss_damage_max = 5.1

    rare_health_min = 4.8
    rare_health_max = 5.5
    rare_damage_min = 3.9
    rare_damage_max = 4.1

    elite_health_min = 2.8
    elite_health_max = 3.5
    elite_damage_min = 1.9
    elite_damage_max = 2.1

    normal_health_min = 1.8
    normal_health_max = 2.5
    normal_damage_min = 0.9
    normal_damage_max = 1.1


class MythicStats:
    """Stat modifiers for Mythic difficulty."""
    boss_health_min = 7.8
    boss_health_max = 8.5
    boss_damage_min = 6.9
    boss_damage_max = 7.1

    rare_health_min = 6.8
    rare_health_max = 7.5
    rare_damage_min = 5.9
    rare_damage_max = 6.1

    elite_health_min = 3.8
    elite_health_max = 4.5
    elite_damage_min = 2.9
    elite_damage_max = 3.1

    normal_health_min = 2.8
    normal_health_max = 3.5
    normal_damage_min = 1.9
    normal_damage_max = 2.1


# Challenge tier attribute mappings
CHALLENGE_TIERS = {
    "boss": ("boss_damage_min", "boss_damage_max", "boss_health_min", "boss_health_max"),
    "elite": ("elite_damage_min", "elite_damage_max", "elite_health_min", "elite_health_max"),
    "rare": ("rare_damage_min", "rare_damage_max", "rare_health_min", "rare_health_max"),
    "normal": ("normal_damage_min", "normal_damage_max", "normal_health_min", "normal_health_max"),
}


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


def load_dungeons():
    """Load dungeon definitions from data/creatures_heroic.json."""
    json_file = BASE_DIR / "data" / "creatures_heroic.json"

    if not json_file.exists():
        raise FileNotFoundError(f"Dungeon definitions file not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    # Filter out comment fields
    return {k: v for k, v in data.items() if not k.startswith("_")}


def fetch_original_row(cursor, entry_value):
    """Fetch creature data from database."""
    column_names = ", ".join(COLUMNS)
    query = f"SELECT {column_names} FROM creature_template WHERE entry = %s;"

    cursor.execute(query, (entry_value,))
    result = cursor.fetchone()

    if result:
        return dict(zip(COLUMNS, result))
    return None


def modify_original_row(original_row, challenge, is_mythic, mythic_loot_id):
    """Modify creature stats based on challenge type and difficulty."""
    # Escape and prefix name
    creature_name = original_row["name"].replace("'", "''")
    prefix = "Mythic " if is_mythic else "Heroic "
    original_row["name"] = f"{prefix}{creature_name}"
    prefixed_name = original_row["name"]

    # Escape subname if exists
    if original_row["subname"]:
        original_row["subname"] = original_row["subname"].replace("'", "''")

    # Reset difficulty entries and scripts
    original_row["difficulty_entry_1"] = 0
    original_row["difficulty_entry_2"] = 0
    original_row["AIName"] = ""
    original_row["ScriptName"] = ""

    # Set levels
    level = 63 if challenge == "boss" else 60
    original_row["minlevel"] = level
    original_row["maxlevel"] = level

    # Apply challenge modifiers
    difficulty = MythicStats if is_mythic else HeroicStats

    if challenge in CHALLENGE_TIERS:
        damage_min, damage_max, health_min, health_max = CHALLENGE_TIERS[challenge]

        original_row["DamageModifier"] = round(
            random.uniform(getattr(difficulty, damage_min), getattr(difficulty, damage_max)), 2
        )
        original_row["HealthModifier"] = round(
            random.uniform(getattr(difficulty, health_min), getattr(difficulty, health_max)), 2
        )

        # Mythic boss loot
        if challenge == "boss" and is_mythic:
            original_row["lootid"] = mythic_loot_id

    return original_row, creature_name, prefixed_name


def generate_sql_queries(modified_row, new_entry, entry_value, is_mythic, map_value, creature_name, prefixed_name):
    """Generate SQL queries to duplicate and update a creature template."""
    queries = []

    # Comment header
    queries.append(f"-- Processing: {prefixed_name}")
    queries.append("")

    # Clean up existing entry
    queries.append(f"-- Delete Creature Template for {prefixed_name}")
    queries.append(f"DELETE FROM `creature_template` WHERE entry = {new_entry};")
    queries.append("")

    # Duplicate original creature with new ID
    queries.append(f"-- Create creature template for {prefixed_name} from a copy of {creature_name}")
    queries.append("CREATE TEMPORARY TABLE `temp_creature` LIKE `creature_template`;")
    queries.append(f"INSERT INTO `temp_creature` SELECT * FROM `creature_template` WHERE `entry` = {entry_value};")
    queries.append(f"UPDATE `temp_creature` SET `entry` = {new_entry};")
    queries.append("INSERT INTO `creature_template` SELECT * FROM `temp_creature`;")
    queries.append("DROP TEMPORARY TABLE `temp_creature`;")
    queries.append("")

    # Build UPDATE query for modified columns
    update_fields = []
    for col in COLUMNS:
        value = modified_row[col]
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        elif isinstance(value, str):
            escaped = value.replace("'", "''").replace("'''", "")
            update_fields.append(f"    `{col}` = '{escaped}'")
        else:
            update_fields.append(f"    `{col}` = {value}")

    queries.append(f"-- Override the values for {prefixed_name}")
    queries.append("UPDATE `creature_template` SET")
    queries.append(",\n".join(update_fields))
    queries.append(f"WHERE `entry` = {new_entry};")
    queries.append("")

    # Link original creature to this difficulty version
    difficulty_field = "difficulty_entry_2" if is_mythic else "difficulty_entry_1"
    queries.append(f"-- Link {creature_name} to {prefixed_name}")
    queries.append("UPDATE `creature_template`")
    queries.append(f"SET `{difficulty_field}` = {new_entry}")
    queries.append(f"WHERE `entry` = {entry_value};")
    queries.append("")

    # Update spawn masks
    queries.append(f"-- Update {creature_name} spawn masks for the dungeon map")
    queries.append("UPDATE `creature`")
    queries.append("SET `spawnMask` = 7")
    queries.append(f"WHERE `id1` = {entry_value} AND `map` = {map_value};")
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
                f.write("-- Created by Heroic Creature Convertor script\n\n")

            for query in queries:
                f.write(query + "\n")

        if first_call:
            print(f"\n=== Created new SQL file: {output_path} ===")
    except Exception as e:
        print(f"\n!!! Error saving queries to file: {e} !!!")


def execute_queries(db_config, entry_value, new_entry, challenge, is_mythic, map_value, mythic_loot_id):
    """Execute database operations for creating a heroic/mythic creature template."""
    queries = []
    conn = None

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        original_row = fetch_original_row(cursor, entry_value)
        if not original_row:
            print(f"Warning: No creature found with entry {entry_value}")
            return []

        modified_row, creature_name, prefixed_name = modify_original_row(
            original_row, challenge, is_mythic, mythic_loot_id
        )

        queries = generate_sql_queries(
            modified_row, new_entry, entry_value, is_mythic, map_value, creature_name, prefixed_name
        )

    except mysql.connector.Error as db_err:
        print(f"Database error processing entry {entry_value}: {db_err}")
    except Exception as err:
        print(f"Unexpected error processing entry {entry_value}: {err}")
    finally:
        if conn and conn.is_connected():
            conn.close()

    return queries


def process_dungeon(db_config, dungeon_name, dungeon_data, output_path):
    """Process all creatures in a dungeon for both heroic and mythic difficulties."""
    # Extract dungeon configuration
    new_entry = dungeon_data["entry_start"]
    map_id = dungeon_data["map_id"]
    mythic_loot_id = dungeon_data["mythic_loot_id"]

    # Get creature lists
    elite_ids = dungeon_data.get("elite", [])
    boss_ids = dungeon_data.get("boss", [])
    rare_ids = dungeon_data.get("rare", [])
    normal_ids = dungeon_data.get("normal", [])

    # Process order: elite, boss, rare, normal (for both heroic and mythic)
    creature_groups = [
        ("elite", elite_ids),
        ("boss", boss_ids),
        ("rare", rare_ids),
        ("normal", normal_ids)
    ]

    # HEROIC
    for challenge, creature_ids in creature_groups:
        for entry_id in creature_ids:
            queries = execute_queries(
                db_config, entry_id, new_entry, challenge,
                is_mythic=False, map_value=map_id, mythic_loot_id=mythic_loot_id
            )
            if queries:
                print_queries_and_save(queries, output_path)
            new_entry += 1

    # MYTHIC
    for challenge, creature_ids in creature_groups:
        for entry_id in creature_ids:
            queries = execute_queries(
                db_config, entry_id, new_entry, challenge,
                is_mythic=True, map_value=map_id, mythic_loot_id=mythic_loot_id
            )
            if queries:
                print_queries_and_save(queries, output_path)
            new_entry += 1


def run(db_config=None):
    """
    Main entry point for the Heroic Creature Convertor.

    Args:
        db_config: Optional database configuration dict. If not provided,
                   will load from .env file.
    """
    if db_config is None:
        db_config = load_config()

    dungeons = load_dungeons()

    output_path = BASE_DIR / "output" / OUTPUT_FILE

    # Initialize output file
    print_queries_and_save([], output_path, first_call=True)

    for dungeon_name, dungeon_data in dungeons.items():
        dungeon_header = [f"-- {dungeon_name}", ""]
        print_queries_and_save(dungeon_header, output_path)

        process_dungeon(db_config, dungeon_name, dungeon_data, output_path)

    print(f"\n=== Heroic Creature Convertor complete. Output: {output_path} ===")


if __name__ == "__main__":
    run()
