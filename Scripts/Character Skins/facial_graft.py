"""F-230: graft retail facial-hair geosets onto our HD character models (cli/lib/skin_ops.py m2.graft / skin.graft).

The recipe for a race is the pack's file + any earlier curate_transforms ops on it (F-230 relabels / island splits)
+ the graft. Donors are pinned by FileDataID + sha256 from the local retail CASC store; every recipe carries
base/result sha256 guards. Grafted ids must be new in the model and named by no CharacterFacialHairStyles row (NPCs
keep their look), in a group the client's slot code accepts (1/2/3/14/16).

  python3 "Scripts/Character Skins/facial_graft.py" survey RACE            # donor vs ours: geosets, textures, bones
  python3 "Scripts/Character Skins/facial_graft.py" preview RACE OUTDIR    # grafted files to OUTDIR, nothing else
  python3 "Scripts/Character Skins/facial_graft.py" recipe RACE [--dry]    # curate_transforms.json + parsed-assets
"""
import sys, json, hashlib, struct, collections
from pathlib import Path
C = Path('/workspace/project/Zeppelin-Craft'); sys.path[:0] = [str(C / 'cli')]
from lib import retail, hd_curate_fixes as hcf, m2_ops, skin_ops
J = C / 'zpaks/zep-hd-curated/curate_transforms.json'
PA = C / 'zpaks/zep-hd-curated/mpq/parsed-assets/CHARACTER'
LIB = Path('/workspace/project/Zeppelin-Tools/Asset Library/COMMUNITY')
MANIFEST = C / 'zpaks/zep-hd-curated/curate_manifest.json'
H = lambda b: hashlib.sha256(b).hexdigest()
SLOT_GROUPS = {1, 2, 3, 14, 16}
HAIR_2X = {'u_from': 0.5, 'u_scale': 2.0, 'u_offset': -0.9991}     # retail 2-copy hair atlas -> our single copy
RACE_ID = {'human': 1, 'orc': 2, 'dwarf': 3, 'nightelf': 4, 'tauren': 6, 'gnome': 7, 'bloodelf': 10, 'draenei': 11}
CFG = {
    'human': dict(folder='HUMAN', fdid=1011653, template=102, uv=HAIR_2X,
                  geosets=[[103, 103], [104, 104], [105, 105], [106, 106], [107, 107], [108, 108], [203, 204],
                           [303, 303], [304, 304], [305, 305], [306, 306], [307, 307], [3401, 1602], [3402, 1603], [3403, 1604]],
                  note='F-230: retail humanmale_hd facial hair grafted as new geosets (same rig and head; hair UV u -> 2u-1 onto our '
                       'single-copy hair atlas): beards 103-108, long sideburns 204 (retail 203; retail 202 = our 202), moustaches 303-307, '
                       'eyebrows 1602-1604 (retail 3401-3403: group 34 is not a slot group the client hides). NPC rows name none of them.'),
    # retail 102-110 are our 102-110 (0.13 cm); hair atlas = ours (same layout): UVs as they are. Hair submeshes only.
    'bloodelf': dict(folder='BLOODELF', fdid=1100087, template=102, uv={}, tex_types=[6],
                     geosets=[[111, 111], [112, 112], [113, 113], [3401, 1602]],
                     note='F-230: retail bloodelfmale_hd facial hair grafted as new geosets (same rig, same hair atlas): beards '
                          '111-113 (retail 102-110 are ours), eyebrows 1602 (retail 3401). NPC rows name none of them.'),
    # same rig, same hair atlas. Retail 103/104/105 = our 107/106/103, 203/204 = our 207/205, 3401/3403/3404/3405 =
    # our 302/305/306/307 (<= 0.4 cm): left out. Hair submeshes only (106/107's type-10 beads stay out).
    'nightelf': dict(folder='NIGHTELF', fdid=974343, template={'1': 103, '2': 204, '3': 302, '16': 1604}, uv={}, tex_types=[6],
                     geosets=[[102, 108], [106, 109], [107, 110], [108, 111], [202, 208], [205, 209],
                              [301, 1605], [302, 1606], [303, 1607], [304, 1608],
                              [3402, 308], [3406, 309], [3407, 310], [3408, 311]],
                     note='F-230: retail nightelfmale_hd facial hair grafted as new geosets (same rig, same hair atlas): beards '
                          '108-111 (retail 102/106/107/108), sideburns 208/209 (retail 202/205), moustaches 1605-1608 (retail '
                          '301-304), eyebrows 308-311 (retail 3402/3406-3408). Retail meshes equal to ours left out. NPC rows name none.'),
    # same rig, same hair atlas. Retail "Facial Hair" 1xx are whole whiskers (sideburns + moustache + goatee, like our
    # stock 2xx): grafted as 2xx, then cut by the SAME island rules our 204-206 were (moustache -> 3xx, goatee -> 16xx).
    # Retail 101 / 104 / 105 = our 202 / 205 / 206. Hair submeshes only (106-108's type-20 jewellery stays out).
    'draenei': dict(folder='DRAENEI', fdid=1005887, uv={}, tex_types=[6],
                    # 102 (cheek whiskers) stays whole as sideburns 207; 108 (full beard + braid) whole as beard 1613:
                    # cut by the rules they came apart (the braid tip fell into another slot)
                    template={'2': 202, '16': 1605},
                    geosets=[[102, 207], [103, 208], [106, 209], [107, 210], [108, 1613], [109, 212], [110, 213]],
                    after=[{'op': 'skin.geoset.island_split', 'from': [208, 209, 210, 212, 213], 'rules': [
                        {'to': 16, 'box': [0.17, None, None, None, None, None], 'key': 7, 'majority': 0.75},
                        {'to': 3, 'box': [0.17, None, None, None, None, None]}]},
                        # 1610's three small tufts hung from retail 107's beads (left out with the jewellery): they float
                        {'op': 'skin.geoset.island_split', 'from': [1610], 'rules': [
                            {'to': 19, 'box': [0.25, None, None, None, None, None]},
                            {'to': 19, 'box': [None, 0.05, None, None, None, None]},
                            {'to': 19, 'box': [None, None, None, None, -0.05, None]}]},
                        {'op': 'skin.geoset.remap', 'map': {'208': -1, '1910': -1}}],     # 208 = our 204
                    note='F-230: retail draeneimale_hd facial hair grafted as whiskers 207-213 (retail 102/103/106-110), split '
                         'like our 204-206 into sideburns 209/210, moustaches 308/309/313 and goatees 1610/1612 (208 = our 204, dropped); retail 102 '
                         'whole as sideburns 207, retail 108 whole as beard 1613. Retail 101/104/105 '
                         'are our 202/205/206. NPC rows name none of them.'),
    # same rig, same hair atlas. Retail beards 102-117 as 111+ (ours 102-110 stay for NPCs and legacy looks),
    # sideburns 201-211 as 202-212 (group 2 is free on the orc), nose rings 1601-1603 as 1602-1604. Rings on retail
    # beards / sideburns draw their own texture (orcmale_hd_3623305, shipped as ORCMALE_RINGS.BLP); skin (type 1)
    # parts stay out.
    'orc': dict(folder='ORC', fdid=917116, uv={}, tex_types=[6, 0],
                template={'tex0': 102, 'default': 102},
                m2_before=[{'op': 'm2.texture.add', 'type': 0, 'name': 'Character\\Orc\\Male\\OrcMale_Rings.blp',
                            'expect_count': 8},
                           {'op': 'm2.texlookup.set', 'expect': [4, 2, 1, 0, 4, 6, 4, 3, 5, 7],
                            'values': [4, 2, 1, 0, 4, 6, 4, 3, 5, 7, 8]}],
                batch={'tex0': {'texcombo': 10, 'material': 0}},
                ship={'CHARACTER/ORC/MALE/ORCMALE_RINGS.BLP': 3623305},
                # a slot holds at most 14 meshes: our 9 beards + 5 retail ones (102 chin tuft, 103 pointed goatee, 104
                # mutton chops, 112 rope braid with its ring, 117 wide braided beard). Left out: 107 / 109 / 110 / 111
                # (their skin-textured wraps leave gaps without the type-1 parts), 116 (= our 105 without its clasp),
                # 105 / 106 / 108 / 113-115 (room). Sideburns 201-211 but 207 (skin wraps).
                geosets=[[102, 111], [103, 112], [104, 113], [112, 114], [117, 115]]
                        + [[g, g + 1] for g in range(201, 212) if g != 207]
                        + [[1601, 1602], [1602, 1603], [1603, 1604]],
                note='F-230: retail orcmale_hd facial hair grafted (same rig, same hair atlas): beards 111-115 (retail 102/103/104/'
                     '112/117), sideburns 202-207 / 209-212 (retail 201-206 / 208-211), nose rings 1602-1604; rings on them draw '
                     'OrcMale_Rings.blp. Skin-textured retail parts left out. NPC rows name none of them.'),
    # our HD tauren / gnome are the retail rig scaled by exactly 20/27 / 20/23 (every key bone, residual < 1e-6)
    # tauren: fur atlas u -> 0.75 u + 0.25 (exact on retail 102/202/203 = our 103/203/204). New facial hair 105 /
    # 108 / 110 / 111 / 112 as 108-112 (retail 107 = our 102's braid, 0.9 cm), hair 209 / 210 as 208 / 209 (retail 208
    # wraps its UVs past the atlas)
    'tauren': dict(folder='TAUREN', fdid=968705, scale=20 / 27, uv={'u_scale': 0.75, 'u_offset': 0.25},
                   template={'1': 102, '2': 202},
                   geosets=[[105, 108], [108, 109], [110, 110], [111, 111], [112, 112], [209, 208], [210, 209]],
                   note='F-230: retail taurenmale_hd facial hair grafted (our rig = retail x 20/27, fur atlas u -> 0.75u + 0.25): '
                        'facial hair 108-112 (retail 105/108/110/111/112), hair 208/209 (retail 209/210). NPC rows name none.'),
    'gnome': dict(folder='GNOME', fdid=900914, scale=20 / 23, uv={}, template=102, geosets=[], note=''),
    # retail beards / moustaches are ours remodelled (0.06-1.1 cm) and retail's brow mesh 3401 is our always-on brow
    # (geoset 0, 0.3 cm): nothing new there. New: nose rings (retail 1601-1605) with their own texture
    # (dwarfmale_earrings, shipped as DWARFMALE_EARRINGS.BLP).
    'dwarf': dict(folder='DWARF', fdid=878772, uv={}, template={'16': 102},
                  m2_before=[{'op': 'm2.texture.add', 'type': 0, 'name': 'Character\\Dwarf\\Male\\DwarfMale_Earrings.blp',
                              'expect_count': 8},
                             {'op': 'm2.texlookup.set', 'expect': [3, 2, 1, 0, 3, 6, 3, 4, 5, 7],
                              'values': [3, 2, 1, 0, 3, 6, 3, 4, 5, 7, 8]}],
                  batch={'16': {'texcombo': 10, 'material': 0}},
                  ship={'CHARACTER/DWARF/MALE/DWARFMALE_EARRINGS.BLP': 3590264},
                  geosets=[[1601, 1602], [1602, 1603], [1603, 1604], [1604, 1605], [1605, 1606]],
                  note='F-230: retail dwarfmale_hd nose rings grafted as 1602-1606 (their own texture, DwarfMale_Earrings.blp). '
                       'Retail beards / moustaches / brows are ours. NPC rows name none of them.'),
}


