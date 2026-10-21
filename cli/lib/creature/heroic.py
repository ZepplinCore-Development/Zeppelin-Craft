"""
Heroic & Mythic Creature Generator

Creates heroic and mythic versions of dungeon creatures with scaled stats.
Duplicates creature_template rows with new IDs and links them via
difficulty_entry_1 (heroic) and difficulty_entry_2 (mythic).
Also copies creature_template_model entries and updates spawnMask.
"""

import json
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .common import DATA_DIR, get_db_connection, seed_random, write_sql_file
from ..loot.satchel import cache_items_for_tier
from ..loot.sectioned_file import (
    COMBINED_FILENAME, SECTION_F074, SECTION_ORDER, FILE_HEADER, combined_path,
)
from ..sectioned_sql import write_section

# Legacy filename — kept as a constant for backwards compat with callers that
# expect a path to write to. The actual output now goes into the combined
# sectioned file (COMBINED_FILENAME) via `write_section` below.
OUTPUT_FILENAME = COMBINED_FILENAME

COLUMNS = [
    "difficulty_entry_1",
    "difficulty_entry_2",
    "name",
    "subname",
    "minlevel",
    "maxlevel",
    "DamageModifier",
    "lootid",
    "AIName",
    "HealthModifier",
    "ScriptName",
]


@dataclass
class StatModifiers:
    boss_health_min: float
    boss_health_max: float
    boss_damage_min: float
    boss_damage_max: float
    rare_health_min: float
    rare_health_max: float
    rare_damage_min: float
    rare_damage_max: float
    elite_health_min: float
    elite_health_max: float
    elite_damage_min: float
    elite_damage_max: float
    normal_health_min: float
    normal_health_max: float
    normal_damage_min: float
    normal_damage_max: float


HEROIC_STATS = StatModifiers(
    boss_health_min=5.8, boss_health_max=6.5,
    boss_damage_min=4.9, boss_damage_max=5.1,
    rare_health_min=4.8, rare_health_max=5.5,
    rare_damage_min=3.9, rare_damage_max=4.1,
    elite_health_min=2.8, elite_health_max=3.5,
    elite_damage_min=1.9, elite_damage_max=2.1,
    normal_health_min=1.8, normal_health_max=2.5,
    normal_damage_min=0.9, normal_damage_max=1.1,
)

MYTHIC_STATS = StatModifiers(
    boss_health_min=7.8, boss_health_max=8.5,
    boss_damage_min=6.9, boss_damage_max=7.1,
    rare_health_min=6.8, rare_health_max=7.5,
    rare_damage_min=5.9, rare_damage_max=6.1,
    elite_health_min=3.8, elite_health_max=4.5,
    elite_damage_min=2.9, elite_damage_max=3.1,
    normal_health_min=2.8, normal_health_max=3.5,
    normal_damage_min=1.9, normal_damage_max=2.1,
)

# Maps challenge tier to (damage_min, damage_max, health_min, health_max) attribute names
CHALLENGE_TIERS = {
    "boss": ("boss_damage_min", "boss_damage_max", "boss_health_min", "boss_health_max"),
    "elite": ("elite_damage_min", "elite_damage_max", "elite_health_min", "elite_health_max"),
    "rare": ("rare_damage_min", "rare_damage_max", "rare_health_min", "rare_health_max"),
    "normal": ("normal_damage_min", "normal_damage_max", "normal_health_min", "normal_health_max"),
}

# Processing order for creature groups
CHALLENGE_ORDER = ["elite", "boss", "rare", "normal"]


