#!/usr/bin/env python3
"""
F-011 ACTUAL green-NPC fix: this 3.3.5a client does NOT runtime-bake NPC character skins —
it loads PRE-BAKED textures from Textures\\BakedNpcTextures\\CreatureDisplayExtra-<id>.blp
(worgoblin ships 15091 of these). My custom NPC extras referenced BakeNames that were never
generated -> green. Whitemane's art.MPQ ships the matching baked BLPs (same extra IDs).
Extract each of my NPCs' baked texture (by the extra's BakeName) and ship it to the zpak.
"""
import struct, os, json, subprocess, shutil
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
AL = "/workspace/project/Zeppelin-Tools/Asset Library/GAME ASSETS"
ART = "/workspace/project/Zeppelin-Tools/whitemane-15595/Data/art.MPQ"
MPQCLI = "/workspace/project/Zeppelin-Tools/mpqcli/mpqcli"

extras = json.load(open(os.path.join(SCRATCH, "my_baked_extras.json")))

# read each extra's BakeName (texture field) from the live client DBC
d = open("/workspace/project/data/dbc/CreatureDisplayInfoExtra.dbc", "rb").read()
rc, fc, rs, ss = struct.unpack("<4I", d[4:20]); sb = 20 + rc * rs
def s(o):
    if o == 0: return ""
    e = d.index(b"\0", sb + o); return d[sb + o:e].decode("latin1")
bake = {}
for i in range(rc):
    b = 20 + i * rs
    rid = struct.unpack_from("<I", d, b)[0]
    if rid in set(extras):
        bake[rid] = s(struct.unpack_from("<I", d, b + 20 * 4)[0])

work = os.path.join(SCRATCH, "baked_work"); os.makedirs(work, exist_ok=True)
shipped = 0; missing = []
for rid in extras:
    name = bake.get(rid) or ("CreatureDisplayExtra-%05d.blp" % rid)
    internal = "Textures\\BakedNpcTextures\\" + name
    r = subprocess.run([MPQCLI, "extract", ART, "-f", internal, "-o", work, "-k"], capture_output=True)
    local = os.path.join(work, "Textures", "BakedNpcTextures", name)
    if not os.path.isfile(local):
        # try zero-padded variant
        alt = "CreatureDisplayExtra-%05d.blp" % rid
        subprocess.run([MPQCLI, "extract", ART, "-f", "Textures\\BakedNpcTextures\\" + alt, "-o", work, "-k"], capture_output=True)
        local = os.path.join(work, "Textures", "BakedNpcTextures", alt); name = alt
    if os.path.isfile(local):
        for root in (AL, os.path.join(ZPAK, "mpq/source-assets")):
            dst = os.path.join(root, "Textures", "BakedNpcTextures", name)
            os.makedirs(os.path.dirname(dst), exist_ok=True); shutil.copy2(local, dst)
        shipped += 1
    else:
        missing.append((rid, name))
print("baked NPC textures shipped: %d of %d" % (shipped, len(extras)))
if missing: print("MISSING:", missing[:12])
