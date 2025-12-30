#!/usr/bin/env python3
"""
Unified Gathering Tool Bonus Yield SQL Generator
Generates loot tables and conditions for both Mining Picks and Pruning Shears
Creates reference loot tables with proper tier exclusivity to prevent bonus stacking
"""

import subprocess
import json
import sys
import os
import argparse

def execute_query(query, database='acore_world'):
    """Execute a MySQL query and return results"""
    if database == 'acore_world':
        cmd = ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore', database]
    else:
        cmd = ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'spell-editor', '-p HW8Y%L6&f0ePJO', database]

    result = subprocess.run(
        cmd + ['-e', query, '--batch', '--skip-column-names'],
        capture_output=True, text=True
    )
    return result.stdout


def get_mining_tables():
    """Get unique mining loot table IDs with their gameobject mappings"""
    query = """
SELECT
    glt.Entry as loot_id,
    GROUP_CONCAT(DISTINCT gt.entry ORDER BY gt.entry) as gameobject_ids,
    MIN(gt.name) as example_name
FROM gameobject_template gt
JOIN gameobject_loot_template glt ON gt.Data1 = glt.Entry
WHERE gt.type = 3
    AND (gt.name LIKE '%Deposit' OR gt.name LIKE '%Vein')
    AND gt.Data1 > 0
    AND gt.name NOT LIKE '%Incendicite%'
    AND gt.name NOT LIKE '%Indurium%'
    AND gt.name NOT LIKE '%Bloodstone%'
GROUP BY glt.Entry
ORDER BY glt.Entry;
"""

    result = execute_query(query)
    loot_tables = []
    for line in result.strip().split('\n'):
        if line:
            parts = line.split('\t')
            loot_tables.append({
                'loot_id': int(parts[0]),
                'gameobject_ids': parts[1].split(','),
                'example_name': parts[2],
                'type': 'mining'
            })
    return loot_tables


def get_herbalism_tables():
    """Get unique herbalism loot table IDs with their gameobject mappings"""
    # List of actual herb item IDs
    herb_items = [
        765, 785, 2447, 2449, 2450, 2452, 2453, 3355, 3356, 3357, 3358, 3369,
        3818, 3819, 3820, 3821, 4625, 8153, 8831, 8836, 8838, 8839, 8845, 8846,
        13463, 13464, 13465, 13466, 13467, 13468, 22710, 22785, 22786, 22787,
        22788, 22789, 22790, 22791, 22792, 22793, 36901, 36903, 36904, 36905, 36906
    ]

    query = f"""
SELECT
    glt.Entry as loot_id,
    GROUP_CONCAT(DISTINCT gt.entry ORDER BY gt.entry) as gameobject_ids,
    MIN(gt.name) as example_name
FROM gameobject_template gt
JOIN gameobject_loot_template glt ON gt.Data1 = glt.Entry
WHERE gt.type = 3
    AND gt.Data1 > 0
    AND gt.name NOT LIKE '%Chest%'
    AND gt.name NOT LIKE '%Crate%'
    AND gt.name NOT LIKE '%Box%'
    AND gt.name NOT LIKE '%Footlocker%'
    AND gt.name NOT LIKE '%Strongbox%'
    AND gt.name NOT LIKE '%Cargo%'
    AND gt.name NOT LIKE '%Barrel%'
    AND gt.name NOT LIKE '%Basket%'
    AND gt.name NOT LIKE '%Sack%'
    AND gt.name NOT LIKE 'Fissure Plant'
    AND gt.name NOT LIKE 'Mana Bomb%'
    AND gt.name NOT LIKE 'Gahz''ridian'
    AND EXISTS (
        SELECT 1 FROM gameobject_loot_template glt2
        WHERE glt2.Entry = glt.Entry
        AND glt2.Item IN ({','.join(map(str, herb_items))})
    )
GROUP BY glt.Entry
ORDER BY glt.Entry;
"""

    result = execute_query(query)
    loot_tables = []
    for line in result.strip().split('\n'):
        if line:
            parts = line.split('\t')
            loot_tables.append({
                'loot_id': int(parts[0]),
                'gameobject_ids': parts[1].split(','),
                'example_name': parts[2],
                'type': 'herbalism'
            })
    return loot_tables