def load_dungeons() -> Dict:
    """Load dungeon definitions from data/creatures_heroic.json."""
    json_file = DATA_DIR / "creatures_heroic.json"
    if not json_file.exists():
        raise FileNotFoundError(f"Dungeon definitions not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    return {k: v for k, v in data.items() if not k.startswith("_")}


def fetch_creature(cursor, entry: int) -> Optional[Dict]:
    """Fetch creature data from database."""
    column_names = ", ".join([f"`{col}`" for col in COLUMNS])
    cursor.execute(
        f"SELECT {column_names} FROM `creature_template` WHERE `entry` = %s",
        (entry,)
    )
    result = cursor.fetchone()
    if result:
        return dict(zip(COLUMNS, result))
    return None


def modify_creature(
    row: Dict, challenge: str, is_mythic: bool, new_entry: int
) -> Tuple[Dict, str, str, int]:
    """Modify creature stats based on challenge type and difficulty.

    The clone's lootid is set to its own entry (new_entry) so each clone
    has a unique creature_loot_template that mirrors the base creature's
    loot rows and adds cache references on top. The base lootid is
    returned so the caller can emit the copy-from-base SQL.

    Returns (modified_row, original_name, prefixed_name, base_lootid).
    """
    base_lootid = row["lootid"]

    creature_name = row["name"]
    prefix = "Mythic " if is_mythic else "Heroic "
    row["name"] = f"{prefix}{creature_name}"
    prefixed_name = row["name"]

    row["difficulty_entry_1"] = 0
    row["difficulty_entry_2"] = 0
    row["AIName"] = ""
    row["ScriptName"] = ""

    level = 63 if challenge == "boss" else 60
    row["minlevel"] = level
    row["maxlevel"] = level

    stats = MYTHIC_STATS if is_mythic else HEROIC_STATS

    if challenge in CHALLENGE_TIERS:
        dmg_min, dmg_max, hp_min, hp_max = CHALLENGE_TIERS[challenge]
        row["DamageModifier"] = round(
            random.uniform(getattr(stats, dmg_min), getattr(stats, dmg_max)), 2
        )
        row["HealthModifier"] = round(
            random.uniform(getattr(stats, hp_min), getattr(stats, hp_max)), 2
        )

    # Clone gets its own lootid (= its own entry) so we can preserve base
    # creature drops AND bolt on cache references. Exception: a boss whose base
    # has no loot (lootid=0) gets no rows from generate_loot_sql (caches belong
    # on the encounter GO chest), so it keeps lootid=0 - pointing it at its own
    # empty entry logged "creature_loot_template Entry N does not exist" (I-383).
    if challenge == "boss" and base_lootid == 0:
        row["lootid"] = 0
    else:
        row["lootid"] = new_entry

    return row, creature_name, prefixed_name, base_lootid


def generate_sql(
    modified: Dict, new_entry: int, entry: int,
    is_mythic: bool, map_id: int,
    creature_name: str, prefixed_name: str
) -> List[str]:
    """Generate SQL queries to duplicate and update a creature template."""
    lines = []

    lines.append(f"-- Processing: {prefixed_name}")
    lines.append("")

    # Delete any existing entry with this ID
    lines.append(f"-- Delete Creature Template for {prefixed_name}")
    lines.append(f"DELETE FROM `creature_template` WHERE entry = {new_entry};")
    lines.append("")

    # Clone original creature with new entry ID via temp table
    lines.append(f"-- Create creature template for {prefixed_name} from a copy of {creature_name}")
    lines.append("CREATE TEMPORARY TABLE `temp_creature` LIKE `creature_template`;")
    lines.append(f"INSERT INTO `temp_creature` SELECT * FROM `creature_template` WHERE `entry` = {entry};")
    lines.append(f"UPDATE `temp_creature` SET `entry` = {new_entry};")
    lines.append("INSERT INTO `creature_template` SELECT * FROM `temp_creature`;")
    lines.append("DROP TEMPORARY TABLE `temp_creature`;")
    lines.append("")

    # Build UPDATE for modified columns
    update_fields = []
    for col in COLUMNS:
        value = modified[col]
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        elif isinstance(value, str):
            escaped = value.replace("'", "''")
            update_fields.append(f"    `{col}` = '{escaped}'")
        else:
            update_fields.append(f"    `{col}` = {value}")

    lines.append(f"-- Override the values for {prefixed_name}")
    lines.append("UPDATE `creature_template` SET")
    lines.append(",\n".join(update_fields))
    lines.append(f"WHERE `entry` = {new_entry};")
    lines.append("")

    # Link original creature to this difficulty version
    difficulty_field = "difficulty_entry_2" if is_mythic else "difficulty_entry_1"
    lines.append(f"-- Link {creature_name} to {prefixed_name}")
    lines.append("UPDATE `creature_template`")
    lines.append(f"SET `{difficulty_field}` = {new_entry}")
    lines.append(f"WHERE `entry` = {entry};")
    lines.append("")

    # Copy creature model entries
    lines.append(f"-- Copy creature models for {prefixed_name}")
    lines.append(f"DELETE FROM `creature_template_model` WHERE `CreatureID` = {new_entry};")
    lines.append(f"INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)")
    lines.append(f"SELECT {new_entry}, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`")
    lines.append(f"FROM `creature_template_model` WHERE `CreatureID` = {entry};")
    lines.append("")

    # Update spawn masks for this creature on the dungeon map
    lines.append(f"-- Update {creature_name} spawn masks for the dungeon map")
    lines.append("UPDATE `creature`")
    lines.append("SET `spawnMask` = 7")
    lines.append(f"WHERE `id` = {entry} AND `map` = {map_id};")
    lines.append("")

    return lines


def ref_expansion_sql(new_entry: int, base_lootid: int) -> str:
    """INSERT that flattens the base lootid's Reference rows into the clone.

    Each pool item gets the probability it had of dropping from the base
    creature: chance = P(parent ref row fires) x P(item | pool opened) / 100.
      - P(parent): its Chance; for an equal-chance (0) row in a group, the
        group's leftover share (100 - explicit) / equal-chance entries.
      - P(item): its Chance when ungrouped or explicit; for an equal-chance
        item, its pool group's leftover share split the same way.
    Copying the pool items at their own chance alone (before 2026-10-20) dropped
    the parent's gate: Old Serra'kis's 5% ref 24070 became a guaranteed item
    every kill, about 6.6 extra items per clone kill against 0.1 on the base.
    Items that can never drop (P = 0) are skipped; a chance-0 row in a group
    would otherwise read as equal-chance.

    GroupId remap (I-383): every ref numbers its own groups from 1, and so does
    the base table. Each distinct (ref, ref group) gets its own group above the
    base table's highest direct group (@zep_ref_group_base), so a pool group
    totals exactly its parent's P and never merges with the boss's drops. Max
    needed across all clones is 22 (GroupId must stay < 128). A pool's ungrouped
    items stay ungrouped. Per-item odds match the base creature; the one-pool-
    per-pick correlation of a grouped parent is not kept (no base group mixes
    equal-chance direct items with refs, so the boss's own drops are unaffected).
    A parent MaxCount > 1 (open the pool N times) is applied once.
    """
    p = ("IF(clt.GroupId = 0 OR clt.Chance > 0, clt.Chance, "
         "GREATEST(0, 100 - pg.expl) / pg.neq)")
    i = ("IF(rlt.GroupId = 0 OR rlt.Chance > 0, rlt.Chance, "
         "GREATEST(0, 100 - rg.expl) / rg.neq)")
    return (
        f"INSERT IGNORE INTO `creature_loot_template` "
        f"(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, "
        f"`LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) "
        f"SELECT {new_entry}, rlt.Item, rlt.Reference, ROUND({p} * {i} / 100, 6), "
        f"rlt.QuestRequired, rlt.LootMode, IF(rlt.GroupId = 0, 0, @zep_ref_group_base + "
        f"DENSE_RANK() OVER (PARTITION BY rlt.GroupId = 0 "
        f"ORDER BY clt.Reference, rlt.GroupId)), rlt.MinCount, rlt.MaxCount, "
        f"CONCAT('expanded from ref ', clt.Reference, ' at ', ROUND({p}, 4), '%') "
        f"FROM `creature_loot_template` clt "
        f"LEFT JOIN (SELECT GroupId, SUM(Chance) expl, SUM(Chance = 0) neq "
        f"FROM `creature_loot_template` WHERE Entry = {base_lootid} AND GroupId > 0 "
        f"GROUP BY GroupId) pg ON pg.GroupId = clt.GroupId "
        f"JOIN `reference_loot_template` rlt ON rlt.Entry = clt.Reference "
        f"LEFT JOIN (SELECT Entry, GroupId, SUM(Chance) expl, SUM(Chance = 0) neq "
        f"FROM `reference_loot_template` WHERE GroupId > 0 AND Entry IN "
        f"(SELECT Reference FROM `creature_loot_template` WHERE Entry = {base_lootid} "
        f"AND Reference > 0) GROUP BY Entry, GroupId) rg "
        f"ON rg.Entry = rlt.Entry AND rg.GroupId = rlt.GroupId "
        f"WHERE clt.Entry = {base_lootid} AND clt.Reference > 0 AND rlt.Item > 0 "
        f"AND {p} * {i} > 0;"
    )


def generate_loot_sql(
    new_entry: int, base_lootid: int, challenge: str,
    cache_armor_entry: int, cache_weapon_entry: int,
    creature_name: str,
) -> List[str]:
    """Emit creature_loot_template rows for the clone's own lootid.

    Each clone uses its own creature entry as its lootid. The loot table:
      1. Copies all rows from the base creature's lootid (preserves vanilla
         drops including quest items, cloth, coins, etc.)
      2. Adds the heroic/mythic cache references on top.

    Bosses get both caches at 100% (GroupId=0, independent guaranteed drops).
    Trash gets one cache at 0.5% each in a shared group of its own (1% combined).
    """
    is_boss = challenge == "boss"
    lines = [
        f"-- Loot table for {creature_name} (lootid {new_entry})",
        f"DELETE FROM `creature_loot_template` WHERE `Entry` = {new_entry};",
    ]
    if base_lootid and base_lootid != new_entry:
        lines.append(
            f"-- Inherit base creature loot from lootid {base_lootid} —"
            f" direct items copied as-is, Reference rows expanded into direct"
            f" item rows from reference_loot_template so F-179's UPDATE-by-Item"
            f" wiring can swap stock→scaled without touching shared refs."
        )
        # Direct items (Item > 0, Reference = 0)
        lines.append(
            f"INSERT INTO `creature_loot_template` "
            f"(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, "
            f"`LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)"
        )
        lines.append(
            f"SELECT {new_entry}, `Item`, `Reference`, `Chance`, `QuestRequired`, "
            f"`LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment` "
            f"FROM `creature_loot_template` WHERE `Entry` = {base_lootid} "
            f"AND `Reference` = 0;"
        )
        # Reference rows: expand each ref row into the items from the ref pool.
        # A pool row can itself be a NESTED reference (Reference > 0), whose Item
        # is only a row key (1, 2, 3...). Carry its Reference across so it stays a
        # reference: zeroing it turned every nested pool into a drop of item 1..24
        # (Errors.log flood, lost world/zone loot, item 17 Martin Fury, I-383).
        # INSERT IGNORE because the same Item may appear via multiple paths
        # (direct + via a ref, or in two different refs the creature uses).
        # creature_loot_template PRIMARY KEY is (Entry, Item, Reference)
        # so collisions on Item across legs would otherwise fail the apply.
        lines.append(
            f"SET @zep_ref_group_base := (SELECT COALESCE(MAX(`GroupId`), 0) "
            f"FROM `creature_loot_template` WHERE `Entry` = {base_lootid} "
            f"AND `Reference` = 0);"
        )
        lines.append(ref_expansion_sql(new_entry, base_lootid))

    # Skip cache drops on bosses with no creature loot table (lootid=0).
    # These are multi-add or event-driven encounters where the actual
    # encounter reward lives on a gameobject chest (e.g. Seven Hidden /
    # Chest of the Seven, Atiesh / Strath summoning event). Cache drops
    # should be added to the GO chest instead.
    if is_boss and base_lootid == 0:
        lines.append(
            f"-- {creature_name} has no creature loot (lootid=0); "
            f"cache drops belong on the encounter's GO chest, not this kill"
        )
        lines.append("")
        return lines

    # Cache references — boss = 25% each (F-179 Phase 5: was 100%, lowered so
    # bosses primarily drop F-179 scaled stock loot, with caches as a 1-in-4
    # bonus per type. LFG daily completion guarantees both caches via
    # zz_[F-179]_lfg_cache_rewards.sql, so players still have a reliable
    # source). Trash = 0.5% each in one shared group (1% total). That group is
    # the next free GroupId on the clone's table, not a fixed 1: a fixed 1 merged
    # the caches into the base's group 1 (I-383, see the ref remap above).
    if is_boss:
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_armor_entry}, "
            f"`Reference` = 0, `Chance` = 25, `MaxCount` = 1, "
            f"`Comment` = 'boss armor cache (25%)';"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_weapon_entry}, "
            f"`Reference` = 0, `Chance` = 25, `MaxCount` = 1, "
            f"`Comment` = 'boss weapon cache (25%)';"
        )
    else:
        lines.append(
            f"SET @zep_cache_group := (SELECT COALESCE(MAX(`GroupId`), 0) + 1 "
            f"FROM `creature_loot_template` WHERE `Entry` = {new_entry});"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_armor_entry}, "
            f"`Reference` = 0, `Chance` = 0.5, `GroupId` = @zep_cache_group, `MaxCount` = 1, "
            f"`Comment` = 'trash armor cache (0.5%)';"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_weapon_entry}, "
            f"`Reference` = 0, `Chance` = 0.5, `GroupId` = @zep_cache_group, `MaxCount` = 1, "
            f"`Comment` = 'trash weapon cache (0.5%)';"
        )
    lines.append("")
    return lines