def chunk(b, t):
    o = 0
    while o + 8 <= len(b):
        tt, n = b[o:o + 4], struct.unpack_from('<I', b, o + 4)[0]
        if tt == t:
            return b[o + 8:o + 8 + n]
        o += 8 + n
    return b''


def pack_file(rel_upper):
    """The community pack's own copy of a curated file (curate_manifest.json names the pack), found case-blind."""
    src = json.loads(MANIFEST.read_text())['files'][rel_upper][0]
    root = LIB / src / 'mpq' / 'source-assets'
    cur = root
    for part in rel_upper.split('/'):
        nxt = next((p for p in cur.iterdir() if p.name.upper() == part), None) if cur.is_dir() else None
        if nxt is None:
            raise SystemExit(f'{rel_upper}: not in {root}')
        cur = nxt
    return cur.read_bytes(), src


def donor(fdid):
    raw = retail.fetch(fdid)
    sf = struct.unpack_from('<I', chunk(raw, b'SFID'), 0)[0]
    skid = chunk(raw, b'SKID')
    return raw, sf, (struct.unpack_from('<I', skid, 0)[0] if skid else 0)


def graft_op(c, m2):
    raw, sf, sk = donor(c['fdid'])
    op = dict(donor_fdid=c['fdid'], donor_sha256=H(raw), donor_skin_fdid=sf, donor_skin_sha256=H(retail.fetch(sf)),
              geosets=c['geosets'], template=c['template'], uv=c['uv'],
              **{k: c[k] for k in ('tex_types', 'bone_fallback', 'batch', 'scale') if c.get(k)},
              expect_vertices=struct.unpack_from('<I', m2, 0x3C)[0], expect_bone_lookup=struct.unpack_from('<I', m2, 0x78)[0])
    if sk:
        op.update(skel_fdid=sk, skel_sha256=H(retail.fetch(sk)))
    return op