def get_loot_items(loot_id):
    """Get items from a loot table (excluding quest items)"""
    query = f"""
SELECT Item, Chance, QuestRequired, MinCount, MaxCount, Comment
FROM gameobject_loot_template
WHERE Entry = {loot_id}
    AND Reference = 0
    AND Item NOT IN (SELECT entry FROM item_template WHERE StartQuest > 0 OR Flags & 4096)
ORDER BY Item;
"""

    result = execute_query(query)
    items = []
    for line in result.strip().split('\n'):
        if line:
            parts = line.split('\t')
            items.append({
                'item': int(parts[0]),
                'chance': float(parts[1]),
                'quest_req': int(parts[2]),
                'min_count': int(parts[3]),
                'max_count': int(parts[4]),
                'comment': parts[5] if len(parts) > 5 else ''
            })
    return items


def generate_sql(profession_type):
    """Generate SQL for either mining or herbalism"""

    # Configuration for each profession
    configs = {
        'mining': {
            'name': 'Mining Pick',
            'ref_range': (92000, 92999),
            'item_slot_start': 9500,
            'tiers': [
                {'name': 'Journeyman', 'spell': 91158, 'chance': 10, 'tier_id': 1},
                {'name': 'Artisan', 'spell': 91159, 'chance': 20, 'tier_id': 2},
                {'name': 'Master', 'spell': 91160, 'chance': 30, 'tier_id': 3},
                {'name': 'Grand Master', 'spell': 91161, 'chance': 40, 'tier_id': 4},
            ]
        },
        'herbalism': {
            'name': 'Pruning Shears',
            'ref_range': (91200, 91799),
            'item_slot_start': 9000,
            'tiers': [
                {'name': 'Journeyman', 'spell': 91140, 'chance': 10, 'tier_id': 1},
                {'name': 'Artisan', 'spell': 91141, 'chance': 20, 'tier_id': 2},
                {'name': 'Master', 'spell': 91142, 'chance': 30, 'tier_id': 3},
                {'name': 'Grand Master', 'spell': 91143, 'chance': 40, 'tier_id': 4},
            ]
        }
    }

    config = configs[profession_type]

    # Get loot tables
    if profession_type == 'mining':
        loot_tables = get_mining_tables()
        output_file = 'zz_mining_pick_loot.sql'
    else:
        loot_tables = get_herbalism_tables()
        output_file = 'zz_pruning_shears_loot.sql'

    # Redirect stdout to SQL file
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(script_dir, output_file)
    sys.stdout = open(output_path, 'w')

    # Generate SQL header
    print(f"-- Found {len(loot_tables)} unique {profession_type} loot tables")
    print()
    print("-- =====================================================")
    print("-- GAMEOBJECT LIST (for review)")
    print("-- =====================================================")
    for loot_table in loot_tables:
        print(f"-- {loot_table['example_name']} (Loot ID: {loot_table['loot_id']})")
    print("-- =====================================================")
    print()

    # Generate SQL
    print("-- =====================================================")
    print(f"-- {config['name'].upper()} BONUS YIELD SYSTEM")
    print("-- =====================================================")
    print("-- Reference loot tables that duplicate node loot")
    print("-- Provides bonus 'second roll' when gathering with tools")
    print("-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)")
    print("-- =====================================================")
    print()

    # Cleanup
    print("-- Cleanup existing entries")
    print(f"DELETE FROM reference_loot_template WHERE Entry BETWEEN {config['ref_range'][0]} AND {config['ref_range'][1]};")
    print(f"DELETE FROM gameobject_loot_template WHERE Reference BETWEEN {config['ref_range'][0]} AND {config['ref_range'][1]};")
    print(f"DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN {config['ref_range'][0]} AND {config['ref_range'][1]};")
    print()

    # Create reference tables
    ref_id = config['ref_range'][0]
    for idx, loot_table in enumerate(loot_tables):
        loot_id = loot_table['loot_id']
        name = loot_table['example_name']

        print(f"-- {name} (Loot ID: {loot_id})")

        # Get items for this table
        items = get_loot_items(loot_id)

        if not items:
            continue

        # Create 4 reference tables (one per tier)
        for tier in config['tiers']:
            tier_ref_id = ref_id
            tier_name = tier['name']

            print(f"-- {name} - {tier_name} {config['name']} Bonus (Ref {tier_ref_id})")
            for item in items:
                item_comment = item['comment'].replace(f"{name} - ", "") if item['comment'] else f"Item {item['item']}"
                comment = f"{name} - {item_comment} - {tier_name} {config['name']}".replace("'", "''")
                print(f"INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                print(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, 0, {item['min_count']}, {item['max_count']}, '{comment}');")
            print()

            ref_id += 1

        print()

    # Link references to gameobjects
    print("-- =====================================================")
    print("-- LINK REFERENCES TO GAMEOBJECTS")
    print("-- =====================================================")
    print()

    ref_id = config['ref_range'][0]
    item_slot_id = config['item_slot_start']

    for idx, loot_table in enumerate(loot_tables):
        loot_id = loot_table['loot_id']
        gameobject_ids = loot_table['gameobject_ids']

        for tier in config['tiers']:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']

            print(f"-- {tier['name']} bonus for loot table {loot_id} (GOs: {', '.join(gameobject_ids)})")
            print(f"INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({loot_id}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 1, '{tier['name']} {config['name']} Bonus');")

            item_slot_id += 1

        ref_id += 4
        print()

    # Generate conditions with tier exclusivity
    print("-- =====================================================")
    print(f"-- CONDITIONS (Check for active {config['name']} auras)")
    print("-- =====================================================")
    print("-- IMPORTANT: Uses mutually exclusive conditions to prevent bonus stacking")
    print("-- Each tier bonus ONLY triggers if that specific tier is active")
    print("-- AND no higher tier is active (prevents multiple bonuses)")
    print("-- =====================================================")
    print()

    ref_id = config['ref_range'][0]
    for idx, loot_table in enumerate(loot_tables):
        name = loot_table['example_name']
        loot_id = loot_table['loot_id']

        # Get items for conditions
        items = get_loot_items(loot_id)
        item_ids = [item['item'] for item in items]

        for tier_idx, tier in enumerate(config['tiers']):
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            spell_id = tier['spell']

            print(f"-- {name} - {tier['name']} {config['name']} conditions (Ref {tier_ref_id})")

            # For each tier, we need:
            # 1. Positive condition: Check for this tier's aura (ElseGroup 0)
            # 2. Negative conditions: Block if any higher tier aura is active (ElseGroup 0)
            # This ensures only the highest active tier bonus triggers

            for item_id in item_ids:
                cond_comment = f"{tier['name']} {config['name']} - {name}".replace("'", "''")

                # Positive condition: Check for this tier's aura
                # ConditionValue2 = 0 refers to Effect1 (spell effect slot 0) where the aura is located
                print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                print(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{cond_comment}');")

                # Negative conditions: Block if higher tiers are active
                for higher_tier_idx in range(tier_idx + 1, len(config['tiers'])):
                    higher_tier = config['tiers'][higher_tier_idx]
                    higher_spell_id = higher_tier['spell']
                    block_comment = f"Block {tier['name']} if {higher_tier['name']} active - {name}".replace("'", "''")

                    print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                    print(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {higher_spell_id}, 0, 0, 1, '{block_comment}');")

            print()

        ref_id += 4
        print()

    print("-- Done!")

    # Close output file and print success message to console
    sys.stdout.close()
    sys.stdout = sys.__stdout__
    print(f"✓ Generated: {output_path}")


def main():
    parser = argparse.ArgumentParser(description='Generate gathering tool bonus loot SQL')
    parser.add_argument('type', choices=['mining', 'herbalism', 'both'],
                        help='Type of gathering profession to generate')

    args = parser.parse_args()

    if args.type in ['mining', 'both']:
        print("Generating mining pick bonus loot...")
        generate_sql('mining')

    if args.type in ['herbalism', 'both']:
        print("Generating pruning shears bonus loot...")
        generate_sql('herbalism')


if __name__ == '__main__':
    main()
