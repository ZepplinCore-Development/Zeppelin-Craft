"""Reverse-engineer stat-budget formulas from stock AC epic items.

Queries `item_template` for non-custom, non-set, non-spell-effect epic gear,
groups by InventoryType, and fits a quadratic
  budget(ilvl) = a*ilvl^2 + b*ilvl + c
to the summed stat values. Writes `data/budget_formulas.json` for the scaler
to consume.

Items used as the reference corpus:
- Quality = 4 (Epic)
- entry < 56900 (excludes Zeppelin custom range; stock AC only)
- ItemSet = 0 (set pieces are budget-shifted to make room for set bonuses)
- spellid_1 = 0 (on-equip/on-use effects also consume part of the budget)
- class in (2, 4) (Weapons + Armor; ignore consumables/quest items/etc.)
- ItemLevel BETWEEN 40 AND 284 (Fiery War Axe @ 40 is the first stock epic)

A global per-slot quadratic blends three regimes (vanilla, TBC, WotLK) where
the budget slope shifts notably between eras — vanilla 1H weapons climb ~5
points/ilvl, TBC ~3.4, WotLK ~8.6. Fitting one curve overshoots vanilla low
end. We therefore also emit per-era fits (`formulas_by_era` and
`formulas_by_era_subclass`) keyed by the era boundaries below.
"""

import json
from pathlib import Path
from typing import Dict, List, Tuple

from ..creature.common import get_db_connection
import math
import statistics

from .scaler import (
    STAT_WEIGHT, DPS_BUDGET_WEIGHT, QUALITY_CURVES_PATH, eval_quality_curve,
)

DATA_DIR = Path(__file__).parent / "data"
OUTPUT_PATH = DATA_DIR / "budget_formulas.json"

_OBTAINABLE_CLAUSE = """  /* Item must actually be obtainable in the game: in some loot template,
     vendor list, or quest reward. This is much more robust than name
     patterns for filtering out GM / dev / test items, which typically
     aren't wired to any drop or reward path. */
  AND (
    EXISTS (SELECT 1 FROM creature_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM gameobject_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM item_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM reference_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM disenchant_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM milling_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM prospecting_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM fishing_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM mail_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM skinning_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM npc_vendor WHERE item = it.entry)
    OR EXISTS (SELECT 1 FROM quest_template
               WHERE RewardItem1 = it.entry OR RewardItem2 = it.entry
                  OR RewardItem3 = it.entry OR RewardItem4 = it.entry
                  OR RewardChoiceItemID1 = it.entry OR RewardChoiceItemID2 = it.entry
                  OR RewardChoiceItemID3 = it.entry OR RewardChoiceItemID4 = it.entry
                  OR RewardChoiceItemID5 = it.entry OR RewardChoiceItemID6 = it.entry)
  )
"""

REFERENCE_SQL = f"""
SELECT it.InventoryType, it.subclass, it.ItemLevel,
       it.stat_type1, it.stat_value1, it.stat_type2, it.stat_value2,
       it.stat_type3, it.stat_value3, it.stat_type4, it.stat_value4,
       it.stat_type5, it.stat_value5, it.stat_type6, it.stat_value6,
       it.stat_type7, it.stat_value7, it.stat_type8, it.stat_value8,
       it.stat_type9, it.stat_value9, it.stat_type10, it.stat_value10,
       it.holy_res, it.fire_res, it.nature_res,
       it.frost_res, it.shadow_res, it.arcane_res,
       it.class, it.dmg_min1, it.dmg_max1, it.delay, it.Quality
FROM item_template it
/* Epic-only reference, EXCEPT wands: vanilla epic wands are too sparse
   (n<10) for a per-era fit, so rare wands are included and scaled to
   epic-equivalent budget (/ RARE_TO_EPIC) in the collection loop. */
WHERE (it.Quality = 4 OR (it.Quality = 3 AND it.class = 2 AND it.subclass = 19))
  AND it.stat_type1 > 0
  AND it.entry < 56900 AND it.ItemSet = 0
  AND it.spellid_1 = 0 AND it.spellid_2 = 0 AND it.spellid_3 = 0
  AND it.spellid_4 = 0 AND it.spellid_5 = 0
  AND it.class IN (2, 4)
  AND it.ItemLevel BETWEEN 40 AND 284
{_OBTAINABLE_CLAUSE}"""

