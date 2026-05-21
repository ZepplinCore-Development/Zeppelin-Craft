"""F-013 ItemLevel-based stat scaling (Phase 3).

Per-slot budgets come from `data/budget_formulas.json`, which is regenerated
by `zep world item analyze-budget`. Each InventoryType has its own quadratic
fit `budget(L) = a*L^2 + b*L + c` derived from stock AC epic gear
(non-set, non-spell-effect items), so the scaler targets the real stat budget
players see on canonical epics at each ilvl/slot.

    budget(slot, L, quality) = formula[slot](L) * quality_ratio[quality]

The quality_ratio rescales from the fitted-epic budget down to rare (0.85).
The budget is split across the chosen stats by random allocation weights;
each stat's printed value = (allocation / total_alloc) * budget / stat_weight,
where stat_weight is the per-stat cost (most stats=1.0, ArmorPen/SpellPen=2.0,
AP/SP=0.5, Hp5/Mp5=2.5, BonusArmor=0.07, BlockValue=0.65).

Pure module: no rng/state. The caller passes in a `random.Random` so the
generation stays deterministic.
"""

import json
from pathlib import Path
from typing import Dict, List, Tuple


DATA_DIR = Path(__file__).parent / "data"
BUDGET_FORMULAS_PATH = DATA_DIR / "budget_formulas.json"

# Slots that share a budget formula. Neck/ring/trinket/back all sit at
# nearly identical weighted budgets per ilvl in stock data — pool them
# under iv=11 (ring) for a single clean accessory fit.
# Mirror of SLOT_POOL in budget_analyzer.py.
SLOT_ALIAS = {
    2:  11,  # neck    -> accessory
    12: 11,  # trinket -> accessory
    16: 11,  # back    -> accessory
}


# Legacy single-quadratic fallback, used when budget_formulas.json is missing
# OR a slot's formula is absent. Sourced from the original
# `Random Item Generator.xlsx`.
LEGACY_QUALITY_MOD = {
    1: 1.0,   # Common
    2: 1.1,   # Uncommon
    3: 1.2,   # Rare
    4: 1.3,   # Epic
    5: 1.4,   # Legendary
    6: 1.5,   # Artifact
}

LEGACY_SLOT_MOD = {
    1:  1.00, 3:  0.75, 5:  1.00, 20: 1.00, 7:  1.00, 17: 1.00,
    6:  0.75, 10: 0.75, 8:  0.75, 9:  0.56, 2:  0.56, 11: 0.56,
    12: 0.56, 16: 0.56, 23: 0.56, 14: 0.56, 28: 0.56,
    13: 0.42, 21: 0.42, 22: 0.42, 15: 0.32, 25: 0.32, 26: 0.32,
}


def _legacy_budget(inventory_type: int, item_level: int, quality: int) -> float:
    L = item_level
    base = 0.0096 * L * L - 0.6665 * L + 78.632
    return base * LEGACY_SLOT_MOD.get(inventory_type, 0.56) * LEGACY_QUALITY_MOD.get(quality, 1.0)


_formulas_cache: Dict = None


def _load_formulas() -> Dict:
    """Load budget_formulas.json once and cache; return {} if missing."""
    global _formulas_cache
    if _formulas_cache is None:
        if BUDGET_FORMULAS_PATH.exists():
            with open(BUDGET_FORMULAS_PATH) as f:
                _formulas_cache = json.load(f)
        else:
            _formulas_cache = {}
    return _formulas_cache

