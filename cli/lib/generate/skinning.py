"""
Generate skinning knife bonus yield SQL.

Creates reference loot tables and conditions for 4 knife tiers.
Uses per-item conditions with negative conditions for mutual exclusion.
"""

from pathlib import Path
from typing import Dict, List

from .common import query_rows, sql_escape, default_output_path

# Knife tier configuration
TIERS = [
    {'name': 'Journeyman', 'spell': 91240, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91241, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91242, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91243, 'chance': 40, 'tier_id': 4},
]

# Exclude creatures that use herbalism/mining/engineering gathering
NON_SKINNING_FLAGS = 256 | 512 | 32768

REF_START = 93000
REF_END = 95999
SLOT_START = 10000
OUTPUT_FILENAME = 'zz_[AUTO,F-001]_skinning_knife_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    """Generate skinning knife bonus yield SQL.

    Returns the path to the generated file.
    """
    output = output or default_output_path(craft_root, OUTPUT_FILENAME)

    loot_tables = _query_loot_tables()

    lines: List[str] = []
    _header(lines, loot_tables)
    items_by_entry = _phase1_references(lines, loot_tables)
    _phase2_linkage(lines, loot_tables, items_by_entry)
    _phase3_conditions(lines, loot_tables, items_by_entry)

    lines.append('-- Done!')
    output.write_text('\n'.join(lines) + '\n')
    return output


def _query_loot_tables() -> list:
    """Get unique skinning loot table entries (excluding herb/mining/engineering creatures)."""
    query = f"""
    SELECT DISTINCT slt.Entry, MIN(ct.name) as example_name
    FROM skinning_loot_template slt
    JOIN creature_template ct ON ct.skinloot = slt.Entry
    WHERE (ct.type_flags & {NON_SKINNING_FLAGS}) = 0
    GROUP BY slt.Entry
    ORDER BY slt.Entry;
    """
    rows = query_rows(query)
    return [{
        'entry': int(r[0]),
        'example_name': r[1] if len(r) > 1 and r[1] != 'NULL' else f'Entry {r[0]}',
    } for r in rows]


def _query_items(entry: int) -> list:
    """Get loot items for a skinning loot table (excluding references)."""
    query = f"""
    SELECT Item, Chance, QuestRequired, MinCount, MaxCount, Comment
    FROM skinning_loot_template
    WHERE Entry = {entry}
        AND Reference = 0
        AND Item > 0
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
    lines.append(f'-- Found {len(loot_tables)} unique skinning loot tables')
    lines.append('')
    lines.append('-- =====================================================')
    lines.append('-- SKINNING LOOT TABLE LIST (for review)')
    lines.append('-- =====================================================')
    for lt in loot_tables[:20]:
        lines.append(f"-- {lt['example_name']} (Loot Entry: {lt['entry']})")
    if len(loot_tables) > 20:
        lines.append(f"-- ... and {len(loot_tables) - 20} more entries")
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- =====================================================')
    lines.append('-- SKINNING KNIFE BONUS YIELD SYSTEM')
    lines.append('-- =====================================================')
    lines.append('-- Reference loot tables that duplicate skinning loot')
    lines.append("-- Provides bonus 'second roll' when skinning with knives")
    lines.append('-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)')
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- Cleanup existing entries')
    lines.append(f'DELETE FROM reference_loot_template WHERE Entry BETWEEN {REF_START} AND {REF_END};')
    lines.append(f'DELETE FROM skinning_loot_template WHERE Reference BETWEEN {REF_START} AND {REF_END};')
    lines.append('-- Clean up old broken conditions (SourceEntry=0) and new per-item conditions')
    lines.append(f'DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN {REF_START} AND {REF_END};')
    lines.append('')


def _phase1_references(lines: List[str], loot_tables: list) -> Dict[int, list]:
    """Phase 1: Create reference loot tables. Returns items_by_entry."""
    items_by_entry: Dict[int, list] = {}
    ref_id = REF_START

    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']

        items = _query_items(entry)
        items_by_entry[entry] = items

        if not items:
            ref_id += 4
            continue

        lines.append(f"-- {name} (Entry: {entry})")

        for tier in TIERS:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            lines.append(f"-- {name} - {tier_name} Knife Bonus (Ref {tier_ref_id})")
            for item in items:
                group_id = 1 if item['chance'] == 0 else 0
                lines.append(f"INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                lines.append(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, {group_id}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} Knife');")
            lines.append('')

        ref_id += 4
        lines.append('')

    return items_by_entry


def _phase2_linkage(lines: List[str], loot_tables: list, items_by_entry: dict):
    """Phase 2: Link references to skinning loot tables."""
    lines.append('-- =====================================================')
    lines.append('-- LINK REFERENCES TO SKINNING LOOT TABLES')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = REF_START
    item_slot_id = SLOT_START

    for lt in loot_tables:
        entry = lt['entry']

        if not items_by_entry.get(entry):
            ref_id += 4
            continue

        for tier in TIERS:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']
            lines.append(f"INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
            lines.append(f"    ({entry}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 0, 1, 1, '{tier['name']} Skinning Knife Bonus');")
            item_slot_id += 1

        ref_id += 4
        lines.append('')


def _phase3_conditions(lines: List[str], loot_tables: list, items_by_entry: dict):
    """Phase 3: Per-item conditions with NegativeCondition for mutual exclusion."""
    lines.append('-- =====================================================')
    lines.append('-- CONDITIONS (Check for active knife auras)')
    lines.append('-- =====================================================')
    lines.append('-- IMPORTANT: Uses mutually exclusive conditions to prevent bonus stacking')
    lines.append('-- Each tier bonus ONLY triggers if that specific tier is active')
    lines.append('-- AND no higher tier is active (prevents multiple bonuses)')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = REF_START
    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']
        sql_name = sql_escape(name)
        items = items_by_entry.get(entry, [])

        if not items:
            ref_id += 4
            continue

        for tier in TIERS:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            spell_id = tier['spell']

            lines.append(f"-- {name} - {tier_name} Skinning Knife conditions (Ref {tier_ref_id})")

            for item in items:
                item_id = item['item']

                # Positive condition: MUST have this tier's aura
                lines.append(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                lines.append(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{tier_name} Skinning Knife - {sql_name}');")

                # Negative conditions: MUST NOT have any higher tier's aura
                for higher_tier in TIERS:
                    if higher_tier['tier_id'] > tier['tier_id']:
                        higher_name = higher_tier['name']
                        higher_spell = higher_tier['spell']
                        lines.append(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                        lines.append(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {higher_spell}, 0, 0, 1, 'Block {tier_name} if {higher_name} active - {sql_name}');")

            lines.append('')

        ref_id += 4
        lines.append('')