# Inventory types that get a per-subclass fit. Empty 2026-05 — both weapons
# and armor are now pooled at the per-slot level.
#
# Weapons (axe vs sword vs mace vs dagger) were dropped first: per-subclass
# fits produced wildly different budgets (e.g. axe @76=350 vs mace @76=315)
# from small samples and accidental tier-distribution skew, but the
# underlying stat budget really is uniform across same-slot weapons.
#
# Armor (cloth vs leather vs mail vs plate) followed: empirical multipliers
# at ilvl 200 cluster in 0.96-1.04 across every slot — the "armor type"
# distinction shows up in defensive armor value (handled separately by
# scaler.compute_armor), not in primary-stat budget. Pooling triples
# vanilla samples per fit and lets per-era armor fits work where they
# previously fell back to all-ilvl.
#
# EXCEPTION — ranged slot (InventoryType 26): wands carry ~2x the weapon DPS
# of guns/crossbows (no ammo to supplement them), so their TOTAL budget
# (stats + DPS*5) is far higher (stock wand ~500 vs gun ~280 at ilvl ~75).
# Pooling them produced ~400 — too low for wands (DPS alone exceeded it →
# statless wands) and too high for guns (over-statted). Split iv 26 by
# subclass so wand (19) / gun (3) / crossbow (18) each get their own budget.
SUBCLASS_SPLIT_TYPES: set = {26}
# Backward-compatible alias
ARMOR_INVENTORY_TYPES = SUBCLASS_SPLIT_TYPES

# Era boundaries for the piecewise fit. ilvl ranges are inclusive; gap regions
# (96-99, 165-186) fall through to the lower era extrapolated. Vanilla ends at
# Naxx40 (~ilvl 88-92); TBC starts at Karazhan dungeons (ilvl ~100); WotLK
# starts at Naxx10 (~ilvl 187, big sample jump to 200 with the bulk of WotLK
# epics).
ERAS = ("vanilla", "tbc", "wotlk")
ERA_RANGES = {
    "vanilla": (40, 99),
    "tbc":     (100, 186),
    "wotlk":   (187, 284),
}


def _era_for_ilvl(ilvl: int) -> str:
    for era in ERAS:
        lo, hi = ERA_RANGES[era]
        if lo <= ilvl <= hi:
            return era
    if ilvl < ERA_RANGES["vanilla"][0]:
        return "vanilla"
    return "wotlk"

# Slots that get merged into a shared budget pool for the fit. Neck (2),
# ring (11), trinket (12), and back (16) all sit at nearly identical
# weighted budgets per ilvl in stock data — pooling them gives a single
# clean accessory fit with n>800 and frees trinkets from their n=3 cliff.
# Bows (iv 15) pool into the ranged slot (iv 26) so all ammo weapons share
# one bucket — see SUBCLASS_POOL.
SLOT_POOL = {
    2:  11,  # neck    -> accessory pool
    12: 11,  # trinket -> accessory pool
    16: 11,  # back    -> accessory pool
    15: 26,  # bow     -> ranged pool (ammo group, see SUBCLASS_POOL)
}

# Subclasses merged within a SUBCLASS_SPLIT_TYPES slot. The ammo weapons
# (bow 2 / gun 3 / crossbow 18) carry near-identical DPS (~53 @ il76 — ammo
# supplements them) and total budget (~280), so they share one bucket keyed
# (26, 3); fitting them separately left crossbow with a skewed high-ilvl
# sample (n=33, avg il 210) that extrapolated ~3x stock at vanilla ilvls.
# Wands (19) stay separate — no ammo, ~2x DPS, ~2x total budget.
# Mirror of SUBCLASS_ALIAS in scaler.py.
SUBCLASS_POOL = {
    (26, 2):  3,  # bow      -> ammo-ranged pool
    (26, 18): 3,  # crossbow -> ammo-ranged pool
}

# Rare:epic budget ratio — must match the quality_ratio written to
# budget_formulas.json (scaler multiplies the epic fit by this for rares).
# Used to scale rare wands up to epic-equivalent in the reference set.
RARE_TO_EPIC = 0.85

# Resistance weight derived from TBC rare gem comparison:
#   Solid Star of Elune (TBC rare, 1 socket) = +12 Stamina
#   Prismatic Sphere    (TBC rare, 1 socket) = +3 Resist All = 18 resist points
# Ratio: 12 Stam = 18 Resist, so 1 Resist = 0.667 Stam.
# With STAT_WEIGHT[stam] = 0.667 (WotLK gem-derived), that gives:
#   RESIST_WEIGHT = 0.667 / 1.5 = 0.444
RESIST_WEIGHT = 0.444

# Minimum samples per fit. Below this, fall back to the InventoryType-wide fit
# (or a sibling slot for weapons that have too few non-spell-effect epics).
MIN_SAMPLES = 20

# Era-specific fits get a lower threshold because each era is a narrower
# ilvl window with naturally fewer samples (especially vanilla armor at
# ~5-16 per slot). The fit may have low R² in noisy bins but still captures
# the ilvl-slope direction, which is what the per-era piecewise needs.
MIN_SAMPLES_ERA = 10

