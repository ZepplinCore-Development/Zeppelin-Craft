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
import importlib.util
import os

NAME = "gameobjects"
TABLES = ["gameobject_template", "gameobjectdisplayinfo", "gameobject",
          "gameobject_loot_template"]
TIER = "base"


def _sibling_const(modname, attr):
    """Read a constant from a sibling gen-domain module (single source of truth)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return getattr(mod, attr)


# I-234/I-261: a Cata cursor IconName the 3.3.5a client doesn't know blanks the
# mouseover cursor (vault 195525 shipped 'openhandglow'). Same map as creatures.
ICONNAME_MAP = _sibling_const("creatures", "ICONNAME_MAP")

# Stock herb/mining nodes that already exist in AC — spawn them, but reuse AC's
# template + loot rather than overwriting them.
STOCK_GO = {1617, 1618, 1619, 1731}

# Kezan PoolElevator GOs are type 11 (TRANSPORT) in the Cata source, but the
# WotLK model (9135) has no TransportAnimation -> StaticTransport::Create fails
# at grid load and they never spawn. Emit as type 5 (GENERIC static prop) so
# they render as scenery.
TYPE_OVERRIDE = {196837: 5, 196838: 5}

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
    typ = TYPE_OVERRIDE.get(e, _gi(t, "type"))
    icon = (t["IconName"] or "").strip()
    col = {"entry": e, "type": typ, "displayId": _gi(t, "displayId"),
           "name": (t["name"] or "").strip(), "IconName": ICONNAME_MAP.get(icon, icon),
           "castBarCaption": (t["castBarCaption"] or "").strip(), "unk1": (t["unk1"] or "").strip(),
           "size": float(t["size"] or 1)}
    for n in range(24):
        col["Data%d" % n] = _gi(t, "data%d" % n)
    # Gossip menu refs live in the data fields (type 2 questgiver -> Data3,
    # type 10 goober -> Data19) and are raw Cata menu ids that collide with the
    # stock 3.3.5 menu space (I-261: vault 195525 Data19=11013 = the stock ICC
    # Scourge Transporter menu). Zero them here; gossip.py overlays the
    # remapped 510xxx id for menus it ports.
    if typ == 2:
        col["Data3"] = 0
    elif typ == 10:
        col["Data19"] = 0
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

    # ---- 02 gameobject spawns (scope-curated: keeps dev props like the I-233
    # Gnomey crate/aura column out even though their templates exist in source).
    # Fixed 500,000-guid block DELETE per zone (count-independent) so stale
    # spawns beyond the current count are always cleared; kajamite's chunk guids
    # live inside the Kezan block and re-insert from the same collected file. ----
    spawns = ctx.q("SELECT * FROM gameobject WHERE TRIM(zone)=%s ORDER BY CAST(guid AS UNSIGNED)", (zone,))
    scope_set = set(scope["ents"]) | STOCK_GO
    spawns = [s for s in spawns if int(s["id"]) in gt and int(s["id"]) in scope_set]
    ctx.col.delete("gameobject", "guid BETWEEN %d AND %d" % (guid_base, guid_base + 499999))
    g = guid_base
    for s in spawns:
        g += 1
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        pmask = _gi(s, "phaseMask", 1) or 1   # F-194 preserve Cata phaseMask
        ctx.col.add("gameobject", {
            "guid": g, "id": int(s["id"]), "map": 1, "zoneId": 0, "areaId": 0,
            "spawnMask": 1, "phaseMask": pmask,
            "position_x": x, "position_y": y, "position_z": float(s["position_z"]),
            "orientation": float(s["orientation"]),
            "rotation0": float(s["rotation0"] or 0), "rotation1": float(s["rotation1"] or 0),
            "rotation2": float(s["rotation2"] or 0), "rotation3": float(s["rotation3"] or 0),
            "spawntimesecs": _gi(s, "spawntimesecs", 300),
            "animprogress": _gi(s, "animprogress", 255), "state": _gi(s, "state"),
            "ScriptName": "", "VerifiedBuild": 0,
            "Comment": "F-011 %s" % ("Kezan" if sfx else "Lost Isles"),
        }, sort_key=g)

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
    if loot_tables:
        ctx.col.delete("gameobject_loot_template",
                       "Entry IN (%s)" % ",".join(str(x) for x in sorted(loot_tables)))
        for (ent, it, ch, q2, lm, gid, mn, mx) in loot_rows:
            ctx.col.add("gameobject_loot_template", {
                "Entry": ent, "Item": it, "Reference": 0, "Chance": ch,
                "QuestRequired": q2, "LootMode": lm, "GroupId": gid,
                "MinCount": mn, "MaxCount": mx,
            })

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
    for did in needed:
        ctx.col.put("gameobjectdisplayinfo", did,
                    {"id": did, "model_name": disp_paths[did]},
                    tier="base", zone=sfx, owner="gameobjects")

    return ("templates=%d spawns=%d loot=%d/%d(rows/tables) quest_go=%d dbc_disp=%d"
            % (len([e for e in ents if e not in STOCK_GO]), len(spawns),
               len(loot_rows), len(loot_tables), len(quest_go), len(needed)))
