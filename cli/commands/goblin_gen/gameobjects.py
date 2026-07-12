"""gen domain: gameobjects.

gameobject_template / gameobject (spawns) / gameobject_loot_template (Cata,
neltharion) -> AC 3.3.5a, plus GameObjectDisplayInfo DBC additions for models
missing from the 3.3.5a client. Ported from
Scripts/Goblin Zone Port/migrate_gameobjects.py.

Per zone it emits four world-SQL files + one DBC file:
    gameobjects_01_template  — gameobject_template for every spawned GO
                               (Cata Data0-23 kept; faction/flags/questItem dropped;
                               stock herb/mining nodes left to AC, not re-emitted).
    gameobjects_02_spawns    — gameobject rows (map648->map1 coord offset applied,
                               source phaseMask preserved for F-194 phasing).
    gameobjects_03_loot      — gameobject_loot_template for chest/node GOs
                               (custom items remapped via item_remap fixture).
    gameobjects_04_quest_go  — templates for GOs referenced by in-scope quest
                               objectives but never fixed-spawned (keeps the quest
                               objective refs valid). Only written when non-empty.
    dbc gameobjectdisplayinfo — model_name rows for display IDs absent from 3.3.5a.

Fixtures: go_scope[/ _K] (spawned GO entries), go_disp_paths[/ _K] (missing
display -> client model path), item_remap (Cata item -> custom AC item),
item_scope[/ _K] (quest scope, for the quest-summoned GO templates).

The source script also copies GO M2 models into the zpak MPQ folder; that asset
step is out of scope here (this module only emits SQL/DBC).
"""
NAME = "gameobjects"
TABLES = ["gameobject_template"]   # spawns / loot / dbc still legacy (Phase 4 / 3b)
TIER = "base"

# Stock herb/mining nodes that already exist in AC — spawn them, but reuse AC's
# template + loot rather than overwriting them.
STOCK_GO = {1617, 1618, 1619, 1731}

# map648 (Cata Lost Isles/Kezan) -> map1 (Kalimdor) coordinate offset.
DX, DY = -533.3333, -12800.0

# Per-zone source zone id + emitted guid block base.
_ZONE = {"": "4720", "_K": "4737"}
_GUID = {"": 6000000, "_K": 6500000}


def _esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def _gi(r, k, d=0):
    try:
        return int(float(r[k])) if r[k] not in (None, "") else d
    except Exception:
        return d


def _template_cols(e, t):
    """Build the ordered gameobject_template column dict for one GO entry."""
    col = {"entry": e, "type": _gi(t, "type"), "displayId": _gi(t, "displayId"),
           "name": (t["name"] or "").strip(), "IconName": (t["IconName"] or "").strip(),
           "castBarCaption": (t["castBarCaption"] or "").strip(), "unk1": (t["unk1"] or "").strip(),
           "size": float(t["size"] or 1)}
    for n in range(24):
        col["Data%d" % n] = _gi(t, "data%d" % n)
    col.update({"AIName": "", "ScriptName": "", "VerifiedBuild": 0})
    return col


