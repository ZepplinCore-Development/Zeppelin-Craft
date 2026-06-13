"""
Generic bonus-yield generator for professions whose gathering action has its
own dedicated loot table (milling, prospecting, disenchanting).

Same 'second roll' pattern as the skinning knife: for every base loot table we
build one reference_loot_template per tool tier (duplicating the base drops),
link it back into the dedicated loot table at the tier's chance, and gate it
with a CONDITION_AURA (type 10 / cond 1) on the tool buff -- plus negative
conditions so only the highest active tier's bonus rolls (no stacking).

Unlike skinning (which joins creature_template) the source query is just the
distinct entries of the dedicated loot table, so this is shared by all three.
"""

from pathlib import Path
from typing import Dict, List

from .common import query_rows, sql_escape, default_output_path


def generate_bonus(craft_root: Path, *, loot_table: str, tiers: List[dict],
                   ref_start: int, ref_end: int, output_filename: str,
                   label: str, action: str, slot_start: int = 10000,
                   output: Path = None) -> Path:
    """Generate a dedicated-loot-table bonus-yield SQL file.

    loot_table: e.g. 'milling_loot_template'
    tiers: list of {'name', 'spell', 'chance', 'tier_id'} (tier_id 1..N)
    label: tool family name for comments, e.g. 'Writing Table'
    action: gathering verb for comments, e.g. 'milling'
    """
    output = output or default_output_path(craft_root, output_filename)
    n = len(tiers)

    loot_tables = _query_loot_tables(loot_table)

    lines: List[str] = []
    _header(lines, loot_tables, loot_table, tiers, ref_start, ref_end, label, action)
    items_by_entry = _phase1_references(lines, loot_tables, loot_table, tiers, ref_start, label, n)
    _phase2_linkage(lines, loot_tables, items_by_entry, loot_table, tiers, ref_start, slot_start, label, n)
    _phase3_conditions(lines, loot_tables, items_by_entry, tiers, ref_start, label, action, n)

    lines.append('-- Done!')
    output.write_text('\n'.join(lines) + '\n')
    return output


def _query_loot_tables(loot_table: str) -> list:
    query = f"""
    SELECT lt.Entry, MIN(it.name) AS example_name
    FROM {loot_table} lt
    LEFT JOIN item_template it ON it.entry = lt.Entry
    WHERE lt.Item > 0 OR lt.Reference > 0
    GROUP BY lt.Entry
    ORDER BY lt.Entry;
    """
    rows = query_rows(query)
    return [{
        'entry': int(r[0]),
        'example_name': r[1] if len(r) > 1 and r[1] not in ('NULL', '', None) else f"Entry {r[0]}",
    } for r in rows]


def _query_items(loot_table: str, entry: int) -> list:
    # Copy BOTH direct-item rows and reference rows (some tables -- milling,
    # prospecting -- store their drops behind nested references). Reference
    # rows get a synthetic, per-entry-unique placeholder Item so the mirror
    # row and its gating condition share a stable (Entry, Item) key.
    query = f"""
    SELECT Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment
    FROM {loot_table}
    WHERE Entry = {entry} AND (Item > 0 OR Reference > 0)
    ORDER BY Item, Reference;
    """
    rows = query_rows(query)
    items = []
    for idx, r in enumerate(rows):
        item = int(r[0])
        reference = int(r[1])
        source_id = (90000000 + idx) if reference > 0 else item
        items.append({
            'item': item,
            'reference': reference,
            'source_id': source_id,
            'chance': float(r[2]),
            'quest_req': int(r[3]),
            'min_count': int(r[4]),
            'max_count': int(r[5]),
            'comment': r[6] if len(r) > 6 else '',
        })
    return items


