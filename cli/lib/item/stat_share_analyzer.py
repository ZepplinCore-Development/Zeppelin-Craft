"""F-013 stat-budget-share analyzer.

Measures, from stock AC gear, how the stat BUDGET is split across stats within
each role (caster / healer / melee / tank) — e.g. a caster staff spends ~40% of
its budget on Spell Power and only ~19% on Stamina. Those ratios become the
per-role *stat shares* in `data/stat_shares.json`, which
`generator.distribute_stats` uses to split budget instead of a flat 15-35%
random roll (which made every stat ~equal — casters got as much Stamina as
Spell Power, unlike real gear).

Two distinct numbers — do not confuse:
  * scaler.STAT_WEIGHT  — gem-derived COST to convert budget pts -> stat value
                          (game balance; e.g. SP costs 0.857/pt, Stam 0.667).
  * stat share          — relative SHARE of an item's budget a stat receives
                          within its role (itemization preference; this file).

Method: for each obtainable stock item (class 2/4, Quality 3-4), classify its
role from its stat signature (reuses role_classifier._role_signals), then for
each stat present compute its weighted share of the item's total weighted
budget. The per-(role, stat) mean of those conditional shares is the signal;
shares are normalised per role so the median emitted value is ~1.0 for
readability (absolute scale is irrelevant — the allocator re-normalises across
whichever stats an item actually rolls).

Run with `zep world item analyze-stat-shares`.
"""

import json
import statistics
from pathlib import Path
from typing import Dict, List

from ..creature.common import get_db_connection
from .scaler import STAT_WEIGHT
from .role_classifier import _role_signals

DATA_DIR = Path(__file__).parent / "data"
OUTPUT_PATH = DATA_DIR / "stat_shares.json"

# Minimum stock items carrying a (role, stat) before we trust its share.
# Set high enough to drop cross-role noise (e.g. a handful of hybrid items
# putting Attack Power on a "caster") and rare legacy stats.
MIN_SAMPLES = 40

# Stock gear query: obtainable, non-set, non-effect epics + rares, weapons and
# armor. Mirrors budget_analyzer's obtainability filter (drop/vendor/quest) so
# GM/test items don't pollute the ratios.
REFERENCE_SQL = """
SELECT it.entry, it.class,
       it.stat_type1, it.stat_value1, it.stat_type2, it.stat_value2,
       it.stat_type3, it.stat_value3, it.stat_type4, it.stat_value4,
       it.stat_type5, it.stat_value5, it.stat_type6, it.stat_value6,
       it.stat_type7, it.stat_value7, it.stat_type8, it.stat_value8,
       it.stat_type9, it.stat_value9, it.stat_type10, it.stat_value10
FROM item_template it
WHERE it.Quality IN (3, 4) AND it.stat_type1 > 0
  AND it.entry < 56900 AND it.ItemSet = 0
  AND it.spellid_1 = 0 AND it.spellid_2 = 0 AND it.spellid_3 = 0
  AND it.class IN (2, 4)
  AND it.ItemLevel BETWEEN 40 AND 284
  AND (
    EXISTS (SELECT 1 FROM creature_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM gameobject_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM reference_loot_template WHERE Item = it.entry)
    OR EXISTS (SELECT 1 FROM npc_vendor WHERE item = it.entry)
    OR EXISTS (SELECT 1 FROM quest_template
               WHERE RewardItem1 = it.entry OR RewardItem2 = it.entry
                  OR RewardItem3 = it.entry OR RewardItem4 = it.entry
                  OR RewardChoiceItemID1 = it.entry OR RewardChoiceItemID2 = it.entry)
  )
"""

# Reverse stat-id -> label for readable JSON comments.
_STAT_LABEL = {
    3: "agility", 4: "strength", 5: "intellect", 6: "spirit", 7: "stamina",
    12: "defense", 13: "dodge", 14: "parry", 15: "block_rating",
    31: "hit", 32: "crit", 35: "resilience", 36: "haste", 37: "expertise",
    38: "attack_power", 39: "ranged_attack_power", 43: "mp5",
    44: "armor_pen", 45: "spell_power", 46: "hp5", 47: "spell_pen", 48: "block_value",
}


