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
import json
from dotenv import load_dotenv

# Load .env from Patch Builder directory (parent of AtlasLoot Generator)
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PATCH_BUILDER_DIR = os.path.dirname(SCRIPT_DIR)
load_dotenv(os.path.join(PATCH_BUILDER_DIR, '.env'))

# Import our modules
from lua_parser import AtlasLootParser
from loot_query import LootDatabase
from lua_generator import LuaGenerator

# Path configuration - try .env first, fall back to Linux/Docker path if not found
_env_base = os.getenv('BASE_DIRECTORY', '')
_linux_base = '/workspace/project'

# Test which base directory exists
def _get_base_directory():
    if _env_base and os.path.isdir(os.path.join(_env_base, 'Zeppelin-Craft')):
        return _env_base
    if os.path.isdir(os.path.join(_linux_base, 'Zeppelin-Craft')):
        return _linux_base
    # Fallback to env if set, else linux default
    return _env_base if _env_base else _linux_base

BASE_DIRECTORY = _get_base_directory()
ADDON_BASE_DIR = os.path.join(BASE_DIRECTORY, 'Zeppelin-Craft', 'MPQ Staging', 'Patch-Z', 'Interface', 'AddOns')

VANILLA_LUA_FILE = os.path.join(ADDON_BASE_DIR, 'AtlasLoot_OriginalWoW', 'originalwow.lua')
TBC_LUA_FILE = os.path.join(ADDON_BASE_DIR, 'AtlasLoot_BurningCrusade', 'burningcrusade.lua')
TABLE_REGISTRY_FILE = os.path.join(ADDON_BASE_DIR, 'AtlasLoot', 'TableRegister', 'loottables.en.lua')

# Load section mappings from JSON
MAPPINGS_FILE = os.path.join(SCRIPT_DIR, 'section_mappings.json')
with open(MAPPINGS_FILE, 'r') as f:
    _mappings = json.load(f)

# Remove comment keys from mappings
def _clean_mapping(d):
    return {k: v for k, v in d.items() if not k.startswith('_')}

DUNGEON_SECTIONS = _clean_mapping(_mappings['dungeon_sections'])
SINGLE_BOSS_SECTIONS = _clean_mapping(_mappings['single_boss_sections'])
TBC_SINGLE_BOSS_SECTIONS = _clean_mapping(_mappings['tbc_single_boss_sections'])
TBC_GAMEOBJECT_SECTIONS = _clean_mapping(_mappings['tbc_gameobject_sections'])
TBC_MULTI_SOURCE_SECTIONS = _mappings.get('tbc_multi_source_sections', {})
# Clean comment keys from multi-source sections
TBC_MULTI_SOURCE_SECTIONS = {k: v for k, v in TBC_MULTI_SOURCE_SECTIONS.items() if not k.startswith('_')}

VANILLA_MULTI_SOURCE_SECTIONS = _mappings.get('vanilla_multi_source_sections', {})
VANILLA_MULTI_SOURCE_SECTIONS = {k: v for k, v in VANILLA_MULTI_SOURCE_SECTIONS.items() if not k.startswith('_')}

# Single boss sections where loot comes from a gameobject (e.g., Majordomo -> Cache of the Firelord)
SINGLE_BOSS_GO_SECTIONS = _clean_mapping(_mappings.get('single_boss_go_sections', {}))

