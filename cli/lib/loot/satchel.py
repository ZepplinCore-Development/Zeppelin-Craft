"""F-074 Phase 1 — Class-conditional armor + weapon caches.

Generates the 4 Azeroth cache items + their loot references + class conditions
and the creature_loot_template entries that bosses and trash mobs point at via
creature_template.lootid. Pulls per-class item pools from F-013's matrix.

Architecture follows F-025's tier-satchel pattern:
  creature_template.lootid -> creature_loot_template entry
    -> drops the cache item(s)
  cache item -> item_loot_template entry (9 rows, one per class)
    -> Reference=class_ref_id, GroupId=N (1..9 mapped to a class)
  class_ref_id -> reference_loot_template entries (many rows)
    -> each row Item=<f013 item>, GroupId=N (must match parent)
    -> chances normalized to sum to 100 within the group
  conditions -> SourceType=10, SourceGroup=class_ref_id, SourceEntry=item_entry
    -> ConditionType=15 (CLASS), ConditionValue1=class_mask
"""

from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Tuple

from . import chests as encounter_chests
from ..item.generator import CLASS_BITMASK
from ..item.matrix import WEAPON_TOKEN_CONFIG, iter_cells
from ..item.reservations import entry_id as f013_entry_id

OUTPUT_FILENAME = "zz_[AUTO,F-074]_dungeon_caches.sql"

# Cache routing: any item wielded in main-hand / off-hand / ranged slot goes
# to the Weapon Cache regardless of item_class. This covers true weapons
# (axes, maces, etc.), shields and held off-hands, and class relics
# (libram/idol/totem/sigil) — all of which AC stores as item_class=ARMOR but
# players think of as "weapons" by equip slot.
CACHE_KIND_WEAPON = "weapon"
CACHE_KIND_ARMOR = "armor"
WEAPON_CACHE_TOKENS = frozenset(WEAPON_TOKEN_CONFIG.keys())


def _cache_kind_for(gear_token: str) -> str:
    return CACHE_KIND_WEAPON if gear_token in WEAPON_CACHE_TOKENS else CACHE_KIND_ARMOR

# Classes included in Azeroth caches (no DK — DKs start at 55 and outgrow
# Azeroth content). Order matters: GroupId is the index into this tuple + 1.
CACHE_CLASSES: Tuple[Tuple[int, str], ...] = (
    (1,  "Warrior"),
    (2,  "Paladin"),
    (3,  "Hunter"),
    (4,  "Rogue"),
    (5,  "Priest"),
    (7,  "Shaman"),
    (8,  "Mage"),
    (9,  "Warlock"),
    (11, "Druid"),
)


@dataclass(frozen=True)
class CacheItem:
    entry: int
    name: str
    quality: int          # 3 Rare, 4 Epic
    display_id: int       # itemdisplayinfo.id
    item_level: int
    required_level: int


@dataclass(frozen=True)
class CacheSpec:
    tier: str
    difficulty: str
    armor_cache: CacheItem
    weapon_cache: CacheItem
    boss_loot_id: int          # creature_loot_template entry for bosses
    trash_loot_id: int         # creature_loot_template entry for trash
    armor_ref_base: int        # class refs at armor_ref_base + (group_id - 1)
    weapon_ref_base: int       # class refs at weapon_ref_base + (group_id - 1)


# Final ref ID layout (custom 91xx range, no conflict with stock content).
# Heroic block: 9100400-9100419 (20 IDs reserved)
#   9100400 boss loot table, 9100401-9100409 armor class refs (1-9),
#   9100410-9100418 weapon class refs (1-9), 9100419 trash loot table
# Mythic block: 9100500-9100519 (same layout)
# Difficulty IDs used by CONDITION_DIFFICULTY_ID (type 49) for our 5-man
# dungeons. Stock AC uses 0 = Normal / 1 = Heroic for 5-mans; Zeppelin
# extends with 2 = Mythic.
DIFFICULTY_HEROIC = 1
DIFFICULTY_MYTHIC = 2

# GO chests for F-074 cache wiring now come from the shared registry at
# cli/lib/loot/data/encounter_chests.json (also consumed by AtlasLoot).
# For each tier we pick chests with f074_in_scope=true and add cache
# references gated by CONDITION_DIFFICULTY_ID = 49 (1=heroic, 2=mythic).