# Fallback mapping when a slot has too few samples.
FALLBACK_SLOT = {
    21: 13,   # mainhand-only -> 1h
    22: 13,   # offhand-only weapon -> 1h
    25: 15,   # thrown -> bow (both ranged)
    26: 15,   # gun/wand/crossbow -> bow
    28: 14,   # relic -> shield (similar size budget bucket)
}


def _solve_3x3(A: List[List[float]], B: List[float]) -> List[float]:
    """Gauss-Jordan elimination for a 3x3 system. Returns the 3-element solution."""
    M = [row[:] + [B[i]] for i, row in enumerate(A)]
    for i in range(3):
        pivot = M[i][i]
        if abs(pivot) < 1e-12:
            for j in range(i + 1, 3):
                if abs(M[j][i]) > 1e-12:
                    M[i], M[j] = M[j], M[i]
                    pivot = M[i][i]
                    break
            if abs(pivot) < 1e-12:
                raise ValueError("singular matrix")
        for k in range(4):
            M[i][k] /= pivot
        for j in range(3):
            if j != i:
                factor = M[j][i]
                for k in range(4):
                    M[j][k] -= factor * M[i][k]
    return [M[i][3] for i in range(3)]


def _fit_quadratic(points: List[Tuple[int, int]]) -> Tuple[float, float, float, float]:
    """Least-squares fit y = a*x^2 + b*x + c. Returns (a, b, c, r_squared)."""
    n = len(points)
    Sx = sum(x for x, _ in points)
    Sx2 = sum(x * x for x, _ in points)
    Sx3 = sum(x ** 3 for x, _ in points)
    Sx4 = sum(x ** 4 for x, _ in points)
    Sy = sum(y for _, y in points)
    Sxy = sum(x * y for x, y in points)
    Sx2y = sum(x * x * y for x, y in points)
    A = [[Sx4, Sx3, Sx2], [Sx3, Sx2, Sx], [Sx2, Sx, n]]
    a, b, c = _solve_3x3(A, [Sx2y, Sxy, Sy])
    ymean = Sy / n
    ss_tot = sum((y - ymean) ** 2 for _, y in points)
    ss_res = sum((y - (a * x * x + b * x + c)) ** 2 for x, y in points)
    r2 = 1 - ss_res / ss_tot if ss_tot > 0 else 0.0
    return a, b, c, r2


def _weighted_total(row) -> float:
    """Compute the total budget for one item.

    For armor / accessories: sum(stat_value * stat_weight) + resistance.
    For weapons (class=2): adds DPS contribution at DPS_BUDGET_WEIGHT — caster
    weapons trade DPS for stats, physical weapons trade stats for DPS, but
    total budget is balanced. This is what makes the per-(subclass) curve
    fit both roles in one line instead of splitting.
    """
    total = 0.0
    # row layout: iv, subclass, ilvl, 10×(type, value), 6 resists, class, dmg_min1, dmg_max1, delay
    for i in range(10):
        stat_type = int(row[3 + i * 2])
        stat_value = int(row[4 + i * 2])
        if stat_type > 0 and stat_value > 0:
            total += stat_value * STAT_WEIGHT.get(stat_type, 1.0)
    for i in range(6):
        rv = int(row[23 + i])
        if rv > 0:
            total += rv * RESIST_WEIGHT
    # Weapons: add DPS contribution
    item_class = int(row[29])
    if item_class == 2:
        dmg_min = int(row[30])
        dmg_max = int(row[31])
        delay = int(row[32])
        if dmg_min > 0 and dmg_max > 0 and delay > 0:
            dps = (dmg_min + dmg_max) / 2.0 / (delay / 1000.0)
            total += dps * DPS_BUDGET_WEIGHT
    return total


