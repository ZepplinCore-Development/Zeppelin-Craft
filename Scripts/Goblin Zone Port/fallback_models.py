#!/usr/bin/env python3
"""
Retroport the 8 fallback creature models (extract Whitemane -> MultiConverter v272->264 ->
ship) and wire them up: minimal CreatureModelData + CreatureDisplayInfo (client PATCH-Z),
creature_model_info (server), and repoint creature_template_model to the real display.
"""
import os, json, struct, subprocess, shutil, glob
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
D = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data"
RT = "/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/MultiConverter2"
WORK = os.path.join(SCRATCH, "rp_cre")
MPQS = ["expansion3", "expansion2", "expansion1", "world2", "world", "OldWorld", "art", "alternate", "base-Win"]
CLI = "/workspace/project/Zeppelin-Craft"
SCREEN = "/workspace/project/Zeppelin-Tools/Retroport/scripts/m2_screen.py"

def extract(internal, dest):
    fn = internal.replace("\\", "/").split("/")[-1]
    for mpq in MPQS:
        p = os.path.join(D, mpq + ".MPQ")
        if not os.path.isfile(p): continue
        subprocess.run(["python3", "-m", "cli.zep", "build", "mpq-tools", "extract", p, dest,
                        "-f", internal.replace("\\", "/")], cwd=CLI, capture_output=True)
        if os.path.isfile(os.path.join(dest, fn)): return os.path.join(dest, fn)
    return None

def m2_info(path):
    d = open(path, "rb").read()
    nViews = struct.unpack_from("<I", d, 0x44)[0]
    nTex, ofsTex = struct.unpack_from("<II", d, 0x50)
    texs = []
    for i in range(nTex):
        typ, fl, ln, of = struct.unpack_from("<IIII", d, ofsTex + i*16)
        if typ == 0 and 0 < of <= len(d):
            texs.append(d[of:of+ln].split(b"\0")[0].decode("latin1"))
    return nViews, texs

needmodel = json.load(open(os.path.join(SCRATCH, "fb_plan.json")))["needmodel"]
# unique by model path -> (display, model_id, path)
bymodel = {}
for e, n, d0, mid, p in needmodel:
    bymodel.setdefault(p, (d0, mid, p))
print("distinct models to retroport:", len(bymodel))

conv_ok = {}
for path, (d0, mid, p) in bymodel.items():
    rel = p.replace("\\", "/")
    m2_internal = rel[:-4] + ".m2" if rel.lower().endswith(".mdx") else rel
    base = m2_internal.rsplit("/", 1)[-1][:-3]; reldir = m2_internal.rsplit("/", 1)[0]
    os.makedirs(WORK, exist_ok=True)
    for x in glob.glob(os.path.join(WORK, "*")): os.remove(x)
    m2 = extract(m2_internal, WORK)
    if not m2:
        print("  NO M2:", path); continue
    nViews, texs = m2_info(m2)
    for nn in range(max(nViews, 1)): extract(reldir + "/" + base + "%02d.skin" % nn, WORK)
    for x in glob.glob(os.path.join(WORK, "*")): shutil.copy2(x, os.path.join(RT, os.path.basename(x)))
    if os.path.isfile(os.path.join(RT, "error.log")): os.remove(os.path.join(RT, "error.log"))
    subprocess.run(["env", "WINEPREFIX=%s/.wine-retroport" % os.path.expanduser("~"), "WINEDEBUG=-all",
                    os.path.expanduser("~/.local/wine/bin/wine"), "MultiConverter_Console.exe", os.path.basename(m2)],
                   cwd=RT, input="\n", text=True, capture_output=True)
    cm2 = os.path.join(RT, os.path.basename(m2))
    ver = struct.unpack_from("<I", open(cm2, "rb").read(), 4)[0] if os.path.isfile(cm2) else 0
    scr = subprocess.run(["python3", SCREEN, cm2], capture_output=True, text=True).stdout
    atk = "attack reachable:       PASS" in scr
    if ver != 264:
        print("  CONVERT FAIL ver=%d %s" % (ver, path)); continue
    # ship m2+skins+textures
    def ship(fname, srcdir, dstrel):
        src = os.path.join(srcdir, fname)
        if not os.path.isfile(src): return
        for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(root, dstrel, fname); os.makedirs(os.path.dirname(dst), exist_ok=True)
            shutil.copy2(src, dst)
    ship(os.path.basename(m2), RT, reldir)
    for nn in range(max(nViews, 1)): ship(base + "%02d.skin" % nn, RT, reldir)
    for tex in texs:
        td = tex.replace("\\", "/"); tf = extract(td, WORK)
        if tf:
            for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
                dst = os.path.join(root, td); os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(tf, dst)
    conv_ok[path] = (d0, mid, m2_internal.replace("/", "\\"), atk)
    print("  OK v264 attack=%s %s" % (atk, path))

