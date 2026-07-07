#!/usr/bin/env python3
"""
F-011 Goblin Zone — creatures + spawns migration (Cata/Neltharion -> AC/WotLK).

Emits (into the zep-goblin-start zpak):
  sql/  creature_template, creature_template_model, creature_model_info, creature (spawns)
  dbc/  creaturedisplayinfo + creaturemodeldata additions (non-stock displays) -> PATCH-Z
  _model_ship.json  list of Asset Library .m2 folders to ship (assetlib bucket)

Isolated: reads local SQLite + Modern Client DBCs; writes files only.
"""
import struct, json, os, sqlite3, sys, math

SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
MC = "/workspace/project/Zeppelin-Craft/archive/DBC/Modern Client"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
DBSRC = os.path.join(SCRATCH, "neltharion.sqlite")

DX, DY = -533.3333, -12800.0          # map648 -> map1 offset
GUID_BASE = int(os.environ.get("F011_CRE_GUID", "11000000"))  # spawn guid block
ZONE = os.environ.get("F011_ZONE", "4720")
SFX = os.environ.get("F011_SFX", "")   # "" for Lost Isles, "_K" for Kezan
NOISE = ('bunny', 'invisible stalker', 'generateur', 'elm general', 'wondi', 'purpose bunny')
STOCK_COLLIDE = {4075, 6827, 13321, 31688}   # exist in AC world -> reuse stock, spawn only
# Cata FactionTemplate IDs absent from WotLK -> remap by hostility (validated per-creature).
# friendly goblin/Horde NPCs -> 35 (friendly to all); hostile mobs -> 14 (Monster).
FACTION_REMAP = {2159: 35, 2160: 35, 2227: 35, 2231: 35, 2238: 35, 2200: 14, 2228: 14}
FACTION_FALLBACK = 35   # any Cata faction with no FactionTemplate.dbc row -> friendly (invalid faction segfaults, esp. on vehicles)
SPAWN_DEDUP_GRID = 3.0  # Cata phaseMask is flattened to 1; dedupe same-entry spawns within this many yards (phase-variant stacking)

def _valid_faction_ids():
    """FactionTemplate.dbc row IDs (field 0) — factions the server can resolve."""
    try:
        d = open("/workspace/project/data/dbc/FactionTemplate.dbc", "rb").read()
        rc = struct.unpack("<I", d[4:8])[0]; rs = struct.unpack("<I", d[12:16])[0]
        return {struct.unpack_from("<I", d, 20 + i * rs)[0] for i in range(rc)}
    except Exception:
        return set()
VALID_FACTIONS = _valid_faction_ids()
# fallback stock displays for creatures whose model is unavailable, by creature type
TYPE_FALLBACK = {1: 646, 2: 1126, 3: 1133, 4: 802, 6: 2400, 7: 1133, 0: 646, 8: 646, 10: 646}
DEFAULT_FALLBACK = 646

# ---------- DBC readers ----------
def read_dbc(path):
    d = open(path, "rb").read()
    rc, fc, rs, ss = struct.unpack("<4I", d[4:20])
    sb = 20 + rc * rs
    def s(off):
        e = d.index(b"\0", sb + off); return d[sb + off:e].decode("latin1")
    return d, rc, rs, s

def load_displayinfo():
    d, rc, rs, s = read_dbc(os.path.join(MC, "CreatureDisplayInfo.dbc"))
    STR = {6, 7, 8, 9}; FLT = {4}
    rows = {}
    for i in range(rc):
        b = 20 + i * rs
        vals = []
        for f in range(16):
            raw = d[b + f*4: b + f*4 + 4]
            if f in STR:
                vals.append(s(struct.unpack("<I", raw)[0]))
            elif f in FLT:
                vals.append(struct.unpack("<f", raw)[0])
            else:
                vals.append(struct.unpack("<i", raw)[0])
        rows[vals[0]] = vals
    return rows

