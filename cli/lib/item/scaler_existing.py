"""F-179 Existing Item Scaler — clone stock BOP dungeon items into heroic
and mythic variants using the per-era piecewise budget engine.

Walks azeroth dungeon maps → creature spawns → creature_loot_template →
filters to BOP equippable weapons/armor (no sets, no proc effects, no
relics, no vanity). Each anchor is cloned twice (heroic ilvl 66, mythic
ilvl 76), pushed to Epic quality, stats rescaled to the new budget via
the role-bucket allowlist.

Entry IDs come from F179_RESERVATIONS — heroic anchors get IDs in
66300-67299, mythic in 67300-68299. Within each block, anchors are
assigned in ascending stock-entry order so the mapping is stable across
runs.

CLI: `zep world item scale-existing [--tier azeroth] [--difficulty heroic|mythic]
                                    [--seed N] [--quiet]`
"""
from __future__ import annotations

import hashlib
import json
import random
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from ..creature.common import get_db_connection
from ..loot.sectioned_file import (
    SECTION_F179_AZEROTH, SECTION_ORDER, FILE_HEADER, combined_path,
)
from ..sectioned_sql import write_section
from .role_classifier import (
    classify, stat_pool_for, INV_VANITY,
)
from .scaler import (
    compute_budget, compute_weapon_damage, compute_weapon_dps,
    compute_armor, distribute_stats, DPS_BUDGET_WEIGHT,
)

# Reservation ranges — mirror Scripts/Item Scripts/Item Reservations.csv
F179_RESERVATIONS: Dict[Tuple[str, str], Tuple[int, int]] = {
    ("azeroth",   "heroic"): (66300, 67299),
    ("azeroth",   "mythic"): (67300, 68299),
    ("outland",   "heroic"): (68300, 69299),
    ("outland",   "mythic"): (69300, 70299),
    ("northrend", "heroic"): (70300, 71299),
    ("northrend", "mythic"): (71300, 72299),
}

# Map IDs per tier — Azeroth from creatures_heroic.json.
AZEROTH_MAP_IDS = [33, 34, 36, 43, 47, 48, 70, 90, 109, 129,
                   189, 209, 229, 230, 289, 329, 349, 389, 429]
TIER_MAPS = {"azeroth": AZEROTH_MAP_IDS}  # outland/northrend added in future phases

# Target stat count per (tier, difficulty) — heroic is rare-bumped-to-epic
# with 4 stats, mythic is full epic with 5 stats.
STAT_COUNT_TARGET = {
    ("azeroth",   "heroic"): 4,
    ("azeroth",   "mythic"): 5,
    ("outland",   "heroic"): 4,
    ("outland",   "mythic"): 5,
    ("northrend", "heroic"): 5,
    ("northrend", "mythic"): 5,
}

TIER_ITEM_LEVEL = {
    ("azeroth",   "heroic"): 66,
    ("azeroth",   "mythic"): 76,
    ("outland",   "heroic"): 130,
    ("outland",   "mythic"): 146,
    ("northrend", "heroic"): 200,
    ("northrend", "mythic"): 232,
}

TIER_REQUIRED_LEVEL = {"azeroth": 60, "outland": 68, "northrend": 78}

OUTPUT_FILENAME_TEMPLATE = "zz_[AUTO,F-179]_{tier}_{difficulty}_scaled.sql"

# Column order matches F-013's preset for diff-friendliness.
COLUMN_ORDER = [
    "entry", "class", "subclass", "SoundOverrideSubclass", "name",
    "displayid", "Quality", "Flags", "InventoryType", "AllowableClass",
    "AllowableRace", "ItemLevel", "RequiredLevel",
    "bonding", "flagsCustom", "VerifiedBuild",
    "DisenchantID", "RequiredDisenchantSkill",
]
WEAPON_COLUMNS = ["dmg_min1", "dmg_max1", "delay"]
ARMOR_COLUMNS = ["armor", "block"]

