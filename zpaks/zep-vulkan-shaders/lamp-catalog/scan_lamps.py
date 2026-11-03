#!/usr/bin/env python3
"""Zeppelin F-223A lamp catalog: scan the stock client's world models for light sources that carry no M2 light.

Reads Zeppelin-Tools/Asset Library/STOCK/files/<mpq>/ (later MPQs win), keeps world\\ models whose name says
lamp/torch/fire/..., parses the MD20 header (lights, particle emitters, bounds) and writes scan.tsv:
path, lights, emitters, emitter centre (model space), bounds min/max, particle texture names.
Our own catalog: written from the client's own files, not from any other project's lamp list.
"""
import os, re, struct, sys
ROOT = '/workspace/project/Zeppelin-Tools/Asset Library/STOCK/files'
ORDER = ['common', 'common-2', 'expansion', 'lichking', 'patch', 'patch-2', 'patch-3']
KEEP = re.compile(r'lamp|torch|brazier|lantern|candle|campfire|bonfire|firepit|fireplace|fire_?pit|sconce|chandelier|'
                  r'streetlight|lightpost|lamppost|candelabra|hearth|furnace|forge|fire|light|glow|crystal|orb', re.I)
DROP = re.compile(r'lightning|lighthouse|lightforge|flight|lightbeam|light_?ray|lightshaft|sunlight|moonlight|'
                  r'firework|fireflies|firefly|fireplume|ray|shaft|spotlight|beam', re.I)

def arr(d, off):
    return struct.unpack_from('<II', d, off)

def parse(path):
    d = open(path, 'rb').read()
    if d[:4] != b'MD20' or len(d) < 0x130:
        return None
    nlights, _ = arr(d, 0x108)
    nemit, oemit = arr(d, 0x128)
    bmin = struct.unpack_from('<3f', d, 0xA0); bmax = struct.unpack_from('<3f', d, 0xAC)
    ntex, otex = arr(d, 0x50)
    texnames = []
    for i in range(min(ntex, 32)):
        ttype, tflags, nlen, nofs = struct.unpack_from('<IIII', d, otex + 16 * i)
        if nlen and nofs + nlen <= len(d):
            texnames.append(d[nofs:nofs + nlen].split(b'\0')[0].decode('latin-1'))
    pos = []
    texidx = []
    for i in range(min(nemit, 64)):
        base = oemit + 0x1DC * i
        if base + 0x30 > len(d):
            break
        pos.append(struct.unpack_from('<3f', d, base + 0x08))
        texidx.append(struct.unpack_from("<H", d, base + 0x16)[0])
    ptex = sorted({texnames[t] for t in texidx if t < len(texnames)})
    centre = [sum(p[k] for p in pos) / len(pos) for k in range(3)] if pos else None
    return nlights, nemit, centre, bmin, bmax, ptex, texnames

files = {}
for mpq in ORDER:
    base = os.path.join(ROOT, mpq)
    for dp, dn, fn in os.walk(base):
        for f in fn:
            if not f.lower().endswith('.m2'):
                continue
            rel = os.path.relpath(os.path.join(dp, f), base).replace('/', '\\')
            if not rel.lower().startswith('world\\'):
                continue
            name = os.path.basename(rel)
            if KEEP.search(name) and not DROP.search(name):
                files[rel.lower()] = os.path.join(dp, f)
out = open(os.path.join(os.path.dirname(__file__), 'scan.tsv'), 'w')
out.write('path\tlights\temitters\tcx\tcy\tcz\tminx\tminy\tminz\tmaxx\tmaxy\tmaxz\tparticle_textures\ttextures\n')
n = 0
for rel in sorted(files):
    r = parse(files[rel])
    if not r:
        continue
    nl, ne, c, bmin, bmax, ptex, tex = r
    c = c or ('', '', '')
    out.write('\t'.join([rel, str(nl), str(ne)] + [('%.3f' % v if v != '' else '') for v in c] +
                        ['%.3f' % v for v in bmin + bmax] + [';'.join(ptex), ';'.join(tex)]) + '\n')
    n += 1
print(n, 'models scanned')
