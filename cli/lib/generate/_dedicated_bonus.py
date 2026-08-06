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

WHERE THE GATE HAS TO LIVE
--------------------------
AzerothCore only ever evaluates loot conditions on *plain item* rows:
`LootTemplate::Process` recurses into a reference row after `LootStoreItem::Roll`
without ever consulting that row's `conditions`, and the gate is applied later in
`LootItem::AllowedForPlayer`, which only exists for rows that produced an item.
A condition attached to a row with `Reference <> 0` loads without error and then
does nothing.

That matters because milling and prospecting store their drops *behind* nested
references (milling: 45/45 base rows are references). Mirroring such a row as a
reference row and hanging the aura condition on it produced a bonus roll that
fired for every player, tool or not (I-314).

So a mirrored reference row gets its own **sub-mirror** template: the reference
is copied verbatim one level down, and the conditions are attached to the plain
item rows inside the sub-mirror, where the core will actually read them.

Sub-mirrors also solve a second trap: `LootTemplate::addConditionItem` binds a
condition to the *first* row matching the item id and stops, so an item that
appears twice in one template can only ever be gated once. Giving every source
reference row its own sub-mirror keeps item ids unique within each template that
carries conditions (prospecting entry 23425 references ref 13001 twice).

Reference ids are drawn from one band: tier mirrors from the bottom up,
sub-mirrors from the top down, so the two never collide.
"""

from pathlib import Path
from typing import Dict, List, Tuple

from .common import query_rows, sql_escape, default_output_path

# Synthetic Item value for mirrored reference rows. Never gets a condition (the
# gate lives one level down in the sub-mirror) -- it only has to keep the
# (Entry, Item) primary key unique within the template.
SYNTHETIC_ITEM_BASE = 90000000

# Guard against a pathological reference chain; real data is 1 level deep.
MAX_REF_DEPTH = 5


class RefPool:
    """Hands out reference_loot_template ids from a single reserved band.

    Tier mirrors are allocated from the low end (stable ids across runs so
    diffs stay readable); sub-mirrors from the high end.
    """

    def __init__(self, start: int, end: int):
        self._start = start
        self._end = end
        self._next_top = start
        self._next_sub = end

    def take_block(self, n: int) -> int:
        """Reserve n consecutive ids for one entry's tier mirrors."""
        first = self._next_top
        self._next_top += n
        self._check()
        return first

    def take_sub(self) -> int:
        """Reserve one id for a sub-mirror."""
        sub = self._next_sub
        self._next_sub -= 1
        self._check()
        return sub

    def _check(self):
        if self._next_top > self._next_sub + 1:
            raise RuntimeError(
                f'reference id band {self._start}-{self._end} exhausted '
                f'(tier mirrors reached {self._next_top}, sub-mirrors reached '
                f'{self._next_sub}) -- widen the band'
            )


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
    pool = RefPool(ref_start, ref_end)
    ref_cache: Dict[int, list] = {}

    lines: List[str] = []
    _header(lines, loot_tables, loot_table, tiers, ref_start, ref_end, label, action)

    # Phase 1 builds the mirror templates and, as a side effect, records every
    # (template id, item id) pair the conditions have to gate.
    plan = _phase1_mirrors(lines, loot_tables, loot_table, tiers, pool,
                           ref_start, ref_end, label, ref_cache)
    _phase2_linkage(lines, plan, loot_table, slot_start, label)
    _phase3_conditions(lines, plan, tiers, label)

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


def _row(r) -> dict:
    return {
        'item': int(r[0]),
        'reference': int(r[1]),
        'chance': float(r[2]),
        'group_id': int(r[3]),
        'quest_req': int(r[4]),
        'min_count': int(r[5]),
        'max_count': int(r[6]),
    }