# Instance prefix to display name mapping for cleaner warning output
INSTANCE_PREFIXES = {
    # Vanilla Dungeons
    'BRD': 'Blackrock Depths',
    'LBRS': 'Lower Blackrock Spire',
    'UBRS': 'Upper Blackrock Spire',
    'Scholo': 'Scholomance',
    'Strat': 'Stratholme',
    'DM': 'Dire Maul',
    'SM': 'Scarlet Monastery',
    'VC': 'Deadmines',
    'ST': 'Sunken Temple',
    'ZF': 'Zul\'Farrak',
    'Uld': 'Uldaman',
    # Vanilla Raids
    'MC': 'Molten Core',
    'BWL': 'Blackwing Lair',
    'ZG': 'Zul\'Gurub',
    'AQ20': 'Ruins of Ahn\'Qiraj',
    'AQ40': 'Temple of Ahn\'Qiraj',
    'Naxx40': 'Naxxramas (Original)',
    # TBC Dungeons
    'HCRamp': 'Hellfire Ramparts',
    'HCFurnace': 'Blood Furnace',
    'HCHalls': 'Shattered Halls',
    'CFRSlave': 'Slave Pens',
    'CFRUnder': 'Underbog',
    'CFRSteam': 'Steamvault',
    'AuchMana': 'Mana-Tombs',
    'AuchCrypts': 'Auchenai Crypts',
    'AuchSethekk': 'Sethekk Halls',
    'AuchShadow': 'Shadow Labyrinth',
    'CoTHillsbrad': 'Old Hillsbrad',
    'CoTMorass': 'Black Morass',
    'TKMech': 'Mechanar',
    'TKBot': 'Botanica',
    'TKArc': 'Arcatraz',
    'SMT': 'Magister\'s Terrace',
    # TBC Raids
    'Kara': 'Karazhan',
    'Gruul': 'Gruul\'s Lair',
    'Magtheridon': 'Magtheridon\'s Lair',
    'SSC': 'Serpentshrine Cavern',
    'TKEye': 'Tempest Keep',
    'MountHyjal': 'Mount Hyjal',
    'BT': 'Black Temple',
    'SP': 'Sunwell Plateau',
    'ZA': 'Zul\'Aman',
}


def get_display_name(section_name: str, boss_name: str = None) -> str:
    """
    Build a human-readable display name from section name and boss name.

    Args:
        section_name: AtlasLoot section name (e.g., "TKBotSplinter")
        boss_name: Boss name from database (e.g., "Warp Splinter")

    Returns:
        Friendly display name (e.g., "Botanica - Warp Splinter")
    """
    # Check for HEROIC suffix
    is_heroic = section_name.endswith('HEROIC')
    base_section = section_name[:-6] if is_heroic else section_name

    # Find matching instance prefix
    instance_name = None
    for prefix, name in INSTANCE_PREFIXES.items():
        if base_section.startswith(prefix):
            instance_name = name
            break

    # Build display name
    if instance_name and boss_name:
        display = f"{instance_name} - {boss_name}"
    elif instance_name:
        display = f"{instance_name} - {base_section}"
    elif boss_name:
        display = boss_name
    else:
        display = section_name

    if is_heroic:
        display += " (Heroic)"

    return display


# =============================================================================
# Table Registry Management (loottables.en.lua)
# =============================================================================

def is_section_registered(section_name: str) -> bool:
    """
    Check if a section is registered in loottables.en.lua.

    Args:
        section_name: Section name to check (e.g., "HCFurnaceBroggok")

    Returns:
        True if section is registered, False otherwise
    """
    if not os.path.exists(TABLE_REGISTRY_FILE):
        print(f"[WARN] Table registry file not found: {TABLE_REGISTRY_FILE}")
        return False

    import re
    pattern = rf'AtlasLoot_TableNames\["{re.escape(section_name)}"\]'

    with open(TABLE_REGISTRY_FILE, 'r', encoding='utf-8') as f:
        content = f.read()
        return bool(re.search(pattern, content))