def emit(ctx):
    sfx = ctx.sfx
    zone = _ZONE[sfx]
    guid_base = _GUID[sfx]
    disp_paths = {int(k): v for k, v in ctx.fixture("go_disp_paths" + sfx).items()}
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    scope = ctx.fixture("go_scope" + sfx)

    gt = {int(r["entry"]): r for r in ctx.q("SELECT * FROM gameobject_template")}
    ents = [e for e in scope["ents"] if e in gt]

    # ---- 01 gameobject_template (skip stock collisions) -> collector ----
    for e in sorted(ents):
        if e in STOCK_GO:
            continue
        ctx.col.put("gameobject_template", e, _template_cols(e, gt[e]),
                    tier="base", zone=sfx, owner="gameobjects")

    # ---- 02 gameobject spawns ----
    spawns = ctx.q("SELECT * FROM gameobject WHERE TRIM(zone)=%s ORDER BY CAST(guid AS UNSIGNED)", (zone,))
    spawns = [s for s in spawns if int(s["id"]) in gt]
    sb = ["-- F-011 Lost Isles gameobject spawns (map648->map1 offset, source phaseMask preserved for F-194 phasing)\n",
          "-- guid block %d..%d\n\n" % (guid_base, guid_base + len(spawns)),
          "DELETE FROM gameobject WHERE guid BETWEEN %d AND %d;\n" % (guid_base, guid_base + len(spawns) + 10),
          "INSERT INTO gameobject (guid,id,map,zoneId,areaId,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,ScriptName,VerifiedBuild,Comment) VALUES\n"]
    vals = []
    g = guid_base
    for s in spawns:
        g += 1
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        z = float(s["position_z"])
        pmask = _gi(s, "phaseMask", 1) or 1   # F-194 preserve Cata phaseMask
        vals.append("  (%d,%d,1,0,0,1,%d,%s,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,'',0,'F-011 Lost Isles')" % (
            g, int(s["id"]), pmask, _esc(x), _esc(y), _esc(z), _esc(float(s["orientation"])),
            _esc(float(s["rotation0"] or 0)), _esc(float(s["rotation1"] or 0)),
            _esc(float(s["rotation2"] or 0)), _esc(float(s["rotation3"] or 0)),
            _gi(s, "spawntimesecs", 300), _gi(s, "animprogress", 255), _gi(s, "state")))
    sb.append(",\n".join(vals) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_gameobjects_02_spawns.sql" % sfx, "".join(sb))

    # ---- 03 gameobject_loot_template (chest GOs, remap custom items) ----
    gl_entries = set(int(r["entry"]) for r in
                     ctx.q("SELECT DISTINCT TRIM(entry) AS entry FROM gameobject_loot_template"))
    loot_rows, loot_tables = [], set()
    for e in ents:
        if e in STOCK_GO:
            continue
        t = gt[e]
        if _gi(t, "type") == 3:
            lid = _gi(t, "data1")
            if lid in gl_entries:
                for r in ctx.q("SELECT * FROM gameobject_loot_template WHERE TRIM(entry)=%s", (str(lid),)):
                    mcr = int(r["mincountOrRef"] or 0)
                    if mcr < 0:
                        continue
                    it = int(r["item"] or 0)
                    if it <= 0:
                        continue
                    chance = float(r["ChanceOrQuestChance"] or 0)
                    loot_rows.append((lid, remap.get(it, it), abs(chance), 1 if chance < 0 else 0,
                                      int(r["lootmode"] or 1), int(r["groupid"] or 0),
                                      max(mcr, 1), max(int(r["maxcount"] or 1), mcr, 1)))
                    loot_tables.add(lid)
    lb = ["-- F-011 gameobject loot (chest/node GOs; custom items remapped)\n\n"]
    if loot_tables:
        lb.append("DELETE FROM gameobject_loot_template WHERE Entry IN (%s);\n"
                  % ",".join(str(x) for x in sorted(loot_tables)))
        lb.append("INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES\n")
        lb.append(",\n".join("  (%d,%d,0,%s,%d,%d,%d,%d,%d)" % (ent, it, _esc(ch), q, lm, gid, mn, mx)
                             for (ent, it, ch, q, lm, gid, mn, mx) in loot_rows) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_gameobjects_03_loot.sql" % sfx, "".join(lb))

    # ---- 04 quest-summoned GO templates (referenced by in-scope quests, not spawned) ----
    quests = ctx.fixture("item_scope" + sfx)["quests"]
    refgo = set()
    if quests:
        q_in = ",".join(str(int(q)) for q in quests)
        rows = ctx.q("SELECT RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4 "
                     "FROM quest_template WHERE TRIM(Id) IN (%s)" % q_in)
        for r in rows:
            for k in ("RequiredNpcOrGo1", "RequiredNpcOrGo2", "RequiredNpcOrGo3", "RequiredNpcOrGo4"):
                v = r[k]
                if v is not None and int(v) < 0:
                    refgo.add(-int(v))
    spawned = set(scope["ents"])
    quest_go = sorted(g for g in refgo if g not in spawned and g in gt)
    for e in quest_go:
        ctx.col.put("gameobject_template", e, _template_cols(e, gt[e]),
                    tier="base", zone=sfx, owner="gameobjects")

    # ---- DBC: GameObjectDisplayInfo additions (models absent from 3.3.5a) ----
    needed = sorted(set(_gi(gt[e], "displayId") for e in ents
                        if _gi(gt[e], "displayId") in disp_paths))
    db = ["-- F-011 GameObjectDisplayInfo additions (client PATCH-Z; model paths from wago 4.4.2)\n\n"]
    for did in needed:
        db.append("DELETE FROM gameobjectdisplayinfo WHERE id = %d;\n" % did)
        db.append("INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (%d, %s);\n"
                  % (did, _esc(disp_paths[did])))
    ctx.write("dbc/[AUTO,F-011]%s_gameobjectdisplayinfo.sql" % sfx, "".join(db))

    return ("templates=%d spawns=%d loot=%d/%d(rows/tables) quest_go=%d dbc_disp=%d"
            % (len([e for e in ents if e not in STOCK_GO]), len(spawns),
               len(loot_rows), len(loot_tables), len(quest_go), len(needed)))
