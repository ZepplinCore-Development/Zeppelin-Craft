"""
Generate mining pick bonus yield SQL.

Creates reference loot tables and conditions for 4 pick tiers.
Duplicates entire mining node loot for "second roll" bonus mechanic.
"""

from pathlib import Path
from typing import List

from .common import query_rows, default_output_path

# Pick tier configuration
TIERS = [
    {'name': 'Journeyman', 'spell': 91158, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91159, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91160, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91161, 'chance': 40, 'tier_id': 4},
]

REF_START = 92000
REF_END = 92999
SLOT_START = 9500
OUTPUT_FILENAME = 'zz_[AUTO,F-001]_mining_pick_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    """Generate mining pick bonus yield SQL.

    Returns the path to the generated file.
    """
    output = output or default_output_path(craft_root, OUTPUT_FILENAME)

    loot_tables = _query_loot_tables()

    lines: List[str] = []
    _header(lines, loot_tables)
    items_by_loot_id = _phase1_references(lines, loot_tables)
    _phase2_linkage(lines, loot_tables, items_by_loot_id)
    _phase3_conditions(lines, loot_tables, items_by_loot_id)

    lines.append('-- Done!')
    output.write_text('\n'.join(lines) + '\n')
    return output


def _query_loot_tables() -> list:
    """Get unique mining loot table IDs with gameobject mappings."""
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
    rows = query_rows(query)
    return [{
        'loot_id': int(r[0]),
        'gameobject_ids': r[1].split(','),
        'example_name': r[2],
    } for r in rows]


def _query_items(loot_id: int) -> list:
    """Get loot items for a gameobject loot table (excluding quest/reference items)."""
    query = f"""
    SELECT Item, Chance, QuestRequired, MinCount, MaxCount, Comment
    FROM gameobject_loot_template
    WHERE Entry = {loot_id}
        AND Reference = 0
        AND Item > 0
        AND Item NOT IN (SELECT entry FROM item_template WHERE StartQuest > 0 OR Flags & 4096)
    ORDER BY Item;
    """
    rows = query_rows(query)
    return [{
        'item': int(r[0]),
        'chance': float(r[1]),
        'quest_req': int(r[2]),
        'min_count': int(r[3]),
        'max_count': int(r[4]),
        'comment': r[5] if len(r) > 5 else '',
    } for r in rows]


def _header(lines: List[str], loot_tables: list):
    lines.append(f'-- Found {len(loot_tables)} unique mining loot tables')
    lines.append('')
    lines.append('-- =====================================================')
    lines.append('-- GAMEOBJECT LIST (for review)')
    lines.append('-- =====================================================')
    for lt in loot_tables:
        lines.append(f"-- {lt['example_name']} (Loot ID: {lt['loot_id']})")
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- =====================================================')
    lines.append('-- MINING PICK BONUS YIELD SYSTEM')
    lines.append('-- =====================================================')
    lines.append('-- Reference loot tables that duplicate mining node loot')
    lines.append("-- Provides bonus 'second roll' when mining with picks")
    lines.append('-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)')
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- Cleanup existing entries')
    lines.append(f'DELETE FROM reference_loot_template WHERE Entry BETWEEN {REF_START} AND {REF_END};')
    lines.append(f'DELETE FROM gameobject_loot_template WHERE Reference BETWEEN {REF_START} AND {REF_END};')
    lines.append(f'DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN {REF_START} AND {REF_END};')
    lines.append('')


def _phase1_references(lines: List[str], loot_tables: list) -> dict:
    """Phase 1: Create reference loot tables. Returns items_by_loot_id."""
    items_by_loot_id = {}
    ref_id = REF_START

    for lt in loot_tables:
        loot_id = lt['loot_id']
        name = lt['example_name']
        lines.append(f"-- {name} (Loot ID: {loot_id})")

        items = _query_items(loot_id)
        items_by_loot_id[loot_id] = items

        if not items:
            ref_id += 4
            continue

        for tier in TIERS:
            tier_ref_id = ref_id
            tier_name = tier['name']
            lines.append(f"-- {name} - {tier_name} Pick Bonus (Ref {tier_ref_id})")
            for item in items:
                group_id = 1 if item['chance'] == 0 else 0
                lines.append(f"INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                lines.append(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, {group_id}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} Pick');")
            lines.append('')
            ref_id += 1
        lines.append('')

    return items_by_loot_id


def _phase2_linkage(lines: List[str], loot_tables: list, items_by_loot_id: dict):
    """Phase 2: Link references to loot tables."""
    lines.append('-- =====================================================')
    lines.append('-- LINK REFERENCES TO LOOT TABLES')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = REF_START
    item_slot_id = SLOT_START

    for lt in loot_tables:
        loot_id = lt['loot_id']
        name = lt['example_name']

        if not items_by_loot_id.get(loot_id):
            ref_id += 4
            continue

        for tier in TIERS:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']
            lines.append(f"-- {tier['name']} bonus for {name} (Loot ID: {loot_id})")
            lines.append(f"INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES")
            lines.append(f"    ({loot_id}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 1, '{tier['name']} Pick Bonus');")
            item_slot_id += 1

        ref_id += 4
        lines.append('')


def _phase3_conditions(lines: List[str], loot_tables: list, items_by_loot_id: dict):
    """Phase 3: Generate conditions for pick aura checks."""
    lines.append('-- =====================================================')
    lines.append('-- CONDITIONS (Check for active pick auras)')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = REF_START
    for lt in loot_tables:
        loot_id = lt['loot_id']
        name = lt['example_name']

        if not items_by_loot_id.get(loot_id):
            ref_id += 4
            continue

        for tier in TIERS:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            spell_id = tier['spell']
            lines.append(f"-- {name} - {tier['name']} Pick condition (Ref {tier_ref_id})")
            lines.append(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES")
            lines.append(f"    (10, {tier_ref_id}, 0, 0, 0, 1, 0, {spell_id}, 1, 0);")

        ref_id += 4
        lines.append('')