def _row_stats(row) -> Dict[int, int]:
    """Pull the {stat_id: value} map from a result row (cols 2..21)."""
    has: Dict[int, int] = {}
    for i in range(10):
        sid = int(row[2 + i * 2] or 0)
        val = int(row[3 + i * 2] or 0)
        if sid > 0 and val != 0:
            has[sid] = has.get(sid, 0) + val
    return has


def _role_of(has: Dict[int, int]):
    """Map an item's stat signature to one role token, or None.

    Priority tank > healer > caster > melee so multi-signal items (e.g. a
    healer plate piece reading as both healer and caster) land in one bucket.
    """
    is_tank, is_healer, is_caster, is_dps = _role_signals(has)
    if is_tank:
        return "tank"
    if is_healer:
        return "healer"
    if is_caster:
        return "caster"
    if is_dps:
        return "melee"
    return None


def analyze(verbose: bool = True) -> Dict[str, Dict[str, Dict[str, float]]]:
    """Return {role: {slot_type: {stat_id_str: stat_share}}} from stock gear.

    Shares are split by slot_type ("weapon" = item_class 2, "armor" =
    item_class 4) as well as role: stock caster *weapons* concentrate ~60% of
    budget into Spell Power, while caster *armor* spreads it more — a single
    pooled profile under-concentrates SP on weapons.
    """
    # (role, slot_type) -> stat_id -> list of per-item conditional shares
    shares: Dict = {}
    counts: Dict = {}

    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute(REFERENCE_SQL)
        for row in cursor.fetchall():
            has = _row_stats(row)
            if not has:
                continue
            role = _role_of(has)
            if role is None:
                continue
            slot_type = "weapon" if int(row[1]) == 2 else "armor"
            weighted = {sid: val * STAT_WEIGHT.get(sid, 1.0) for sid, val in has.items()}
            total = sum(weighted.values())
            if total <= 0:
                continue
            key = (role, slot_type)
            counts[key] = counts.get(key, 0) + 1
            bucket = shares.setdefault(key, {})
            for sid, w in weighted.items():
                bucket.setdefault(sid, []).append(w / total)
    finally:
        conn.close()

    out: Dict[str, Dict[str, Dict[str, float]]] = {}
    for (role, slot_type), statmap in sorted(shares.items()):
        means = {
            sid: statistics.mean(vals)
            for sid, vals in statmap.items()
            if len(vals) >= MIN_SAMPLES and sid in _STAT_LABEL
        }
        if not means:
            continue
        # Normalise so the median share is 1.0 (scale is irrelevant to the
        # allocator, this is purely for human-readable JSON).
        med = statistics.median(means.values())
        if med <= 0:
            med = 1.0
        out.setdefault(role, {})[slot_type] = {
            str(sid): round(m / med, 3)
            for sid, m in sorted(means.items(), key=lambda kv: -kv[1])
        }
        if verbose:
            n = counts.get((role, slot_type), 0)
            print(f"{role:8s} / {slot_type:6s} (n={n}):")
            for sid, m in sorted(means.items(), key=lambda kv: -kv[1]):
                label = _STAT_LABEL.get(sid, str(sid))
                print(f"    {label:18s} share={m/med:5.2f}  (avg budget {m:5.1%}, n={len(statmap[sid])})")
    return out


def run(verbose: bool = True) -> Path:
    """Analyze stock gear and write data/stat_shares.json."""
    shares = analyze(verbose=verbose)
    payload = {
        "_comment": (
            "Per-(role, slot_type) stat BUDGET SHARES for F-013 (derived from "
            "stock gear by `zep world item analyze-stat-shares`, "
            "stat_share_analyzer.py). Keyed [role][slot_type] where slot_type "
            "is 'weapon' (item_class 2) or 'armor' (item_class 4) — caster "
            "weapons concentrate SP harder than caster armor. Share = relative "
            "portion of an item's stat budget a stat gets; the allocator "
            "(generator.distribute_stats) re-normalises across whichever stats "
            "an item rolls. NOT scaler.STAT_WEIGHT (the gem cost to convert "
            "budget->value). Unlisted stats default to 1.0."
        ),
        "shares": shares,
    }
    OUTPUT_PATH.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    return OUTPUT_PATH
