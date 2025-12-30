#!/usr/bin/env python3
"""
Generate mining pick bonus yield SQL
Creates reference loot tables and conditions for 4 pick tiers
"""

import subprocess
import json
import sys
import os

# Redirect stdout to SQL file in script directory
script_dir = os.path.dirname(os.path.abspath(__file__))
output_file = os.path.join(script_dir, 'zz_mining_pick_loot.sql')
sys.stdout = open(output_file, 'w')

# Get unique loot table IDs with their gameobject mappings
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

result = subprocess.run(
    ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
     'acore_world', '-e', query, '--batch', '--skip-column-names'],
    capture_output=True, text=True
)

loot_tables = []
for line in result.stdout.strip().split('\n'):
    if line:
        parts = line.split('\t')
        loot_tables.append({
            'loot_id': int(parts[0]),
            'gameobject_ids': parts[1].split(','),
            'example_name': parts[2]
        })

print(f"-- Found {len(loot_tables)} unique mining loot tables")
print()
print("-- =====================================================")
print("-- GAMEOBJECT LIST (for review)")
print("-- =====================================================")
for loot_table in loot_tables:
    print(f"-- {loot_table['example_name']} (Loot ID: {loot_table['loot_id']})")
print("-- =====================================================")
print()

# Pick tier configuration
tiers = [
    {'name': 'Journeyman', 'spell': 91158, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91159, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91160, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91161, 'chance': 40, 'tier_id': 4},
]

# Generate SQL
print("-- =====================================================")
print("-- MINING PICK BONUS YIELD SYSTEM")
print("-- =====================================================")
print("-- Reference loot tables that duplicate mining node loot")
print("-- Provides bonus 'second roll' when mining with picks")
print("-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)")
print("-- =====================================================")
print()

# Cleanup
print("-- Cleanup existing entries")
print("DELETE FROM reference_loot_template WHERE Entry BETWEEN 92000 AND 92999;")
print("DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 92000 AND 92999;")
print("DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 92000 AND 92999;")
print()

# For each loot table, create 4 tier references
ref_id = 92000
for idx, loot_table in enumerate(loot_tables):
    loot_id = loot_table['loot_id']
    name = loot_table['example_name']

    print(f"-- {name} (Loot ID: {loot_id})")

    # Get the loot items for this table (excluding quest items)
    query_items = f"""
    SELECT Item, Chance, QuestRequired, MinCount, MaxCount, Comment
    FROM gameobject_loot_template
    WHERE Entry = {loot_id}
        AND Item NOT IN (SELECT entry FROM item_template WHERE StartQuest > 0 OR Flags & 4096)
    ORDER BY Item;
    """

    result_items = subprocess.run(
        ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
         'acore_world', '-e', query_items, '--batch', '--skip-column-names'],
        capture_output=True, text=True
    )

    items = []
    for line in result_items.stdout.strip().split('\n'):
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

    if not items:
        continue

    # Create 4 reference tables (one per tier)
    for tier in tiers:
        tier_ref_id = ref_id
        tier_name = tier['name']

        print(f"-- {name} - {tier_name} Pick Bonus (Ref {tier_ref_id})")
        for item in items:
            print(f"INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} Pick');")
        print()

        ref_id += 1

    print()

print("-- =====================================================")
print("-- LINK REFERENCES TO GAMEOBJECTS")
print("-- =====================================================")
print()

# Now link references back to gameobjects with conditions
ref_id = 92000
item_slot_id = 9500  # Unique slot IDs to avoid PRIMARY KEY conflicts

for idx, loot_table in enumerate(loot_tables):
    loot_id = loot_table['loot_id']
    gameobject_ids = loot_table['gameobject_ids']

    for go_id in gameobject_ids:
        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']

            print(f"-- {tier['name']} bonus for GO {go_id}")
            print(f"INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({go_id}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 1, '{tier['name']} Pick Bonus');")

            item_slot_id += 1

    ref_id += 4  # Move to next set of 4 tier references
    print()

print("-- =====================================================")
print("-- CONDITIONS (Check for active pick auras)")
print("-- =====================================================")
print()

ref_id = 92000
for idx, loot_table in enumerate(loot_tables):
    name = loot_table['example_name']

    for tier in tiers:
        tier_ref_id = ref_id + (tier['tier_id'] - 1)
        spell_id = tier['spell']

        print(f"-- {name} - {tier['name']} Pick condition (Ref {tier_ref_id})")
        print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES")
        print(f"    (10, {tier_ref_id}, 0, 0, 0, 1, 0, {spell_id}, 1, 0);")

    ref_id += 4
    print()

print("-- Done!")

# Close output file and print success message to console
sys.stdout.close()
sys.stdout = sys.__stdout__
print(f"✓ Generated: {output_file}")
