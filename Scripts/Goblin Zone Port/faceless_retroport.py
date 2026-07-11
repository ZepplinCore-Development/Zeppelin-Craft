#!/usr/bin/env python3
"""
F-011 retroport the last ghoul-fallback creature: Faceless of the Deep (38448),
model 3327 CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2 (Cata v272 -> WotLK v264).
Monster model (texture_variation 'FacelessoneAquatic1Green', no bake). Ships M2+skins+
texture, wires CreatureModelData + CreatureDisplayInfo(31674) + creature_model_info + repoint.
"""
import os, struct, subprocess, shutil, glob
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
D = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data"
RT = "/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/MultiConverter2"
CLI = "/workspace/project/Zeppelin-Craft"
WORK = os.path.join(SCRATCH, "faceless_rp"); os.makedirs(WORK, exist_ok=True)
MPQS = ["expansion3", "expansion2", "expansion1", "world2", "world", "OldWorld", "art", "base-Win"]
MODEL = "CREATURE/FACELESSONEAQUATIC/FACELESSONEAQUATIC.M2"
RELDIR = "CREATURE/FACELESSONEAQUATIC"
TEXVAR = "FacelessoneAquatic1Green"
DISPLAY, MODELID, CREATURE = 31674, 3327, 38448

def extract(internal, dest):
    fn = internal.split("/")[-1]
    for mpq in MPQS:
        p = os.path.join(D, mpq + ".MPQ")
        if not os.path.isfile(p): continue
        subprocess.run(["python3","-m","cli.zep","build","mpq-tools","extract",p,dest,"-f",internal],
                       cwd=CLI, capture_output=True)
        if os.path.isfile(os.path.join(dest, fn)): return os.path.join(dest, fn)
    return None

for x in glob.glob(os.path.join(WORK, "*")): os.remove(x)
m2 = extract(MODEL, WORK)
assert m2, "FACELESSONEAQUATIC.M2 not found in Whitemane"
nViews = struct.unpack_from("<I", open(m2, "rb").read(), 0x44)[0]
base = os.path.basename(m2)[:-3]
for nn in range(max(nViews, 1)): extract(RELDIR + "/" + base + "%02d.skin" % nn, WORK)
for x in glob.glob(os.path.join(WORK, "*")): shutil.copy2(x, os.path.join(RT, os.path.basename(x)))
subprocess.run(["env","WINEPREFIX=%s/.wine-retroport" % os.path.expanduser("~"),"WINEDEBUG=-all",
                os.path.expanduser("~/.local/wine/bin/wine"),"MultiConverter_Console.exe", os.path.basename(m2)],
               cwd=RT, input="\n", text=True, capture_output=True)
cm2 = os.path.join(RT, os.path.basename(m2))
ver = struct.unpack_from("<I", open(cm2, "rb").read(), 4)[0] if os.path.isfile(cm2) else 0
print("converted version:", ver, "(want 264)")

def ship(fname, srcdir, dstrel):
    src = os.path.join(srcdir, fname)
    if not os.path.isfile(src): return False
    for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
        dst = os.path.join(root, dstrel, fname); os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(src, dst)
    return True
if ver == 264:
    ship(os.path.basename(m2), RT, RELDIR)
    for nn in range(max(nViews, 1)): ship(base + "%02d.skin" % nn, RT, RELDIR)
    tf = extract(RELDIR + "/" + TEXVAR + ".blp", WORK)
    if tf: ship(TEXVAR + ".blp", WORK, RELDIR)
    print("shipped M2 + %d skins + texture=%s" % (max(nViews,1), bool(tf)))

# ---- wiring ----
MD_COLS = ["id","flags","model_path","size_class","model_scale","blood_id","footprint_texture_id",
           "footprint_texture_length","footprint_texture_width","footprint_particle_scale","foley_material_id",
           "footstep_shake_size","death_thud_shake_size","sound_data","collision_width","collision_height",
           "mount_height","geo_box_min_x","geo_box_min_y","geo_box_min_z","geo_box_max_x","geo_box_max_y",
           "geo_box_max_z","world_effect_scale","attached_effect_scale","missile_collision_radius",
           "missile_collision_push","missile_collision_raise"]
DI_COLS = ["id","model_id","sound_id","extended_display_info_id","creature_model_scale","creature_model_alpha",
           "texture_variation_1","texture_variation_2","texture_variation_3","portrait_texture_name",
           "blood_level","blood_id","npc_sound_id","praticle_color_id","creature_geoset_data","obj_effect_package_id"]
def esc(v): return "'" + v.replace("\\","\\\\").replace("'","''") + "'" if isinstance(v, str) else str(v)
mdpath = "CREATURE\\FACELESSONEAQUATIC\\FACELESSONEAQUATIC.M2"
with open(ZPAK + "/dbc/[F-011]_faceless_retroport.sql", "w") as f:
    f.write("-- F-011 Faceless of the Deep (38448) retroported model 3327 + display 31674\n\n")
    md = [MODELID,0,mdpath,1,1.0,0,0,0,0,0,0,0,0,0,1.0,2.5,0,-1,-1,-1,1,1,2,1.0,1.0,0,0,0]
    f.write("DELETE FROM creaturemodeldata WHERE id=%d;\n" % MODELID)
    f.write("INSERT INTO creaturemodeldata (%s) VALUES (%s);\n" % (",".join(MD_COLS), ",".join(esc(v) for v in md)))
    di = [DISPLAY, MODELID, 0, 0, 1.0, 255, TEXVAR, "", "", "", 0, 0, 0, 0, 0, 0]
    f.write("DELETE FROM creaturedisplayinfo WHERE id=%d;\n" % DISPLAY)
    f.write("INSERT INTO creaturedisplayinfo (%s) VALUES (%s);\n" % (",".join(DI_COLS), ",".join(esc(v) for v in di)))
with open(ZPAK + "/sql/zz_[F-011]_faceless_repoint.sql", "w") as f:
    f.write("-- F-011 Faceless of the Deep model_info + repoint off ghoul fallback 646\n\n")
    f.write("DELETE FROM creature_model_info WHERE DisplayID=%d;\n" % DISPLAY)
    f.write("INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES (%d,1.0,3.0,2,0,0);\n\n" % DISPLAY)
    f.write("UPDATE creature_template_model SET CreatureDisplayID=%d WHERE CreatureID=%d;\n" % (DISPLAY, CREATURE))
print("wired display %d / model %d / repoint creature %d" % (DISPLAY, MODELID, CREATURE))
