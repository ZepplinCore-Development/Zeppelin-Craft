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

    # ===== RAIDS (Multi-Boss) =====
    # Multi-boss encounter sections use BabbleBoss format

    # Zul'Gurub (ZG) - 20-man raid
    'zg_edge_of_madness': 'ZGEdgeofMadness',  # Multi-boss rotating encounter (Gri'lek, Hazza'rah, Renataki, Wushoolay)
}

# ===== SINGLE-BOSS SECTIONS =====
# Maps section name -> creature ID (no BabbleBoss parsing needed)
# These sections list items directly without boss headers

SINGLE_BOSS_SECTIONS = {
    # ===== Blackwing Lair (BWL) =====
    'BWLRazorgore': 12435,      # Razorgore the Untamed
    'BWLVaelastrasz': 13020,    # Vaelastrasz the Corrupt
    'BWLLashlayer': 12017,      # Broodlord Lashlayer
    'BWLFiremaw': 11983,        # Firemaw
    'BWLEbonroc': 14601,        # Ebonroc
    'BWLFlamegor': 11981,       # Flamegor
    'BWLChromaggus': 14020,     # Chromaggus
    'BWLNefarian1': 11583,      # Nefarian (page 1)
    'BWLNefarian2': 11583,      # Nefarian (page 2 - same boss, different loot display)

    # ===== Molten Core (MC) =====
    'MCLucifron': 12118,        # Lucifron
    'MCMagmadar': 11982,        # Magmadar
    'MCGehennas': 12259,        # Gehennas
    'MCGarr': 12057,            # Garr
    'MCShazzrah': 12264,        # Shazzrah
    'MCGeddon': 12056,          # Baron Geddon
    'MCGolemagg': 11988,        # Golemagg the Incinerator
    'MCSulfuron': 12098,        # Sulfuron Harbinger
    'MCMajordomo': 12018,       # Majordomo Executus
    'MCRagnaros': 11502,        # Ragnaros

    # ===== Zul'Gurub (ZG) =====
    'ZGJeklik': 14517,          # High Priestess Jeklik
    'ZGVenoxis': 14507,         # High Priest Venoxis
    'ZGMarli': 14510,           # High Priestess Mar'li
    'ZGMandokir': 11382,        # Bloodlord Mandokir
    'ZGThekal': 14509,          # High Priest Thekal
    'ZGArlokk': 14515,          # High Priestess Arlokk
    'ZGHakkar': 14834,          # Hakkar
    'ZGJindo': 11380,           # Jin'do the Hexxer
    'ZGGahzranka': 15114,       # Gahz'ranka

    # ===== Ruins of Ahn'Qiraj (AQ20) =====
    'AQ20Kurinnaxx': 15348,     # Kurinnaxx
    'AQ20Rajaxx': 15341,        # General Rajaxx
    'AQ20Moam': 15340,          # Moam
    'AQ20Buru': 15370,          # Buru the Gorger
    'AQ20Ayamiss': 15369,       # Ayamiss the Hunter
    'AQ20Ossirian': 15339,      # Ossirian the Unscarred

    # ===== Temple of Ahn'Qiraj (AQ40) =====
    'AQ40Skeram': 15263,        # The Prophet Skeram
    'AQ40Vem': 15543,           # Princess Yauj (Bug Trio - Vem section)
    'AQ40Sartura': 15516,       # Battleguard Sartura
    'AQ40Fankriss': 15510,      # Fankriss the Unyielding
    'AQ40Viscidus': 15299,      # Viscidus
    'AQ40Huhuran': 15509,       # Princess Huhuran
    'AQ40Emperors': 15276,      # Emperor Vek'lor (Twin Emperors)
    'AQ40Ouro': 15517,          # Ouro
    'AQ40CThun': 15727,         # C'Thun
}


