#!/usr/bin/env python3
"""
Starting Weapons Validator and Fixer - Modular Version

Validates charstartoutfit weapons against CSV weapon skill requirements.
Generates SQL fixes for current database or documentation logs for design decisions.

Modes:
  python3 fix_starting_weapons.py                    # Fix current database
  python3 fix_starting_weapons.py --validate-only    # Show issues without generating files
  python3 fix_starting_weapons.py --compare-to-stock # Document design vs stock WOTLK
"""

import sys

# Import lib/ modules
from lib.db_config import get_connections, close_connections
from lib.spreadsheet_reader import read_weapon_skills_from_spreadsheet
from lib.sql_generators import (
    generate_skillraceclassinfo_sql,
    generate_starting_skills_sql,
    generate_weapon_fixes_sql
)
from lib.weapon_validator import (
    validate_starter_weapons,
    validate_weapon_coverage,
    find_duplicate_weapons
)
from lib.invtype_fixer import find_invtype_fixes


def main():
    """Main orchestrator for starting weapons validation and fixing."""

    # Parse command-line arguments
    validate_only = '--validate-only' in sys.argv
    compare_to_stock = '--compare-to-stock' in sys.argv

    # Print mode banner
    print("=" * 80)
    print("STARTING WEAPONS VALIDATOR AND FIXER")
    if compare_to_stock:
        print("MODE: Documentation (CSV vs Stock WOTLK)")
    else:
        print("MODE: Fix Current Database")
    if validate_only:
        print("OPTION: Validate Only (no file generation)")
    print("=" * 80)
    print()

    # Step 1: Read weapon skills from spreadsheet
    weapon_skills = read_weapon_skills_from_spreadsheet()
    if not weapon_skills:
        print("ERROR: Failed to read weapon skills from spreadsheet!")
        return 1

    # Step 2: Generate trainer/starting skills SQL
    generate_skillraceclassinfo_sql()
    generate_starting_skills_sql(weapon_skills)

    # Step 3: Connect to databases
    original_dbc_conn, dbc_conn, acore_conn = get_connections()
    original_dbc_cursor = original_dbc_conn.cursor()
    dbc_cursor = dbc_conn.cursor()
    acore_cursor = acore_conn.cursor()

    # Step 4: Validate starter weapon items
    validated_weapons = validate_starter_weapons(acore_cursor)
    if not validated_weapons:
        print("ERROR: No valid starter weapons found!")
        close_connections(original_dbc_conn, dbc_conn, acore_conn)
        return 1

    # Step 5: Choose validation source (current DB vs stock WOTLK)
    if compare_to_stock:
        validation_cursor = original_dbc_cursor
        print("Using original_dbc (stock WOTLK) as validation source")
        print()
    else:
        validation_cursor = dbc_cursor
        print("Using dbc (current database) as validation source")
        print()

    # Step 6: Validate weapon coverage (two-pass validation)
    # Pass both cursors: validation_cursor (what to check) and original_dbc_cursor (for stock preference)
    mismatches, weapon_additions = validate_weapon_coverage(
        weapon_skills,
        validation_cursor,
        original_dbc_cursor,
        acore_cursor,
        validated_weapons
    )

    # Step 7: Find invType fixes (only for current DB mode)
    invtype_fixes = []
    if not compare_to_stock:
        invtype_fixes = find_invtype_fixes(dbc_cursor, acore_cursor)

    # Step 8: Find duplicate weapons (only for current DB mode)
    duplicate_cleanups = []
    if not compare_to_stock:
        duplicate_cleanups = find_duplicate_weapons(dbc_cursor, acore_cursor)

    # Step 9: Report summary
    print("=" * 80)
    print("VALIDATION SUMMARY")
    print("=" * 80)
    print(f"Weapon mismatches: {len(mismatches)}")
    print(f"Weapon additions needed: {len([a for a in weapon_additions if not a.get('is_ammo')])}")
    print(f"Ammo additions needed: {len([a for a in weapon_additions if a.get('is_ammo')])}")
    if not compare_to_stock:
        print(f"invType fixes needed: {len(invtype_fixes)}")
        print(f"Duplicate cleanups needed: {len(duplicate_cleanups)}")
    print()

    # Step 10: Generate output or just validate
    if validate_only:
        # Just print validation results
        if mismatches or weapon_additions:
            print("=" * 80)
            print("ISSUES FOUND")
            print("=" * 80)
            print()
            print("Run without --validate-only to generate SQL fixes.")
            print()
            result_code = 1
        else:
            print("✓ NO ISSUES FOUND - Database matches CSV requirements!")
            print()
            result_code = 0
    else:
        # Generate SQL or LOG file
        output_mode = 'log' if compare_to_stock else 'sql'
        generate_weapon_fixes_sql(
            mismatches,
            weapon_additions,
            invtype_fixes,
            duplicate_cleanups,
            output_mode
        )
        result_code = 0 if not (mismatches or weapon_additions) else 1

    # Step 11: Cleanup database connections
    close_connections(original_dbc_conn, dbc_conn, acore_conn)

    return result_code


if __name__ == "__main__":
    sys.exit(main())
