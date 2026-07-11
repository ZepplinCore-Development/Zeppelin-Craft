"""gen domain: fallback646 (F-011 ghoul-fallback creature displays).

Ports the DBC/SQL-wiring half of Scripts/Goblin Zone Port/build_fallback_displays.py.

A batch of creatures (Gallywix, mechs, pygmies, triggers...) fell back to the ghoul
display 646 because their real Cata displays were never imported. For each, this
imports the real 4.3.4 (Whitemane 15595) display and wires it up:

    dbc/[AUTO,F-011]_fallback646_displays.sql   -- CreatureDisplayInfo (+ Extra bake)
    sql/[AUTO,F-011]_fallback646_repoint.sql    -- creature_model_info + repoint

Per creature: character-goblin displays (model 831/832) get a CreatureDisplayInfo
+ clamped Extra bake row; monster-model displays get a CreatureDisplayInfo with a
texture_variation; displays already present in the client are just repointed.
Baked-texture shipping is an asset side effect and stays out of the CLI.

Zone-independent; emitted once, on the Lost Isles pass.

The set of ghoul-fallback creatures (GHOUL_FALLBACK) is a runtime-derived curation
snapshot: the standalone script queried the live world DB for creatures still on
CreatureDisplayID 646 in [34000,52000]. That live state has since been repointed by
this very output, so the set is captured here (equivalent to a fixture). Everything
else — target display, char-vs-monster classification, scale, grooming clamp — is
recomputed from source.

"Already in client" (OURDISP / OURMODELS) is evaluated against the *pre-fallback*
client: stock 3.3.5a (Original DBC Files) UNION F-011's main creaturedisplayinfo /
creaturemodeldata imports (the sibling committed files). The current live client
cannot be used — it already contains the displays this emitter creates.
"""
import os
import re
import struct

NAME = "fallback646"

# Creatures that fell back to ghoul display 646 (world DB CreatureDisplayID=646,
# entry in [34000,52000]) at pipeline time — see module docstring.
GHOUL_FALLBACK = [34748, 35222, 36403, 37179, 37561, 37590, 37594, 37598,
                  38224, 38318, 38644, 38713, 39582, 39615, 48519]

# Stock 3.3.5a client DBC tree + our live tree (worgoblin race-9 CharSections).
STOCK_DBC = os.getenv("GOBLIN_STOCK_DBC", "/workspace/project/Zeppelin-Tools/Original DBC Files/dbc")
LIVE_DBC = os.getenv("GOBLIN_LIVE_DBC", "/workspace/project/data/dbc")

DI_COLS = ["id", "model_id", "sound_id", "extended_display_info_id", "creature_model_scale",
           "creature_model_alpha", "texture_variation_1", "texture_variation_2",
           "texture_variation_3", "portrait_texture_name", "blood_level", "blood_id",
           "npc_sound_id", "praticle_color_id", "creature_geoset_data", "obj_effect_package_id"]
EXTRA_COLS = ["id", "race", "gender", "skin_color", "face_type", "hair_style", "hair_color",
              "facial_hair", "helm_id", "shoulders_id", "shirt_id", "chest_id", "belt_id",
              "legs_id", "boots_id", "wrists_id", "gloves_id", "tabard_id", "cape_id",
              "can_equip", "texture"]


def _f32(u):
    """Reinterpret a uint32 field's raw bits as a float32 (read_wdbc returns ints)."""
    return struct.unpack("<f", struct.pack("<I", u & 0xFFFFFFFF))[0]


def _idset(ctx, path):
    recs, _gs = ctx.read_wdbc(path)
    return set(r[0] for r in recs)


def _zpak_dbc_dir():
    here = os.path.dirname(os.path.abspath(__file__))
    repo = os.path.dirname(os.path.dirname(os.path.dirname(here)))
    return os.path.join(repo, "zpaks", "zep-goblin-start", "dbc")


def _import_ids(table):
    """Ids inserted by F-011's main <table> import (sibling committed files, both zones)."""
    dbcdir = _zpak_dbc_dir()
    rx = re.compile(r"INSERT INTO %s \([^)]*\) VALUES \((\d+)" % table)
    ids = set()
    for fn in os.listdir(dbcdir):
        low = fn.lower()
        if not low.endswith("_%s.sql" % table) or "fallback" in low:
            continue
        for line in open(os.path.join(dbcdir, fn)):
            m = rx.search(line)
            if m:
                ids.add(int(m.group(1)))
    return ids