def generate_single_boss_section(lua_file_path: str, section_name: str,
                                  creature_id: int, db: LootDatabase,
                                  dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update a single-boss AtlasLoot section.

    Used for raid bosses that have their own dedicated sections
    (e.g., BWLFiremaw, MCRagnaros) without BabbleBoss headers.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "BWLFiremaw")
        creature_id: Creature entry ID from database
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing single-boss section: {section_name}")
    print(f"{'='*60}")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/4] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    # Verify section exists
    bounds = parser.find_section_bounds(section_name)
    if not bounds:
        print(f"✗ Section '{section_name}' not found in Lua file")
        return False

    print(f"✓ Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Get boss name for display
    boss_name = db.get_boss_name(creature_id)
    if boss_name:
        print(f"✓ Boss: {boss_name} (ID: {creature_id})")
    else:
        print(f"✓ Creature ID: {creature_id}")

    # Step 3: Query loot for this boss
    if verbose:
        print("\n[2/4] Querying loot table...")
    loot_items = db.get_boss_loot(creature_id)

    if not loot_items:
        print(f"⚠ No loot items found for creature {creature_id}")
        return False

    print(f"✓ Found {len(loot_items)} loot items")

    if verbose:
        for item in loot_items[:5]:
            print(f"  - {item['item_name']} ({item['item_id']})")
        if len(loot_items) > 5:
            print(f"  ... and {len(loot_items) - 5} more items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[3/4] Generating Lua code...")
    generator = LuaGenerator(section_name)
    new_lua_code = generator.generate_single_boss_section(loot_items)

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
        print("\n[4/4] Updating Lua file...")

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
        help='Dungeon name (stockades, deadmines, etc.) - multi-boss sections',
        choices=list(DUNGEON_SECTIONS.keys()) + ['all']
    )
    parser.add_argument(
        '--raid',
        help='Raid boss section (BWLFiremaw, MCRagnaros, etc.) - single-boss sections',
        choices=list(SINGLE_BOSS_SECTIONS.keys()) + ['all', 'bwl', 'mc', 'zg', 'aq20', 'aq40']
    )
    parser.add_argument(
        '--section',
        help='Specific AtlasLoot section name (auto-detects single vs multi-boss)'
    )
    parser.add_argument(
        '--lua-file',
        default='/workspace/project/Zeppelin-Craft/MPQ Staging/Patch-Z/Interface/AddOns/AtlasLoot_OriginalWoW/originalwow.lua',
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
    if not args.dungeon and not args.raid and not args.section:
        parser.error('Must specify --dungeon, --raid, or --section')

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

    success_count = 0
    total_count = 0

    # Handle --raid option (single-boss sections)
    if args.raid:
        single_boss_to_process = {}

        if args.raid == 'all':
            single_boss_to_process = SINGLE_BOSS_SECTIONS.copy()
        elif args.raid == 'bwl':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('BWL')}
        elif args.raid == 'mc':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('MC')}
        elif args.raid == 'zg':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('ZG')}
        elif args.raid == 'aq20':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ20')}
        elif args.raid == 'aq40':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ40')}
        else:
            creature_id = SINGLE_BOSS_SECTIONS.get(args.raid)
            if creature_id:
                single_boss_to_process = {args.raid: creature_id}
            else:
                print(f"✗ Unknown raid section: {args.raid}")
                db.disconnect()
                return 1

        total_count += len(single_boss_to_process)
        for section_name, creature_id in single_boss_to_process.items():
            success = generate_single_boss_section(
                args.lua_file, section_name, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --dungeon option (multi-boss sections)
    if args.dungeon:
        sections_to_process = []
        if args.dungeon == 'all':
            sections_to_process = list(DUNGEON_SECTIONS.values())
        else:
            section_name = DUNGEON_SECTIONS.get(args.dungeon)
            if section_name:
                sections_to_process.append(section_name)
            else:
                print(f"✗ Unknown dungeon: {args.dungeon}")
                db.disconnect()
                return 1

        total_count += len(sections_to_process)
        for section_name in sections_to_process:
            success = generate_section(
                args.lua_file, section_name, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --section option (auto-detect mode)
    if args.section:
        total_count += 1
        # Check if it's a known single-boss section
        if args.section in SINGLE_BOSS_SECTIONS:
            creature_id = SINGLE_BOSS_SECTIONS[args.section]
            success = generate_single_boss_section(
                args.lua_file, args.section, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        else:
            # Try as multi-boss section
            success = generate_section(
                args.lua_file, args.section, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        if success:
            success_count += 1

    # Disconnect database
    db.disconnect()

    # Summary
    print(f"\n{'='*60}")
    print(f"Summary: {success_count}/{total_count} sections processed successfully")
    print(f"{'='*60}")

    return 0 if success_count == total_count else 1


if __name__ == "__main__":
    sys.exit(main())