# Stat weight = how much budget one point of this stat consumes.
# Derived from WotLK green gems (1 socket = 1 "unit"): a primary stat that
# gives 12 per socket has weight 1.0; stamina gives 18 per socket → weight 0.67;
# AP gives 24 per socket → weight 0.5; etc. Stats with no gem reference fall
# back to historical values.
# Stat IDs verified against AC source (ItemModType enum in 3.x):
#   38=AP, 39=RAP, 43=Mp5, 44=ArmorPen, 45=SP, 46=Hp5, 47=SpellPen, 48=BlockValue
STAT_WEIGHT = {
    3:  1.0,    # Agility            (gem: 12 / socket)
    4:  1.0,    # Strength           (gem: 12 / socket)
    5:  1.0,    # Intellect          (gem: 12 / socket)
    6:  1.0,    # Spirit             (gem: 12 / socket)
    7:  0.667,  # Stamina            (gem: 18 / socket)
    12: 1.0,    # Defense Rating     (gem: 12 / socket)
    13: 1.0,    # Dodge Rating       (gem: 12 / socket)
    14: 1.0,    # Parry Rating       (gem: 12 / socket)
    15: 1.0,    # Block Rating       (no gem; assume parity with Dodge)
    31: 1.0,    # Hit Rating         (gem: 12 / socket)
    32: 1.0,    # Crit Rating        (gem: 12 / socket)
    35: 1.0,    # Resilience         (gem: 12 / socket)
    36: 1.0,    # Haste Rating       (gem: 12 / socket)
    37: 1.0,    # Expertise Rating   (gem: 12 / socket)
    38: 0.5,    # Attack Power       (gem: 24 / socket)
    39: 0.5,    # Ranged Attack Power (no gem; assume parity with AP)
    43: 2.0,    # Mp5                (gem: 6 / socket)
    44: 1.0,    # Armor Penetration  (gem: 12 / socket)
    45: 0.857,  # Spell Power        (gem: 14 / socket)
    46: 2.0,    # Hp5                (no gem; assume parity with Mp5)
    47: 2.0,    # Spell Penetration  (no gem; legacy estimate)
    48: 0.65,   # Block Value        (no gem; legacy estimate)
}


def stat_weight(stat_id: int) -> float:
    return STAT_WEIGHT.get(stat_id, 1.0)


# Weapon DPS profiles derived from stock AC weapons (queried 2026-05-21).
# Each entry: subclass -> {role -> (delay_ms, dps_slope, dps_intercept)}.
# DPS(ilvl) = slope * ilvl + intercept; damage_avg = DPS * speed / 1000.
# Caster weapons have ~half the DPS slope of physical at the same subclass
# because they trade weapon damage for stat budget (gem-weight gap explained
# earlier). Items without weapon damage (relics, held off-hands, shields,
# misc class=4 items) skip this path entirely.
WEAPON_PROFILES = {
    0:  {'physical': (2600, 0.85, -15.0)},                                # 1H axe
    1:  {'physical': (3500, 1.10, -20.0)},                                # 2H axe
    2:  {'physical': (2900, 0.95, -31.0)},                                # bow
    3:  {'physical': (2900, 1.00, -38.0)},                                # gun
    4:  {'physical': (2600, 0.85, -13.0), 'caster': (1800, 0.50, -13.0)}, # 1H mace
    5:  {'physical': (3500, 1.13, -22.0)},                                # 2H mace
    6:  {'physical': (3500, 1.11, -19.0)},                                # polearm
    7:  {'physical': (2600, 0.83, -11.0), 'caster': (1800, 0.49,  -9.0)}, # 1H sword
    8:  {'physical': (3500, 1.09, -16.0)},                                # 2H sword
    10: {'physical': (2400, 1.24, -51.0), 'caster': (2100, 0.78, -20.0)}, # staff
    13: {'physical': (2600, 0.87, -17.0)},                                # fist
    15: {'physical': (1800, 0.85, -14.0), 'caster': (1800, 0.49,  -8.0)}, # dagger
    16: {'physical': (1800, 1.54, -121.0)},                               # thrown
    18: {'caster':   (2900, 1.00, -36.0)},                                # wand
    19: {'physical': (2900, 0.95, -31.0)},                                # crossbow
}

# Damage min/max spread around the ilvl-computed average DPS. Stock weapons
# typically sit at avg ± 30% (e.g. Greed: 261/485 dmg, avg 373 = ±30%).
DMG_SPREAD_LOW = 0.70
DMG_SPREAD_HIGH = 1.30

# Budget units consumed per 1 DPS of weapon damage. Derived by sweeping w in
# [0..13] across all weapon subclasses and picking the value that maximizes
# pooled R² (caster + physical items fit one curve). Sweet spot is ~5 for
# 1H mace/dagger/fist; staff and 1H sword peak slightly higher at w=7.
# Choosing 5.0 as the median empirical optimum.
DPS_BUDGET_WEIGHT = 5.0


