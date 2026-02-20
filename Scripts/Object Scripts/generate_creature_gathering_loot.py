#!/usr/bin/env python3
"""
Generate bonus yield SQL for creatures gathered with herbalism/mining.

Some creatures use skinning_loot_template but are gathered with herbalism or mining
(controlled by type_flags bits). The pruning shears and mining pick generators only
cover gameobject nodes, so this script extends bonus yield to creature gathering.

Uses the same per-item SourceEntry + NegativeCondition condition pattern.
"""

import subprocess
import sys
import os

# Redirect stdout to SQL file in zpak directory
script_dir = os.path.dirname(os.path.abspath(__file__))
zpak_dir = os.path.join(script_dir, '..', '..', 'zpaks', 'zep-professions', 'sql')
output_file = os.path.join(zpak_dir, 'zz_[F-001]_creature_gathering_loot.sql')
sys.stdout = open(output_file, 'w')

def run_query(query):
    result = subprocess.run(
        ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
         'acore_world', '-e', query, '--batch', '--skip-column-names'],
        capture_output=True, text=True
    )
    return result.stdout.strip()

# Gathering type configs
gather_types = [
    {
        'name': 'Herbalism',
        'type_flag': 256,
        'ref_start': 96000,
        'slot_start': 20000,
        'tiers': [
            {'name': 'Journeyman', 'spell': 91140, 'chance': 10, 'tier_id': 1},
            {'name': 'Artisan', 'spell': 91141, 'chance': 20, 'tier_id': 2},
            {'name': 'Master', 'spell': 91142, 'chance': 30, 'tier_id': 3},
            {'name': 'Grand Master', 'spell': 91143, 'chance': 40, 'tier_id': 4},
        ],
        'tool': 'Pruning Shears',
    },
    {
        'name': 'Mining',
        'type_flag': 512,
        'ref_start': 96500,
        'slot_start': 20500,
        'tiers': [
            {'name': 'Journeyman', 'spell': 91158, 'chance': 10, 'tier_id': 1},
            {'name': 'Artisan', 'spell': 91159, 'chance': 20, 'tier_id': 2},
            {'name': 'Master', 'spell': 91160, 'chance': 30, 'tier_id': 3},
            {'name': 'Grand Master', 'spell': 91161, 'chance': 40, 'tier_id': 4},
        ],
        'tool': 'Mining Pick',
    },
]

print("-- =====================================================")
print("-- CREATURE GATHERING BONUS YIELD SYSTEM")
print("-- =====================================================")
print("-- Extends pruning shears / mining pick bonus yield to creatures")
print("-- that are 'skinned' using herbalism or mining (type_flags)")
print("-- =====================================================")
print()

# Cleanup
print("-- Cleanup existing entries")
print("DELETE FROM reference_loot_template WHERE Entry BETWEEN 96000 AND 96099;")
print("DELETE FROM reference_loot_template WHERE Entry BETWEEN 96500 AND 96599;")
print("DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96000 AND 96099;")
print("DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96500 AND 96599;")
print("DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96000 AND 96099;")
print("DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96500 AND 96599;")
print()

total_tables = 0
total_conditions = 0

for gt in gather_types:
    type_name = gt['name']
    type_flag = gt['type_flag']
    tiers = gt['tiers']
    tool = gt['tool']

    # Get unique skinning loot tables for this gather type
    query = f"""
    SELECT DISTINCT slt.Entry, MIN(ct.name) as example_name
    FROM skinning_loot_template slt
    JOIN creature_template ct ON ct.skinloot = slt.Entry
    WHERE (ct.type_flags & {type_flag}) != 0
    GROUP BY slt.Entry
    ORDER BY slt.Entry;
    """
    output = run_query(query)

    loot_tables = []
    for line in output.split('\n'):
        if line:
            parts = line.split('\t')
            loot_tables.append({
                'entry': int(parts[0]),
                'example_name': parts[1] if len(parts) > 1 and parts[1] != 'NULL' else f'Entry {parts[0]}'
            })

    print(f"-- =====================================================")
    print(f"-- {type_name.upper()} CREATURES ({len(loot_tables)} unique loot tables)")
    print(f"-- Tool: {tool}")
    print(f"-- =====================================================")
    for lt in loot_tables:
        print(f"-- {lt['example_name']} (Loot Entry: {lt['entry']})")
    print()

    # Phase 1: Create reference loot tables and store items
    items_by_entry = {}
    ref_id = gt['ref_start']

    for loot_table in loot_tables:
        entry = loot_table['entry']
        name = loot_table['example_name']
        sql_name = name.replace("'", "''")

        query_items = f"""
        SELECT Item, Chance, QuestRequired, MinCount, MaxCount
        FROM skinning_loot_template
        WHERE Entry = {entry}
            AND Reference = 0
            AND Item > 0
        ORDER BY Item;
        """
        output = run_query(query_items)

        items = []
        for line in output.split('\n'):
            if line:
                parts = line.split('\t')
                items.append({
                    'item': int(parts[0]),
                    'chance': float(parts[1]),
                    'quest_req': int(parts[2]),
                    'min_count': int(parts[3]),
                    'max_count': int(parts[4]),
                })

        items_by_entry[entry] = items

        if not items:
            ref_id += 4
            continue

        print(f"-- {name} (Entry: {entry})")
        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            print(f"-- {name} - {tier_name} {tool} Bonus (Ref {tier_ref_id})")
            for item in items:
                print(f"INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                print(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} {tool}');")
            print()

        ref_id += 4
        print()

    # Phase 2: Link references to skinning loot tables
    print(f"-- Link {type_name} creature references to skinning_loot_template")
    print()

    ref_id = gt['ref_start']
    item_slot_id = gt['slot_start']

    for loot_table in loot_tables:
        entry = loot_table['entry']
        if not items_by_entry.get(entry):
            ref_id += 4
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']
            print(f"INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({entry}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 0, 1, 1, '{tier['name']} {tool} Bonus');")
            item_slot_id += 1

        ref_id += 4
        print()

    # Phase 3: Per-item conditions with NegativeCondition
    print(f"-- {type_name} creature conditions (per-item with mutual exclusion)")
    print()

    ref_id = gt['ref_start']
    for loot_table in loot_tables:
        entry = loot_table['entry']
        name = loot_table['example_name']
        sql_name = name.replace("'", "''")
        items = items_by_entry.get(entry, [])

        if not items:
            ref_id += 4
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            spell_id = tier['spell']

            print(f"-- {name} - {tier_name} {tool} conditions (Ref {tier_ref_id})")
            for item in items:
                item_id = item['item']

                # Positive: MUST have this tier's aura
                print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                print(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{tier_name} {tool} - {sql_name}');")

                # Negative: MUST NOT have higher tier auras
                for higher_tier in tiers:
                    if higher_tier['tier_id'] > tier['tier_id']:
                        higher_name = higher_tier['name']
                        higher_spell = higher_tier['spell']
                        print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                        print(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {higher_spell}, 0, 0, 1, 'Block {tier_name} if {higher_name} active - {sql_name}');")

                total_conditions += 1
            print()

        ref_id += 4
        print()

    total_tables += len(loot_tables)

print("-- Done!")

# Close output file and print success message to console
sys.stdout.close()
sys.stdout = sys.__stdout__
print(f"✓ Generated: {output_file}")
print(f"  Processed {total_tables} creature gathering loot tables")
