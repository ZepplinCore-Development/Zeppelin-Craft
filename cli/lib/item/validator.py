"""F-013 validation tool — generated items vs stock raid-loot cohorts.

Objective, repeatable check that generated heroic/mythic items match the
itemization of real raid loot at the same power band. Replaces ad-hoc
single-item spot checks (which kept mixing anchors — e.g. comparing an
ilvl-75 stock wand against ilvl-76 generated gear) with cohort medians:

    azeroth  heroic (il66)  vs Molten Core        (map 409)
    azeroth  mythic (il76)  vs Blackwing Lair     (map 469)
    outland  heroic         vs Karazhan/Gruul/Mag (532/565/544)
    outland  mythic         vs SSC/TK             (548/550)
    northrend heroic        vs Naxx/OS/EoE        (533/615/616)
    northrend mythic        vs Ulduar             (603)

Per (tier, difficulty) the report compares, bucketed by weapon family
(role-split) and armor slot:
  * weapon DPS                 (median, generated vs stock)
  * TOTAL budget               (weighted stats + DPS*5)
  * stat budget                (weighted stats only)
  * per-role stat distribution (mean budget share per stat)

Budget comparisons window the stock cohort to generated-median-ilvl +/- 9
so cross-ilvl skew can't hide in the medians (both cohort median ilvls are
printed). Stat-share comparisons use the full raid cohort (shares are
scale-free). Stock exclusions mirror budget_analyzer methodology: set items
(set bonus carries hidden budget) and spell-effect items are dropped, with
counts logged.

Verdicts: OK <= 15% delta, WARN <= 30%, FAIL beyond. Shares: OK <= 8 pts,
WARN <= 15. n < MIN_COHORT on either side reports "n/a (thin cohort)".

Run with `zep world item validate [--tier X] [--out FILE]`; writes a
plain-text report (default reports/item_validation.log) for review.
"""

import statistics
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from ..creature.common import get_db_connection
from .role_classifier import _role_signals
from .scaler import DPS_BUDGET_WEIGHT, STAT_WEIGHT, SUBCLASS_FAMILY
from .reservations import RESERVATIONS, range_for

CRAFT_ROOT = Path(__file__).resolve().parents[3]
DEFAULT_OUT = CRAFT_ROOT / "reports" / "item_validation.log"

REFERENCE_RAIDS = {
    ("azeroth", "heroic"):   {"label": "Molten Core",              "maps": (409,)},
    ("azeroth", "mythic"):   {"label": "Blackwing Lair",           "maps": (469,)},
    ("outland", "heroic"):   {"label": "Karazhan/Gruul/Magtheridon", "maps": (532, 565, 544)},
    ("outland", "mythic"):   {"label": "SSC/Tempest Keep",         "maps": (548, 550)},
    ("northrend", "heroic"): {"label": "Naxxramas/OS/EoE",         "maps": (533, 615, 616)},
    ("northrend", "mythic"): {"label": "Ulduar",                   "maps": (603,)},
}

ILVL_WINDOW = 9      # stock budget cohort = generated median ilvl +/- this
MIN_COHORT = 4       # below this on either side, skip the verdict

# Verdict thresholds
BUDGET_OK, BUDGET_WARN = 0.15, 0.30   # relative delta
SHARE_OK, SHARE_WARN = 8.0, 15.0      # percentage points

STAT_LABEL = {
    3: "Agi", 4: "Str", 5: "Int", 6: "Spirit", 7: "Stam",
    12: "Def", 13: "Dodge", 14: "Parry", 15: "BlockR",
    31: "Hit", 32: "Crit", 35: "Resil", 36: "Haste", 37: "Exp",
    38: "AP", 39: "RAP", 43: "Mp5", 44: "ArP", 45: "SP",
    46: "Hp5", 47: "SpPen", 48: "BlockV",
}

ARMOR_SLOT_NAME = {
    1: "head", 3: "shoulders", 5: "chest", 20: "chest", 6: "waist",
    7: "legs", 8: "feet", 9: "wrists", 10: "hands", 14: "shield",
    23: "held", 2: "accessory", 11: "accessory", 12: "accessory",
    16: "accessory",
}

_ITEM_COLS = (
    "entry, name, class, subclass, InventoryType, ItemLevel, "
    "dmg_min1, dmg_max1, delay, "
    "stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, "
    "stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, "
    "stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, "
    "stat_type10, stat_value10"
)

