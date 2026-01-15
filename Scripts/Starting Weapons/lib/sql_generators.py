"""
SQL generation functions for starting weapons system.

Generates three SQL files:
1. skillraceclassinfo.sql - Makes weapon skills learnable by trainers
2. starting_weapon_skills.sql - Gives weapon skills at character creation
3. starting_weapons.sql - Weapon fixes and adjustments
"""

import os
from .spreadsheet_reader import read_weapon_class_masks
from .constants import WEAPON_SKILLS, SKILL_TO_INVTYPE, STARTER_AMMO


def get_output_directory():
    """Get the directory where SQL files should be written (parent of lib/)."""
    lib_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.dirname(lib_dir)


def generate_skillraceclassinfo_sql():
    """
    Generate skillraceclassinfo.sql to make skills learnable by class.

    This file controls which weapon skills are LEARNABLE by trainers.
    """
    print("=" * 80)
    print("GENERATING SKILL RACE CLASS INFO SQL")
    print("=" * 80)
    print()

    # Read weapon class masks from spreadsheet
    weapon_class_data = read_weapon_class_masks()

    sql_lines = []

    # Header
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- SKILL RACE CLASS INFO - WEAPON SKILL AVAILABILITY")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- This file controls which weapon skills are LEARNABLE by CLASS.")
    sql_lines.append("-- All races (raceMask=4095) can learn if their class allows it.")
    sql_lines.append("-- Must be applied BEFORE starting_weapon_skills.sql")
    sql_lines.append("--")
    sql_lines.append("-- AUTO-GENERATED from Race and Class Masks.xlsx (Weapon Class Mask sheet)")
    sql_lines.append("-- DO NOT EDIT MANUALLY - Changes will be overwritten")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("")

    # Delete existing weapon skill entries
    all_skill_ids = sorted(weapon_class_data.keys())
    skill_id_list = ', '.join(str(sid) for sid in all_skill_ids)
    sql_lines.append("-- Delete existing weapon skill entries")
    sql_lines.append(f"DELETE FROM `skillraceclassinfo` WHERE `SkillLineDbcRecord` IN ({skill_id_list});")
    sql_lines.append("")

    # Insert entries for each skill with explicit IDs
    # Start from ID 1000 to avoid conflicts with existing entries
    entry_id = 1000
    for skill_id in all_skill_ids:
        data = weapon_class_data[skill_id]
        sql_lines.append(f"-- {data['name']} (skill {skill_id}) - classMask {data['class_mask']}")

        # Insert with explicit ID, raceMask=4095 (all races), flags=128, minLevel=0, skillTierID=0, skillCostIndex=0
        sql_lines.append(
            f"INSERT INTO `skillraceclassinfo` "
            f"(`Id`, `SkillLineDbcRecord`, `RaceMask`, `ClassMask`, `Flags`, `MinLevel`, `SkillTierId`, `SkillCostIndex`) "
            f"VALUES ({entry_id}, {skill_id}, 4095, {data['class_mask']}, 128, 0, 0, 0);"
        )
        sql_lines.append("")
        entry_id += 1

    sql_content = '\n'.join(sql_lines)

    # Write to file
    output_path = os.path.join(get_output_directory(), 'skillraceclassinfo.sql')
    with open(output_path, 'w') as f:
        f.write(sql_content)

    print(f"✓ Generated {output_path}")
    print(f"  {len(all_skill_ids)} weapon skills")
    print(f"  All races (raceMask=4095) with class-specific masks")
    print()


