"""gen domain: npc_appearance (F-011 white/green-NPC fix).

Ports Scripts/Goblin Zone Port/fix_npc_appearance.py.

Re-points our imported creature displays at the REAL 4.3.4 (Whitemane 15595)
extended_display_info_id and ships the matching CreatureDisplayInfoExtra (bake)
rows so the client loads the pre-baked goblin NPC skins.

Emits (per zone, ctx.sfx):
    dbc/[AUTO,F-011]{sfx}_creaturedisplayinfo_extfix.sql   -- correct ext id
    dbc/[AUTO,F-011]{sfx}_creaturedisplayinfoextra.sql     -- bake data rows

Inputs:
    * Whitemane CreatureDisplayInfo.dbc / CreatureDisplayInfoExtra.dbc (the Cata
      source of the real ext ids + bake components) via ctx.whitemane_dbc.
    * Our live 3.3.5a CharSections.dbc (worgoblin race-9 sections) — clamp grooming
      so every bake component resolves (a missing skin/face/hair/facialhair section
      fails the atomic bake -> green model).
    * The zone's imported display ids, read from the sibling committed
      [F-011]{sfx}_creaturedisplayinfo.sql (the set of displays F-011 ships) — this
      is the `f011_disp{sfx}.txt` list the standalone script consumed.

Grooming clamp only touches race-9 (goblin) extras; non-goblin (human/orc) extras
are emitted verbatim — later hand-corrected by the I-231 override file, which is
intentionally NOT part of this pure generator output.
"""
import os
import re
import struct

NAME = "npc_appearance"

# Our live 3.3.5a client DBC tree (holds the worgoblin race-9 CharSections). The
# standalone script read this file directly; keep that (env-overridable).
LIVE_DBC = os.getenv("GOBLIN_LIVE_DBC", "/workspace/project/data/dbc")

EXTRA_COLS = ["id", "race", "gender", "skin_color", "face_type", "hair_style",
              "hair_color", "facial_hair", "helm_id", "shoulders_id", "shirt_id",
              "chest_id", "belt_id", "legs_id", "boots_id", "wrists_id", "gloves_id",
              "tabard_id", "cape_id", "can_equip", "texture"]


def _zpak_dbc_dir():
    # cli/commands/goblin_gen/<mod>.py -> Zeppelin-Craft/zpaks/zep-goblin-start/dbc
    here = os.path.dirname(os.path.abspath(__file__))
    repo = os.path.dirname(os.path.dirname(os.path.dirname(here)))
    return os.path.join(repo, "zpaks", "zep-goblin-start", "dbc")


def _our_displays(sfx):
    """Imported display ids for this zone (from the sibling creaturedisplayinfo file)."""
    dbcdir = _zpak_dbc_dir()
    want = "_K" if sfx == "_K" else ""
    rx = re.compile(r"INSERT INTO creaturedisplayinfo \([^)]*\) VALUES \((\d+)")
    for fn in os.listdir(dbcdir):
        low = fn.lower()
        if not low.endswith("_creaturedisplayinfo.sql") or "fallback" in low:
            continue
        # zone match: LI has no "_K_" segment, Kezan has "]_K_"
        is_k = "]_k_" in low
        if bool(want) != is_k:
            continue
        out = []
        for line in open(os.path.join(dbcdir, fn)):
            m = rx.search(line)
            if m:
                out.append(int(m.group(1)))
        return out
    return []


