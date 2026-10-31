"""F-230 facial graft: proof renders for one race/sex after a graft (offline, facial_render.py). Writes three sheets:
  OUT_new_choices.png        every grafted choice (mesh + the facial_pieces paint it gets), three views
  OUT_legacy_vs_migrated.png each legacy CharacterFacialHairStyles look vs the slot values the migration gives it
  OUT_npc_before_after.png   each legacy row (an NPC look) on the pack's ungrafted model vs the grafted one
Pieces are cut in memory (facial_pieces.auto_race), nothing is written but the PNGs.

usage: facial_graft_proof.py RACE SEX OUTPREFIX ORIG [MIGRATION.sql]
  ORIG = the ungrafted model dir, or "pack" (the community pack's copy, Asset Library)
  env MODELS = a CHARACTER/ tree of grafted preview models (facial_graft.py preview) instead of parsed-assets
  env HC hair colour, BZ / BH camera centre z / half height, COMMON / HS geosets always shown
"""
import os, sys, re, importlib, numpy as np
from pathlib import Path
from PIL import Image
SC = Path(__file__).resolve().parent; sys.path.insert(0, str(SC))
race, sex, out, orig = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4]
FOLD = {1: 'HUMAN', 2: 'ORC', 3: 'DWARF', 4: 'NIGHTELF', 6: 'TAUREN', 7: 'GNOME', 10: 'BLOODELF', 11: 'DRAENEI'}[race]
SX = ['MALE', 'FEMALE'][sex]
if orig == 'pack':
    import facial_graft as fg
    _src = __import__('json').loads(fg.MANIFEST.read_text())['files'][f'CHARACTER/{FOLD}/{SX}/{FOLD}{SX}.M2'][0]
    _d = fg.LIB / _src / 'mpq' / 'source-assets'
    for part in ('CHARACTER', FOLD, SX):
        _d = next(p for p in _d.iterdir() if p.name.upper() == part)
    orig = str(_d) + '/'
MODELS = os.environ.get('MODELS')
os.environ['ZR'], os.environ['ZS'] = str(race), str(sex)
if MODELS and (Path(MODELS) / FOLD / SX).exists():
    os.environ['ZD'] = str(Path(MODELS) / FOLD / SX) + '/'
GRAFTED_DIR = os.environ.get('ZD')
import facial_graft as fg
fp, _ = fg.load_pieces(MODELS, [f'{race}_{sex}'])
fs = fp._split()
files = fp._load('skin_preview').files_resolver(); q = fp._dbc_query_fn('live')
key = f'{race}_{sex}'
HC = int(os.environ.get('HC', '3'))
auto = (race, sex) in fp.AUTO
pieces, lab, st, fpr = fp.auto_race(race, sex, q, files) if auto else ({}, None, {'slots': {}, 'migration': {}}, None)
top = {}
for r in q(f'SELECT id, type, color_index, texture_1, texture_2 FROM charsections WHERE race={race} AND gender={sex} AND base_section=2 ORDER BY id'):
    top[(int(r['type']), int(r['color_index']))] = r


def piece_img(n):
    if not auto and fp.CLIP.get(race, 0) >= 1:     # whole-row pieces (orc): the legacy row's own paint
        return ('sec2', fp.PIECES[(race, sex)][n][0])
    if not auto:            # hand-cut pieces (night elf): the shipped CharSections section 10 rows
        return ('dbc', n)
    t, gi, geo = pieces[n]
    blk = fp.face_block(files, top.get((t, HC)))
    if blk is None:
        return None
    o = blk.copy()
    o[..., 3] = (o[..., 3].astype(np.float32) * fp.clip(blk[..., 3], lab[t] == gi, fpr.distance(geo), fp.CLIP[race])).astype(np.uint8)
    return o


import facial_render as rend
rend.set_hair(HC)


def body(paint_blocks=(), legacy=None):
    canvas, extra = rend.sp.bake(rend.files, rend.query, race, sex, 0, 0, (0, 0, 0))
    if legacy is not None:
        rend.put_face(canvas, rend.section_rows(2, legacy, HC))
    for blk in paint_blocks:
        if blk is None:
            continue
        if isinstance(blk, tuple):
            rend.put_face(canvas, rend.section_rows(10 if blk[0] == 'dbc' else 2, blk[1], HC))
            continue
        im = Image.fromarray(blk, 'RGBA')
        rend.blit(canvas, im.crop((0, 64, 256, 192)), 'FaceLower'); rend.blit(canvas, im.crop((0, 0, 256, 64)), 'FaceUpper')
    return np.asarray(canvas).astype(np.float32) / 255, (np.asarray(extra.convert('RGBA')).astype(np.float32) / 255 if extra else None)


