#!/usr/bin/env python3
"""
Fix column name mismatches in legacy DBC update SQL files.
Creates _fixed.sql versions with corrected column names.
"""

import re
import sys
from pathlib import Path

# Column name mappings: SQL file column -> actual DB column
# Built by comparing failed SQL files with actual database schema

COLUMN_MAPPINGS = {
    'charstartoutfit': {
        'ID': 'id',
        # itemId1-24 -> item_1-24
        **{f'itemId{i}': f'item_{i}' for i in range(1, 25)},
        # displayInfo1-24 -> display_item_1-24
        **{f'displayInfo{i}': f'display_item_{i}' for i in range(1, 25)},
        # invType1-24 -> inventory_type_1-24
        **{f'invType{i}': f'inventory_type_{i}' for i in range(1, 25)},
        'outfitId': 'outfit_id',
    },
    'creaturefamily': {
        'ID': 'id',
        'minScale': 'min_scale',
        'minScaleLevel': 'min_scale_level',
        'maxScale': 'max_scale',
        'maxScaleLevel': 'max_scale_level',
        'skillline_1': 'skill_line_1',
        'skillline_2': 'skill_line_2',
        'petfoodmask': 'pet_food_mask',
        'pettalenttype': 'pet_talent_type',
        'categoryenumid': 'category_enum_id',
        'name1': 'name_enus',
        'nameFlags': 'name_flags',
        'iconpath': 'icon',  # FIXED: iconpath -> icon
    },
    'currencytypes': {
        'ID': 'id',
        'bitIndex': 'bit_index',
    },
    'itemextendedcost': {
        'ID': 'id',
        'honorPoints': 'honor_points',
        'arenaPoints': 'arena_points',
        'reqArenaSlot': 'req_arena_slot',
        **{f'requiredItem{i}': f'req_item_{i}' for i in range(1, 6)},
        **{f'requiredItemCount{i}': f'req_item_cost_{i}' for i in range(1, 6)},
        'reqArenaRating': 'req_arena_rating',
    },
    'itemsubclass': {
        # These columns already match the DB schema - no changes needed
        # The error was about display_name_flag which doesn't exist
        # The actual column is displayNameFlag (already in DB)
        # So we should NOT remap these
    },
    'map': {
        'ID': 'id',
        'DirectoryName': 'directory',
        'InstanceType': 'instance_type',
        'Flags': 'flags',
        'PVP': 'pvp',
        'MapName_Lang_enUS': 'name_enus',
        'MapName_Lang_Mask': 'name_flags',
        'MapDescription0_Lang_enUS': 'desc_0_enus',  # FIXED
        'MapDescription0_Lang_Mask': 'desc_0_flags',  # FIXED
        'MapDescription1_Lang_enUS': 'desc_1_enus',  # FIXED
        'MapDescription1_Lang_Mask': 'desc_1_flags',  # FIXED
        'AreaTableID': 'area_table_id',
        'LoadingScreenID': 'loading_screen_id',
        'MinimapIconScale': 'minimap_icon_scale',
        'CorpseMapID': 'corpse_map_id',
        'CorpseX': 'corpse_x',
        'CorpseY': 'corpse_y',
        'TimeOfDayOverride': 'time_override',  # FIXED
        'ExpansionID': 'expansion',  # FIXED
        'RaidOffset': 'raid_offset',
        'MaxPlayers': 'max_players',
    },
    'mapdifficulty': {
        'ID': 'id',
        'Map': 'map_id',
        'difficulty': 'difficulty',
        'message1': 'message_enus',
        'messageFlags': 'message_flags',
        'raidDurationSeconds': 'lockout_duration',  # FIXED
        'maxPlayers': 'max_players',
        'difficultyString': 'difficulty_string',
    },
    'talenttab': {
        'ID': 'id',
        'name1': 'name_enus',
        'nameFlags': 'name_flags',
        'spellIcon': 'spell_icon',
        'iconId': 'spell_icon',  # FIXED: iconId -> spell_icon
        'raceMask': 'race_mask',  # FIXED
        'classMask': 'class_mask',
        'petTalentMask': 'creature_family',
        'orderIndex': 'order_index',
        'backgroundFile': 'background_file',
    },
}


def fix_sql_file(input_path: Path, output_path: Path, table_name: str) -> tuple[int, int]:
    """Fix column names in SQL file. Returns (lines_changed, total_lines)."""

    mappings = COLUMN_MAPPINGS.get(table_name, {})
    if not mappings:
        print(f"  Warning: No mappings defined for {table_name}")
        return 0, 0

    with open(input_path, 'r') as f:
        content = f.read()

    original = content
    changes = 0

    # Replace column names (backtick-quoted)
    for old_col, new_col in mappings.items():
        if old_col != new_col:
            pattern = f'`{re.escape(old_col)}`'
            replacement = f'`{new_col}`'
            new_content = re.sub(pattern, replacement, content)
            if new_content != content:
                count = len(re.findall(pattern, content))
                changes += count
                content = new_content

    if content != original:
        with open(output_path, 'w') as f:
            f.write(content)
        return changes, content.count('\n')

    return 0, content.count('\n')


def main():
    updates_dir = Path("/workspace/project/Zeppelin-Craft/Scripts/Patch Builder/Updates")

    failed_files = [
        'update_charstartoutfit.sql',
        'update_creaturefamily.sql',
        'update_currencytypes.sql',
        'update_itemextendedcost.sql',
        'update_itemsubclass.sql',
        'update_map.sql',
        'update_mapdifficulty.sql',
        'update_talenttab.sql',
    ]

    print("Fixing column names in failed SQL files...")
    print()

    for filename in failed_files:
        input_path = updates_dir / filename
        if not input_path.exists():
            print(f"  [SKIP] {filename} - not found")
            continue

        # Extract table name from filename (update_tablename.sql)
        table_name = filename.replace('update_', '').replace('.sql', '')

        output_path = updates_dir / filename.replace('.sql', '_fixed.sql')

        changes, lines = fix_sql_file(input_path, output_path, table_name)

        if changes > 0:
            print(f"  [FIXED] {filename} -> {output_path.name} ({changes} replacements)")
        else:
            print(f"  [NONE] {filename} - no changes needed or no mappings")

    print()
    print("Done! Run the _fixed.sql files to apply updates.")


if __name__ == '__main__':
    main()