def emit(ctx):
    sfx = ctx.sfx

    # --- Whitemane CreatureDisplayInfo: id -> (model_id, ext) ---
    recs, _gs = ctx.read_wdbc(ctx.whitemane_dbc("CreatureDisplayInfo.dbc"))
    disp = {}
    for r in recs:
        disp[r[0]] = (r[1], r[3])   # ext = field 3 (extended_display_info_id)

    # --- Whitemane CreatureDisplayInfoExtra: id -> (20 ints, texture) ---
    erecs, egs = ctx.read_wdbc(ctx.whitemane_dbc("CreatureDisplayInfoExtra.dbc"))
    extra = {}
    for r in erecs:
        extra[r[0]] = (list(r[:20]), egs(r[20]))

    # --- valid goblin (race 9) CharSection combos (what can actually bake) ---
    # CharSections: race@1, sex@2, type@3, variation@8, color@9
    crecs, _cgs = ctx.read_wdbc(os.path.join(LIVE_DBC, "CharSections.dbc"))
    VALID = {}   # (gender, type) -> set of (variation, color)
    for r in crecs:
        if r[1] != 9:
            continue
        VALID.setdefault((r[2], r[3]), set()).add((r[8], r[9]))

    def clamp_goblin(ints):
        """Clamp grooming so every bake component (skin/face/hair/facialhair) resolves."""
        g = ints[2]
        skin, face, hstyle, hcolor, fhair = ints[3], ints[4], ints[5], ints[6], ints[7]
        skin_cols = {c for v, c in VALID.get((g, 0), set())}
        face_skins = {c for v, c in VALID.get((g, 1), set())}
        bakeable = (skin_cols & face_skins) or skin_cols or {0}
        if skin not in bakeable:
            skin = min(max(bakeable), skin) if skin > min(bakeable) else min(bakeable)
        if skin not in bakeable:
            skin = min(bakeable)
        if (face, skin) not in VALID.get((g, 1), set()):
            cand = sorted(v for v, c in VALID.get((g, 1), set()) if c == skin)
            face = cand[0] if cand else 0
        if hstyle != 0 and (hstyle, hcolor) not in VALID.get((g, 3), set()):
            cand = sorted(VALID.get((g, 3), set()))
            hstyle, hcolor = (cand[0] if cand else (0, 0))
        if fhair != 0 and (fhair, hcolor) not in VALID.get((g, 2), set()):
            fhair = 0   # piercings/features layer: drop if the Cata variation has no goblin section
        ints[3], ints[4], ints[5], ints[6], ints[7] = skin, face, hstyle, hcolor, fhair
        return ints

    our = _our_displays(sfx)
    updates = []
    need_extra = set()
    for d in our:
        if d in disp:
            _model_id, ext = disp[d]
            if ext > 0:
                updates.append((d, ext))
                need_extra.add(ext)

    # ---- extfix: correct extended_display_info_id ----
    ef = ["-- F-011 fix: correct extended_display_info_id to real 4.3.4 (Whitemane 15595) values\n\n"]
    for d, ext in sorted(updates):
        ef.append("UPDATE creaturedisplayinfo SET extended_display_info_id = %d WHERE id = %d;\n" % (ext, d))
    ctx.write("dbc/[AUTO,F-011]%s_creaturedisplayinfo_extfix.sql" % sfx, "".join(ef))

    # ---- creaturedisplayinfoextra: bake data rows ----
    warn = 0
    ex = ["-- F-011 CreatureDisplayInfoExtra (NPC skin-bake data from Whitemane 15595; race 9 goblin)\n\n"]
    for eid in sorted(need_extra):
        if eid not in extra:
            ex.append("-- WARN extra %d not in Whitemane DBC\n" % eid)
            warn += 1
            continue
        ints, tex = extra[eid]
        ints = list(ints)
        # equipment fields 8-18 kept intact (build_npc_armor ships the referenced
        # ItemDisplayInfo rows + component textures). Clamp only goblin grooming.
        if ints[1] == 9:
            ints = clamp_goblin(ints)
        vals = ints + ["'%s'" % tex.replace("'", "''")]
        ex.append("DELETE FROM creaturedisplayinfoextra WHERE id = %d;\n" % eid)
        ex.append("INSERT INTO creaturedisplayinfoextra (%s) VALUES (%s);\n" % (
            ",".join(EXTRA_COLS), ",".join(str(v) for v in vals)))
    ctx.write("dbc/[AUTO,F-011]%s_creaturedisplayinfoextra.sql" % sfx, "".join(ex))

    return "displays_extfix=%d extra=%d warn=%d" % (len(updates), len(need_extra), warn)