def _fetch_reference_items() -> Tuple[
    Dict[Tuple[int, int], List[Tuple[int, float]]],
    Dict[int, List[Tuple[int, float]]],
    Dict[Tuple[int, str], List[Tuple[int, float]]],
    Dict[Tuple[int, int, str], List[Tuple[int, float]]],
]:
    """Pull the reference dataset and compute weighted budget per item.

    Returns:
        by_slot_subclass:     keyed by (InventoryType, subclass) — armor only
        by_slot:              keyed by InventoryType — all-ilvl fallback
        by_slot_era:          keyed by (InventoryType, era) — primary
        by_slot_subclass_era: keyed by (InventoryType, subclass, era) — armor
    """
    by_slot_subclass: Dict[Tuple[int, int], List[Tuple[int, float]]] = {}
    by_slot: Dict[int, List[Tuple[int, float]]] = {}
    by_slot_era: Dict[Tuple[int, str], List[Tuple[int, float]]] = {}
    by_slot_subclass_era: Dict[Tuple[int, int, str], List[Tuple[int, float]]] = {}
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(REFERENCE_SQL)
        for row in cursor.fetchall():
            iv, subclass, ilvl = int(row[0]), int(row[1]), int(row[2])
            total = _weighted_total(row)
            if total <= 0:
                continue
            # Rare rows (only wands per REFERENCE_SQL) scale up to their
            # epic-equivalent budget so they can join the epic fit. Must
            # match the quality_ratio the scaler applies (rare = 0.85x epic).
            if int(row[33]) == 3:
                total /= RARE_TO_EPIC
            era = _era_for_ilvl(ilvl)
            # Merge pooled slots into their target slot for the per-slot fit
            # (e.g. trinkets get added to the ring bucket).
            target_iv = SLOT_POOL.get(iv, iv)
            by_slot.setdefault(target_iv, []).append((ilvl, total))
            by_slot_era.setdefault((target_iv, era), []).append((ilvl, total))
            if target_iv in SUBCLASS_SPLIT_TYPES:
                target_sc = SUBCLASS_POOL.get((target_iv, subclass), subclass)
                by_slot_subclass.setdefault((target_iv, target_sc), []).append((ilvl, total))
                by_slot_subclass_era.setdefault((target_iv, target_sc, era), []).append((ilvl, total))
    finally:
        conn.close()
    return by_slot_subclass, by_slot, by_slot_era, by_slot_subclass_era


def _compute_quality_ratio(by_slot: Dict[int, List[Tuple[int, int]]]) -> float:
    """Compute the rare/epic budget ratio by comparing same-ilvl items.

    Rare items aren't in the input set (epic only), so we use the
    historical 0.85 ratio (rare gets ~85% of epic budget).
    """
    return 0.85


ARMOR_SUBCLASS_NAME = {1: "cloth", 2: "leather", 3: "mail", 4: "plate",
                       6: "shield", 7: "libram", 8: "idol", 9: "totem", 10: "sigil"}
WEAPON_SUBCLASS_NAME = {0: "1H axe", 1: "2H axe", 2: "bow", 3: "gun",
                        4: "1H mace", 5: "2H mace", 6: "polearm",
                        7: "1H sword", 8: "2H sword", 10: "staff",
                        13: "fist", 15: "dagger", 16: "thrown",
                        18: "wand", 19: "crossbow"}

# Armor slot inventory types
_ARMOR_IVS = {1, 3, 5, 6, 7, 8, 9, 10, 20}


def _subclass_label(iv: int, sub: int) -> str:
    if iv in _ARMOR_IVS:
        return ARMOR_SUBCLASS_NAME.get(sub, f"sub{sub}")
    return WEAPON_SUBCLASS_NAME.get(sub, f"sub{sub}")


def _fit_and_record(
    points: List[Tuple[int, int]], label: str, verbose: bool
) -> Dict[str, float]:
    """Fit one set of points and produce the JSON record for it."""
    a, b, c, r2 = _fit_quadratic(points)
    rec = {"a": a, "b": b, "c": c, "r2": r2, "n": len(points)}
    if verbose:
        est66 = max(0, round(a * 66 * 66 + b * 66 + c))
        est76 = max(0, round(a * 76 * 76 + b * 76 + c))
        est200 = max(0, round(a * 200 * 200 + b * 200 + c))
        print(f"  {label:<22} n={len(points):>4} R²={r2:.3f}  "
              f"epic @66={est66:>3} @76={est76:>3} @200={est200:>3}")
    return rec


