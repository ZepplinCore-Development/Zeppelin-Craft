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

OUTPUT_FILENAME = "zz_[AUTO,F-074]_heroic_convertor.sql"

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
    # creature drops AND bolt on cache references.
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
    lines.append(f"WHERE `id1` = {entry} AND `map` = {map_id};")
    lines.append("")

    return lines


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
    Trash gets one cache at 0.5% via GroupId=1 (1% combined, 50/50 split).
    """
    is_boss = challenge == "boss"
    lines = [
        f"-- Loot table for {creature_name} (lootid {new_entry})",
        f"DELETE FROM `creature_loot_template` WHERE `Entry` = {new_entry};",
    ]
    if base_lootid and base_lootid != new_entry:
        lines.append(
            f"-- Inherit base creature loot from lootid {base_lootid}"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` "
            f"(`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, "
            f"`LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)"
        )
        lines.append(
            f"SELECT {new_entry}, `Item`, `Reference`, `Chance`, `QuestRequired`, "
            f"`LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment` "
            f"FROM `creature_loot_template` WHERE `Entry` = {base_lootid};"
        )

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

    # Cache references — boss = 100% each, trash = 0.5% each (GroupId=1 for 1% total)
    if is_boss:
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_armor_entry}, "
            f"`Reference` = 0, `Chance` = 100, `MaxCount` = 1, "
            f"`Comment` = 'boss armor cache';"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_weapon_entry}, "
            f"`Reference` = 0, `Chance` = 100, `MaxCount` = 1, "
            f"`Comment` = 'boss weapon cache';"
        )
    else:
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_armor_entry}, "
            f"`Reference` = 0, `Chance` = 0.5, `GroupId` = 1, `MaxCount` = 1, "
            f"`Comment` = 'trash armor cache (0.5%)';"
        )
        lines.append(
            f"INSERT INTO `creature_loot_template` SET "
            f"`Entry` = {new_entry}, `Item` = {cache_weapon_entry}, "
            f"`Reference` = 0, `Chance` = 0.5, `GroupId` = 1, `MaxCount` = 1, "
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

    write_sql_file(output_path, "Heroic & Mythic Creature Generator", all_queries)

    return processed, not_found