def _header(lines, loot_tables, loot_table, tiers, ref_start, ref_end, label, action):
    tier_summary = ', '.join(f"{t['name']} ({t['chance']}%)" for t in tiers)
    lines.append(f'-- Found {len(loot_tables)} unique {action} loot tables')
    lines.append('')
    lines.append('-- =====================================================')
    lines.append(f'-- {label.upper()} BONUS YIELD SYSTEM ({action})')
    lines.append('-- =====================================================')
    lines.append(f"-- Reference loot tables that duplicate {action} loot")
    lines.append(f"-- Provides a bonus 'second roll' when {action} with a {label}")
    lines.append(f'-- Tiers: {tier_summary}')
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- Cleanup existing entries')
    lines.append(f'DELETE FROM reference_loot_template WHERE Entry BETWEEN {ref_start} AND {ref_end};')
    lines.append(f'DELETE FROM {loot_table} WHERE Reference BETWEEN {ref_start} AND {ref_end};')
    lines.append(f'DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN {ref_start} AND {ref_end};')
    lines.append('')


def _phase1_references(lines, loot_tables, loot_table, tiers, ref_start, label, n) -> Dict[int, list]:
    items_by_entry: Dict[int, list] = {}
    ref_id = ref_start

    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']

        items = _query_items(loot_table, entry)
        items_by_entry[entry] = items

        if not items:
            ref_id += n
            continue

        lines.append(f"-- {name} (Entry: {entry})")
        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            lines.append(f"-- {name} - {tier['name']} {label} Bonus (Ref {tier_ref_id})")
            for item in items:
                group_id = 1 if item['chance'] == 0 else 0
                ref_val = item['reference'] if item['reference'] > 0 else 0
                lines.append("INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES")
                lines.append(f"    ({tier_ref_id}, {item['source_id']}, {ref_val}, {item['chance']}, {group_id}, 0, {item['min_count']}, {item['max_count']}, 'Bonus from {tier['name']} {sql_escape(label)}');")
            lines.append('')

        ref_id += n
        lines.append('')

    return items_by_entry


def _phase2_linkage(lines, loot_tables, items_by_entry, loot_table, tiers, ref_start, slot_start, label, n):
    lines.append('-- =====================================================')
    lines.append(f'-- LINK REFERENCES TO {loot_table.upper()}')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = ref_start
    item_slot_id = slot_start

    for lt in loot_tables:
        entry = lt['entry']
        if not items_by_entry.get(entry):
            ref_id += n
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            lines.append(f"INSERT INTO {loot_table} (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
            lines.append(f"    ({entry}, {item_slot_id}, {tier_ref_id}, {tier['chance']}, 0, 1, 0, 1, 1, '{tier['name']} {sql_escape(label)} Bonus');")
            item_slot_id += 1

        ref_id += n
        lines.append('')


def _phase3_conditions(lines, loot_tables, items_by_entry, tiers, ref_start, label, action, n):
    lines.append('-- =====================================================')
    lines.append(f'-- CONDITIONS (Check for active {label} auras)')
    lines.append('-- Mutually exclusive: a tier bonus rolls only if that tier')
    lines.append('-- is active AND no higher tier is active (no stacking).')
    lines.append('-- =====================================================')
    lines.append('')

    ref_id = ref_start
    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']
        sql_name = sql_escape(name)
        items = items_by_entry.get(entry, [])

        if not items:
            ref_id += n
            continue

        for tier in tiers:
            tier_ref_id = ref_id + (tier['tier_id'] - 1)
            spell_id = tier['spell']
            lines.append(f"-- {name} - {tier['name']} {label} conditions (Ref {tier_ref_id})")
            for item in items:
                source_id = item['source_id']
                lines.append("INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                lines.append(f"    (10, {tier_ref_id}, {source_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{tier['name']} {sql_escape(label)} - {sql_name}');")
                for higher in tiers:
                    if higher['tier_id'] > tier['tier_id']:
                        lines.append("INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                        lines.append(f"    (10, {tier_ref_id}, {source_id}, 0, 0, 1, 0, {higher['spell']}, 0, 0, 1, 'Block {tier['name']} if {higher['name']} active - {sql_name}');")
            lines.append('')

        ref_id += n
        lines.append('')
