"""F-230: cut painted facial hair into per-choice pieces (CharSections base_section 10).

A race's facial-hair texture (CharSections base_section 2, keyed by hair colour) paints a whole look at once:
beard, moustache, sideburns and eyebrows together. Once that look is split into geoset slots (facial_split.py), the
paint has to travel with the slot choice that shows it, or a beardless face keeps the painted beard. This script
cuts each source texture into parts by connected component and writes one "piece" per slot choice:

  CharSections base_section 10, type = piece, color_index = hair colour, texture_1 = FaceLower, texture_2 = FaceUpper
  ids 107000-107999 then 110000-112999, zpaks/zep-skin-expansion/dbc/[F-230]_charsections_facial_pieces.sql
  textures Character\\<Folder>\\<Sex>\\<Folder><Sex>FacialPiece<NN>{Lower,Upper}_<CC>.blp (zep-skin-expansion)

facial_split.py names the piece of each choice (`tex=<piece>` in Zeppelin\\CharCustomizations.txt, table PIECE_OF).
The source client draws the pieces of a player's set slots instead of the legacy facial texture; NPCs keep it.

Parts (classified per component of the paint, on the FaceUpper + FaceLower block, 256 x 192, upper on top):
  brows      centroid above y 84, between x 48 and 208 (the eyebrows straddle the upper / lower seam)
  sides      centroid left of x 72 or right of x 184 (sideburns, cheek patches)
  moustache  the rest, centroid above y 150 (mouth ring, moustache tips)
  chin       the rest (goatee, chin beard)
A piece is a source type and a set of parts; `nobrows` = every part but the brows.

Piece numbers are storage keys of the data file: append, never renumber.

  python3 "Scripts/Character Skins/facial_pieces.py" [--sheet out.png] [--check]
"""
import argparse
import importlib.util
import json
import struct
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage
from scipy.spatial import cKDTree

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
PARSED = ZPAK / 'mpq' / 'parsed-assets'
SQL = ZPAK / 'dbc' / '[F-230]_charsections_facial_pieces.sql'
ID_BASE, ID_END = 107000, 107999
ID2_BASE, ID2_END = 110000, 112999       # continues here once 107000-107999 is full
SHEET_COLOUR = {}
STATE = Path(__file__).with_name('facial_pieces.json')    # per race: choices, paint-only choices, migration (facial_split)
FOLDERS = {1: 'Human', 2: 'Orc', 3: 'Dwarf', 4: 'NightElf', 7: 'Gnome', 11: 'Draenei'}
MODEL = {1: 'HUMAN', 2: 'ORC', 3: 'DWARF', 4: 'NIGHTELF', 7: 'GNOME', 11: 'DRAENEI'}
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets' / 'CHARACTER'
MIN_PAINT = 20                      # px of the 256 x 192 block under which a look has no paint in a region (any less is resize bleed)
# clip (user 2026-10-31 "drop pixels on the face if it strays too far from the geoset"): a piece keeps paint within
# CLIP face heights of its own mesh, fading to nothing over CLIP_FADE more; then specks and strays go
CLIP = {1: 0.03, 2: 9.0, 3: 0.03, 4: 0.03, 7: 0.03, 11: 0.03}     # orc: a row's paint goes whole with its mesh
CLIP_FADE = 0.015
SURF = 4                            # surface samples per triangle edge (15 per triangle)
SPECK = 30                          # px: a paint component smaller than this goes
STRAY = 0.15                        # and one under this share of the piece's largest component
FOOTPRINT = 0.12                    # a mesh lies on the face texels within this share of the face height of it
FIT_MIN = 0.02                      # paint whose best mesh overlaps it less than this (IoU) has no mesh: it is dropped
SLIVER = 250                        # px: a stroke's piece in a region smaller than this goes with the stroke
SAME_IOU = 0.92                     # two looks' paint in a region is the same piece above this overlap
SEXES = ['Male', 'Female']
PARTS = ('brows', 'sides', 'moustache', 'chin')

