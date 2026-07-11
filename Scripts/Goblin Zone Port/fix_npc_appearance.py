#!/usr/bin/env python3
"""
F-011 white-NPC fix: re-point our creature displays at the REAL 4.3.4 (Whitemane 15595)
extended_display_info_id, and ship the matching CreatureDisplayInfoExtra (bake) rows so
the client bakes goblin NPC skins (race 9 components shipped by worgoblin).
"""
import struct, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
DBC = os.path.join(SCRATCH, "cata_dbc/base")
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
SFX = os.environ.get("F011_SFX","")

def load(path):
    d = open(path, "rb").read()
    rc, fc, rs, ss = struct.unpack("<4I", d[4:20]); sb = 20 + rc * rs
    def s(o):
        e = d.index(b"\0", sb + o); return d[sb + o:e].decode("latin1")
    return d, rc, rs, s

# CreatureDisplayInfo (Cata 17 fields): id@0, model_id@4, extended@12 (early = same offsets)
cdi, rc, rs, _ = load(os.path.join(DBC, "CreatureDisplayInfo.dbc"))
disp = {}
for i in range(rc):
    b = 20 + i * rs
    ID, model_id = struct.unpack_from("<Ii", cdi, b)
    ext = struct.unpack_from("<i", cdi, b + 12)[0]
    disp[ID] = (model_id, ext)

# CreatureDisplayInfoExtra (21 fields, 3.3.5a-compatible): 8 ints, 11 equip ints, can_equip, texture(str)
ed, erc, ers, es = load(os.path.join(DBC, "CreatureDisplayInfoExtra.dbc"))
extra = {}
for i in range(erc):
    b = 20 + i * ers
    ints = struct.unpack_from("<20i", ed, b)   # id..can_equip (fields 0-19)
    tex = es(struct.unpack_from("<I", ed, b + 20 * 4)[0])
    extra[ints[0]] = (ints, tex)

# valid goblin (race 9) CharSection combos from OUR client CharSections (what can actually bake).
# A missing skin/face/hair/facialhair section fails the atomic bake -> green whole model.
# CharSections layout (fc=10): race@1, sex@2, type@3, variation@8, color@9.
_cs = open("/workspace/project/data/dbc/CharSections.dbc", "rb").read()
_crc, _cfc, _crs = struct.unpack("<3I", _cs[4:16])
VALID = {}   # (gender, type) -> set of (variation, color)
for _i in range(_crc):
    _b = 20 + _i * _crs
    if struct.unpack_from("<i", _cs, _b + 4)[0] != 9: continue
    _g = struct.unpack_from("<i", _cs, _b + 8)[0]; _t = struct.unpack_from("<i", _cs, _b + 12)[0]
    _v = struct.unpack_from("<i", _cs, _b + 32)[0]; _c = struct.unpack_from("<i", _cs, _b + 36)[0]
    VALID.setdefault((_g, _t), set()).add((_v, _c))

def clamp_goblin(ints):
    """Clamp grooming so every bake component (skin/face/hair/facialhair) resolves."""
    g = ints[2]
    skin, face, hstyle, hcolor, fhair = ints[3], ints[4], ints[5], ints[6], ints[7]
    # bakeable skin = has BOTH a base-skin (type0) AND a face (type1) section; some high skin
    # colors have skin but no face -> face bake fails -> green. Clamp skin into that range.
    skin_cols = {c for v, c in VALID.get((g, 0), set())}
    face_skins = {c for v, c in VALID.get((g, 1), set())}
    bakeable = (skin_cols & face_skins) or skin_cols or {0}
    if skin not in bakeable: skin = min(max(bakeable), skin) if skin > min(bakeable) else min(bakeable)
    if skin not in bakeable: skin = min(bakeable)
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

our = [int(l) for l in open(os.path.join(SCRATCH, "f011_disp%s.txt" % SFX)) if l.strip().isdigit()]
updates = []; need_extra = set()
for d in our:
    if d in disp:
        model_id, ext = disp[d]
        if ext > 0:
            updates.append((d, ext))
            need_extra.add(ext)

EXTRA_COLS = ["id","race","gender","skin_color","face_type","hair_style","hair_color","facial_hair",
              "helm_id","shoulders_id","shirt_id","chest_id","belt_id","legs_id","boots_id","wrists_id",
              "gloves_id","tabard_id","cape_id","can_equip","texture"]

with open(os.path.join(ZPAK, "dbc/[F-011]" + SFX + "_creaturedisplayinfo_extfix.sql"), "w") as f:
    f.write("-- F-011 fix: correct extended_display_info_id to real 4.3.4 (Whitemane 15595) values\n\n")
    for d, ext in sorted(updates):
        f.write("UPDATE creaturedisplayinfo SET extended_display_info_id = %d WHERE id = %d;\n" % (ext, d))

with open(os.path.join(ZPAK, "dbc/[F-011]" + SFX + "_creaturedisplayinfoextra.sql"), "w") as f:
    f.write("-- F-011 CreatureDisplayInfoExtra (NPC skin-bake data from Whitemane 15595; race 9 goblin)\n\n")
    for eid in sorted(need_extra):
        if eid not in extra:
            f.write("-- WARN extra %d not in Whitemane DBC\n" % eid); continue
        ints, tex = extra[eid]
        ints = list(ints)
        # equipment restored: Cata-new armor ItemDisplayInfo rows + component textures now ship
        # (build_npc_armor.py). Keep equipment fields 8-18 intact.
        # clamp grooming to valid goblin CharSection combos (Cata values overrun 3.3.5a range
        # -> a missing skin/face/facialhair section fails the whole bake -> green).
        if ints[1] == 9: ints = clamp_goblin(ints)
        if os.environ.get("F011_ZERO_EQUIP") == "1":
            for _j in range(8, 19): ints[_j] = 0   # decisive test: skin-only bake (no equipment)
        vals = ints + ["'%s'" % tex.replace("'", "''")]
        f.write("DELETE FROM creaturedisplayinfoextra WHERE id = %d;\n" % eid)
        f.write("INSERT INTO creaturedisplayinfoextra (%s) VALUES (%s);\n" % (
            ",".join(EXTRA_COLS), ",".join(str(v) for v in vals)))

print("displays updated: %d, extra rows: %d" % (len(updates), len(need_extra)))
print("sample:", updates[:3])
