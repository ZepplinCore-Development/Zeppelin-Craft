"""gen domain: creatures.

Cata/Neltharion creature_template + spawns -> AC/WotLK. Faithful port of the
standalone Scripts/Goblin Zone Port/migrate_creatures.py onto the `zep goblin gen`
ctx API. Emits, per zone (ctx.sfx):

  sql/  creatures_01_template  (creature_template)
        creatures_02_model     (creature_template_model, one display per creature)
        creatures_03_model_info (creature_model_info, server rows for custom displays)
        creatures_04_spawns    (creature, map648->map1 offset, source phaseMask kept)
  dbc/  [F-011]<sfx>_creaturedisplayinfo / _creaturemodeldata (client PATCH-Z)

Display resolution (preserved from the source script):
  * d0 = first non-zero modelid.
  * d0 == 0                 -> fallback (TYPE_FALLBACK / 646 placeholder).
  * d0 already in 3.3.5a    -> stock, use as-is (ctx.dbc_query present-display set).
  * creature in fb_plan     -> fallback placeholder 646 (fb_plan.needmodel carries the
    "needmodel" (needmodel)         creatures a real model is retroported for later; here they get 646).
  * else                    -> ship it: add CreatureDisplayInfo + CreatureModelData
                               (from the Whitemane Cata DBCs) + server creature_model_info.

The old script decided "ship vs fallback" from a scratch shipped-model list + a local
Asset Library scan; those non-reproducible inputs are replaced by the committed
`fb_plan` fixture (fallback creatures) — everything else non-stock is shipped.
"""
import os
import struct

NAME = "creatures"

DX, DY = -533.3333, -12800.0                 # map648 -> map1 offset
ZONE = {"": "4720", "_K": "4737"}            # Lost Isles / Kezan
GUID_BASE = {"": 11000000, "_K": 12000000}   # per-zone spawn guid block
NOISE = ("bunny", "invisible stalker", "generateur", "elm general", "wondi", "purpose bunny")
STOCK_COLLIDE = {4075, 6827, 13321, 31688}   # exist in AC world -> reuse stock, spawn only
# Cata FactionTemplate IDs absent from WotLK -> remap by hostility (validated per-creature).
FACTION_REMAP = {2159: 35, 2160: 35, 2227: 35, 2231: 35, 2238: 35, 2200: 14, 2228: 14}
FACTION_FALLBACK = 35
# fallback stock displays for creatures whose model is unavailable, by creature type
TYPE_FALLBACK = {1: 646, 2: 1126, 3: 1133, 4: 802, 6: 2400, 7: 1133, 0: 646, 8: 646, 10: 646}
DEFAULT_FALLBACK = 646

DI_COLS = ["id", "model_id", "sound_id", "extended_display_info_id", "creature_model_scale",
           "creature_model_alpha", "texture_variation_1", "texture_variation_2",
           "texture_variation_3", "portrait_texture_name", "blood_level", "blood_id",
           "npc_sound_id", "praticle_color_id", "creature_geoset_data", "obj_effect_package_id"]
MD_COLS = ["id", "flags", "model_path", "size_class", "model_scale", "blood_id",
           "footprint_texture_id", "footprint_texture_length", "footprint_texture_width",
           "footprint_particle_scale", "foley_material_id", "footstep_shake_size",
           "death_thud_shake_size", "sound_data", "collision_width", "collision_height",
           "mount_height", "geo_box_min_x", "geo_box_min_y", "geo_box_min_z", "geo_box_max_x",
           "geo_box_max_y", "geo_box_max_z", "world_effect_scale", "attached_effect_scale",
           "missile_collision_radius", "missile_collision_push", "missile_collision_raise"]


def _esc(v):
    """SQL literal, matching the source script (None->NULL, trimmed float, escaped str)."""
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.6f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def _norm(p):
    return p.replace("\\", "/").lower().replace(".mdx", ".m2").lstrip("/")


def _or(v, default):
    """Emulate the source script's sqlite text columns for the `value or default` idiom.

    The old dump was loaded into sqlite as TEXT (values like " 0"), so a literal 0 was a
    truthy non-empty string and kept; the default only applied to NULL / empty. Neltharion
    here is typed MySQL, where 0 is falsy and would wrongly take the default — so restore the
    text semantics: fall through to `default` only for NULL or empty/whitespace.
    """
    if v is None:
        return default
    if isinstance(v, str) and v.strip() == "":
        return default
    return v