def generate_starting_skills_sql(weapon_skills):
    """
    Generate starting_weapon_skills.sql from weapon skills data.

    This file controls which weapon skills players get AT CHARACTER CREATION.

    Args:
        weapon_skills: Dict from read_weapon_skills_from_spreadsheet()
    """
    print("=" * 80)
    print("GENERATING WEAPON SKILLS SQL")
    print("=" * 80)
    print()

    sql_lines = []

    # Header
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- STARTING WEAPON SKILLS")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("-- This file controls which races can use which weapon types at character")
    sql_lines.append("-- creation. All weapon skill changes should be made in this file ONLY.")
    sql_lines.append("--")
    sql_lines.append("-- AUTO-GENERATED from Race and Class Masks.xlsx")
    sql_lines.append("-- DO NOT EDIT MANUALLY - Changes will be overwritten")
    sql_lines.append("--")
    sql_lines.append("-- RACE MASKS (add values for multiple races):")
    sql_lines.append("--   1 = Human       2 = Orc         4 = Dwarf       8 = Night Elf")
    sql_lines.append("--  16 = Undead     32 = Tauren     64 = Gnome     128 = Troll")
    sql_lines.append("-- 256 = Goblin    512 = Blood Elf  1024 = Draenei  2048 = Worgen")
    sql_lines.append("--   0 = None      4095 = All Races")
    sql_lines.append("--")
    sql_lines.append("-- CLASS MASKS (add values for multiple classes):")
    sql_lines.append("--   1 = Warrior     2 = Paladin      4 = Hunter      8 = Rogue     16 = Priest")
    sql_lines.append("--  32 = DK         64 = Shaman     128 = Mage      256 = Warlock  512 = (unused)")
    sql_lines.append("-- 1024 = Druid")
    sql_lines.append("--   0 = All       2047 = All Classes")
    sql_lines.append("-- " + "=" * 76)
    sql_lines.append("")

    # Delete existing weapon skills
    sql_lines.append("-- Delete existing weapon skills")
    all_skill_ids = sorted(weapon_skills.keys())
    skill_id_list = ', '.join(str(sid) for sid in all_skill_ids)
    sql_lines.append(f"DELETE FROM `playercreateinfo_skills` WHERE `skill` IN ({skill_id_list});")
    sql_lines.append("")

    # Group by weapon category
    weapon_categories = {
        'ONE-HANDED WEAPONS': [43, 44, 54, 173],
        'TWO-HANDED WEAPONS': [55, 160, 172, 136, 229],
        'RANGED WEAPONS': [45, 46, 47, 176, 228],
        'OTHER': [162, 433, 473]
    }

    for category, skill_ids in weapon_categories.items():
        category_has_skills = any(sid in weapon_skills for sid in skill_ids)
        if not category_has_skills:
            continue

        sql_lines.append("-- " + "=" * 76)
        sql_lines.append(f"-- {category}")
        sql_lines.append("-- " + "=" * 76)
        sql_lines.append("")

        for skill_id in skill_ids:
            if skill_id not in weapon_skills:
                continue

            data = weapon_skills[skill_id]
            sql_lines.append(f"-- {data['name']} (skill {skill_id})")

            for cls in data['classes']:
                comment = f"{cls['name']} - {data['name']}"
                # Escape single quotes for SQL
                comment_escaped = comment.replace("'", "''")
                sql_lines.append(f"INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES ({cls['race_mask']}, {cls['class_mask']}, {skill_id}, 0, '{comment_escaped}');")

            sql_lines.append("")

    sql_content = '\n'.join(sql_lines)

    # Write to file
    output_path = os.path.join(get_output_directory(), 'starting_weapon_skills.sql')
    with open(output_path, 'w') as f:
        f.write(sql_content)

    print(f"✓ Generated {output_path}")
    print(f"  {len(all_skill_ids)} weapon skills")
    print(f"  {sum(len(data['classes']) for data in weapon_skills.values())} total class entries")
    print()


