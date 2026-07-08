#!/usr/bin/env python3
"""
Batch-retroport missing GO models: extract Cata M2+skins+textures from Whitemane 15595,
MultiConverter v272->264, ship to Asset Library + zpak source-assets.
"""
import os, json, struct, subprocess, shutil, glob
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
D = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data"
RT = "/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/MultiConverter2"
WORK = os.path.join(SCRATCH, "rp_work")
MPQS = ["world2", "world", "expansion3", "art", "OldWorld", "alternate"]
CLI = "/workspace/project/Zeppelin-Craft"

def extract(internal, dest):
    """Extract internal MPQ path to dest dir (flat). Returns extracted file path or None."""
    fn = internal.replace("\\", "/").split("/")[-1]
    for mpq in MPQS:
        p = os.path.join(D, mpq + ".MPQ")
        if not os.path.isfile(p): continue
        subprocess.run(["python3", "-m", "cli.zep", "build", "mpq-tools", "extract", p, dest,
                        "-f", internal.replace("\\", "/")], cwd=CLI, capture_output=True)
        if os.path.isfile(os.path.join(dest, fn)):
            return os.path.join(dest, fn)
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

# model paths to ship = go_disp_paths (LI + K) not already shipped
shipped = set(l.strip() for l in open(os.path.join(SCRATCH, "shipped_m2.txt")))
paths = {}
for f in ("go_disp_paths.json", "go_disp_paths_K.json"):
    for did, p in json.load(open(os.path.join(SCRATCH, f))).items():
        norm = p.replace("\\", "/").lower().replace(".mdx", ".m2")
        if norm not in shipped:
            paths[norm] = p   # keep original-case wago path
todo = sorted(set(paths.values()), key=lambda x: x.lower())
print("GO models to retroport:", len(todo))

ok = []; fail = []
for orig in todo:
    rel = orig.replace("\\", "/")           # e.g. world/generic/.../goblin_crate_01.mdx
    m2_internal = rel[:-4] + ".m2" if rel.lower().endswith(".mdx") else rel
    base = m2_internal.rsplit("/", 1)[-1][:-3]   # model base name (no .m2)
    reldir = m2_internal.rsplit("/", 1)[0]
    os.makedirs(WORK, exist_ok=True)
    for x in glob.glob(os.path.join(WORK, "*")): os.remove(x)
    m2 = extract(m2_internal, WORK)
    if not m2:
        fail.append((orig, "no m2")); continue
    nViews, texs = m2_info(m2)
    # skins: <base>0N.skin
    for n in range(max(nViews, 1)):
        extract(reldir + "/" + base + "%02d.skin" % n, WORK)
    # convert with MultiConverter (needs m2 + skins in same dir as exe)
    for x in glob.glob(os.path.join(WORK, "*")): shutil.copy2(x, os.path.join(RT, os.path.basename(x)))
    m2name = os.path.basename(m2)
    if os.path.isfile(os.path.join(RT, "error.log")): os.remove(os.path.join(RT, "error.log"))
    subprocess.run(["env", "WINEPREFIX=%s/.wine-retroport" % os.path.expanduser("~"), "WINEDEBUG=-all",
                    os.path.expanduser("~/.local/wine/bin/wine"), "MultiConverter_Console.exe", m2name],
                   cwd=RT, input="\n", text=True, capture_output=True)
    cm2 = os.path.join(RT, m2name)
    ver = struct.unpack_from("<I", open(cm2, "rb").read(), 4)[0] if os.path.isfile(cm2) else 0
    if ver != 264:
        fail.append((orig, "convert ver=%d" % ver)); continue
    # ship: converted m2 + skins to Asset Library + zpak source-assets (at reldir path), textures too
    def ship(fname, srcdir):
        src = os.path.join(srcdir, fname)
        if not os.path.isfile(src): return
        for dstroot in (AL, os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(dstroot, reldir, fname)
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            shutil.copy2(src, dst)
    ship(m2name, RT)
    for n in range(max(nViews, 1)):
        ship(base + "%02d.skin" % n, RT)
    # textures: extract + ship at their own paths
    for tex in texs:
        td = tex.replace("\\", "/")
        tf = extract(td, WORK)
        if tf:
            for dstroot in (AL, os.path.join(ZPAK, "mpq/source-assets")):
                dst = os.path.join(dstroot, td)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(tf, dst)
    ok.append(orig)

print("converted+shipped: %d, failed: %d" % (len(ok), len(fail)))
for o, why in fail[:20]: print("  FAIL", why, o)
json.dump({"ok": ok, "fail": fail}, open(os.path.join(SCRATCH, "retroport_result.json"), "w"))
