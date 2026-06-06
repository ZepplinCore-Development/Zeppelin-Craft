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

from .matrix import MatrixCell, iter_cells
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
from .relic_generator import (
    PHASE6_DEFAULTS as RELIC_PHASE6_DEFAULTS,
    build_relic_for_cell,
    load_relic_effects_data,
    pick_display_for_class,
)

# F-013 Phase 6: relic gear tokens trigger the effect-aura authoring path
# instead of the stat/armor/weapon path.
RELIC_TOKENS = frozenset({"libram", "idol", "totem", "sigil"})

# Spell-ID base per (tier, difficulty) for F-013-emitted relic auras.
# Each (tier, difficulty) has a 15-slot reservation; 11 relic cells per
# tier × difficulty (paladin 3 + shaman 4 + druid 4); 4 IDs of headroom.
RELIC_SPELL_BASE = {
    ("azeroth",   "heroic"): 900500,
    ("azeroth",   "mythic"): 900515,
    ("outland",   "heroic"): 900530,
    ("outland",   "mythic"): 900545,
    ("northrend", "heroic"): 900560,
    ("northrend", "mythic"): 900575,
}

_relic_data_cache = None
_relic_cell_position_cache = None  # cell.matrix_index -> position-among-relics

# item_template.Flags difficulty markers. Bit 0x8 = HEROIC_TOOLTIP (green
# "Heroic" tag in tooltip). The Zeppelin client patch labels bit 0x9 (HEROIC
# | NO_PICKUP, where NO_PICKUP is a vestigial flag in 3.3.5a) as "Mythic" so
# the same machinery distinguishes heroic vs mythic items in tooltip text.
def _difficulty_flags(difficulty: str) -> int:
    if difficulty == "mythic":
        return 9
    if difficulty == "heroic":
        return 8
    return 0


def _relic_data():
    global _relic_data_cache
    if _relic_data_cache is None:
        _relic_data_cache = load_relic_effects_data()
    return _relic_data_cache


def _relic_cell_positions():
    """Build a stable map from matrix_index -> (position-among-relics,
    per-class relic position). Computed once on first call."""
    global _relic_cell_position_cache
    if _relic_cell_position_cache is None:
        positions = {}
        relic_idx = 0
        per_class_idx = {}
        for c in iter_cells():
            if c.gear_token in RELIC_TOKENS:
                positions[c.matrix_index] = (
                    relic_idx,
                    per_class_idx.get(c.class_name, 0),
                )
                relic_idx += 1
                per_class_idx[c.class_name] = per_class_idx.get(c.class_name, 0) + 1
        _relic_cell_position_cache = positions
    return _relic_cell_position_cache

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
_stat_shares_cache = None


def _stat_shares() -> Dict:
    """Per-role stat budget shares from stat_shares.json
    ({role: {stat_id_str: share}}). Empty if the file is absent (generator
    falls back to equal-share distribution)."""
    global _stat_shares_cache
    if _stat_shares_cache is None:
        try:
            _stat_shares_cache = _load_json("stat_shares.json").get("shares", {})
        except FileNotFoundError:
            _stat_shares_cache = {}
    return _stat_shares_cache


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


def _generate_relic_row(
    cell: MatrixCell,
    entry_id: int,
    item_level: int,
    required_level: int,
    tier: str,
    difficulty: str,
) -> Optional[Dict]:
    """F-013 Phase 6: emit a relic row using F-028's authoring helper.

    Returns None if (class, role) has no relic preset (cell is silently
    skipped — the SQL just won't include that entry).
    """
    positions = _relic_cell_positions()
    if cell.matrix_index not in positions:
        return None
    _, per_class_idx = positions[cell.matrix_index]
    spell_base = RELIC_SPELL_BASE.get((tier, difficulty))
    if spell_base is None:
        return None
    # Spell ID = base + matrix-position-mod-15. matrix_index uniquely places
    # this cell in iter_cells(), but we want a per-tier-difficulty offset.
    # Use the relic-position-within-class as the offset since per-class counts
    # match across (tier, difficulty) and 11 cells fit in 15 slots.
    spell_id = spell_base + positions[cell.matrix_index][0] % 15

    display_id = pick_display_for_class(cell.class_name, per_class_idx)
    relic = build_relic_for_cell(
        cls=cell.class_name,
        role=cell.role,
        ilvl=item_level,
        required_level=required_level,
        quality=cell.quality,
        spell_id=spell_id,
        item_id=entry_id,
        display_id=display_id,
        tier=tier,
        difficulty=difficulty,
        relic_effects_data=_relic_data(),
    )
    if relic is None:
        return None

    de_id, de_skill = get_disenchant(tier)
    return {
        "entry": relic.item_id,
        "class": relic.item_class,
        "subclass": relic.item_subclass,
        "SoundOverrideSubclass": -1,
        "name": relic.item_name,
        "displayid": relic.display_id,
        "Quality": relic.quality,
        "InventoryType": relic.inventory_type,
        "AllowableClass": -1,
        "AllowableRace": -1,
        "ItemLevel": relic.item_level,
        "RequiredLevel": relic.required_level,
        "stats": [],
        "Flags": _difficulty_flags(difficulty),
        "bonding": 1,  # BIND_ON_PICKUP
        "flagsCustom": 0,
        "VerifiedBuild": 0,
        "DisenchantID": de_id,
        "RequiredDisenchantSkill": de_skill,
        # Relic-specific columns (emitted via RELIC_COLUMNS in presets.py)
        "spellid_1": relic.spell_id,
        "spelltrigger_1": relic.spell_trigger,
        "TotemCategory": relic.totem_category,
        "description": relic.description,
        # Side-channel for presets.py to collect the spell SQL
        "_relic_spell_sql": relic.spell_sql,
    }


def generate_row(
    cell: MatrixCell,
    entry_id: int,
    item_level: int,
    required_level: int,
    seed_base: int = 0,
    tier: str = "",
    difficulty: str = "",
) -> Optional[Dict]:
    """Return a dict of item_template column -> value for one matrix cell,
    or None if the cell should be skipped (e.g. relic cell with no preset).
    """
    # F-013 Phase 6 — relic cells diverge to effect-aura authoring path
    if cell.gear_token in RELIC_TOKENS:
        return _generate_relic_row(cell, entry_id, item_level, required_level, tier, difficulty)

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

    # Split the stat budget by per-role stat shares (data-driven from stock
    # gear) so e.g. casters read Spell-Power-dominant and light on Stam, like
    # real gear — instead of the old flat random spread.
    shares = _stat_shares().get(cell.role)
    stats = distribute_stats(stat_ids, stat_budget, rng, stat_shares=shares)

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
        "Flags": _difficulty_flags(difficulty),
        "bonding": 1,  # BIND_ON_PICKUP — heroic/mythic loot should soulbind
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
