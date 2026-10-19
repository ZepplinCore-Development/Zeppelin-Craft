"""F-067 Fatter Stacks — by-entry stack size generator.

The original F-067 applied blanket by-VALUE rules:

    UPDATE item_template SET stackable = 1000 WHERE stackable = 100;
    UPDATE item_template SET stackable = 200  WHERE stackable = 20;
    UPDATE item_template SET stackable = 100  WHERE stackable = 10;
    UPDATE item_template SET stackable = 50   WHERE stackable = 5;

Tier 100 is BOTH an input and an output, so those four statements are only
correct against stock data, applied exactly once. Re-running them on an
already-migrated database re-cascades the stack-10 tier up to 1000. That made
the file the single blocker for a universal downstream cascade, in which any
edit in a lower-priority zpak re-runs everything after it.

This generator resolves each rule against the STOCK item_template dump once and
emits explicit by-entry SQL, which is idempotent and safe to replay forever.

Sources, in precedence order (later wins):
  1. Blanket roster  — derived from the stock dump by TIER_RULES.
  2. Overrides       — hand-authored f067_stacks_overrides.json.

Re-run after an AzerothCore base-dump upgrade, or after editing the overrides:

    zep world item stack-sizes            # regenerate
    zep world item stack-sizes --dry-run  # report only
    zep world sql changed                 # apply

SCOPE NOTE — custom and module items are deliberately NOT blanket-bumped. Only
entries present in the stock dump are in the roster. Under the old by-value
rules whether a custom item got bumped depended on whether it happened to exist
the last time F-067 ran, so live state and a fresh rebuild already disagreed.
Freezing the roster to stock makes a rebuild reproduce live exactly. A custom
item that should stack higher declares that in its own zpak's SQL, which is
where it belongs.
"""
from __future__ import annotations

import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Tuple

DATA_DIR = Path(__file__).parent / "data"
ROSTER_PATH = DATA_DIR / "f067_stacks_roster.json"
OVERRIDES_PATH = DATA_DIR / "f067_stacks_overrides.json"

OUTPUT_ZPAK = "zep-items"
OUTPUT_FILE = "zz_[F-067]_increased_stack_sizes.sql"

# Stock stackable value -> Zeppelin stackable value.
TIER_RULES = {100: 1000, 20: 200, 10: 100, 5: 50}

# Entries per emitted IN (...) list, to keep lines reviewable.
CHUNK = 100


def _stock_dump_path(craft_root: Path) -> Path:
    return (craft_root / ".." / "Zeppelin-Core" / "data" / "sql" / "base"
            / "db_world" / "item_template.sql").resolve()


def _split_tuples(buf: str):
    """Yield field lists from a VALUES blob, respecting quotes and escapes."""
    i, n = 0, len(buf)
    while i < n:
        if buf[i] != "(":
            i += 1
            continue
        i += 1
        fields: List[str] = []
        cur = ""
        quote = None
        while i < n:
            c = buf[i]
            if quote:
                if c == "\\":
                    cur += buf[i:i + 2]
                    i += 2
                    continue
                if c == quote:
                    quote = None
                cur += c
                i += 1
                continue
            if c in "'\"":
                quote = c
                cur += c
                i += 1
                continue
            if c == ",":
                fields.append(cur)
                cur = ""
                i += 1
                continue
            if c == ")":
                fields.append(cur)
                i += 1
                break
            cur += c
            i += 1
        yield fields


def read_stock_stackable(craft_root: Path) -> Dict[int, int]:
    """Parse entry -> stackable from AzerothCore's stock item_template dump."""
    path = _stock_dump_path(craft_root)
    if not path.exists():
        raise FileNotFoundError(
            f"Stock item_template dump not found: {path}\n"
            "It ships with AzerothCore at data/sql/base/db_world/item_template.sql")

    text = path.read_text(encoding="utf-8", errors="replace")

    create = re.search(r"CREATE TABLE `item_template` \((.*?)\n\) ENGINE", text, re.S)
    if not create:
        raise ValueError(f"No CREATE TABLE for item_template in {path}")
    cols = [m.group(1) for m in re.finditer(r"^\s*`(\w+)`\s", create.group(1), re.M)]
    try:
        i_entry, i_stack = cols.index("entry"), cols.index("stackable")
    except ValueError as exc:
        raise ValueError(f"item_template dump is missing a required column: {exc}")

    stock: Dict[int, int] = {}
    for m in re.finditer(r"INSERT INTO `item_template` VALUES\s*(.*?);\s*\n", text, re.S):
        for fields in _split_tuples(m.group(1)):
            if len(fields) <= max(i_entry, i_stack):
                continue
            try:
                stock[int(fields[i_entry])] = int(fields[i_stack])
            except ValueError:
                continue

    if not stock:
        raise ValueError(f"Parsed no rows from {path}")
    return stock


def load_overrides() -> Tuple[Dict[int, Dict], Dict[int, str]]:
    """Return (overrides, exclusions) from the hand-authored JSON.

    Exclusions are entries another file owns outright — F-067 emits nothing for
    them, so ownership stays with the file that DELETE+INSERTs the row rather
    than being split across two features that then disagree.
    """
    if not OVERRIDES_PATH.exists():
        return {}, {}
    raw = json.loads(OVERRIDES_PATH.read_text(encoding="utf-8"))

    exclusions = {int(e): why for e, why in (raw.get("_exclude") or {}).items()}

    flat: Dict[int, Dict] = {}
    for group, body in raw.items():
        if group.startswith("_") or not isinstance(body, dict):
            continue
        for entry, spec in (body.get("entries") or {}).items():
            flat[int(entry)] = {**spec, "_group": group}

    overlap = set(flat) & set(exclusions)
    if overlap:
        raise ValueError(
            f"entries are both excluded and overridden in {OVERRIDES_PATH.name}: "
            f"{sorted(overlap)}")

    return flat, exclusions