def load_modeldata():
    d, rc, rs, s = read_dbc(os.path.join(MC, "CreatureModelData.dbc"))
    STR = {2}
    FLT = {4, 7, 8, 9, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}
    rows = {}
    for i in range(rc):
        b = 20 + i * rs
        vals = []
        for f in range(28):
            raw = d[b + f*4: b + f*4 + 4]
            if f in STR:
                vals.append(s(struct.unpack("<I", raw)[0]))
            elif f in FLT:
                vals.append(struct.unpack("<f", raw)[0])
            else:
                vals.append(struct.unpack("<i", raw)[0])
        rows[vals[0]] = vals
    return rows

# ---------- helpers ----------
def esc(v):
    if v is None: return "NULL"
    if isinstance(v, str): return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float): return ("%.6f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)

def norm(p):
    return p.replace("\\", "/").lower().replace(".mdx", ".m2").lstrip("/")

def main():
    present_disp = set(int(l) for l in open(os.path.join(SCRATCH, "present_disp.txt")) if l.strip().isdigit())
    shipped = set(l.strip() for l in open(os.path.join(SCRATCH, "shipped_m2.txt")))
    disp = load_displayinfo()
    mdl = load_modeldata()

    con = sqlite3.connect(DBSRC); con.row_factory = sqlite3.Row
    tmpl = {int(r["entry"]): r for r in con.execute("SELECT * FROM creature_template")}

    # real entries spawned in the zone
    ents = [int(r[0]) for r in con.execute(
        "SELECT DISTINCT TRIM(id) FROM creature WHERE TRIM(zone)=?", (ZONE,))]
    real = [e for e in ents if e in tmpl and not any(k in (tmpl[e]["name"] or "").lower() for k in NOISE)]
    real_set = set(real)

    # ---- resolve display per entry ----
    # returns (final_display, needs_dbc_row, model_path_override_or_None, ship_folder_or_None)
    def al_folder_for(path):
        # path like creature/pygmy/pygmyshaman.m2 -> Asset Library creature/pygmy dir if file exists
        parts = path.split("/")
        if len(parts) >= 3 and parts[0] == "creature":
            fdir = os.path.join(AL, "creature", parts[1])
            fpath = os.path.join(fdir, parts[-1])
            if os.path.isfile(fpath):
                return os.path.join("creature", parts[1])
        # direct file check anywhere under AL
        cand = os.path.join(AL, path)
        if os.path.isfile(cand):
            return os.path.dirname(path)
        return None

    disp_plan = {}   # entry -> dict
    dbc_disp_needed = {}   # display_id -> displayinfo row (possibly path-rewritten model)
    dbc_mdl_needed = {}    # model_id -> modeldata row
    model_info_needed = {} # display_id -> (bounding, reach)
    ship_folders = set()

    for e in real:
        t = tmpl[e]
        d0 = 0
        for k in ("modelid1", "modelid2", "modelid3", "modelid4"):
            v = t[k]
            if v and str(v).strip() not in ("0", ""):
                d0 = int(v); break
        status = "none"; final = d0; mpath = None; ship = None
        if d0 == 0:
            final = DEFAULT_FALLBACK; status = "fallback-nomodel"
        elif d0 in present_disp:
            status = "stock"
        else:
            di = disp.get(d0)
            mrow = mdl.get(di[1]) if di else None
            path = norm(mrow[2]) if (mrow and mrow[2]) else ""
            if path and "_hd" in path:
                nonhd = path.replace("_hd", "")
                if nonhd in shipped:
                    import re
                    status = "hd->stock"
                    mpath = re.sub(r'(?i)_hd', '', mrow[2])   # original backslash format, _HD stripped
                elif path in shipped:
                    status = "shipped"
                else:
                    status = "check"
            if status in ("none",):
                if path and path in shipped:
                    status = "shipped"
                elif path:
                    folder = al_folder_for(path)
                    if folder:
                        status = "assetlib"; ship = folder
                    else:
                        status = "fallback"
                else:
                    status = "fallback"
            if status == "check":  # _hd but neither present; try assetlib/shipped/fallback
                if path in shipped: status = "shipped"
                else:
                    folder = al_folder_for(path)
                    if folder: status = "assetlib"; ship = folder
                    else: status = "fallback"

        if status.startswith("fallback"):
            final = TYPE_FALLBACK.get(int(t["type"] or 0), DEFAULT_FALLBACK)
            # ensure fallback display is actually stock; if not, use default
            if final not in present_disp:
                final = DEFAULT_FALLBACK
        elif status in ("shipped", "assetlib", "hd->stock"):
            # need to add DBC rows for d0 (and its model), server model_info
            di = disp[d0][:]  # copy 16 fields
            model_id = di[1]
            mrow = mdl.get(model_id)
            if mrow is None:
                final = DEFAULT_FALLBACK; status = "fallback-nomdl"
            else:
                mrow = mrow[:]
                if mpath:  # hd->stock path rewrite
                    mrow[2] = mpath
                dbc_disp_needed[d0] = di
                dbc_mdl_needed[model_id] = mrow
                # server model_info: bounding/reach from collision * scale
                scale = di[4] or 1.0
                cw = mrow[14] or 0.0; ch = mrow[15] or 0.0
                br = round((cw * scale) or 0.306, 4)
                cr = round((ch * scale) or 1.5, 4)
                model_info_needed[d0] = (br, cr)
                if ship: ship_folders.add(ship)
        disp_plan[e] = {"final": final, "status": status}

    # ---- write creature_template ----
    def W(name):
        return open(os.path.join(ZPAK, name), "w")

    entries_sorted = sorted(real)
    with W("sql/zz_[F-011]" + SFX + "_creatures_01_template.sql") as f:
        f.write("-- F-011 Lost Isles creatures — creature_template (Cata->AC translation)\n")
        f.write("-- %d creatures. Owned custom rows: DELETE+INSERT (final state).\n\n" % len(entries_sorted))
        for e in entries_sorted:
            t = tmpl[e]
            exp = min(int(t["exp"] or 0), 2)
            faction = int(t["faction_A"] or 0) or int(t["faction_H"] or 0)
            faction = FACTION_REMAP.get(faction, faction)
            if VALID_FACTIONS and faction not in VALID_FACTIONS:
                faction = FACTION_FALLBACK   # unremapped Cata faction (no DBC row) -> avoid null-deref crash
            mtype = int(t["MovementType"] or 0)
            if mtype == 2: mtype = 0   # waypoint -> idle (no waypoints imported yet)
            cols = {
                "entry": e, "difficulty_entry_1": 0, "difficulty_entry_2": 0, "difficulty_entry_3": 0,
                "KillCredit1": int(t["KillCredit1"] or 0), "KillCredit2": int(t["KillCredit2"] or 0),
                "name": (t["name"] or "").strip(), "subname": (t["subname"] or "").strip() or None,
                "IconName": (t["IconName"] or "").strip() or None,
                "gossip_menu_id": int(t["gossip_menu_id"] or 0),
                "minlevel": int(t["minlevel"] or 1), "maxlevel": int(t["maxlevel"] or 1),
                "exp": exp, "faction": faction, "npcflag": int(t["npcflag"] or 0),
                "speed_walk": float(t["speed_walk"] or 1), "speed_run": float(t["speed_run"] or 1.14286),
                "speed_swim": float(t["speed_swim"] or 1), "speed_flight": float(t["speed_fly"] or 1),
                "detection_range": 18.0, "rank": int(t["rank"] or 0),
                "dmgschool": int(t["dmgschool"] or 0), "DamageModifier": float(t["dmg_multiplier"] or 1),
                "BaseAttackTime": int(t["baseattacktime"] or 2000), "RangeAttackTime": int(t["rangeattacktime"] or 2000),
                "BaseVariance": 1.0, "RangeVariance": 1.0,
                "unit_class": int(t["unit_class"] or 1), "unit_flags": int(t["unit_flags"] or 0),
                "unit_flags2": int(t["unit_flags2"] or 0), "dynamicflags": int(t["dynamicflags"] or 0),
                "family": int(t["family"] or 0), "type": int(t["type"] or 0), "type_flags": int(t["type_flags"] or 0),
                "lootid": 0, "pickpocketloot": 0, "skinloot": 0,
                "PetSpellDataId": int(t["PetSpellDataId"] or 0), "VehicleId": int(t["VehicleId"] or 0),
                "mingold": int(t["mingold"] or 0), "maxgold": int(t["maxgold"] or 0),
                "AIName": "", "MovementType": mtype, "HoverHeight": float(t["HoverHeight"] or 1),
                "HealthModifier": float(t["Health_mod"] or 1), "ManaModifier": float(t["Mana_mod"] or 1),
                "ArmorModifier": float(t["Armor_mod"] or 1), "ExperienceModifier": 1.0,
                "RacialLeader": int(t["RacialLeader"] or 0), "movementId": 0,
                "RegenHealth": int(t["RegenHealth"] or 1), "CreatureImmunitiesId": 0,
                "flags_extra": 0, "ScriptName": "", "VerifiedBuild": 0,
            }
            f.write("DELETE FROM creature_template WHERE entry = %d;\n" % e)
            f.write("INSERT INTO creature_template SET\n")
            f.write(",\n".join("  `%s` = %s" % (k, esc(v)) for k, v in cols.items()))
            f.write(";\n\n")

    # ---- creature_template_model ----
    with W("sql/zz_[F-011]" + SFX + "_creatures_02_model.sql") as f:
        f.write("-- F-011 creature_template_model (display per creature)\n\n")
        for e in entries_sorted:
            t = tmpl[e]
            f.write("DELETE FROM creature_template_model WHERE CreatureID = %d;\n" % e)
            f.write("INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES\n")
            f.write("  (%d,0,%d,%s,1,0);\n\n" % (e, disp_plan[e]["final"], esc(float(t["scale"] or 1))))

    # ---- server creature_model_info (custom displays) ----
    with W("sql/zz_[F-011]" + SFX + "_creatures_03_model_info.sql") as f:
        f.write("-- F-011 creature_model_info (server, custom/non-stock displays)\n\n")
        if model_info_needed:
            ids = ",".join(str(d) for d in sorted(model_info_needed))
            f.write("DELETE FROM creature_model_info WHERE DisplayID IN (%s);\n" % ids)
            f.write("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES\n")
            rows = ["  (%d,%s,%s,2,0,0)" % (d, esc(br), esc(cr)) for d, (br, cr) in sorted(model_info_needed.items())]
            f.write(",\n".join(rows) + ";\n")

    # ---- spawns ----
    spawns = con.execute("""SELECT * FROM creature WHERE TRIM(zone)=? ORDER BY CAST(guid AS INT)""", (ZONE,)).fetchall()
    spawns = [s for s in spawns if int(s["id"]) in real_set or int(s["id"]) in STOCK_COLLIDE]
    with W("sql/zz_[F-011]" + SFX + "_creatures_04_spawns.sql") as f:
        f.write("-- F-011 Lost Isles creature spawns (map648->map1 offset, source phaseMask preserved for F-194 phasing)\n")
        f.write("-- guid block %d..%d\n\n" % (GUID_BASE, GUID_BASE + len(spawns)))
        f.write("DELETE FROM creature WHERE guid BETWEEN %d AND %d;\n" % (GUID_BASE, GUID_BASE + len(spawns) + 10))
        f.write("INSERT INTO creature (guid,id,map,zoneId,areaId,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags,ScriptName,VerifiedBuild,CreateObject,Comment) VALUES\n")
        vals = []
        g = GUID_BASE
        for s in spawns:
            g += 1
            x = float(s["position_x"]) + DX
            y = float(s["position_y"]) + DY
            z = float(s["position_z"])
            o = float(s["orientation"])
            mt = int(s["MovementType"] or 0)
            if mt == 2: mt = 0
            wd = float(s["spawndist"] or 0)
            st = int(s["spawntimesecs"] or 120)
            # F-194: preserve the source Cata phaseMask so PhaseMgr shows the right world-state
            # per quest progress (no flatten, no dedupe — the phase-variants are separated by phase).
            pmask = int(s["phaseMask"] or 1) or 1
            vals.append("  (%d,%d,1,0,0,1,%d,0,%s,%s,%s,%s,%d,%s,0,1,0,%d,0,0,0,'',0,1,'F-011 Lost Isles')" % (
                g, int(s["id"]), pmask, esc(x), esc(y), esc(z), esc(o), st, esc(wd), mt))
        f.write(",\n".join(vals) + ";\n")
        print("  spawns written: %d (source phaseMask preserved for F-194 phasing)" % len(vals))

    # ---- DBC additions ----
    DI_COLS = ["id","model_id","sound_id","extended_display_info_id","creature_model_scale","creature_model_alpha",
               "texture_variation_1","texture_variation_2","texture_variation_3","portrait_texture_name",
               "blood_level","blood_id","npc_sound_id","praticle_color_id","creature_geoset_data","obj_effect_package_id"]
    MD_COLS = ["id","flags","model_path","size_class","model_scale","blood_id","footprint_texture_id",
               "footprint_texture_length","footprint_texture_width","footprint_particle_scale","foley_material_id",
               "footstep_shake_size","death_thud_shake_size","sound_data","collision_width","collision_height",
               "mount_height","geo_box_min_x","geo_box_min_y","geo_box_min_z","geo_box_max_x","geo_box_max_y",
               "geo_box_max_z","world_effect_scale","attached_effect_scale","missile_collision_radius",
               "missile_collision_push","missile_collision_raise"]
    with open(os.path.join(ZPAK, "dbc/[F-011]" + SFX + "_creaturemodeldata.sql"), "w") as f:
        f.write("-- F-011 CreatureModelData additions (client PATCH-Z)\n\n")
        for mid in sorted(dbc_mdl_needed):
            r = dbc_mdl_needed[mid]
            f.write("DELETE FROM creaturemodeldata WHERE id = %d;\n" % mid)
            f.write("INSERT INTO creaturemodeldata (%s) VALUES (%s);\n" % (
                ",".join(MD_COLS), ",".join(esc(v) for v in r)))
        f.write("\n")
    with open(os.path.join(ZPAK, "dbc/[F-011]" + SFX + "_creaturedisplayinfo.sql"), "w") as f:
        f.write("-- F-011 CreatureDisplayInfo additions (client PATCH-Z)\n\n")
        for did in sorted(dbc_disp_needed):
            r = dbc_disp_needed[did]
            f.write("DELETE FROM creaturedisplayinfo WHERE id = %d;\n" % did)
            f.write("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (
                ",".join(DI_COLS), ",".join(esc(v) for v in r)))
        f.write("\n")

    json.dump(sorted(ship_folders), open(os.path.join(ZPAK, "_model_ship" + SFX + ".json"), "w"), indent=0)

    # ---- summary ----
    from collections import Counter
    stc = Counter(p["status"] for p in disp_plan.values())
    print("creatures: %d   spawns: %d" % (len(entries_sorted), len(spawns)))
    print("display status:", dict(stc))
    print("DBC displays added: %d   modeldata added: %d   server model_info: %d" % (
        len(dbc_disp_needed), len(dbc_mdl_needed), len(model_info_needed)))
    print("asset-library model folders to ship: %d -> %s" % (len(ship_folders), sorted(ship_folders)))

if __name__ == "__main__":
    main()