# Disenchant tier mapping (same as F-013's get_disenchant).
DISENCHANT = {
    ("azeroth",   "heroic"): (65, 175),
    ("azeroth",   "mythic"): (65, 225),
    ("outland",   "heroic"): (66, 275),
    ("outland",   "mythic"): (66, 325),
    ("northrend", "heroic"): (68, 350),
    ("northrend", "mythic"): (68, 375),
}


ANCHOR_SQL_TEMPLATE = """
SELECT DISTINCT
  it.entry, it.name, it.class, it.subclass, it.InventoryType,
  it.ItemLevel, it.Quality, it.bonding, it.ItemSet, it.spellid_1,
  it.AllowableClass, it.AllowableRace, it.displayid, it.Flags,
  it.dmg_min1, it.dmg_max1, it.delay,
  it.stat_type1, it.stat_value1, it.stat_type2, it.stat_value2,
  it.stat_type3, it.stat_value3, it.stat_type4, it.stat_value4,
  it.stat_type5, it.stat_value5, it.stat_type6, it.stat_value6,
  it.stat_type7, it.stat_value7, it.stat_type8, it.stat_value8,
  it.stat_type9, it.stat_value9, it.stat_type10, it.stat_value10
FROM item_template it
JOIN creature_loot_template clt ON clt.Item = it.entry
JOIN creature_template ct ON ct.lootid = clt.Entry
JOIN creature c ON c.id1 = ct.entry
WHERE c.map IN ({maps})
  AND it.class IN (2, 4)
  AND it.entry < 56900
  AND it.bonding = 1
  AND it.ItemSet = 0
  AND it.spellid_1 = 0
  AND it.InventoryType NOT IN (4, 18)
ORDER BY it.entry
"""


def discover_anchors(tier: str) -> List[Dict]:
    """Pull in-scope F-179 anchors for the given tier. Returns ordered list
    of dicts (sorted by entry for stable ID assignment)."""
    map_ids = TIER_MAPS.get(tier)
    if not map_ids:
        raise ValueError(f"No map ID list for tier {tier!r}")
    sql = ANCHOR_SQL_TEMPLATE.format(maps=",".join(str(m) for m in map_ids))

    conn = get_db_connection()
    try:
        cur = conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
    finally:
        conn.close()

    # Dedup by entry, sorted ascending.
    seen = {}
    for r in rows:
        e = int(r[0])
        if e not in seen:
            seen[e] = r
    out = []
    for e in sorted(seen):
        r = seen[e]
        out.append({
            "entry": e,
            "name": r[1],
            "class": int(r[2]),
            "subclass": int(r[3]),
            "InventoryType": int(r[4]),
            "ItemLevel": int(r[5]),
            "Quality": int(r[6]),
            "bonding": int(r[7]),
            "AllowableClass": int(r[10]),
            "AllowableRace": int(r[11]),
            "displayid": int(r[12]),
            "Flags": int(r[13]),
            "dmg_min1": int(r[14]),
            "dmg_max1": int(r[15]),
            "delay": int(r[16]),
            "stats": [(int(r[17 + 2*i]), int(r[18 + 2*i])) for i in range(10)],
        })
    return out


def _role_for_bucket(bucket: str) -> str:
    """Map bucket → role token used by compute_weapon_dps ('physical' / 'caster' / 'healer').
    Only weapons consult this; armor doesn't need it."""
    if "CASTER" in bucket: return "caster"
    if "HEALER" in bucket: return "healer"
    return "physical"