CACHE_SPECS: Tuple[CacheSpec, ...] = (
    CacheSpec(
        tier="azeroth",
        difficulty="heroic",
        armor_cache=CacheItem(
            entry=66200,
            name="Azeroth Heroic Armor Cache",
            quality=4,
            display_id=134788,
            item_level=66,
            required_level=60,
        ),
        weapon_cache=CacheItem(
            entry=66201,
            name="Azeroth Heroic Weapon Cache",
            quality=4,
            display_id=134455,
            item_level=66,
            required_level=60,
        ),
        boss_loot_id=9100400,
        trash_loot_id=9100419,
        armor_ref_base=9100401,
        weapon_ref_base=9100410,
    ),
    CacheSpec(
        tier="azeroth",
        difficulty="mythic",
        armor_cache=CacheItem(
            entry=66202,
            name="Azeroth Mythic Armor Cache",
            quality=4,
            display_id=134788,
            item_level=76,
            required_level=60,
        ),
        weapon_cache=CacheItem(
            entry=66203,
            name="Azeroth Mythic Weapon Cache",
            quality=4,
            display_id=134455,
            item_level=76,
            required_level=60,
        ),
        boss_loot_id=9100500,
        trash_loot_id=9100519,
        armor_ref_base=9100501,
        weapon_ref_base=9100510,
    ),
)


def _build_pool() -> Dict[Tuple[str, str, int, str], List[int]]:
    """Walk F-013's matrix and bucket entry IDs by (tier, difficulty, class_id, cache_kind).

    Routing is by gear_token (equip slot), not item_class, so shields and
    relics (libram/idol/totem/sigil) land in the weapon cache despite their
    item_class=ARMOR classification in AC.
    """
    pool: Dict[Tuple[str, str, int, str], List[int]] = defaultdict(list)
    for spec in CACHE_SPECS:
        for cell in iter_cells():
            eid = f013_entry_id(spec.tier, spec.difficulty, cell.matrix_index)
            kind = _cache_kind_for(cell.gear_token)
            pool[(spec.tier, spec.difficulty, cell.class_id, kind)].append(eid)
    return pool


def _cache_item_sql(item: CacheItem) -> List[str]:
    """Emit DELETE + INSERT SET for one cache item.

    Stackable=20 — caches stack so multiple drops in one run share an
    inventory slot. The previous ITEM_FLAG_HAS_LOOT (Flags=4) destroy-
    entire-stack-on-open bug is fixed in a separate pass by transitioning
    to spell-based opening (clam pattern) — see the cache spell wiring.
    Pre-transition stackable was 20; restoring now that the spell pattern
    will handle stack decrement correctly.
    """
    return [
        f"DELETE FROM `item_template` WHERE `entry` = {item.entry};",
        "INSERT INTO `item_template` SET",
        f"  `entry` = {item.entry},",
        f"  `class` = 15,",
        f"  `subclass` = 0,",
        f"  `name` = '{item.name}',",
        f"  `displayid` = {item.display_id},",
        f"  `Quality` = {item.quality},",
        f"  `Flags` = 4,",
        f"  `ItemLevel` = {item.item_level},",
        f"  `RequiredLevel` = {item.required_level},",
        f"  `bonding` = 1,",
        f"  `MaxCount` = 0,",
        f"  `stackable` = 20,",
        f"  `delay` = 0;",
    ]


def _ref_id_for(spec: CacheSpec, cache_kind: str, group_id: int) -> int:
    base = spec.armor_ref_base if cache_kind == CACHE_KIND_ARMOR else spec.weapon_ref_base
    return base + (group_id - 1)


def _normalized_chances(n: int) -> List[float]:
    """Return n chance values summing to 100.0 (rounded to 2 decimals).

    Last entry absorbs any rounding drift so the sum is exactly 100.00.
    """
    if n == 0:
        return []
    base = round(100.0 / n, 2)
    chances = [base] * (n - 1)
    chances.append(round(100.0 - base * (n - 1), 2))
    return chances


