#!/usr/bin/env python3
"""
F-011 creature loot migration (direct drops). Translates source creature_loot_template
-> AC, remapping custom items to 84300+. Reference rows (shared tables) deferred.
Sets creature_template.lootid for LI creatures.
"""
import sqlite3, json, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
SFX = os.environ.get("F011_SFX","")
ZONE = os.environ.get("F011_ZONE","4720")
remap = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "item_remap.json"))).items()}

# --- conflict guard (F-011 item-ref sanity), mirrors migrate_quests.py ---
# A loot row may reference only (a) a real stock WotLK item (id < CUSTOM_FLOOR) or
# (b) an item in F-011's own reserved block. Anything else means the remap left a ref
# on a raw Cata id that lands in ANOTHER feature's reserved range -- the "item dropped
# by a creature but MISSING from the Neltharion source" bug (e.g. 62328/62512/62514/
# 62525 that F-013 AUTO 62200-63199 later claimed; see I-236). Detect against
# Item Reservations.csv and abort so a human recovers the item instead of shipping a
# silent collision.
import csv as _csv
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
RESV_CSV = "/workspace/project/Zeppelin-Craft/Scripts/Item Scripts/Item Reservations.csv"
F011_LO, F011_HI = 84300, 84799
CUSTOM_FLOOR = 56900  # first custom-reservation id; stock WotLK item ids are below this
def _load_reservations():
    rows = []
    try:
        with open(RESV_CSV, encoding="utf-8-sig") as fh:
            for r in _csv.DictReader(fh):
                try: rows.append((int(r["Start Range"]), int(r["End Range"]), r["Items"]))
                except (ValueError, KeyError): pass
    except FileNotFoundError: pass
    return rows
RESV = _load_reservations()
def _owner(i):
    return next((nm for lo, hi, nm in RESV if lo <= i <= hi), "UNRESERVED gap")
CONFLICTS = []

NOISE = ('bunny','invisible stalker','generateur','elm general','wondi','purpose bunny')
tmpl = {int(r['entry']): r for r in c.execute("SELECT entry,name,lootid FROM creature_template")}
spawned = [int(r[0]) for r in c.execute("SELECT DISTINCT TRIM(id) FROM creature WHERE TRIM(zone)=?", (ZONE,))]
li = [e for e in spawned if e in tmpl and not any(k in (tmpl[e]['name'] or '').lower() for k in NOISE)]

def esc(v):
    if isinstance(v, float): return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)

# collect distinct lootids used by LI creatures
lootids = {}
for e in li:
    lid = int(tmpl[e]['lootid'] or 0)
    if lid: lootids[e] = lid

loot_rows = []      # (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, comment)
entries = set()
ref_skipped = 0
dropped_item = 0
for e, lid in lootids.items():
    for r in c.execute("SELECT * FROM creature_loot_template WHERE TRIM(entry)=?", (str(lid),)):
        mcr = int(r['mincountOrRef'] or 0)
        if mcr < 0:
            ref_skipped += 1
            continue   # shared reference row: defer
        item = int(r['item'] or 0)
        if item <= 0: continue
        newitem = remap.get(item, item)   # custom -> 84300+, stock unchanged
        if newitem >= CUSTOM_FLOOR and not (F011_LO <= newitem <= F011_HI):
            CONFLICTS.append((lid, item, newitem, _owner(newitem)))
        chance = float(r['ChanceOrQuestChance'] or 0)
        quest = 1 if chance < 0 else 0
        ch = abs(chance)
        mn = max(mcr, 1); mx = max(int(r['maxcount'] or 1), mn)
        loot_rows.append((lid, newitem, 0, ch, quest, int(r['lootmode'] or 1),
                          int(r['groupid'] or 0), mn, mx, tmpl[e]['name']))
        entries.add(lid)

# ---- conflict guard: warn if any loot item-ref lands outside stock or F-011's block ----
# An out-of-block ref means an item dropped by a creature but MISSING from the Neltharion
# source, so the remap left the raw Cata id (e.g. 62328/62512/62514/62525/67252/67256/67257
# that F-013/F-179 AUTO later claimed; see I-236). Warn (don't abort) so the generated rows
# still emit for an override to layer on. Fix at source (add to missing-items so the item is
# ported and the remap repoints the ref) OR add a zz_[I-xxx]_*.sql override that creates the
# item in F-011's block and repoints the ref (it loads after this generated file).
if CONFLICTS:
    print("\n!!! WARNING: %d loot item-ref(s) point into reserved space F-011 does not own:" % len(CONFLICTS))
    for lid, raw, v, own in sorted(set(CONFLICTS)):
        print("    loot table %-6d item %-7d -> owned by [%s]" % (lid, v, own))
    print("    Fix at source (add to missing-items so it is ported) OR add a zz_[I-xxx]_*.sql override.")

# write: set lootid + loot rows
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_loot_creatures.sql"), "w") as f:
    f.write("-- F-011 Lost Isles creature loot (direct drops; custom items remapped 84300+)\n")
    f.write("-- %d loot rows across %d loot tables. Shared references deferred (%d rows).\n\n" % (
        len(loot_rows), len(entries), ref_skipped))
    # set lootid on LI creatures (only those with loot rows)
    live_ids = sorted(set(lid for e, lid in lootids.items() if lid in entries))
    for e, lid in sorted(lootids.items()):
        if lid in entries:
            f.write("UPDATE creature_template SET lootid = %d WHERE entry = %d;\n" % (lid, e))
    f.write("\n")
    ids = ",".join(str(x) for x in sorted(entries))
    f.write("DELETE FROM creature_loot_template WHERE Entry IN (%s);\n" % ids)
    f.write("INSERT INTO creature_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount,Comment) VALUES\n")
    vals = []
    for (ent, it, ref, ch, q, lm, gid, mn, mx, nm) in loot_rows:
        vals.append("  (%d,%d,%d,%s,%d,%d,%d,%d,%d,'%s')" % (
            ent, it, ref, esc(ch), q, lm, gid, mn, mx, (nm or '').replace("'", "''")[:40]))
    f.write(",\n".join(vals) + ";\n")

print("loot tables: %d  rows: %d  (deferred %d reference rows)" % (len(entries), len(loot_rows), ref_skipped))
print("custom items in loot:", sum(1 for r in loot_rows if r[1] >= 84300))
