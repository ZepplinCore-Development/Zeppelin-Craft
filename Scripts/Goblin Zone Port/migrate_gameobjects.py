#!/usr/bin/env python3
"""
F-011 gameobject migration (Cata/Neltharion -> AC/WotLK).
Emits: gameobject_template, gameobject (spawns), gameobjectdisplayinfo DBC additions,
gameobject_loot_template. Ships available Asset Library GO models. Coord offset applied.
"""
import sqlite3, json, os, shutil
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row

DX, DY = -533.3333, -12800.0
GUID_BASE = int(os.environ.get("F011_GO_GUID","6000000"))
ZONE = os.environ.get("F011_ZONE","4720")
SFX = os.environ.get("F011_SFX","")
STOCK_GO = {1617, 1618, 1619, 1731}   # stock herbs/mining -> reuse (don't overwrite); still spawn
remap = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "item_remap.json"))).items()}
disp_paths = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "go_disp_paths%s.json" % SFX))).items()}  # missing display -> path
present_disp = set(int(l) for l in open(os.path.join(SCRATCH, "go_present_disp.txt")) if l.strip().isdigit())

gt = {int(r["entry"]): r for r in c.execute("SELECT * FROM gameobject_template")}
scope = json.load(open(os.path.join(SCRATCH, "go_scope%s.json" % SFX)))
ents = [e for e in scope["ents"] if e in gt]

def esc(v):
    if v is None: return "NULL"
    if isinstance(v, str): return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float): return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)
def gi(r, k, d=0):
    try: return int(float(r[k])) if r[k] not in (None, "") else d
    except: return d

# ---- gameobject_template (skip stock collisions) ----
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_gameobjects_01_template.sql"), "w") as f:
    f.write("-- F-011 Lost Isles gameobject_template (Cata->WotLK; Data0-23, faction/flags/questItem dropped)\n\n")
    for e in sorted(ents):
        if e in STOCK_GO: continue
        t = gt[e]
        col = {"entry": e, "type": gi(t, "type"), "displayId": gi(t, "displayId"),
               "name": (t["name"] or "").strip(), "IconName": (t["IconName"] or "").strip(),
               "castBarCaption": (t["castBarCaption"] or "").strip(), "unk1": (t["unk1"] or "").strip(),
               "size": float(t["size"] or 1)}
        for n in range(24):
            col["Data%d" % n] = gi(t, "data%d" % n)
        col.update({"AIName": "", "ScriptName": "", "VerifiedBuild": 0})
        f.write("DELETE FROM gameobject_template WHERE entry = %d;\n" % e)
        f.write("INSERT INTO gameobject_template SET " + ", ".join("`%s`=%s" % (k, esc(v)) for k, v in col.items()) + ";\n")

# ---- gameobject spawns ----
spawns = c.execute("SELECT * FROM gameobject WHERE TRIM(zone)=? ORDER BY CAST(guid AS INT)", (ZONE,)).fetchall()
spawns = [s for s in spawns if int(s["id"]) in gt]
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_gameobjects_02_spawns.sql"), "w") as f:
    f.write("-- F-011 Lost Isles gameobject spawns (map648->map1 offset, source phaseMask preserved for F-194 phasing)\n")
    f.write("-- guid block %d..%d\n\n" % (GUID_BASE, GUID_BASE + len(spawns)))
    f.write("DELETE FROM gameobject WHERE guid BETWEEN %d AND %d;\n" % (GUID_BASE, GUID_BASE + len(spawns) + 10))
    f.write("INSERT INTO gameobject (guid,id,map,zoneId,areaId,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,ScriptName,VerifiedBuild,Comment) VALUES\n")
    vals = []; g = GUID_BASE
    for s in spawns:
        g += 1
        x = float(s["position_x"]) + DX; y = float(s["position_y"]) + DY; z = float(s["position_z"])
        pmask = gi(s, "phaseMask", 1) or 1  # F-194 preserve Cata phaseMask
        vals.append("  (%d,%d,1,0,0,1,%d,%s,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,'',0,'F-011 Lost Isles')" % (
            g, int(s["id"]), pmask, esc(x), esc(y), esc(z), esc(float(s["orientation"])),
            esc(float(s["rotation0"] or 0)), esc(float(s["rotation1"] or 0)), esc(float(s["rotation2"] or 0)), esc(float(s["rotation3"] or 0)),
            gi(s, "spawntimesecs", 300), gi(s, "animprogress", 255), gi(s, "state")))
    f.write(",\n".join(vals) + ";\n")

