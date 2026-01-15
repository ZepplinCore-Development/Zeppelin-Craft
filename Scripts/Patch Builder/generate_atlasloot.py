#!/usr/bin/env python3
"""
AtlasLoot Generator - Main Script
Generates AtlasLoot Lua tables from live AzerothCore database

Usage:
    python3 generate_atlasloot.py --dungeon stockades
    python3 generate_atlasloot.py --dungeon all
    python3 generate_atlasloot.py --section TheStockade
"""

import argparse
import sys
import os

# Import our modules
from lua_parser import AtlasLootParser
from loot_query import LootDatabase
from lua_generator import LuaGenerator


# Dungeon section name mappings
# Organized by level tier for easy reference
DUNGEON_SECTIONS = {
    # Low Level Dungeons (10-25)
    'ragefire': 'RagefireChasm',
    'wailing1': 'WailingCaverns1',
    'wailing2': 'WailingCaverns2',
    'deadmines1': 'TheDeadmines1',
    'deadmines2': 'TheDeadmines2',
    'shadowfang1': 'ShadowfangKeep1',
    'shadowfang2': 'ShadowfangKeep2',
    'blackfathom1': 'BlackfathomDeeps1',
    'blackfathom2': 'BlackfathomDeeps2',
    'stockades': 'TheStockade',

    # Mid Level Dungeons (25-50)
    'gnomeregan1': 'Gnomeregan1',
    'gnomeregan2': 'Gnomeregan2',
    'rfk1': 'RazorfenKraul1',
    'rfk2': 'RazorfenKraul2',
    'sm_graveyard': 'SMGraveyard',
    'sm_library': 'SMLibrary',
    'sm_armory': 'SMHerod',
    'sm_cathedral': 'SMCathedral',
    'rfd1': 'RazorfenDowns1',
    'rfd2': 'RazorfenDowns2',
    'maraudon1': 'Maraudon1',
    'maraudon2': 'Maraudon2',

    # High Level Dungeons (50-60)
    # Sunken Temple
    'st_atalalarion': 'STAtalalarion',
    'st_dreamscythe': 'STDreamscythe',
    'st_weaver': 'STWeaver',
    'st_hazzas': 'STHazzas',
    'st_morphaz': 'STMorphaz',
    'st_jammalan': 'STJammalan',
    'st_ogom': 'STOgom',
    'st_spawn': 'STSpawnOfHakkar',
    'st_avatar': 'STAvatarofHakkar',
    'st_eranikus': 'STEranikus',
    'st_trolls': 'STTrollMinibosses',

    # Blackrock Depths (many bosses)
    'brd_roccor': 'BRDLordRoccor',
    'brd_pyron': 'BRDPyron',
    'brd_gerstahn': 'BRDHighInterrogatorGerstahn',
    'brd_arena': 'BRDArena',
    'brd_theldren': 'BRDTheldren',
    'brd_houndmaster': 'BRDHoundmaster',
    'brd_loregrain': 'BRDPyromantLoregrain',
    'brd_incendius': 'BRDLordIncendius',
    'brd_baelgar': 'BRDBaelGar',
    'brd_angerforge': 'BRDGeneralAngerforge',
    'brd_golem': 'BRDGolemLordArgelmach',
    'brd_guzzler': 'BRDGuzzler',
    'brd_flamelash': 'BRDFlamelash',
    'brd_panzor': 'BRDPanzor',
    'brd_tomb': 'BRDTomb',
    'brd_magmus': 'BRDMagmus',
    'brd_princess': 'BRDPrincess',
    'brd_emperor': 'BRDImperatorDagranThaurissan',
    'brd_vault': 'BRDTheVault',
    'brd_warder': 'BRDWarderStilgiss',
    'brd_verek': 'BRDVerek',
    'brd_fineous': 'BRDFineousDarkvire',
    'brd_lyceum': 'BRDLyceum',
    'brd_forgewright': 'BRDForgewright',

    # Lower Blackrock Spire
    'lbrs_omokk': 'LBRSOmokk',
    'lbrs_slavener': 'LBRSSlavener',
    'lbrs_vosh': 'LBRSVosh',
    'lbrs_grayhoof': 'LBRSGrayhoof',
    'lbrs_felguard': 'LBRSFelguard',
    'lbrs_smolderweb': 'LBRSSmolderweb',
    'lbrs_crystalfang': 'LBRSCrystalFang',
    'lbrs_doomhowl': 'LBRSDoomhowl',
    'lbrs_grimaxe': 'LBRSGrimaxe',
    'lbrs_spirestone_butcher': 'LBRSSpirestoneButcher',
    'lbrs_spirestone_lord': 'LBRSSpirestoneLord',
    'lbrs_halycon': 'LBRSHalycon',
    'lbrs_voone': 'LBRSVoone',
    'lbrs_wyrmthalak': 'LBRSWyrmthalak',
    'lbrs_zigris': 'LBRSZigris',
    'lbrs_bashguud': 'LBRSBashguud',
    'lbrs_lordmagus': 'LBRSLordMagus',

    # Upper Blackrock Spire
    'ubrs_emberseer': 'UBRSEmberseer',
    'ubrs_runewatcher': 'UBRSRunewatcher',
    'ubrs_solakar': 'UBRSSolakar',
    'ubrs_anvilcrack': 'UBRSAnvilcrack',
    'ubrs_gyth': 'UBRSGyth',
    'ubrs_rend': 'UBRSRend',
    'ubrs_beast': 'UBRSBeast',
    'ubrs_drakkisath': 'UBRSDrakkisath',
    'ubrs_valthalak': 'UBRSValthalak',

    # Dire Maul East
    'dme_pusillin': 'DMEPusillin',
    'dme_zevrim': 'DMEZevrimThornhoof',
    'dme_hydro': 'DMEHydro',
    'dme_lethtendris': 'DMELethtendris',
    'dme_pimgib': 'DMEPimgib',
    'dme_alzzin': 'DMEAlzzin',
    'dme_isalien': 'DMEIsalien',

    # Dire Maul North
    'dmn_fengus': 'DMNGuardFengus',
    'dmn_slipkik': 'DMNGuardSlipkik',
    'dmn_kromcrush': 'DMNCaptainKromcrush',
    'dmn_moldar': 'DMNGuardMoldar',
    'dmn_kreeg': 'DMNStomperKreeg',
    'dmn_chorush': 'DMNChoRush',
    'dmn_gordok': 'DMNKingGordok',
    'dmn_thimblejack': 'DMNThimblejack',

    # Dire Maul West
    'dmw_tendris': 'DMWTendrisWarpwood',
    'dmw_illyanna': 'DMWIllyannaRavenoak',
    'dmw_magister': 'DMWMagisterKalendris',
    'dmw_immolthar': 'DMWImmolthar',
    'dmw_prince': 'DMWPrinceTortheldrin',
    'dmw_helnurath': 'DMWHelnurath',
    'dmw_tsuzee': 'DMWTsuzee',

    # Stratholme
    'strat_courier': 'STRATStratholmeCourier',
    'strat_fras': 'STRATFrasSiabi',
    'strat_hearthsinger': 'STRATHearthsingerForresten',
    'strat_unforgiven': 'STRATTheUnforgiven',
    'strat_timmy': 'STRATTimmytheCruel',
    'strat_malor': 'STRATMalorsStrongbox',
    'strat_magistrate': 'STRATMagistrateBarthilas',
    'strat_ramstein': 'STRATRamsteintheGorger',
    'strat_baron': 'STRATBaronRivendare',
    'strat_nerubenkan': 'STRATNerubenkan',
    'strat_maleki': 'STRATMalekithePallid',
    'strat_baroness': 'STRATBaronessAnastari',
    'strat_cannon': 'STRATCannonMasterWilley',
    'strat_archivist': 'STRATArchivistGalford',
    'strat_balnazzar': 'STRATBalnazzar',
    'strat_stonespine': 'STRATStonespine',
    'strat_sothos': 'STRATSothosJarien',
}