def generate_blanket_postprocessing(dungeons: Dict) -> List[str]:
    """Generate blanket spawnMask and creature_template_model copy queries.

    Catches ambient creatures not in the JSON definitions and any orphaned
    model entries that per-creature processing might miss.
    """
    lines = []

    # Collect all map IDs
    map_ids = sorted(set(d["map_id"] for d in dungeons.values()))
    map_list = ", ".join(str(m) for m in map_ids)

    # Collect entry ranges for blanket model copy
    entry_ranges = []
    for dungeon_data in dungeons.values():
        start = dungeon_data["entry_start"]
        total = sum(
            len(dungeon_data.get(tier, []))
            for tier in CHALLENGE_ORDER
        ) * 2  # heroic + mythic
        if total > 0:
            entry_ranges.append((start, start + total - 1))

    if not entry_ranges:
        return lines

    range_min = min(r[0] for r in entry_ranges)
    range_max = max(r[1] for r in entry_ranges)

    lines.append("-- ===========================================")
    lines.append("-- Blanket postprocessing")
    lines.append("-- ===========================================")
    lines.append("")

    # Blanket spawnMask for all creatures in dungeon maps
    lines.append("-- Blanket spawnMask update for ALL creatures in classic dungeon maps")
    lines.append("UPDATE `creature` SET `spawnMask` = 7")
    lines.append(f"WHERE `map` IN ({map_list})")
    lines.append("AND `spawnMask` != 7;")
    lines.append("")

    # Blanket creature_template_model copy for heroic clones (difficulty_entry_1)
    lines.append("-- Blanket creature_template_model copy for heroic clones (difficulty_entry_1)")
    lines.append("INSERT IGNORE INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)")
    lines.append("SELECT ct_base.difficulty_entry_1, ctm.`Idx`, ctm.`CreatureDisplayID`, ctm.`DisplayScale`, ctm.`Probability`, ctm.`VerifiedBuild`")
    lines.append("FROM creature_template ct_base")
    lines.append("JOIN creature_template_model ctm ON ctm.CreatureID = ct_base.entry")
    lines.append(f"WHERE ct_base.difficulty_entry_1 >= {range_min} AND ct_base.difficulty_entry_1 <= {range_max};")
    lines.append("")

    # Blanket creature_template_model copy for mythic clones (difficulty_entry_2)
    lines.append("-- Blanket creature_template_model copy for mythic clones (difficulty_entry_2)")
    lines.append("INSERT IGNORE INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`)")
    lines.append("SELECT ct_base.difficulty_entry_2, ctm.`Idx`, ctm.`CreatureDisplayID`, ctm.`DisplayScale`, ctm.`Probability`, ctm.`VerifiedBuild`")
    lines.append("FROM creature_template ct_base")
    lines.append("JOIN creature_template_model ctm ON ctm.CreatureID = ct_base.entry")
    lines.append(f"WHERE ct_base.difficulty_entry_2 >= {range_min} AND ct_base.difficulty_entry_2 <= {range_max};")
    lines.append("")

    return lines