def build_roster(stock: Dict[int, int], exclusions: Dict[int, str] = None) -> Dict[int, int]:
    """Entries whose stock stackable is remapped by TIER_RULES."""
    skip = set(exclusions or {})
    return {e: TIER_RULES[v] for e, v in stock.items()
            if v in TIER_RULES and e not in skip}


def _chunks(seq: List[int]):
    for i in range(0, len(seq), CHUNK):
        yield seq[i:i + CHUNK]


def _emit_sql(roster: Dict[int, int], overrides: Dict[int, Dict],
              stock_path: Path, exclusions: Dict[int, str] = None) -> Tuple[str, Dict[str, int]]:
    by_value: Dict[int, List[int]] = defaultdict(list)
    for entry, value in roster.items():
        if entry in overrides and "stackable" in overrides[entry]:
            continue  # an override owns this entry's stack size
        by_value[value].append(entry)

    L: List[str] = []
    L.append("-- F-067 Fatter Stacks: server-wide stack-size increases + a few non-unique conversions.")
    L.append("--")
    L.append("-- AUTO-GENERATED by `zep world item stack-sizes` -- do NOT hand-edit.")
    L.append("-- Blanket tiers come from the stock item_template dump; by-entry exceptions come")
    L.append("-- from cli/lib/item/data/f067_stacks_overrides.json. Edit those, then regenerate.")
    L.append("--")
    L.append("-- Every statement is BY ENTRY and therefore idempotent: re-running this file can")
    L.append("-- never re-cascade a tier into the next one. That is why it is safe under the")
    L.append("-- universal downstream cascade. The previous by-value form")
    L.append("-- (`SET stackable = 1000 WHERE stackable = 100`) was apply-once-on-stock, because")
    L.append("-- tier 100 was both an input and an output.")
    L.append(f"--")
    L.append(f"-- Stock source: {stock_path.name}")
    L.append(f"-- Tier rules:   " + ", ".join(f"{k} -> {v}" for k, v in sorted(TIER_RULES.items())))
    L.append("")

    counts = {"blanket": 0, "overrides": 0}
    L.append("-- === Blanket stack-size tiers, resolved to explicit entries ===")
    for value in sorted(by_value, reverse=True):
        entries = sorted(by_value[value])
        counts["blanket"] += len(entries)
        stock_value = next(k for k, v in TIER_RULES.items() if v == value)
        L.append("")
        L.append(f"-- stock {stock_value} -> {value}  ({len(entries)} items)")
        for chunk in _chunks(entries):
            ids = ", ".join(str(e) for e in chunk)
            L.append(f"UPDATE `item_template` SET `stackable` = {value} WHERE `entry` IN ({ids});")

    if overrides:
        grouped: Dict[str, List[int]] = defaultdict(list)
        for entry, spec in overrides.items():
            grouped[spec.get("_group", "other")].append(entry)
        for group in sorted(grouped):
            L.append("")
            L.append(f"-- === Override group: {group} ===")
            for entry in sorted(grouped[group]):
                spec = overrides[entry]
                sets = []
                if "stackable" in spec:
                    sets.append(f"`stackable` = {int(spec['stackable'])}")
                if "maxcount" in spec:
                    sets.append(f"`maxcount` = {int(spec['maxcount'])}")
                if not sets:
                    continue
                counts["overrides"] += 1
                name = spec.get("name", "")
                comment = f"  -- {name}" if name else ""
                L.append(f"UPDATE `item_template` SET {', '.join(sets)} "
                         f"WHERE `entry` = {entry};{comment}")

    if exclusions:
        L.append("")
        L.append("-- === Excluded: owned outright by another file, F-067 leaves them alone ===")
        for entry, why in sorted(exclusions.items()):
            L.append(f"--   {entry}: {why}")

    L.append("")
    return "\n".join(L), counts


def run(craft_root: Path, dry_run: bool = False):
    """Regenerate the F-067 stack-size SQL. Returns (out_path, summary)."""
    stock = read_stock_stackable(craft_root)
    overrides, exclusions = load_overrides()
    roster = build_roster(stock, exclusions)
    sql, counts = _emit_sql(roster, overrides, _stock_dump_path(craft_root), exclusions)

    out_path = craft_root / "zpaks" / OUTPUT_ZPAK / "sql" / OUTPUT_FILE

    tier_counts = defaultdict(int)
    for value in roster.values():
        tier_counts[value] += 1

    summary = {
        "stock_rows": len(stock),
        "roster": len(roster),
        "overrides": len(overrides),
        "emitted_blanket": counts["blanket"],
        "emitted_overrides": counts["overrides"],
        "tiers": dict(sorted(tier_counts.items())),
    }

    if not dry_run:
        ROSTER_PATH.write_text(json.dumps({
            "_comment": "AUTO-GENERATED by `zep world item stack-sizes`. Do not hand-edit; "
                        "edit f067_stacks_overrides.json instead.",
            "source": str(_stock_dump_path(craft_root).name),
            "tier_rules": {str(k): v for k, v in TIER_RULES.items()},
            "entries": {str(k): v for k, v in sorted(roster.items())},
        }, indent=1) + "\n", encoding="utf-8")
        out_path.write_text(sql, encoding="utf-8")

    return out_path, summary