def analyze(verbose: bool = True) -> Dict:
    """Query DB, fit per-slot quadratics, return the formula dict.

    Result shape:
        {
          "formulas":                {"<iv>":              {a,b,c,r2,n}},
          "formulas_by_subclass":    {"<iv>:<sub>":        {a,b,c,r2,n}},
          "formulas_by_era":         {"<iv>:<era>":        {a,b,c,r2,n}},
          "formulas_by_subclass_era":{"<iv>:<sub>:<era>":  {a,b,c,r2,n}},
          "era_ranges": {"vanilla":[40,99], "tbc":[100,186], "wotlk":[187,284]},
          "quality_ratio": {"3": 0.85, "4": 1.0},
          ...
        }
    """
    by_slot_subclass, by_slot, by_slot_era, by_slot_subclass_era = (
        _fetch_reference_items()
    )
    if verbose:
        total = sum(len(v) for v in by_slot.values())
        print(f"Loaded {total} stock epic items across {len(by_slot)} inventory types")
        print()
        print("Per-slot fits (all-ilvl, fallback):")

    formulas: Dict[str, Dict[str, float]] = {}
    for iv, points in sorted(by_slot.items()):
        if len(points) < MIN_SAMPLES:
            continue
        formulas[str(iv)] = _fit_and_record(points, f"iv={iv}", verbose)

    if verbose:
        print()
        print("Per-(slot, subclass) fits (armor only, all-ilvl):")
    formulas_sub: Dict[str, Dict[str, float]] = {}
    for (iv, sub), points in sorted(by_slot_subclass.items()):
        if len(points) < MIN_SAMPLES:
            continue
        sub_label = _subclass_label(iv, sub)
        formulas_sub[f"{iv}:{sub}"] = _fit_and_record(
            points, f"iv={iv}/{sub_label}", verbose
        )

    if verbose:
        print()
        print(f"Per-(slot, era) fits (primary lookup, min n={MIN_SAMPLES_ERA}):")
    formulas_era: Dict[str, Dict[str, float]] = {}
    for (iv, era), points in sorted(by_slot_era.items()):
        if len(points) < MIN_SAMPLES_ERA:
            continue
        formulas_era[f"{iv}:{era}"] = _fit_and_record(
            points, f"iv={iv}/{era}", verbose
        )

    if verbose:
        print()
        print(f"Per-(slot, subclass, era) fits (min n={MIN_SAMPLES_ERA}):")
    formulas_sub_era: Dict[str, Dict[str, float]] = {}
    for (iv, sub, era), points in sorted(by_slot_subclass_era.items()):
        if len(points) < MIN_SAMPLES_ERA:
            continue
        sub_label = _subclass_label(iv, sub)
        formulas_sub_era[f"{iv}:{sub}:{era}"] = _fit_and_record(
            points, f"iv={iv}/{sub_label}/{era}", verbose
        )

    # Fallback slots (weapons that have few non-effect epics)
    for slot, fallback in FALLBACK_SLOT.items():
        if str(slot) not in formulas and str(fallback) in formulas:
            formulas[str(slot)] = dict(formulas[str(fallback)])
            formulas[str(slot)]["fallback_from"] = fallback
        # Propagate fallback to per-era fits too
        for era in ERAS:
            era_key = f"{slot}:{era}"
            fb_key = f"{fallback}:{era}"
            if era_key not in formulas_era and fb_key in formulas_era:
                formulas_era[era_key] = dict(formulas_era[fb_key])
                formulas_era[era_key]["fallback_from"] = fallback

    return {
        "formulas": formulas,
        "formulas_by_subclass": formulas_sub,
        "formulas_by_era": formulas_era,
        "formulas_by_subclass_era": formulas_sub_era,
        "era_ranges": {e: list(ERA_RANGES[e]) for e in ERAS},
        "quality_ratio": {"3": 0.85, "4": 1.0},
        "min_samples": MIN_SAMPLES,
        "subclass_split_slots": sorted(SUBCLASS_SPLIT_TYPES),
    }


# ---------------------------------------------------------------------------
# Uncommon (2) / rare (3) curves — I-435
#
# The epic fit above does not cover greens/blues, and its quadratics rise as
# ilvl falls below 40. Greens and blues get their own curves, fitted on stock
# items of that quality across the whole ilvl range they exist at (greens
# ~5-187, blues ~18-200), using the same weighted-total measure, the same slot
# pooling (SLOT_POOL / SUBCLASS_POOL) and the same exclusions (non-set, no
# spell effects, obtainable), plus no random-property/suffix items (those
# carry no fixed stats).
#
# Model: continuous piecewise power law, fitted by least squares in log-log
#   ln(B) = c0 + c1*ln(L) + c2*max(0, ln(L/80)) + c3*max(0, ln(L/130))
# Knots sit where the green/blue ilvl ladder changes era (TBC levelling
# greens start ~ilvl 80, WotLK ~130). Why this and not the epic quadratic:
# - a power law passes through 0 at L=0 and, with every segment slope > 0
#   (checked; a knot is dropped if it would break that), is monotonic — no
#   low-ilvl rise, no negative budgets;
# - log-space residuals are relative, which matches how budgets scale
#   (a +1 stat matters at ilvl 10, not at 180);
# - stock residuals (median |err|, all slots): green 1-19: 7.5% (quadratic
#   18%), 20-39: 8.7%, 40-59: 9.6%, 80-119: 6.9%, 120+: ~3%; blue 20-39:
#   5.4% (quadratic 10.6%). Extra knots (30/40/60) moved the medians by <1
#   point, so they were not kept.
# Each curve records its fitted ilvl range; the scaler clamps to it.
# ---------------------------------------------------------------------------

