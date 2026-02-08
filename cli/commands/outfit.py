"""
Outfit management commands for Zeppelin-Craft CLI.

Commands:
    zep outfit fix                         Generate SQL fixes for weapon mismatches
    zep outfit fix --validate-only         Check only, no file generation
    zep outfit fix --compare-to-stock      Document CSV vs stock WOTLK differences
    zep outfit fix --execute               Generate AND execute SQL fixes
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


# =============================================================================
# outfit command group
# =============================================================================

@click.group()
def outfit():
    """Starting outfit management (weapons, tier displays)"""
    pass


# =============================================================================
# outfit fix command
# =============================================================================

@outfit.command('fix')
@click.option('--validate-only', is_flag=True, help='Check only, no file generation')
@click.option('--compare-to-stock', is_flag=True, help='Document CSV vs stock WOTLK differences')
@click.option('--execute', is_flag=True, help='Generate AND execute SQL fixes')
@click.option('--spreadsheet', type=click.Path(exists=True), default=None,
              help='Path to Race and Class Masks.xlsx')
def fix(validate_only, compare_to_stock, execute, spreadsheet):
    """Validate and fix starting weapon assignments.

    Generates SQL files into the zepcraft-legacy zpak (F-022):
      dbc/[F-022]_skillraceclassinfo.sql       DBC trainer skills
      dbc/[F-022]_charstartoutfit.sql           DBC weapon/display fixes
      sql/zz_[F-022]_starting_weapon_skills.sql World starting skills

    With --execute, also applies the generated SQL to the databases.

    Examples:
        zep outfit fix                      # Generate SQL into zpak
        zep outfit fix --execute            # Generate AND apply
        zep outfit fix --validate-only      # Check only, no files
        zep outfit fix --compare-to-stock   # Document design vs stock WOTLK
    """
    from lib.outfit.spreadsheet_reader import read_weapon_skills_from_spreadsheet
    from lib.outfit.sql_generators import (
        generate_skillraceclassinfo_sql,
        generate_starting_skills_sql,
        generate_weapon_fixes_sql,
        generate_display_info_fixes_sql
    )
    from lib.outfit.weapon_validator import (
        validate_starter_weapons,
        validate_weapon_coverage,
        find_duplicate_weapons,
        validate_display_info
    )
    from lib.outfit.invtype_fixer import find_invtype_fixes

    spreadsheet_path = spreadsheet or _get_default_spreadsheet_path()

    # Resolve output directories from zpak
    zpak_sql_dir = str(ZPAK_DIR / 'sql')
    zpak_dbc_dir = str(ZPAK_DIR / 'dbc')

    if not ZPAK_DIR.exists():
        raise click.ClickException(f"Zpak not found: {ZPAK_DIR}")

    # Print mode banner
    click.echo("=" * 80)
    click.echo("STARTING WEAPONS VALIDATOR AND FIXER")
    if compare_to_stock:
        click.echo("MODE: Documentation (CSV vs Stock WOTLK)")
    else:
        click.echo("MODE: Fix Current Database")
    if validate_only:
        click.echo("OPTION: Validate Only (no file generation)")
    if execute:
        click.echo("OPTION: Execute (will apply SQL after generating)")
    click.echo(f"ZPAK: {ZPAK_NAME}")
    click.echo("=" * 80)
    click.echo()

    # Step 1: Read weapon skills from spreadsheet
    weapon_skills = read_weapon_skills_from_spreadsheet(spreadsheet_path)
    if not weapon_skills:
        raise click.ClickException("Failed to read weapon skills from spreadsheet!")

    # Step 2: Generate trainer/starting skills SQL (always generated unless validate-only)
    skillraceclass_sql = None
    starting_skills_sql = None
    if not validate_only:
        skillraceclass_sql = generate_skillraceclassinfo_sql(spreadsheet_path, zpak_dbc_dir)
        starting_skills_sql = generate_starting_skills_sql(weapon_skills, zpak_sql_dir)

    # Step 3: Connect to databases
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
        # Step 4: Validate starter weapon items
        validated_weapons = validate_starter_weapons(acore_cursor)
        if not validated_weapons:
            raise click.ClickException("No valid starter weapons found!")

        # Step 5: Choose validation source
        if compare_to_stock:
            validation_cursor = original_dbc_cursor
            click.echo("Using original_dbc (stock WOTLK) as validation source")
            click.echo()
        else:
            validation_cursor = dbc_cursor
            click.echo("Using dbc (current database) as validation source")
            click.echo()

        # Step 6: Validate weapon coverage (two-pass)
        mismatches, weapon_additions = validate_weapon_coverage(
            weapon_skills,
            validation_cursor,
            original_dbc_cursor,
            acore_cursor,
            validated_weapons,
            add_dk_melee=OUTFIT_ADD_DK_MELEE,
            ranged_classes=OUTFIT_RANGED_CLASSES,
            ranged_combos=OUTFIT_RANGED_COMBOS
        )

        # Step 7: Find invType fixes (only for current DB mode)
        invtype_fixes = []
        if not compare_to_stock:
            invtype_fixes = find_invtype_fixes(dbc_cursor, acore_cursor)

        # Step 8: Find duplicate weapons (only for current DB mode)
        duplicate_cleanups = []
        if not compare_to_stock:
            duplicate_cleanups = find_duplicate_weapons(dbc_cursor, acore_cursor)

        # Step 8b: Validate displayInfo matches
        display_mismatches = []
        if not compare_to_stock:
            display_mismatches = validate_display_info(dbc_cursor, acore_cursor)

        # Step 9: Report summary
        click.echo("=" * 80)
        click.echo("VALIDATION SUMMARY")
        click.echo("=" * 80)
        click.echo(f"Weapon mismatches: {len(mismatches)}")
        click.echo(f"Weapon additions needed: {len([a for a in weapon_additions if not a.get('is_ammo')])}")
        click.echo(f"Ammo additions needed: {len([a for a in weapon_additions if a.get('is_ammo')])}")
        if not compare_to_stock:
            click.echo(f"invType fixes needed: {len(invtype_fixes)}")
            click.echo(f"Duplicate cleanups needed: {len(duplicate_cleanups)}")
            click.echo(f"displayInfo fixes needed: {len(display_mismatches)}")
        click.echo()

        # Step 10: Generate output or just validate
        if validate_only:
            if mismatches or weapon_additions or display_mismatches:
                click.echo("=" * 80)
                click.echo("ISSUES FOUND")
                click.echo("=" * 80)
                click.echo()
                click.echo("Run without --validate-only to generate SQL fixes.")
                click.echo()
            else:
                click.echo("+ NO ISSUES FOUND - Database matches CSV requirements!")
                click.echo()
            return

        # Generate weapon fixes / log
        output_mode = 'log' if compare_to_stock else 'sql'
        log_dir = str(_cli_dir / 'logs') if compare_to_stock else None
        charstartoutfit_sql = generate_weapon_fixes_sql(
            mismatches,
            weapon_additions,
            invtype_fixes,
            duplicate_cleanups,
            zpak_dbc_dir,
            output_mode,
            log_dir=log_dir
        )

        # Generate display fixes (appends to charstartoutfit file)
        display_sql = ""
        if not compare_to_stock and display_mismatches:
            display_sql = generate_display_info_fixes_sql(display_mismatches, zpak_dbc_dir)

        # Step 11: Execute if requested
        if execute and not compare_to_stock:
            click.echo("=" * 80)
            click.echo("EXECUTING SQL")
            click.echo("=" * 80)
            click.echo()

            # Execute DBC SQL (skillraceclassinfo + charstartoutfit)
            dbc_combined = ""
            if skillraceclass_sql:
                dbc_combined += skillraceclass_sql + "\n"
            if charstartoutfit_sql:
                dbc_combined += charstartoutfit_sql + "\n"
            if display_sql:
                dbc_combined += display_sql + "\n"

            if dbc_combined.strip():
                click.echo("Applying DBC SQL (skillraceclassinfo + charstartoutfit)...")
                success, output = _execute_dbc_sql(dbc_combined)
                if success:
                    click.echo(click.style("  DBC: OK", fg='green'))
                else:
                    click.echo(click.style(f"  DBC: FAILED - {output}", fg='red'))

            # Execute World SQL (starting_weapon_skills)
            if starting_skills_sql and starting_skills_sql.strip():
                click.echo("Applying World SQL (starting_weapon_skills)...")
                success, output = _execute_world_sql(starting_skills_sql)
                if success:
                    click.echo(click.style("  World: OK", fg='green'))
                else:
                    click.echo(click.style(f"  World: FAILED - {output}", fg='red'))

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
    from lib.outfit.tier_sets import load_tier_sets, apply_tier_set

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
    from lib.outfit.tier_sets import reset_displays

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
    finally:
        dbc_conn.close()
        acore_conn.close()
