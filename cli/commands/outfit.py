"""
Outfit management commands for Zeppelin-Craft CLI.

Commands:
    zep outfit check                       Compare current DBC to stock WOTLK
    zep outfit fix                         Reset to stock, apply weapon changes, execute
    zep outfit tier list                   Show available tier sets from config
    zep outfit tier apply <name>           Apply tier set displays to charstartoutfit
    zep outfit tier apply <name> --dry-run Preview SQL without executing
    zep outfit tier reset                  Reset displays to match actual item displayids
    zep outfit tier reset --dry-run        Preview reset SQL
"""

import os
import sys
from pathlib import Path

import click
import pymysql
from dotenv import load_dotenv

# Load .env from cli directory
_cli_dir = Path(__file__).parent.parent
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)

# Database connection settings
DB_HOST = os.getenv('DB_HOST', '192.168.0.55')
DB_PORT = int(os.getenv('DB_PORT', '3306'))
DB_USER = os.getenv('DB_USER', 'acore')
DB_PASS = os.getenv('DB_PASS', 'acore')

DBC_HOST = os.getenv('DBC_HOST', '192.168.0.55')
DBC_PORT = int(os.getenv('DBC_PORT', '3306'))
DBC_USER = os.getenv('DBC_USER', 'spell-editor')
DBC_PASS = os.getenv('DBC_PASS', '')

# Outfit-specific config
OUTFIT_ADD_DK_MELEE = os.getenv('OUTFIT_ADD_DK_MELEE_WEAPONS', 'false').lower() == 'true'

CRAFT_ROOT = _cli_dir.parent

# F-022 zpak location
ZPAK_NAME = 'zepcraft-legacy'
ZPAK_DIR = CRAFT_ROOT / 'zpaks' / ZPAK_NAME


def _parse_class_list(value):
    """Parse comma-separated class IDs into a set."""
    if not value:
        return set()
    return {int(x.strip()) for x in value.split(',') if x.strip()}


def _parse_combo_list(value):
    """Parse race:class combinations into a set of tuples."""
    if not value:
        return set()
    combos = set()
    for combo in value.split(','):
        if ':' in combo:
            race, cls = combo.split(':', 1)
            combos.add((int(race.strip()), int(cls.strip())))
    return combos


OUTFIT_RANGED_CLASSES = _parse_class_list(os.getenv('OUTFIT_RANGED_ALLOWED_CLASSES', '3,4'))
OUTFIT_RANGED_COMBOS = _parse_combo_list(os.getenv('OUTFIT_RANGED_ALLOWED_COMBOS', '8:1'))


def _get_dbc_connection(db_name):
    """Get a pymysql connection to a DBC database."""
    return pymysql.connect(
        host=DBC_HOST,
        port=DBC_PORT,
        user=DBC_USER,
        passwd=DBC_PASS,
        db=db_name
    )


def _get_acore_connection():
    """Get a pymysql connection to acore_world."""
    return pymysql.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        passwd=DB_PASS,
        db='acore_world'
    )


def _get_default_spreadsheet_path():
    """Get default path to Race and Class Masks.xlsx."""
    return str(CRAFT_ROOT / 'Scripts' / 'Starting Weapons' / 'Race and Class Masks.xlsx')


def _execute_world_sql(sql_content):
    """Execute SQL against acore_world using the CLI's mysql approach."""
    from commands.sql import run_mysql_query
    success, output = run_mysql_query(sql_content)
    return success, output


def _execute_dbc_sql(sql_content):
    """Execute SQL against the live DBC database."""
    from lib.dbc_utils import DBCConfig, run_sql
    config = DBCConfig.from_env(_env_file)
    success, output = run_sql(sql_content, config, config.live)
    return success, output


