#!/usr/bin/env python3
"""
F-011: fix the 16 creatures that fell back to display 646 (ghoul) because their real
Cata displays were never imported (Gallywix, mechs, pygmies, triggers). For each:
  - character-goblin display (model 831/832): create CreatureDisplayInfo + Extra (grooming
    clamped) + ship baked NPC texture + creature_model_info + repoint
  - creature-model display already-modelled in client: create CreatureDisplayInfo (+monster
    texture_variation) + creature_model_info + repoint
  - display already in client: just repoint creature_template_model
  - model missing from client (needs retroport): left pending
"""
import struct, os, json, sqlite3, subprocess, shutil
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
ART = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data/art.MPQ"
MPQCLI = "/workspace/project/Zeppelin-Tools/mpqcli/mpqcli"
DBC = os.path.join(SCRATCH, "cata_dbc/base")

def load(p):
    d = open(p, "rb").read(); rc, fc, rs, ss = struct.unpack("<4I", d[4:20]); sb = 20 + rc * rs
    def s(o):
        if o == 0: return ""
        e = d.index(b"\0", sb + o); return d[sb + o:e].decode("latin1")
    return d, rc, rs, s

wd, wrc, wrs, ws = load(DBC + "/CreatureDisplayInfo.dbc")
WDISP = {}
for i in range(wrc):
    b = 20 + i * wrs
    WDISP[struct.unpack_from("<I", wd, b)[0]] = (struct.unpack_from("<i", wd, b+4)[0],
        struct.unpack_from("<i", wd, b+12)[0], struct.unpack_from("<f", wd, b+16)[0],
        ws(struct.unpack_from("<I", wd, b+6*4)[0]))   # texvar1 @ field6
we, werc, wers, wes = load(DBC + "/CreatureDisplayInfoExtra.dbc")
WEXTRA = {}
for i in range(werc):
    b = 20 + i * wers
    WEXTRA[struct.unpack_from("<I", we, b)[0]] = (list(struct.unpack_from("<20i", we, b)),
        wes(struct.unpack_from("<I", we, b + 20*4)[0]))

# our client model ids + existing displays
md, mrc, mrs, mms = load("/workspace/project/data/dbc/CreatureModelData.dbc")
OURMODELS = set(struct.unpack_from("<I", md, 20 + i*mrs)[0] for i in range(mrc))
di, drc, drs, dds = load("/workspace/project/data/dbc/CreatureDisplayInfo.dbc")
OURDISP = set(struct.unpack_from("<I", di, 20 + i*drs)[0] for i in range(drc))

# valid goblin CharSection combos (clamp)
cs, crc, crs, _ = load("/workspace/project/data/dbc/CharSections.dbc")
VALID = {}
for i in range(crc):
    b = 20 + i*crs
    if struct.unpack_from("<i", cs, b+4)[0] == 9:
        g = struct.unpack_from("<i", cs, b+8)[0]; t = struct.unpack_from("<i", cs, b+12)[0]
        VALID.setdefault((g, t), set()).add((struct.unpack_from("<i", cs, b+32)[0], struct.unpack_from("<i", cs, b+36)[0]))
def clamp(ints):
    g = ints[2]; skin, face, hs, hc, fh = ints[3:8]
    sc = {c for v, c in VALID.get((g,0), set())}; fsk = {c for v, c in VALID.get((g,1), set())}
    bak = (sc & fsk) or sc or {0}
    if skin not in bak: skin = min(bak)
    if (face, skin) not in VALID.get((g,1), set()):
        cand = sorted(v for v, c in VALID.get((g,1), set()) if c == skin); face = cand[0] if cand else 0
    if fh != 0 and (fh, hc) not in VALID.get((g,2), set()): fh = 0
    ints[3:8] = [skin, face, hs, hc, fh]; return ints

# the 16 creatures -> source display (modelid1)
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
import subprocess as sp
def q(sql):
    return sp.run(["python3","-m","cli.zep","world","sql","query",sql],cwd="/workspace/project/Zeppelin-Craft",capture_output=True,text=True).stdout
ents = [int(l.split("\t")[0]) for l in q("SELECT ct.entry FROM creature_template ct JOIN creature_template_model ctm ON ctm.CreatureID=ct.entry WHERE ctm.CreatureDisplayID=646 AND ct.entry BETWEEN 34000 AND 52000").splitlines() if l.split("\t")[0].strip().isdigit()]
cre_disp = {}
for e in ents:
    r = c.execute("SELECT modelid1 FROM creature_template WHERE TRIM(entry)=?", (str(e),)).fetchone()
    cre_disp[e] = int(str(r["modelid1"]).strip() or 0)

