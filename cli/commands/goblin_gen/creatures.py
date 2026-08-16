"""gen domain: creatures.

Cata/Neltharion creature_template + spawns -> AC/WotLK. Faithful port of the
standalone Scripts/Goblin Zone Port/migrate_creatures.py onto the `zep goblin gen`
ctx API. Emits, per zone (ctx.sfx):

  sql/  creatures_01_template  (creature_template)
        creatures_02_model     (creature_template_model, Idx 0..n source variety, I-249)
        creatures_03_model_info (creature_model_info, server rows for custom displays)
        creatures_04_spawns    (creature, map648->map1 offset, source phaseMask kept)
        + creature_addon / waypoint_data (per-spawn TDB 4.3.4 overlay, I-249)
  dbc/  [F-011]<sfx>_creaturedisplayinfo / _creaturemodeldata (client PATCH-Z)

Display resolution (preserved from the source script):
  * d0 = first non-zero modelid.
  * d0 == 0                 -> fallback (TYPE_FALLBACK / 646 placeholder).
  * d0 already in 3.3.5a    -> stock, use as-is (ctx.dbc_query present-display set).
  * creature in fb_plan     -> fallback placeholder 646 (fb_plan.needmodel carries the
    "needmodel" (needmodel)         creatures a real model is retroported for later; here they get 646).
  * else                    -> ship it: add CreatureDisplayInfo + CreatureModelData
                               (from the Whitemane Cata DBCs) + server creature_model_info.
  * modelid2-4 (I-249)      -> same stock/ship resolution per variant, emitted as
                               creature_template_model Idx 1..n; only when the primary
                               resolved to its real display (fallback/curated creatures
                               stay single-model so overlay repoints keep ownership);
                               unresolvable variants are dropped, never 646'd.

The old script decided "ship vs fallback" from a scratch shipped-model list + a local
Asset Library scan; those non-reproducible inputs are replaced by the committed
`fb_plan` fixture (fallback creatures) — everything else non-stock is shipped.
"""
import os
import struct
import importlib.util

NAME = "creatures"
TABLES = ["creature_template", "creature_template_model", "creature",
          "creature_addon", "waypoint_data",
          "creature_model_info", "creaturemodeldata", "creaturedisplayinfo",
          # read-only: per-guid addon rows union in the entry's collected
          # template-addon auras (creature_addon domain runs first in the wave)
          "creature_template_addon"]
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
# Rows this generator owns are stamped in `creature`.`Comment`, and the wipe keys on
# that stamp rather than on the guid block alone. Zone/area/bbox cannot be the
# discriminator: the rows that MUST survive a gen run (hand [I-xxx] spawns, I-285
# mining spots, I-286 orbs) sit in the same zone by definition. Ownership is the axis.
GEN_TAG = "[gen F-011 %s]"
# The generator allocates guids from base..base+949999 (generated, then the
# manual_spawns fixture at +900000). base+950000..+999999 is reserved for hand
# [I-xxx] spawn files. Guid is the LINKAGE mechanism (creature_addon.guid is a FK,
# waypoint_data.id is guid*10+point) — it is never the ownership test.
GEN_SPAN = 949999

# creature_addon / waypoint_data are stock AC tables with no Comment column, so the
# generator adds one. Ownership can't be derived from the parent spawn at wipe time:
# a stale child whose parent is no longer generated has no parent row left to join to,
# and would leak forever. The child has to carry its own stamp.
# MySQL 8 has no ADD COLUMN IF NOT EXISTS (that is MariaDB), hence the guarded form.
# Both core loaders name their columns explicitly (ObjectMgr.cpp:1267 for the addon,
# WorldDatabase.cpp:55 for the waypoint), so an extra trailing column is inert.
def _comment_col_ddl(table):
    return "\n".join([
        "-- ownership stamp column (idempotent; MySQL 8 has no ADD COLUMN IF NOT EXISTS)",
        "SET @_has := (SELECT COUNT(*) FROM information_schema.COLUMNS",
        "              WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '%s'" % table,
        "                AND COLUMN_NAME = 'Comment');",
        "SET @_sql := IF(@_has = 0,",
        "  'ALTER TABLE `%s` ADD COLUMN `Comment` VARCHAR(255) NULL DEFAULT NULL', 'DO 0');" % table,
        "PREPARE _stmt FROM @_sql; EXECUTE _stmt; DEALLOCATE PREPARE _stmt;\n",
    ])