def _read_typed(ctx, name, nfields, strset, fltset):
    """Read a Whitemane DBC into {id: [field values]} using the source script's field map.

    ctx.read_wdbc yields records as raw uint32 tuples; reinterpret string fields via the
    string block, float fields as IEEE-754, and everything else as signed int32 — the
    16-field CreatureDisplayInfo / 28-field CreatureModelData layout the port expects.
    """
    recs, get_string = ctx.read_wdbc(ctx.whitemane_dbc(name))
    out = {}
    for r in recs:
        vals = []
        for f in range(nfields):
            u = r[f]
            if f in strset:
                vals.append(get_string(u))
            elif f in fltset:
                vals.append(struct.unpack("<f", struct.pack("<I", u))[0])
            else:
                vals.append(u - (1 << 32) if u >= (1 << 31) else u)
        out[vals[0]] = vals
    return out


def _valid_faction_ids():
    """FactionTemplate.dbc row IDs (field 0) — factions the server can resolve."""
    path = os.path.join(os.getenv("SERVER_DBC_PATH", "/workspace/project/data/dbc"),
                        "FactionTemplate.dbc")
    try:
        d = open(path, "rb").read()
        rc = struct.unpack("<I", d[4:8])[0]
        rs = struct.unpack("<I", d[12:16])[0]
        return {struct.unpack_from("<I", d, 20 + i * rs)[0] for i in range(rc)}
    except Exception:
        return set()