def legacy_named(race):
    """geosets any CharacterFacialHairStyles row of the race's males shows (NPC looks): never a graft id"""
    r = __import__('subprocess').run([sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query',
                                      f'SELECT geoset_1, geoset_2, geoset_3, geoset_4 FROM characterfacialhairstyles '
                                      f'WHERE race = {RACE_ID[race]} AND gender = 0'], cwd=C, capture_output=True, text=True)
    out = set()
    for line in r.stdout.splitlines():
        p = line.split('\t')
        if len(p) == 4 and all(x.strip().isdigit() for x in p):
            for g, v in zip((1, 3, 2, 16), map(int, p)):
                out.add(100 * g + v)
    return out


def entries(race):
    """{curate key: (pack bytes, earlier non-graft ops, graft ops)} for the model and its 4 LOD skins; + source pack"""
    c = CFG[race]; F = c['folder']
    rel = f'CHARACTER/{F}/MALE/{F}MALE'
    key = f'character/{F.lower()}/male/{F.lower()}male'
    m2, source = pack_file(rel + '.M2')
    op = graft_op(c, m2)
    d = json.loads(J.read_text())
    out = {}
    for k, r, gop in [(key + '.m2', rel + '.M2', 'm2.graft')] + [(f'{key}0{v}.skin', f'{rel}0{v}.SKIN', 'skin.graft') for v in range(4)]:
        data = pack_file(r)[0]
        prev = d.get(k)
        keep = [o for o in prev['ops'] if not o['op'].endswith('graft')] if isinstance(prev, dict) and prev.get('base_sha256') == H(data) else []
        if isinstance(prev, dict) and prev.get('base_sha256') not in (None, H(data)):
            raise SystemExit(f'{k}: curate_transforms base_sha256 is not the pack file')
        extra = CFG[race].get('after', []) if gop == 'skin.graft' else []
        before = CFG[race].get('m2_before', []) if gop == 'm2.graft' else []
        out[k] = (data, keep, before + [dict(op=gop, **op)] + extra, prev)
    return out, source, key


