#!/usr/bin/env python3
"""Scan OA Kalimdor ADTs for MCNK AreaIDs; locate Lost Isles / Kezan tiles."""
import sys, os, glob, re, struct

ADT_DIR = "/workspace/project/Zeppelin-Craft/zpaks/patch-open-azeroth/mpq/parsed-assets/WORLD/MAPS/KALIMDOR"

KEZAN = {4737,4765,4766,4767,4768,4770,4771,4772,4773,4822,4823,4838,4840,
         60027,60028,60029,60030,60031,60032,60033,60034,60035,60036,60037}
LOST = {4720,4721,4778,4779,4780,4781,4782,4783,4784,4785,4802,4816,4870,4871,
        4873,4874,4876,4877,4886,4899,4900,4901,4902,4903,4909,4911,4912,4914,
        4923,4924,4951,4952,4954,4956,4958}
ALL = KEZAN | LOST

def area_ids_of_adt(path):
    """Return set of MCNK AreaIDs in an ADT by walking top-level chunks."""
    ids = set()
    with open(path, "rb") as f:
        data = f.read()
    n = len(data); i = 0
    # top-level chunks: 4-char magic (reversed) + uint32 size + payload
    while i + 8 <= n:
        magic = data[i:i+4]
        size = struct.unpack_from("<I", data, i+4)[0]
        body = i + 8
        if magic == b"KNCM":  # 'MCNK' reversed
            # MCNK header: AreaID at offset 52 (uint32)
            if body + 56 <= n:
                aid = struct.unpack_from("<I", data, body+52)[0]
                if aid:
                    ids.add(aid)
        i = body + size
    return ids

def main():
    files = sorted(glob.glob(os.path.join(ADT_DIR, "KALIMDOR_*.ADT")) +
                   glob.glob(os.path.join(ADT_DIR, "KALIMDOR_*.adt")))
    lost_tiles = {}; kezan_tiles = {}
    fre = re.compile(r"KALIMDOR_(\d+)_(\d+)\.adt$", re.I)
    for p in files:
        m = fre.search(os.path.basename(p))
        if not m: continue
        x, y = int(m.group(1)), int(m.group(2))
        ids = area_ids_of_adt(p)
        li = ids & LOST; kz = ids & KEZAN
        if li: lost_tiles[(x,y)] = li
        if kz: kezan_tiles[(x,y)] = kz
    for name, tiles in [("LOST ISLES", lost_tiles), ("KEZAN", kezan_tiles)]:
        print("=== %s: %d tiles ===" % (name, len(tiles)))
        if not tiles: continue
        xs = [t[0] for t in tiles]; ys = [t[1] for t in tiles]
        print("  filename idxX %d..%d   idxY %d..%d" % (min(xs),max(xs),min(ys),max(ys)))
        for t in sorted(tiles):
            print("   %s  areas=%s" % (t, sorted(tiles[t])))
    # stash for offset calc
    import json
    json.dump({"lost": sorted(map(list,lost_tiles)), "kezan": sorted(map(list,kezan_tiles))},
              open("/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/tiles.json","w"))

if __name__ == "__main__":
    main()