def _query_items(loot_table: str, entry: int, ref_start: int, ref_end: int) -> list:
    # Copy BOTH direct-item rows and reference rows (some tables -- milling,
    # prospecting -- store their drops behind nested references).
    #
    # Exclude this generator's OWN linkage rows (Reference in [ref_start,
    # ref_end]) that a prior apply already wrote into the live loot table --
    # otherwise regenerating against a live DB re-ingests them and the new
    # references recursively embed the bonus range, bloating the file.
    query = f"""
    SELECT Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount
    FROM {loot_table}
    WHERE Entry = {entry} AND (Item > 0 OR Reference > 0)
      AND NOT (Reference BETWEEN {ref_start} AND {ref_end})
    ORDER BY Item, Reference;
    """
    return [_row(r) for r in query_rows(query)]


def _query_reference_rows(ref_entry: int, ref_start: int, ref_end: int,
                          cache: Dict[int, list]) -> list:
    """Rows of a stock reference_loot_template, excluding our own band."""
    if ref_entry in cache:
        return cache[ref_entry]
    query = f"""
    SELECT Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount
    FROM reference_loot_template
    WHERE Entry = {ref_entry}
      AND NOT (Entry BETWEEN {ref_start} AND {ref_end})
    ORDER BY GroupId, Item;
    """
    rows = [_row(r) for r in query_rows(query)]
    cache[ref_entry] = rows
    return rows


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
    lines.append('--')
    lines.append('-- Aura conditions are attached to PLAIN ITEM rows only -- AzerothCore')
    lines.append('-- never evaluates conditions on rows with Reference <> 0, so a mirrored')
    lines.append('-- reference row gets a sub-mirror and the gate lives one level down.')
    lines.append('-- =====================================================')
    lines.append('')
    lines.append('-- Cleanup existing entries')
    lines.append(f'DELETE FROM reference_loot_template WHERE Entry BETWEEN {ref_start} AND {ref_end};')
    lines.append(f'DELETE FROM {loot_table} WHERE Reference BETWEEN {ref_start} AND {ref_end};')
    lines.append(f'DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN {ref_start} AND {ref_end};')
    lines.append('')


def _emit_ref_row(lines, template_id: int, item: int, reference: int, row: dict,
                  comment: str):
    lines.append('INSERT INTO reference_loot_template (Entry, Item, Reference, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES')
    lines.append(
        f"    ({template_id}, {item}, {reference}, {row['chance']}, {row['group_id']}, "
        f"0, {row['min_count']}, {row['max_count']}, '{comment}');"
    )


def _mirror_rows(lines, template_id: int, rows: list, pool: RefPool,
                 ref_start: int, ref_end: int, cache: Dict[int, list],
                 comment: str, gates: List[Tuple[int, int]],
                 depth: int, warnings: List[str], context: str):
    """Copy `rows` into reference template `template_id`.

    Plain item rows are copied verbatim and registered in `gates` so phase 3
    hangs the aura conditions on them. Reference rows are copied as references
    to a freshly allocated sub-mirror, which is filled by recursing -- that is
    where the gate ends up, because the core ignores conditions on the
    reference row itself.
    """
    if depth > MAX_REF_DEPTH:
        raise RuntimeError(
            f'{context}: reference chain deeper than {MAX_REF_DEPTH} levels'
        )

    seen = set()
    for idx, row in enumerate(rows):
        if row['reference'] > 0:
            sub_id = pool.take_sub()
            _emit_ref_row(lines, template_id, SYNTHETIC_ITEM_BASE + idx, sub_id,
                          row, f'{comment} (ref {row["reference"]})')
            sub_rows = _query_reference_rows(row['reference'], ref_start, ref_end, cache)
            if not sub_rows:
                warnings.append(f'{context}: reference {row["reference"]} has no rows')
                continue
            _mirror_rows(lines, sub_id, sub_rows, pool, ref_start, ref_end, cache,
                         comment, gates, depth + 1, warnings, context)
        else:
            _emit_ref_row(lines, template_id, row['item'], 0, row, comment)
            if row['item'] in seen:
                # addConditionItem binds to the first matching item id and stops,
                # so a duplicate here would be left ungated.
                warnings.append(
                    f'{context}: item {row["item"]} appears twice in template '
                    f'{template_id}; only the first copy can be gated'
                )
                continue
            seen.add(row['item'])
            gates.append((template_id, row['item']))


