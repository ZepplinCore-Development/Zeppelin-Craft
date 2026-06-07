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
import math
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


# Armor scaling for armor-class items (item_class=4). Derived from stock AC
# data: plate chest armor ≈ 10.4 * ilvl + 157 across vanilla through ICC.
# Subclass multipliers vs plate chest (queried at ilvl 80):
#   cloth=0.135, leather=0.26, mail=0.56, plate=1.0
# Slot multipliers vs chest:
#   head/shoulders=0.83, chest/robe=1.0, waist=0.66, legs=0.92,
#   feet/hands=0.75, wrists/back=0.50
# Shields use their own curve: armor ≈ 25*ilvl + 1275 (ilvl 65 = ~2900).
# Block value (on shields) scales ≈ 0.9 * ilvl.
ARMOR_BASE_SLOPE = 10.4
ARMOR_BASE_INTERCEPT = 157.0

ARMOR_CLASS_MULTIPLIER = {
    1: 0.135,  # cloth
    2: 0.26,   # leather
    3: 0.56,   # mail
    4: 1.0,    # plate
}

ARMOR_SLOT_MULTIPLIER = {
    1:  0.83,  # head
    3:  0.83,  # shoulders
    5:  1.00,  # chest
    20: 1.00,  # robe
    6:  0.66,  # waist
    7:  0.92,  # legs
    8:  0.75,  # feet
    9:  0.50,  # wrists
    10: 0.75,  # hands
    16: 0.50,  # back
}

SHIELD_ARMOR_SLOPE = 25.0
SHIELD_ARMOR_INTERCEPT = 1275.0
SHIELD_BLOCK_SLOPE = 0.9
SHIELD_BLOCK_INTERCEPT = 0.0


# Disenchant routing per tier — reuses stock disenchant_loot_template entries.
# (verified 2026-05-21: entry 65 = 1-2 Nexus Crystal, 67 = 1 Void Crystal,
# 68 = 1 Abyss Crystal).
DISENCHANT_BY_TIER = {
    "azeroth":   {"id": 65, "skill": 225},   # 1-2 Nexus Crystal (vanilla epic)
    "outland":   {"id": 67, "skill": 300},   # 1 Void Crystal (TBC epic)
    "northrend": {"id": 68, "skill": 375},   # 1 Abyss Crystal (WotLK epic)
}


def get_disenchant(tier: str):
    """Return (DisenchantID, RequiredDisenchantSkill) for the given tier."""
    cfg = DISENCHANT_BY_TIER.get(tier)
    if cfg is None:
        return (0, -1)  # not disenchantable
    return (cfg["id"], cfg["skill"])


def compute_armor(item_class: int, subclass: int, inventory_type: int, item_level: int) -> int:
    """Return the armor value for an armor-class item, or 0 for non-armor.

    Shields (subclass=6, InventoryType=14) use their own curve; relics
    (subclass 7-10) and held off-hands have no armor.
    """
    if item_class != 4:
        return 0
    if subclass == 6:  # shield
        return max(0, int(round(SHIELD_ARMOR_SLOPE * item_level + SHIELD_ARMOR_INTERCEPT)))
    class_mult = ARMOR_CLASS_MULTIPLIER.get(subclass)
    slot_mult = ARMOR_SLOT_MULTIPLIER.get(inventory_type)
    if class_mult is None or slot_mult is None:
        # Accessory slots (neck/finger/trinket) and relics — no armor value
        return 0
    base = max(0.0, ARMOR_BASE_SLOPE * item_level + ARMOR_BASE_INTERCEPT)
    return int(round(base * class_mult * slot_mult))


def compute_shield_block(subclass: int, item_level: int) -> int:
    """Return the block value for a shield, or 0 for non-shields."""
    if subclass != 6:
        return 0
    return max(0, int(round(SHIELD_BLOCK_SLOPE * item_level + SHIELD_BLOCK_INTERCEPT)))


# Weapon DPS profiles derived from stock AC weapons (queried 2026-05-21).
# Family-pooled DPS curves, exponential. Subclass routes to a family by
# (subclass, role); all subclasses in a family share one (delay, a, b).
# DPS(ilvl) = a * exp(b * ilvl). Monotonically increasing by construction
# — avoids the U-shape that a quadratic fit produces when stock data is
# sparse below ilvl 60 (epic-only filter). Growth rate b ≈ 0.007/ilvl
# matches WotLK's "1.27× DPS per 32 ilvls" design rule (1.0070^32 = 1.250).
# Fitted by linear regression on (ilvl, ln(DPS)) against stock epic
# weapons (Quality=4, ItemLevel 60-284), excluding test/QA/deprecated,
# with light P10-per-ilvl-band outlier filter. R² 0.89-0.99 per family.
FAMILY_PROFILES = {
    "1h_melee": (2600, 33.40, 0.00731),
    "2h_melee": (3500, 39.05, 0.00769),
    "dagger":   (1800, 34.10, 0.00722),
    "ranged":   (2900, 28.42, 0.00814),
    "thrown":   (1800, 25.48, 0.00944),
    "wand":     (1800, 61.21, 0.00732),
}