STOCK_SQL = f"""
SELECT DISTINCT {_ITEM_COLS}, ItemSet,
       (spellid_1 <> 0 OR spellid_2 <> 0 OR spellid_3 <> 0
        OR spellid_4 <> 0 OR spellid_5 <> 0) AS has_effect
FROM item_template
WHERE entry IN (
    SELECT IF(clt.Reference > 0, rlt.Item, clt.Item)
    FROM creature c
    JOIN creature_template ct ON ct.entry = c.id1
    JOIN creature_loot_template clt ON clt.Entry = ct.lootid
    LEFT JOIN reference_loot_template rlt ON rlt.Entry = clt.Reference
    WHERE c.map IN ({{maps}})
)
AND Quality = 4 AND class IN (2, 4) AND InventoryType NOT IN (28, 0)
AND entry < 56900
"""

GENERATED_SQL = f"""
SELECT {_ITEM_COLS}, 0 AS ItemSet,
       (spellid_1 <> 0 OR spellid_2 <> 0 OR spellid_3 <> 0
        OR spellid_4 <> 0 OR spellid_5 <> 0) AS has_effect
FROM item_template
WHERE entry BETWEEN {{lo}} AND {{hi}}
AND class IN (2, 4) AND InventoryType NOT IN (28, 0)
"""


class Item:
    __slots__ = ("entry", "name", "item_class", "subclass", "iv", "ilvl",
                 "dps", "stats", "stat_wt", "total", "role")

    def __init__(self, row):
        self.entry = int(row[0])
        self.name = row[1]
        self.item_class = int(row[2])
        self.subclass = int(row[3])
        self.iv = int(row[4])
        self.ilvl = int(row[5])
        dmin, dmax, delay = int(row[6] or 0), int(row[7] or 0), int(row[8] or 0)
        self.dps = (dmin + dmax) / 2.0 / (delay / 1000.0) if (dmin and delay) else 0.0
        self.stats: Dict[int, int] = {}
        for i in range(10):
            s, v = int(row[9 + i * 2] or 0), int(row[10 + i * 2] or 0)
            if s > 0 and v:
                self.stats[s] = self.stats.get(s, 0) + v
        self.stat_wt = sum(v * STAT_WEIGHT.get(s, 1.0) for s, v in self.stats.items())
        self.total = self.stat_wt + (self.dps * DPS_BUDGET_WEIGHT if self.item_class == 2 else 0.0)
        is_tank, is_healer, is_caster, is_dps = _role_signals(self.stats)
        self.role = ("tank" if is_tank else "healer" if is_healer
                     else "caster" if is_caster else "melee" if is_dps else None)

    @property
    def bucket(self) -> Optional[str]:
        if self.item_class == 2:
            caster = self.role in ("caster", "healer")
            routes = SUBCLASS_FAMILY.get(self.subclass) or {}
            fam = routes.get("caster" if caster else "physical") or next(iter(routes.values()), None)
            if fam is None:
                return None
            if fam in ("1h_melee", "2h_melee", "dagger"):
                return f"weapon {fam}/{'caster' if caster else 'phys'}"
            return f"weapon {fam}"
        name = ARMOR_SLOT_NAME.get(self.iv)
        return f"armor {name}" if name else None


def _fetch(sql: str) -> List[Item]:
    conn = get_db_connection()
    try:
        cur = conn.cursor()
        cur.execute(sql)
        return [(row, Item(row)) for row in cur.fetchall()]
    finally:
        conn.close()


def _load_cohorts(tier: str, difficulty: str):
    """Return (generated_items, stock_items, excluded_counts)."""
    lo, hi = range_for(tier, difficulty)
    gen = [it for _, it in _fetch(GENERATED_SQL.format(lo=lo, hi=hi))]

    maps = ", ".join(str(m) for m in REFERENCE_RAIDS[(tier, difficulty)]["maps"])
    raw = _fetch(STOCK_SQL.format(maps=maps))
    # Exclude set items (set bonus hides budget) and ANY spell effect
    # (slots 1-5 — proc/use/equip effects carry budget the stats don't show).
    # Stat hybrids (e.g. Str+Int paladin pieces) stay in: every stat counts
    # toward budget, and generation-side stat *selection* is governed by the
    # class-role loadout, not by these cohorts.
    stock, excl_set, excl_fx = [], 0, 0
    for row, it in raw:
        if int(row[-2] or 0) != 0:      # ItemSet
            excl_set += 1
            continue
        if int(row[-1] or 0) != 0:      # has_effect (any of spellid_1..5)
            excl_fx += 1
            continue
        stock.append(it)
    return gen, stock, {"set": excl_set, "effect": excl_fx, "raw": len(raw)}


def _median(vals: List[float]) -> Optional[float]:
    return statistics.median(vals) if vals else None


def _verdict_budget(gen: Optional[float], stock: Optional[float]) -> str:
    if not gen or not stock:
        return "n/a"
    d = abs(gen - stock) / stock
    return "OK" if d <= BUDGET_OK else "WARN" if d <= BUDGET_WARN else "FAIL"


def _fmt(v: Optional[float], width: int = 6) -> str:
    return f"{v:{width}.0f}" if v is not None else " " * (width - 3) + "—  "


