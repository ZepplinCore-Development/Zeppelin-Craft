"""gen domain: creature loot (direct drops).

Port of Scripts/Goblin Zone Port/migrate_loot.py. Translates the Neltharion
creature_loot_template (Cata combined-column schema: mincountOrRef /
ChanceOrQuestChance) -> AC creature_loot_template, remapping custom items to
F-011's 84300+ block via the item_remap fixture, and sets creature_template.lootid
for the zone's creatures. Shared reference rows (mincountOrRef < 0) are deferred.

Per-zone (SFX): emits zz_[AUTO,F-011]<sfx>_loot_creatures.sql.

Includes the conflict guard from migrate_quests.py: a loot item-ref may point only
at a real stock WotLK item (< CUSTOM_FLOOR) or an item in F-011's own 84300-84799
block. An out-of-block ref means the remap left a raw Cata id that lands in another
feature's reserved range (item dropped by a creature but MISSING from the Neltharion
source; see I-236). WARN (do not abort) so the rows still emit for an override.
"""
import os
import csv as _csv

NAME = "loot"

RESV_CSV = "/workspace/project/Zeppelin-Craft/Scripts/Item Scripts/Item Reservations.csv"
F011_LO, F011_HI = 84300, 84799
CUSTOM_FLOOR = 56900   # first custom-reservation id; stock WotLK item ids are below this
_ZONE = {"": "4720", "_K": "4737"}   # Lost Isles / Kezan
NOISE = ('bunny', 'invisible stalker', 'generateur', 'elm general', 'wondi', 'purpose bunny')


def _load_reservations():
    rows = []
    try:
        with open(RESV_CSV, encoding="utf-8-sig") as fh:
            for r in _csv.DictReader(fh):
                try:
                    rows.append((int(r["Start Range"]), int(r["End Range"]), r["Items"]))
                except (ValueError, KeyError):
                    pass
    except FileNotFoundError:
        pass
    return rows


def _esc(v):
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def emit(ctx):
    sfx = ctx.sfx
    zone = _ZONE[sfx]
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    resv = _load_reservations()

    def owner(i):
        return next((nm for lo, hi, nm in resv if lo <= i <= hi), "UNRESERVED gap")

    tmpl = {int(r['entry']): r for r in ctx.q("SELECT entry,name,lootid FROM creature_template")}
    spawned = [int(r['id']) for r in
               ctx.q("SELECT DISTINCT TRIM(id) AS id FROM creature WHERE TRIM(zone)=%s", (zone,))]
    li = [e for e in spawned if e in tmpl
          and not any(k in (tmpl[e]['name'] or '').lower() for k in NOISE)]

    # collect distinct lootids used by the zone's creatures
    lootids = {}
    for e in li:
        lid = int(tmpl[e]['lootid'] or 0)
        if lid:
            lootids[e] = lid

    loot_rows = []
    entries = set()
    ref_skipped = 0
    conflicts = []
    for e, lid in lootids.items():
        for r in ctx.q("SELECT * FROM creature_loot_template WHERE TRIM(entry)=%s", (str(lid),)):
            mcr = int(r['mincountOrRef'] or 0)
            if mcr < 0:
                ref_skipped += 1
                continue   # shared reference row: defer
            item = int(r['item'] or 0)
            if item <= 0:
                continue
            newitem = remap.get(item, item)   # custom -> 84300+, stock unchanged
            if newitem >= CUSTOM_FLOOR and not (F011_LO <= newitem <= F011_HI):
                conflicts.append((lid, item, newitem, owner(newitem)))
            chance = float(r['ChanceOrQuestChance'] or 0)
            quest = 1 if chance < 0 else 0
            ch = abs(chance)
            mn = max(mcr, 1)
            mx = max(int(r['maxcount'] or 1), mn)
            loot_rows.append((lid, newitem, 0, ch, quest, int(r['lootmode'] or 1),
                              int(r['groupid'] or 0), mn, mx, tmpl[e]['name']))
            entries.add(lid)

    # conflict guard: warn (do not abort) if any loot item-ref lands outside stock or F-011's block
    if conflicts:
        print("\n!!! WARNING: %d loot item-ref(s) point into reserved space F-011 does not own:"
              % len(conflicts))
        for lid, raw, v, own in sorted(set(conflicts)):
            print("    loot table %-6d item %-7d -> owned by [%s]" % (lid, v, own))
        print("    Fix at source (add to missing-items so it is ported) OR add a zz_[I-xxx]_*.sql override.")

    b = []
    b.append("-- F-011 Lost Isles creature loot (direct drops; custom items remapped 84300+)")
    b.append("-- %d loot rows across %d loot tables. Shared references deferred (%d rows).\n"
             % (len(loot_rows), len(entries), ref_skipped))
    for e, lid in sorted(lootids.items()):
        if lid in entries:
            b.append("UPDATE creature_template SET lootid = %d WHERE entry = %d;" % (lid, e))
    b.append("")
    ids = ",".join(str(x) for x in sorted(entries))
    b.append("DELETE FROM creature_loot_template WHERE Entry IN (%s);" % ids)
    b.append("INSERT INTO creature_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount,Comment) VALUES")
    vals = []
    for (ent, it, ref, ch, q, lm, gid, mn, mx, nm) in loot_rows:
        vals.append("  (%d,%d,%d,%s,%d,%d,%d,%d,%d,'%s')" % (
            ent, it, ref, _esc(ch), q, lm, gid, mn, mx, (nm or '').replace("'", "''")[:40]))
    b.append(",\n".join(vals) + ";")

    ctx.write("sql/zz_[AUTO,F-011]%s_loot_creatures.sql" % sfx, "\n".join(b) + "\n")
    custom = sum(1 for r in loot_rows if r[1] >= 84300)
    return ("loot_tables=%d rows=%d deferred_refs=%d custom_items=%d conflicts=%d"
            % (len(entries), len(loot_rows), ref_skipped, custom, len(set(conflicts))))