def register_section(section_name: str, display_name: str, addon_name: str,
                     is_heroic: bool = False, use_babble_boss: bool = True,
                     dry_run: bool = False) -> bool:
    """
    Register a new section in loottables.en.lua.

    Args:
        section_name: Section name (e.g., "HCFurnaceBroggokHEROIC")
        display_name: Display name (boss name for BabbleBoss, or plain string)
        addon_name: AtlasLoot addon name (e.g., "AtlasLootBurningCrusade")
        is_heroic: If True, append "(Heroic)" to the display name
        use_babble_boss: If True, wrap display_name in BabbleBoss[]; False for plain string
        dry_run: If True, don't actually modify the file

    Returns:
        True if successful, False otherwise
    """
    if not os.path.exists(TABLE_REGISTRY_FILE):
        print(f"[ERROR] Table registry file not found: {TABLE_REGISTRY_FILE}")
        return False

    # Build the registration line
    if use_babble_boss:
        if is_heroic:
            reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ BabbleBoss["{display_name}"].." ("..AL["Heroic"]..")", "{addon_name}" }};'
        else:
            reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ BabbleBoss["{display_name}"], "{addon_name}" }};'
    else:
        # Plain string for chests/gameobjects
        if is_heroic:
            reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ "{display_name} (Heroic)", "{addon_name}" }};'
        else:
            reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ "{display_name}", "{addon_name}" }};'

    if dry_run:
        print(f"[DRY RUN] Would register: {section_name}")
        print(f"  Line: {reg_line}")
        return True

    # Read current content
    with open(TABLE_REGISTRY_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # Find where to insert (after the normal version if HEROIC, or after related sections)
    insert_idx = None
    import re

    if is_heroic:
        # For HEROIC, find the normal version and insert after it
        normal_section = section_name[:-6]  # Remove 'HEROIC'
        pattern = rf'AtlasLoot_TableNames\["{re.escape(normal_section)}"\]'
        for i, line in enumerate(lines):
            if re.search(pattern, line):
                insert_idx = i + 1
                break

    if insert_idx is None:
        # Find related sections by prefix (e.g., HCFurnace, AuchMana)
        prefix = section_name[:8] if len(section_name) > 8 else section_name[:6]
        pattern = rf'AtlasLoot_TableNames\["{prefix}'
        for i, line in enumerate(lines):
            if re.search(pattern, line):
                insert_idx = i + 1  # Keep updating to get the last one

    if insert_idx is None:
        print(f"[ERROR] Could not find insertion point for {section_name}")
        return False

    # Insert the new registration
    lines.insert(insert_idx, reg_line + '\n')

    # Write back
    with open(TABLE_REGISTRY_FILE, 'w', encoding='utf-8') as f:
        f.writelines(lines)

    print(f"[OK] Registered section '{section_name}' in table registry")
    return True


def ensure_section_registered(section_name: str, display_name: str, addon_name: str,
                              use_babble_boss: bool = True, dry_run: bool = False) -> bool:
    """
    Ensure a section is registered in loottables.en.lua, adding if missing.

    Args:
        section_name: Section name (e.g., "HCFurnaceBroggok")
        display_name: Display name (boss name for BabbleBoss, or plain string for chests)
        addon_name: AtlasLoot addon name (e.g., "AtlasLootBurningCrusade")
        use_babble_boss: If True, wrap display_name in BabbleBoss[]; False for plain string
        dry_run: If True, don't actually modify the file

    Returns:
        True if section is now registered, False on error
    """
    if is_section_registered(section_name):
        return True

    is_heroic = section_name.endswith('HEROIC')
    return register_section(section_name, display_name, addon_name, is_heroic, use_babble_boss, dry_run)


def generate_gameobject_section(lua_file_path: str, section_name: str,
                                 gameobject_entry: int, db: LootDatabase,
                                 dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update an AtlasLoot section for gameobject (chest) loot.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "HCRampReinforcedChest")
        gameobject_entry: Gameobject entry ID from database
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing gameobject section: {section_name}")
    print(f"{'='*60}")

    # Step 1: Parse Lua file
    parser = AtlasLootParser(lua_file_path)

    # Check if section exists, or create it
    bounds = parser.find_section_bounds(section_name)
    section_created = False

    if not bounds:
        # Try to find a reference section to insert after
        # For HEROIC, insert after normal. Otherwise insert after a boss section.
        if section_name.endswith('HEROIC'):
            normal_section = section_name[:-6]
            if parser.section_exists(normal_section):
                print(f"[OK] Creating new HEROIC chest section based on '{normal_section}'")
                parser.insert_section_after(normal_section, section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
        else:
            # Find a related section to insert after
            prefix = section_name[:6]  # e.g., "HCRamp"
            all_sections = parser.get_all_sections()
            related = [s for s in all_sections if s.startswith(prefix)]
            if related:
                print(f"[OK] Creating new chest section after '{related[-1]}'")
                parser.insert_section_after(related[-1], section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)

        if not bounds:
            print(f"[ERROR] Could not create section '{section_name}'")
            return False

    if not section_created:
        print(f"[OK] Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Get gameobject name
    go_name = db.get_gameobject_name(gameobject_entry)
    if go_name:
        print(f"[OK] Chest: {go_name} (ID: {gameobject_entry})")
    else:
        go_name = f"Chest {gameobject_entry}"
        print(f"[OK] Gameobject ID: {gameobject_entry}")

    # Ensure section is registered in table registry (if newly created)
    if section_created:
        # Determine addon name from lua file path
        addon_name = "AtlasLootBurningCrusade" if "BurningCrusade" in lua_file_path else "AtlasLootOriginalWoW"
        ensure_section_registered(section_name, go_name, addon_name,
                                  use_babble_boss=False, dry_run=dry_run)

    # Step 3: Query loot
    loot_items = db.get_gameobject_loot(gameobject_entry)

    if not loot_items:
        print(f"[WARN] No loot items found for gameobject {gameobject_entry}")
        return False

    print(f"[OK] Found {len(loot_items)} loot items")

    # Step 4: Generate Lua code
    display_name = get_display_name(section_name, go_name)
    generator = LuaGenerator(section_name, display_name)
    new_lua_code = generator.generate_single_boss_section(loot_items)

    print(f"\nGenerated code preview:")
    preview_lines = new_lua_code.split('\n')[:12]
    for line in preview_lines:
        print(f"\t{line}")
    if len(new_lua_code.split('\n')) > 12:
        print(f"... ({len(new_lua_code.split(chr(10))) - 12} more lines)")

    # Step 5: Update file
    if dry_run:
        print("\n[DRY RUN] Skipping file update")
        return True

    if parser.replace_section(section_name, new_lua_code):
        parser.save_file(backup=False)
        print(f"\n[OK] Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n[ERROR] Failed to update section '{section_name}'")
        return False


def generate_multi_source_section(lua_file_path: str, section_name: str,
                                  config: dict, db: LootDatabase,
                                  dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate an AtlasLoot section that combines loot from multiple sources.

    Used for encounters like Vazruden + Nazan + Chest that should display
    on a single page with BabbleBoss headers for each source.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "HCRampVazruden")
        config: Dict with 'sources' list containing source definitions
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing multi-source section: {section_name}")
    print(f"{'='*60}")

    sources = config.get('sources', [])
    if not sources:
        print(f"[ERROR] No sources defined for {section_name}")
        return False

    # Step 1: Parse Lua file
    parser = AtlasLootParser(lua_file_path)

    bounds = parser.find_section_bounds(section_name)
    if not bounds:
        print(f"[ERROR] Section '{section_name}' not found")
        return False

    print(f"[OK] Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Gather loot from all sources
    sources_with_loot = []
    total_items = 0

    for source in sources:
        source_type = source.get('type')
        source_id = source.get('id')
        header = source.get('header', '')
        header_sub = source.get('header_sub', '')

        loot_items = []

        if source_type == 'creature':
            # Check for heroic creature ID
            if section_name.endswith('HEROIC'):
                heroic_id = db.get_heroic_creature_id(source_id)
                if heroic_id:
                    source_id = heroic_id

            boss_name = db.get_boss_name(source_id)
            loot_items = db.get_boss_loot(source_id)
            print(f"[OK] {header} (creature {source_id}): {len(loot_items)} items")

        elif source_type == 'gameobject':
            go_name = db.get_gameobject_name(source_id)
            loot_items = db.get_gameobject_loot(source_id)
            print(f"[OK] {header} (gameobject {source_id}): {len(loot_items)} items")

        if loot_items:
            # Determine if header uses BabbleBoss or AL
            # Default: creatures use BabbleBoss, gameobjects use AL
            # Can be overridden with is_babble in config
            is_babble = source.get('is_babble', source_type == 'creature')
            sources_with_loot.append({
                'header': header,
                'header_sub': header_sub,
                'is_babble': is_babble,
                'loot_items': loot_items
            })
            total_items += len(loot_items)

    if not sources_with_loot:
        print(f"[WARN] No loot items found for any source in {section_name}")
        return False

    print(f"[OK] Total: {total_items} items from {len(sources_with_loot)} sources")

    # Step 3: Generate Lua code
    # Use first source's header as the main name for display
    first_header = sources_with_loot[0].get('header', '') if sources_with_loot else None
    display_name = get_display_name(section_name, first_header)
    generator = LuaGenerator(section_name, display_name)
    new_lua_code = generator.generate_multi_source_section(sources_with_loot)

    print(f"\nGenerated code preview:")
    preview_lines = new_lua_code.split('\n')[:15]
    for line in preview_lines:
        print(line)
    if len(new_lua_code.split('\n')) > 15:
        print(f"... ({len(new_lua_code.split(chr(10))) - 15} more lines)")

    # Step 4: Update file
    if dry_run:
        print("\n[DRY RUN] Skipping file update")
        return True

    if parser.replace_section(section_name, new_lua_code):
        parser.save_file(backup=False)
        print(f"\n[OK] Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n[ERROR] Failed to update section '{section_name}'")
        return False


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

    # For HEROIC sections, look up the heroic creature ID (difficulty_entry_1)
    if section_name.endswith('HEROIC'):
        heroic_id = db.get_heroic_creature_id(creature_id)
        if heroic_id:
            print(f"[OK] Heroic section detected: using heroic creature ID {heroic_id} (was {creature_id})")
            creature_id = heroic_id
        else:
            print(f"[WARN] Warning: No heroic creature ID found for {creature_id}, using normal loot")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/4] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    # Verify section exists, or create it
    bounds = parser.find_section_bounds(section_name)
    section_created = False
    if not bounds:
        # For HEROIC sections, try to create the section after the normal version
        if section_name.endswith('HEROIC'):
            normal_section = section_name[:-6]  # Remove 'HEROIC' suffix
            if parser.section_exists(normal_section):
                print(f"[OK] Creating new HEROIC section after '{normal_section}'")
                parser.insert_section_after(normal_section, section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
        else:
            # For normal sections, find a related section to insert after
            # Use prefix matching (e.g., HCFurnace, TKBot, etc.)
            prefix = section_name[:8] if len(section_name) > 8 else section_name[:6]
            all_sections = parser.get_all_sections()
            related = [s for s in all_sections if s.startswith(prefix)]
            if related:
                # Insert after the last related section
                print(f"[OK] Creating new section '{section_name}' after '{related[-1]}'")
                parser.insert_section_after(related[-1], section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
            else:
                # No related section found, try inserting after any TBC section
                tbc_sections = [s for s in all_sections if any(s.startswith(p) for p in
                    ['HC', 'CFR', 'Auch', 'CoT', 'TK', 'SMT', 'Kara', 'Gruul', 'BT', 'SP', 'ZA', 'Mount'])]
                if tbc_sections:
                    print(f"[OK] Creating new section '{section_name}' after '{tbc_sections[-1]}'")
                    parser.insert_section_after(tbc_sections[-1], section_name,
                        '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                    section_created = True
                    bounds = parser.find_section_bounds(section_name)

        if not bounds:
            print(f"[ERROR] Section '{section_name}' not found and could not be created")
            return False

    if not section_created:
        print(f"[OK] Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Get boss name for display
    boss_name = db.get_boss_name(creature_id)
    if boss_name:
        print(f"[OK] Boss: {boss_name} (ID: {creature_id})")
    else:
        boss_name = f"Boss {creature_id}"
        print(f"[OK] Creature ID: {creature_id}")

    # Ensure section is registered in table registry (if newly created)
    if section_created and boss_name:
        # Determine addon name from lua file path
        addon_name = "AtlasLootBurningCrusade" if "BurningCrusade" in lua_file_path else "AtlasLootOriginalWoW"
        ensure_section_registered(section_name, boss_name, addon_name,
                                  use_babble_boss=True, dry_run=dry_run)

    # Step 3: Query loot for this boss
    if verbose:
        print("\n[2/4] Querying loot table...")
    loot_items = db.get_boss_loot(creature_id)

    if not loot_items:
        print(f"[WARN] No loot items found for creature {creature_id}")
        return False

    print(f"[OK] Found {len(loot_items)} loot items")

    if verbose:
        for item in loot_items[:5]:
            print(f"  - {item['item_name']} ({item['item_id']})")
        if len(loot_items) > 5:
            print(f"  ... and {len(loot_items) - 5} more items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[3/4] Generating Lua code...")
    display_name = get_display_name(section_name, boss_name)
    generator = LuaGenerator(section_name, display_name)
    new_lua_code = generator.generate_single_boss_section(loot_items)

    if verbose:
        print(f"[OK] Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

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
        print(f"[ERROR] Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=False)
    if save_success:
        print(f"\n[OK] Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n[ERROR] Failed to save file")
        return False


def generate_single_boss_go_section(lua_file_path: str, section_name: str,
                                     gameobject_id: int, db: LootDatabase,
                                     dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update a single-boss AtlasLoot section where loot comes from a gameobject.

    Used for bosses like Majordomo where the boss doesn't drop loot directly,
    but loot spawns in a chest/cache after defeat. Uses single-boss layout
    with Guaranteed/Variable/Pool headers.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "MCMajordomo")
        gameobject_id: Gameobject entry ID from database
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing single-boss GO section: {section_name}")
    print(f"{'='*60}")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/4] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    bounds = parser.find_section_bounds(section_name)
    if not bounds:
        print(f"[ERROR] Section '{section_name}' not found")
        return False

    print(f"[OK] Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Get gameobject name for display
    go_name = db.get_gameobject_name(gameobject_id)
    if go_name:
        print(f"[OK] Gameobject: {go_name} (ID: {gameobject_id})")
    else:
        go_name = f"Gameobject {gameobject_id}"
        print(f"[OK] Gameobject ID: {gameobject_id}")

    # Step 3: Query loot from gameobject
    if verbose:
        print("\n[2/4] Querying gameobject loot table...")
    loot_items = db.get_gameobject_loot(gameobject_id)

    if not loot_items:
        print(f"[WARN] No loot items found for gameobject {gameobject_id}")
        return False

    print(f"[OK] Found {len(loot_items)} loot items")

    if verbose:
        for item in loot_items[:5]:
            print(f"  - {item['item_name']} ({item['item_id']})")
        if len(loot_items) > 5:
            print(f"  ... and {len(loot_items) - 5} more items")

    # Step 4: Generate new Lua code using single-boss format
    if verbose:
        print("\n[3/4] Generating Lua code...")
    display_name = get_display_name(section_name, go_name)
    generator = LuaGenerator(section_name, display_name)
    new_lua_code = generator.generate_single_boss_section(loot_items)

    if verbose:
        print(f"[OK] Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

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
        print(f"[ERROR] Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=False)
    if save_success:
        print(f"\n[OK] Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n[ERROR] Failed to save file")
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
        print(f"[ERROR] No bosses found in section '{section_name}'")
        return False

    print(f"[OK] Found {len(boss_names)} bosses: {', '.join(boss_names)}")

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
            print(f"[WARN] Warning: Boss '{boss_name}' not found in database")

    if not creature_id_map:
        print("[ERROR] No valid creature IDs found")
        return False

    # Step 3: Query loot for all bosses
    if verbose:
        print("\n[3/5] Querying loot tables...")
    creature_ids = list(creature_id_map.values())
    loot_by_creature_id = db.get_all_bosses_loot(creature_ids)

    total_items = sum(len(items) for items in loot_by_creature_id.values())
    print(f"[OK] Found {total_items} total loot items")

    if verbose:
        for boss_name, creature_id in creature_id_map.items():
            loot_count = len(loot_by_creature_id.get(creature_id, []))
            print(f"  {boss_name}: {loot_count} items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[4/5] Generating Lua code...")
    # Use first boss name for display
    first_boss = boss_names[0] if boss_names else None
    display_name = get_display_name(section_name, first_boss)
    generator = LuaGenerator(section_name, display_name)
    new_lua_code = generator.generate_from_database_results(
        boss_names, loot_by_creature_id, creature_id_map
    )

    if verbose:
        print(f"[OK] Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

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
        print(f"[ERROR] Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=False)
    if save_success:
        print(f"\n[OK] Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n[ERROR] Failed to save file")
        return False


def main():
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(
        description='Generate AtlasLoot tables from AzerothCore database'
    )
    parser.add_argument(
        '--all',
        action='store_true',
        help='Generate ALL AtlasLoot content (vanilla dungeons, vanilla raids, TBC)'
    )
    parser.add_argument(
        '--dungeon',
        help='Dungeon name (stockades, deadmines, etc.) - multi-boss sections',
        choices=list(DUNGEON_SECTIONS.keys()) + ['all']
    )
    parser.add_argument(
        '--raid',
        help='Vanilla raid boss section (BWLFiremaw, MCRagnaros, etc.) - single-boss sections',
        choices=list(SINGLE_BOSS_SECTIONS.keys()) + ['all', 'bwl', 'mc', 'zg', 'aq20', 'aq40', 'naxx40']
    )
    parser.add_argument(
        '--tbc',
        help='TBC dungeon/raid section - use "all" for everything, or filter by instance prefix',
        choices=list(TBC_SINGLE_BOSS_SECTIONS.keys()) + [
            'all',
            # Dungeons
            'ramparts', 'furnace', 'halls', 'slavepens', 'underbog', 'steamvault',
            'manatomb', 'crypts', 'sethekk', 'shadowlab', 'hillsbrad', 'morass',
            'mechanar', 'botanica', 'arcatraz', 'mgt',
            # Raids
            'kara', 'gruul', 'magtheridon', 'ssc', 'tk', 'hyjal', 'bt', 'sunwell', 'za'
        ]
    )
    parser.add_argument(
        '--chest',
        help='TBC chest/gameobject section (ramparts, botanica, sethekk, all)',
        choices=list(TBC_GAMEOBJECT_SECTIONS.keys()) + ['all', 'ramparts', 'sethekk']
    )
    parser.add_argument(
        '--section',
        help='Specific AtlasLoot section name (auto-detects single vs multi-boss)'
    )
    parser.add_argument(
        '--lua-file',
        default=VANILLA_LUA_FILE,
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

    # Default to --all if no arguments specified (for Patch Builder compatibility)
    if not args.all and not args.dungeon and not args.raid and not args.tbc and not args.chest and not args.section:
        args.all = True

    # --all flag sets all content types
    if args.all:
        args.dungeon = 'all'
        args.raid = 'all'
        args.tbc = 'all'
        args.chest = 'all'

    # Check if Lua file exists
    if not os.path.exists(args.lua_file):
        print(f"[ERROR] Error: Lua file not found: {args.lua_file}")
        return 1

    # Connect to database
    print("Connecting to database...")
    db = LootDatabase()
    if not db.connect():
        print("[ERROR] Failed to connect to database")
        return 1
    print("[OK] Database connected")

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
        elif args.raid == 'naxx40':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('Naxx40')}
        else:
            creature_id = SINGLE_BOSS_SECTIONS.get(args.raid)
            if creature_id:
                single_boss_to_process = {args.raid: creature_id}
            else:
                print(f"[ERROR] Unknown raid section: {args.raid}")
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

    # Handle --tbc option (TBC single-boss sections)
    if args.tbc:
        # TBC content uses burningcrusade.lua
        tbc_lua_file = TBC_LUA_FILE

        if not os.path.exists(tbc_lua_file):
            print(f"[ERROR] Error: TBC Lua file not found: {tbc_lua_file}")
            db.disconnect()
            return 1

        tbc_to_process = {}

        if args.tbc == 'all':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if v != 0}
        # Dungeons
        elif args.tbc == 'ramparts':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCRamp')}
        elif args.tbc == 'furnace':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCFurnace')}
        elif args.tbc == 'halls':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCHalls')}
        elif args.tbc == 'slavepens':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSlave')}
        elif args.tbc == 'underbog':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRUnder')}
        elif args.tbc == 'steamvault':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSteam')}
        elif args.tbc == 'manatomb':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchMana')}
        elif args.tbc == 'crypts':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchCrypts')}
        elif args.tbc == 'sethekk':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchSethekk')}
        elif args.tbc == 'shadowlab':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchShadow')}
        elif args.tbc == 'hillsbrad':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTHillsbrad')}
        elif args.tbc == 'morass':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTMorass')}
        elif args.tbc == 'mechanar':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKMech')}
        elif args.tbc == 'botanica':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKBot')}
        elif args.tbc == 'arcatraz':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKArc')}
        elif args.tbc == 'mgt':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SMT')}
        # Raids
        elif args.tbc == 'kara':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Kara') and v != 0}
        elif args.tbc == 'gruul':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Gruul')}
        elif args.tbc == 'magtheridon':
            tbc_to_process = {'HCMagtheridon': TBC_SINGLE_BOSS_SECTIONS['HCMagtheridon']}
        elif args.tbc == 'ssc':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSerpent')}
        elif args.tbc == 'tk':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKEye')}
        elif args.tbc == 'hyjal':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('MountHyjal')}
        elif args.tbc == 'bt':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('BT')}
        elif args.tbc == 'sunwell':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SP')}
        elif args.tbc == 'za':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('ZA')}
        else:
            # Specific section name
            creature_id = TBC_SINGLE_BOSS_SECTIONS.get(args.tbc)
            if creature_id is not None and creature_id != 0:
                tbc_to_process = {args.tbc: creature_id}
            elif creature_id == 0:
                print(f"[WARN] Section '{args.tbc}' has no creature loot (creature_id=0), skipping")
            else:
                print(f"[ERROR] Unknown TBC section: {args.tbc}")
                db.disconnect()
                return 1

        # First, process any multi-source sections
        multi_source_to_process = {k: v for k, v in TBC_MULTI_SOURCE_SECTIONS.items()
                                   if k in tbc_to_process}
        for section_name, config in multi_source_to_process.items():
            total_count += 1
            success = generate_multi_source_section(
                tbc_lua_file, section_name, config, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

        # Then process remaining single-boss sections (skip multi-source ones)
        remaining = {k: v for k, v in tbc_to_process.items()
                     if k not in TBC_MULTI_SOURCE_SECTIONS}
        total_count += len(remaining)
        for section_name, creature_id in remaining.items():
            success = generate_single_boss_section(
                tbc_lua_file, section_name, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --chest option (gameobject loot sections)
    if args.chest:
        tbc_lua_file = TBC_LUA_FILE

        if not os.path.exists(tbc_lua_file):
            print(f"[ERROR] Error: TBC Lua file not found: {tbc_lua_file}")
            db.disconnect()
            return 1

        chests_to_process = {}

        if args.chest == 'all':
            chests_to_process = dict(TBC_GAMEOBJECT_SECTIONS)
        elif args.chest == 'ramparts':
            chests_to_process = {k: v for k, v in TBC_GAMEOBJECT_SECTIONS.items() if k.startswith('HCRamp')}
        elif args.chest == 'sethekk':
            chests_to_process = {k: v for k, v in TBC_GAMEOBJECT_SECTIONS.items() if k.startswith('AuchSethekk')}
        else:
            # Specific section name
            go_entry = TBC_GAMEOBJECT_SECTIONS.get(args.chest)
            if go_entry:
                chests_to_process = {args.chest: go_entry}
            else:
                print(f"[ERROR] Unknown chest section: {args.chest}")
                db.disconnect()
                return 1

        total_count += len(chests_to_process)
        for section_name, go_entry in chests_to_process.items():
            success = generate_gameobject_section(
                tbc_lua_file, section_name, go_entry, db,
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
                print(f"[ERROR] Unknown dungeon: {args.dungeon}")
                db.disconnect()
                return 1

        total_count += len(sections_to_process)
        for section_name in sections_to_process:
            # Check if this is a single-boss GO section (e.g., MCMajordomo -> Cache of the Firelord)
            if section_name in SINGLE_BOSS_GO_SECTIONS:
                gameobject_id = SINGLE_BOSS_GO_SECTIONS[section_name]
                success = generate_single_boss_go_section(
                    args.lua_file, section_name, gameobject_id, db,
                    dry_run=args.dry_run, verbose=args.verbose
                )
            # Check if this is a vanilla multi-source section (e.g., VCSneed = Shredder + Sneed)
            elif section_name in VANILLA_MULTI_SOURCE_SECTIONS:
                config = VANILLA_MULTI_SOURCE_SECTIONS[section_name]
                success = generate_multi_source_section(
                    args.lua_file, section_name, config, db,
                    dry_run=args.dry_run, verbose=args.verbose
                )
            # Check if this is actually a single-boss section
            elif section_name in SINGLE_BOSS_SECTIONS:
                creature_id = SINGLE_BOSS_SECTIONS[section_name]
                success = generate_single_boss_section(
                    args.lua_file, section_name, creature_id, db,
                    dry_run=args.dry_run, verbose=args.verbose
                )
            else:
                success = generate_section(
                    args.lua_file, section_name, db,
                    dry_run=args.dry_run, verbose=args.verbose
                )
            if success:
                success_count += 1

    # Handle --section option (auto-detect mode)
    if args.section:
        total_count += 1
        # Check if it's a single-boss GO section (e.g., MCMajordomo -> Cache of the Firelord)
        if args.section in SINGLE_BOSS_GO_SECTIONS:
            gameobject_id = SINGLE_BOSS_GO_SECTIONS[args.section]
            success = generate_single_boss_go_section(
                args.lua_file, args.section, gameobject_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        # Check if it's a vanilla multi-source section (e.g., VCSneed = Shredder + Sneed)
        elif args.section in VANILLA_MULTI_SOURCE_SECTIONS:
            config = VANILLA_MULTI_SOURCE_SECTIONS[args.section]
            success = generate_multi_source_section(
                args.lua_file, args.section, config, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        # Check if it's a known single-boss section (vanilla)
        elif args.section in SINGLE_BOSS_SECTIONS:
            creature_id = SINGLE_BOSS_SECTIONS[args.section]
            success = generate_single_boss_section(
                args.lua_file, args.section, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        # Check if it's a TBC section
        elif args.section in TBC_SINGLE_BOSS_SECTIONS:
            creature_id = TBC_SINGLE_BOSS_SECTIONS[args.section]
            if creature_id == 0:
                print(f"[WARN] Section '{args.section}' has no creature loot (creature_id=0)")
                success = False
            else:
                success = generate_single_boss_section(
                    TBC_LUA_FILE, args.section, creature_id, db,
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

    # Return 0 if any sections processed successfully (partial success is acceptable)
    # Many sections fail expectedly due to different Lua formats, missing BabbleBoss entries, etc.
    return 0 if success_count > 0 else 1


if __name__ == "__main__":
    sys.exit(main())