def check_ids(race):
    c = CFG[race]
    named = legacy_named(race)
    m2, _ = pack_file(f"CHARACTER/{c['folder']}/MALE/{c['folder']}MALE00.SKIN")
    have = {struct.unpack_from('<H', m2, struct.unpack_from('<I', m2, 32)[0] + 48 * j)[0] for j in range(struct.unpack_from('<I', m2, 28)[0])}
    bad = []
    for src, dst in c['geosets']:
        if dst // 100 not in SLOT_GROUPS:
            bad.append(f'{dst}: group {dst // 100} is no slot group')
        if dst in named:
            bad.append(f'{dst}: a CharacterFacialHairStyles row shows it (NPC look would change)')
        if dst in have:
            bad.append(f'{dst}: already in the model')
    if bad:
        raise SystemExit('graft ids: ' + '; '.join(bad))


def build(race):
    """-> {curate key: fixed bytes} (earlier ops + graft on the pack files)"""
    check_ids(race)
    ents, _src, key = entries(race)
    m2data, keep, gops, _ = ents[key + '.m2']
    fixed_m2, _ = m2_ops.apply_ops_bytes(m2data, keep + gops)
    out = {key + '.m2': fixed_m2}
    for k, (data, keep, gops, _p) in ents.items():
        if k.endswith('.skin'):
            out[k] = skin_ops.apply_ops_bytes(data, fixed_m2, keep + gops)[0]
    return out


def preview(race, outdir):
    out = build(race)
    o = Path(outdir); o.mkdir(parents=True, exist_ok=True)
    for rel, fd in (CFG[race].get('ship') or {}).items():      # textures the graft needs (from the retail store)
        (o / Path(rel).name).write_bytes(retail.texture_file(fd).read_bytes())
    for k, b in out.items():
        (o / Path(k).name.upper()).write_bytes(b)
        print(o / Path(k).name.upper(), len(b))