QUALITY_CURVE_QUALITIES = (2, 3)
QUALITY_CURVE_KNOTS = (80, 130)
# A knot is used only with at least this many samples on each side of it.
QUALITY_CURVE_MIN_SEGMENT = 10
# Pools below MIN_SAMPLES get no own curve and use the fallback below.
# Thrown (25) goes to the ammo-ranged pool, off-hand-only/main-hand-only
# weapons to 1H, relics to shield (as the epic FALLBACK_SLOT does).
QUALITY_FALLBACK_SLOT = {
    21: "13",
    22: "13",
    25: "26:3",
    28: "14",
}
# ilvl bands for the residual table / in-band check.
RESIDUAL_BANDS = ((1, 19), (20, 39), (40, 59), (60, 79),
                  (80, 119), (120, 159), (160, 300))

QUALITY_REFERENCE_SQL = f"""
SELECT it.InventoryType, it.subclass, it.ItemLevel,
       it.stat_type1, it.stat_value1, it.stat_type2, it.stat_value2,
       it.stat_type3, it.stat_value3, it.stat_type4, it.stat_value4,
       it.stat_type5, it.stat_value5, it.stat_type6, it.stat_value6,
       it.stat_type7, it.stat_value7, it.stat_type8, it.stat_value8,
       it.stat_type9, it.stat_value9, it.stat_type10, it.stat_value10,
       it.holy_res, it.fire_res, it.nature_res,
       it.frost_res, it.shadow_res, it.arcane_res,
       it.class, it.dmg_min1, it.dmg_max1, it.delay, it.Quality,
       it.entry, it.name
FROM item_template it
WHERE it.Quality IN (2, 3)
  AND it.stat_type1 > 0
  AND it.entry < 56900 AND it.ItemSet = 0
  AND it.RandomProperty = 0 AND it.RandomSuffix = 0
  AND it.spellid_1 = 0 AND it.spellid_2 = 0 AND it.spellid_3 = 0
  AND it.spellid_4 = 0 AND it.spellid_5 = 0
  AND it.class IN (2, 4)
{_OBTAINABLE_CLAUSE}"""


def _solve_linear(A: List[List[float]], B: List[float]) -> List[float]:
    """Gaussian elimination with partial pivoting for a small k x k system."""
    k = len(B)
    M = [A[i][:] + [B[i]] for i in range(k)]
    for i in range(k):
        p = max(range(i, k), key=lambda r: abs(M[r][i]))
        M[i], M[p] = M[p], M[i]
        if abs(M[i][i]) < 1e-12:
            raise ValueError("singular matrix")
        for j in range(k):
            if j != i:
                f = M[j][i] / M[i][i]
                M[j] = [a - f * b for a, b in zip(M[j], M[i])]
    return [M[i][k] / M[i][i] for i in range(k)]


def _fit_loglog_hinge(points: List[Tuple[int, float]]) -> Dict:
    """Fit the uncommon/rare curve to (ilvl, weighted_total) points.

    Uses each knot in QUALITY_CURVE_KNOTS that has >= QUALITY_CURVE_MIN_SEGMENT
    samples on both sides. If any segment slope comes out <= 0 the
    highest-remaining knot is dropped and the fit is redone; a plain power
    law with exponent <= 0 is rejected (ValueError) rather than shipped.
    """
    knots = [k for k in QUALITY_CURVE_KNOTS
             if sum(1 for x, _ in points if x > k) >= QUALITY_CURVE_MIN_SEGMENT
             and sum(1 for x, _ in points if x <= k) >= QUALITY_CURVE_MIN_SEGMENT]
    lx = [math.log(x) for x, _ in points]
    ly = [math.log(y) for _, y in points]
    while True:
        X = [[1.0, l] + [max(0.0, l - math.log(k)) for k in knots] for l in lx]
        n = len(X[0])
        A = [[sum(r[i] * r[j] for r in X) for j in range(n)] for i in range(n)]
        B = [sum(r[i] * y for r, y in zip(X, ly)) for i in range(n)]
        coef = _solve_linear(A, B)
        slopes = [coef[1]]
        for c in coef[2:]:
            slopes.append(slopes[-1] + c)
        if min(slopes) > 0:
            break
        if not knots:
            raise ValueError(f"non-increasing power law (exponent {coef[1]:.3f})")
        knots = knots[:-1]
    rec = {"model": "loglog_hinge", "coef": coef, "knots": list(knots),
           "segment_slopes": slopes,
           "ilvl_min": min(x for x, _ in points),
           "ilvl_max": max(x for x, _ in points),
           "n": len(points)}
    errs = [abs(eval_quality_curve(rec, x) - y) / y for x, y in points]
    rec["median_abs_pct_err"] = round(100 * statistics.median(errs), 2)
    return rec


