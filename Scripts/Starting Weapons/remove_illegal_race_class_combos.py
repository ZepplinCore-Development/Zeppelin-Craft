#!/usr/bin/env python3
"""
Remove Illegal Race/Class Combinations from CharStartOutfit

This script:
1. Reads valid race/class combinations from playercreateinfo (server DB)
2. Identifies invalid combinations in charstartoutfit (DBC)
3. Generates SQL to delete all invalid entries
4. Removes placeholder races (13-21) that shouldn't exist
"""

import pymysql
import sys

# Database connections
ACORE_CONFIG = {
    'host': '192.168.0.55',
    'port': 3306,
    'user': 'acore',
    'passwd': 'acore',
    'db': 'acore_world'
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
    print("ILLEGAL RACE/CLASS COMBO REMOVAL")
    print("=" * 80)
    print()

    # Step 1: Read valid race/class combinations from playercreateinfo
    print("Step 1: Reading valid race/class combinations from playercreateinfo...")
    acore_conn = pymysql.connect(**ACORE_CONFIG)
    acore_cursor = acore_conn.cursor()

    acore_cursor.execute("""
        SELECT DISTINCT race, class
        FROM playercreateinfo
        ORDER BY race, class
    """)
    valid_combos = set(acore_cursor.fetchall())

    print(f"  Found {len(valid_combos)} valid race/class combinations")
    print()

    acore_cursor.close()
    acore_conn.close()

    # Step 2: Read all charstartoutfit entries
    print("Step 2: Reading charstartoutfit entries...")
    dbc_conn = pymysql.connect(**DBC_CONFIG)
    dbc_cursor = dbc_conn.cursor()

    dbc_cursor.execute("""
        SELECT ID, race, class, gender
        FROM charstartoutfit
        ORDER BY ID
    """)
    all_outfits = dbc_cursor.fetchall()

    print(f"  Found {len(all_outfits)} entries in charstartoutfit")
    print()

    # Step 3: Identify illegal combinations
    print("Step 3: Identifying illegal combinations...")
    illegal_entries = []
    placeholder_entries = []

    for outfit_id, race, cls, gender in all_outfits:
        race_name = RACE_NAMES.get(race, f"Race{race}")
        class_name = CLASS_NAMES.get(cls, f"Class{cls}")
        gender_name = "Male" if gender == 0 else "Female"

        # Check for placeholder races (13-21+)
        if race >= 13:
            placeholder_entries.append({
                'id': outfit_id,
                'race': race,
                'class': cls,
                'gender': gender,
                'race_name': race_name,
                'class_name': class_name,
                'gender_name': gender_name
            })
            continue

        # Check if combo is valid
        if (race, cls) not in valid_combos:
            illegal_entries.append({
                'id': outfit_id,
                'race': race,
                'class': cls,
                'gender': gender,
                'race_name': race_name,
                'class_name': class_name,
                'gender_name': gender_name
            })

    print(f"  Found {len(illegal_entries)} illegal race/class combinations")
    print(f"  Found {len(placeholder_entries)} placeholder race entries")
    print()

    # Step 4: Display illegal entries
    if illegal_entries:
        print("Illegal Race/Class Combinations:")
        for entry in illegal_entries[:20]:
            print(f"  ID {entry['id']:3d}: {entry['race_name']:12s} {entry['class_name']:12s} ({entry['gender_name']})")
        if len(illegal_entries) > 20:
            print(f"  ... and {len(illegal_entries) - 20} more")
        print()

    if placeholder_entries:
        print("Placeholder Race Entries:")
        for entry in placeholder_entries[:10]:
            print(f"  ID {entry['id']:4d}: {entry['race_name']:12s} {entry['class_name']:12s} ({entry['gender_name']})")
        if len(placeholder_entries) > 10:
            print(f"  ... and {len(placeholder_entries) - 10} more")
        print()

    # Step 5: Generate SQL
    total_removals = len(illegal_entries) + len(placeholder_entries)

    if total_removals == 0:
        print("✓ NO ILLEGAL ENTRIES FOUND!")
        return 0

    print("Step 4: Generating SQL...")

    sql_lines = []
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- REMOVE ILLEGAL RACE/CLASS COMBINATIONS FROM CHARSTARTOUTFIT")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- This script removes race/class combinations that are not playable")
    sql_lines.append("-- according to playercreateinfo, as well as placeholder races (13-21).")
    sql_lines.append("--")
    sql_lines.append(f"-- {len(illegal_entries)} illegal race/class combinations")
    sql_lines.append(f"-- {len(placeholder_entries)} placeholder race entries")
    sql_lines.append(f"-- {total_removals} total entries to remove")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("")

    # Delete illegal combinations
    if illegal_entries:
        sql_lines.append("-- Remove illegal race/class combinations")
        for entry in illegal_entries:
            sql_lines.append(f"-- {entry['race_name']} {entry['class_name']} ({entry['gender_name']})")
            sql_lines.append(f"DELETE FROM `dbc`.`charstartoutfit` WHERE `ID` = {entry['id']};")
        sql_lines.append("")

    # Delete placeholder races
    if placeholder_entries:
        sql_lines.append("-- Remove placeholder race entries (races 13+)")
        for entry in placeholder_entries:
            sql_lines.append(f"-- Race {entry['race']} {entry['class_name']} ({entry['gender_name']})")
            sql_lines.append(f"DELETE FROM `dbc`.`charstartoutfit` WHERE `ID` = {entry['id']};")
        sql_lines.append("")

    sql_lines.append(f"-- Removed {total_removals} illegal entries")

    # Write SQL file
    output_path = '/workspace/project/Zeppelin-Craft/Scripts/Starting Weapons/remove_illegal_combos.sql'
    with open(output_path, 'w') as f:
        f.write('\n'.join(sql_lines))

    print(f"✓ Generated {output_path}")
    print(f"  {total_removals} entries will be removed")
    print()

    print("=" * 80)
    print("NEXT STEPS:")
    print("=" * 80)
    print(f"1. Review the generated SQL: {output_path}")
    print("2. Execute the SQL to remove illegal entries:")
    print(f"   mysql -h 192.168.0.55 -P 3306 -u spell-editor -p'HW8Y%L6&f0ePJO' dbc < {output_path}")
    print("3. Run reorder_charstartoutfit.sql to fix ID ordering")
    print("4. Run Patch Builder to regenerate update_charstartoutfit.sql")
    print()

    dbc_cursor.close()
    dbc_conn.close()

    return 0

if __name__ == "__main__":
    sys.exit(main())
