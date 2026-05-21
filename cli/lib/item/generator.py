"""Per-cell item row generation for F-013.

Pure module: no DB connection, no .env. Given a MatrixCell and a tier
configuration, returns the full set of item_template column values for
one row. Randomization (display, name, stats) is seeded so re-runs
produce byte-identical output.
"""

import hashlib
import json
import random
from pathlib import Path
from typing import Dict, List, Optional

from .matrix import MatrixCell
from .scaler import (
    DPS_BUDGET_WEIGHT,
    compute_armor,
    compute_budget,
    compute_shield_block,
    compute_weapon_damage,
    compute_weapon_dps,
    distribute_stats,
    get_disenchant,
)

DATA_DIR = Path(__file__).parent / "data"

# Quality-driven stat *count* (rare carries fewer stats than epic).
# Phase 2 added class-aware stat *selection*; Phase 3 derives stat *values*
# from compute_budget() instead of a flat value range.
QUALITY_TUNING = {
    3: {"stats_min": 2, "stats_max": 3},   # Rare
    4: {"stats_min": 3, "stats_max": 5},   # Epic
}

# Class bitmask for AllowableClass (1 << (class_id - 1))
CLASS_BITMASK = {
    1: 1,        # Warrior
    2: 2,        # Paladin
    3: 4,        # Hunter
    4: 8,        # Rogue
    5: 16,       # Priest
    6: 32,       # Death Knight
    7: 64,       # Shaman
    8: 128,      # Mage
    9: 256,      # Warlock
    11: 1024,    # Druid
}


def _load_json(filename: str) -> Dict:
    with open(DATA_DIR / filename) as f:
        return json.load(f)


_display_models = None
_item_names = None
_stat_types = None
_class_stats = None


def _displays() -> Dict:
    global _display_models
    if _display_models is None:
        _display_models = _load_json("display_models.json")["models"]
    return _display_models


def _names() -> Dict:
    global _item_names
    if _item_names is None:
        _item_names = _load_json("item_names.json")
    return _item_names


def _stats() -> Dict:
    global _stat_types
    if _stat_types is None:
        _stat_types = _load_json("stat_types.json")
    return _stat_types


def _class_stat_table() -> Dict:
    global _class_stats
    if _class_stats is None:
        raw = _load_json("class_stats.json")
        _class_stats = {k: v for k, v in raw.items() if not k.startswith("_")}
    return _class_stats


def _cell_rng(
    cell: MatrixCell,
    seed_base: int,
    tier: str = "",
    difficulty: str = "",
) -> random.Random:
    """Return a per-cell RNG so cells are independently reproducible.

    Tier and difficulty are mixed into the seed so the same matrix cell
    produces distinct names / displayids across (tier, difficulty) outputs."""
    key = f"{seed_base}|{tier}|{difficulty}|{cell.matrix_index}|{cell.label}".encode()
    digest = hashlib.sha256(key).digest()
    cell_seed = int.from_bytes(digest[:8], "big")
    return random.Random(cell_seed)


def _pick_display(cell: MatrixCell, rng: random.Random) -> int:
    inv_key = str(cell.inventory_type)
    sub_key = str(cell.subclass)
    displays = _displays().get(inv_key, {}).get(sub_key)
    if not displays:
        return 0
    return rng.choice(displays)


_SUBCLASS_TO_ARMOR_TYPE = {1: "cloth", 2: "leather", 3: "mail", 4: "plate"}
_PLACEHOLDER_ORDER = ("Adjective", "Verbing", "Adverb", "Noun")


def _resolve_base_pool(cell: MatrixCell, names: Dict) -> List[str]:
    """Return the slot-appropriate base-noun pool for this cell."""
    token = cell.gear_token
    if token in names.get("accessories", {}):
        return names["accessories"][token]
    if token in names.get("weapons", {}):
        return names["weapons"][token]
    if token in names.get("relics", {}):
        return names["relics"][token]
    # Armor by (armor_type, slot) — derive armor_type from subclass
    atype = _SUBCLASS_TO_ARMOR_TYPE.get(cell.subclass)
    if atype:
        bucket = names.get("armor", {}).get(atype, {})
        if token in bucket and bucket[token]:
            return bucket[token]
    return ["relic"]  # last-resort fallback


def _compose_name(pattern: str, base: str, rng: random.Random, gen: Dict) -> str:
    """Substitute placeholders in `pattern` with picks from general pools.

    Patterns use literal placeholder words: Adjective, Verbing, Adverb,
    Noun (generic flavor noun), Item (slot base). Each placeholder is
    replaced once per occurrence with a fresh pick.
    """
    out = pattern
    # Replace each placeholder type in turn; loop until no more substitutions.
    for _ in range(10):  # safety bound — patterns rarely have >5 placeholders
        replaced = False
        for ph in _PLACEHOLDER_ORDER:
            if ph in out:
                pool = gen[f"{ph.lower()}s"]
                out = out.replace(ph, rng.choice(pool).title(), 1)
                replaced = True
                break
        if not replaced:
            break
    out = out.replace("Item", base.title())
    return out