def fetch_quality_reference_items() -> List[Dict]:
    """Stock uncommon/rare reference items with their weighted totals.

    Returns dicts: entry, name, quality, iv, subclass, ilvl, total, pool_key
    (pool_key = the curve key the item feeds: pooled slot, or "26:<sub>").
    """
    out: List[Dict] = []
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(QUALITY_REFERENCE_SQL)
        for row in cursor.fetchall():
            total = _weighted_total(row)
            if total <= 0:
                continue
            iv, subclass, ilvl = int(row[0]), int(row[1]), int(row[2])
            target_iv = SLOT_POOL.get(iv, iv)
            item = {"entry": int(row[34]), "name": row[35],
                    "quality": int(row[33]), "iv": iv, "subclass": subclass,
                    "ilvl": ilvl, "total": total,
                    "pool_iv": str(target_iv), "pool_sub": None}
            if target_iv in SUBCLASS_SPLIT_TYPES:
                sc = SUBCLASS_POOL.get((target_iv, subclass), subclass)
                item["pool_sub"] = f"{target_iv}:{sc}"
            out.append(item)
    finally:
        conn.close()
    return out


def fit_quality_curves(items: List[Dict], verbose: bool = False) -> Dict:
    """Fit per-quality curves + residual bands from reference items."""
    curves: Dict[str, Dict[str, Dict]] = {}
    bands: Dict[str, List[Dict]] = {}
    for q in QUALITY_CURVE_QUALITIES:
        pools: Dict[str, List[Tuple[int, float]]] = {}
        for it in items:
            if it["quality"] != q:
                continue
            # Split slots (ranged) get per-subclass curves only: a pooled
            # wand+gun curve misses both by ~25%, so a ranged lookup without
            # a subclass must fail rather than use it.
            if not it["pool_sub"]:
                pools.setdefault(it["pool_iv"], []).append((it["ilvl"], it["total"]))
            else:
                pools.setdefault(it["pool_sub"], []).append((it["ilvl"], it["total"]))
        qc: Dict[str, Dict] = {}
        if verbose:
            print(f"Quality {q} curves (min n={MIN_SAMPLES}):")
        for key, pts in sorted(pools.items()):
            if len(pts) < MIN_SAMPLES:
                if verbose:
                    print(f"  {key:<6} n={len(pts):>4}  skipped (sparse)")
                continue
            try:
                rec = _fit_loglog_hinge(pts)
            except ValueError as e:
                if verbose:
                    print(f"  {key:<6} n={len(pts):>4}  rejected: {e}")
                continue
            qc[key] = rec
            if verbose:
                est = "  ".join(
                    f"@{L}={eval_quality_curve(rec, L):6.1f}" for L in (10, 27, 60, 115, 180))
                print(f"  {key:<6} n={len(pts):>4} il {rec['ilvl_min']:>3}-{rec['ilvl_max']:<3} "
                      f"knots={rec['knots']!s:<9} med|err|={rec['median_abs_pct_err']:>5.1f}%  {est}")
        for slot, fb in QUALITY_FALLBACK_SLOT.items():
            if str(slot) not in qc and fb in qc:
                qc[str(slot)] = dict(qc[fb])
                qc[str(slot)]["fallback_from"] = fb
                if verbose:
                    print(f"  {slot:<6} -> fallback to {fb}")
        curves[str(q)] = qc

        # Residual bands: actual / predicted for every item, per ilvl band.
        qb: List[Dict] = []
        ratios_by_band: Dict[Tuple[int, int], List[float]] = {b: [] for b in RESIDUAL_BANDS}
        for it in items:
            if it["quality"] != q:
                continue
            key = it["pool_sub"] if it["pool_sub"] in qc else it["pool_iv"]
            if key not in qc:
                continue
            pred = eval_quality_curve(qc[key], it["ilvl"])
            for b in RESIDUAL_BANDS:
                if b[0] <= it["ilvl"] <= b[1]:
                    ratios_by_band[b].append(it["total"] / pred)
                    break
        for b in RESIDUAL_BANDS:
            r = sorted(ratios_by_band[b])
            if len(r) < 5:
                continue
            qb.append({
                "lo": b[0], "hi": b[1], "n": len(r),
                "p10": round(r[int(0.10 * (len(r) - 1))], 3),
                "p50": round(statistics.median(r), 3),
                "p90": round(r[int(0.90 * (len(r) - 1))], 3),
                "median_abs_pct_err": round(100 * statistics.median(abs(x - 1) for x in r), 2),
            })
        bands[str(q)] = qb
        if verbose:
            print(f"  residuals (actual/predicted):")
            for b in qb:
                print(f"    ilvl {b['lo']:>3}-{b['hi']:<3} n={b['n']:>4}  "
                      f"med|err|={b['median_abs_pct_err']:>5.1f}%  "
                      f"p10={b['p10']:.2f} p50={b['p50']:.2f} p90={b['p90']:.2f}")
            print()
    return {
        "_comment": ("Uncommon/rare stat-budget curves (I-435). Model loglog_hinge: "
                     "ln(B)=c0+c1*ln(L)+sum ck*max(0,ln(L/knot_k)). Budget units = "
                     "STAT_WEIGHT weighted total (+ DPS*5 for weapons). Clamp to "
                     "[ilvl_min, ilvl_max]. residual_bands = actual/predicted over "
                     "stock items per ilvl band. Regenerate with `zep world item "
                     "analyze-budget --scope quality`."),
        "model": "loglog_hinge",
        "knots": list(QUALITY_CURVE_KNOTS),
        "curves": curves,
        "residual_bands": bands,
        "slot_pool": {str(k): v for k, v in SLOT_POOL.items()},
        "subclass_pool": {f"{k[0]}:{k[1]}": v for k, v in SUBCLASS_POOL.items()},
        "min_samples": MIN_SAMPLES,
    }


