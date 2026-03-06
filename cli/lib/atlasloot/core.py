"""
AtlasLoot Generator - Core Module
Generates AtlasLoot Lua tables from live AzerothCore database.

Migrated from Scripts/Patch Builder/AtlasLoot Generator/generate_atlasloot.py
into the CLI package. Call run() directly or use `zep build atlasloot`.
"""

import os
import json
import logging
from pathlib import Path
from typing import Tuple, Optional

from .lua_parser import AtlasLootParser
from .loot_query import LootDatabase
from .lua_generator import LuaGenerator
from .vendor_query import VendorDatabase
from .rep_generator import generate_faction_tables


# =============================================================================
# Logging Setup
# =============================================================================

def _setup_atlasloot_logger() -> logging.Logger:
    """Set up a dedicated file logger for the AtlasLoot generator.

    Log file: cli/logs/atlasloot_generator.log (overwritten each run)
    """
    _logger = logging.getLogger('atlasloot_generator')
    _logger.setLevel(logging.DEBUG)

    if _logger.handlers:
        return _logger

    log_dir = Path(__file__).parent.parent.parent / 'logs'
    log_dir.mkdir(parents=True, exist_ok=True)
    log_file = log_dir / 'atlasloot_generator.log'

    file_handler = logging.FileHandler(log_file, mode='w', encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    formatter = logging.Formatter(
        '%(asctime)s [%(levelname)s] %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )
    file_handler.setFormatter(formatter)
    _logger.addHandler(file_handler)
    _logger.propagate = False

    _logger.info("=" * 60)
    _logger.info("AtlasLoot Generator - Log Started")
    _logger.info("=" * 60)

    return _logger


logger = _setup_atlasloot_logger()


# =============================================================================
# Section Mappings
# =============================================================================

_MAPPINGS_FILE = Path(__file__).parent / 'data' / 'section_mappings.json'

with open(_MAPPINGS_FILE, 'r') as f:
    _mappings = json.load(f)


def _clean_mapping(d):
    return {k: v for k, v in d.items() if not k.startswith('_')}


DUNGEON_SECTIONS = _clean_mapping(_mappings['dungeon_sections'])
SINGLE_BOSS_SECTIONS = _clean_mapping(_mappings['single_boss_sections'])
TBC_SINGLE_BOSS_SECTIONS = _clean_mapping(_mappings['tbc_single_boss_sections'])
TBC_GAMEOBJECT_SECTIONS = _clean_mapping(_mappings['tbc_gameobject_sections'])
TBC_MULTI_SOURCE_SECTIONS = {k: v for k, v in _mappings.get('tbc_multi_source_sections', {}).items() if not k.startswith('_')}
VANILLA_MULTI_SOURCE_SECTIONS = {k: v for k, v in _mappings.get('vanilla_multi_source_sections', {}).items() if not k.startswith('_')}
SINGLE_BOSS_GO_SECTIONS = _clean_mapping(_mappings.get('single_boss_go_sections', {}))
REP_FACTIONS = _mappings.get('rep_factions', {})


# =============================================================================
# Instance Prefix Mapping
# =============================================================================

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


# =============================================================================
# Helper Functions
# =============================================================================

def get_display_name(section_name: str, boss_name: str = None) -> str:
    """Build a human-readable display name from section name and boss name."""
    is_heroic = section_name.endswith('HEROIC')
    base_section = section_name[:-6] if is_heroic else section_name

    instance_name = None
    for prefix, name in sorted(INSTANCE_PREFIXES.items(), key=lambda x: len(x[0]), reverse=True):
        if base_section.startswith(prefix):
            instance_name = name
            break

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

# Module-level reference set by run() — avoids passing it through every function
_TABLE_REGISTRY_FILE = None


def is_section_registered(section_name: str) -> bool:
    """Check if a section is registered in loottables.en.lua."""
    if not _TABLE_REGISTRY_FILE or not os.path.exists(_TABLE_REGISTRY_FILE):
        logger.warning(f"Table registry file not found: {_TABLE_REGISTRY_FILE}")
        return False

    import re
    pattern = rf'AtlasLoot_TableNames\["{re.escape(section_name)}"\]'

    with open(_TABLE_REGISTRY_FILE, 'r', encoding='utf-8') as f:
        content = f.read()
        return bool(re.search(pattern, content))


def register_section(section_name: str, display_name: str, addon_name: str,
                     is_heroic: bool = False, dry_run: bool = False) -> bool:
    """Register a new section in loottables.en.lua."""
    if not _TABLE_REGISTRY_FILE or not os.path.exists(_TABLE_REGISTRY_FILE):
        logger.error(f"Table registry file not found: {_TABLE_REGISTRY_FILE}")
        return False

    if is_heroic:
        reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ "{display_name} (Heroic)", "{addon_name}" }};'
    else:
        reg_line = f'\tAtlasLoot_TableNames["{section_name}"] = {{ "{display_name}", "{addon_name}" }};'

    if dry_run:
        logger.info(f"DRY RUN: Would register section '{section_name}' with line: {reg_line}")
        return True

    with open(_TABLE_REGISTRY_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    import re
    insert_idx = None

    if is_heroic:
        normal_section = section_name[:-6]
        pattern = rf'AtlasLoot_TableNames\["{re.escape(normal_section)}"\]'
        for i, line in enumerate(lines):
            if re.search(pattern, line):
                insert_idx = i + 1
                break

    if insert_idx is None:
        prefix = section_name[:8] if len(section_name) > 8 else section_name[:6]
        pattern = rf'AtlasLoot_TableNames\["{prefix}'
        for i, line in enumerate(lines):
            if re.search(pattern, line):
                insert_idx = i + 1

    if insert_idx is None:
        logger.error(f"Could not find insertion point for section '{section_name}' in table registry")
        return False

    lines.insert(insert_idx, reg_line + '\n')

    with open(_TABLE_REGISTRY_FILE, 'w', encoding='utf-8') as f:
        f.writelines(lines)

    logger.info(f"Registered section '{section_name}' in table registry at line {insert_idx}")
    return True


def ensure_section_registered(section_name: str, display_name: str, addon_name: str,
                              dry_run: bool = False) -> bool:
    """Ensure a section is registered in loottables.en.lua, adding if missing."""
    if is_section_registered(section_name):
        return True
    is_heroic = section_name.endswith('HEROIC')
    return register_section(section_name, display_name, addon_name, is_heroic, dry_run)


# =============================================================================
# Section Generation Functions
# =============================================================================

def generate_gameobject_section(lua_file_path: str, section_name: str,
                                 gameobject_entry: int, db: LootDatabase,
                                 dry_run: bool = False, verbose: bool = False) -> bool:
    """Generate and update an AtlasLoot section for gameobject (chest) loot."""
    logger.info(f"--- Processing gameobject section: {section_name} (GO entry: {gameobject_entry}) ---")

    parser = AtlasLootParser(lua_file_path)
    bounds = parser.find_section_bounds(section_name)
    section_created = False

    if not bounds:
        if section_name.endswith('HEROIC'):
            normal_section = section_name[:-6]
            if parser.section_exists(normal_section):
                logger.info(f"Creating new HEROIC chest section '{section_name}' after '{normal_section}'")
                parser.insert_section_after(normal_section, section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
        else:
            prefix = section_name[:6]
            all_sections = parser.get_all_sections()
            related = [s for s in all_sections if s.startswith(prefix)]
            if related:
                logger.info(f"Creating new chest section '{section_name}' after '{related[-1]}'")
                parser.insert_section_after(related[-1], section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)

        if not bounds:
            logger.error(f"FAILED: Could not create gameobject section '{section_name}'")
            return False

    if not section_created:
        logger.debug(f"Found existing section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    go_name = db.get_gameobject_name(gameobject_entry)
    if go_name:
        logger.info(f"Chest: {go_name} (ID: {gameobject_entry})")
    else:
        go_name = f"Chest {gameobject_entry}"
        logger.warning(f"No name found for gameobject {gameobject_entry}, using fallback")

    if section_created:
        addon_name = "AtlasLootBurningCrusade" if "BurningCrusade" in lua_file_path else "AtlasLootOriginalWoW"
        ensure_section_registered(section_name, go_name, addon_name, dry_run=dry_run)

    loot_items = db.get_gameobject_loot(gameobject_entry)
    if not loot_items:
        logger.warning(f"No loot items found for gameobject {gameobject_entry} in section '{section_name}'")
        return False

    logger.info(f"Found {len(loot_items)} loot items for gameobject {gameobject_entry}")

    display_name = get_display_name(section_name, go_name)
    generator = LuaGenerator(section_name, display_name, logger=logger)
    new_lua_code = generator.generate_single_boss_section(loot_items, boss_name=go_name)

    if dry_run:
        logger.info(f"DRY RUN: Skipped file update for section '{section_name}'")
        return True

    if parser.replace_section(section_name, new_lua_code):
        parser.save_file(backup=False)
        logger.info(f"SUCCESS: Section '{section_name}' updated ({len(loot_items)} items)")
        return True
    else:
        logger.error(f"FAILED: Could not update section '{section_name}'")
        return False


def generate_multi_source_section(lua_file_path: str, section_name: str,
                                  config: dict, db: LootDatabase,
                                  dry_run: bool = False, verbose: bool = False) -> bool:
    """Generate an AtlasLoot section that combines loot from multiple sources."""
    logger.info(f"--- Processing multi-source section: {section_name} ---")

    sources = config.get('sources', [])
    if not sources:
        logger.error(f"No sources defined for multi-source section '{section_name}'")
        return False

    parser = AtlasLootParser(lua_file_path)
    bounds = parser.find_section_bounds(section_name)
    if not bounds:
        logger.error(f"FAILED: Section '{section_name}' not found in Lua file")
        return False

    logger.debug(f"Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    sources_with_loot = []
    total_items = 0

    for source in sources:
        source_type = source.get('type')
        source_id = source.get('id')
        header = source.get('header', '')
        header_sub = source.get('header_sub', '')
        loot_items = []

        if source_type == 'creature':
            if section_name.endswith('HEROIC'):
                heroic_id = db.get_heroic_creature_id(source_id)
                if heroic_id:
                    source_id = heroic_id
            boss_name = db.get_boss_name(source_id)
            loot_items = db.get_boss_loot(source_id)
            logger.info(f"  Source '{header}' (creature {source_id}): {len(loot_items)} items")

        elif source_type == 'gameobject':
            go_name = db.get_gameobject_name(source_id)
            loot_items = db.get_gameobject_loot(source_id)
            logger.info(f"  Source '{header}' (gameobject {source_id}): {len(loot_items)} items")

        if loot_items:
            sources_with_loot.append({
                'header': header,
                'header_sub': header_sub,
                'loot_items': loot_items
            })
            total_items += len(loot_items)

    if not sources_with_loot:
        logger.warning(f"No loot items found for any source in section '{section_name}'")
        return False

    logger.info(f"Total: {total_items} items from {len(sources_with_loot)} sources")

    first_header = sources_with_loot[0].get('header', '') if sources_with_loot else None
    display_name = get_display_name(section_name, first_header)
    generator = LuaGenerator(section_name, display_name, logger=logger)
    new_lua_code = generator.generate_multi_source_section(sources_with_loot)

    if dry_run:
        logger.info(f"DRY RUN: Skipped file update for section '{section_name}'")
        return True

    if parser.replace_section(section_name, new_lua_code):
        parser.save_file(backup=False)
        logger.info(f"SUCCESS: Section '{section_name}' updated ({total_items} items from {len(sources_with_loot)} sources)")
        return True
    else:
        logger.error(f"FAILED: Could not update section '{section_name}'")
        return False


def generate_single_boss_section(lua_file_path: str, section_name: str,
                                  creature_id: int, db: LootDatabase,
                                  dry_run: bool = False, verbose: bool = False) -> bool:
    """Generate and update a single-boss AtlasLoot section."""
    logger.info(f"--- Processing single-boss section: {section_name} (creature: {creature_id}) ---")

    if section_name.endswith('HEROIC'):
        heroic_id = db.get_heroic_creature_id(creature_id)
        if heroic_id:
            logger.info(f"Heroic section: resolved creature {creature_id} -> heroic {heroic_id}")
            creature_id = heroic_id
        else:
            logger.warning(f"No heroic creature ID found for {creature_id}, using normal loot")

    parser = AtlasLootParser(lua_file_path)
    bounds = parser.find_section_bounds(section_name)
    section_created = False

    if not bounds:
        if section_name.endswith('HEROIC'):
            normal_section = section_name[:-6]
            if parser.section_exists(normal_section):
                logger.info(f"Creating new HEROIC section '{section_name}' after '{normal_section}'")
                parser.insert_section_after(normal_section, section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
        else:
            prefix = section_name[:8] if len(section_name) > 8 else section_name[:6]
            all_sections = parser.get_all_sections()
            related = [s for s in all_sections if s.startswith(prefix)]
            if related:
                logger.info(f"Creating new section '{section_name}' after '{related[-1]}'")
                parser.insert_section_after(related[-1], section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)
            else:
                tbc_sections = [s for s in all_sections if any(s.startswith(p) for p in
                    ['HC', 'CFR', 'Auch', 'CoT', 'TK', 'SMT', 'Kara', 'Gruul', 'BT', 'SP', 'ZA', 'Mount'])]
                if tbc_sections:
                    logger.info(f"Creating new section '{section_name}' after TBC section '{tbc_sections[-1]}'")
                    parser.insert_section_after(tbc_sections[-1], section_name,
                        '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                    section_created = True
                    bounds = parser.find_section_bounds(section_name)

        if not bounds:
            logger.error(f"FAILED: Section '{section_name}' not found and could not be created")
            return False

    if not section_created:
        logger.debug(f"Found existing section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    boss_name = db.get_boss_name(creature_id)
    if boss_name:
        logger.info(f"Boss: {boss_name} (ID: {creature_id})")
    else:
        boss_name = f"Boss {creature_id}"
        logger.warning(f"No name found for creature {creature_id}, using fallback")

    if section_created and boss_name:
        addon_name = "AtlasLootBurningCrusade" if "BurningCrusade" in lua_file_path else "AtlasLootOriginalWoW"
        ensure_section_registered(section_name, boss_name, addon_name, dry_run=dry_run)

    loot_items = db.get_boss_loot(creature_id)
    if not loot_items:
        logger.warning(f"No loot items found for creature {creature_id} in section '{section_name}'")
        return False

    logger.info(f"Found {len(loot_items)} loot items for creature {creature_id}")
    for item in loot_items:
        logger.debug(f"  Item: {item['item_name']} (ID: {item['item_id']}, Q{item['quality']}, "
                      f"chance: {item['drop_chance']:.1f}%, group: {item.get('group_id', 0)})")

    display_name = get_display_name(section_name, boss_name)
    generator = LuaGenerator(section_name, display_name, logger=logger)
    new_lua_code = generator.generate_single_boss_section(loot_items, boss_name=boss_name)

    if dry_run:
        logger.info(f"DRY RUN: Skipped file update for section '{section_name}'")
        return True

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        logger.error(f"FAILED: Could not replace section '{section_name}'")
        return False

    save_success = parser.save_file(backup=False)
    if save_success:
        logger.info(f"SUCCESS: Section '{section_name}' updated ({len(loot_items)} items, boss: {boss_name})")
        return True
    else:
        logger.error(f"FAILED: Could not save file after updating section '{section_name}'")
        return False


def generate_single_boss_go_section(lua_file_path: str, section_name: str,
                                     gameobject_id: int, db: LootDatabase,
                                     dry_run: bool = False, verbose: bool = False) -> bool:
    """Generate a single-boss section where loot comes from a gameobject."""
    logger.info(f"--- Processing single-boss GO section: {section_name} (GO: {gameobject_id}) ---")

    parser = AtlasLootParser(lua_file_path)
    bounds = parser.find_section_bounds(section_name)
    if not bounds:
        logger.error(f"FAILED: Section '{section_name}' not found in Lua file")
        return False

    logger.debug(f"Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    go_name = db.get_gameobject_name(gameobject_id)
    if go_name:
        logger.info(f"Gameobject: {go_name} (ID: {gameobject_id})")
    else:
        go_name = f"Gameobject {gameobject_id}"
        logger.warning(f"No name found for gameobject {gameobject_id}, using fallback")

    loot_items = db.get_gameobject_loot(gameobject_id)
    if not loot_items:
        logger.warning(f"No loot items found for gameobject {gameobject_id} in section '{section_name}'")
        return False

    logger.info(f"Found {len(loot_items)} loot items for gameobject {gameobject_id}")

    display_name = get_display_name(section_name, go_name)
    generator = LuaGenerator(section_name, display_name, logger=logger)
    new_lua_code = generator.generate_single_boss_section(loot_items, boss_name=go_name)

    if dry_run:
        logger.info(f"DRY RUN: Skipped file update for section '{section_name}'")
        return True

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        logger.error(f"FAILED: Could not replace section '{section_name}'")
        return False

    save_success = parser.save_file(backup=False)
    if save_success:
        logger.info(f"SUCCESS: Section '{section_name}' updated ({len(loot_items)} items, GO: {go_name})")
        return True
    else:
        logger.error(f"FAILED: Could not save file after updating section '{section_name}'")
        return False


def generate_section(lua_file_path: str, section_name: str, db: LootDatabase,
                    dry_run: bool = False, verbose: bool = False) -> bool:
    """Generate and update a multi-boss AtlasLoot section (uses BabbleBoss extraction)."""
    logger.info(f"--- Processing multi-boss section: {section_name} ---")

    parser = AtlasLootParser(lua_file_path)
    boss_names = parser.extract_boss_names(section_name)
    if not boss_names:
        logger.error(f"FAILED: No bosses found in section '{section_name}'")
        return False

    logger.info(f"Found {len(boss_names)} bosses: {', '.join(boss_names)}")

    creature_id_map = {}
    for boss_name in boss_names:
        creature_id = db.get_creature_id(boss_name)
        if creature_id:
            creature_id_map[boss_name] = creature_id
        else:
            logger.warning(f"Boss '{boss_name}' not found in database for section '{section_name}'")

    if not creature_id_map:
        logger.error(f"FAILED: No valid creature IDs found for section '{section_name}'")
        return False

    creature_ids = list(creature_id_map.values())
    loot_by_creature_id = db.get_all_bosses_loot(creature_ids)

    total_items = sum(len(items) for items in loot_by_creature_id.values())
    logger.info(f"Found {total_items} total loot items across {len(creature_id_map)} bosses")

    first_boss = boss_names[0] if boss_names else None
    display_name = get_display_name(section_name, first_boss)
    generator = LuaGenerator(section_name, display_name, logger=logger)
    new_lua_code = generator.generate_from_database_results(
        boss_names, loot_by_creature_id, creature_id_map
    )

    if dry_run:
        logger.info(f"DRY RUN: Skipped file update for section '{section_name}'")
        return True

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        logger.error(f"FAILED: Could not replace section '{section_name}'")
        return False

    save_success = parser.save_file(backup=False)
    if save_success:
        logger.info(f"SUCCESS: Section '{section_name}' updated ({total_items} items, {len(boss_names)} bosses)")
        return True
    else:
        logger.error(f"FAILED: Could not save file after updating section '{section_name}'")
        return False


# =============================================================================
# Reputation Vendor Generation
# =============================================================================

def generate_rep_factions(lua_file_path: str, expansion: str,
                          db: VendorDatabase, dry_run: bool = False,
                          verbose: bool = False,
                          faction_filter: str = None) -> Tuple[int, int]:
    """Generate AtlasLoot sections for reputation vendor factions.

    Args:
        lua_file_path: Path to the expansion's Lua file
        expansion: Expansion key in rep_factions config ('tbc', 'wotlk', 'vanilla')
        db: Connected VendorDatabase instance
        dry_run: Preview without writing
        verbose: Detailed output
        faction_filter: Optional specific faction section_base to generate (e.g., 'CExpedition')

    Returns:
        (success_count, fail_count)
    """
    factions = REP_FACTIONS.get(expansion, {})
    # Filter out comments
    factions = {k: v for k, v in factions.items() if not k.startswith('_') and isinstance(v, dict)}

    if faction_filter:
        if faction_filter in factions:
            factions = {faction_filter: factions[faction_filter]}
        else:
            logger.error(f"Unknown faction '{faction_filter}' in {expansion}")
            return (0, 1)

    back_menu_map = {
        'tbc': 'REPMENU_BURNINGCRUSADE',
        'wotlk': 'REPMENU_WOTLK',
        'vanilla': 'REPMENU_ORIGINALWOW',
    }
    back_menu = back_menu_map.get(expansion, 'REPMENU')

    success = 0
    fail = 0

    for section_base, config in factions.items():
        faction_id = config['faction_id']
        icon = config['icon']
        vendor_id = config.get('vendor_id')

        logger.info(f"--- Processing rep faction: {section_base} (faction {faction_id}) ---")

        items_by_rank = db.get_faction_vendor_items(faction_id, vendor_id)
        if not items_by_rank:
            logger.warning(f"No vendor items found for faction {faction_id} ({section_base})")
            fail += 1
            continue

        pages = generate_faction_tables(
            section_base=section_base,
            items_by_rank=items_by_rank,
            icon=icon,
            back_menu=back_menu,
        )

        if not pages:
            logger.error(f"Failed to generate tables for {section_base}")
            fail += 1
            continue

        if dry_run:
            for page in pages:
                logger.info(f"DRY RUN: Would write {page['section_name']} ({page['item_count']} items)")
                if verbose:
                    print(f"\n--- {page['section_name']} ---")
                    print(page['lua_code'])
            success += 1
            continue

        # Determine addon name for registration
        addon_name_map = {
            'tbc': 'AtlasLootBurningCrusade',
            'wotlk': 'AtlasLootWotLK',
            'vanilla': 'AtlasLootOriginalWoW',
        }
        addon_name = addon_name_map.get(expansion, 'AtlasLootBurningCrusade')
        faction_display = section_base.replace('CExpedition', 'Cenarion Expedition') \
            .replace('HonorHold', 'Honor Hold') \
            .replace('KeepersofTime', 'Keepers of Time') \
            .replace('LowerCity', 'Lower City') \
            .replace('ScaleSands', 'The Scale of the Sands') \
            .replace('SunOffensive', 'Shattered Sun Offensive') \
            .replace('VioletEye', 'The Violet Eye')

        # Write each page — reload parser after each save to keep content in sync
        all_pages_ok = True
        for page in pages:
            section_name = page['section_name']
            lua_code = page['lua_code']

            # Fresh parser for each page to avoid stale content after replacements
            parser = AtlasLootParser(lua_file_path)

            if parser.section_exists(section_name):
                if not parser.replace_section(section_name, lua_code):
                    logger.error(f"Failed to replace section '{section_name}'")
                    all_pages_ok = False
                    continue
            else:
                all_sections = parser.get_all_sections()
                related = [s for s in all_sections if s.startswith(section_base)]
                if related:
                    ref = related[-1]
                else:
                    faction_sections = []
                    for other_base in factions:
                        faction_sections.extend(s for s in all_sections if s.startswith(other_base))
                    ref = faction_sections[-1] if faction_sections else all_sections[-1] if all_sections else None

                if ref:
                    if not parser.insert_section_after(ref, section_name,
                                                       lua_code.split('\n', 1)[1].rsplit('\n', 1)[0] + '\n'):
                        logger.error(f"Failed to insert section '{section_name}'")
                        all_pages_ok = False
                        continue
                else:
                    logger.error(f"No reference section found for inserting '{section_name}'")
                    all_pages_ok = False
                    continue

            parser.save_file(backup=False)
            ensure_section_registered(section_name, faction_display, addon_name, dry_run=dry_run)

        if all_pages_ok:
            total_items = sum(p['item_count'] for p in pages)
            logger.info(f"SUCCESS: {section_base} - {len(pages)} page(s), {total_items} items")
            success += 1
        else:
            fail += 1

    return (success, fail)


# =============================================================================
# Main Entry Point
# =============================================================================

def run(addon_base_dir: Path, dry_run: bool = False,
        targets: Optional[dict] = None, verbose: bool = False) -> Tuple[int, int]:
    """Run AtlasLoot generation.

    Args:
        addon_base_dir: Path to AddOns directory (zpak source-assets/Interface/AddOns)
        dry_run: Preview without writing
        targets: Dict of what to generate. Keys: 'dungeon', 'raid', 'tbc', 'chest', 'section'.
                 Default (None) = generate all.
        verbose: Detailed output

    Returns:
        (success_count, fail_count)
    """
    global _TABLE_REGISTRY_FILE

    addon_base_dir = Path(addon_base_dir)
    vanilla_lua_file = str(addon_base_dir / 'AtlasLoot_OriginalWoW' / 'originalwow.lua')
    tbc_lua_file = str(addon_base_dir / 'AtlasLoot_BurningCrusade' / 'burningcrusade.lua')
    _TABLE_REGISTRY_FILE = str(addon_base_dir / 'AtlasLoot' / 'TableRegister' / 'loottables.en.lua')

    # Add console output when verbose
    _stream_handler = None
    if verbose:
        _stream_handler = logging.StreamHandler()
        _stream_handler.setLevel(logging.INFO)
        _stream_handler.setFormatter(logging.Formatter('[%(levelname)s] %(message)s'))
        logger.addHandler(_stream_handler)

    # Default to all if no targets specified
    if targets is None:
        targets = {'dungeon': 'all', 'raid': 'all', 'tbc': 'all', 'chest': 'all'}

    # Verify Lua files exist
    if not os.path.exists(vanilla_lua_file):
        logger.error(f"Vanilla Lua file not found: {vanilla_lua_file}")
        if _stream_handler:
            logger.removeHandler(_stream_handler)
        return (0, 1)

    logger.info(f"Run configuration: targets={targets}, dry_run={dry_run}")

    # Connect to database
    db = LootDatabase()
    if not db.connect():
        logger.error("Failed to connect to database")
        if _stream_handler:
            logger.removeHandler(_stream_handler)
        return (0, 1)
    logger.info("Database connected")

    success_count = 0
    total_count = 0

    # Handle raid option (single-boss sections)
    raid_target = targets.get('raid')
    if raid_target:
        single_boss_to_process = {}

        if raid_target == 'all':
            single_boss_to_process = SINGLE_BOSS_SECTIONS.copy()
        elif raid_target == 'bwl':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('BWL')}
        elif raid_target == 'mc':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('MC')}
        elif raid_target == 'zg':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('ZG')}
        elif raid_target == 'aq20':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ20')}
        elif raid_target == 'aq40':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ40')}
        elif raid_target == 'naxx40':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('Naxx40')}
        else:
            creature_id = SINGLE_BOSS_SECTIONS.get(raid_target)
            if creature_id:
                single_boss_to_process = {raid_target: creature_id}

        total_count += len(single_boss_to_process)
        for section_name, creature_id in single_boss_to_process.items():
            success = generate_single_boss_section(
                vanilla_lua_file, section_name, creature_id, db,
                dry_run=dry_run, verbose=verbose
            )
            if success:
                success_count += 1

    # Handle tbc option
    tbc_target = targets.get('tbc')
    if tbc_target:
        if not os.path.exists(tbc_lua_file):
            logger.error(f"TBC Lua file not found: {tbc_lua_file}")
        else:
            tbc_to_process = {}

            if tbc_target == 'all':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if v != 0}
            elif tbc_target == 'ramparts':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCRamp')}
            elif tbc_target == 'furnace':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCFurnace')}
            elif tbc_target == 'halls':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCHalls')}
            elif tbc_target == 'slavepens':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSlave')}
            elif tbc_target == 'underbog':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRUnder')}
            elif tbc_target == 'steamvault':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSteam')}
            elif tbc_target == 'manatomb':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchMana')}
            elif tbc_target == 'crypts':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchCrypts')}
            elif tbc_target == 'sethekk':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchSethekk')}
            elif tbc_target == 'shadowlab':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchShadow')}
            elif tbc_target == 'hillsbrad':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTHillsbrad')}
            elif tbc_target == 'morass':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTMorass')}
            elif tbc_target == 'mechanar':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKMech')}
            elif tbc_target == 'botanica':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKBot')}
            elif tbc_target == 'arcatraz':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKArc')}
            elif tbc_target == 'mgt':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SMT')}
            elif tbc_target == 'kara':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Kara') and v != 0}
            elif tbc_target == 'gruul':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Gruul')}
            elif tbc_target == 'magtheridon':
                tbc_to_process = {'HCMagtheridon': TBC_SINGLE_BOSS_SECTIONS.get('HCMagtheridon', 0)}
            elif tbc_target == 'ssc':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSerpent')}
            elif tbc_target == 'tk':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKEye')}
            elif tbc_target == 'hyjal':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('MountHyjal')}
            elif tbc_target == 'bt':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('BT')}
            elif tbc_target == 'sunwell':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SP')}
            elif tbc_target == 'za':
                tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('ZA')}
            else:
                creature_id = TBC_SINGLE_BOSS_SECTIONS.get(tbc_target)
                if creature_id is not None and creature_id != 0:
                    tbc_to_process = {tbc_target: creature_id}

            # First, process any multi-source sections
            multi_source_to_process = {k: v for k, v in TBC_MULTI_SOURCE_SECTIONS.items()
                                       if k in tbc_to_process}
            for section_name, config in multi_source_to_process.items():
                total_count += 1
                success = generate_multi_source_section(
                    tbc_lua_file, section_name, config, db,
                    dry_run=dry_run, verbose=verbose
                )
                if success:
                    success_count += 1

            # Then process remaining single-boss sections
            remaining = {k: v for k, v in tbc_to_process.items()
                         if k not in TBC_MULTI_SOURCE_SECTIONS}
            total_count += len(remaining)
            for section_name, creature_id in remaining.items():
                success = generate_single_boss_section(
                    tbc_lua_file, section_name, creature_id, db,
                    dry_run=dry_run, verbose=verbose
                )
                if success:
                    success_count += 1

    # Handle chest option (gameobject loot sections)
    chest_target = targets.get('chest')
    if chest_target:
        if not os.path.exists(tbc_lua_file):
            logger.error(f"TBC Lua file not found: {tbc_lua_file}")
        else:
            chests_to_process = {}

            if chest_target == 'all':
                chests_to_process = dict(TBC_GAMEOBJECT_SECTIONS)
            elif chest_target == 'ramparts':
                chests_to_process = {k: v for k, v in TBC_GAMEOBJECT_SECTIONS.items() if k.startswith('HCRamp')}
            elif chest_target == 'sethekk':
                chests_to_process = {k: v for k, v in TBC_GAMEOBJECT_SECTIONS.items() if k.startswith('AuchSethekk')}
            else:
                go_entry = TBC_GAMEOBJECT_SECTIONS.get(chest_target)
                if go_entry:
                    chests_to_process = {chest_target: go_entry}

            total_count += len(chests_to_process)
            for section_name, go_entry in chests_to_process.items():
                success = generate_gameobject_section(
                    tbc_lua_file, section_name, go_entry, db,
                    dry_run=dry_run, verbose=verbose
                )
                if success:
                    success_count += 1

    # Handle dungeon option (multi-boss sections)
    dungeon_target = targets.get('dungeon')
    if dungeon_target:
        sections_to_process = []
        if dungeon_target == 'all':
            sections_to_process = list(DUNGEON_SECTIONS.values())
        else:
            section_name = DUNGEON_SECTIONS.get(dungeon_target)
            if section_name:
                sections_to_process.append(section_name)

        total_count += len(sections_to_process)
        for section_name in sections_to_process:
            if section_name in SINGLE_BOSS_GO_SECTIONS:
                gameobject_id = SINGLE_BOSS_GO_SECTIONS[section_name]
                success = generate_single_boss_go_section(
                    vanilla_lua_file, section_name, gameobject_id, db,
                    dry_run=dry_run, verbose=verbose
                )
            elif section_name in VANILLA_MULTI_SOURCE_SECTIONS:
                config = VANILLA_MULTI_SOURCE_SECTIONS[section_name]
                success = generate_multi_source_section(
                    vanilla_lua_file, section_name, config, db,
                    dry_run=dry_run, verbose=verbose
                )
            elif section_name in SINGLE_BOSS_SECTIONS:
                creature_id = SINGLE_BOSS_SECTIONS[section_name]
                success = generate_single_boss_section(
                    vanilla_lua_file, section_name, creature_id, db,
                    dry_run=dry_run, verbose=verbose
                )
            else:
                success = generate_section(
                    vanilla_lua_file, section_name, db,
                    dry_run=dry_run, verbose=verbose
                )
            if success:
                success_count += 1

    # Handle section option (auto-detect mode)
    section_target = targets.get('section')
    if section_target:
        total_count += 1
        if section_target in SINGLE_BOSS_GO_SECTIONS:
            gameobject_id = SINGLE_BOSS_GO_SECTIONS[section_target]
            success = generate_single_boss_go_section(
                vanilla_lua_file, section_target, gameobject_id, db,
                dry_run=dry_run, verbose=verbose
            )
        elif section_target in VANILLA_MULTI_SOURCE_SECTIONS:
            config = VANILLA_MULTI_SOURCE_SECTIONS[section_target]
            success = generate_multi_source_section(
                vanilla_lua_file, section_target, config, db,
                dry_run=dry_run, verbose=verbose
            )
        elif section_target in SINGLE_BOSS_SECTIONS:
            creature_id = SINGLE_BOSS_SECTIONS[section_target]
            success = generate_single_boss_section(
                vanilla_lua_file, section_target, creature_id, db,
                dry_run=dry_run, verbose=verbose
            )
        elif section_target in TBC_SINGLE_BOSS_SECTIONS:
            creature_id = TBC_SINGLE_BOSS_SECTIONS[section_target]
            if creature_id == 0:
                logger.warning(f"Section '{section_target}' has no creature loot (creature_id=0)")
                success = False
            else:
                success = generate_single_boss_section(
                    tbc_lua_file, section_target, creature_id, db,
                    dry_run=dry_run, verbose=verbose
                )
        else:
            success = generate_section(
                vanilla_lua_file, section_target, db,
                dry_run=dry_run, verbose=verbose
            )
        if success:
            success_count += 1

    # Handle rep option (faction reputation vendors)
    rep_target = targets.get('rep')
    if rep_target:
        vdb = VendorDatabase()
        if not vdb.connect():
            logger.error("Failed to connect to database for rep vendor queries")
        else:
            # Determine expansion and optional faction filter
            if rep_target == 'all' or rep_target == 'tbc':
                rep_success, rep_fail = generate_rep_factions(
                    tbc_lua_file, 'tbc', vdb, dry_run=dry_run, verbose=verbose)
                success_count += rep_success
                total_count += rep_success + rep_fail
            elif rep_target in REP_FACTIONS.get('tbc', {}):
                rep_success, rep_fail = generate_rep_factions(
                    tbc_lua_file, 'tbc', vdb, dry_run=dry_run, verbose=verbose,
                    faction_filter=rep_target)
                success_count += rep_success
                total_count += rep_success + rep_fail
            else:
                logger.warning(f"Unknown rep target: {rep_target}")
            vdb.disconnect()

    # Disconnect database
    db.disconnect()

    # Summary
    fail_count = total_count - success_count
    logger.info("=" * 60)
    logger.info(f"SUMMARY: {success_count}/{total_count} sections processed successfully")
    if fail_count > 0:
        logger.warning(f"  {fail_count} section(s) failed")
    logger.info("=" * 60)

    # Clean up verbose stream handler
    if _stream_handler:
        logger.removeHandler(_stream_handler)

    return (success_count, fail_count)