COMMON = {int(x) for x in os.environ.get('COMMON', '402 502 702 802 902 1002 1102 1202 1301 1502 1801').split()} | {int(os.environ.get('HS', '4'))}
box = (0, float(os.environ.get('BZ', '1.75')), float(os.environ.get('BH', '0.22')))
spec = fs.SLOTS[key]
slots = [sl for sl in spec['slots'] if sl[2] is not None]
pof = {int(k): v['pieces'] for k, v in st['slots'].items()} if auto else dict(fs.PIECE_OF.get(key, {}))
grafted = fs.GRAFTED.get(key, set())
rows = {int(p['variation_id']): [int(p[c]) for c in ('geoset_1', 'geoset_2', 'geoset_3', 'geoset_4', 'geoset_5')]
        for p in q(f'SELECT variation_id, geoset_1, geoset_2, geoset_3, geoset_4, geoset_5 FROM characterfacialhairstyles WHERE race={race} AND gender={sex}')}
base_row = spec['facial'][1] if spec['facial'][0] == 'hidden' else None
eyes = {1700 + rows[base_row][4]} if base_row is not None and rows.get(base_row) and rows[base_row][4] else set()

# 1. every grafted choice, with its piece
tiles = []
for sl in slots:
    for ci, (geo, *_r) in enumerate(sl[4]):
        if geo not in grafted:
            continue
        pc = (pof.get(sl[0]) or [None] * 99)[ci]
        b, e = body([piece_img(pc)] if pc else [])
        for v in ('q', 'front', 'side'):
            tiles.append(rend.label(rend.render(COMMON | eyes | {geo}, b, e, view=v, size=220, box=box), f's{sl[0]} {geo} tex={pc} {v}'))
if tiles:
    rend.sheet(tiles, 6, out + '_new_choices.png')


# 2. legacy look vs migrated slots (grafted model both)
def legacy_geos(row):
    g = set()
    for grp, v in zip((1, 3, 2, 16, 17), row):
        if v:
            g.add(grp * 100 + v)
    g |= {b for a, b in spec.get('imply', []) if a in g}
    return g


mig = {}
sql = open(sys.argv[5]).read() if len(sys.argv) > 5 else ''
for r_, s_, v, sl, val in re.findall(r'\((\d+),(\d+),(\d+),(\d+),(\d+)\)', sql):
    if (int(r_), int(s_)) == (race, sex):
        mig.setdefault(int(v), {})[int(sl)] = int(val) - 1
tiles, diffs = [], []
for v in sorted(rows):
    lg = legacy_geos(rows[v]); b, e = body(legacy=v)
    a = rend.render(COMMON | lg, b, e, view='q', size=220, box=box)
    geos, blocks = set(eyes), []
    for sl in slots:
        ci = mig.get(v, {}).get(sl[0], 0); g = sl[4][ci][0]
        if g:
            geos.add(g)
        pc = (pof.get(sl[0]) or [None] * 99)[ci]
        if pc:
            blocks.append(piece_img(pc))
    b2, e2 = body(blocks, legacy=None if auto else base_row)
    c = rend.render(COMMON | geos, b2, e2, view='q', size=220, box=box)
    d = np.abs(np.asarray(a).astype(int) - np.asarray(c).astype(int)).mean()
    diffs.append((v, round(float(d), 2), sorted(x for x in lg if x % 100 > 1), sorted(geos)))
    tiles += [rend.label(a, f'legacy {v} {sorted(x for x in lg if x % 100 > 1)}'), rend.label(c, f'migrated {v} {sorted(geos)} d={d:.1f}')]
rend.sheet(tiles, 4, out + '_legacy_vs_migrated.png')
print('legacy vs migrated mean |diff|:', diffs)

# 3. NPC before/after: legacy row on the original model vs the grafted model
tiles, nd = [], []
for v in sorted(rows):
    lg = legacy_geos(rows[v]); b, e = body(legacy=v)
    after = rend.render(COMMON | lg, b, e, view='front', size=220, box=box)
    os.environ['ZD'] = orig; importlib.reload(rend); rend.set_hair(HC)
    before = rend.render(COMMON | lg, b, e, view='front', size=220, box=box)
    if GRAFTED_DIR:
        os.environ['ZD'] = GRAFTED_DIR
    else:
        os.environ.pop('ZD')
    importlib.reload(rend); rend.set_hair(HC)
    d = int(np.abs(np.asarray(after).astype(int) - np.asarray(before).astype(int)).max())
    nd.append((v, d))
    tiles += [rend.label(before, f'NPC row {v} before'), rend.label(after, f'NPC row {v} after maxdiff={d}')]
rend.sheet(tiles, 4, out + '_npc_before_after.png')
print('NPC rows max pixel diff before/after:', nd)
