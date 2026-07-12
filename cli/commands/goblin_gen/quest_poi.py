"""gen domain: quest_poi.

Port of Scripts/Goblin Zone Port/import_quest_poi.py.

source quest_poi + quest_poi_points -> AC. For map-648 (Lost Isles) POIs, remap
MapID 648->1 and apply the uniform coord transform (x-533.33, y-12800). Kezan/other
maps pass through unchanged.

Zone-agnostic: the source emits ONE un-suffixed file (zz_[F-011]_quest_poi.sql)
covering BOTH zones' quests (union of item_scope + item_scope_K), so this emitter
ignores ctx.sfx for scope and output name — both zone passes write identical content.
"""
NAME = "quest_poi"
TABLES = ["quest_poi", "quest_poi_points"]
TIER = "base"

DX, DY = -533.33, -12800.0


def _gi(v, d=0):
    try:
        return int(float(str(v).strip()))
    except (TypeError, ValueError):
        return d


def _gf(v):
    try:
        return float(str(v).strip())
    except (TypeError, ValueError):
        return 0.0


def emit(ctx):
    if ctx.sfx:
        return "skipped (covers both zones; emitted on Lost Isles pass)"
    scope = ctx.fixture("item_scope")
    try:
        sk = ctx.fixture("item_scope_K")
    except Exception:
        sk = {"quests": []}
    qids = sorted(set(scope["quests"]) | set(sk.get("quests", [])))
    qset = set(str(q) for q in qids)

    # quest_poi headers
    poi_rows = []
    for r in ctx.q("SELECT * FROM quest_poi"):
        if str(r["questId"]).strip() not in qset:
            continue
        mapid = _gi(r["mapid"])
        ac_map = 1 if mapid == 648 else mapid
        poi_rows.append((_gi(r["questId"]), _gi(r["id"]), _gi(r["objIndex"]), ac_map,
                         _gi(r["WorldMapAreaId"]), _gi(r["FloorId"]), mapid == 648))

    # points (apply the Lost Isles map-648 coord transform per its owning header)
    xf = {(_gi(p[0]), _gi(p[1])): p[6] for p in poi_rows}   # (quest,id)->is648
    pt_rows = []
    for r in ctx.q("SELECT * FROM quest_poi_points"):
        q = str(r["questId"]).strip()
        if q not in qset:
            continue
        key = (_gi(r["questId"]), _gi(r["id"]))
        is648 = xf.get(key, False)
        x, y = _gf(r["x"]), _gf(r["y"])
        if is648:
            x, y = x + DX, y + DY
        pt_rows.append((_gi(r["questId"]), _gi(r["id"]), _gi(r["idx"]), round(x), round(y)))

    qlist = ",".join(str(q) for q in qids)
    ctx.col.delete("quest_poi", "QuestID IN (%s)" % qlist)
    ctx.col.delete("quest_poi_points", "QuestID IN (%s)" % qlist)
    for (qid, pid, obj, mp, wma, fl, _is648) in poi_rows:
        ctx.col.add("quest_poi", {
            "QuestID": qid, "id": pid, "ObjectiveIndex": obj, "MapID": mp,
            "WorldMapAreaId": wma, "Floor": fl, "Priority": 0, "Flags": 0,
            "VerifiedBuild": 0,
        })
    for (qid, pid, idx, x, y) in pt_rows:
        ctx.col.add("quest_poi_points", {
            "QuestID": qid, "Idx1": pid, "Idx2": idx, "X": x, "Y": y,
            "VerifiedBuild": 0,
        })
    return ("quest_poi headers=%d points=%d quests=%d"
            % (len(poi_rows), len(pt_rows), len(qids)))