def _fix_weapon_display_items(mismatches, weapon_additions, dbc_cursor, acore_cursor):
    """
    Update display_item for weapon slots changed by the weapon validator.

    After weapon fixes change item_N, the display_item_N must also be updated
    to match the new item's displayid from item_template.

    Returns list of SQL statements for the idempotent zpak file.
    """
    # Collect all changed weapon (outfit_id, slot, item_id) tuples
    changed = []
    for m in mismatches:
        if m.get('replacement_item') and m['replacement_item'] > 0:
            if m.get('slot_mismatch'):
                changed.append((m['outfit_id'], m['target_slot'], m['replacement_item']))
            else:
                changed.append((m['outfit_id'], m['slot'], m['replacement_item']))
        # Also clear display for removed weapons
        if m.get('action') == 'remove' or m.get('replacement_item', 0) == 0:
            changed.append((m['outfit_id'], m['slot'], 0))

    for a in weapon_additions:
        item_id = a.get('add_item', 0)
        if item_id > 0:
            changed.append((a['outfit_id'], a['slot'], item_id))

    if not changed:
        return []

    # Batch lookup displayids
    item_ids = {item_id for _, _, item_id in changed if item_id > 0}
    display_map = {}
    if item_ids:
        placeholders = ','.join(['%s'] * len(item_ids))
        acore_cursor.execute(f"""
            SELECT entry, displayid FROM item_template WHERE entry IN ({placeholders})
        """, tuple(item_ids))
        for entry, displayid in acore_cursor.fetchall():
            display_map[entry] = displayid

    # Generate and execute display updates
    sql_stmts = []
    for outfit_id, slot, item_id in changed:
        if item_id <= 0:
            display_id = -1
        else:
            display_id = display_map.get(item_id, -1)

        stmt = f"UPDATE `charstartoutfit` SET `display_item_{slot}` = {display_id} WHERE `id` = {outfit_id};"
        sql_stmts.append(stmt)
        dbc_cursor.execute(stmt)

    return sql_stmts


# =============================================================================
# outfit command group
# =============================================================================

@click.group()
def outfit():
    """Starting outfit management (check, fix, tier displays)"""
    pass


# =============================================================================
# outfit check command
# =============================================================================

@outfit.command('check')
def check():
    """Compare current DBC outfits to stock WOTLK.

    Shows all item slot differences between the current dbc.charstartoutfit
    and original_dbc.charstartoutfit (stock WOTLK baseline).

    Generates a log file at cli/logs/stock_slot_comparison.log.

    Example:
        zep outfit check
    """
    from lib.outfit.stock_comparator import compare_to_stock, format_stock_comparison

    try:
        original_dbc_conn = _get_dbc_connection('original_dbc')
        dbc_conn = _get_dbc_connection('dbc')
        acore_conn = _get_acore_connection()
    except pymysql.Error as e:
        raise click.ClickException(f"Database connection error: {e}")

    original_dbc_cursor = original_dbc_conn.cursor()
    dbc_cursor = dbc_conn.cursor()
    acore_cursor = acore_conn.cursor()

    try:
        differences = compare_to_stock(dbc_cursor, original_dbc_cursor, acore_cursor)

        if differences:
            # Print detailed report
            click.echo(format_stock_comparison(differences))

            # Write log file
            log_dir = str(_cli_dir / 'logs')
            os.makedirs(log_dir, exist_ok=True)
            log_path = os.path.join(log_dir, 'stock_slot_comparison.log')
            with open(log_path, 'w') as f:
                f.write(format_stock_comparison(differences))
            click.echo(f"+ Log written to {log_path}")
    finally:
        original_dbc_conn.close()
        dbc_conn.close()
        acore_conn.close()


# =============================================================================
# outfit fix command
# =============================================================================

@outfit.command('fix')
@click.option('--spreadsheet', type=click.Path(exists=True), default=None,
              help='Path to Race and Class Masks.xlsx')