def _pick_stat_ids(anchor: Dict, bucket: str, target_count: int, rng: random.Random) -> List[int]:
    """Build the stat-ID list for the scaled item:
       1. Keep every original stat ID that's in the bucket's allowlist
       2. Fill remaining slots from bucket primaries (not yet picked), then secondaries
       3. Cap at target_count
    """
    pool = stat_pool_for(bucket)
    allowed = set(pool["primary"]) | set(pool["secondary"])

    out: List[int] = []
    # Keep originals that fit the bucket's allowlist (preserves item identity).
    for stat_id, val in anchor["stats"]:
        if stat_id > 0 and stat_id in allowed and stat_id not in out:
            out.append(stat_id)
            if len(out) >= target_count:
                return out[:target_count]

    # Add primaries the original didn't have.
    for sid in pool["primary"]:
        if sid not in out:
            out.append(sid)
            if len(out) >= target_count:
                return out[:target_count]

    # Fill with secondaries (uniform sample without replacement, seeded).
    remaining_secs = [s for s in pool["secondary"] if s not in out]
    rng.shuffle(remaining_secs)
    for sid in remaining_secs:
        out.append(sid)
        if len(out) >= target_count:
            break
    return out[:target_count]


def _cell_rng(anchor_entry: int, tier: str, difficulty: str, base_seed: int) -> random.Random:
    """Deterministic RNG per anchor × tier × difficulty × seed."""
    key = f"{base_seed}:{tier}:{difficulty}:{anchor_entry}"
    h = hashlib.sha256(key.encode()).digest()
    return random.Random(int.from_bytes(h[:8], "big"))


def scale_anchor(anchor: Dict, tier: str, difficulty: str,
                 new_entry: int, base_seed: int) -> Tuple[Dict, str]:
    """Produce a scaled row dict + bucket for one anchor at the given
    tier/difficulty. Returns (row, bucket)."""
    item_level = TIER_ITEM_LEVEL[(tier, difficulty)]
    required_level = TIER_REQUIRED_LEVEL[tier]
    quality = 4  # all F-179 scaled items are Epic
    target_stat_count = STAT_COUNT_TARGET[(tier, difficulty)]

    bucket = classify(anchor["entry"], anchor["stats"],
                      anchor["class"], anchor["subclass"], anchor["InventoryType"])
    if bucket.startswith("SKIP") or bucket.startswith("FALLBACK"):
        raise ValueError(f"anchor {anchor['entry']} ({anchor['name']}): {bucket}")

    rng = _cell_rng(anchor["entry"], tier, difficulty, base_seed)

    # Stat budget — for weapons, subtract DPS×W since the weapon contributes
    # damage budget on top of stats. Per-era DPS curves committed in F-013 P7.
    total_budget = compute_budget(
        anchor["InventoryType"], item_level, quality, subclass=anchor["subclass"]
    )
    if anchor["class"] == 2:
        role = _role_for_bucket(bucket)
        wdps = compute_weapon_dps(anchor["class"], anchor["subclass"], item_level, role)
        if wdps is not None:
            stat_budget = max(0.0, total_budget - wdps * DPS_BUDGET_WEIGHT)
        else:
            stat_budget = total_budget
    else:
        stat_budget = total_budget

    stat_ids = _pick_stat_ids(anchor, bucket, target_stat_count, rng)
    stats = distribute_stats(stat_ids, stat_budget, rng)

    row = {
        "entry": new_entry,
        "class": anchor["class"],
        "subclass": anchor["subclass"],
        "SoundOverrideSubclass": -1,
        "name": anchor["name"],
        "displayid": anchor["displayid"],
        "Quality": quality,
        "Flags": anchor["Flags"],
        "InventoryType": anchor["InventoryType"],
        "AllowableClass": anchor["AllowableClass"],
        "AllowableRace": anchor["AllowableRace"],
        "ItemLevel": item_level,
        "RequiredLevel": required_level,
        "bonding": 1,  # BIND_ON_PICKUP
        "flagsCustom": 0,
        "VerifiedBuild": 0,
    }
    de_id, de_skill = DISENCHANT[(tier, difficulty)]
    row["DisenchantID"] = de_id
    row["RequiredDisenchantSkill"] = de_skill

    # Weapon-only: recompute damage/delay via per-era DPS curves.
    if anchor["class"] == 2:
        wd = compute_weapon_damage(anchor["class"], anchor["subclass"], item_level,
                                   _role_for_bucket(bucket))
        if wd is not None:
            row["dmg_min1"], row["dmg_max1"], row["delay"] = wd

    # Armor + shield block — for class=4 only.
    if anchor["class"] == 4:
        try:
            armor = compute_armor(anchor["class"], anchor["subclass"],
                                  anchor["InventoryType"], item_level)
        except Exception:
            armor = 0
        if armor and armor > 0:
            row["armor"] = armor

    # Stat slots.
    for i, (sid, val) in enumerate(stats, start=1):
        row[f"stat_type{i}"] = sid
        row[f"stat_value{i}"] = val
    # Remember how many slots are populated for the emitter — AC's
    # item_template has no StatsCount column in this build, but the row
    # formatter needs to know how many stat_type/value pairs to write.
    row["_stat_count"] = len(stats)

    return row, bucket