def _example(items: List[Item]) -> Optional[Item]:
    """Deterministic sample: the item closest to the cohort's median stat
    budget — picked by rule, not by hand, so examples can't be cherry-picked
    to flatter the generator."""
    if not items:
        return None
    med = statistics.median([i.stat_wt for i in items])
    return min(items, key=lambda i: (abs(i.stat_wt - med), i.entry))


def _fmt_item(it: Item) -> str:
    stats = ", ".join(f"{STAT_LABEL.get(s, s)} {v}" for s, v in
                      sorted(it.stats.items(), key=lambda kv: -kv[1] * STAT_WEIGHT.get(kv[0], 1.0)))
    dps = f" dps {it.dps:.0f}" if it.dps else ""
    return f"{it.name} (il{it.ilvl}{dps}) — {stats or 'no stats'}"


def _compare_buckets(gen: List[Item], stock: List[Item], gen_ilvl: int, lines: List[str]) -> Dict[str, int]:
    counts = {"OK": 0, "WARN": 0, "FAIL": 0}
    lo, hi = gen_ilvl - ILVL_WINDOW, gen_ilvl + ILVL_WINDOW
    stock_w = [it for it in stock if lo <= it.ilvl <= hi]
    examples: List[str] = []

    buckets = sorted({it.bucket for it in gen if it.bucket}
                     | {it.bucket for it in stock_w if it.bucket})
    lines.append(f"  {'bucket':26s} {'nG':>3} {'nS':>3} | {'ilvlG':>5} {'ilvlS':>5} | "
                 f"{'dpsG':>5} {'dpsS':>5} | {'statG':>6} {'statS':>6} | {'totG':>6} {'totS':>6} | verdict")
    lines.append("  " + "-" * 110)
    for b in buckets:
        g = [it for it in gen if it.bucket == b]
        s = [it for it in stock_w if it.bucket == b]
        if not g:
            continue
        g_stat, s_stat = _median([i.stat_wt for i in g]), _median([i.stat_wt for i in s])
        g_tot, s_tot = _median([i.total for i in g]), _median([i.total for i in s])
        g_dps = _median([i.dps for i in g if i.dps]) if b.startswith("weapon") else None
        s_dps = _median([i.dps for i in s if i.dps]) if b.startswith("weapon") else None
        if len(g) < MIN_COHORT or len(s) < MIN_COHORT:
            verdict = "n/a (thin cohort)"
        else:
            verdict = _verdict_budget(g_stat, s_stat)
            dv = _verdict_budget(g_dps, s_dps) if g_dps else "OK"
            if b.startswith("weapon"):
                # DPS drift dominates the verdict for weapons
                order = {"OK": 0, "WARN": 1, "FAIL": 2, "n/a": 0}
                verdict = max(verdict, dv, key=lambda x: order.get(x, 0))
            counts[verdict] = counts.get(verdict, 0) + 1
        lines.append(f"  {b:26s} {len(g):>3} {len(s):>3} | "
                     f"{_fmt(_median([i.ilvl for i in g]), 5)} {_fmt(_median([i.ilvl for i in s]), 5)} | "
                     f"{_fmt(g_dps, 5)} {_fmt(s_dps, 5)} | "
                     f"{_fmt(g_stat)} {_fmt(s_stat)} | {_fmt(g_tot)} {_fmt(s_tot)} | {verdict}")
        # Role-match the example pair: pick the stock median item first, then
        # the generated example from the SAME role in this bucket — otherwise
        # armor slots (role-mixed buckets) can pair e.g. a melee G against a
        # caster S, which tells you nothing. Weapons buckets are role-split
        # already, so this is a no-op for them.
        es = _example(s)
        g_pool = [it for it in g if es and it.role == es.role] or g
        eg = _example(g_pool)
        if eg or es:
            role_tag = f" [{es.role}]" if es and es.role else ""
            examples.append(f"  {b}{role_tag}:")
            if eg:
                # Flag when the generated pick couldn't role-match the stock
                # example (no same-role item in the bucket) — don't let a
                # mismatched pair masquerade as a comparison.
                mismatch = (f" (no {es.role} match — showing {eg.role or 'unclassified'})"
                            if es and es.role and eg.role != es.role else "")
                examples.append(f"    G: {_fmt_item(eg)}{mismatch}")
            if es:
                examples.append(f"    S: {_fmt_item(es)}")

    lines.append("")
    lines.append("  examples — median-budget item per bucket (rule-picked, not hand-picked):")
    lines.extend(examples)
    return counts