def fix(spreadsheet):
    """Reset outfits to stock WOTLK, then apply weapon changes from spreadsheet.

    1. Resets all item + invtype slots to stock WOTLK values (preserves tier displays)
    2. Validates weapons against the CSV spreadsheet
    3. Applies weapon fixes to the live database
    4. Saves idempotent SQL to the zepcraft-legacy zpak

    Generated zpak files:
      dbc/[F-022]_skillraceclassinfo.sql       DBC trainer skills
      dbc/[F-022]_charstartoutfit.sql           DBC weapon/display fixes
      sql/zz_[F-022]_starting_weapon_skills.sql World starting skills

    Example:
        zep outfit fix
    """
    from lib.outfit.spreadsheet_reader import read_weapon_skills_from_spreadsheet
    from lib.outfit.sql_generators import (
        generate_skillraceclassinfo_sql,
        generate_starting_skills_sql,
        generate_weapon_fixes_sql,
    )
    from lib.outfit.weapon_validator import (
        validate_starter_weapons,
        validate_weapon_coverage,
        find_duplicate_weapons,
    )
    from lib.outfit.invtype_fixer import find_invtype_fixes
    from lib.outfit.stock_comparator import reset_to_stock

    spreadsheet_path = spreadsheet or _get_default_spreadsheet_path()

    # Resolve output directories from zpak
    zpak_sql_dir = str(ZPAK_DIR / 'sql')
    zpak_dbc_dir = str(ZPAK_DIR / 'dbc')

    if not ZPAK_DIR.exists():
        raise click.ClickException(f"Zpak not found: {ZPAK_DIR}")

    # Print mode banner
    click.echo("=" * 80)
    click.echo("OUTFIT FIX")
    click.echo("Reset to stock WOTLK + apply weapon changes from spreadsheet")
    click.echo(f"ZPAK: {ZPAK_NAME}")
    click.echo("=" * 80)
    click.echo()

    # Step 1: Read weapon skills from spreadsheet
    weapon_skills = read_weapon_skills_from_spreadsheet(spreadsheet_path)
    if not weapon_skills:
        raise click.ClickException("Failed to read weapon skills from spreadsheet!")

    # Step 2: Connect to databases
    try:
        original_dbc_conn = _get_dbc_connection('original_dbc')
        dbc_conn = _get_dbc_connection('dbc')
        acore_conn = _get_acore_connection()
    except pymysql.Error as e:
        raise click.ClickException(f"Database connection error: {e}")

    original_dbc_cursor = original_dbc_conn.cursor()
    dbc_cursor = dbc_conn.cursor()
    acore_cursor = acore_conn.cursor()

    try:
        # Step 3: Reset all item + invtype slots to stock WOTLK
        reset_count = reset_to_stock(dbc_cursor, dbc_conn, original_dbc_cursor)

        # Step 4: Validate starter weapon items
        validated_weapons = validate_starter_weapons(acore_cursor)
        if not validated_weapons:
            raise click.ClickException("No valid starter weapons found!")

        # Step 5: Validate weapon coverage against now-stock data
        # Use dbc_cursor since it was just reset to stock
        mismatches, weapon_additions = validate_weapon_coverage(
            weapon_skills,
            dbc_cursor,
            original_dbc_cursor,
            acore_cursor,
            validated_weapons,
            add_dk_melee=OUTFIT_ADD_DK_MELEE,
            ranged_classes=OUTFIT_RANGED_CLASSES,
            ranged_combos=OUTFIT_RANGED_COMBOS
        )

        # Step 6: Find invType fixes and duplicates
        invtype_fixes = find_invtype_fixes(dbc_cursor, acore_cursor)
        duplicate_cleanups = find_duplicate_weapons(dbc_cursor, acore_cursor)

        # Step 7: Generate weapon fix SQL (writes to zpak file)
        charstartoutfit_sql = generate_weapon_fixes_sql(
            mismatches,
            weapon_additions,
            invtype_fixes,
            duplicate_cleanups,
            zpak_dbc_dir,
            output_mode='sql'
        )

        # Step 8: Execute weapon fixes to live DB
        click.echo("=" * 80)
        click.echo("EXECUTING")
        click.echo("=" * 80)
        click.echo()

        if charstartoutfit_sql and charstartoutfit_sql.strip():
            click.echo("Applying weapon fixes to DBC...")
            success, output = _execute_dbc_sql(charstartoutfit_sql)
            if success:
                click.echo(click.style("  Weapon fixes: OK", fg='green'))
            else:
                click.echo(click.style(f"  Weapon fixes: FAILED - {output}", fg='red'))

        # Step 9: Fix display_item for changed weapon slots
        display_stmts = _fix_weapon_display_items(
            mismatches, weapon_additions, dbc_cursor, acore_cursor
        )
        if display_stmts:
            dbc_conn.commit()
            # Append display fixes to zpak SQL file
            zpak_path = os.path.join(zpak_dbc_dir, '[F-022]_charstartoutfit.sql')
            with open(zpak_path, 'a') as f:
                f.write('\n\n-- ' + '=' * 76 + '\n')
                f.write('-- WEAPON DISPLAY FIXES\n')
                f.write('-- ' + '=' * 76 + '\n')
                f.write('-- Updates display_item_ for weapon slots changed above\n\n')
                for stmt in display_stmts:
                    f.write(stmt + '\n')
            click.echo(f"  + {len(display_stmts)} weapon display fixes applied and saved")

        # Step 10: Generate and execute trainer/starting skills SQL
        skillraceclass_sql = generate_skillraceclassinfo_sql(spreadsheet_path, zpak_dbc_dir)
        starting_skills_sql = generate_starting_skills_sql(weapon_skills, zpak_sql_dir)

        if skillraceclass_sql and skillraceclass_sql.strip():
            click.echo("Applying skillraceclassinfo to DBC...")
            success, output = _execute_dbc_sql(skillraceclass_sql)
            if success:
                click.echo(click.style("  Skill race class info: OK", fg='green'))
            else:
                click.echo(click.style(f"  Skill race class info: FAILED - {output}", fg='red'))

        if starting_skills_sql and starting_skills_sql.strip():
            click.echo("Applying starting weapon skills to World DB...")
            success, output = _execute_world_sql(starting_skills_sql)
            if success:
                click.echo(click.style("  Starting weapon skills: OK", fg='green'))
            else:
                click.echo(click.style(f"  Starting weapon skills: FAILED - {output}", fg='red'))

        # Step 11: Summary
        click.echo()
        click.echo("=" * 80)
        click.echo("SUMMARY")
        click.echo("=" * 80)
        click.echo(f"Outfits reset to stock: {reset_count}")
        click.echo(f"Weapon replacements: {len(mismatches)}")
        click.echo(f"Weapon additions: {len([a for a in weapon_additions if not a.get('is_ammo')])}")
        click.echo(f"Ammo additions: {len([a for a in weapon_additions if a.get('is_ammo')])}")
        click.echo(f"invType fixes: {len(invtype_fixes)}")
        click.echo(f"Duplicate cleanups: {len(duplicate_cleanups)}")
        click.echo(f"Weapon display fixes: {len(display_stmts)}")
        click.echo()
        click.echo("Run 'zep outfit check' to verify results.")
        click.echo()

    finally:
        original_dbc_conn.close()
        dbc_conn.close()
        acore_conn.close()