def _format_value(v) -> str:
    if isinstance(v, str):
        return "'" + v.replace("'", "''") + "'"
    return str(v)


def _format_row(row: Dict) -> str:
    """DELETE + INSERT SET, one variable per line — matches F-013 style."""
    entry = row["entry"]
    lines = [f"DELETE FROM `item_template` WHERE `entry` = {entry};",
             "INSERT INTO `item_template` SET"]
    var_lines = []
    for col in COLUMN_ORDER:
        if col in row:
            var_lines.append(f"  `{col}` = {_format_value(row[col])}")
    for col in WEAPON_COLUMNS:
        if col in row:
            var_lines.append(f"  `{col}` = {_format_value(row[col])}")
    for col in ARMOR_COLUMNS:
        if col in row:
            var_lines.append(f"  `{col}` = {_format_value(row[col])}")
    # Stat columns: only emit up to the count actually used.
    n = row.get("_stat_count", 0)
    for i in range(1, n + 1):
        var_lines.append(f"  `stat_type{i}` = {row[f'stat_type{i}']}")
        var_lines.append(f"  `stat_value{i}` = {row[f'stat_value{i}']}")
    lines.append(",\n".join(var_lines) + ";")
    return "\n".join(lines)


def _discover_clone_drops(anchor_entries: List[int], tier: str) -> Dict[int, List[Tuple[int, int]]]:
    """For each anchor entry, return the list of (heroic_clone_entry,
    mythic_clone_entry) tuples for stock creatures that drop it inside the
    tier's dungeon maps.

    F-074 sets `creature_template.difficulty_entry_1` = heroic clone entry
    and `difficulty_entry_2` = mythic clone entry on stock creature rows.
    Each clone's lootid = its own entry (F-074 convention), and F-074's
    INSERT SELECT FROM base_lootid copies the stock items onto the clone's
    loot table. Phase 4 UPDATEs that table in place — swapping stock Items
    with their scaled F-179 entries while preserving Chance/GroupId/etc.
    """
    if not anchor_entries:
        return {}
    in_anchors = ",".join(str(e) for e in anchor_entries)
    # No JOIN to `creature` (spawn table) — some bosses (e.g. SM Cathedral's
    # Scorn) are summoned dynamically and have no spawn row, but their
    # creature_template still has F-074 clones once added to
    # creatures_heroic.json. The difficulty_entry_1/2 > 0 filter implicitly
    # scopes to F-074-cloned creatures, which by definition are in our tier.
    sql = f"""
    SELECT DISTINCT
        clt.Item AS stock_anchor,
        ct.difficulty_entry_1 AS heroic_clone,
        ct.difficulty_entry_2 AS mythic_clone,
        ct.entry AS stock_creature,
        ct.name AS creature_name
    FROM creature_loot_template clt
    JOIN creature_template ct ON ct.lootid = clt.Entry
    WHERE clt.Item IN ({in_anchors})
      AND ct.difficulty_entry_1 > 0
      AND ct.difficulty_entry_2 > 0
    """
    conn = get_db_connection()
    try:
        cur = conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
    finally:
        conn.close()

    out: Dict[int, List[Tuple[int, int, int, str]]] = defaultdict(list)
    for r in rows:
        anchor = int(r[0])
        out[anchor].append((int(r[1]), int(r[2]), int(r[3]), str(r[4]) if r[4] else ""))
    return out