# (race, sex) -> piece -> (source facial-hair type, parts). Night elf male: types 1-5 are the five stock looks
# (1 full beard + moustache ring, 2 chin strap, 3 cheek patches + moustache tips, 4 sideburns + chin, 5 long
# sideburns + goatee), each with its own eyebrows. The HD model's geosets per choice come from the legacy row that
# showed them (facial_split.PIECE_OF); 107 / 207 / 307 have no legacy row and take the nearest look.
PIECES = {
    (4, 0): {
        1: (2, 'nobrows'),      # beard 103 (legacy 2): the chin strap
        2: (5, {'chin'}),       # beard 106 (legacy 5): goatee
        3: (4, {'chin'}),       # beards 107 (no legacy row) and 108 (grafted small goatee): the short chin beard of look 4
        4: (1, 'nobrows'),      # beard 111 (grafted retail short full beard): look 1's full painted beard
        5: (3, {'sides'}),      # sideburns 204 (legacy 3): cheek patches
        6: (4, {'sides'}),      # sideburns 205 (legacy 4)
        7: (5, {'sides'}),      # sideburns 207 (no legacy row): the long sideburns of look 5
        8: (1, {'brows'}),      # eyebrows 302..306 (legacy 1..5)
        9: (2, {'brows'}),
        10: (3, {'brows'}),
        11: (4, {'brows'}),
        12: (5, {'brows'}),
        13: (5, {'brows'}),     # eyebrows 307 (no legacy row, the widest mesh): the widest brows (look 5)
        14: (3, {'moustache'}),  # moustache 1604 (cut out of legacy 304): the moustache tips of look 3
    },
    # orc male (facial_split GRAFT '2_0', only once landed): piece n = legacy row n's whole paint, on the mesh that
    # row shows (10n; row 1's stubble on the grafted chin tuft 111)
    (2, 0): {n: (n, set(PARTS)) for n in range(1, 11)},
}


def _load(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(f'{name}.py'))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "''")


def labels(alpha):
    """part name per pixel of a 192 x 256 alpha block (upper on top); '' where there is no paint"""
    core = alpha > 8
    lab, n = ndimage.label(ndimage.binary_dilation(core, iterations=2))
    out = np.full(alpha.shape, '', dtype=object)
    for k in range(1, n + 1):
        comp = (lab == k) & core
        if comp.sum() < 20:
            continue                        # stray dots (one sits at the top of look 5)
        ys, xs = np.nonzero(comp)
        cy, cx = ys.mean(), xs.mean()
        if cy < 84 and 48 <= cx < 208:
            part = 'brows'
        elif cx < 72 or cx >= 184:
            part = 'sides'
        elif cy < 150:
            part = 'moustache'
        else:
            part = 'chin'
        out[(lab == k) & (alpha > 0)] = part
    return out


# ---------------------------------------------------------------------------------------------------------------
# Every other race with painted facial hair (user 2026-10-31: "the stubble should not be a selector in any races, the
# stubble pairs with the geoset of hair that touches that part of the face"). Cut by the 3D model, not by layout:
# each texel of the face block (FaceUpper over FaceLower) is placed on the head through the body mesh's UVs and
# labelled with the slot group whose hair meshes are nearest to it. A look's paint in a group's region becomes the
# piece of the choice that shows that look's mesh in the group; the same mesh with other paint, and paint with no
# mesh of its own (the look shows none in that group), become appended choices, so every legacy look is a slot tuple.
# Excluded: night elf male (PIECES above, hand cut), undead male (jaw skins, not hair), undead female (jaw / cheek
# plating skins), worgen male (one fur texture on every row: the head coat that carries the hair colour), troll male
# (its paint is Face Markings since round 2), orc male (legacy row: each row is one mesh with its own paint, no
# separate selector), night elf female (face tattoos), goblin female (scalp hair).
AUTO = [(1, 0), (3, 0), (7, 0), (11, 0)]


def _split():
    return _load('facial_split')