# =============================================================================
# outfit tier subgroup
# =============================================================================

@outfit.group('tier')
def tier():
    """Tier set display management for character creation screen"""
    pass


@tier.command('list')
def tier_list():
    """Show available tier sets from config.

    Example:
        zep outfit tier list
    """
    from lib.outfit.tier_sets import load_tier_sets

    config_path = _cli_dir / 'config' / 'tier_sets.json'
    tier_data = load_tier_sets(config_path)

    if not tier_data:
        click.echo("No tier sets configured.")
        click.echo(f"\nConfig file: {config_path}")
        return

    click.echo(f"\n{'Name':<30} {'Classes':<10}")
    click.echo("-" * 45)

    for key, data in tier_data.items():
        class_count = len(data.get('classes', {}))
        click.echo(f"{data.get('name', key):<30} {class_count} classes")

    click.echo(f"\n{len(tier_data)} tier set(s) available")


@tier.command('apply')
@click.argument('name')
@click.option('--dry-run', is_flag=True, help='Preview SQL without executing')
def tier_apply(name, dry_run):
    """Apply a tier set's display IDs to charstartoutfit.

    Swaps the character creation screen armor appearance without changing
    the actual items characters receive.

    Examples:
        zep outfit tier apply tier1              # Apply Tier 1 displays
        zep outfit tier apply tier1 --dry-run    # Preview SQL only
    """
    from lib.outfit.tier_sets import load_tier_sets, apply_tier_set, write_tier_sql_to_zpak

    config_path = _cli_dir / 'config' / 'tier_sets.json'
    tier_data = load_tier_sets(config_path)

    if not tier_data:
        raise click.ClickException(f"No tier sets found in {config_path}")

    if name not in tier_data:
        available = ', '.join(tier_data.keys())
        raise click.ClickException(f"Tier set '{name}' not found. Available: {available}")

    try:
        dbc_conn = _get_dbc_connection('dbc')
    except pymysql.Error as e:
        raise click.ClickException(f"Database connection error: {e}")

    dbc_cursor = dbc_conn.cursor()

    try:
        sql_statements = apply_tier_set(name, tier_data[name], dbc_cursor)

        if not sql_statements:
            click.echo("No display changes needed.")
            return

        if dry_run:
            click.echo(f"-- Dry run: {len(sql_statements)} UPDATE statements for {tier_data[name].get('name', name)}")
            click.echo()
            for stmt in sql_statements:
                click.echo(stmt)
        else:
            click.echo(f"Applying {tier_data[name].get('name', name)}...")
            for stmt in sql_statements:
                dbc_cursor.execute(stmt)
            dbc_conn.commit()
            click.echo(f"+ Applied {len(sql_statements)} display updates")

            # Write to zpak for persistence across DB rebuilds
            zpak_dbc_dir = str(ZPAK_DIR / 'dbc')
            output_path = write_tier_sql_to_zpak(
                name, tier_data[name].get('name', name),
                sql_statements, zpak_dbc_dir
            )
            click.echo(f"+ Wrote tier SQL to {output_path}")
    finally:
        dbc_conn.close()