def generate_weapon_fixes_sql(mismatches, weapon_additions, invtype_fixes, duplicate_cleanups, output_mode='sql'):
    """
    Generate starting_weapons.sql with all weapon fixes OR a documentation LOG file.

    Args:
        mismatches: List of weapon mismatch/replacement entries
        weapon_additions: List of weapons to add
        invtype_fixes: List of invType corrections
        duplicate_cleanups: List of duplicate weapons to remove
        output_mode: 'sql' for SQL fixes (current DB), 'log' for documentation (stock WOTLK comparison)
    """
    print("=" * 80)
    if output_mode == 'log':
        print("GENERATING CSV vs STOCK WOTLK DOCUMENTATION LOG")
    else:
        print("GENERATING STARTING WEAPONS SQL")
    print("=" * 80)
    print()

    sql_lines = []

    # Combine and sort all fixes by outfit_id
    all_fixes = []

    for mismatch in mismatches:
        all_fixes.append({
            'outfit_id': mismatch['outfit_id'],
            'race': mismatch['race'],
            'class': mismatch['class'],
            'gender': mismatch['gender'],
            'slot': mismatch['slot'],
            'type': 'replace',
            'data': mismatch
        })

    for addition in weapon_additions:
        all_fixes.append({
            'outfit_id': addition['outfit_id'],
            'race': addition['race'],
            'class': addition['class'],
            'gender': addition['gender'],
            'slot': addition['slot'],
            'type': 'add',
            'data': addition
        })

    # Sort by outfit_id, then by slot
    all_fixes.sort(key=lambda x: (x['outfit_id'], x['slot']))

    # Generate SQL for each fix
    for fix in all_fixes:
        slot = fix['slot']
        outfit_id = fix['outfit_id']

        if fix['type'] == 'replace':
            mismatch = fix['data']
            action = mismatch.get('action', 'replace')

            if action == 'remove' or mismatch['replacement_item'] == 0:
                # Remove weapon
                reason = mismatch.get('reason', 'no suitable replacement')
                sql_lines.append(f"-- {mismatch['race']} {mismatch['class']} ({mismatch['gender']}): Remove {mismatch['current_type']} ({reason})")
                sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `itemId{slot}` = 0, `invType{slot}` = 0 WHERE `ID` = {outfit_id};")
            else:
                # Replace weapon
                skill_name = next((name for sid, name in WEAPON_SKILLS.values() if sid == mismatch['replacement_skill']), "Unknown")
                reason = mismatch.get('reason', f'Replace {mismatch["current_type"]} with {skill_name}')
                sql_lines.append(f"-- {mismatch['race']} {mismatch['class']} ({mismatch['gender']}): {reason}")
                sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `itemId{slot}` = {mismatch['replacement_item']} WHERE `ID` = {outfit_id};")
            sql_lines.append("")
        else:  # add
            addition = fix['data']
            # Handle ammo (add_skill is None for ammo)
            if addition.get('is_ammo'):
                sql_lines.append(f"-- {addition['race']} {addition['class']} ({addition['gender']}): Add {addition['reason']}")
                sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `itemId{slot}` = {addition['add_item']}, `invType{slot}` = 24 WHERE `ID` = {outfit_id};")
            else:
                skill_name = next((name for sid, name in WEAPON_SKILLS.values() if sid == addition['add_skill']), "Unknown")
                inv_type = SKILL_TO_INVTYPE.get(addition['add_skill'], 13)  # Default to one-hand if not found
                sql_lines.append(f"-- {addition['race']} {addition['class']} ({addition['gender']}): Add {skill_name} ({addition['reason']})")
                sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `itemId{slot}` = {addition['add_item']}, `invType{slot}` = {inv_type} WHERE `ID` = {outfit_id};")
            sql_lines.append("")

    # SECTION: Cleanup duplicates
    if duplicate_cleanups:
        sql_lines.append("-- " + "=" * 76)
        sql_lines.append("-- CLEANUP: REMOVE DUPLICATE WEAPONS/AMMO")
        sql_lines.append("-- " + "=" * 76)
        sql_lines.append("")

        for cleanup in duplicate_cleanups:
            reason = cleanup.get('reason', 'Duplicate weapon/ammo')
            sql_lines.append(f"-- {cleanup['race']} {cleanup['class']} ({cleanup['gender']}): {reason}")
            sql_lines.append(f"UPDATE `dbc`.`charstartoutfit` SET `itemId{cleanup['slot']}` = 0, `invType{cleanup['slot']}` = 0 WHERE `ID` = {cleanup['outfit_id']};")

        sql_lines.append("")
        sql_lines.append(f"-- Cleaned up {len(duplicate_cleanups)} duplicate weapons/ammo")
        sql_lines.append("")

    # Write to file
    if output_mode == 'log':
        # Documentation mode: output to LOG file with detailed explanations
        output_path = os.path.join(get_output_directory(), 'csv_vs_stock_wotlk.log')

        log_lines = []
        log_lines.append("=" * 80)
        log_lines.append("CSV WEAPON SKILLS vs STOCK WOTLK COMPARISON")
        log_lines.append("=" * 80)
        log_lines.append("")
        log_lines.append("This file documents the intentional differences between our custom")
        log_lines.append("weapon skill system (defined in CSV) and stock WOTLK starting weapons.")
        log_lines.append("")
        log_lines.append("These differences are BY DESIGN and represent our custom game balance.")
        log_lines.append("This is NOT a list of bugs - it's documentation of intended changes.")
        log_lines.append("")
        log_lines.append("=" * 80)
        log_lines.append("UPDATE DIRECTION: STOCK WOTLK → CSV REQUIREMENTS")
        log_lines.append("=" * 80)
        log_lines.append("")
        log_lines.append("The UPDATE statements show changes needed to align stock WOTLK with CSV.")
        log_lines.append("")
        log_lines.append("Example:")
        log_lines.append("  Stock WOTLK: Human Warrior Male has 2H Sword (itemId 49778) in slot 5")
        log_lines.append("  CSV Design:  Human Warrior Male should have 1H Mace (itemId 36)")
        log_lines.append("  UPDATE:      Changes slot 5 from 49778 → 36 (Stock → CSV)")
        log_lines.append("")
        log_lines.append("These UPDATEs are for DOCUMENTATION ONLY (explaining design decisions).")
        log_lines.append("Do NOT execute these - they would revert intentional changes!")
        log_lines.append("")
        log_lines.append("=" * 80)
        log_lines.append(f"FOUND {len(all_fixes)} INTENTIONAL DIFFERENCES FROM STOCK WOTLK")
        log_lines.append("=" * 80)
        log_lines.append("")

        # Add the SQL lines (they serve as clear documentation)
        log_lines.extend(sql_lines)

        with open(output_path, 'w') as f:
            f.write('\n'.join(log_lines))

        print(f"✓ Generated {output_path}")
        print(f"  {len(all_fixes)} differences from stock WOTLK documented")
    else:
        # Fix mode: output SQL to fix current database
        output_path = os.path.join(get_output_directory(), 'starting_weapons.sql')

        with open(output_path, 'w') as f:
            f.write('\n'.join(sql_lines))

        print(f"✓ Generated {output_path}")
        print(f"  {len(mismatches)} weapon replacements")
        print(f"  {len(weapon_additions)} weapon additions")
        if duplicate_cleanups:
            print(f"  {len(duplicate_cleanups)} duplicates cleaned")

    print()
