"""F-081 Expanded Disenchanting — white gear disenchant-flag generator.

Whites STAY white (quality 1): core patch 0033 lowers the server disenchant
quality gate to 1-4, and only items we flag with a DisenchantID qualify.
Each flagged item gets a single +1 class-relevant stat and (when it has no
stock flavor text) a "Disenchantable." description as the player-facing
signal, since the border color no longer changes.

Vendor-sold items are excluded entirely — an infinitely purchasable
disenchantable item is a gold->materials faucet. Exclusion is live
`npc_vendor` membership at generation time; previously-flagged items that
turn out to be vendor-sold are reverted to pure stock values directly
against the DB (stock base already has them clean, so rebuilds need no
revert SQL).

Discovery is a live query for white statless armor/weapons (Blizzard
test/dev items name-filtered). Classification routes each item to the
classes that would equip it via class_loadout.json (same source as
F-013/F-179), with the pre-40 leveling rule (mail also fits warrior/
paladin, leather also fits hunter/shaman) and death knights excluded.
The stat pick is seeded per entry from class_stats.json (primary stats
twice as likely as secondary), so regeneration is byte-identical.

Flagged items are no longer discoverable once statted, so claimed entries
persist in data/f081_whites_roster.json and are re-emitted every run.

Output is split per owning zpak so the I-244 apply-cascade keeps the flags
live when a zpak regenerates its item INSERTs:
  - stock entries           -> zpaks/zep-items/sql/zz_[F-081]_purge_whites.sql
  - goblin zone (84300-799) -> zpaks/zep-goblin-start/sql/zz_[I-243]_purge_whites.sql
Entries in an unmapped custom range are skipped with a warning — add the
range to CUSTOM_ZPAK_RANGES (and reserve it in Item Reservations.csv).

Re-run (then `zep world sql changed`) after adding white gear OR changing
vendor stock.
"""
from __future__ import annotations

import hashlib
import json
import random
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Tuple

from ..creature.common import get_db_connection

DATA_DIR = Path(__file__).parent / "data"
ROSTER_PATH = DATA_DIR / "f081_whites_roster.json"

DESCRIPTION = "Disenchantable."

STOCK_MAX_ENTRY = 56899  # below the custom reservation blocks

# Custom entry ranges -> owning zpak (see Item Reservations.csv). The file
# emitted into a custom zpak must sort AFTER its zz_[AUTO,*] item INSERTs so
# the I-244 cascade re-applies it on regen.
CUSTOM_ZPAK_RANGES = {
    "zep-goblin-start": [(84300, 84799)],
}

ZPAK_OUTPUT_FILES = {
    "zep-items": "zz_[F-081]_purge_whites.sql",
    "zep-goblin-start": "zz_[I-243]_purge_whites.sql",
}

# Weapon subclass -> loadout weapon token (inverse of matrix.WEAPON_TOKEN_CONFIG)
WEAPON_SUBCLASS_TOKEN = {
    0: "1h-axe", 1: "2h-axe", 2: "bow", 3: "gun", 4: "1h-mace",
    5: "2h-mace", 6: "polearm", 7: "1h-sword", 8: "2h-sword",
    10: "staff", 13: "fist", 15: "dagger", 16: "thrown",
    18: "crossbow", 19: "wand",
}

ARMOR_SUBCLASS_TYPE = {1: "cloth", 2: "leather", 3: "mail", 4: "plate"}

# White gear is exclusively leveling gear. Pre-40, plate classes wear mail
# and mail classes wear leather, so those classes are legitimate candidates
# for the lower armor tier too.
LEVELING_ARMOR_EXPANSION = {
    "mail": ("warrior", "paladin"),
    "leather": ("hunter", "shaman"),
}

# Death Knights start at 55 fully geared and never touch white leveling gear.
EXCLUDED_CLASSES = ("deathknight",)

STAT_NAMES = {
    3: "Agility", 4: "Strength", 5: "Intellect", 6: "Spirit", 7: "Stamina",
    12: "Defense", 13: "Dodge", 14: "Parry", 15: "Block Rating",
    31: "Hit", 32: "Crit", 35: "Resilience", 36: "Haste", 37: "Expertise",
    38: "Attack Power", 39: "Ranged Attack Power", 43: "Mp5",
    44: "Armor Pen", 45: "Spell Power", 46: "Hp5", 47: "Spell Pen",
    48: "Block Value",
}