def run(
    output_path: Path,
    seed: Optional[int] = None,
    verbose: bool = True
) -> Tuple[int, int]:
    """Run the Heroic & Mythic Creature Generator.

    Args:
        output_path: Path to write the output SQL file.
        seed: Optional random seed for reproducibility.
        verbose: If True, print progress to stdout.

    Returns:
        Tuple of (creatures_processed, creatures_not_found).
    """
    seed_random(seed)
    dungeons = load_dungeons()
    all_queries = []
    processed = 0
    not_found = 0

    conn = get_db_connection()
    try:
        cursor = conn.cursor()

        for dungeon_name, dungeon_data in dungeons.items():
            all_queries.append(f"-- {dungeon_name}")
            all_queries.append("")

            new_entry = dungeon_data["entry_start"]
            map_id = dungeon_data["map_id"]
            dungeon_tier = dungeon_data["tier"]
            cache_h_armor, cache_h_weapon = cache_items_for_tier(dungeon_tier, is_mythic=False)
            cache_m_armor, cache_m_weapon = cache_items_for_tier(dungeon_tier, is_mythic=True)

            creature_groups = [
                (tier, dungeon_data.get(tier, []))
                for tier in CHALLENGE_ORDER
            ]

            # Heroic pass
            for challenge, creature_ids in creature_groups:
                for entry_id in creature_ids:
                    creature = fetch_creature(cursor, entry_id)
                    if creature is None:
                        if verbose:
                            print(f"  Warning: No creature found with entry {entry_id}")
                        not_found += 1
                        new_entry += 1
                        continue

                    modified, name, prefixed, base_lootid = modify_creature(
                        creature, challenge, is_mythic=False, new_entry=new_entry,
                    )
                    queries = generate_sql(
                        modified, new_entry, entry_id,
                        is_mythic=False, map_id=map_id,
                        creature_name=name, prefixed_name=prefixed
                    )
                    all_queries.extend(queries)
                    all_queries.extend(generate_loot_sql(
                        new_entry, base_lootid, challenge,
                        cache_h_armor, cache_h_weapon, prefixed
                    ))
                    processed += 1
                    new_entry += 1

                    if verbose:
                        print(f"  {prefixed} ({entry_id} -> {new_entry - 1})")

            # Mythic pass
            for challenge, creature_ids in creature_groups:
                for entry_id in creature_ids:
                    creature = fetch_creature(cursor, entry_id)
                    if creature is None:
                        if verbose:
                            print(f"  Warning: No creature found with entry {entry_id}")
                        not_found += 1
                        new_entry += 1
                        continue

                    modified, name, prefixed, base_lootid = modify_creature(
                        creature, challenge, is_mythic=True, new_entry=new_entry,
                    )
                    queries = generate_sql(
                        modified, new_entry, entry_id,
                        is_mythic=True, map_id=map_id,
                        creature_name=name, prefixed_name=prefixed
                    )
                    all_queries.extend(queries)
                    all_queries.extend(generate_loot_sql(
                        new_entry, base_lootid, challenge,
                        cache_m_armor, cache_m_weapon, prefixed
                    ))
                    processed += 1
                    new_entry += 1

                    if verbose:
                        print(f"  {prefixed} ({entry_id} -> {new_entry - 1})")

    finally:
        conn.close()

    # Append blanket postprocessing
    postprocessing = generate_blanket_postprocessing(dungeons)
    all_queries.extend(postprocessing)

    # Write F-074's content as its named section in the combined sectioned
    # file. Other sections (e.g. F-179_azeroth_loot) are preserved
    # automatically — if F-179 has already written its loot wiring to this
    # file, it survives this regen and stays applied in correct order.
    section_content = (
        f"-- Heroic & Mythic Creature Generator\n"
        f"-- {processed} creatures (heroic + mythic clones across "
        f"{len(dungeons)} dungeons)\n\n"
        + "\n".join(all_queries)
    )
    write_section(
        output_path, SECTION_F074, section_content,
        section_order=SECTION_ORDER, file_header=FILE_HEADER,
    )

    return processed, not_found