def recipe(race, write=True):
    c = CFG[race]; F = c['folder']
    check_ids(race)
    ents, source, key = entries(race)
    d = json.loads(J.read_text())
    for k, (data, keep, gops, prev) in ents.items():
        rec = dict(source=source, note=c['note'], base_sha256=H(data), ops=keep + gops)
        if keep:
            rec['note'] = prev['note'].split(' F-230: retail ')[0] + ' ' + c['note']
        d[k] = rec
    J.write_text(json.dumps(d, indent=1) + '\n'); hcf._cache = None
    fixed_m2, _ = hcf.fixed(key + '.m2', ents[key + '.m2'][0])
    d[key + '.m2']['result_sha256'] = H(fixed_m2)
    out = {key + '.m2': fixed_m2}
    for v in range(4):
        k = f'{key}0{v}.skin'
        fx, _ = hcf.fixed(k, ents[k][0], model=fixed_m2)
        d[k]['result_sha256'] = H(fx); out[k] = fx
    J.write_text(json.dumps(d, indent=1) + '\n'); hcf._cache = None
    base = PA / F / 'MALE'
    if write:
        for k, b in out.items():
            (base / Path(k).name.upper()).write_bytes(b)
    for k, b in out.items():
        print(k, len(ents[k][0]), '->', len(b))


def survey(race):
    """facial geosets: donor (verts, tris, texture types, bones without a twin) vs ours (ids, texture types)"""
    c = CFG.get(race) or {}
    F = c.get('folder') or race.upper()
    fd = c.get('fdid') or retail.listfile()[0][f'character/{race}/male/{race}male_hd.m2']
    raw, sf, sk = donor(fd)
    dm = skin_ops._md20(raw)
    dsk = skin_ops._Skin(retail.fetch(sf))
    dbones = skin_ops._bones_of(skin_ops._chunk(retail.fetch(sk), b'SKB1'), 0) if sk else skin_ops._bones_of(dm, 0x2C)
    m2, _ = pack_file(f'CHARACTER/{F}/MALE/{F}MALE.M2')
    osk = skin_ops._Skin(pack_file(f'CHARACTER/{F}/MALE/{F}MALE00.SKIN')[0])
    mb = skin_ops._bones_of(m2, 0x2C)
    SC = float(c.get('scale', 1.0))

    def textypes(model, sk, j):
        nt, ot = struct.unpack_from('<II', model, 0x50); nl, ol = struct.unpack_from('<II', model, 0x80)
        look = struct.unpack_from('<%dh' % nl, model, ol)
        out = set()
        for b in sk.batches:
            f = struct.unpack_from('<BbHHHhHHHHHHH', b)
            if f[3] == j:
                for x in range(f[8]):
                    if f[9] + x < nl and 0 <= look[f[9] + x] < nt:
                        out.add(struct.unpack_from('<I', model, ot + 16 * look[f[9] + x])[0])
        return sorted(out)
    nv, ov = struct.unpack_from('<II', dm, 0x3C)
    import numpy as np
    from scipy.spatial import cKDTree
    onv, oov = struct.unpack_from('<II', m2, 0x3C)
    op_ = collections.defaultdict(list)
    for j in range(len(osk.subs)):
        u = osk.sub(j)
        if u['id'] // 100 in (1, 2, 3, 14, 16) and u['id'] % 100 > 1:
            for t in range(u['istart'], u['istart'] + u['icount']):
                op_[u['id']].append(struct.unpack_from('<3f', m2, oov + 48 * osk.lookup[osk.idx[t]]))
    op_ = {g: np.array(v) for g, v in op_.items()}
    print(f'donor {fd}: {nv} vertices, {len(dbones)} bones; ours {struct.unpack_from("<I", m2, 0x3C)[0]} vertices, {len(mb)} bones')
    named = legacy_named(race) if race in RACE_ID else set()
    for j in range(len(dsk.subs)):
        u = dsk.sub(j)
        if u['id'] // 100 not in (1, 2, 3, 16, 34) or u['id'] % 100 == 0:
            continue
        vs = {dsk.lookup[dsk.idx[t]] + dsk.x2c for t in range(u['istart'], u['istart'] + u['icount'])}
        miss = set()
        for v in vs:
            for k in range(4):
                if dm[ov + 48 * v + 12 + k]:
                    b = dm[ov + 48 * v + 16 + k]
                    p = [x * SC for x in dbones[b][2]]
                    if not any(sum((p[i] - q[2][i]) ** 2 for i in range(3)) < 1e-6 for q in mb):
                        miss.add(b)
        us = [struct.unpack_from('<2f', dm, ov + 48 * v + 32)[0] for v in vs]
        # nearest of OUR facial meshes (any group): symmetric mean surface distance, cm (a near-duplicate is < ~0.5)
        dp = np.array([struct.unpack_from('<3f', dm, ov + 48 * v) for v in vs]) * SC
        best = min(((float((cKDTree(op_[g]).query(dp)[0].mean() + cKDTree(dp).query(op_[g])[0].mean()) * 50), g)
                    for g in op_), default=(None, None))
        print(f"  donor {u['id']}: {len(vs)} v {u['icount'] // 3} tris tex {textypes(dm, dsk, j)} u {min(us):.2f}-{max(us):.2f}"
              f" nearest ours {best[1]} {best[0]:.2f}cm"
              f"{' NO-TWIN bones ' + str(sorted(miss)) if miss else ''}")
    ours = collections.defaultdict(set)
    for j in range(len(osk.subs)):
        g = osk.sub(j)['id']
        if g // 100 in (1, 2, 3, 14, 16, 17):
            ours[g] |= set(textypes(m2, osk, j))
    print('  ours:', {g: sorted(t) for g, t in sorted(ours.items())})
    print('  legacy rows name:', sorted(x for x in named if x % 100 > 1))