def _compare_shares(gen: List[Item], stock: List[Item], lines: List[str]) -> Dict[str, int]:
    counts = {"OK": 0, "WARN": 0, "FAIL": 0}
    lines.append(f"  per-role stat distribution (mean % of weighted budget; full raid cohort)")
    for role in ("caster", "healer", "melee", "tank"):
        g = [it for it in gen if it.role == role and it.stat_wt > 0]
        s = [it for it in stock if it.role == role and it.stat_wt > 0]
        if len(g) < MIN_COHORT or len(s) < MIN_COHORT:
            lines.append(f"    {role:7s}: n/a (gen n={len(g)}, stock n={len(s)})")
            continue

        def mean_shares(items: List[Item]) -> Dict[int, Tuple[float, float]]:
            # Conditional on presence (mean share among items that HAVE the
            # stat — same methodology as stat_share_analyzer; whole-cohort
            # means would dilute primaries in mixed cohorts, e.g. Str split
            # across Agi-classes' items) + the presence rate itself.
            # Single-stat items are skipped: their share is 100% by
            # definition and says nothing about proportions (e.g. Crimson
            # Shocker's lone Int 10 skewing a 3-item cohort to "Int 54%").
            multi = [it for it in items if len(it.stats) >= 2]
            if not multi:
                return {}
            acc: Dict[int, List[float]] = {}
            for it in multi:
                for sid, val in it.stats.items():
                    acc.setdefault(sid, []).append(
                        (val * STAT_WEIGHT.get(sid, 1.0)) / it.stat_wt)
            return {sid: (100.0 * sum(v) / len(v), len(v) / len(multi))
                    for sid, v in acc.items()}

        gs, ss = mean_shares(g), mean_shares(s)
        sids = sorted(set(gs) | set(ss), key=lambda x: -(ss.get(x, (0, 0))[0]))
        cells = []
        worst = 0.0
        for sid in sids:
            gv, gp = gs.get(sid, (0.0, 0.0))
            sv, sp = ss.get(sid, (0.0, 0.0))
            if max(gp, sp) < 0.30:
                continue  # rare stat in both cohorts — noise, skip entirely
            # Verdict only on stats well-represented in BOTH cohorts (>=30%
            # presence); one-sided stats are shown but marked, not judged —
            # a couple of stock outliers shouldn't drive a FAIL.
            judged = gp >= 0.30 and sp >= 0.30
            if judged:
                worst = max(worst, abs(gv - sv))
            mark = "" if judged else "*"
            cells.append(f"{STAT_LABEL.get(sid, sid)} {gv:.0f}/{sv:.0f}{mark}")
        verdict = "OK" if worst <= SHARE_OK else "WARN" if worst <= SHARE_WARN else "FAIL"
        counts[verdict] += 1
        lines.append(f"    {role:7s} (nG={len(g)}, nS={len(s)}) [{verdict}, max Δ {worst:.0f}pt] "
                     f"(share when present; * = <30% presence in one cohort, not judged): "
                     + ", ".join(cells))
    return counts


def run(tiers: Optional[List[str]] = None, out_path: Optional[Path] = None) -> Tuple[Path, Dict[str, int]]:
    """Validate generated items vs stock raid cohorts; write the report."""
    out_path = Path(out_path) if out_path else DEFAULT_OUT
    tiers = tiers or sorted({t for t, _ in RESERVATIONS})
    totals = {"OK": 0, "WARN": 0, "FAIL": 0}
    lines: List[str] = ["F-013 item validation — generated vs stock raid cohorts", ""]

    for tier in tiers:
        for difficulty in ("heroic", "mythic"):
            ref = REFERENCE_RAIDS.get((tier, difficulty))
            if ref is None:
                continue
            gen, stock, excl = _load_cohorts(tier, difficulty)
            gen_ilvl = int(_median([i.ilvl for i in gen]) or 0)
            lines.append("=" * 112)
            lines.append(f"{tier} {difficulty} (generated il{gen_ilvl}, n={len(gen)})  vs  "
                         f"{ref['label']} (raw n={excl['raw']}, used n={len(stock)}; "
                         f"excluded {excl['set']} set items, {excl['effect']} spell-effect items)")
            lines.append(f"budget window: stock il {gen_ilvl - ILVL_WINDOW}-{gen_ilvl + ILVL_WINDOW}; "
                         f"G=generated S=stock; stat/tot = weighted budget (tot incl DPS*{DPS_BUDGET_WEIGHT:.0f})")
            lines.append("")
            for verdict, n in _compare_buckets(gen, stock, gen_ilvl, lines).items():
                totals[verdict] = totals.get(verdict, 0) + n
            lines.append("")
            for verdict, n in _compare_shares(gen, stock, lines).items():
                totals[verdict] = totals.get(verdict, 0) + n
            lines.append("")

    lines.append("=" * 112)
    lines.append(f"summary: {totals['OK']} OK, {totals['WARN']} WARN, {totals['FAIL']} FAIL")
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return out_path, totals