# Per-era family DPS profiles. Same shape as FAMILY_PROFILES (delay, a, b)
# but indexed by era. The global FAMILY_PROFILES blends vanilla through WotLK
# and overshoots vanilla low-end DPS by 3–5 (e.g. ilvl 70: curve 55.7 vs
# stock median 51.5), which costs ~20 budget points on stat scaling. Per-era
# curves track stock medians within 1 point across the relevant range.
# Refit by `zep world item fit-weapon-dps`.
FAMILY_PROFILES_BY_ERA = {
    "1h_melee": {
        "vanilla": (2600, 15.29, 0.01740),
        "tbc":     (2600, 47.49, 0.00531),
        "wotlk":   (2600, 33.29, 0.00726),
    },
    "2h_melee": {
        "vanilla": (3500, 19.87, 0.01742),
        "tbc":     (3500, 49.05, 0.00596),
        "wotlk":   (3500, 43.27, 0.00726),
    },
    "dagger": {
        "vanilla": (1800, 14.30, 0.01828),
        "tbc":     (1800, 47.82, 0.00527),
        "wotlk":   (1800, 33.42, 0.00725),
    },
    "thrown": {
        "tbc":     (1800, 42.87, 0.00529),
        "wotlk":   (1800, 44.30, 0.00716),
    },
    "wand": {
        "vanilla": (1800, 18.35, 0.02200),
        "tbc":     (1800, 87.12, 0.00533),
        "wotlk":   (1800, 61.55, 0.00724),
    },
}

# Subclass -> {role -> family}. Routes a weapon to its family curve.
# Subclasses without a 'caster' entry fall through to their default role.
SUBCLASS_FAMILY = {
    0:  {"physical": "1h_melee"},                                    # 1H axe
    1:  {"physical": "2h_melee"},                                    # 2H axe
    2:  {"physical": "ranged"},                                      # bow
    3:  {"physical": "ranged"},                                      # gun
    4:  {"physical": "1h_melee",   "caster": "1h_melee"},            # 1H mace (caster derives via DPS Trade)
    5:  {"physical": "2h_melee"},                                    # 2H mace
    6:  {"physical": "2h_melee"},                                    # polearm
    7:  {"physical": "1h_melee",   "caster": "1h_melee"},            # 1H sword
    8:  {"physical": "2h_melee"},                                    # 2H sword
    10: {"physical": "2h_melee",   "caster": "2h_melee"},            # staff (caster derives via DPS Trade)
    13: {"physical": "1h_melee"},                                    # fist
    15: {"physical": "dagger",     "caster": "dagger"},              # dagger
    16: {"physical": "thrown"},
    18: {"physical": "ranged"},                                      # crossbow
    19: {"caster":   "wand"},
}