def load_pieces(models=None, landed=()):
    """facial_pieces as a module (and the facial_split source it loads) with the curated model paths sent to
    `models` (a CHARACTER/<FOLDER>/<SEX>/ tree from `preview`) wherever it has the race's files. -> (fp, split_src)"""
    import types
    SC = Path(__file__).resolve().parent

    def redirect(src):
        if not models:
            return src
        m = str(models)
        src = src.replace("    base = ZPAKS / zp / 'mpq' / 'parsed-assets' / 'CHARACTER' / r / s / f'{r}{s}'\n",
                          "    base = ZPAKS / zp / 'mpq' / 'parsed-assets' / 'CHARACTER' / r / s / f'{r}{s}'\n"
                          f"    _alt = Path({m!r}) / r / s / f'{{r}}{{s}}'\n    base = _alt if Path(str(_alt) + '.M2').exists() else base\n")
        src = src.replace("    d = CURATED / MODEL[race] / ['MALE', 'FEMALE'][sex]\n",
                          "    d = CURATED / MODEL[race] / ['MALE', 'FEMALE'][sex]\n"
                          f"    if (Path({m!r}) / MODEL[race] / ['MALE', 'FEMALE'][sex]).exists(): d = Path({m!r}) / MODEL[race] / ['MALE', 'FEMALE'][sex]\n")
        return src
    split_src = redirect((SC / 'facial_split.py').read_text())
    if landed:              # proofs of a race not landed yet: treat it as landed
        split_src = split_src.replace("LANDED = {'1_0'}", f"LANDED = {{'1_0', {', '.join(repr(x) for x in landed)}}}", 1)
        assert any(f"'{x}'" in split_src.split('LANDED = ', 1)[1].split('\n', 1)[0] for x in landed)
    fp = types.ModuleType('facial_pieces'); fp.__file__ = str(SC / 'facial_pieces.py')
    exec(compile(redirect((SC / 'facial_pieces.py').read_text()), fp.__file__, 'exec'), fp.__dict__)

    def _split():
        mod = types.ModuleType('facial_split'); mod.__file__ = str(SC / 'facial_split.py')
        exec(compile(split_src, mod.__file__, 'exec'), mod.__dict__)
        return mod
    fp._split = _split
    return fp, split_src


if __name__ == '__main__':
    cmd, race = sys.argv[1], sys.argv[2]
    if cmd == 'survey':
        survey(race)
    elif cmd == 'preview':
        preview(race, sys.argv[3])
    elif cmd == 'recipe':
        recipe(race, write='--dry' not in sys.argv)
