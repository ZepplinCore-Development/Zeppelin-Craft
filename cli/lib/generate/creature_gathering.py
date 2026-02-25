"""
Generate bonus yield SQL for creatures gathered with herbalism/mining.

Some creatures use skinning_loot_template but are gathered with herbalism or mining
(controlled by type_flags bits). The pruning shears and mining pick generators only
cover gameobject nodes, so this script extends bonus yield to creature gathering.

Uses the same per-item SourceEntry + NegativeCondition condition pattern.
"""

from pathlib import Path
from typing import Dict, List

from .common import query_rows, sql_escape, default_output_path

# Gathering type configs
GATHER_TYPES = [
    {
        'name': 'Herbalism',
        'type_flag': 256,
        'ref_start': 96000,
        'ref_end': 96099,
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
        'ref_end': 96599,
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

OUTPUT_FILENAME = 'zz_[AUTO,F-001]_creature_gathering_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    """Generate creature gathering bonus yield SQL.

    Returns the path to the generated file.
    """
    output = output or default_output_path(craft_root, OUTPUT_FILENAME)

    lines: List[str] = []
    lines.append('-- =====================================================')
    lines.append('-- CREATURE GATHERING BONUS YIELD SYSTEM')
    lines.append('-- =====================================================')
    lines.append('-- Extends pruning shears / mining pick bonus yield to creatures')
    lines.append("-- that are 'skinned' using herbalism or mining (type_flags)")
    lines.append('-- =====================================================')
    lines.append('')

    # Cleanup
    lines.append('-- Cleanup existing entries')
    lines.append('DELETE FROM reference_loot_template WHERE Entry BETWEEN 96000 AND 96099;')
    lines.append('DELETE FROM reference_loot_template WHERE Entry BETWEEN 96500 AND 96599;')
    lines.append('DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96000 AND 96099;')
    lines.append('DELETE FROM skinning_loot_template WHERE Reference BETWEEN 96500 AND 96599;')
    lines.append('DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96000 AND 96099;')
    lines.append('DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 96500 AND 96599;')
    lines.append('')

    total_tables = 0

    for gt in GATHER_TYPES:
        loot_tables = _query_loot_tables(gt['type_flag'])
        _generate_for_type(lines, gt, loot_tables)
        total_tables += len(loot_tables)

    lines.append('-- Done!')
    output.write_text('\n'.join(lines) + '\n')
    return output


def _query_loot_tables(type_flag: int) -> list:
    """Get unique skinning loot tables for a specific gather type."""
    query = f"""
    SELECT DISTINCT slt.Entry, MIN(ct.name) as example_name
    FROM skinning_loot_template slt
    JOIN creature_template ct ON ct.skinloot = slt.Entry
    WHERE (ct.type_flags & {type_flag}) != 0
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
    SELECT Item, Chance, QuestRequired, MinCount, MaxCount
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
    } for r in rows]


def _generate_for_type(lines: List[str], gt: dict, loot_tables: list):
    """Generate all 3 phases for a single gather type."""
    type_name = gt['name']
    tiers = gt['tiers']
    tool = gt['tool']

    lines.append(f'-- =====================================================')
    lines.append(f'-- {type_name.upper()} CREATURES ({len(loot_tables)} unique loot tables)')
    lines.append(f'-- Tool: {tool}')
    lines.append(f'-- =====================================================')
    for lt in loot_tables:
        lines.append(f"-- {lt['example_name']} (Loot Entry: {lt['entry']})")
    lines.append('')

    # Phase 1: Create reference loot tables
    items_by_entry: Dict[int, list] = {}
    ref_id = gt['ref_start']

    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']

        items = _query_items(entry)
        items_by_entry[entry] = items

        if not items:
            ref_id += 4
            continue

        lines.append(f"-- {name} (Entry: {entry})")
        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            lines.append(f"-- {name} - {tier_name} {tool} Bonus (Ref {tier_ref_id})")
            for item in items:
                group_id = 1 if item['chance'] == 0 else 0
                lines.append(f"INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                lines.append(f"    ({tier_ref_id}, {item['item']}, {item['chance']}, {group_id}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier_name} {tool}');")
            lines.append('')

        ref_id += 4
        lines.append('')

    # Phase 2: Link references to skinning loot tables
    lines.append(f'-- Link {type_name} creature references to skinning_loot_template')
    lines.append('')

    ref_id = gt['ref_start']
    item_slot_id = gt['slot_start']

    for lt in loot_tables:
        entry = lt['entry']
        if not items_by_entry.get(entry):
            ref_id += 4
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            chance = tier['chance']
            lines.append(f"INSERT INTO skinning_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
            lines.append(f"    ({entry}, {item_slot_id}, {tier_ref_id}, {chance}, 0, 1, 0, 1, 1, '{tier['name']} {tool} Bonus');")
            item_slot_id += 1

        ref_id += 4
        lines.append('')

    # Phase 3: Per-item conditions with NegativeCondition
    lines.append(f'-- {type_name} creature conditions (per-item with mutual exclusion)')
    lines.append('')

    ref_id = gt['ref_start']
    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']
        sql_name = sql_escape(name)
        items = items_by_entry.get(entry, [])

        if not items:
            ref_id += 4
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            tier_name = tier['name']
            spell_id = tier['spell']

            lines.append(f"-- {name} - {tier_name} {tool} conditions (Ref {tier_ref_id})")
            for item in items:
                item_id = item['item']

                # Positive: MUST have this tier's aura
                lines.append(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                lines.append(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{tier_name} {tool} - {sql_name}');")

                # Negative: MUST NOT have higher tier auras
                for higher_tier in tiers:
                    if higher_tier['tier_id'] > tier['tier_id']:
                        higher_name = higher_tier['name']
                        higher_spell = higher_tier['spell']
                        lines.append(f"INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                        lines.append(f"    (10, {tier_ref_id}, {item_id}, 0, 0, 1, 0, {higher_spell}, 0, 0, 1, 'Block {tier_name} if {higher_name} active - {sql_name}');")

            lines.append('')

        ref_id += 4
        lines.append('')
