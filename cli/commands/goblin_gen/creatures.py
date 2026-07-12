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
import importlib.util

NAME = "creatures"
TABLES = ["creature_template", "creature_template_model", "creature",
          "creature_model_info", "creaturemodeldata", "creaturedisplayinfo"]
TIER = "base"


def _sibling_const(modname, attr):
    """Read a constant from a sibling gen-domain module (single source of truth)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return getattr(mod, attr)

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
# STOCK CreatureModelData rows we INTENTIONALLY override with the Cata (Whitemane)
# retune: goblin-zone displays use these models and the Cata meshes/values are the
# shipped state (831/832 = HD goblin char models the playable worgoblin race uses).
# Any other stock model id is never re-emitted — the Whitemane copy would clobber
# the client's own model data (e.g. 49 HumanMale) for every creature that uses it.
RETUNE_STOCK_MODELS = {611, 831, 832, 2353, 2354, 2923}
# Cata cursor IconNames absent from the 3.3.5a client -> valid 3.3.5a equivalents.
# An unknown IconName makes the client blank the mouseover cursor (I-234: Defiant Troll
# 'openhandglow' -> no hover cursor). 'Interact' is the 3.3.5a gear/cog "use" cursor
# (same as doors/gameobjects) — the closest fit to Cata's open-hand interact glow.
ICONNAME_MAP = {"openhandglow": "Interact"}

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

    # STOCK display/model sets (pristine original_dbc, never the live/edited dbc) so
    # ship-vs-stock classification is deterministic and independent of apply state.
    present_disp = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM creaturedisplayinfo")}
    present_mdl = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM creaturemodeldata")}
    valid_factions = _valid_faction_ids()
    disp = _read_typed(ctx, "CreatureDisplayInfo.dbc", 16, {6, 7, 8, 9}, {4})
    mdl = _read_typed(ctx, "CreatureModelData.dbc", 28, {2},
                      {4, 7, 8, 9, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27})
    fb = ctx.fixture("fb_plan")
    needmodel = {int(r[0]) for r in fb["needmodel"]}   # retroported later -> placeholder 646 now
    # Creatures whose displays are CURATED by the fallback overlay domains (bake
    # clamps / retroports): keep the 646 placeholder here, they repoint via overlay.
    curated = set(_sibling_const("fallback646", "GHOUL_FALLBACK"))
    curated.add(_sibling_const("faceless", "CREATURE"))
    needmodel |= curated

    tmpl = {int(r["entry"]): r for r in ctx.q("SELECT * FROM creature_template")}
    ents = [int(r["id"]) for r in
            ctx.q("SELECT DISTINCT TRIM(id) AS id FROM creature WHERE TRIM(zone)=%s", (zone,))]
    # e < 1000000: Neltharion donor dev/test NPCs use placeholder/leet entries
    # (1234567 Gnomey, 1337016 XP Rates) — never real Cata content (I-233).
    real = [e for e in ents
            if e in tmpl and e < 1000000
            and not any(k in (tmpl[e]["name"] or "").lower() for k in NOISE)]
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
                # never re-emit a STOCK model row (the Whitemane copy would
                # overwrite the client's own char/creature model data) unless
                # it is a curated Cata retune we ship the mesh for
                if model_id not in present_mdl or model_id in RETUNE_STOCK_MODELS:
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
            "IconName": (lambda s: ICONNAME_MAP.get(s, s) or None)((t["IconName"] or "").strip()),
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
            "AIName": (t["AIName"] or "").strip(),   # carry source AI (mostly 'SmartAI') — blank = SmartAI never runs, scripts dead
            "MovementType": mtype, "HoverHeight": float(_or(t["HoverHeight"], 1)),
            "HealthModifier": float(_or(t["Health_mod"], 1)), "ManaModifier": float(_or(t["Mana_mod"], 1)),
            "ArmorModifier": float(_or(t["Armor_mod"], 1)), "ExperienceModifier": 1.0,
            "RacialLeader": int(t["RacialLeader"] or 0), "movementId": 0,
            "RegenHealth": int(_or(t["RegenHealth"], 1)), "CreatureImmunitiesId": 0,
            "flags_extra": 0, "ScriptName": "", "VerifiedBuild": 0,
        }
        ctx.col.put("creature_template", e, cols, tier="base", zone=sfx, owner="creatures")

    # ---- creature_template_model ----
    for e in entries_sorted:
        t = tmpl[e]
        ctx.col.put("creature_template_model", e, {
            "CreatureID": e, "Idx": 0, "CreatureDisplayID": disp_plan[e],
            "DisplayScale": float(_or(t["scale"], 1)), "Probability": 1, "VerifiedBuild": 0,
        }, tier="base", zone=sfx, owner="creatures")

    # ---- server creature_model_info (custom displays) ----
    for d, (br, cr) in model_info_needed.items():
        ctx.col.put("creature_model_info", d, {
            "DisplayID": d, "BoundingRadius": br, "CombatReach": cr,
            "Gender": 2, "DisplayID_Other_Gender": 0, "VerifiedBuild": 0,
        }, tier="base", zone=sfx, owner="creatures")

    # ---- spawns ----
    spawns = ctx.q("SELECT * FROM creature WHERE TRIM(zone)=%s ORDER BY CAST(guid AS UNSIGNED)", (zone,))
    spawns = [s for s in spawns if int(s["id"]) in real_set or int(s["id"]) in STOCK_COLLIDE]
    # Fixed per-zone 1,000,000-guid block DELETE (stable, count-independent), so stale
    # spawns beyond the current count are always cleared. (equipment_id patched by equipment.py)
    ctx.col.delete("creature", "guid BETWEEN %d AND %d" % (guid_base, guid_base + 999999))
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
        ctx.col.add("creature", {
            "guid": g, "id": int(s["id"]), "map": 1, "zoneId": 0, "areaId": 0, "spawnMask": 1,
            "phaseMask": pmask, "equipment_id": 0, "position_x": x, "position_y": y,
            "position_z": z, "orientation": o, "spawntimesecs": st, "wander_distance": wd,
            "currentwaypoint": 0, "curhealth": 1, "curmana": 0, "MovementType": mt, "npcflag": 0,
            "unit_flags": 0, "dynamicflags": 0, "ScriptName": "", "VerifiedBuild": 0,
            "CreateObject": 1, "Comment": "F-011 %s" % ("Kezan" if sfx else "Lost Isles"),
        }, sort_key=g)

    # ---- DBC additions (client PATCH-Z) ----
    for mid, vals in dbc_mdl_needed.items():
        # negative int sentinels (e.g. blood_id -1) -> unsigned, matching how the
        # stock DBC stores them (columns are int unsigned; floats stay signed)
        cols = {k: (v & 0xFFFFFFFF if isinstance(v, int) and v < 0 else v)
                for k, v in zip(MD_COLS, vals)}
        ctx.col.put("creaturemodeldata", mid, cols,
                    tier="base", zone=sfx, owner="creatures")
    for did, vals in dbc_disp_needed.items():
        ctx.col.put("creaturedisplayinfo", did, dict(zip(DI_COLS, vals)),
                    tier="base", zone=sfx, owner="creatures")

    return ("creatures=%d spawns=%d dbc_disp=%d dbc_mdl=%d model_info=%d" %
            (len(entries_sorted), len(spawns), len(dbc_disp_needed),
             len(dbc_mdl_needed), len(model_info_needed)))