def _reference_loot_sql(
    spec: CacheSpec, cache_kind: str, group_id: int,
    class_name: str, item_entries: List[int]
) -> List[str]:
    """Emit reference_loot_template rows for one class ref."""
    ref_id = _ref_id_for(spec, cache_kind, group_id)
    lines = [
        f"-- {spec.tier.capitalize()} {spec.difficulty} "
        f"{cache_kind.capitalize()} "
        f"ref {ref_id} ({class_name}, GroupId={group_id}, "
        f"{len(item_entries)} items)",
        f"DELETE FROM `reference_loot_template` WHERE `Entry` = {ref_id};",
    ]
    chances = _normalized_chances(len(item_entries))
    for item_entry, chance in zip(item_entries, chances):
        lines.append(
            f"INSERT INTO `reference_loot_template` SET "
            f"`Entry` = {ref_id}, `Item` = {item_entry}, "
            f"`Chance` = {chance:.2f}, `GroupId` = {group_id};"
        )
    return lines


def _item_loot_sql(spec: CacheSpec, cache_kind: str) -> List[str]:
    """Emit the 9 item_loot_template rows for one cache item."""
    cache = spec.armor_cache if cache_kind == CACHE_KIND_ARMOR else spec.weapon_cache
    lines = [
        f"-- {cache.name} contents (9 class refs, one per class)",
        f"DELETE FROM `item_loot_template` WHERE `Entry` = {cache.entry};",
    ]
    for group_id, (class_id, class_name) in enumerate(CACHE_CLASSES, start=1):
        ref_id = _ref_id_for(spec, cache_kind, group_id)
        lines.append(
            f"INSERT INTO `item_loot_template` SET "
            f"`Entry` = {cache.entry}, `Item` = {group_id}, "
            f"`Reference` = {ref_id}, `Chance` = 0, "
            f"`GroupId` = {group_id}, `Comment` = '{cache.name} - {class_name}';"
        )
    return lines


def _conditions_sql(
    spec: CacheSpec, cache_kind: str, group_id: int,
    class_id: int, class_name: str, item_entries: List[int]
) -> List[str]:
    """Emit conditions rows that gate each item in a class ref by class mask."""
    ref_id = _ref_id_for(spec, cache_kind, group_id)
    class_mask = CLASS_BITMASK[class_id]
    lines = [
        f"DELETE FROM `conditions` "
        f"WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` = {ref_id};",
    ]
    for item_entry in item_entries:
        lines.append(
            f"INSERT INTO `conditions` SET "
            f"`SourceTypeOrReferenceId` = 10, `SourceGroup` = {ref_id}, "
            f"`SourceEntry` = {item_entry}, `ConditionTypeOrReference` = 15, "
            f"`ConditionValue1` = {class_mask}, "
            f"`Comment` = '{spec.tier} {spec.difficulty} {class_name} cache filter';"
        )
    return lines


def _boss_loot_sql(spec: CacheSpec) -> List[str]:
    """Emit creature_loot_template rows for the boss lootid.

    Per F-179 Phase 5: dropped boss cache chance from 100% → 25% per cache
    (independent rolls, so ~44% chance of at least one cache per boss).
    Frees boss loot bandwidth for F-179's scaled stock drops to dominate.
    The LFG daily completion quest now awards 1 guaranteed armor + 1
    weapon cache (via `zz_[F-179]_lfg_cache_rewards.sql`), so players
    have a reliable cache source independent of boss RNG.

    GO-chest cache wiring (Chest of the Seven etc.) stays at 100% —
    once-per-encounter reward, equivalent to a single boss kill.
    """
    return [
        f"-- Boss loot table {spec.boss_loot_id}: each cache at 25% (F-179 Phase 5)",
        f"DELETE FROM `creature_loot_template` WHERE `Entry` = {spec.boss_loot_id};",
        f"INSERT INTO `creature_loot_template` SET "
        f"`Entry` = {spec.boss_loot_id}, `Item` = {spec.armor_cache.entry}, "
        f"`Reference` = 0, `Chance` = 25, `MaxCount` = 1, "
        f"`Comment` = '{spec.tier} {spec.difficulty} boss armor cache (25%)';",
        f"INSERT INTO `creature_loot_template` SET "
        f"`Entry` = {spec.boss_loot_id}, `Item` = {spec.weapon_cache.entry}, "
        f"`Reference` = 0, `Chance` = 25, `MaxCount` = 1, "
        f"`Comment` = '{spec.tier} {spec.difficulty} boss weapon cache (25%)';",
    ]


