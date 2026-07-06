#!/usr/bin/env python3
"""
F-011 quest POI import: source quest_poi + quest_poi_points -> AC. For map-648 (Lost
Isles) POIs, remap MapID 648->1 and apply the uniform coord transform (x-533.33,
y-12800). Kezan/other maps pass through unchanged.
"""
import sqlite3, json, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
DX, DY = -533.33, -12800.0
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row

scope = json.load(open(os.path.join(SCRATCH, "item_scope.json")))
try: sk = json.load(open(os.path.join(SCRATCH, "item_scope_K.json")))
except: sk = {"quests": []}
qids = sorted(set(scope["quests"]) | set(sk.get("quests", [])))
qset = set(str(q) for q in qids)

def gi(v, d=0):
    try: return int(float(str(v).strip()))
    except: return d
def gf(v):
    try: return float(str(v).strip())
    except: return 0.0

# quest_poi headers
poi_rows = []
for r in c.execute("SELECT * FROM quest_poi"):
    if str(r["questId"]).strip() not in qset: continue
    mapid = gi(r["mapid"])
    ac_map = 1 if mapid == 648 else mapid
    poi_rows.append((gi(r["questId"]), gi(r["id"]), gi(r["objIndex"]), ac_map,
                     gi(r["WorldMapAreaId"]), gi(r["FloorId"]), mapid == 648))
# points
pt_rows = []
xf = {(gi(p[0]), gi(p[1])): p[6] for p in poi_rows}   # (quest,id)->is648
for r in c.execute("SELECT * FROM quest_poi_points"):
    q = str(r["questId"]).strip()
    if q not in qset: continue
    key = (gi(r["questId"]), gi(r["id"]))
    is648 = xf.get(key, False)
    x, y = gf(r["x"]), gf(r["y"])
    if is648: x, y = x + DX, y + DY
    pt_rows.append((gi(r["questId"]), gi(r["id"]), gi(r["idx"]), round(x), round(y)))

qlist = ",".join(str(q) for q in qids)
with open(ZPAK + "/sql/zz_[F-011]_quest_poi.sql", "w") as f:
    f.write("-- F-011 quest POI (map-648 Lost Isles POIs remapped to map 1 + coord transform)\n")
    f.write("-- %d poi headers, %d points across %d quests.\n\n" % (len(poi_rows), len(pt_rows), len(qids)))
    f.write("DELETE FROM quest_poi WHERE QuestID IN (%s);\n" % qlist)
    f.write("DELETE FROM quest_poi_points WHERE QuestID IN (%s);\n\n" % qlist)
    f.write("INSERT INTO quest_poi (QuestID,id,ObjectiveIndex,MapID,WorldMapAreaId,Floor,Priority,Flags,VerifiedBuild) VALUES\n")
    f.write(",\n".join("  (%d,%d,%d,%d,%d,%d,0,0,0)" % p[:6] for p in poi_rows) + ";\n\n")
    f.write("INSERT INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,VerifiedBuild) VALUES\n")
    f.write(",\n".join("  (%d,%d,%d,%d,%d,0)" % p for p in pt_rows) + ";\n")
print("quest_poi headers: %d | points: %d | quests: %d" % (len(poi_rows), len(pt_rows), len(qids)))