def generate_section(lua_file_path: str, section_name: str, db: LootDatabase,
                    dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update a single AtlasLoot section.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "TheStockade")
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing section: {section_name}")
    print(f"{'='*60}")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/5] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    # Extract boss names from existing section
    boss_names = parser.extract_boss_names(section_name)
    if not boss_names:
        print(f"✗ No bosses found in section '{section_name}'")
        return False

    print(f"✓ Found {len(boss_names)} bosses: {', '.join(boss_names)}")

    # Step 2: Query database for creature IDs
    if verbose:
        print("\n[2/5] Looking up creature IDs...")
    creature_id_map = {}
    for boss_name in boss_names:
        creature_id = db.get_creature_id(boss_name)
        if creature_id:
            creature_id_map[boss_name] = creature_id
            if verbose:
                print(f"  {boss_name} → ID {creature_id}")
        else:
            print(f"⚠ Warning: Boss '{boss_name}' not found in database")

    if not creature_id_map:
        print("✗ No valid creature IDs found")
        return False

    # Step 3: Query loot for all bosses
    if verbose:
        print("\n[3/5] Querying loot tables...")
    creature_ids = list(creature_id_map.values())
    loot_by_creature_id = db.get_all_bosses_loot(creature_ids)

    total_items = sum(len(items) for items in loot_by_creature_id.values())
    print(f"✓ Found {total_items} total loot items")

    if verbose:
        for boss_name, creature_id in creature_id_map.items():
            loot_count = len(loot_by_creature_id.get(creature_id, []))
            print(f"  {boss_name}: {loot_count} items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[4/5] Generating Lua code...")
    generator = LuaGenerator(section_name)
    new_lua_code = generator.generate_from_database_results(
        boss_names, loot_by_creature_id, creature_id_map
    )

    if verbose:
        print(f"✓ Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

    # Show preview
    print("\nGenerated code preview:")
    preview_lines = new_lua_code.split('\n')[:10]
    for line in preview_lines:
        print(line)
    if len(new_lua_code.split('\n')) > 10:
        print(f"... ({len(new_lua_code.split(chr(10))) - 10} more lines)")

    # Step 5: Update file
    if dry_run:
        print("\n[DRY RUN] Skipping file update")
        return True

    if verbose:
        print("\n[5/5] Updating Lua file...")

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        print(f"✗ Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=True)
    if save_success:
        print(f"\n✓ Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n✗ Failed to save file")
        return False


def main():
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(
        description='Generate AtlasLoot tables from AzerothCore database'
    )
    parser.add_argument(
        '--dungeon',
        help='Dungeon name (stockades, deadmines, etc.)',
        choices=list(DUNGEON_SECTIONS.keys()) + ['all']
    )
    parser.add_argument(
        '--section',
        help='Specific AtlasLoot section name (e.g., TheStockade)'
    )
    parser.add_argument(
        '--lua-file',
        default='/workspace/project/Zeppelin-Craft/Patch-X MPQ/Interface/AddOns/AtlasLoot_OriginalWoW/originalwow.lua',
        help='Path to AtlasLoot Lua file'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Preview changes without modifying files'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Print detailed output'
    )

    args = parser.parse_args()

    # Validate arguments
    if not args.dungeon and not args.section:
        parser.error('Must specify either --dungeon or --section')

    # Check if Lua file exists
    if not os.path.exists(args.lua_file):
        print(f"✗ Error: Lua file not found: {args.lua_file}")
        return 1

    # Connect to database
    print("Connecting to database...")
    db = LootDatabase()
    if not db.connect():
        print("✗ Failed to connect to database")
        return 1
    print("✓ Database connected")

    # Determine which sections to process
    sections_to_process = []
    if args.section:
        sections_to_process.append(args.section)
    elif args.dungeon == 'all':
        sections_to_process = list(DUNGEON_SECTIONS.values())
    else:
        section_name = DUNGEON_SECTIONS.get(args.dungeon)
        if section_name:
            sections_to_process.append(section_name)
        else:
            print(f"✗ Unknown dungeon: {args.dungeon}")
            return 1

    # Process each section
    success_count = 0
    for section_name in sections_to_process:
        success = generate_section(
            args.lua_file, section_name, db,
            dry_run=args.dry_run, verbose=args.verbose
        )
        if success:
            success_count += 1

    # Disconnect database
    db.disconnect()

    # Summary
    print(f"\n{'='*60}")
    print(f"Summary: {success_count}/{len(sections_to_process)} sections processed successfully")
    print(f"{'='*60}")

    return 0 if success_count == len(sections_to_process) else 1


if __name__ == "__main__":
    sys.exit(main())
