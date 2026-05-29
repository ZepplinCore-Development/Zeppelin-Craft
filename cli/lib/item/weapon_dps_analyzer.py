"""Reverse-engineer family-pooled weapon DPS curves from stock AC epic weapons.

Queries `item_template` for obtainable epic weapons, routes each weapon to a
family by (subclass, role), and fits an exponential
  DPS(ilvl) = a * exp(b * ilvl)
via linear regression on (ilvl, ln(DPS)). Writes the fitted profiles back into
the FAMILY_PROFILES dict in `scaler.py` (and prints for review).

The exponential form is chosen because:
- WoW's WotLK budget design is multiplicatively-scaled (~1.27× DPS per 32 ilvls),
  matching DPS(ilvl+1) / DPS(ilvl) = const. That is exactly exponential.
- A quadratic fit produces a U-shape when stock data is sparse below ilvl 60
  (the epic-quality filter) — the parabola's left arm rises to fit the low-end
  cluster, predicting non-monotonic DPS as ilvl decreases. Exponential is
  monotonic by construction.

Items used as the reference corpus:
- class=2 (weapons), Quality=4 (epic)
- ItemLevel BETWEEN 30 AND 284 (vanilla low-level epics through ICC 25H)
- has weapon damage (dmg_min1 > 0, delay > 0)
- entry < 56000 (excludes Zeppelin custom range; stock AC only)
- Excludes name patterns: Test, QA, DEPRECATED, OLD, (NYI), NPC Equip
- Item must be obtainable: appears in some loot_template, npc_vendor, or
  quest_template reward column. This removes GM/dev/test items that aren't
  wired to any drop or reward path.

Families are pooled by (subclass, role):
  1h_melee  = 1H axe/mace/sword/fist (physical)
  1h_caster = 1H mace/sword/dagger with Int or SP
  2h_melee  = 2H axe/mace/polearm/sword/staff (physical)
  2h_caster = staff with Int or SP
  dagger    = dagger (physical)
  bowgun    = bow + gun (ammo-using ranged)
  crossbow  = crossbow (own family — empirically ~5% higher DPS than bow/gun)
  wand      = wand (no ammo → ~2× bow/gun DPS at same ilvl)
  thrown    = thrown
"""

import math
import re
from pathlib import Path
from statistics import median
from typing import Dict, List, Tuple

from ..creature.common import get_db_connection
from .scaler import SUBCLASS_FAMILY

SCALER_PATH = Path(__file__).parent / "scaler.py"

# Mirror of budget_analyzer.ERA_RANGES — kept inline to avoid a circular
# import and the data is small.
ERA_RANGES = {
    "vanilla": (40, 99),
    "tbc":     (100, 186),
    "wotlk":   (187, 284),
}
ERAS = tuple(ERA_RANGES)


def _era_for_ilvl(ilvl: int) -> str:
    for era, (lo, hi) in ERA_RANGES.items():
        if lo <= ilvl <= hi:
            return era
    return "vanilla" if ilvl < ERA_RANGES["vanilla"][0] else "wotlk"