def _phase1_mirrors(lines, loot_tables, loot_table, tiers, pool: RefPool,
                    ref_start, ref_end, label, cache) -> List[dict]:
    """Emit every mirror template. Returns the linkage/condition plan."""
    n = len(tiers)
    plan: List[dict] = []
    warnings: List[str] = []

    for lt in loot_tables:
        entry = lt['entry']
        name = lt['example_name']

        rows = _query_items(loot_table, entry, ref_start, ref_end)
        if not rows:
            continue

        block = pool.take_block(n)
        lines.append(f"-- {name} (Entry: {entry})")

        tier_plan = []
        for tier in tiers:
            tier_ref_id = block + (tier['tier_id'] - 1)
            comment = f"Bonus from {tier['name']} {sql_escape(label)}"
            lines.append(f"-- {name} - {tier['name']} {label} Bonus (Ref {tier_ref_id})")

            gates: List[Tuple[int, int]] = []
            _mirror_rows(lines, tier_ref_id, rows, pool, ref_start, ref_end, cache,
                         comment, gates, 1, warnings,
                         context=f'{name} (Entry {entry}) {tier["name"]}')
            lines.append('')

            tier_plan.append({'tier': tier, 'ref_id': tier_ref_id, 'gates': gates})

        plan.append({'entry': entry, 'name': name, 'tiers': tier_plan})
        lines.append('')

    if warnings:
        lines.append('-- =====================================================')
        lines.append('-- GENERATOR WARNINGS')
        lines.append('-- =====================================================')
        for w in warnings:
            lines.append(f'-- WARNING: {w}')
        lines.append('')

    return plan


def _phase2_linkage(lines, plan, loot_table, slot_start, label):
    lines.append('-- =====================================================')
    lines.append(f'-- LINK REFERENCES TO {loot_table.upper()}')
    lines.append('-- =====================================================')
    lines.append('')

    item_slot_id = slot_start
    for row in plan:
        entry = row['entry']
        for tp in row['tiers']:
            tier = tp['tier']
            lines.append(f"INSERT INTO {loot_table} (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
            lines.append(f"    ({entry}, {item_slot_id}, {tp['ref_id']}, {tier['chance']}, 0, 1, 0, 1, 1, '{tier['name']} {sql_escape(label)} Bonus');")
            item_slot_id += 1
        lines.append('')


def _phase3_conditions(lines, plan, tiers, label):
    lines.append('-- =====================================================')
    lines.append(f'-- CONDITIONS (Check for active {label} auras)')
    lines.append('-- Mutually exclusive: a tier bonus rolls only if that tier')
    lines.append('-- is active AND no higher tier is active (no stacking).')
    lines.append('--')
    lines.append('-- SourceGroup is the template that actually holds the item row --')
    lines.append('-- a sub-mirror when the source drop sat behind a reference.')
    lines.append('-- =====================================================')
    lines.append('')

    by_tier_id = {t['tier_id']: t for t in tiers}

    for row in plan:
        name = row['name']
        sql_name = sql_escape(name)
        for tp in row['tiers']:
            tier = tp['tier']
            spell_id = tier['spell']
            lines.append(f"-- {name} - {tier['name']} {label} conditions (Ref {tp['ref_id']})")
            for template_id, item_id in tp['gates']:
                lines.append("INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                lines.append(f"    (10, {template_id}, {item_id}, 0, 0, 1, 0, {spell_id}, 0, 0, 0, '{tier['name']} {sql_escape(label)} - {sql_name}');")
                for higher_id in sorted(by_tier_id):
                    if higher_id <= tier['tier_id']:
                        continue
                    higher = by_tier_id[higher_id]
                    lines.append("INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES")
                    lines.append(f"    (10, {template_id}, {item_id}, 0, 0, 1, 0, {higher['spell']}, 0, 0, 1, 'Block {tier['name']} if {higher['name']} active - {sql_name}');")
            lines.append('')
        lines.append('')