# ---- gameobjectdisplayinfo DBC additions (69 missing) ----
needed = sorted(set(gi(gt[e], "displayId") for e in ents if gi(gt[e], "displayId") in disp_paths))
with open(os.path.join(ZPAK, "dbc/[F-011]" + SFX + "_gameobjectdisplayinfo.sql"), "w") as f:
    f.write("-- F-011 GameObjectDisplayInfo additions (client PATCH-Z; model paths from wago 4.4.2)\n\n")
    for did in needed:
        path = disp_paths[did]
        f.write("DELETE FROM gameobjectdisplayinfo WHERE id = %d;\n" % did)
        f.write("INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (%d, %s);\n" % (did, esc(path)))

# ---- ship available Asset Library GO models ----
shipped_dir = os.path.join(ZPAK, "mpq/source-assets")
ship_count = 0
for did in needed:
    rel = disp_paths[did].replace("\\", "/")
    src = os.path.join(AL, rel)
    # try exact + common case variants
    cand = src if os.path.isfile(src) else None
    if not cand:
        # case-insensitive search of the parent dir
        d = os.path.dirname(src); base = os.path.basename(src).lower()
        if os.path.isdir(d):
            for fn in os.listdir(d):
                if fn.lower() == base: cand = os.path.join(d, fn); break
    if cand:
        dst = os.path.join(shipped_dir, rel)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        if not os.path.exists(dst):
            shutil.copyfile(cand, dst); ship_count += 1
            # also copy sibling skins/blps referenced share folder? skip (M2 self-contained for doodads)

# ---- gameobject_loot_template (chest GOs, remap) ----
gl_entries = set(int(r[0]) for r in c.execute("SELECT DISTINCT TRIM(entry) FROM gameobject_loot_template"))
loot_rows = []; loot_tables = set()
for e in ents:
    if e in STOCK_GO: continue   # stock herbs/mining -> keep AC's loot, don't clobber
    t = gt[e]
    if gi(t, "type") == 3:
        lid = gi(t, "data1")
        if lid in gl_entries:
            for r in c.execute("SELECT * FROM gameobject_loot_template WHERE TRIM(entry)=?", (str(lid),)):
                mcr = int(r["mincountOrRef"] or 0)
                if mcr < 0: continue
                it = int(r["item"] or 0)
                if it <= 0: continue
                chance = float(r["ChanceOrQuestChance"] or 0)
                loot_rows.append((lid, remap.get(it, it), abs(chance), 1 if chance < 0 else 0,
                                  int(r["lootmode"] or 1), int(r["groupid"] or 0), max(mcr, 1), max(int(r["maxcount"] or 1), mcr, 1)))
                loot_tables.add(lid)
with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_gameobjects_03_loot.sql"), "w") as f:
    f.write("-- F-011 gameobject loot (chest/node GOs; custom items remapped)\n\n")
    if loot_tables:
        f.write("DELETE FROM gameobject_loot_template WHERE Entry IN (%s);\n" % ",".join(str(x) for x in sorted(loot_tables)))
        f.write("INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES\n")
        f.write(",\n".join("  (%d,%d,0,%s,%d,%d,%d,%d,%d)" % (ent, it, esc(ch), q, lm, gid, mn, mx)
                           for (ent, it, ch, q, lm, gid, mn, mx) in loot_rows) + ";\n")

print("GO templates: %d  spawns: %d  display DBC rows: %d  models shipped: %d  loot tables: %d (%d rows)" % (
    len([e for e in ents if e not in STOCK_GO]), len(spawns), len(needed), ship_count, len(loot_tables), len(loot_rows)))
print("loot table entries:", sorted(loot_tables))