REFERENCE_SQL = """
SELECT it.subclass, it.ItemLevel, it.dmg_min1, it.dmg_max1, it.delay,
       it.stat_type1, it.stat_type2, it.stat_type3, it.stat_type4, it.stat_type5,
       it.stat_type6, it.stat_type7, it.stat_type8, it.stat_type9, it.stat_type10
FROM item_template it
WHERE it.class = 2 AND it.Quality = 4
  AND it.ItemLevel BETWEEN 40 AND 284
  AND it.dmg_min1 > 0 AND it.delay > 0
  AND it.entry < 56000
  AND it.name NOT LIKE '%Test%'
  AND it.name NOT LIKE '%QA%'
  AND it.name NOT LIKE '%DEPRECATED%'
  AND it.name NOT LIKE '%OLD%'
  AND it.name NOT LIKE '%(NYI)%'
  AND it.name NOT LIKE 'NPC Equip%'
  /* Item must be obtainable: loot table, quest reward, or vendor list */
  AND (
    EXISTS (SELECT 1 FROM creature_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM gameobject_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM item_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM reference_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM disenchant_loot_template WHERE Item = it.entry)
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

# Stat IDs that mark an item as "caster" — excluded from the DPS regression.
# Caster weapons trade DPS for stats per the Classic item-budget design
# (SacrificedDPS = ilvl - 60 in vanilla; tapered at higher ilvls). Including
# them in the DPS fit would skew the physical curve downward.
CASTER_STAT_IDS = {5, 45}  # Intellect, Spell Power


def _is_caster(stat_types: List[int]) -> bool:
    return any(s in CASTER_STAT_IDS for s in stat_types)


def _resolve_family(subclass: int) -> str:
    """Map subclass → physical family. Caster weapons are no longer routed
    separately; instead they derive from the physical DPS curve via the
    DPS Trade rule in scaler.compute_weapon_dps."""
    routes = SUBCLASS_FAMILY.get(subclass)
    if not routes:
        return None
    if "physical" in routes:
        return routes["physical"]
    # Wands have no physical variant — return the caster route.
    return next(iter(routes.values()))


def _fit_exponential(points: List[Tuple[int, float]]) -> Tuple[float, float, float]:
    """Linear regression of ln(DPS) = ln(a) + b * ilvl. Returns (a, b, R²)."""
    n = len(points)
    if n < 2:
        return (0.0, 0.0, 0.0)
    sx = sum(x for x, _ in points)
    sy = sum(math.log(y) for _, y in points)
    sxx = sum(x * x for x, _ in points)
    sxy = sum(x * math.log(y) for x, y in points)
    denom = n * sxx - sx * sx
    if abs(denom) < 1e-12:
        return (0.0, 0.0, 0.0)
    b = (n * sxy - sx * sy) / denom
    ln_a = (sy - b * sx) / n
    a = math.exp(ln_a)
    # R²
    mean_ly = sy / n
    ss_tot = sum((math.log(y) - mean_ly) ** 2 for _, y in points)
    ss_res = sum((math.log(y) - (b * x + ln_a)) ** 2 for x, y in points)
    r2 = 1 - ss_res / ss_tot if ss_tot > 0 else 0.0
    return (a, b, r2)


def _outlier_filter(points: List[Tuple[int, float]]) -> List[Tuple[int, float]]:
    """Drop the bottom 10% DPS per ilvl bucket — removes RP/utility weapons
    that share an ilvl with combat epics but have token DPS."""
    by_ilvl: Dict[int, List[float]] = {}
    for x, y in points:
        by_ilvl.setdefault(x, []).append(y)
    clean = []
    for ilvl, dps_list in by_ilvl.items():
        dps_list.sort()
        cutoff_idx = max(0, len(dps_list) // 10)
        for d in dps_list[cutoff_idx:]:
            clean.append((ilvl, d))
    return clean


def fit_families() -> Tuple[
    Dict[str, Tuple[int, float, float]],
    Dict[str, Dict[str, Tuple[int, float, float]]],
]:
    """Pull stock weapons, route to families, fit exponential per family AND
    per (family, era). Returns:
        (global_fits, era_fits)
        global_fits = family -> (delay_ms, a, b)
        era_fits    = family -> {era -> (delay_ms, a, b)}
    """
    buckets: Dict[str, List[Tuple[int, float]]] = {}
    buckets_era: Dict[Tuple[str, str], List[Tuple[int, float]]] = {}
    delays: Dict[str, List[int]] = {}

    conn = get_db_connection()
    try:
        cur = conn.cursor()
        cur.execute(REFERENCE_SQL)
        for row in cur.fetchall():
            subclass = int(row[0])
            ilvl = int(row[1])
            dmin = int(row[2])
            dmax = int(row[3])
            delay = int(row[4])
            if dmin == 0 or delay == 0:
                continue
            dps = (dmin + dmax) / 2.0 / (delay / 1000.0)
            stat_types = [int(row[5 + i]) for i in range(10)]
            family = _resolve_family(subclass)
            if family is None:
                continue
            # Drop caster-statted items from physical-family fits — they sit
            # below physical curves due to the DPS Trade, and the scaler
            # derives caster DPS from physical via subtraction at lookup time.
            # Wands are the exception: they have no physical counterpart, so
            # their fit MUST include caster-statted wands (all of them).
            if family != "wand" and _is_caster(stat_types):
                continue
            buckets.setdefault(family, []).append((ilvl, dps))
            buckets_era.setdefault((family, _era_for_ilvl(ilvl)), []).append((ilvl, dps))
            delays.setdefault(family, []).append(delay)
    finally:
        conn.close()

    print(f"\n{'family':<11} {'n':>4}  {'a':>8} {'b':>9} {'R²':>6}    DPS@40 @70 @100 @200 @264")
    print("-" * 80)
    global_fits: Dict[str, Tuple[int, float, float]] = {}
    for family in sorted(buckets):
        clean = _outlier_filter(buckets[family])
        a, b, r2 = _fit_exponential(clean)
        delay_med = round(median(delays[family]) / 100) * 100
        def D(i, a=a, b=b): return a * math.exp(b * i)
        global_fits[family] = (delay_med, round(a, 4), round(b, 5))
        print(f"{family:<11} {len(clean):>4}  {a:>8.3f} {b:>9.5f} {r2:>6.3f}   "
              f"{D(40):>5.1f} {D(70):>5.1f} {D(100):>5.1f} {D(200):>5.1f} {D(264):>5.1f}")

    # Per-era fits. Skip bins with too few samples (<10) — they fall through
    # to the global fit at lookup time.
    print(f"\nPer-era fits (skip n<10, fall back to global):")
    print(f"{'family':<11} {'era':<8} {'n':>4}  {'a':>8} {'b':>9} {'R²':>6}")
    print("-" * 60)
    era_fits: Dict[str, Dict[str, Tuple[int, float, float]]] = {}
    for (family, era), points in sorted(buckets_era.items()):
        clean = _outlier_filter(points)
        if len(clean) < 10:
            print(f"{family:<11} {era:<8} {len(clean):>4}  (skipped — falls back to global)")
            continue
        a, b, r2 = _fit_exponential(clean)
        delay_med = round(median(delays[family]) / 100) * 100
        era_fits.setdefault(family, {})[era] = (delay_med, round(a, 4), round(b, 5))
        print(f"{family:<11} {era:<8} {len(clean):>4}  {a:>8.3f} {b:>9.5f} {r2:>6.3f}")

    return global_fits, era_fits


_FAMILY_PROFILES_BLOCK_RE = re.compile(
    r"(FAMILY_PROFILES = \{)(.*?)(\n\})",
    re.DOTALL,
)
_FAMILY_PROFILES_BY_ERA_BLOCK_RE = re.compile(
    r"(FAMILY_PROFILES_BY_ERA = \{)(.*?)(\n\})",
    re.DOTALL,
)


def write_results(
    global_fits: Dict[str, Tuple[int, float, float]],
    era_fits: Dict[str, Dict[str, Tuple[int, float, float]]],
) -> None:
    """Rewrite FAMILY_PROFILES and FAMILY_PROFILES_BY_ERA in scaler.py."""
    text = SCALER_PATH.read_text()

    # --- FAMILY_PROFILES (global fallback) ---
    max_name_len = max(len(f) for f in global_fits) + 2
    lines = []
    for family in sorted(global_fits):
        delay, a, b = global_fits[family]
        name_field = f'"{family}":'
        lines.append(f'    {name_field:<{max_name_len + 1}} ({delay}, {a:.2f}, {b:.5f}),')
    new_body = "\n" + "\n".join(lines)
    text = _FAMILY_PROFILES_BLOCK_RE.sub(
        lambda m: m.group(1) + new_body + m.group(3),
        text,
        count=1,
    )

    # --- FAMILY_PROFILES_BY_ERA (primary lookup) ---
    lines = []
    for family in sorted(era_fits):
        lines.append(f'    "{family}": {{')
        for era in ("vanilla", "tbc", "wotlk"):
            if era in era_fits[family]:
                delay, a, b = era_fits[family][era]
                lines.append(f'        "{era}": ({delay}, {a:.2f}, {b:.5f}),')
        lines.append("    },")
    era_body = "\n" + "\n".join(lines)
    text = _FAMILY_PROFILES_BY_ERA_BLOCK_RE.sub(
        lambda m: m.group(1) + era_body + m.group(3),
        text,
        count=1,
    )

    SCALER_PATH.write_text(text)
    print(f"\nUpdated FAMILY_PROFILES + FAMILY_PROFILES_BY_ERA in "
          f"{SCALER_PATH.relative_to(Path.cwd())}")


def run() -> None:
    """Entrypoint for `zep world item fit-weapon-dps`."""
    global_fits, era_fits = fit_families()
    write_results(global_fits, era_fits)


if __name__ == "__main__":  # pragma: no cover
    run()