# Per-tier section name mapping (extend when outland/northrend land).
F179_TIER_SECTION = {
    "azeroth": SECTION_F179_AZEROTH,
}


def run_loot_wiring(craft_root: Path, tier: str, verbose: bool = True) -> Tuple[Path, int, int]:
    """Phase 4 — emit creature_loot_template UPDATE rows that swap each stock
    anchor for its F-179 scaled heroic/mythic version on the respective
    creature clones.

    Output goes into the F-179 section of the combined F-074+F-179 file
    (see `cli/lib/loot/sectioned_file.py`). F-074's section is preserved
    automatically. Whenever either section changes, the combined file's
    hash updates and `sql changed` re-applies the whole thing in the
    correct order — F-074 DELETE+INSERT first, F-179 UPDATEs second.

    Returns (output_path, heroic_update_count, mythic_update_count).
    """
    if tier not in TIER_MAPS:
        raise ValueError(f"No map list for tier {tier!r}")
    if tier not in F179_TIER_SECTION:
        raise ValueError(f"No section mapping for tier {tier!r} — extend "
                         f"F179_TIER_SECTION + sectioned_file.SECTION_ORDER")

    anchors = discover_anchors(tier)
    if not anchors:
        raise RuntimeError(f"No anchors discovered for tier {tier}")

    heroic_start, _ = F179_RESERVATIONS[(tier, "heroic")]
    mythic_start, _ = F179_RESERVATIONS[(tier, "mythic")]

    # Anchors are returned in stable order from discover_anchors (sorted by
    # stock entry). Build stock_entry -> (heroic_scaled, mythic_scaled).
    scaled_by_stock: Dict[int, Tuple[int, int]] = {}
    for idx, a in enumerate(anchors):
        # Skip relics — they'd raise SKIP-RELIC in Phase 2 and never get a
        # scaled entry written. Match the same bucket the scaler computed.
        try:
            b = classify(a["entry"], a["stats"], a["class"], a["subclass"], a["InventoryType"])
            if b.startswith("SKIP") or b.startswith("FALLBACK"):
                continue
        except Exception:
            continue
        scaled_by_stock[a["entry"]] = (heroic_start + idx, mythic_start + idx)

    drops = _discover_clone_drops(list(scaled_by_stock), tier)

    heroic_count = mythic_count = 0
    anchors_with_drops = 0
    body: List[str] = [
        f"-- F-179 loot wiring — tier: {tier}",
        f"-- Generated by `zep world item scale-existing --tier {tier}`",
        f"-- UPDATEs the rows F-074's section inserted; swap stock Item for",
        f"-- scaled F-179 entry while preserving Chance / GroupId / MinCount / MaxCount.",
        "",
    ]

    for stock_anchor in sorted(drops):
        if stock_anchor not in scaled_by_stock:
            continue
        anchors_with_drops += 1
        scaled_h, scaled_m = scaled_by_stock[stock_anchor]
        name = next((a["name"] for a in anchors if a["entry"] == stock_anchor), "?")
        body.append(f"-- {name} (stock {stock_anchor}) → heroic {scaled_h} / mythic {scaled_m}")
        seen_pairs = set()
        for hc, mc, stock_creature, cname in drops[stock_anchor]:
            pair = (hc, mc)
            if pair in seen_pairs:
                continue
            seen_pairs.add(pair)
            body.append(
                f"UPDATE `creature_loot_template` SET `Item` = {scaled_h} "
                f"WHERE `Entry` = {hc} AND `Item` = {stock_anchor};"
            )
            body.append(
                f"UPDATE `creature_loot_template` SET `Item` = {scaled_m} "
                f"WHERE `Entry` = {mc} AND `Item` = {stock_anchor};"
            )
            heroic_count += 1
            mythic_count += 1
        body.append("")

    summary = [
        f"-- Anchors with clone drops wired: {anchors_with_drops} / {len(scaled_by_stock)} scaled",
        f"-- UPDATE statements emitted: heroic={heroic_count}, mythic={mythic_count}",
        "",
    ]
    body = body[:5] + summary + body[5:]

    out_path = combined_path(craft_root)
    write_section(
        out_path, F179_TIER_SECTION[tier], "\n".join(body),
        section_order=SECTION_ORDER, file_header=FILE_HEADER,
    )
    if verbose:
        print(f"  [{tier} loot wiring] {anchors_with_drops} anchors → "
              f"{heroic_count} heroic + {mythic_count} mythic UPDATEs → "
              f"{out_path.name} ({F179_TIER_SECTION[tier]} section)")
    return out_path, heroic_count, mythic_count