def _trash_loot_sql(spec: CacheSpec) -> List[str]:
    """Emit creature_loot_template rows for trash: 0.5% armor + 0.5% weapon (1% total)."""
    return [
        f"-- Trash loot table {spec.trash_loot_id}: 1% total, 50/50 armor/weapon split",
        f"DELETE FROM `creature_loot_template` WHERE `Entry` = {spec.trash_loot_id};",
        f"INSERT INTO `creature_loot_template` SET "
        f"`Entry` = {spec.trash_loot_id}, `Item` = {spec.armor_cache.entry}, "
        f"`Reference` = 0, `Chance` = 0.5, `GroupId` = 1, `MaxCount` = 1, "
        f"`Comment` = '{spec.tier} {spec.difficulty} trash armor cache (0.5%)';",
        f"INSERT INTO `creature_loot_template` SET "
        f"`Entry` = {spec.trash_loot_id}, `Item` = {spec.weapon_cache.entry}, "
        f"`Reference` = 0, `Chance` = 0.5, `GroupId` = 1, `MaxCount` = 1, "
        f"`Comment` = '{spec.tier} {spec.difficulty} trash weapon cache (0.5%)';",
    ]


def _go_chest_block(tier: str) -> List[str]:
    """Emit gameobject_loot_template + conditions for cache references on
    GO chests whose creature encounters have empty creature_loot_template.

    Each chest gets four cache references (both heroic and both mythic caches)
    plus four conditions gating each by CONDITION_DIFFICULTY_ID so only
    players in the matching difficulty instance see the corresponding tier
    of cache (and normal-mode players see nothing extra).
    """
    chests = encounter_chests.for_f074_tier(tier)
    if not chests:
        return []

    heroic_armor, heroic_weapon = cache_items_for_tier(tier, is_mythic=False)
    mythic_armor, mythic_weapon = cache_items_for_tier(tier, is_mythic=True)

    lines = [
        "-- " + "=" * 76,
        f"-- GO chest cache integration ({tier})",
        "-- " + "=" * 76,
        "",
        "-- For encounters whose creature kills have empty creature_loot_template",
        "-- (multi-add boss groups, summoning events), caches drop from the",
        "-- gameobject chest instead. Difficulty conditions ensure normal-mode",
        "-- players see only the chest's original contents.",
        "",
    ]

    cache_entries = [
        (heroic_armor,  DIFFICULTY_HEROIC, 'heroic armor cache'),
        (heroic_weapon, DIFFICULTY_HEROIC, 'heroic weapon cache'),
        (mythic_armor,  DIFFICULTY_MYTHIC, 'mythic armor cache'),
        (mythic_weapon, DIFFICULTY_MYTHIC, 'mythic weapon cache'),
    ]

    for chest in chests:
        chest_loot_id = chest["loot_id"]
        chest_go_entry = chest["gameobject_id"]
        chest_name = chest["name"]
        escaped_name = chest_name.replace("'", "''")
        lines.append(f"-- {chest_name} (gameobject {chest_go_entry}, loot {chest_loot_id})")
        cache_ids_csv = ", ".join(str(e) for e, _, _ in cache_entries)
        lines.append(
            f"DELETE FROM `gameobject_loot_template` "
            f"WHERE `Entry` = {chest_loot_id} AND `Item` IN ({cache_ids_csv});"
        )
        lines.append(
            f"DELETE FROM `conditions` "
            f"WHERE `SourceTypeOrReferenceId` = 3 "
            f"AND `SourceGroup` = {chest_loot_id} "
            f"AND `SourceEntry` IN ({cache_ids_csv}) "
            f"AND `ConditionTypeOrReference` = 49;"
        )
        for cache_entry, diff_value, label in cache_entries:
            lines.append(
                f"INSERT INTO `gameobject_loot_template` SET "
                f"`Entry` = {chest_loot_id}, `Item` = {cache_entry}, "
                f"`Reference` = 0, `Chance` = 100, `MaxCount` = 1, "
                f"`Comment` = '{escaped_name} - {label} (diff-gated)';"
            )
            lines.append(
                f"INSERT INTO `conditions` SET "
                f"`SourceTypeOrReferenceId` = 3, `SourceGroup` = {chest_loot_id}, "
                f"`SourceEntry` = {cache_entry}, `ConditionTypeOrReference` = 49, "
                f"`ConditionValue1` = {diff_value}, "
                f"`Comment` = '{label} gated to difficulty {diff_value}';"
            )
        lines.append("")

    return lines