def emit(ctx):
    if ctx.sfx == "_K":
        return "skipped (zone-independent; emitted on Lost Isles pass)"

    # --- Whitemane display + extra ---
    wrecs, wgs = ctx.read_wdbc(ctx.whitemane_dbc("CreatureDisplayInfo.dbc"))
    WDISP = {}
    for r in wrecs:
        WDISP[r[0]] = (r[1], r[3], _f32(r[4]), wgs(r[6]))   # model, ext, scale, texvar
    werecs, wegs = ctx.read_wdbc(ctx.whitemane_dbc("CreatureDisplayInfoExtra.dbc"))
    WEXTRA = {}
    for r in werecs:
        WEXTRA[r[0]] = (list(r[:20]), wegs(r[20]))

    # --- pre-fallback client: stock UNION F-011 main imports ---
    OURMODELS = _idset(ctx, os.path.join(STOCK_DBC, "CreatureModelData.dbc")) | _import_ids("creaturemodeldata")
    OURDISP = _idset(ctx, os.path.join(STOCK_DBC, "CreatureDisplayInfo.dbc")) | _import_ids("creaturedisplayinfo")

    # --- valid goblin CharSection combos (clamp) from live tree ---
    crecs, _cgs = ctx.read_wdbc(os.path.join(LIVE_DBC, "CharSections.dbc"))
    VALID = {}
    for r in crecs:
        if r[1] == 9:
            VALID.setdefault((r[2], r[3]), set()).add((r[8], r[9]))

    def clamp(ints):
        g = ints[2]
        skin, face, hs, hc, fh = ints[3:8]
        sc = {c for v, c in VALID.get((g, 0), set())}
        fsk = {c for v, c in VALID.get((g, 1), set())}
        bak = (sc & fsk) or sc or {0}
        if skin not in bak:
            skin = min(bak)
        if (face, skin) not in VALID.get((g, 1), set()):
            cand = sorted(v for v, c in VALID.get((g, 1), set()) if c == skin)
            face = cand[0] if cand else 0
        if fh != 0 and (fh, hc) not in VALID.get((g, 2), set()):
            fh = 0
        ints[3:8] = [skin, face, hs, hc, fh]
        return ints

    # --- each creature -> its source display (Cata modelid1) ---
    cre_disp = {}
    for e in GHOUL_FALLBACK:
        rows = ctx.q("SELECT modelid1 FROM creature_template WHERE TRIM(entry)=%s", (str(e),))
        cre_disp[e] = int(str(rows[0]["modelid1"]).strip() or 0) if rows else 0

    def esc(v):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'" if isinstance(v, str) else str(v)

    new_cdi, new_extra, new_minfo, repoint, pending = {}, {}, {}, {}, []
    for e, D in cre_disp.items():
        wm = WDISP.get(D)
        if not wm:
            pending.append((e, D, "no whitemane display"))
            continue
        model, ext, scale, texvar = wm
        if D in OURDISP:
            repoint[e] = D                                  # display already there
            continue
        if model not in OURMODELS:
            pending.append((e, D, "model %d missing (retroport)" % model))
            continue
        is_char = model in (831, 832)
        gender = 0
        if is_char and ext in WEXTRA:
            ints, bakename = WEXTRA[ext]
            ints = clamp(list(ints))
            gender = ints[2]
            new_extra[ext] = (ints, bakename)
            new_cdi[D] = [D, model, 0, ext, scale, 255, "", "", "", "", 1, 0, 0, 0, 0, 0]
        else:
            new_cdi[D] = [D, model, 0, 0, scale, 255, texvar, "", "", "", 0, 0, 0, 0, 0, 0]
        new_minfo[D] = gender
        repoint[e] = D

    # ---- DBC: displays + extras ----
    b = ["-- F-011 import real displays for creatures that fell back to ghoul display 646\n\n"]
    for D, row in sorted(new_cdi.items()):
        b.append("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % D)
        b.append("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (
            ",".join(DI_COLS), ",".join(esc(v) for v in row)))
    b.append("\n")
    for ext, (ints, bakename) in sorted(new_extra.items()):
        b.append("DELETE FROM creaturedisplayinfoextra WHERE id=%d;\n" % ext)
        b.append("INSERT INTO creaturedisplayinfoextra (%s) VALUES (%s);\n" % (
            ",".join(EXTRA_COLS), ",".join(str(v) for v in ints) + ",'%s'" % bakename))
    ctx.write("dbc/[AUTO,F-011]_fallback646_displays.sql", "".join(b))

    # ---- server SQL: model_info + repoint ----
    b = ["-- F-011 repoint ghoul-fallback creatures to their real displays + creature_model_info\n\n"]
    if new_minfo:
        b.append("DELETE FROM creature_model_info WHERE DisplayID IN (%s);\n"
                 % ",".join(str(d) for d in sorted(new_minfo)))
        b.append("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES\n")
        b.append(",\n".join("  (%d,0.5,1.5,%d,0,0)" % (d, g) for d, g in sorted(new_minfo.items())) + ";\n\n")
    for e, D in sorted(repoint.items()):
        b.append("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (D, e))
    ctx.write("sql/zz_[AUTO,F-011]_fallback646_repoint.sql", "".join(b))

    return "repoint=%d new_displays=%d new_extras=%d pending=%d" % (
        len(repoint), len(new_cdi), len(new_extra), len(pending))