def emit(ctx):
    sfx = ctx.sfx
    zone = ZONE[sfx]
    guid_base = GUID_BASE[sfx]

    present_disp = {int(r["id"]) for r in ctx.dbc_query("SELECT id FROM creaturedisplayinfo")}
    valid_factions = _valid_faction_ids()
    disp = _read_typed(ctx, "CreatureDisplayInfo.dbc", 16, {6, 7, 8, 9}, {4})
    mdl = _read_typed(ctx, "CreatureModelData.dbc", 28, {2},
                      {4, 7, 8, 9, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27})
    fb = ctx.fixture("fb_plan")
    needmodel = {int(r[0]) for r in fb["needmodel"]}   # retroported later -> placeholder 646 now

    tmpl = {int(r["entry"]): r for r in ctx.q("SELECT * FROM creature_template")}
    ents = [int(r["id"]) for r in
            ctx.q("SELECT DISTINCT TRIM(id) AS id FROM creature WHERE TRIM(zone)=%s", (zone,))]
    real = [e for e in ents
            if e in tmpl and not any(k in (tmpl[e]["name"] or "").lower() for k in NOISE)]
    real_set = set(real)
    entries_sorted = sorted(real)

    # ---- resolve display per entry ----
    disp_plan = {}          # entry -> final display id
    dbc_disp_needed = {}    # display_id -> displayinfo row
    dbc_mdl_needed = {}     # model_id  -> modeldata row (possibly _HD-stripped)
    model_info_needed = {}  # display_id -> (bounding, reach)

    for e in real:
        t = tmpl[e]
        d0 = 0
        for k in ("modelid1", "modelid2", "modelid3", "modelid4"):
            v = t[k]
            if v and str(v).strip() not in ("0", ""):
                d0 = int(v)
                break
        final = d0
        force_default = False
        if d0 == 0:
            status = "fallback"
        elif d0 in present_disp:
            status = "stock"
        elif e in needmodel:
            status = "fallback"
            force_default = True          # fb_plan placeholder -> 646 (retroport wires the real one)
        else:
            di = disp.get(d0)
            mrow = mdl.get(di[1]) if di else None
            if di is None or mrow is None:
                status = "fallback"
            else:
                status = "shipped"
                di = di[:]
                mrow = mrow[:]
                if mrow[2] and "_hd" in _norm(mrow[2]):
                    import re
                    mrow[2] = re.sub(r"(?i)_hd", "", mrow[2])   # _HD model -> its stock base path
                model_id = di[1]
                dbc_disp_needed[d0] = di
                dbc_mdl_needed[model_id] = mrow
                scale = di[4] or 1.0
                cw = mrow[14] or 0.0
                ch = mrow[15] or 0.0
                model_info_needed[d0] = (round((cw * scale) or 0.306, 4),
                                         round((ch * scale) or 1.5, 4))
        if status == "fallback":
            if force_default:
                final = DEFAULT_FALLBACK
            else:
                final = TYPE_FALLBACK.get(int(t["type"] or 0), DEFAULT_FALLBACK)
                if final not in present_disp:
                    final = DEFAULT_FALLBACK
        disp_plan[e] = final

    # ---- creature_template ----
    b = ["-- F-011 Lost Isles creatures - creature_template (Cata->AC translation)",
         "-- %d creatures. Owned custom rows: DELETE+INSERT (final state).\n" % len(entries_sorted)]
    for e in entries_sorted:
        t = tmpl[e]
        exp = min(int(t["exp"] or 0), 2)
        faction = int(t["faction_A"] or 0) or int(t["faction_H"] or 0)
        faction = FACTION_REMAP.get(faction, faction)
        if valid_factions and faction not in valid_factions:
            faction = FACTION_FALLBACK
        mtype = int(t["MovementType"] or 0)
        if mtype == 2:
            mtype = 0                      # waypoint -> idle (no waypoints imported yet)
        cols = {
            "entry": e, "difficulty_entry_1": 0, "difficulty_entry_2": 0, "difficulty_entry_3": 0,
            "KillCredit1": int(t["KillCredit1"] or 0), "KillCredit2": int(t["KillCredit2"] or 0),
            "name": (t["name"] or "").strip(), "subname": (t["subname"] or "").strip() or None,
            "IconName": (t["IconName"] or "").strip() or None,
            "gossip_menu_id": int(t["gossip_menu_id"] or 0),
            "minlevel": int(_or(t["minlevel"], 1)), "maxlevel": int(_or(t["maxlevel"], 1)),
            "exp": exp, "faction": faction, "npcflag": int(t["npcflag"] or 0),
            "speed_walk": float(_or(t["speed_walk"], 1)), "speed_run": float(_or(t["speed_run"], 1.14286)),
            "speed_swim": float(_or(t["speed_swim"], 1)), "speed_flight": float(_or(t["speed_fly"], 1)),
            "detection_range": 18.0, "rank": int(t["rank"] or 0),
            "dmgschool": int(t["dmgschool"] or 0), "DamageModifier": float(_or(t["dmg_multiplier"], 1)),
            "BaseAttackTime": int(_or(t["baseattacktime"], 2000)),
            "RangeAttackTime": int(_or(t["rangeattacktime"], 2000)),
            "BaseVariance": 1.0, "RangeVariance": 1.0,
            "unit_class": int(_or(t["unit_class"], 1)), "unit_flags": int(t["unit_flags"] or 0),
            "unit_flags2": int(t["unit_flags2"] or 0), "dynamicflags": int(t["dynamicflags"] or 0),
            "family": int(t["family"] or 0), "type": int(t["type"] or 0),
            "type_flags": int(t["type_flags"] or 0),
            "lootid": 0, "pickpocketloot": 0, "skinloot": 0,
            "PetSpellDataId": int(t["PetSpellDataId"] or 0), "VehicleId": int(t["VehicleId"] or 0),
            "mingold": int(t["mingold"] or 0), "maxgold": int(t["maxgold"] or 0),
            "AIName": "", "MovementType": mtype, "HoverHeight": float(_or(t["HoverHeight"], 1)),
            "HealthModifier": float(_or(t["Health_mod"], 1)), "ManaModifier": float(_or(t["Mana_mod"], 1)),
            "ArmorModifier": float(_or(t["Armor_mod"], 1)), "ExperienceModifier": 1.0,
            "RacialLeader": int(t["RacialLeader"] or 0), "movementId": 0,
            "RegenHealth": int(_or(t["RegenHealth"], 1)), "CreatureImmunitiesId": 0,
            "flags_extra": 0, "ScriptName": "", "VerifiedBuild": 0,
        }
        b.append("DELETE FROM creature_template WHERE entry = %d;" % e)
        b.append("INSERT INTO creature_template SET")
        b.append(",\n".join("  `%s` = %s" % (k, _esc(v)) for k, v in cols.items()) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_creatures_01_template.sql" % sfx, "\n".join(b) + "\n")

    # ---- creature_template_model ----
    b = ["-- F-011 creature_template_model (display per creature)\n"]
    for e in entries_sorted:
        t = tmpl[e]
        b.append("DELETE FROM creature_template_model WHERE CreatureID = %d;" % e)
        b.append("INSERT INTO creature_template_model "
                 "(CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES")
        b.append("  (%d,0,%d,%s,1,0);\n" % (e, disp_plan[e], _esc(float(_or(t["scale"], 1)))))
    ctx.write("sql/zz_[AUTO,F-011]%s_creatures_02_model.sql" % sfx, "\n".join(b) + "\n")

    # ---- server creature_model_info (custom displays) ----
    b = ["-- F-011 creature_model_info (server, custom/non-stock displays)\n"]
    if model_info_needed:
        ids = ",".join(str(d) for d in sorted(model_info_needed))
        b.append("DELETE FROM creature_model_info WHERE DisplayID IN (%s);" % ids)
        b.append("INSERT INTO creature_model_info "
                 "(DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES")
        b.append(",\n".join("  (%d,%s,%s,2,0,0)" % (d, _esc(br), _esc(cr))
                            for d, (br, cr) in sorted(model_info_needed.items())) + ";")
    ctx.write("sql/zz_[AUTO,F-011]%s_creatures_03_model_info.sql" % sfx, "\n".join(b) + "\n")

    # ---- spawns ----
    spawns = ctx.q("SELECT * FROM creature WHERE TRIM(zone)=%s ORDER BY CAST(guid AS UNSIGNED)", (zone,))
    spawns = [s for s in spawns if int(s["id"]) in real_set or int(s["id"]) in STOCK_COLLIDE]
    b = ["-- F-011 Lost Isles creature spawns (map648->map1 offset, source phaseMask preserved for F-194 phasing)",
         "-- guid block %d..%d\n" % (guid_base, guid_base + len(spawns)),
         "DELETE FROM creature WHERE guid BETWEEN %d AND %d;" % (guid_base, guid_base + len(spawns) + 10),
         "INSERT INTO creature (guid,id,map,zoneId,areaId,spawnMask,phaseMask,equipment_id,"
         "position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,currentwaypoint,"
         "curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags,ScriptName,VerifiedBuild,"
         "CreateObject,Comment) VALUES"]
    vals = []
    g = guid_base
    for s in spawns:
        g += 1
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        z = float(s["position_z"])
        o = float(s["orientation"])
        mt = int(s["MovementType"] or 0)
        if mt == 2:
            mt = 0
        wd = float(s["spawndist"] or 0)
        st = int(s["spawntimesecs"] or 120)
        pmask = int(s["phaseMask"] or 1) or 1
        vals.append("  (%d,%d,1,0,0,1,%d,0,%s,%s,%s,%s,%d,%s,0,1,0,%d,0,0,0,'',0,1,'F-011 Lost Isles')" % (
            g, int(s["id"]), pmask, _esc(x), _esc(y), _esc(z), _esc(o), st, _esc(wd), mt))
    b.append(",\n".join(vals) + ";")
    ctx.write("sql/zz_[AUTO,F-011]%s_creatures_04_spawns.sql" % sfx, "\n".join(b) + "\n")

    # ---- DBC additions (client PATCH-Z) ----
    b = ["-- F-011 CreatureModelData additions (client PATCH-Z)\n"]
    for mid in sorted(dbc_mdl_needed):
        b.append("DELETE FROM creaturemodeldata WHERE id = %d;" % mid)
        b.append("INSERT INTO creaturemodeldata (%s) VALUES (%s);" % (
            ",".join(MD_COLS), ",".join(_esc(v) for v in dbc_mdl_needed[mid])))
    ctx.write("dbc/[AUTO,F-011]%s_creaturemodeldata.sql" % sfx, "\n".join(b) + "\n\n")

    b = ["-- F-011 CreatureDisplayInfo additions (client PATCH-Z)\n"]
    for did in sorted(dbc_disp_needed):
        b.append("DELETE FROM creaturedisplayinfo WHERE id = %d;" % did)
        b.append("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);" % (
            ",".join(DI_COLS), ",".join(_esc(v) for v in dbc_disp_needed[did])))
    ctx.write("dbc/[AUTO,F-011]%s_creaturedisplayinfo.sql" % sfx, "\n".join(b) + "\n\n")

    return ("creatures=%d spawns=%d dbc_disp=%d dbc_mdl=%d model_info=%d" %
            (len(entries_sorted), len(spawns), len(dbc_disp_needed),
             len(dbc_mdl_needed), len(model_info_needed)))