def model_parts(race, sex):
    """(positions, uvs, [(submesh id, triangle vertex indices)], body texture submeshes) of the LOD0 HD model."""
    d = CURATED / MODEL[race] / ['MALE', 'FEMALE'][sex]
    stem = f"{MODEL[race]}{['MALE', 'FEMALE'][sex]}"
    m = (d / f'{stem}.M2').read_bytes()
    nv, ov = struct.unpack_from('<II', m, 60)
    raw = np.frombuffer(m, dtype=np.uint8, count=48 * nv, offset=ov).reshape(nv, 48)
    pos = raw[:, 0:12].copy().view('<f4').reshape(nv, 3)
    uv = raw[:, 32:40].copy().view('<f4').reshape(nv, 2)
    nt, ot = struct.unpack_from('<II', m, 80)
    ttype = [struct.unpack_from('<I', m, ot + 16 * i)[0] for i in range(nt)]
    ntl, otl = struct.unpack_from('<II', m, 128)
    tlook = [struct.unpack_from('<H', m, otl + 2 * i)[0] for i in range(ntl)]
    s = (d / f'{stem}00.SKIN').read_bytes()
    ni, oi = struct.unpack_from('<II', s, 4)
    idx = np.frombuffer(s, dtype='<u2', count=ni, offset=oi).astype(np.int64)
    ntr, otr = struct.unpack_from('<II', s, 12)
    tri = np.frombuffer(s, dtype='<u2', count=ntr, offset=otr).astype(np.int64)
    nsm, osm = struct.unpack_from('<II', s, 28)
    nb, ob = struct.unpack_from('<II', s, 36)
    subs = []
    for k in range(nsm):
        gid, lvl, _vs, _vc, is_, ic = struct.unpack_from('<6H', s, osm + 48 * k)
        start = is_ + (lvl << 16)
        subs.append((gid, idx[tri[start:start + ic]].reshape(-1, 3)))
    body = set()
    for b in range(nb):
        f = struct.unpack_from('<BbHHHhHHHH', s, ob + 24 * b)
        if f[9] < len(tlook) and tlook[f[9]] < len(ttype) and ttype[tlook[f[9]]] == 1:
            body.add(f[3])
    return pos, uv, subs, body