NOISE = ("bunny", "invisible stalker", "generateur", "elm general", "wondi", "purpose bunny")
# Entries exempt from the NOISE name filter (I-320). Some Neltharion "Wondi's Bunny"
# 75xxx markers are not decor — a ported spell's SourceType-13 target condition names
# them, so dropping the entry drops ALL its spawns and the spell's nearby-entry search
# can never resolve. I-246 reached these through manual_spawns (which re-places them by
# hand); an entry whose SOURCE spawns are already correct only needs the exemption, and
# then the normal spawn-driven path emits all of them with sequential AUTO guids.
#   75113 "Wondi's Bunny - Trading Up - Spell Item Target" — the 24 Raptor Rise trap
#         markers for quest 24741; condition 13/1/56576 -> 31/0/3/75113.
NOISE_KEEP = {75113}
STOCK_COLLIDE = {4075, 6827, 13321, 31688}   # exist in AC world -> reuse stock, spawn only
# Cata FactionTemplate IDs absent from WotLK -> remap by hostility.
# EMPTY since I-337: the eight goblin-zone templates (2159/2160/2200/2204/2227/2228/
# 2231/2238) and the three Faction rows they need (1133/1152/1157) are now shipped by
# dbc/[I-337]_faction*.sql, so _valid_faction_ids() accepts the donor values and the
# real faction graph survives the port. Remapping them by "hostility" cost the zone its
# faction RELATIONS: 2228 -> 14 made the Oomlot hostile to the player and to nothing
# else (retail 2228 lists 1133 as an enemy) and unpacifiable by spell 66987's forced
# reaction on faction 1157; 2231 -> 35 left the Town-In-A-Box defenders unable to fight
# anything at all. Only add an entry here for a Cata faction we deliberately choose NOT
# to ship a FactionTemplate row for.
FACTION_REMAP = {}
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


# ---------------------------------------------------------------------------
# I-313 — donor C++ CreatureScript ports.
#
# The collector is SQL->SQL and never reads the donor's C++, so a donor entry
# whose behaviour lived in a CreatureScript used to arrive with ScriptName ''
# and no SmartAI: inert, and silent about it. That silence is what turned every
# such entry into a separate tester report (I-248, I-285, I-308..I-312).
#
# Two halves to the fix:
#   * SCRIPT_NAME_PORTS re-attaches the entries we have re-implemented in
#     Zeppelin-Core/src/server/scripts/Custom/zeppelin_goblin_creatures.cpp, so a
#     regen cannot silently blank them again.
#   * everything else with a donor ScriptName is WARNed at the end of emit(), so
#     the remaining work is a printed to-do list instead of a discovery queue.
#
# Blanking is still correct for un-ported entries: the donor name is a SkyFire
# 4.3.4 class that does not exist here. AC would fall through cleanly
# (CreatureAISelector.cpp:85 -> AIName factory) but log a load error per row.
SCRIPT_NAME_PORTS = {
    38526: "npc_zep_bc_eliminator",              # q24901 Town-In-A-Box: Under Attack
    38802: "npc_zep_super_booster_rocket_boots",  # q24942 Zombies vs. Boots
    39329: "npc_zep_wild_mine_cart",             # q25184 Wild Mine Cart Ride
    39198: "npc_zep_wild_cart_companion",        # Ace
    39199: "npc_zep_wild_cart_companion",        # Assistant Greely
    39200: "npc_zep_wild_cart_companion",        # Izzy
    39201: "npc_zep_wild_cart_companion",        # Gobber
}

