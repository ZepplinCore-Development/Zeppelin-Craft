"""gen domain: npc_appearance (F-011 white/green-NPC fix).

Ports Scripts/Goblin Zone Port/fix_npc_appearance.py.

Re-points our imported creature displays at the REAL 4.3.4 (Whitemane 15595)
extended_display_info_id and ships the matching CreatureDisplayInfoExtra (bake)
rows so the client loads the pre-baked goblin NPC skins.

Collector overlay domain: patches extended_display_info_id onto the
creaturedisplayinfo rows the `creatures` domain ships this zone (col.pks
owner-filtered — the fallback domains curate their own ext ids), and owns the
matching creaturedisplayinfoextra bake rows.

Inputs:
    * Whitemane CreatureDisplayInfo.dbc / CreatureDisplayInfoExtra.dbc (the Cata
      source of the real ext ids + bake components) via ctx.whitemane_dbc.
    * Our live 3.3.5a CharSections.dbc (worgoblin race-9 sections) — clamp grooming
      so every bake component resolves (a missing skin/face/hair/facialhair section
      fails the atomic bake -> green model).

Grooming clamp only touches race-9 (goblin) extras; non-goblin (human/orc) extras
are emitted verbatim — later hand-corrected by the I-231 override file, which is
intentionally NOT part of this pure generator output.
"""
import os
import struct
import importlib.util

NAME = "npc_appearance"
TABLES = ["creaturedisplayinfo", "creaturedisplayinfoextra"]
TIER = "overlay"

# Our live 3.3.5a client DBC tree (holds the worgoblin race-9 CharSections). The
# standalone script read this file directly; keep that (env-overridable).
LIVE_DBC = os.getenv("GOBLIN_LIVE_DBC", "/workspace/project/data/dbc")

def _races():
    """Load the sibling race-mapping helper (domains are loaded standalone, not as a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_races.py")
    spec = importlib.util.spec_from_file_location("goblin_gen__races", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


EXTRA_COLS = ["id", "race", "gender", "skin_color", "face_type", "hair_style",
              "hair_color", "facial_hair", "helm_id", "shoulders_id", "shirt_id",
              "chest_id", "belt_id", "legs_id", "boots_id", "wrists_id", "gloves_id",
              "tabard_id", "cape_id", "can_equip", "texture"]


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

    # This zone's shipped displays, straight from the collector (creatures-owned
    # only — the fallback domains curate their own ext ids and bake rows).
    our = ctx.col.pks("creaturedisplayinfo", zone=sfx, owner="creatures")
    updates = []
    need_extra = set()
    for d in our:
        if d in disp:
            _model_id, ext = disp[d]
            if ext > 0:
                updates.append((d, ext))
                need_extra.add(ext)

    # ---- creaturedisplayinfoextra: bake data rows + pre-baked texture BLPs ----
    # The client renders these NPCs from the shipped Cata pre-baked texture
    # (Textures\BakedNpcTextures\CreatureDisplayExtra-<id>.blp) — an extra row
    # without its BLP renders solid green (I-249). Ship it with the row.
    #
    # Runs BEFORE the ext-id overlay: a bake whose race our ChrRaces does not
    # carry crashes the client outright (I-334), so the display must be left
    # un-extended rather than pointed at a row we refuse to ship.
    races = _races()
    warn = 0
    badrace = []
    bakes = {"present": 0, "shipped": 0, "missing": 0}
    for eid in sorted(need_extra):
        if eid not in extra:
            warn += 1
            continue
        ints, tex = extra[eid]
        ints = list(ints)
        # Cata race id -> our ChrRaces id (Worgen 22 -> 12). A race the live
        # ChrRaces has no row for is a hard #132 in the client, never shipped.
        ints[1], ok = races.map_race(ints[1])
        if not ok:
            badrace.append((eid, extra[eid][0][1]))
            continue
        # equipment fields 8-18 kept intact (npc_armor ships the referenced
        # ItemDisplayInfo rows). Clamp only goblin grooming.
        if ints[1] == 9:
            ints = clamp_goblin(ints)
        ctx.col.put("creaturedisplayinfoextra", eid,
                    dict(zip(EXTRA_COLS, ints + [tex])),
                    tier="base", zone=sfx, owner="npc_appearance")
        bakes[ctx.ship_asset(
            "Textures/BakedNpcTextures/CreatureDisplayExtra-%d.blp" % eid)] += 1

    # ---- overlay: correct extended_display_info_id on the shipped displays ----
    dropped = {eid for eid, _raw in badrace}
    for d, ext in updates:
        if ext in dropped:
            continue
        ctx.col.put("creaturedisplayinfo", d, {"extended_display_info_id": ext},
                    tier="overlay")

    note = ""
    if badrace:
        note = " badrace=%s" % ",".join("%d(race %d)" % t for t in sorted(badrace))
    return ("displays_extfix=%d extra=%d warn=%d bakes_shipped=%d bakes_missing=%d%s" %
            (len(updates) - len(dropped), len(need_extra), warn,
             bakes["shipped"], bakes["missing"], note))