def compute_weapon_dps(item_class: int, subclass: int, item_level: int, role: str):
    """Return the canonical DPS for a weapon at this (subclass, ilvl, role),
    or None for non-weapons. This is the same DPS used to derive damage in
    compute_weapon_damage; extracted so callers can compute the DPS budget
    contribution without recomputing damage min/max."""
    if item_class != 2:
        return None
    profile = WEAPON_PROFILES.get(subclass)
    if not profile:
        return None
    is_caster = role in ('caster', 'healer')
    key = 'caster' if is_caster and 'caster' in profile else 'physical'
    if key not in profile:
        key = next(iter(profile))
    _, slope, intercept = profile[key]
    # Floor at 10 DPS: stock data for some subclasses (especially thrown)
    # only starts at high ilvls, so the fitted intercept can go strongly
    # negative and produce sub-natural damage at low ilvls. 10 is a
    # reasonable usability floor.
    return max(10.0, slope * item_level + intercept)


def compute_weapon_damage(item_class: int, subclass: int, item_level: int, role: str):
    """Return (dmg_min, dmg_max, delay_ms) for a weapon, or None for non-weapons.

    Item class 2 = WEAPON. Item class 4 = ARMOR (includes shields, off-hand
    holdables, and class relics — none have auto-attack damage in 3.x).
    """
    if item_class != 2:
        return None
    profile = WEAPON_PROFILES.get(subclass)
    if not profile:
        return None

    is_caster = role in ('caster', 'healer')
    key = 'caster' if is_caster and 'caster' in profile else 'physical'
    if key not in profile:
        # Subclass has only one role profile (e.g. wand=caster only, polearm=physical only)
        key = next(iter(profile))

    delay_ms = profile[key][0]
    dps = compute_weapon_dps(item_class, subclass, item_level, role)
    avg_dmg = dps * delay_ms / 1000.0
    dmg_min = max(1, round(avg_dmg * DMG_SPREAD_LOW))
    dmg_max = max(dmg_min + 1, round(avg_dmg * DMG_SPREAD_HIGH))
    return (dmg_min, dmg_max, delay_ms)


def compute_budget(
    inventory_type: int, item_level: int, quality: int,
    subclass: int = None
) -> float:
    """Return the empirically-derived stat budget for one item.

    Lookup order:
      1. Per-(slot, subclass) fit from formulas_by_subclass (armor cloth/leather/mail/plate)
      2. Per-slot fit from formulas
      3. Legacy single-quadratic fallback
    """
    data = _load_formulas()
    quality_ratio = data.get("quality_ratio", {}).get(str(quality), 1.0)

    # Resolve pooled slots (e.g. trinkets share ring's budget formula)
    lookup_iv = SLOT_ALIAS.get(inventory_type, inventory_type)

    if subclass is not None:
        by_sub = data.get("formulas_by_subclass", {})
        key = f"{lookup_iv}:{subclass}"
        if key in by_sub:
            f = by_sub[key]
            epic_budget = max(0.0, f["a"] * item_level * item_level
                              + f["b"] * item_level + f["c"])
            return epic_budget * quality_ratio

    formulas = data.get("formulas", {})
    if str(lookup_iv) in formulas:
        f = formulas[str(lookup_iv)]
        epic_budget = max(0.0, f["a"] * item_level * item_level
                          + f["b"] * item_level + f["c"])
        return epic_budget * quality_ratio

    return _legacy_budget(inventory_type, item_level, quality)


def distribute_stats(
    stat_ids: List[int],
    budget: float,
    rng,
) -> List[Tuple[int, int]]:
    """Split `budget` across `stat_ids` by random allocation, returning
    integer (stat_id, value) tuples. Values floor at 1 so we never emit
    +0 stats. Order preserved from input."""
    if not stat_ids:
        return []

    allocs = [rng.randint(1, 10) for _ in stat_ids]
    total_alloc = sum(allocs)
    out: List[Tuple[int, int]] = []
    for sid, alloc in zip(stat_ids, allocs):
        share = (alloc / total_alloc) * budget
        value = int(round(share / stat_weight(sid)))
        out.append((sid, max(1, value)))
    return out
