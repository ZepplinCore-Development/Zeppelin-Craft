#!/usr/bin/env python3
"""Generate scope files for a given zone (item_scope + go_scope). Env F011_ZONE, F011_SFX."""
import sqlite3, json, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZONE = os.environ.get("F011_ZONE", "4720")
SFX = os.environ.get("F011_SFX", "")
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
NOISE = ('bunny', 'invisible stalker', 'generateur', 'elm general', 'wondi', 'purpose bunny')
tmpl = {int(r['entry']): r for r in c.execute("SELECT entry,name,lootid FROM creature_template")}
spawned = [int(r[0]) for r in c.execute("SELECT DISTINCT TRIM(id) FROM creature WHERE TRIM(zone)=?", (ZONE,))]
li = [e for e in spawned if e in tmpl and not any(k in (tmpl[e]['name'] or '').lower() for k in NOISE)]
lset = set(li)

qids = set()
for tbl in ("creature_questrelation", "creature_involvedrelation"):
    for r in c.execute("SELECT TRIM(id) id, TRIM(quest) q FROM %s" % tbl):
        if r['id'].isdigit() and int(r['id']) in lset and r['q'].lstrip('-').isdigit():
            qids.add(int(r['q']))
for r in c.execute("SELECT TRIM(Id) q FROM quest_template WHERE TRIM(ZoneOrSort)=?", (ZONE,)):
    if r['q'].isdigit(): qids.add(int(r['q']))

ITEM_COLS = (["SourceItemId"] + ["RewardItemId%d" % i for i in range(1, 5)]
             + ["RewardChoiceItemId%d" % i for i in range(1, 7)]
             + ["RequiredItemId%d" % i for i in range(1, 7)]
             + ["RequiredSourceItemId%d" % i for i in range(1, 5)])
quest_items = set()
if qids:
    rows = c.execute("SELECT %s FROM quest_template WHERE TRIM(Id) IN (%s)" % (
        ",".join(ITEM_COLS), ",".join("'%d'" % q for q in qids))).fetchall()
    for r in rows:
        for col in ITEM_COLS:
            v = r[col]
            if v and str(v).strip().isdigit() and int(v) > 0: quest_items.add(int(v))

loot_items = set()
def gather(tbl, eid, seen):
    if eid in seen: return
    seen.add(eid)
    for r in c.execute("SELECT * FROM %s WHERE TRIM(entry)=?" % tbl, (str(eid),)):
        mcr = int(r['mincountOrRef'] or 0); it = int(r['item'] or 0)
        if mcr < 0: gather("reference_loot_template", -mcr, seen)
        elif it > 0: loot_items.add(it)
seen = set()
for e in li:
    lid = int(tmpl[e]['lootid'] or 0)
    if lid: gather("creature_loot_template", lid, seen)

json.dump({"quest": sorted(quest_items), "loot": sorted(loot_items),
           "quests": sorted(qids), "creatures": sorted(li)},
          open(os.path.join(SCRATCH, "item_scope%s.json" % SFX), "w"))

# GO scope
gts = {int(r[0]): r for r in c.execute("SELECT TRIM(entry),displayId,name,type FROM gameobject_template")}
gsp = [int(r[0]) for r in c.execute("SELECT DISTINCT TRIM(id) FROM gameobject WHERE TRIM(zone)=?", (ZONE,))]
gents = [e for e in gsp if e in gts]
gdisp = set(int(gts[e][1]) for e in gents if gts[e][1] and str(gts[e][1]).strip() not in ('0', ''))
json.dump({"ents": gents, "disp": sorted(gdisp)}, open(os.path.join(SCRATCH, "go_scope%s.json" % SFX), "w"))

print("zone %s: %d creatures, %d quests, %d quest-items, %d loot-items, %d GO ents, %d GO disp" % (
    ZONE, len(li), len(qids), len(quest_items), len(loot_items), len(gents), len(gdisp)))