def run_quality_curves(verbose: bool = True, path: Path = QUALITY_CURVES_PATH) -> Path:
    """Fit uncommon/rare curves from the live DB and write them. Does not
    touch budget_formulas.json (the epic fit)."""
    items = fetch_quality_reference_items()
    if verbose:
        for q in QUALITY_CURVE_QUALITIES:
            n = sum(1 for it in items if it["quality"] == q)
            print(f"Loaded {n} stock quality-{q} items")
        print()
    result = fit_quality_curves(items, verbose=verbose)
    return write(result, path)


NEAREST_SQL = f"""
SELECT it.InventoryType, it.subclass, it.ItemLevel,
       it.stat_type1, it.stat_value1, it.stat_type2, it.stat_value2,
       it.stat_type3, it.stat_value3, it.stat_type4, it.stat_value4,
       it.stat_type5, it.stat_value5, it.stat_type6, it.stat_value6,
       it.stat_type7, it.stat_value7, it.stat_type8, it.stat_value8,
       it.stat_type9, it.stat_value9, it.stat_type10, it.stat_value10,
       it.holy_res, it.fire_res, it.nature_res,
       it.frost_res, it.shadow_res, it.arcane_res,
       it.class, it.dmg_min1, it.dmg_max1, it.delay, it.Quality,
       it.entry, it.name
FROM item_template it
WHERE it.InventoryType IN ({{ivs}})
  AND it.Quality = %s
  AND it.ItemLevel BETWEEN %s AND %s
  {{subclass_filter}}
  AND it.stat_type1 > 0
  AND it.entry < 56900 AND it.ItemSet = 0
  AND it.RandomProperty = 0 AND it.RandomSuffix = 0
  AND it.spellid_1 = 0 AND it.spellid_2 = 0 AND it.spellid_3 = 0
  AND it.spellid_4 = 0 AND it.spellid_5 = 0
  AND it.class IN (2, 4)
{_OBTAINABLE_CLAUSE}"""


def nearest_stock_items(inventory_types: List[int], quality: int, ilvl: int,
                        limit: int = 5, subclasses: List[int] = None,
                        window: int = 15) -> List[Dict]:
    """Stock items (same reference filters as the fit) of these
    InventoryTypes/quality nearest to `ilvl`, with weighted totals."""
    sub_sql = ""
    if subclasses:
        sub_sql = "AND it.subclass IN (" + ",".join(str(int(s)) for s in subclasses) + ")"
    sql = NEAREST_SQL.format(ivs=",".join(str(int(i)) for i in inventory_types),
                             subclass_filter=sub_sql)
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(sql, (quality, ilvl - window, ilvl + window))
        rows = cursor.fetchall()
    finally:
        conn.close()
    out = []
    for row in rows:
        stats = []
        for i in range(10):
            t, v = int(row[3 + i * 2]), int(row[4 + i * 2])
            if t > 0 and v != 0:
                stats.append((t, v))
        out.append({"entry": int(row[34]), "name": row[35], "iv": int(row[0]),
                    "subclass": int(row[1]), "ilvl": int(row[2]),
                    "stats": stats, "total": _weighted_total(row)})
    out.sort(key=lambda r: (abs(r["ilvl"] - ilvl), r["entry"]))
    return out[:limit]


def write(result: Dict, path: Path = OUTPUT_PATH) -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w") as f:
        json.dump(result, f, indent=2)
    return path


def run(verbose: bool = True) -> Path:
    """Run the analyzer and write the formulas file. Returns output path."""
    result = analyze(verbose=verbose)
    return write(result)
