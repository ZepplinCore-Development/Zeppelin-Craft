#!/usr/bin/env python3
"""
Reorder charstartoutfit IDs to match original_dbc ordering.

This script:
1. Reads ID mapping from original_dbc for vanilla races (1-8, 10, 11)
2. Maps current dbc entries to original IDs based on (race, class, gender)
3. Assigns new sequential IDs to Goblins (9) and Worgen (12) starting after highest original ID
4. Generates SQL to reorder the current dbc table to match original ordering
"""

import pymysql
import sys
import os

# Database connections
ORIGINAL_DBC_CONFIG = {
    'host': '192.168.0.55',
    'port': 3306,
    'user': 'spell-editor',
    'passwd': 'HW8Y%L6&f0ePJO',
    'db': 'original_dbc'
}

DBC_CONFIG = {
    'host': '192.168.0.55',
    'port': 3306,
    'user': 'spell-editor',
    'passwd': 'HW8Y%L6&f0ePJO',
    'db': 'dbc'
}

RACE_NAMES = {
    1: "Human", 2: "Orc", 3: "Dwarf", 4: "Night Elf", 5: "Undead",
    6: "Tauren", 7: "Gnome", 8: "Troll", 9: "Goblin", 10: "Blood Elf",
    11: "Draenei", 12: "Worgen"
}

CLASS_NAMES = {
    1: "Warrior", 2: "Paladin", 3: "Hunter", 4: "Rogue", 5: "Priest",
    6: "Death Knight", 7: "Shaman", 8: "Mage", 9: "Warlock", 11: "Druid"
}