# ---- DBC + SQL wiring for converted models ----
MD_COLS = ["id","flags","model_path","size_class","model_scale","blood_id","footprint_texture_id",
           "footprint_texture_length","footprint_texture_width","footprint_particle_scale","foley_material_id",
           "footstep_shake_size","death_thud_shake_size","sound_data","collision_width","collision_height",
           "mount_height","geo_box_min_x","geo_box_min_y","geo_box_min_z","geo_box_max_x","geo_box_max_y",
           "geo_box_max_z","world_effect_scale","attached_effect_scale","missile_collision_radius",
           "missile_collision_push","missile_collision_raise"]
DI_COLS = ["id","model_id","sound_id","extended_display_info_id","creature_model_scale","creature_model_alpha",
           "texture_variation_1","texture_variation_2","texture_variation_3","portrait_texture_name",
           "blood_level","blood_id","npc_sound_id","praticle_color_id","creature_geoset_data","obj_effect_package_id"]

mds = {}; dis = {}; minfo = []; repoint2 = []
for e, n, d0, mid, p in needmodel:
    if p not in conv_ok: continue
    _, _, mpath, atk = conv_ok[p]
    mds[mid] = mpath
    dis[d0] = mid
    minfo.append(d0)
    repoint2.append((e, d0))

def esc(v): return "'" + v.replace("\\","\\\\").replace("'","''") + "'" if isinstance(v, str) else str(v)
with open(ZPAK + "/dbc/[F-011]_fallback_creaturemodeldata.sql", "w") as f:
    f.write("-- F-011 fallback creature models (retroported, minimal 3.3.5a rows)\n\n")
    for mid, mpath in sorted(mds.items()):
        vals = [mid, 0, mpath, 1, 1.0, 0, 0, 0,0,0, 0,0,0,0, 1.0, 2.5, 0, -1,-1,-1, 1,1,2, 1.0,1.0, 0,0,0]
        f.write("DELETE FROM creaturemodeldata WHERE id=%d;\n" % mid)
        f.write("INSERT INTO creaturemodeldata (%s) VALUES (%s);\n" % (",".join(MD_COLS), ",".join(esc(v) for v in vals)))
with open(ZPAK + "/dbc/[F-011]_fallback_creaturedisplayinfo.sql", "w") as f:
    f.write("-- F-011 fallback creature displays (point at retroported models; embedded textures)\n\n")
    for d0, mid in sorted(dis.items()):
        vals = [d0, mid, 0, 0, 1.0, 255, "", "", "", "", 0, 0, 0, 0, 0, 0]
        f.write("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % d0)
        f.write("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (",".join(DI_COLS), ",".join(esc(v) for v in vals)))
with open(ZPAK + "/sql/zz_[F-011]_fallback_modelinfo.sql", "w") as f:
    f.write("-- F-011 fallback creature_model_info + repoint\n\n")
    if minfo:
        f.write("DELETE FROM creature_model_info WHERE DisplayID IN (%s);\n" % ",".join(str(d) for d in sorted(set(minfo))))
        f.write("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES\n")
        f.write(",\n".join("  (%d,0.5,1.5,2,0,0)" % d for d in sorted(set(minfo))) + ";\n\n")
    for e, d0 in sorted(set(repoint2)):
        f.write("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (d0, e))
print("wired: %d models, %d displays, %d creatures repointed" % (len(mds), len(dis), len(set(repoint2))))
