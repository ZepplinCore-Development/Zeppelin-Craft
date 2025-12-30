#!/usr/bin/env python3
"""
Generate herbalism pruning shears bonus yield SQL
Creates reference loot tables and conditions for 4 shear tiers
Duplicates entire node loot for "second roll" bonus mechanic
"""

import subprocess
import json
import sys
import os

# Redirect stdout to SQL file in script directory
script_dir = os.path.dirname(os.path.abspath(__file__))
output_file = os.path.join(script_dir, 'zz_pruning_shears_loot.sql')
sys.stdout = open(output_file, 'w')

# Get unique loot table IDs with their gameobject mappings
# Only include tables that contain actual herb items (not quest items, chests, etc.)
query = """
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
        AND glt2.Item IN (
            765,   -- Silverleaf
            785,   -- Mageroyal
            2447,  -- Peacebloom
            2449,  -- Earthroot
            2450,  -- Briarthorn
            2452,  -- Swiftthistle
            2453,  -- Bruiseweed
            3355,  -- Wild Steelbloom
            3356,  -- Kingsblood
            3357,  -- Liferoot
            3358,  -- Khadgar's Whisker
            3369,  -- Grave Moss
            3818,  -- Fadeleaf
            3819,  -- Wintersbite
            3820,  -- Stranglekelp
            3821,  -- Goldthorn
            4625,  -- Firebloom
            8153,  -- Wildvine
            8831,  -- Purple Lotus
            8836,  -- Arthas' Tears
            8838,  -- Sungrass
            8839,  -- Blindweed
            8845,  -- Ghost Mushroom
            8846,  -- Gromsblood
            13463, -- Dreamfoil
            13464, -- Golden Sansam
            13465, -- Mountain Silversage
            13466, -- Plaguebloom
            13467, -- Icecap
            13468, -- Black Lotus
            22710, -- Bloodthistle
            22785, -- Felweed
            22786, -- Dreaming Glory
            22787, -- Ragveil
            22788, -- Flame Cap
            22789, -- Terocone
            22790, -- Ancient Lichen
            22791, -- Netherbloom
            22792, -- Nightmare Vine
            22793, -- Mana Thistle
            36901, -- Goldclover
            36903, -- Adder's Tongue
            36904, -- Tiger Lily
            36905, -- Lichbloom
            36906  -- Icethorn
        )
    )
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

print(f"-- Found {len(loot_tables)} unique herbalism loot tables")
print()
print("-- =====================================================")
print("-- GAMEOBJECT LIST (for review)")
print("-- =====================================================")
for loot_table in loot_tables:
    print(f"-- {loot_table['example_name']} (Loot ID: {loot_table['loot_id']})")
print("-- =====================================================")
print()

# Shear tier configuration
tiers = [
    {'name': 'Journeyman', 'spell': 91140, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91141, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91142, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91143, 'chance': 40, 'tier_id': 4},
]

# Generate SQL
print("-- =====================================================")
print("-- PRUNING SHEARS BONUS YIELD SYSTEM")
print("-- =====================================================")
print("-- Reference loot tables that duplicate herb node loot")
print("-- Provides bonus 'second roll' when gathering with shears")
print("-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)")
print("-- =====================================================")
print()

# Cleanup
print("-- Cleanup existing entries")
print("DELETE FROM reference_loot_template WHERE Entry BETWEEN 91200 AND 91799;")
print("DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 91200 AND 91799;")
print("DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 91200 AND 91799;")
print()

# For each loot table, create 4 tier references
ref_id = 91200
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

        print(f"-- {name} - {tier_name} Shears Bonus (Ref {tier_ref_id})")
        for item in items:
            print(f"INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} Shears');")
        print()

        ref_id += 1

    print()

print("-- =====================================================")
print("-- LINK REFERENCES TO GAMEOBJECTS")
print("-- =====================================================")
print()

# Now link references back to gameobjects with conditions
ref_id = 91200
item_slot_id = 9000  # Unique slot IDs to avoid PRIMARY KEY conflicts

for idx, loot_table in enumerate(loot_tables):
    loot_id = loot_table['loot_id']
    gameobject_ids = loot_table['gameobject_ids']

    for go_id in gameobject_ids:
        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']

            print(f"-- {tier['name']} bonus for GO {go_id}")
            print(f"INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({go_id}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 1, '{tier['name']} Shears Bonus');")

            item_slot_id += 1

    ref_id += 4  # Move to next set of 4 tier references
    print()

print("-- =====================================================")
print("-- CONDITIONS (Check for active shear auras)")
print("-- =====================================================")
print()

ref_id = 91200
for idx, loot_table in enumerate(loot_tables):
    name = loot_table['example_name']

    for tier in tiers:
        tier_ref_id = ref_id + (tier['tier_id'] - 1)
        spell_id = tier['spell']

        print(f"-- {name} - {tier['name']} Shears condition (Ref {tier_ref_id})")
        print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES")
        print(f"    (10, {tier_ref_id}, 0, 0, 0, 1, 0, {spell_id}, 1, 0);")

    ref_id += 4
    print()

print("-- Done!")

# Close output file and print success message to console
sys.stdout.close()
sys.stdout = sys.__stdout__
print(f"✓ Generated: {output_file}")