# Donor ScriptNames with NO code in the dump — nothing to port, ever. Excluded
# from the WARN so the to-do list stays honest.
SCRIPT_NAME_DANGLING = {"npc_citoyen_gob", "npc_captive", "gob_red_but", "gob_canon_gobelin"}

# Donor C++ scripts re-implemented as SmartAI rather than as AC C++. The rows live
# in a zz_[I-xxx] override; all this side has to do is set AIName, because the
# donor template carries an empty AIName (its behaviour was the ScriptName) and a
# blank AIName means the override's smart_scripts rows never run. Also excluded
# from the I-313 WARN below — they ARE ported, just not as C++.
#
# {entry: (AIName, issue that owns the SmartAI rows)}
AI_NAME_PORTS = {
    # I-336, quest 24868 "Surrender or Else!" — npc_ace_surrender_escort re-authored
    # as SmartAI + a hand `waypoints` path in zz_[I-336]_surrender_or_else.sql.
    38455: ("SmartAI", "I-336"),
}


def emit(ctx):
    sfx = ctx.sfx
    zone = ZONE[sfx]
    zone_name = "Kezan" if sfx else "Lost Isles"
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
            and (e in NOISE_KEEP
                 or not any(k in (tmpl[e]["name"] or "").lower() for k in NOISE))]
    real_set = set(real)
    # Summon-only creatures (no spawn row anywhere -> invisible to the zone sweep)
    # referenced by ported spells' SUMMON effects (I-242 Hot Rod 34840). Emitted
    # once, on the Lost Isles pass, like the zone-independent spells domain; they
    # get template/model rows below but never spawn rows (spawns stay spawn-driven).
    summoned = {}
    if not sfx:
        summoned = _sibling_const("_summons", "summoned_entries")(ctx)
        for e in sorted(summoned):
            if e not in real_set and e in tmpl:
                real.append(e)
                real_set.add(e)
    # Hand-placed spawns (manual_spawns fixture, I-246): creatures the source dump
    # neither spawns nor summons (Bilgewater Buccaneer 37179) join the sweep here so
    # template/model/DBC ship like any spawned creature; their spawn rows are emitted
    # from the fixture below.
    manual_spawn_rows = _sibling_const("_manual", "manual_rows")(ctx)
    for e in sorted({int(r["entry"]) for r in manual_spawn_rows}):
        if e not in real_set and e in tmpl:
            real.append(e)
            real_set.add(e)
    entries_sorted = sorted(real)

    # ---- resolve display per entry ----
    disp_plan = {}          # entry -> final display id (Idx 0 / primary)
    models_plan = {}        # entry -> [display ids, Idx 0..n] (source variety, I-249)
    dbc_disp_needed = {}    # display_id -> displayinfo row
    dbc_mdl_needed = {}     # model_id  -> modeldata row (possibly _HD-stripped)
    model_info_needed = {}  # display_id -> (bounding, reach)
    tex_ship = {"present": 0, "shipped": 0, "missing": 0}   # tv BLPs (I-249)

    def _try_ship(d):
        """Ship Cata display d (CreatureDisplayInfo + CreatureModelData + server
        creature_model_info) from the Whitemane DBCs. False if unresolvable."""
        di = disp.get(d)
        mrow = mdl.get(di[1]) if di else None
        if di is None or mrow is None:
            return False
        di = di[:]
        mrow = mrow[:]
        if mrow[2] and "_hd" in _norm(mrow[2]):
            import re
            mrow[2] = re.sub(r"(?i)_hd", "", mrow[2])   # _HD model -> its stock base path
        model_id = di[1]
        dbc_disp_needed[d] = di
        # never re-emit a STOCK model row (the Whitemane copy would
        # overwrite the client's own char/creature model data) unless
        # it is a curated Cata retune we ship the mesh for
        if model_id not in present_mdl or model_id in RETUNE_STOCK_MODELS:
            dbc_mdl_needed[model_id] = mrow
        scale = di[4] or 1.0
        cw = mrow[14] or 0.0
        ch = mrow[15] or 0.0
        model_info_needed[d] = (round((cw * scale) or 0.306, 4),
                                round((ch * scale) or 1.5, 4))
        # ship the display's texture-variation BLPs (I-249: a shipped display row
        # whose skin BLP isn't in the client renders solid green). BLPs only —
        # the model mesh itself is stock/retroported, never raw-copied here.
        mdir = os.path.dirname(mrow[2].replace("\\", "/"))
        for tv in (di[6], di[7], di[8]):
            tv = str(tv or "").strip()
            if tv:
                tex_ship[ctx.ship_asset("%s/%s.blp" % (mdir, tv))] += 1
        return True

    for e in real:
        t = tmpl[e]
        models = []
        for k in ("modelid1", "modelid2", "modelid3", "modelid4"):
            v = t[k]
            if v and str(v).strip() not in ("0", "") and int(v) not in models:
                models.append(int(v))
        d0 = models[0] if models else 0
        final = d0
        force_default = False
        if d0 == 0:
            status = "fallback"
        elif d0 in present_disp:
            status = "stock"
        elif e in needmodel:
            status = "fallback"
            force_default = True          # fb_plan placeholder -> 646 (retroport wires the real one)
        elif _try_ship(d0):
            status = "shipped"
        else:
            status = "fallback"
        if status == "fallback":
            if force_default:
                final = DEFAULT_FALLBACK
            else:
                final = TYPE_FALLBACK.get(int(t["type"] or 0), DEFAULT_FALLBACK)
                if final not in present_disp:
                    final = DEFAULT_FALLBACK
        disp_plan[e] = final
        # modelid2-4 variants (I-249): only when the primary resolved to its real
        # display — fallback/curated creatures stay single-model so the overlay
        # repoints (which land on Idx 0) keep full ownership of the appearance.
        plan = [final]
        if status in ("stock", "shipped"):
            for d in models[1:]:
                if d in present_disp or _try_ship(d):
                    plan.append(d)         # unresolvable variants are dropped, never 646'd
        models_plan[e] = plan

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
            "mingold": 0, "maxgold": 0,   # F-073 compliance: no sub-1g money drops. Source Cata values are all well under 1g, and F-073's sweep lives in zep-legacy (prio 900) which the I-244 cascade can't reach from this zpak — so zero at the source instead of relying on apply order.
            # carry source AI (mostly 'SmartAI') — blank = SmartAI never runs, scripts dead
            "AIName": AI_NAME_PORTS[e][0] if e in AI_NAME_PORTS else (t["AIName"] or "").strip(),
            "MovementType": mtype, "HoverHeight": float(_or(t["HoverHeight"], 1)),
            "HealthModifier": float(_or(t["Health_mod"], 1)), "ManaModifier": float(_or(t["Mana_mod"], 1)),
            "ArmorModifier": float(_or(t["Armor_mod"], 1)), "ExperienceModifier": 1.0,
            "RacialLeader": int(t["RacialLeader"] or 0), "movementId": 0,
            "RegenHealth": int(_or(t["RegenHealth"], 1)), "CreatureImmunitiesId": 0,
            # ScriptName: blank unless we have re-implemented the donor script for
            # this entry (I-313). Never carry the donor's own name through — it is a
            # SkyFire class that does not exist in AC.
            "flags_extra": 0, "ScriptName": SCRIPT_NAME_PORTS.get(e, ""), "VerifiedBuild": 0,
        }
        ctx.col.put("creature_template", e, cols, tier="base", zone=sfx, owner="creatures")

    # ---- creature_template_model (Idx 0..n, equal-weight variants) ----
    for e in entries_sorted:
        t = tmpl[e]
        for idx, d in enumerate(models_plan[e]):
            ctx.col.put("creature_template_model", (e, idx), {
                "CreatureID": e, "Idx": idx, "CreatureDisplayID": d,
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

    # ---- TDB 4.3.4 movement / per-spawn addon overlay (I-249) ----
    # Neltharion drove civilian NPCs (Kezan Citizen 35075) through C++ scripts, so its
    # dump carries MovementType=0/spawndist=0 and no per-spawn addons for them; the TDB
    # 4.3.4 dump keeps the data-driven behaviour. Two layers, applied only to spawns
    # Neltharion itself left static:
    #   exact : nearest unconsumed TDB spawn of the same id within 1y (source map-648
    #           coords) -> its MovementType/spawndist, addon bytes/emote/mount/auras,
    #           and waypoint path (mt=2; points re-keyed to our guid*10, map-1 offset).
    #   fill  : entries Neltharion left fully static that TDB majority-wanders (>=50%)
    #           get the TDB wander fraction spread evenly over the unmatched spawns.
    tdb_rows = ctx.tdb_q(
        "SELECT c.guid, c.id, c.position_x x, c.position_y y, c.MovementType mt, "
        "c.spawndist wd, a.mount, a.bytes1, a.bytes2, a.emote, a.auras, "
        "a.visibilityDistanceType vdt, a.waypointPathId wp "
        "FROM creature c LEFT JOIN creature_addon a ON a.guid = c.guid WHERE c.map = 648 "
        # ORDER BY is load-bearing, not cosmetic: the nearest-neighbour matcher below
        # breaks ties on FIRST-row-wins over a greedy `consumed` set, so an unordered
        # read made two identical gen runs emit different wander_distance/MovementType
        # (found in I-315: four 35882 + one 39069 flipped 10->0 between back-to-back runs).
        "ORDER BY CAST(c.guid AS UNSIGNED)")

    # Neltharion's OWN per-guid addon rows — authored pose/emote/mount/aura data
    # (e.g. the KTC pool-party aftermath corpses: bytes1=7 dead + emote 65 in the
    # post-14116 phase). Keyed to the exact source guid and phase-staged, so they
    # beat the spatial TDB overlay for the same spawn (a phase-4 alive pirate and
    # its phase-6144 corpse sit yards apart and would cross-match). Its
    # distance_visibility col is a lineage-wide constant 2 (no signal) -> dropped;
    # emitted rows use visibilityDistanceType 0.
    nel_addons = {int(r["guid"]): r for r in ctx.q(
        "SELECT a.guid, a.mount, a.bytes1, a.bytes2, a.emote, a.auras "
        "FROM creature_addon a JOIN creature c ON c.guid = a.guid WHERE c.map = 648")}
    tdb_by_id = {}
    for r in tdb_rows:
        tdb_by_id.setdefault(int(r["id"]), []).append(r)

    def _static(s):
        return int(s["MovementType"] or 0) == 0 and float(s["spawndist"] or 0) == 0

    # Corpses and posed decor must never take the TDB movement overlay: a random-wander
    # motion master drags the body across the ground while it keeps the dead/kneeling
    # pose (the sliding Goblin Survivor 38409 corpse). Neltharion stages these two ways —
    # per-spawn (dynamicflags 0x20 DEAD, per-guid addon pose) or template-level on a
    # dedicated corpse entry (35929 Poison Spitter vs the live 35896, 361760 Alliance
    # Sailor vs the live 36176), which carry stand state 7 + Permanent Feign Death.
    FEIGN_DEATH = "29266"

    def _posed(s):
        if int(s["dynamicflags"] or 0) & 0x20:          # UNIT_DYNFLAG_DEAD
            return True
        for a in (nel_addons.get(int(s["guid"])),
                  ctx.col.get("creature_template_addon", int(s["id"]))):
            if not a:
                continue
            if int(a.get("bytes1") or 0) & 0xFF:        # stand state: dead/kneel/sit/sleep
                return True
            if FEIGN_DEATH in str(a.get("auras") or "").split():
                return True
        return False

    by_entry = {}
    for i, s in enumerate(spawns):
        by_entry.setdefault(int(s["id"]), []).append(i)

    tdb_match = {}       # spawn index -> matched TDB row
    consumed = set()
    for i, s in enumerate(spawns):
        px, py = float(s["position_x"]), float(s["position_y"])
        best, best_d = None, 1.0
        for tr in tdb_by_id.get(int(s["id"]), ()):
            if id(tr) in consumed:
                continue
            d = max(abs(float(tr["x"]) - px), abs(float(tr["y"]) - py))
            if d < best_d:
                best, best_d = tr, d
        if best is not None:
            consumed.add(id(best))
            tdb_match[i] = best

    # waypoint walkers (mt=2): their recorded TDB spawn point drifts (walkers roam,
    # nel re-authored placements), so 1y never matches — attach each unconsumed TDB
    # path to the nearest still-unmatched static spawn of the same id within 25y.
    for tr in tdb_rows:
        if int(tr["mt"] or 0) != 2 or not tr["wp"] or id(tr) in consumed:
            continue
        best, best_d = None, 25.0
        for i in by_entry.get(int(tr["id"]), []):
            if i in tdb_match or not _static(spawns[i]) or _posed(spawns[i]):
                continue
            d = max(abs(float(spawns[i]["position_x"]) - float(tr["x"])),
                    abs(float(spawns[i]["position_y"]) - float(tr["y"])))
            if d < best_d:
                best, best_d = i, d
        if best is not None:
            consumed.add(id(tr))
            tdb_match[best] = tr

    wander_fill = {}     # spawn index -> wander distance
    for sid, idxs in by_entry.items():
        ts = tdb_by_id.get(sid)
        if not ts or any(not _static(spawns[i]) for i in idxs):
            continue                       # Neltharion has movement of its own -> trust it
        wanderers = [tr for tr in ts if int(tr["mt"] or 0) == 1]
        frac = len(wanderers) / float(len(ts))
        if frac < 0.5:
            continue
        wd_fill = max(float(tr["wd"] or 0) for tr in wanderers) or 10.0
        have = sum(1 for i in idxs
                   if i in tdb_match and int(tdb_match[i]["mt"] or 0) == 1)
        need = int(round(frac * len(idxs))) - have
        unmatched = [i for i in idxs if i not in tdb_match and not _posed(spawns[i])]
        if need <= 0 or not unmatched:
            continue
        need = min(need, len(unmatched))
        for j, i in enumerate(unmatched):  # deterministic even spread
            if j * need // len(unmatched) != (j + 1) * need // len(unmatched):
                wander_fill[i] = wd_fill

    # Ownership-scoped wipe (stable, count-independent), so stale rows beyond the
    # current count are always cleared without touching rows this generator did not
    # write. Every table keys on the same stamp — no guid predicate anywhere, so a
    # foreign row inside the guid block is no longer collateral.
    # (equipment_id patched by equipment.py)
    gen_tag = GEN_TAG % zone_name
    ctx.col.ddl("creature_addon", _comment_col_ddl("creature_addon"))
    ctx.col.ddl("waypoint_data", _comment_col_ddl("waypoint_data"))
    ctx.col.delete("creature", "Comment LIKE '%s%%'" % gen_tag)
    ctx.col.delete("creature_addon", "Comment LIKE '%s%%'" % gen_tag)
    ctx.col.delete("waypoint_data", "Comment LIKE '%s%%'" % gen_tag)
    g = guid_base
    present_spells = None   # lazy: only loaded if a matched TDB addon carries auras
    n_addon = n_wp = 0
    for i, s in enumerate(spawns):
        g += 1
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        z = float(s["position_z"])
        o = float(s["orientation"])
        mt = int(s["MovementType"] or 0)
        if mt == 2:
            mt = 0                         # nel waypoint refs unavailable (paths not in its dump)
        wd = float(s["spawndist"] or 0)
        tm = tdb_match.get(i)
        wp_path = 0
        if mt == 0 and wd == 0 and not _posed(s):
            if tm is not None:
                tmt, twd = int(tm["mt"] or 0), float(tm["wd"] or 0)
                if tmt == 2 and tm["wp"]:
                    pts = ctx.tdb_q("SELECT point, position_x, position_y, position_z, "
                                    "orientation, delay, move_type FROM waypoint_data "
                                    "WHERE id = %s ORDER BY point", (int(tm["wp"]),))
                    if pts:
                        wp_path = g * 10
                        mt = 2
                        n_wp += 1
                        for p in pts:
                            ctx.col.add("waypoint_data", {
                                "id": wp_path, "point": int(p["point"]),
                                "position_x": float(p["position_x"]) + DX,
                                "position_y": float(p["position_y"]) + DY,
                                "position_z": float(p["position_z"]),
                                "orientation": None if p["orientation"] is None else float(p["orientation"]),
                                "Comment": gen_tag,
                                "delay": int(p["delay"] or 0),
                                "move_type": int(p["move_type"] or 0),
                                "action": 0, "action_chance": 100, "wpguid": 0,
                            }, sort_key=(wp_path, int(p["point"])))
                elif tmt == 1 or twd > 0:
                    mt, wd = 1, (twd or 10.0)
            elif i in wander_fill:
                mt, wd = 1, wander_fill[i]
        # per-spawn addon (sitting / emote-state / mount / aura NPCs + waypoint path link)
        na = nel_addons.get(int(s["guid"]))
        src = na if na is not None else tm
        if src is not None:
            b1, em = int(src["bytes1"] or 0), int(src["emote"] or 0)
            mount = int(src["mount"] or 0)
            if mount and mount not in present_disp and mount not in dbc_disp_needed:
                mount = 0                  # Cata-only mount display we don't ship
            auras = []
            for a in str(src["auras"] or "").split():
                if present_spells is None:
                    present_spells = ctx.dbc_spell_ids()
                try:
                    aid = int(a)
                except ValueError:
                    continue
                if aid in present_spells:
                    auras.append(str(aid))
            if wp_path or b1 or em or mount or auras:
                # AC applies a guid-keyed creature_addon INSTEAD of the entry's
                # creature_template_addon, so this row would strip the template
                # auras (e.g. homie quest-invisibility) — union them back in.
                tpl = ctx.col.get("creature_template_addon", int(s["id"]))
                for a in str((tpl or {}).get("auras") or "").split():
                    if a not in auras:
                        auras.append(a)
                n_addon += 1
                ctx.col.add("creature_addon", {
                    "guid": g, "path_id": wp_path, "mount": mount, "bytes1": b1,
                    "bytes2": int(src["bytes2"] or 0), "emote": em,
                    "visibilityDistanceType": int(tm["vdt"] or 0) if src is tm else 0,
                    "auras": " ".join(auras), "Comment": gen_tag,
                }, sort_key=g)
        st = int(s["spawntimesecs"] or 120)
        pmask = int(s["phaseMask"] or 1) or 1
        ctx.col.add("creature", {
            "guid": g, "id": int(s["id"]), "map": 1, "zoneId": 0, "areaId": 0, "spawnMask": 1,
            "phaseMask": pmask, "equipment_id": 0, "position_x": x, "position_y": y,
            "position_z": z, "orientation": o, "spawntimesecs": st, "wander_distance": wd,
            "currentwaypoint": 0, "curhealth": 1, "curmana": 0, "MovementType": mt,
            # per-spawn flag overrides (AC ChooseCreatureFlags: nonzero replaces the
            # template value) — Neltharion stages corpses/decor with these, e.g. the
            # pool-party aftermath: dynamicflags 0x20 DEAD + NOT_SELECTABLE|IMMUNE_TO_PC
            "npcflag": int(s["npcflag"] or 0), "unit_flags": int(s["unit_flags"] or 0),
            "dynamicflags": int(s["dynamicflags"] or 0), "ScriptName": "", "VerifiedBuild": 0,
            "CreateObject": 1, "Comment": GEN_TAG % zone_name,
        }, sort_key=g)

    # hand-placed spawns (manual_spawns fixture, I-246): FINAL map-1 coords, explicit
    # guids high in the zone block (cleared by the same block DELETE above)
    for m in manual_spawn_rows:
        mg = int(m["guid"])
        assert guid_base + 900000 <= mg <= guid_base + 949999, \
            "manual spawn guid %d outside reserved block [%d, %d] (base+950000+ is " \
            "for hand [I-xxx] spawn files)" % (mg, guid_base + 900000, guid_base + 949999)
        ctx.col.add("creature", {
            "guid": mg, "id": int(m["entry"]), "map": 1, "zoneId": 0, "areaId": 0,
            "spawnMask": 1, "phaseMask": int(m.get("phaseMask", 1)), "equipment_id": 0,
            "position_x": float(m["x"]), "position_y": float(m["y"]),
            "position_z": float(m["z"]), "orientation": float(m["o"]),
            "spawntimesecs": int(m.get("spawntimesecs", 120)),
            "wander_distance": float(m.get("wander_distance", 0)), "currentwaypoint": 0,
            "curhealth": 1, "curmana": 0, "MovementType": int(m.get("MovementType", 0)),
            "npcflag": 0, "unit_flags": 0, "dynamicflags": 0, "ScriptName": "",
            "VerifiedBuild": 0, "CreateObject": 1,
            # fixture prose keeps its detail but must carry the ownership stamp, or
            # the wipe above would leave these five rows behind and the re-insert
            # would collide on the primary key.
            "Comment": "%s %s" % (GEN_TAG % zone_name,
                                  str(m.get("comment", "manual spawn"))),
        }, sort_key=mg)

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

    # ---- I-313 audit: donor C++ scripts we have NOT re-implemented ----
    # Printed every run so an inert ported NPC is a known to-do, not a bug report.
    unported = []
    for e in entries_sorted:
        t = tmpl.get(e)
        if not t:
            continue
        donor = str(t["ScriptName"] or "").strip()
        if (not donor or e in SCRIPT_NAME_PORTS or e in AI_NAME_PORTS
                or donor in SCRIPT_NAME_DANGLING):
            continue
        unported.append((e, str(t["name"] or "").strip(), donor))

    out = ("creatures=%d spawns=%d dbc_disp=%d dbc_mdl=%d model_info=%d "
           "model_variants=%d tdb_match=%d wander_fill=%d addons=%d wp_paths=%d "
           "tex_shipped=%d tex_missing=%d scriptname_ports=%d" %
           (len(entries_sorted), len(spawns) + len(manual_spawn_rows), len(dbc_disp_needed),
            len(dbc_mdl_needed), len(model_info_needed),
            sum(len(p) - 1 for p in models_plan.values()), len(tdb_match),
            len(wander_fill), n_addon, n_wp, tex_ship["shipped"], tex_ship["missing"],
            sum(1 for e in entries_sorted if e in SCRIPT_NAME_PORTS)))

    if unported:
        out += ("\n    WARN %d creature(s) had a donor C++ script that is NOT ported — "
                "they load inert and silent (I-313):" % len(unported))
        for e, name, donor in unported:
            out += "\n      %6d %-32s %s" % (e, name[:32], donor)

    return out
