#!/usr/bin/env python3
"""
Generate skinning knife bonus yield SQL
Creates reference loot tables and conditions for 4 knife tiers
Adapted from generate_mining_loot.py for skinning_loot_template
"""

import subprocess
import sys
import os

# Redirect stdout to SQL file in zpak directory
script_dir = os.path.dirname(os.path.abspath(__file__))
zpak_dir = os.path.join(script_dir, '..', '..', 'zpaks', 'zepcraft-legacy', 'sql')
output_file = os.path.join(zpak_dir, 'zz_[F-001]_skinning_knife_loot.sql')
sys.stdout = open(output_file, 'w')

# Get unique skinning loot table entries
# Exclude creatures that use herbalism (type_flags bit 8 = 256),
# mining (bit 9 = 512), or engineering (bit 15 = 32768) gathering.
# Those creatures share skinning_loot_template but shouldn't get
# skinning knife bonus yield.
NON_SKINNING_FLAGS = 256 | 512 | 32768  # herb | mining | engineering

unique_entries_query = """
SELECT DISTINCT slt.Entry, MIN(ct.name) as example_name
FROM skinning_loot_template slt
JOIN creature_template ct ON ct.skinloot = slt.Entry
WHERE (ct.type_flags & {flags}) = 0
GROUP BY slt.Entry
ORDER BY slt.Entry;
""".format(flags=NON_SKINNING_FLAGS)

result2 = subprocess.run(
    ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
     'acore_world', '-e', unique_entries_query, '--batch', '--skip-column-names'],
    capture_output=True, text=True
)

loot_tables = []
for line in result2.stdout.strip().split('\n'):
    if line:
        parts = line.split('\t')
        loot_tables.append({
            'entry': int(parts[0]),
            'example_name': parts[1] if len(parts) > 1 and parts[1] != 'NULL' else f'Entry {parts[0]}'
        })

print(f"-- Found {len(loot_tables)} unique skinning loot tables")
print()
print("-- =====================================================")
print("-- SKINNING LOOT TABLE LIST (for review)")
print("-- =====================================================")
for lt in loot_tables[:20]:
    print(f"-- {lt['example_name']} (Loot Entry: {lt['entry']})")
if len(loot_tables) > 20:
    print(f"-- ... and {len(loot_tables) - 20} more entries")
print("-- =====================================================")
print()

# Knife tier configuration
tiers = [
    {'name': 'Journeyman', 'spell': 91240, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91241, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91242, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91243, 'chance': 40, 'tier_id': 4},
]

# Generate SQL
print("-- =====================================================")
print("-- SKINNING KNIFE BONUS YIELD SYSTEM")
print("-- =====================================================")
print("-- Reference loot tables that duplicate skinning loot")
print("-- Provides bonus 'second roll' when skinning with knives")
print("-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)")
print("-- =====================================================")
print()

# Cleanup
print("-- Cleanup existing entries")
print("DELETE FROM reference_loot_template WHERE Entry BETWEEN 93000 AND 95999;")
print("DELETE FROM skinning_loot_template WHERE Reference BETWEEN 93000 AND 95999;")
print("DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 93000 AND 95999;")
print()

# For each loot table, create 4 tier references
ref_id = 93000
for idx, loot_table in enumerate(loot_tables):
    entry = loot_table['entry']
    name = loot_table['example_name']

    # Get the loot items for this table (excluding quest items and references)
    query_items = f"""
    SELECT Item, Chance, QuestRequired, MinCount, MaxCount, Comment
    FROM skinning_loot_template
    WHERE Entry = {entry}
        AND Reference = 0
        AND Item > 0
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
        ref_id += 4
        continue

    print(f"-- {name} (Entry: {entry})")

    # Create 4 reference tables (one per tier)
    for tier in tiers:
        tier_ref_id = ref_id + (tier['tier_id'] - 1)
        tier_name = tier['name']

        print(f"-- {name} - {tier_name} Knife Bonus (Ref {tier_ref_id})")
        for item in items:
            print(f"INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            print(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} Knife');")
        print()

    ref_id += 4
    print()

print("-- =====================================================")
print("-- LINK REFERENCES TO SKINNING LOOT TABLES")
print("-- =====================================================")
print()

# Now link references back to skinning loot tables
ref_id = 93000
item_slot_id = 10000  # Unique slot IDs to avoid PRIMARY KEY conflicts

for idx, loot_table in enumerate(loot_tables):
    entry = loot_table['entry']
    name = loot_table['example_name']

    # Check if this entry had any items (skip empty ones)
    query_check = f"SELECT COUNT(*) FROM skinning_loot_template WHERE Entry = {entry} AND Reference = 0 AND Item > 0;"
    result_check = subprocess.run(
        ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
         'acore_world', '-e', query_check, '--batch', '--skip-column-names'],
        capture_output=True, text=True
    )
    count = int(result_check.stdout.strip()) if result_check.stdout.strip() else 0

    if count == 0:
        ref_id += 4
        continue

    for tier in tiers:
        tier_ref_id = ref_id + (tier['tier_id'] - 1)
        chance = tier['chance']

        print(f"INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
        print(f"    ({entry}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 0, 1, 1, '{tier['name']} Skinning Knife Bonus');")

        item_slot_id += 1

    ref_id += 4
    print()

print("-- =====================================================")
print("-- CONDITIONS (Check for active knife auras)")
print("-- =====================================================")
print()

ref_id = 93000
for idx, loot_table in enumerate(loot_tables):
    entry = loot_table['entry']
    name = loot_table['example_name']

    # Check if this entry had items
    query_check = f"SELECT COUNT(*) FROM skinning_loot_template WHERE Entry = {entry} AND Reference = 0 AND Item > 0;"
    result_check = subprocess.run(
        ['mysql', '-h', '192.168.0.55', '-P', '3306', '-u', 'acore', '-pacore',
         'acore_world', '-e', query_check, '--batch', '--skip-column-names'],
        capture_output=True, text=True
    )
    count = int(result_check.stdout.strip()) if result_check.stdout.strip() else 0

    if count == 0:
        ref_id += 4
        continue

    for tier in tiers:
        tier_ref_id = ref_id + (tier['tier_id'] - 1)
        spell_id = tier['spell']

        print(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES")
        print(f"    (10, {tier_ref_id}, 0, 0, 0, 1, 0, {spell_id}, 0, 0);")

    ref_id += 4
    print()

print("-- Done!")

# Close output file and print success message to console
sys.stdout.close()
sys.stdout = sys.__stdout__
print(f"✓ Generated: {output_file}")
print(f"  Processed {len(loot_tables)} skinning loot entries")
