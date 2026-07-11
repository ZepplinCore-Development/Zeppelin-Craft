#!/usr/bin/env python3
"""
Source item icons for all custom F-011 items: resolve wago IconFileDataID -> icon name
via listfile, create ItemDisplayInfo rows (200100+), set item_template.displayid, and
ship the icon BLPs from the Whitemane client.
"""
import csv, json, os, subprocess
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
D = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data"
LISTFILE = "/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/M2Mod_9.3.1-CLI/mappings/listfile.csv"
CLI = "/workspace/project/Zeppelin-Craft"
IDI_BASE = 200100

remap = {int(k): v for k, v in json.load(open(os.path.join(SCRATCH, "item_remap.json"))).items()}
# item -> IconFileDataID
fdid = {}
with open(os.path.join(SCRATCH, "item_442.csv"), newline='', encoding='utf-8') as f:
    for r in csv.DictReader(f):
        try: i = int(r['ID'])
        except: continue
        if i in remap:
            v = r.get('IconFileDataID')
            if v and v.strip().isdigit() and int(v) > 0: fdid[i] = int(v)
need_fdids = set(fdid.values())
print("custom items:", len(remap), "| with IconFileDataID:", len(fdid), "| distinct FDIDs:", len(need_fdids))

# FDID -> icon name (basename, no ext) from listfile
fdpath = {}
with open(LISTFILE, encoding='utf-8', errors='replace') as f:
    for line in f:
        if ";" not in line: continue
        a, b = line.split(";", 1)
        if a.isdigit() and int(a) in need_fdids:
            fdpath[int(a)] = b.strip()
def iconname(fd):
    p = fdpath.get(fd, "")
    if not p or "icons/" not in p.lower(): return None
    return os.path.splitext(os.path.basename(p))[0]

# dedupe icon names -> ItemDisplayInfo id
icon_ids = {}
item_disp = {}
for it, newid in remap.items():
    fd = fdid.get(it); nm = iconname(fd) if fd else None
    if not nm: continue
    if nm not in icon_ids:
        icon_ids[nm] = IDI_BASE + len(icon_ids)
    item_disp[newid] = icon_ids[nm]
print("distinct icons:", len(icon_ids), "| items with a resolved icon:", len(item_disp))

def esc(v): return "'" + v.replace("'", "''") + "'" if isinstance(v, str) else str(v)
# ItemDisplayInfo DBC rows
with open(ZPAK + "/dbc/[F-011]_itemdisplayinfo.sql", "w") as f:
    f.write("-- F-011 item icons (ItemDisplayInfo; icon_1 = InventoryIcon name from wago/listfile)\n\n")
    for nm, did in sorted(icon_ids.items(), key=lambda x: x[1]):
        f.write("DELETE FROM itemdisplayinfo WHERE id=%d;\n" % did)
        f.write("INSERT INTO itemdisplayinfo (id, icon_1, icon_2) VALUES (%d, %s, '');\n" % (did, esc(nm)))
# set item_template.displayid
with open(ZPAK + "/sql/zz_[F-011]_item_icons.sql", "w") as f:
    f.write("-- F-011 set item_template.displayid to the ItemDisplayInfo icon rows\n\n")
    for newid, did in sorted(item_disp.items()):
        f.write("UPDATE item_template SET displayid=%d WHERE entry=%d;\n" % (did, newid))

# ship icon BLPs from Whitemane
shipped = 0; missing = []
MPQS = ["art", "base-Win", "world", "world2", "expansion3", "OldWorld"]
for nm in sorted(icon_ids):
    internal = "Interface/Icons/%s.blp" % nm
    dest = os.path.join(SCRATCH, "icon_tmp")
    os.makedirs(dest, exist_ok=True)
    got = None
    for mpq in MPQS:
        p = os.path.join(D, mpq + ".MPQ")
        if not os.path.isfile(p): continue
        subprocess.run(["python3", "-m", "cli.zep", "build", "mpq-tools", "extract", p, dest, "-f", internal],
                       cwd=CLI, capture_output=True)
        cand = os.path.join(dest, "%s.blp" % nm)
        if os.path.isfile(cand): got = cand; break
    if got:
        for root in ("/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS",
                     os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(root, "Interface", "Icons", "%s.blp" % nm)
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            import shutil; shutil.copy2(got, dst)
        os.remove(got); shipped += 1
    else:
        missing.append(nm)
print("icon BLPs shipped: %d | not found (likely stock in client): %d" % (shipped, len(missing)))
print("sample missing (stock):", missing[:8])