@tier.command('reset')
@click.option('--dry-run', is_flag=True, help='Preview reset SQL without executing')
def tier_reset(dry_run):
    """Reset display_item_ values to match actual item displayids.

    Reverts any tier set overrides so the character creation screen
    shows the actual items' models.

    Examples:
        zep outfit tier reset              # Reset all displays
        zep outfit tier reset --dry-run    # Preview SQL only
    """
    from lib.outfit.tier_sets import reset_displays, remove_tier_sql_from_zpak

    try:
        dbc_conn = _get_dbc_connection('dbc')
        acore_conn = _get_acore_connection()
    except pymysql.Error as e:
        raise click.ClickException(f"Database connection error: {e}")

    dbc_cursor = dbc_conn.cursor()
    acore_cursor = acore_conn.cursor()

    try:
        sql_statements = reset_displays(dbc_cursor, acore_cursor)

        if not sql_statements:
            click.echo("+ All display_item_ values already match item_template. No reset needed.")
            return

        if dry_run:
            click.echo(f"-- Dry run: {len(sql_statements)} display resets needed")
            click.echo()
            for stmt in sql_statements:
                click.echo(stmt)
        else:
            click.echo(f"Resetting display_item_ values...")
            for stmt in sql_statements:
                dbc_cursor.execute(stmt)
            dbc_conn.commit()
            click.echo(f"+ Reset {len(sql_statements)} display values to match item_template")

            # Remove tier section from zpak
            zpak_dbc_dir = str(ZPAK_DIR / 'dbc')
            if remove_tier_sql_from_zpak(zpak_dbc_dir):
                click.echo("+ Removed tier SQL from zpak")
    finally:
        dbc_conn.close()
        acore_conn.close()