def run(craft_root: Path, tier: str, difficulty: str, seed: int = 0,
        verbose: bool = True) -> Tuple[Path, int]:
    """Generate the scaled-item SQL file for one (tier, difficulty). Returns
    (output_path, item_count)."""
    if (tier, difficulty) not in F179_RESERVATIONS:
        raise ValueError(f"No F-179 reservation for ({tier!r}, {difficulty!r})")

    res_start, res_end = F179_RESERVATIONS[(tier, difficulty)]
    anchors = discover_anchors(tier)
    if len(anchors) > (res_end - res_start + 1):
        raise RuntimeError(
            f"{tier}/{difficulty}: {len(anchors)} anchors overflow reservation "
            f"{res_start}-{res_end} ({res_end - res_start + 1} IDs). "
            f"Expand the reservation."
        )

    out_dir = craft_root / "zpaks" / "zep-dungeons" / "sql"
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / OUTPUT_FILENAME_TEMPLATE.format(tier=tier, difficulty=difficulty)

    bucket_counts: Dict[str, int] = defaultdict(int)
    sql_blocks: List[str] = []
    skipped_relic = 0
    skipped_other = 0

    for idx, anchor in enumerate(anchors):
        new_entry = res_start + idx
        try:
            row, bucket = scale_anchor(anchor, tier, difficulty, new_entry, seed)
        except ValueError as e:
            msg = str(e)
            if "SKIP-RELIC" in msg:
                skipped_relic += 1
            else:
                skipped_other += 1
                if verbose:
                    print(f"  [{tier}/{difficulty}] SKIP entry {anchor['entry']}: {e}")
            continue
        bucket_counts[bucket] += 1
        sql_blocks.append(_format_row(row))
        if verbose:
            print(f"  [{tier}/{difficulty}] {new_entry} {anchor['name']} "
                  f"← anchor {anchor['entry']} ({bucket})")

    # File header.
    header = [
        f"-- F-179 Existing Item Scaler: {tier} {difficulty}",
        f"-- AUTO-generated by `zep world item scale-existing` (F-179). DO NOT EDIT.",
        f"-- Anchors discovered: {len(anchors)}  scaled: {len(sql_blocks)}  "
        f"skipped (relic, F-013 P6): {skipped_relic}  other skips: {skipped_other}",
        f"-- Reservation: {res_start}-{res_end} ({res_end - res_start + 1} IDs)",
        f"-- Buckets: " + ", ".join(f"{b}:{n}" for b, n in sorted(bucket_counts.items(), key=lambda x: -x[1])),
        "",
    ]
    out_path.write_text("\n".join(header) + "\n\n".join(sql_blocks) + "\n")
    return out_path, len(sql_blocks)