DI_COLS = ["id","model_id","sound_id","extended_display_info_id","creature_model_scale","creature_model_alpha",
           "texture_variation_1","texture_variation_2","texture_variation_3","portrait_texture_name",
           "blood_level","blood_id","npc_sound_id","praticle_color_id","creature_geoset_data","obj_effect_package_id"]
EXTRA_COLS = ["id","race","gender","skin_color","face_type","hair_style","hair_color","facial_hair",
              "helm_id","shoulders_id","shirt_id","chest_id","belt_id","legs_id","boots_id","wrists_id",
              "gloves_id","tabard_id","cape_id","can_equip","texture"]

new_cdi = {}; new_extra = {}; new_minfo = {}; repoint = {}; baked = []; pending = []
work = os.path.join(SCRATCH, "fb_baked"); os.makedirs(work, exist_ok=True)
def esc(v): return "'" + v.replace("\\","\\\\").replace("'","''") + "'" if isinstance(v, str) else str(v)

for e, D in cre_disp.items():
    wm = WDISP.get(D)
    if not wm:
        pending.append((e, D, "no whitemane display")); continue
    model, ext, scale, texvar = wm
    if D in OURDISP:
        repoint[e] = D; continue                      # display already there, just repoint
    if model not in OURMODELS:
        pending.append((e, D, "model %d missing (retroport)" % model)); continue
    # build the display
    is_char = model in (831, 832)
    gender = 0
    if is_char and ext in WEXTRA:
        ints, bakename = WEXTRA[ext]; ints = clamp(list(ints)); gender = ints[2]
        new_extra[ext] = (ints, bakename)
        new_cdi[D] = [D, model, 0, ext, scale, 255, "", "", "", "", 1, 0, 0, 0, 0, 0]
        baked.append((ext, bakename))
    else:
        new_cdi[D] = [D, model, 0, 0, scale, 255, texvar, "", "", "", 0, 0, 0, 0, 0, 0]
    new_minfo[D] = gender
    repoint[e] = D

# ship baked textures for character displays
for ext, name in baked:
    if not name: name = "CreatureDisplayExtra-%05d.blp" % ext
    sp.run([MPQCLI,"extract",ART,"-f","Textures\\BakedNpcTextures\\"+name,"-o",work,"-k"], capture_output=True)
    local = os.path.join(work, "Textures", "BakedNpcTextures", name)
    if os.path.isfile(local):
        for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(root, "Textures", "BakedNpcTextures", name); os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(local, dst)

# write DBC
with open(ZPAK + "/dbc/[F-011]_fallback646_displays.sql", "w") as f:
    f.write("-- F-011 import real displays for creatures that fell back to ghoul display 646\n\n")
    for D, row in sorted(new_cdi.items()):
        f.write("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % D)
        f.write("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (",".join(DI_COLS), ",".join(esc(v) for v in row)))
    f.write("\n")
    for ext, (ints, bakename) in sorted(new_extra.items()):
        f.write("DELETE FROM creaturedisplayinfoextra WHERE id=%d;\n" % ext)
        f.write("INSERT INTO creaturedisplayinfoextra (%s) VALUES (%s);\n" % (",".join(EXTRA_COLS), ",".join(str(v) for v in ints) + ",'%s'" % bakename))
# write server SQL (model_info + repoint)
with open(ZPAK + "/sql/zz_[F-011]_fallback646_repoint.sql", "w") as f:
    f.write("-- F-011 repoint ghoul-fallback creatures to their real displays + creature_model_info\n\n")
    if new_minfo:
        f.write("DELETE FROM creature_model_info WHERE DisplayID IN (%s);\n" % ",".join(str(d) for d in sorted(new_minfo)))
        f.write("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES\n")
        f.write(",\n".join("  (%d,0.5,1.5,%d,0,0)" % (d, g) for d, g in sorted(new_minfo.items())) + ";\n\n")
    for e, D in sorted(repoint.items()):
        f.write("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (D, e))
print("repointed creatures: %d | new displays: %d | new extras: %d | baked shipped: %d" % (len(repoint), len(new_cdi), len(new_extra), len(baked)))
print("PENDING (need retroport):", pending)