def main():
    print("=" * 80)
    print("CHARSTARTOUTFIT ID REORDERING")
    print("=" * 80)
    print()

    # Step 1: Build mapping from original_dbc
    print("Step 1: Reading original_dbc ID mapping...")
    original_conn = pymysql.connect(**ORIGINAL_DBC_CONFIG)
    original_cursor = original_conn.cursor()

    original_cursor.execute("""
        SELECT ID, race, class, gender
        FROM charstartoutfit
        ORDER BY ID
    """)
    original_rows = original_cursor.fetchall()

    # Map (race, class, gender) -> original_id
    original_id_map = {}
    max_original_id = 0

    for row in original_rows:
        original_id, race, cls, gender = row
        original_id_map[(race, cls, gender)] = original_id
        max_original_id = max(max_original_id, original_id)

    print(f"  Found {len(original_rows)} entries in original_dbc")
    print(f"  Highest original ID: {max_original_id}")
    print()

    original_cursor.close()
    original_conn.close()

    # Step 2: Read current dbc entries
    print("Step 2: Reading current dbc entries...")
    dbc_conn = pymysql.connect(**DBC_CONFIG)
    dbc_cursor = dbc_conn.cursor()

    dbc_cursor.execute("""
        SELECT ID, race, class, gender
        FROM charstartoutfit
        ORDER BY race, class, gender
    """)
    current_rows = dbc_cursor.fetchall()

    print(f"  Found {len(current_rows)} entries in current dbc")
    print()

    # Step 3: Build ID mapping
    print("Step 3: Building ID mapping...")
    id_mappings = []  # List of (current_id, new_id, race, class, gender)
    vanilla_races = [1, 2, 3, 4, 5, 6, 7, 8, 10, 11]
    custom_races = [9, 12]  # Goblin, Worgen

    next_custom_id = max_original_id + 1
    vanilla_count = 0
    custom_count = 0
    unmapped_count = 0

    for row in current_rows:
        current_id, race, cls, gender = row
        race_name = RACE_NAMES.get(race, f"Race{race}")
        class_name = CLASS_NAMES.get(cls, f"Class{cls}")
        gender_name = "Male" if gender == 0 else "Female"

        combo_key = (race, cls, gender)

        if race in vanilla_races:
            # Map to original ID
            if combo_key in original_id_map:
                new_id = original_id_map[combo_key]
                id_mappings.append((current_id, new_id, race, cls, gender))
                vanilla_count += 1
            else:
                print(f"  WARNING: Vanilla combo not found in original: {race_name} {class_name} ({gender_name})")
                unmapped_count += 1
        elif race in custom_races:
            # Assign new sequential ID
            new_id = next_custom_id
            id_mappings.append((current_id, new_id, race, cls, gender))
            next_custom_id += 1
            custom_count += 1
        else:
            # Other custom races - skip or handle separately
            print(f"  SKIPPING: Unknown race {race} ({race_name}) {class_name} ({gender_name})")
            unmapped_count += 1

    print(f"  Mapped {vanilla_count} vanilla race/class combos to original IDs")
    print(f"  Assigned {custom_count} new IDs for Goblins/Worgen (starting at {max_original_id + 1})")
    if unmapped_count > 0:
        print(f"  Skipped {unmapped_count} entries")
    print()

    # Step 4: Generate SQL
    print("Step 4: Generating SQL...")

    sql_lines = []
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- REORDER CHARSTARTOUTFIT IDS TO MATCH ORIGINAL_DBC")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- This script reorders charstartoutfit IDs to match the original WOTLK")
    sql_lines.append("-- database structure. This ensures Patch Builder generates accurate diffs")
    sql_lines.append("-- showing actual item/slot changes instead of race/class swaps.")
    sql_lines.append("--")
    sql_lines.append(f"-- Vanilla races: {vanilla_count} entries mapped to original IDs")
    sql_lines.append(f"-- Custom races: {custom_count} entries (Goblins/Worgen) assigned new IDs")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("")

    # Strategy: Update IDs in two passes to avoid conflicts
    # Pass 1: Set all IDs to negative (temporary)
    sql_lines.append("-- PASS 1: Temporarily set all IDs to negative to avoid conflicts")
    for current_id, new_id, race, cls, gender in id_mappings:
        race_name = RACE_NAMES.get(race, f"Race{race}")
        class_name = CLASS_NAMES.get(cls, f"Class{cls}")
        gender_name = "Male" if gender == 0 else "Female"

        sql_lines.append(f"-- {race_name} {class_name} ({gender_name}): {current_id} -> {new_id}")
        sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `ID` = {new_id}+5000 WHERE `ID` = {current_id};")

    sql_lines.append("")
    sql_lines.append("-- PASS 2: Set IDs to final positive values")
    for current_id, new_id, race, cls, gender in id_mappings:
        sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `ID` = {new_id} WHERE `ID` = {new_id}+5000;")

    sql_lines.append("")
    sql_lines.append(f"-- Reordering complete! {len(id_mappings)} entries updated.")

    # Write SQL file
    SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(SCRIPT_DIR, 'reorder_charstartoutfit.sql')

    with open(output_path, 'w') as f:
        f.write('\n'.join(sql_lines))

    print(f"✓ Generated {output_path}")
    print(f"  {len(id_mappings)} ID mappings")
    print()

    # Show sample of changes
    print("Sample ID changes:")
    for i, (current_id, new_id, race, cls, gender) in enumerate(id_mappings[:10]):
        race_name = RACE_NAMES.get(race, f"Race{race}")
        class_name = CLASS_NAMES.get(cls, f"Class{cls}")
        gender_name = "M" if gender == 0 else "F"
        print(f"  {current_id:3d} -> {new_id:3d}  {race_name:12s} {class_name:12s} ({gender_name})")

    if len(id_mappings) > 10:
        print(f"  ... and {len(id_mappings) - 10} more")

    print()
    print("=" * 80)
    print("NEXT STEPS:")
    print("=" * 80)
    print(f"1. Review the generated SQL: {output_path}")
    print("2. Execute the SQL to reorder IDs:")
    print(f"   mysql -h 192.168.0.55 -P 3306 -u spell-editor -p'HW8Y%L6&f0ePJO' dbc < {output_path}")
    print("3. Run Patch Builder to generate new update_charstartoutfit.sql with accurate diffs")
    print()

    dbc_cursor.close()
    dbc_conn.close()

    return 0

if __name__ == "__main__":
    sys.exit(main())