# Per-family minimum DPS floor as a fraction of ItemLevel. Safety net for
# fringe ilvls where the quadratic could undershoot. Quadratic curves now
# track stock norms within ~5-10% across ilvl 60-284, so floors are set
# conservatively (~25% of typical DPS) just to prevent pathological cases.
FAMILY_FLOOR = {
    "1h_melee":  0.40,
    "2h_melee":  0.50,
    "ranged":    0.40,
    "dagger":    0.40,
    "thrown":    0.40,
    "wand":      0.50,
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


def _resolve_family(subclass: int, role: str):
    """Map (subclass, role) to a family key in FAMILY_PROFILES, or None."""
    routes = SUBCLASS_FAMILY.get(subclass)
    if not routes:
        return None
    is_caster = role in ('caster', 'healer')
    if is_caster and 'caster' in routes:
        return routes['caster']
    if 'physical' in routes:
        return routes['physical']
    # Subclass has only one role (e.g. wand=caster-only)
    return next(iter(routes.values()))


_ERA_RANGES_FOR_DPS = (
    ("vanilla", 40, 99),
    ("tbc",     100, 186),
    ("wotlk",   187, 284),
)


def _profile_for(family: str, item_level: int):
    """Pick (delay_ms, a, b) for this family at this ilvl. Prefers per-era
    fit from FAMILY_PROFILES_BY_ERA; falls through to the global
    FAMILY_PROFILES fit if the per-era bin is missing (e.g. thrown has no
    vanilla samples, ranged is global-only)."""
    era = None
    for name, lo, hi in _ERA_RANGES_FOR_DPS:
        if lo <= item_level <= hi:
            era = name
            break
    if era is None:
        era = "vanilla" if item_level < 40 else "wotlk"
    by_era = FAMILY_PROFILES_BY_ERA.get(family, {})
    if era in by_era:
        return by_era[era]
    return FAMILY_PROFILES.get(family)


def compute_weapon_dps(item_class: int, subclass: int, item_level: int, role: str):
    """Return the canonical DPS for a weapon at this (subclass, ilvl, role),
    or None for non-weapons.

    All weapons share a physical DPS curve per family. Caster weapons trade
    DPS for stats per the Classic item-budget design ("DPS Trade"):

        SacrificedDPS = min(ilvl - 60, physical_dps * 0.35)

    The Classic formula `ilvl - 60` is correct at vanilla ilvls (60-80) where
    SoD ilvl 70 sacrifices ~10 DPS off physical 67. It over-sacrifices at
    higher ilvls (would zero out a WotLK caster staff), so we cap at 35% of
    physical to match empirical stock data at ilvl 200/264.

    Wands are exempt — they have no physical equivalent (no ammo).
    """
    if item_class != 2:
        return None
    family = _resolve_family(subclass, role)
    if family is None:
        return None
    profile = _profile_for(family, item_level)
    if profile is None:
        return None
    _, a, b = profile
    fitted = a * math.exp(b * item_level)
    is_caster = role in ("caster", "healer")
    if is_caster and family != "wand":
        sacrifice = min(max(0, item_level - 60), fitted * 0.35)
        fitted -= sacrifice
    floor = FAMILY_FLOOR.get(family, 0.4) * item_level
    return max(floor, fitted)


def compute_weapon_damage(item_class: int, subclass: int, item_level: int, role: str):
    """Return (dmg_min, dmg_max, delay_ms) for a weapon, or None for non-weapons.

    Item class 2 = WEAPON. Item class 4 = ARMOR (includes shields, off-hand
    holdables, and class relics — none have auto-attack damage in 3.x).
    """
    if item_class != 2:
        return None
    family = _resolve_family(subclass, role)
    if family is None:
        return None
    profile = _profile_for(family, item_level)
    if profile is None:
        return None

    delay_ms = profile[0]
    dps = compute_weapon_dps(item_class, subclass, item_level, role)
    avg_dmg = dps * delay_ms / 1000.0
    dmg_min = max(1, round(avg_dmg * DMG_SPREAD_LOW))
    dmg_max = max(dmg_min + 1, round(avg_dmg * DMG_SPREAD_HIGH))
    return (dmg_min, dmg_max, delay_ms)


def _era_for_ilvl(item_level: int, era_ranges: dict) -> str:
    """Pick the era whose ilvl range contains this item_level. Gap regions
    (96-99, 165-186) fall through to the lower-era extrapolated. ilvls below
    the vanilla floor clamp to vanilla; above the WotLK ceiling clamp to wotlk.
    """
    for era in ("vanilla", "tbc", "wotlk"):
        lo, hi = era_ranges.get(era, (None, None))
        if lo is None:
            continue
        if lo <= item_level <= hi:
            return era
    vanilla_lo = era_ranges.get("vanilla", [40, 99])[0]
    return "vanilla" if item_level < vanilla_lo else "wotlk"


def _eval_quad(f, x):
    return max(0.0, f["a"] * x * x + f["b"] * x + f["c"])


def compute_budget(
    inventory_type: int, item_level: int, quality: int,
    subclass: int = None
) -> float:
    """Return the empirically-derived stat budget for one item.

    Lookup order:
      1. Per-(slot, subclass, era)  — armor era splits
      2. Per-(slot, subclass)       — armor all-ilvl
      3. Per-(slot, era)            — primary for weapons
      4. Per-slot                   — all-ilvl fallback
      5. Legacy single-quadratic
    """
    data = _load_formulas()
    quality_ratio = data.get("quality_ratio", {}).get(str(quality), 1.0)

    # Resolve pooled slots (e.g. trinkets share ring's budget formula)
    lookup_iv = SLOT_ALIAS.get(inventory_type, inventory_type)
    era_ranges = data.get("era_ranges", {
        "vanilla": [40, 99], "tbc": [100, 186], "wotlk": [187, 284]
    })
    era = _era_for_ilvl(item_level, era_ranges)

    if subclass is not None:
        by_sub_era = data.get("formulas_by_subclass_era", {})
        key = f"{lookup_iv}:{subclass}:{era}"
        if key in by_sub_era:
            return _eval_quad(by_sub_era[key], item_level) * quality_ratio

        by_sub = data.get("formulas_by_subclass", {})
        key = f"{lookup_iv}:{subclass}"
        if key in by_sub:
            return _eval_quad(by_sub[key], item_level) * quality_ratio

    by_era = data.get("formulas_by_era", {})
    key = f"{lookup_iv}:{era}"
    if key in by_era:
        return _eval_quad(by_era[key], item_level) * quality_ratio

    formulas = data.get("formulas", {})
    if str(lookup_iv) in formulas:
        return _eval_quad(formulas[str(lookup_iv)], item_level) * quality_ratio

    return _legacy_budget(inventory_type, item_level, quality)


# Minimum share of budget any selected stat receives, so secondaries don't
# collapse to +1 junk. Kept low so a heavily weighted primary (e.g. caster
# Spell Power) can genuinely dominate like stock gear — a higher floor capped
# primaries (3 secondaries × floor reserves too much). There is no ceiling.
MIN_STAT_BUDGET_PCT = 0.02

# Per-stat jitter applied to allocation weights so items of the same role vary
# a little instead of reading identically. Deterministic via the caller's rng.
ALLOC_JITTER = 0.18

# Stats that come out below this displayed value are dropped as junk (a token
# +1/+2 reads as filler) and their budget is redistributed to the remaining
# stats — so an item ships fewer, meaningful stats instead of padding.
MIN_STAT_VALUE = 3


def _allocate_once(stat_ids, budget, rng, shares_map, weight_overrides):
    """One pass of share-weighted allocation over exactly `stat_ids`."""
    n = len(stat_ids)
    floor_pct = min(MIN_STAT_BUDGET_PCT, 1.0 / n)
    raw_shares = []
    for sid in stat_ids:
        base = shares_map.get(sid, shares_map.get(str(sid), 1.0))
        base = max(0.01, float(base))
        raw_shares.append(base * (1.0 + rng.uniform(-ALLOC_JITTER, ALLOC_JITTER)))
    total = sum(raw_shares) or 1.0
    extra_pool = max(0.0, 1.0 - floor_pct * n)
    pcts = [floor_pct + (s / total) * extra_pool for s in raw_shares]
    out = []
    for sid, pct in zip(stat_ids, pcts):
        cost = (weight_overrides or {}).get(sid, stat_weight(sid))
        out.append((sid, int(round(pct * budget / cost))))
    return out


def distribute_stats(
    stat_ids: List[int],
    budget: float,
    rng,
    stat_shares: dict = None,
    weight_overrides: dict = None,
) -> List[Tuple[int, int]]:
    """Split `budget` across `stat_ids` by per-stat BUDGET SHARES.

    `stat_shares` is an optional {stat_id: share} (from
    `data/stat_shares.json`, resolved per role) giving the relative portion
    of budget each stat should receive — e.g. casters give Spell Power ~2x
    the share of Stamina, so SP reads as the dominant stat like stock gear.
    Stats absent from the map default to 1.0; with no map at all, stats
    share equally. Keys may be int or str (JSON uses str).

    Shares are jittered ±`ALLOC_JITTER` for variety, each stat is given a
    small floor (`MIN_STAT_BUDGET_PCT`) so it isn't vanishingly small, and the
    remainder is split by normalised share. No ceiling — a heavily weighted
    primary may dominate. Any stat that still comes out below
    `MIN_STAT_VALUE` is dropped as junk and its budget redistributed to the
    rest (the item ships fewer, meaningful stats).

    `weight_overrides` supersedes `STAT_WEIGHT` (the budget→value *cost*
    conversion, "stat weight") for specific stats — a different axis from
    `stat_shares`.

    Order preserved from input. Returns integer (stat_id, value) tuples;
    value floors at 1 to avoid +0 stats."""
    if not stat_ids:
        return []

    shares_map = stat_shares or {}
    working = list(stat_ids)
    out = _allocate_once(working, budget, rng, shares_map, weight_overrides)

    # Drop junk stats and redistribute, until every remaining stat clears the
    # threshold. May drop to zero stats when the budget can't support even one
    # (e.g. a wand, whose spell-damage "DPS" consumes nearly all its budget) —
    # a damage-only item is preferable to a +1 filler stat.
    while True:
        keep = [sid for sid, val in out if val >= MIN_STAT_VALUE]
        if len(keep) == len(working):
            break
        working = keep
        if not working:
            return []
        out = _allocate_once(working, budget, rng, shares_map, weight_overrides)

    return [(sid, val) for sid, val in out]