DISCOVERY_SQL = """
SELECT entry, name, class, subclass, InventoryType FROM item_template
WHERE Quality = 1
  AND ((class = 2 AND subclass NOT IN (14, 20))
       OR (class = 4 AND subclass IN (1, 2, 3, 4, 6)))
  AND InventoryType NOT IN (0, 4, 18, 19)
  AND stat_value1 = 0 AND stat_value2 = 0 AND stat_value3 = 0
  AND stat_value4 = 0 AND stat_value5 = 0 AND stat_value6 = 0
  AND stat_value7 = 0 AND stat_value8 = 0 AND stat_value9 = 0
  AND stat_value10 = 0
  AND entry NOT IN (SELECT DISTINCT item FROM npc_vendor)
  AND name NOT LIKE '[PH]%' AND name NOT LIKE 'Test %'
  AND name NOT LIKE '%(test)%' AND name NOT LIKE 'Monster %'
  AND name NOT LIKE '%Deprecated%' AND name NOT LIKE 'OLD%'
  AND name NOT LIKE '%QA %' AND name NOT LIKE '90 Epic%'
  AND name NOT LIKE 'PVP %' AND name NOT LIKE 'CRobinson%'
"""

# Restores the five columns the old (quality-bump) F-081 modified; stock
# base is already clean so rebuilds never need this.
VENDOR_REVERT_SQL = (
    "UPDATE `item_template` SET `Quality` = 1, `stat_type1` = 0,"
    " `stat_value1` = 0, `DisenchantID` = 0, `RequiredDisenchantSkill` = -1"
    " WHERE `entry` IN ({ids})"
)


def _load_json(name: str) -> dict:
    with open(DATA_DIR / name) as f:
        return json.load(f)


def _item_rng(entry: int) -> random.Random:
    h = hashlib.sha256(f"f081:{entry}".encode()).digest()
    return random.Random(int.from_bytes(h[:8], "big"))


def _zpak_for_entry(entry: int) -> str | None:
    if entry <= STOCK_MAX_ENTRY:
        return "zep-items"
    for zpak, ranges in CUSTOM_ZPAK_RANGES.items():
        if any(lo <= entry <= hi for lo, hi in ranges):
            return zpak
    return None


def _candidate_cells(item_class: int, subclass: int, inv_type: int,
                     loadouts: dict) -> List[Tuple[str, str]]:
    """Return (class, role) cells whose loadout would equip this item."""
    cells: List[Tuple[str, str]] = []

    def add_weapon_token(token: str):
        for cname, roles in loadouts.items():
            if cname in EXCLUDED_CLASSES:
                continue
            for role, spec in roles.items():
                if token in spec.get("weapons", ()):
                    cells.append((cname, role))

    if item_class == 4 and (subclass == 6 or inv_type == 14):
        add_weapon_token("shield")
    elif item_class == 4 and inv_type == 23:
        add_weapon_token("held")
    elif item_class == 2:
        token = WEAPON_SUBCLASS_TOKEN.get(subclass)
        if token:
            add_weapon_token(token)
    elif item_class == 4 and subclass in ARMOR_SUBCLASS_TYPE:
        atype = ARMOR_SUBCLASS_TYPE[subclass]
        extra = LEVELING_ARMOR_EXPANSION.get(atype, ())
        for cname, roles in loadouts.items():
            if cname in EXCLUDED_CLASSES:
                continue
            for role, spec in roles.items():
                if spec.get("armor_type") == atype or cname in extra:
                    cells.append((cname, role))
    return cells


def _pick_stat(entry: int, cells: List[Tuple[str, str]],
               class_stats: dict) -> Tuple[int, str, str]:
    """Seeded pick: class first, then role, then a stat from that
    (class, role) pool. Primary stats are twice as likely as secondary.
    Returns (stat_id, class_name, role)."""
    rng = _item_rng(entry)
    if not cells:
        return 7, "fallback", "-"  # Stamina — universally sensible
    classes = sorted({c for c, _ in cells})
    cname = rng.choice(classes)
    roles = sorted({r for c, r in cells if c == cname})
    role = rng.choice(roles)
    pool = class_stats[cname][role]
    weighted = list(pool["primary"]) * 2 + list(pool["secondary"])
    return rng.choice(weighted), cname, role


def load_roster() -> Dict[str, List[int]]:
    if ROSTER_PATH.exists():
        with open(ROSTER_PATH) as f:
            return {k: list(v) for k, v in json.load(f).items()}
    return {}


def save_roster(roster: Dict[str, List[int]]):
    with open(ROSTER_PATH, "w") as f:
        json.dump({k: sorted(set(v)) for k, v in sorted(roster.items())},
                  f, indent=1)
        f.write("\n")