def _pick_name(cell: MatrixCell, rng: random.Random) -> str:
    names = _names()
    base = rng.choice(_resolve_base_pool(cell, names))

    # Filter to patterns that include "Item" so the slot base always appears.
    patterns = [p for p in names["patterns"] if "Item" in p]
    if not patterns:
        patterns = ["Adjective Item"]
    pattern = rng.choice(patterns)

    name = _compose_name(pattern, base, rng, names["general"])
    # Escape single apostrophes for SQL (CLAUDE.md double-apostrophe rule)
    return name.replace("'", "''")


def _pick_stat_ids(cell: MatrixCell, rng: random.Random) -> List[int]:
    """Select which stat IDs go on the item, in display order.

    Primary stats from class_stats.json are always included (in declared
    order). Remaining slots fill from `secondary` via uniform sampling
    without replacement. Falls back to the legacy_pool if no
    (class, role) entry exists.
    """
    cfg = QUALITY_TUNING[cell.quality]
    count = rng.randint(cfg["stats_min"], cfg["stats_max"])

    table = _class_stat_table()
    role_entry = table.get(cell.class_name, {}).get(cell.role)
    if role_entry:
        primary = list(role_entry["primary"])
        secondary = list(role_entry["secondary"])
        picks = primary[:count]
        remaining = count - len(picks)
        if remaining > 0 and secondary:
            pool = [s for s in secondary if s not in picks]
            rng.shuffle(pool)
            picks.extend(pool[:remaining])
    else:
        pool = list(_stats()["legacy_pool"])
        rng.shuffle(pool)
        picks = pool[:count]
    return picks


def _allowable_class(class_id: int) -> int:
    # Items are not class-restricted at the item level. The cache opens with
    # class-conditional refs (F-074), so a player only ever gets items their
    # class-pool can equip. Leaving the item itself unrestricted (-1) keeps
    # cross-class transmog and trades open.
    return -1


def generate_row(
    cell: MatrixCell,
    entry_id: int,
    item_level: int,
    required_level: int,
    seed_base: int = 0,
    tier: str = "",
    difficulty: str = "",
) -> Dict:
    """Return a dict of item_template column -> value for one matrix cell."""
    rng = _cell_rng(cell, seed_base, tier=tier, difficulty=difficulty)
    displayid = _pick_display(cell, rng)
    name = _pick_name(cell, rng)
    stat_ids = _pick_stat_ids(cell, rng)
    total_budget = compute_budget(
        cell.inventory_type, item_level, cell.quality, subclass=cell.subclass
    )

    # For weapons, the analyzer fit total_budget = stat_weighted + DPS*W; the
    # generator emits canonical DPS, so the stat budget here is what's left
    # after subtracting the DPS contribution. Caster weapons (low DPS) keep
    # most of the budget as stats; physical weapons (high DPS) shift it to
    # weapon damage.
    weapon_dps = compute_weapon_dps(
        cell.item_class, cell.subclass, item_level, cell.role
    )
    if weapon_dps is not None:
        stat_budget = max(0.0, total_budget - weapon_dps * DPS_BUDGET_WEIGHT)
    else:
        stat_budget = total_budget

    stats = distribute_stats(stat_ids, stat_budget, rng)

    de_id, de_skill = get_disenchant(tier)

    row = {
        "entry": entry_id,
        "class": cell.item_class,
        "subclass": cell.subclass,
        "SoundOverrideSubclass": -1,
        "name": name,
        "displayid": displayid,
        "Quality": cell.quality,
        "InventoryType": cell.inventory_type,
        "AllowableClass": _allowable_class(cell.class_id),
        "AllowableRace": -1,
        "ItemLevel": item_level,
        "RequiredLevel": required_level,
        "stats": stats,
        "flagsCustom": 0,
        "VerifiedBuild": 0,
        "DisenchantID": de_id,
        "RequiredDisenchantSkill": de_skill,
    }

    # Weapons get damage and speed. Skip relics, off-hands, shields, etc.
    weapon = compute_weapon_damage(cell.item_class, cell.subclass, item_level, cell.role)
    if weapon is not None:
        row["dmg_min1"], row["dmg_max1"], row["delay"] = weapon

    # Armor-class items get an armor value; shields also get a block value.
    armor = compute_armor(cell.item_class, cell.subclass, cell.inventory_type, item_level)
    if armor > 0:
        row["armor"] = armor
    block = compute_shield_block(cell.subclass, item_level)
    if block > 0:
        row["block"] = block

    return row
