#!/usr/bin/env python3
"""
F-011 NPC armor: port the Cata-new equipment ItemDisplayInfo rows (WotLK-identical
string layout) into our itemdisplayinfo DBC and ship the referenced component textures
+ attachment models from Whitemane art.MPQ. Then restore equipment on the NPC bakes.
"""
import struct, os, json, subprocess, shutil
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
ART = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data/art.MPQ"
MPQCLI = "/workspace/project/Zeppelin-Tools/mpqcli/mpqcli"
IDI = os.path.join(SCRATCH, "cata_dbc/base/ItemDisplayInfo.dbc")

missing = set(json.load(open(os.path.join(SCRATCH, "npc_equip_missing.json"))))

d = open(IDI, "rb").read(); rc, fc, rs, ss = struct.unpack("<4I", d[4:20]); sb = 20 + rc * rs
def sstr(o):
    e = d.index(b"\0", sb + o); return d[sb + o:e].decode("latin1")
COLS = ["id","left_model","right_model","left_model_texture","right_model_texture","icon_1","icon_2",
        "geoset_group_1","geoset_group_2","geoset_group_3","flags","spell_visual_id","group_sound_index",
        "helmet_geoset_male","helmet_geoset_female","upper_arm_texture","lower_arm_texture","hands_texture",
        "upper_torso_texture","lower_torso_texture","upper_leg_texture","lower_leg_texture","foot_texture",
        "item_visual","particle_colour_id"]
STRF = {1,2,3,4,5,6,15,16,17,18,19,20,21,22}  # string field indices

rows = {}
for i in range(rc):
    b = 20 + i * rs
    rid = struct.unpack_from("<I", d, b)[0]
    if rid not in missing: continue
    vals = []
    for f in range(fc):
        if f in STRF:
            vals.append(sstr(struct.unpack_from("<I", d, b + f*4)[0]))
        else:
            vals.append(struct.unpack_from("<i", d, b + f*4)[0])
    rows[rid] = vals
print("missing rows read:", len(rows))

# --- art.MPQ indexes ---
idx_base = {}    # basename(lower,no ext) -> [orig paths]   (for attachment models/textures)
idx_lower = {}   # lower full path -> orig path             (for exact component lookup)
for line in open(os.path.join(SCRATCH, "art_item_index.txt"), encoding="latin1"):
    p = line.strip()
    if not p: continue
    idx_lower[p.lower()] = p
    base = os.path.splitext(p.rsplit("\\", 1)[-1])[0].lower()
    idx_base.setdefault(base, []).append(p)

REGION = {15:"armuppertexture",16:"armlowertexture",17:"handtexture",18:"torsouppertexture",
          19:"torsolowertexture",20:"leguppertexture",21:"leglowertexture",22:"foottexture"}
want = set()
for rid, v in rows.items():
    # attachment models (1,2) + model textures (3,4): match by basename
    for f in (1, 2, 3, 4):
        nm = v[f].strip()
        if nm:
            base = os.path.splitext(nm.rsplit("\\", 1)[-1])[0].lower()
            for pth in idx_base.get(base, []): want.add(pth)
    # component textures (15-22): construct region\name_<gender>.blp candidates
    for f, rdir in REGION.items():
        nm = v[f].strip()
        if not nm: continue
        for g in ("_M", "_F", "_U", ""):
            cand = ("item\\texturecomponents\\%s\\%s%s.blp" % (rdir, nm, g)).lower()
            if cand in idx_lower: want.add(idx_lower[cand])
print("distinct assets to ship:", len(want))

# extract + ship
work = os.path.join(SCRATCH, "armor_work"); os.makedirs(work, exist_ok=True)
shipped = 0
for pth in sorted(want):
    fwd = pth.replace("\\", "/")
    r = subprocess.run([MPQCLI, "extract", ART, "-f", pth, "-o", work, "-k"], capture_output=True)
    local = os.path.join(work, fwd)
    if os.path.isfile(local):
        for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(root, fwd); os.makedirs(os.path.dirname(dst), exist_ok=True)
            shutil.copy2(local, dst)
        shipped += 1
print("assets shipped:", shipped, "of", len(want))

# --- itemdisplayinfo rows ---
def esc(v, f):
    if f in STRF: return "'" + str(v).replace("\\","\\\\").replace("'","''") + "'"
    return str(v)
with open(ZPAK + "/dbc/[F-011]_itemdisplayinfo_equip.sql", "w") as f:
    f.write("-- F-011 NPC equipment ItemDisplayInfo (Cata-new, WotLK layout) from Whitemane 15595\n\n")
    for rid in sorted(rows):
        v = rows[rid]
        f.write("DELETE FROM itemdisplayinfo WHERE id=%d;\n" % rid)
        f.write("INSERT INTO itemdisplayinfo (%s) VALUES (%s);\n" % (
            ",".join(COLS), ",".join(esc(v[i], i) for i in range(len(COLS)))))
print("wrote %d itemdisplayinfo rows" % len(rows))