def region_map(race, sex, groups, skip=frozenset()):
    """192 x 256 int map of the face block: index into groups of the nearest group (3D, by its hair meshes; the
    geosets in skip - grafted retail meshes no legacy look shows - left out, so they move no existing paint)."""
    pos, uv, subs, body = model_parts(race, sex)
    P = np.full((192, 256, 3), np.nan, np.float32)
    for k in body:
        if subs[k][0] != 0:
            continue                                # the skin itself: other body submeshes (sleeves, belts) reuse UVs
        for t in subs[k][1]:
            x = uv[t, 0] * 512
            y = uv[t, 1] * 512 - 320
            if x.max() < 0 or x.min() >= 256 or y.max() < 0 or y.min() >= 192:
                continue
            x0, x1 = max(int(np.floor(x.min())), 0), min(int(np.ceil(x.max())), 255)
            y0, y1 = max(int(np.floor(y.min())), 0), min(int(np.ceil(y.max())), 191)
            gx, gy = np.meshgrid(np.arange(x0, x1 + 1) + 0.5, np.arange(y0, y1 + 1) + 0.5)
            dd = (y[1] - y[2]) * (x[0] - x[2]) + (x[2] - x[1]) * (y[0] - y[2])
            if abs(dd) < 1e-9:
                continue
            w0 = ((y[1] - y[2]) * (gx - x[2]) + (x[2] - x[1]) * (gy - y[2])) / dd
            w1 = ((y[2] - y[0]) * (gx - x[2]) + (x[0] - x[2]) * (gy - y[2])) / dd
            w2 = 1 - w0 - w1
            ins = (w0 >= -0.01) & (w1 >= -0.01) & (w2 >= -0.01)
            p = w0[..., None] * pos[t[0]] + w1[..., None] * pos[t[1]] + w2[..., None] * pos[t[2]]
            P[y0:y1 + 1, x0:x1 + 1][ins] = p[ins]
    mapped = ~np.isnan(P[..., 0])
    if not mapped.any():
        sys.exit(f'{race}/{sex}: no face texels on the body mesh')
    _, (iy, ix) = ndimage.distance_transform_edt(~mapped, return_indices=True)
    P = P[iy, ix]
    dist = []
    for g in groups:
        pts = np.concatenate([pos[np.unique(t)] for gid, t in subs if gid // 100 == g and gid % 100 > 1 and gid not in skip])
        dist.append(cKDTree(pts).query(P.reshape(-1, 3))[0].reshape(192, 256))
    face = P[mapped]

    height = float(face[:, 2].max() - face[:, 2].min())
    cache = {}

    def distance(geoset):
        """face texel -> distance to the hair mesh, in face heights (inf where the model lacks the mesh)"""
        if geoset not in cache:
            tris = [t for gid, t in subs if gid == geoset]
            if not tris:
                cache[geoset] = np.full((192, 256), np.inf)
            else:
                # the mesh SURFACE, not its vertices: points spread over every triangle (vertex-only distance
                # left round blots of paint around each hair vertex)
                t = np.concatenate(tris)
                w = np.array([(i, j, SURF - i - j) for i in range(SURF + 1) for j in range(SURF + 1 - i)], np.float32) / SURF
                pts = np.einsum('kw,nwc->nkc', w, pos[t]).reshape(-1, 3)
                cache[geoset] = cKDTree(pts).query(P.reshape(-1, 3))[0].reshape(192, 256) / height
        return cache[geoset]

    def footprint(geoset):
        """the face texels a hair mesh lies on (within FOOTPRINT face heights of its vertices)"""
        return distance(geoset) < FOOTPRINT

    footprint.distance = distance
    return np.argmin(np.stack(dist), axis=0), footprint


def whole_strokes(alpha, lab, sliver=SLIVER):
    """The region map for one look: a sliver of a stroke that crosses a region border (a piece of it under sliver px)
    joins the region of the paint it touches, so no choice carries a lone patch cut off another region's stroke."""
    out = lab.copy()
    for _ in range(3):
        moved = False
        for gi in range(int(lab.max()) + 1):
            comps, n = ndimage.label(alpha & (out == gi))
            for k in range(1, n + 1):
                comp = comps == k
                if comp.sum() >= sliver:
                    continue
                ring = ndimage.binary_dilation(comp, iterations=2) & ~comp & alpha
                if not ring.any():
                    continue
                votes = np.bincount(out[ring], minlength=int(lab.max()) + 1)
                if votes.argmax() != gi:
                    out[ndimage.binary_dilation(comp, iterations=2) & (out == gi)] = votes.argmax()
                    moved = True
        if not moved:
            break
    return out


def clip(block_alpha, base, distance, margin):
    """0-1 alpha multiplier: base mask, faded out beyond margin of the mesh, specks and strays removed"""
    d = distance
    keep = np.clip((margin + CLIP_FADE - d) / CLIP_FADE, 0, 1) * base
    solid = (block_alpha.astype(np.float32) * keep) > 16
    comps, n = ndimage.label(solid)
    if n:
        sizes = ndimage.sum(solid, comps, range(1, n + 1))
        good = 1 + np.flatnonzero((sizes >= SPECK) & (sizes >= STRAY * sizes.max()))
        near = ndimage.binary_dilation(np.isin(comps, good), iterations=2)
        keep = keep * near
    else:
        keep = keep * 0
    return keep


def face_block(files, r):
    """192 x 256 RGBA of a facial-hair row (FaceUpper over FaceLower), or None."""
    if not r or not (r['texture_1'] or r['texture_2']):
        return None
    lo = files.find(r['texture_1']) if r['texture_1'] else None
    up = files.find(r['texture_2']) if r['texture_2'] else None
    lo = read_blp(lo).convert('RGBA').resize((256, 128), Image.LANCZOS) if lo else Image.new('RGBA', (256, 128))
    up = read_blp(up).convert('RGBA').resize((256, 64), Image.LANCZOS) if up else Image.new('RGBA', (256, 64))
    return np.vstack([np.asarray(up), np.asarray(lo)])


def auto_race(race, sex, q, files):
    """-> (pieces {piece: (type, group index mask name)}, label map, groups, state entry)."""
    fs = _split()
    key = f'{race}_{sex}'
    spec = fs.SLOTS_BASE[key]
    grafted = fs.GRAFTED.get(key, set())
    # a slot offering only grafted meshes (human eyebrows) has no legacy paint: no region, no pieces, migrates to none
    slots = [sl for sl in spec['slots'] if sl[2] is not None and any(c[0] and c[0] not in grafted for c in sl[4])]
    groups = [sl[2] for sl in slots]
    lab, footprint = region_map(race, sex, groups, grafted)
    have = set.intersection(*[fs.skin_geosets(f) for f in fs.model_files(race, sex) if f.exists()])
    rows = {}
    for p in q(f'SELECT variation_id, geoset_1, geoset_2, geoset_3, geoset_4 FROM characterfacialhairstyles '
               f'WHERE race = {race} AND gender = {sex}'):
        rows[int(p['variation_id'])] = [int(p[c]) for c in ('geoset_1', 'geoset_2', 'geoset_3', 'geoset_4')]
    top = {}
    for r in q(f'SELECT id, type, color_index, texture_1, texture_2 FROM charsections WHERE race = {race} AND '
               f'gender = {sex} AND base_section = 2 ORDER BY id'):
        top[(int(r['type']), int(r['color_index']))] = r
    painted = {}
    for (t, c), r in top.items():
        if r['texture_1'] or r['texture_2']:
            painted.setdefault(c, set()).add(t)
    ref = max(painted, key=lambda c: (len(painted[c]), -c))     # the colour with the most painted looks
    alpha = {}
    for v in rows:
        b = face_block(files, top.get((v, ref)))
        alpha[v] = (b[..., 3] > 24) if b is not None else np.zeros((192, 256), bool)
    looklab = {v: whole_strokes(alpha[v], lab) for v in rows}
    imply = spec.get('imply', [])
    alias = fs.ALIAS.get(key, {})

    def shown(v, g):
        vis = {1: 100 + rows[v][0] if rows[v][0] else None, 3: 300 + rows[v][1] if rows[v][1] else None,
               2: 200 + rows[v][2] if rows[v][2] else None, 16: 1600 + rows[v][3] if rows[v][3] else None}
        implied = {b for a_, b in imply if a_ in vis.values()}
        cur = next((b for b in implied if b // 100 == g), None)
        if cur is None:
            cur = vis.get(g) or 0
            cur = 0 if cur and cur not in have else alias.get(cur, cur)
        return cur

    pieces, state = {}, {'ref_colour': ref, 'slots': {}, 'migration': {}}
    piece_no = 0
    for gi, sl in enumerate(slots):
        g = sl[2]
        geos = [c[0] for c in sl[4]]
        # choices: (geoset, look whose paint it carries or None); the slot's own choices first, appended ones after
        own = [[geo, None] for geo in geos]
        extra = []
        tex_of = {}                                 # look -> its paint mask in this region (None = no paint)
        for v in sorted(rows):
            m = alpha[v] & (looklab[v] == gi)
            tex_of[v] = m if m.sum() >= MIN_PAINT else None

        pick = {}
        fp = {geo: footprint(geo) for geo in geos if geo}

        def iou(a_, b_):
            return (a_ & b_).sum() / max((a_ | b_).sum(), 1)

        # user 2026-10-31: one choice per mesh, every choice a mesh. Each look goes to the mesh it shows; a look whose
        # paint has no mesh here goes to the mesh whose footprint fits that paint best (none if nothing fits). A mesh
        # carries the paint of the look among its own that fits its footprint best (the first look on a tie).
        cands = {}
        for v in sorted(rows):
            geo = shown(v, g)
            if geo not in geos:
                geo = 0
            m = tex_of[v]
            if geo == 0 and m is not None:          # painted, no mesh: the mesh (grafted ones too) that fits the paint best
                score, best = max(((iou(m, fp[x]), x) for x in fp), default=(0.0, 0))
                geo = best if score >= FIT_MIN else 0
            pick[v] = geos.index(geo)
            if geo and m is not None:
                cands.setdefault(geo, []).append(v)
        for ci, (geo, _v) in enumerate(own):
            if not geo:
                continue
            looks = cands.get(geo) or [x for x in sorted(rows) if tex_of[x] is not None]
            fits = [(iou(tex_of[x], fp[geo]), -x, x) for x in looks if tex_of[x] is not None]
            if fits:
                score, _neg, best = max(fits)
                if cands.get(geo) or score >= FIT_MIN:
                    own[ci][1] = best
        choices = own + extra
        if len(choices) > 15:
            sys.exit(f'{key} slot {sl[0]}: {len(choices)} choices with the paint variants (max 15)')
        out = []
        for geo, v in choices:
            if v is None:
                out.append(None)
                continue
            piece_no += 1
            pieces[piece_no] = (v, gi, geo)
            out.append(piece_no)
        state['slots'][str(sl[0])] = {'group': g, 'extra': [geo for geo, _v in extra], 'pieces': out,
                                      'looks': [v for _g, v in choices]}
        for v, ci in pick.items():
            state['migration'].setdefault(str(v), {})[str(sl[0])] = ci
    return pieces, looklab, state, footprint


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--sheet', help='write a contact sheet (source | each piece) of hair colour 2 here')
    ap.add_argument('--check', action='store_true', help='cut and compare with the shipped SQL, write nothing')
    a = ap.parse_args()
    files = _load('skin_preview').files_resolver()
    write_blp_rgba = _load('subrace_icons').write_blp_rgba
    q = _dbc_query_fn('live')

    sql = ['-- F-230: facial-hair pieces - the painted part under each split facial-hair choice (CharSections base_section 10,',
           '-- type = piece, color_index = hair colour; Zeppelin\\CharCustomizations.txt "tex=<piece>").',
           '-- GENERATED by Scripts/Character Skins/facial_pieces.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
           f'DELETE FROM charsections WHERE id BETWEEN {ID2_BASE} AND {ID2_END};',
           'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, '
           'color_index) VALUES']
    vals, writes, sheet, rid = [], [], [], ID_BASE
    jobs = []                                   # (race, sex, {piece: (type, keep(block) -> mask)})
    fs = _split()
    for (race, sex), pieces in PIECES.items():
        key = f'{race}_{sex}'
        if key not in fs.PIECE_OF:
            continue                            # a race whose pieces wait for its graft to land (facial_split.LANDED)
        slots = [sl for sl in fs.SLOTS_BASE[key]['slots'] if sl[2] is not None]
        _lab, fpr = region_map(race, sex, [sl[2] for sl in slots])
        mesh = {}                               # piece -> the meshes whose choices carry it
        for sl in slots:
            for (geo, *_r), pc in zip(sl[4], fs.PIECE_OF[key].get(sl[0], [])):
                if pc is not None and geo:
                    mesh.setdefault(pc, []).append(geo)

        def keep_parts(parts, geos, race=race):
            want = set(PARTS) - {'brows'} if parts == 'nobrows' else parts
            dist = np.min(np.stack([fpr.distance(x) for x in geos]), axis=0)
            return lambda block: clip(block[..., 3], np.isin(labels(block[..., 3]), list(want)), dist, CLIP[race])
        jobs.append((race, sex, {n: (t, keep_parts(parts, mesh[n])) for n, (t, parts) in pieces.items() if n in mesh}))
    state = {}
    for race, sex in AUTO:
        pieces, lab, st, fpr = auto_race(race, sex, q, files)
        state[f'{race}_{sex}'] = st
        jobs.append((race, sex, {n: (t, (lambda lb, gi, dist, m: lambda block: clip(block[..., 3], lb == gi, dist, m))(
            lab[t], gi, fpr.distance(geo), CLIP[race])) for n, (t, gi, geo) in pieces.items()}))
        print(f'{FOLDERS[race]} {SEXES[sex]}: {len(pieces)} pieces, reference colour {st["ref_colour"]}, ' +
              ', '.join(f'slot {k}: {len(v["pieces"])} choices ({len(v["extra"])} added)' for k, v in st['slots'].items()))
    for race, sex, pieces in jobs:
        top = {}
        for r in q(f'SELECT id, type, color_index, texture_1, texture_2, flags FROM charsections WHERE race = {race} '
                   f'AND gender = {sex} AND base_section = 2 ORDER BY id'):
            top[(int(r['type']), int(r['color_index']))] = r          # highest id wins, as in the client
        colours = sorted({c for (t, c) in top})
        folder, sx = FOLDERS[race], SEXES[sex]
        for colour in colours:
            cut = {}
            for t in sorted({p[0] for p in pieces.values()}):
                r = top.get((t, colour))
                block = face_block(files, r)
                if block is not None:
                    cut[t] = (block, int(r['flags']))
            for piece, (t, keep_fn) in pieces.items():
                if t not in cut:
                    continue
                block, flags = cut[t]
                out = block.copy()
                out[..., 3] = (out[..., 3].astype(np.float32) * keep_fn(block)).astype(np.uint8)
                out[out[..., 3] == 0] = 0
                if out[..., 3].max() == 0:
                    continue
                names = []
                for half, y0, y1, kind in (('texture_1', 64, 192, 'Lower'), ('texture_2', 0, 64, 'Upper')):
                    part = out[y0:y1]
                    if part[..., 3].max() == 0:
                        names.append('')
                        continue
                    rel = f'Character\\{folder}\\{sx}\\{folder}{sx}FacialPiece{piece:02d}{kind}_{colour:02d}.blp'
                    writes.append((rel, Image.fromarray(part, 'RGBA')))
                    names.append(rel)
                if rid == ID_END + 1:
                    rid = ID2_BASE
                if rid > ID2_END:
                    sys.exit('id range full')
                vals.append(f"({rid}, {race}, {sex}, 10, '{esc(names[0])}', '{esc(names[1])}', '', {flags}, {piece}, {colour})")
                rid += 1
                if colour == SHEET_COLOUR.get((race, sex), 2):
                    sheet.append((f'{race}_{sex} p{piece} t{t}', Image.fromarray(out, 'RGBA')))
    text = '\n'.join(sql) + '\n' + ',\n'.join(vals) + ';\n'
    state_text = json.dumps(state, indent=1, sort_keys=True) + '\n'
    if a.check:
        same = SQL.exists() and SQL.read_text() == text and STATE.exists() and STATE.read_text() == state_text
        print(f'{SQL.name}: ' + ('up to date' if same else 'DIFFERS') + f' ({len(vals)} rows)')
        sys.exit(0 if same else 1)
    for d in (ASSETS, PARSED):
        for race, sex in list(PIECES) + AUTO:
            folder, sx = FOLDERS[race], SEXES[sex]
            root = d / 'Character' / folder / sx if d is ASSETS else d / 'CHARACTER' / folder.upper() / sx.upper()
            for f in root.glob(f'{folder}{sx}FacialPiece*' if d is ASSETS else f'{folder.upper()}{sx.upper()}FACIALPIECE*'):
                f.unlink()                  # stale pieces (the parsed copies too)
    for rel, im in writes:
        src = ASSETS / rel.replace('\\', '/')
        write_blp_rgba(src, im)
        dst = PARSED / rel.replace('\\', '/').upper()
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes(src.read_bytes())
    SQL.write_text(text)
    STATE.write_text(state_text)
    print(f'wrote {SQL} ({len(vals)} rows, {len(writes)} textures)')
    if a.sheet and sheet:
        cell_w, cell_h = 256, 192
        cols = 6
        S = Image.new('RGBA', (cell_w * cols, (cell_h + 14) * ((len(sheet) + cols - 1) // cols)), (60, 60, 60, 255))
        d = ImageDraw.Draw(S)
        for i, (name, im) in enumerate(sheet):
            x, y = (i % cols) * cell_w, (i // cols) * (cell_h + 14)
            bg = Image.new('RGBA', im.size, (235, 225, 225, 255))
            bg.alpha_composite(im)
            S.paste(bg, (x, y + 14))
            d.text((x + 3, y + 1), str(name), fill=(255, 255, 0, 255))
        S.save(a.sheet)
        print('wrote', a.sheet)


if __name__ == '__main__':
    main()
