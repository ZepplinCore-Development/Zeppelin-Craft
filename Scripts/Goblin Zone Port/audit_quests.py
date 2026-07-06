#!/usr/bin/env python3
"""
F-011 quest-completability audit. For every F-011 quest, verify against the LIVE world DB:
  - questgiver + questender are spawned
  - each RequiredItemId is obtainable from a live source (creature loot / GO loot / vendor)
  - each RequiredNpcOrGo (kill/interact credit) is spawned
Reports STUCK quests + the specific missing source, and emits fix-candidates JSON.
"""
import json, os, subprocess
CLI = "/workspace/project/Zeppelin-Craft"
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"

def q(sql):
    return subprocess.run(["python3","-m","cli.zep","world","sql","query",sql],
                          cwd=CLI, capture_output=True, text=True).stdout
def rows(sql):
    out = []
    for line in q(sql).splitlines():
        p = line.split("\t")
        if p and p[0].strip() and not p[0].startswith("Running") and "Query completed" not in line:
            out.append([x.strip() for x in p])
    return out[1:] if out and not out[0][0].lstrip('-').isdigit() else out

scope = json.load(open(os.path.join(SCRATCH, "item_scope.json")))
try: scope_k = json.load(open(os.path.join(SCRATCH, "item_scope_K.json")))
except: scope_k = {"quests": []}
qids = sorted(set(scope["quests"]) | set(scope_k["quests"]))
IN = ",".join(map(str, qids))

# --- live sources ---
# items obtainable: creature loot (spawned creature), GO loot (spawned GO), vendor
spawned_cre = set(int(r[0]) for r in rows("SELECT DISTINCT id FROM creature"))
spawned_go = set(int(r[0]) for r in rows("SELECT DISTINCT id FROM gameobject"))
# item -> has a live source?
def build_item_sources():
    src = {}
    # creature loot
    for r in rows("SELECT ct.entry, clt.Item FROM creature_loot_template clt JOIN creature_template ct ON ct.lootid=clt.Entry"):
        cid, it = int(r[0]), int(r[1])
        if cid in spawned_cre: src.setdefault(it, set()).add(("cre", cid))
    # GO loot
    for r in rows("SELECT gt.entry, glt.Item FROM gameobject_loot_template glt JOIN gameobject_template gt ON gt.Data1=glt.Entry"):
        gid, it = int(r[0]), int(r[1])
        if gid in spawned_go: src.setdefault(it, set()).add(("go", gid))
    # vendor
    for r in rows("SELECT item FROM npc_vendor"):
        src.setdefault(int(r[0]), set()).add(("vendor", 0))
    return src
item_src = build_item_sources()

# questgivers / enders
starter = {}; ender = {}
for r in rows("SELECT quest, id FROM creature_queststarter WHERE quest IN (%s)" % IN):
    starter.setdefault(int(r[0]), set()).add(int(r[1]))
for r in rows("SELECT quest, id FROM creature_questender WHERE quest IN (%s)" % IN):
    ender.setdefault(int(r[0]), set()).add(int(r[1]))

# quest requirements
cols = "ID,RequiredItemId1,RequiredItemId2,RequiredItemId3,RequiredItemId4,RequiredItemId5,RequiredItemId6,RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4"
qrows = rows("SELECT %s FROM quest_template WHERE ID IN (%s)" % (cols, IN))

stuck = []
for r in qrows:
    if not r[0].isdigit(): continue
    qid = int(r[0]); issues = []
    reqitems = [int(x) for x in r[1:7] if x.lstrip('-').isdigit() and int(x) > 0]
    reqnpc = [int(x) for x in r[7:11] if x.lstrip('-').isdigit() and int(x) != 0]
    # questgiver/ender spawned?
    st = starter.get(qid, set()); en = ender.get(qid, set())
    if st and not (st & spawned_cre): issues.append("questgiver not spawned %s" % st)
    if en and not (en & spawned_cre): issues.append("questender not spawned %s" % en)
    for it in reqitems:
        if it not in item_src: issues.append("item %d NO live source" % it)
    for npc in reqnpc:
        e = abs(npc); pool = spawned_go if npc < 0 else spawned_cre
        if e not in pool: issues.append("%s %d not spawned" % ("GO" if npc<0 else "NPC", e))
    if issues:
        stuck.append({"quest": qid, "issues": issues})

print("F-011 quests audited: %d | STUCK: %d" % (len(qrows), len(stuck)))
# categorize
from collections import Counter
cat = Counter()
for s in stuck:
    for i in s["issues"]:
        cat[i.split(" ")[0] + " " + i.split(" ")[-2] if "source" in i else i.split(" NO")[0].rsplit(" ",1)[0] if False else i.split(" ")[0]] += 1
bykind = Counter()
for s in stuck:
    for i in s["issues"]:
        if "NO live source" in i: bykind["item-no-source"] += 1
        elif "not spawned" in i and "GO" in i: bykind["GO-not-spawned"] += 1
        elif "not spawned" in i and "NPC" in i: bykind["NPC-not-spawned"] += 1
        elif "questgiver" in i: bykind["questgiver"] += 1
        elif "questender" in i: bykind["questender"] += 1
print("issue kinds:", dict(bykind))
json.dump(stuck, open(os.path.join(SCRATCH, "quest_audit.json"), "w"), indent=1)
for s in stuck[:30]:
    print("  q%-6d %s" % (s["quest"], "; ".join(s["issues"][:3])))