def _spec_block(spec: CacheSpec, pool: Dict[Tuple[str, str, int, int], List[int]]) -> List[str]:
    """Emit all SQL lines for one (tier, difficulty) cache spec."""
    lines = [
        "-- " + "=" * 76,
        f"-- {spec.tier.capitalize()} {spec.difficulty} caches",
        "-- " + "=" * 76,
        "",
        f"-- Cache items: {spec.armor_cache.name} ({spec.armor_cache.entry}), "
        f"{spec.weapon_cache.name} ({spec.weapon_cache.entry})",
    ]
    lines.extend(_cache_item_sql(spec.armor_cache))
    lines.append("")
    lines.extend(_cache_item_sql(spec.weapon_cache))
    lines.append("")

    for cache_kind in (CACHE_KIND_ARMOR, CACHE_KIND_WEAPON):
        lines.append(f"-- --- {cache_kind.capitalize()} class refs + conditions ---")
        for group_id, (class_id, class_name) in enumerate(CACHE_CLASSES, start=1):
            item_entries = pool[(spec.tier, spec.difficulty, class_id, cache_kind)]
            if not item_entries:
                lines.append(
                    f"-- WARNING: no F-013 items found for "
                    f"({spec.tier}, {spec.difficulty}, {class_name}, {cache_kind})"
                )
                continue
            lines.extend(_reference_loot_sql(
                spec, cache_kind, group_id, class_name, item_entries
            ))
            lines.extend(_conditions_sql(
                spec, cache_kind, group_id, class_id, class_name, item_entries
            ))
            lines.append("")
        lines.extend(_item_loot_sql(spec, cache_kind))
        lines.append("")

    # Per-clone lootid wiring lives in heroic.py: each clone uses its own
    # entry as lootid and emits a creature_loot_template that copies the
    # base creature's loot rows + adds cache references. The shared boss/
    # trash loot IDs (spec.boss_loot_id / spec.trash_loot_id) are no longer
    # written to creature_loot_template here — they remain reserved in case
    # we want to revert to the shared-pool model.
    return lines


def generate(output_path: Path) -> Tuple[int, int]:
    """Write the dungeon caches SQL file. Returns (num_caches, num_items_total)."""
    pool = _build_pool()
    lines = [
        "-- F-074 Phase 1: Class-conditional dungeon caches",
        "-- AUTO-generated by `zep world creature heroic` (F-074). DO NOT EDIT.",
        "",
        "-- Pulls F-013-generated tier-specific items into class-conditional caches.",
        "-- See F-074 Joplin note 'Phase 1 - Cache Loot Distribution' for spec.",
        "",
    ]
    items_total = 0
    for spec in CACHE_SPECS:
        lines.extend(_spec_block(spec, pool))
        for cache_kind in (CACHE_KIND_ARMOR, CACHE_KIND_WEAPON):
            for class_id, _ in CACHE_CLASSES:
                items_total += len(pool[(spec.tier, spec.difficulty, class_id, cache_kind)])

    # Phase 1.5: GO chest cache integration for encounters whose creature
    # kills have empty creature_loot_template (heroic.py skips cache emission
    # there). Chests come from the shared encounter_chests registry.
    for tier in encounter_chests.f074_tiers():
        lines.extend(_go_chest_block(tier))

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

    return len(CACHE_SPECS) * 2, items_total


def cache_items_for_tier(tier: str, is_mythic: bool):
    """Return (armor_cache_entry, weapon_cache_entry) for the given tier and difficulty.

    Bosses and trash both use the clone's own entry as its lootid; the
    creature_loot_template rows are built per-clone in heroic.py (copy of
    base creature loot + cache references). The shared boss/trash loot IDs
    on CacheSpec (9100400 etc.) are kept for compatibility but no longer
    referenced by creature_template.lootid.
    """
    difficulty = "mythic" if is_mythic else "heroic"
    for spec in CACHE_SPECS:
        if spec.tier == tier and spec.difficulty == difficulty:
            return spec.armor_cache.entry, spec.weapon_cache.entry
    raise ValueError(f"No cache spec for tier={tier!r}, mythic={is_mythic}")