def run(craft_root: Path, dry_run: bool = False):
    """Discover, classify, and emit the per-zpak disenchant-flag SQL.

    Returns (written_paths, summary) where summary maps stat name -> count
    and carries discovery/skip/revert counts under reserved keys.
    """
    raw = _load_json("class_loadout.json")
    loadouts = {k: v for k, v in raw.items() if not k.startswith("_")}
    class_stats = {k: v for k, v in _load_json("class_stats.json").items()
                   if not k.startswith("_")}

    roster = load_roster()
    claimed = {e for entries in roster.values() for e in entries}

    conn = get_db_connection()
    try:
        cur = conn.cursor()
        cur.execute("SELECT DISTINCT item FROM npc_vendor")
        vendor_items = {r[0] for r in cur.fetchall()}

        cur.execute(DISCOVERY_SQL)
        discovered = cur.fetchall()

        skipped_unmapped = []
        new_count = 0
        for entry, name, *_ in discovered:
            if entry in claimed:
                continue
            zpak = _zpak_for_entry(entry)
            if zpak is None:
                skipped_unmapped.append((entry, name))
                continue
            roster.setdefault(zpak, []).append(entry)
            claimed.add(entry)
            new_count += 1

        # Vendor-sold entries leave the roster and revert to stock values.
        reverted = sorted(claimed & vendor_items)
        if reverted:
            roster = {z: [e for e in entries if e not in vendor_items]
                      for z, entries in roster.items()}
            claimed -= vendor_items
            if not dry_run:
                cur.execute(VENDOR_REVERT_SQL.format(
                    ids=",".join(map(str, reverted))))
                conn.commit()

        # Fetch classification attributes + flavor text for the roster
        # (attributes are stable across flagging; the roster survives it).
        all_entries = sorted(claimed)
        attrs: Dict[int, Tuple[int, int, int]] = {}
        flavored: set = set()
        for i in range(0, len(all_entries), 1000):
            chunk = all_entries[i:i + 1000]
            cur.execute(
                "SELECT entry, class, subclass, InventoryType, description"
                " FROM item_template"
                f" WHERE entry IN ({','.join(map(str, chunk))})")
            for entry, ic, sc, iv, desc in cur.fetchall():
                attrs[entry] = (ic, sc, iv)
                if desc and desc != DESCRIPTION:
                    flavored.add(entry)  # keep stock flavor text
    finally:
        conn.close()

    # Assign stats: zpak -> stat_id -> [entries]
    plan: Dict[str, Dict[int, List[int]]] = defaultdict(lambda: defaultdict(list))
    summary: Dict[str, int] = defaultdict(int)
    missing = [e for entries in roster.values() for e in entries
               if e not in attrs]
    for zpak, entries in roster.items():
        for entry in sorted(entries):
            if entry not in attrs:
                continue  # roster entry no longer in item_template
            ic, sc, iv = attrs[entry]
            cells = _candidate_cells(ic, sc, iv, loadouts)
            stat_id, _, _ = _pick_stat(entry, cells, class_stats)
            plan[zpak][stat_id].append(entry)
            summary[STAT_NAMES.get(stat_id, str(stat_id))] += 1

    written = []
    for zpak, filename in ZPAK_OUTPUT_FILES.items():
        if zpak not in plan:
            continue
        out_path = craft_root / "zpaks" / zpak / "sql" / filename
        lines = [
            "-- F-081 Expanded Disenchanting: flag non-vendor white statless",
            "-- armor/weapons as disenchantable. Items STAY white (core patch 0033",
            "-- lowers the disenchant quality gate to 1-4); the +1 stat and the",
            "-- 'Disenchantable.' description are the player-facing signal.",
            "-- Vendor-sold items are excluded (gold->mats faucet).",
            "-- AUTO-GENERATED by `zep world item purge-whites` — do NOT hand-edit.",
            "",
        ]
        desc_entries = []
        for stat_id in sorted(plan[zpak]):
            entries = plan[zpak][stat_id]
            desc_entries.extend(e for e in entries if e not in flavored)
            lines.append(f"-- +1 {STAT_NAMES.get(stat_id, stat_id)} ({len(entries)} items)")
            id_list = ", ".join(str(e) for e in entries)
            lines.append(
                "UPDATE `item_template` SET `Quality` = 1,"
                f" `stat_type1` = {stat_id}, `stat_value1` = 1,"
                " `DisenchantID` = 21, `RequiredDisenchantSkill` = 1"
                f" WHERE `entry` IN ({id_list});")
            lines.append("")
        if desc_entries:
            lines.append(f"-- Signal description (skips {sum(1 for es in plan[zpak].values() for e in es if e in flavored)} items with stock flavor text)")
            lines.append(
                f"UPDATE `item_template` SET `description` = '{DESCRIPTION}'"
                f" WHERE `entry` IN ({', '.join(str(e) for e in sorted(desc_entries))});")
            lines.append("")
        if not dry_run:
            out_path.write_text("\n".join(lines), encoding="utf-8")
        written.append(out_path)

    if not dry_run:
        save_roster(roster)

    summary["_discovered_new"] = new_count
    summary["_total"] = sum(v for k, v in summary.items() if not k.startswith("_"))
    summary["_skipped_unmapped"] = skipped_unmapped
    summary["_missing_from_db"] = missing
    summary["_vendor_reverted"] = reverted
    return written, summary
