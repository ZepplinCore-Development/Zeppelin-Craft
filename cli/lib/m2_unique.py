"""F-216: one comparison of two models' LOOKS - the duplicate test AND what the card says is unique.

_components() splits what the client draws into named parts (what is drawn, not how the file is
written: triangles unordered, the shader the client DERIVES rather than the stored id, inline keyframes
only). The index merges two options when every part is equal (look()); otherwise diff() names each part
that differs, so an option kept apart always says what to look for (zangarmushroomtreesmall01: the
additive glow pass removed; raid helms: reflection maps dropped).
  mesh      triangle positions          shading   + normals          UV   + texture coords
  layers    each batch's textures, material, derived shader, colour link + the triangles it draws
  anims     sequences (id, variation, duration)    skeleton  bone parents, pivots, inline keyframes
  counts    bones, attachments, lights, ribbons, particles     (+ external .anim files, by content)
Retroports are a separate relation (lib/retroport: a pack model as a subset of retail's).
"""
import hashlib
import struct
from typing import Dict, List, Optional

BLEND = {0: 'opaque', 1: 'alpha-key', 2: 'alpha', 3: 'additive (no alpha)', 4: 'additive', 5: 'modulate',
         6: 'modulate 2x'}


def _arr(b: bytes, at: int):
    return struct.unpack_from('<II', b, at)


def _texnames(b: bytes) -> List[tuple]:
    n, o = _arr(b, 0x50)
    out = []
    for i in range(n):
        t, f, ln, no = struct.unpack_from('<4I', b, o + 16 * i)
        name = b[no:no + ln].split(b'\0')[0].decode('latin1').lower().replace('\\', '/') if ln else ''
        out.append((t, name))
    return out


def _lookup(b: bytes, at: int) -> tuple:
    n, o = _arr(b, at)
    return struct.unpack_from(f'<{n}h', b, o) if n and o + 2 * n <= len(b) else ()


def _verts(m2: bytes):
    import numpy as np
    nv, ov = _arr(m2, 0x3C)
    return np.frombuffer(m2, np.uint8, nv * 48, ov).reshape(nv, 48) if nv and ov + 48 * nv <= len(m2) else np.zeros((0, 48), np.uint8)


def _pos(v):
    return v[:, 0:12].copy().view('<f4').reshape(-1, 3)


def _uv(v):
    return v[:, 32:40].copy().view('<f4').reshape(-1, 2)


def summary(m2: bytes, skin: Optional[bytes]) -> Optional[dict]:
    """The comparable facts of one model (cached per file by the caller); None when unreadable."""
    if m2[:4] != b'MD20' or len(m2) < 0x130:
        return None
    try:
        return _summary(m2, skin)
    except (struct.error, ValueError, IndexError):
        return None                                        # a truncated table: no claims about it


def _summary(m2: bytes, skin: Optional[bytes]) -> dict:
    s: dict = {'verts': _arr(m2, 0x3C)[0]}
    s['bones'] = _arr(m2, 0x2C)[0]
    na, oa = _arr(m2, 0x1C)
    s['anims'] = sorted({struct.unpack_from('<HH', m2, oa + 64 * i) for i in range(na)})
    na, oa = _arr(m2, 0xF0)
    s['attach'] = sorted(struct.unpack_from('<I', m2, oa + 40 * i)[0] for i in range(na))
    s['particles'], s['ribbons'], s['lights'] = _arr(m2, 0x128)[0], _arr(m2, 0x120)[0], _arr(m2, 0x108)[0]
    box = struct.unpack_from('<6f', m2, 0xA0)
    s['height'] = round(box[5] - box[2], 2)
    s['geosets'], s['tris'] = [], 0
    if skin and skin[:4] == b'SKIN' and len(skin) >= 0x30:
        ns, os_ = _arr(skin, 28)
        s['tris'] = struct.unpack_from('<I', skin, 12)[0] // 3
        s['geosets'] = sorted({struct.unpack_from('<H', skin, os_ + 48 * j)[0] for j in range(ns)})
    s['c'], s['batches'] = _components(m2, skin)
    return s


def _derived_shader(m2: bytes, mats, sh: int, mi: int, tc: int, coord: int) -> tuple:
    """The runtime shader the 3.3.5 client derives for a batch (port of pane.html fixLegacySkin, from the
    builder at 0x836C90): without blend maps (global flag 0x8) the STORED id is ignored - only the
    material's blend and the texture-coord unit (UV set or env map) count (gilneas_vines_02: stored 16 vs
    0, the same draw)."""
    if sh & 0x8000:
        return ('native', sh & 0x7FFF)
    flags = struct.unpack_from('<I', m2, 0x10)[0]
    ntu, otu = _arr(m2, 0x88)
    tu = lambda i: struct.unpack_from('<H', m2, otu + 2 * i)[0] if i < ntu else 0xFFFF
    blending = mats[mi][1] if mi < len(mats) else 0
    if not flags & 0x8:
        i_ = 1 if blending else 0
        if tu(coord) > 2:
            i_ |= 8
        i_ <<= 4
        if tu(coord) == 1:
            i_ |= 0x4000
        return ('derived', i_)
    nbm, obm = _arr(m2, 0x130)
    bm = lambda i: struct.unpack_from('<H', m2, obm + 2 * i)[0] if i < nbm else 0
    vals, i_ = [0, 0], 0
    for j in range(min(tc, 2)):
        v = 0 if (j == 0 and blending == 0) else bm(sh + j)
        vals[j] = v | 8 if tu(coord + j) > 2 else v
        if tu(coord + j) == 1 and j + 1 == tc:
            i_ |= 0x4000
    return ('derived', (i_ | (vals[1] & 0xFFFF) | ((vals[0] << 4) & 0xFFFF)) & 0xFFFF)


def _tri_hash(rows, tris, distinct: bool = False) -> str:
    """Order-free hash of triangles: rows = per-vertex int arrays, tris = (n, 3) vertex ids. Vertex
    order, index order and triangle order do not count; distinct: a triangle drawn twice (a base pass +
    a glow pass over the same faces) counts once - how often it is drawn is the layers' business."""
    import numpy as np
    if not len(tris):
        return ''
    _, inv = np.unique(rows, axis=0, return_inverse=True)        # ids in lexicographic row order
    t = np.sort(inv.reshape(-1)[tris], axis=1)
    t = np.unique(t, axis=0) if distinct else t[np.lexsort(t.T[::-1])]
    u = np.unique(rows, axis=0)
    return hashlib.sha1(u.tobytes() + t.astype(np.int64).tobytes()).hexdigest()[:16]


def _components(m2: bytes, skin: Optional[bytes]) -> tuple:
    """The model's LOOK as named parts: every one equal = the same look (a duplicate, merged by the
    index); every one that differs is named on the card. What the client draws, not how the file is
    written: triangles (unordered), each batch's texture refs / material / derived shader / colour.
      mesh     triangle positions          shading  + normals          uv  + texture coords
      layers   per batch: key + the exact triangles it draws
      anims    sequences (id, variation, duration)   skeleton  bone parents, pivots, inline keyframes
      counts   bones, attachments, lights, ribbons, particles
    -> ({component: hash}, [batch keys] for describing layer changes)"""
    import numpy as np
    c: Dict[str, str] = {}
    v = _verts(m2)
    with np.errstate(all='ignore'):
        f = np.nan_to_num(v[:, :].copy().view('<f4').reshape(-1, 12) if len(v) else np.zeros((0, 12), np.float32),
                          nan=0, posinf=1e6, neginf=-1e6)
        q = np.clip(np.round(f * 1000), -2e9, 2e9).astype(np.int64)   # 1/1000 yd / UV
    pos, nrm, uv = q[:, 0:3], q[:, 5:8], q[:, 8:10]
    tex = _texnames(m2)
    nm, om = _arr(m2, 0x70)
    mats = [struct.unpack_from('<HH', m2, om + 4 * i) for i in range(nm)]
    tl = _lookup(m2, 0x80)
    keys, groups, alltris = [], {}, []
    if skin and skin[:4] == b'SKIN' and len(skin) >= 0x30 and len(v):
        ni, oi = _arr(skin, 0x04)
        vidx = np.frombuffer(skin, '<u2', ni, oi).astype(np.int64)
        nt, ot = _arr(skin, 0x0C)
        tri = np.frombuffer(skin, '<u2', nt, ot).astype(np.int64)
        ns, os_ = _arr(skin, 0x1C)
        subs = [struct.unpack_from('<HHHHHH', skin, os_ + 48 * i) for i in range(ns)]
        nb, ob = _arr(skin, 0x24)
        for b in range(nb):
            _, _, sh, si, _, ci, mi, _, tc, tcomb, coord = struct.unpack_from('<BbHHHhHHHHH', skin, ob + 24 * b)
            if si >= len(subs):
                continue
            sid, lvl, _, _, is_, ic = subs[si]
            start = is_ + (lvl << 16)
            t = vidx[tri[start:start + ic - ic % 3]].reshape(-1, 3)
            # a display-skin slot (type != 0) is compared by type: its name is ignored by the client
            texs = tuple((tex[tl[tcomb + k]][0], tex[tl[tcomb + k]][1] if tex[tl[tcomb + k]][0] == 0 else '')
                         if tcomb + k < len(tl) and 0 <= tl[tcomb + k] < len(tex) else None for k in range(tc))
            key = (sid, texs, mats[mi] if mi < len(mats) else None, _derived_shader(m2, mats, sh, mi, tc, coord), ci)
            keys.append(key)
            groups.setdefault(repr(key), []).append(t)
            alltris.append(t)
    full = np.concatenate([pos, nrm, uv], axis=1)
    at = np.concatenate(alltris) if alltris else np.zeros((0, 3), np.int64)
    c['mesh'] = _tri_hash(pos, at, distinct=True)
    c['shading'] = _tri_hash(np.concatenate([pos, nrm], axis=1), at, distinct=True)
    c['uv'] = _tri_hash(np.concatenate([pos, uv], axis=1), at, distinct=True)
    c['layers'] = hashlib.sha1(repr(sorted((k, _tri_hash(full, np.concatenate(g))) for k, g in groups.items())).encode()).hexdigest()[:16]
    nseq, oseq = _arr(m2, 0x1C)
    c['anims'] = hashlib.sha1(repr(sorted(struct.unpack_from('<HHI', m2, oseq + 0x40 * i) for i in range(nseq))).encode()).hexdigest()[:16]
    c['skeleton'] = _bones_signature(m2) or ''
    c['counts'] = repr(tuple(_arr(m2, h)[0] for h in (0x2C, 0xF0, 0x108, 0x120, 0x128)))
    return c, keys


def _bones_signature(m2: bytes) -> Optional[str]:
    """The skeleton and the keyframes the model itself holds: each bone's parent and pivot, and per
    translation / rotation / scale track its interpolation, global sequence and, for every sequence whose
    data lives in the .m2 (flag 0x20), the timestamps and values (external .anim files are compared as files)."""
    try:
        nseq, oseq = _arr(m2, 0x1C)
        inline = [bool(struct.unpack_from('<I', m2, oseq + 0x40 * i + 12)[0] & 0x20) for i in range(nseq)]
        nb, ob = _arr(m2, 0x2C)
        h = hashlib.sha1()
        sizes = (12, 8, 12)                                # T: vec3, R: compressed quat, S: vec3
        for i in range(nb):
            at = ob + 88 * i
            parent = struct.unpack_from('<h', m2, at + 8)[0]
            pivot = tuple(round(x, 3) for x in struct.unpack_from('<3f', m2, at + 0x4C))
            h.update(repr((parent, pivot)).encode())
            for k, to in enumerate((0x10, 0x24, 0x38)):
                interp, gs, tc, tofs, vc, vofs = struct.unpack_from('<HhIIII', m2, at + to)
                h.update(repr((interp, gs, tc)).encode())
                for q in range(min(tc, vc)):
                    if gs < 0 and q < nseq and not inline[q]:
                        continue
                    n1, o1 = struct.unpack_from('<II', m2, tofs + 8 * q)
                    n2, o2 = struct.unpack_from('<II', m2, vofs + 8 * q)
                    h.update(m2[o1:o1 + 4 * n1])
                    h.update(m2[o2:o2 + sizes[k] * n2])
        return h.hexdigest()[:16]
    except (struct.error, IndexError):
        return None


def look(m2: bytes, skin: Optional[bytes]) -> Optional[str]:
    """One hash of every component: two options with the same look are duplicates (asset_index merges
    them). None when unreadable."""
    s = summary(m2, skin)
    return None if s is None else hashlib.sha1(repr(sorted(s['c'].items())).encode()).hexdigest()[:16]


def _ids(xs) -> str:
    xs = list(xs)
    return ', '.join(str(x) for x in xs[:8]) + (f' +{len(xs) - 8} more' if len(xs) > 8 else '')


def _tname(t) -> str:
    if t is None:
        return 'no texture'
    ty, n = t
    return n.rsplit('/', 1)[-1] if ty == 0 else f'display skin {ty}'


def _batch_text(k) -> str:
    """One render batch in words: blend + flags, how its texture is mapped, its textures."""
    sid, texs, mat, shader, ci = k
    flags, blend = mat if mat else (0, 0)
    bits = [BLEND.get(blend, f'blend {blend}')]
    bits += [w for b_, w in ((0x1, 'unlit'), (0x2, 'unfogged'), (0x4, 'two-sided'), (0x8, 'no depth test'),
                             (0x10, 'no depth write')) if flags & b_]
    if shader[0] == 'derived' and not shader[1] & 0x8000:
        if shader[1] & 0x80:
            bits.append('env-mapped')                      # the texture follows the camera (reflection)
        if shader[1] & 0x4000:
            bits.append('2nd UV set')
    elif shader[0] == 'native':
        bits.append(f'shader {shader[1]}')
    if ci >= 0:
        bits.append('colour-animated')
    return f"{' '.join(bits)} ({', '.join(_tname(t) for t in texs)})"


def diff(stock: dict, pack: dict, m2s=None) -> List[List[str]]:
    """[[kind, what to look for], ...] from the components that differ (_components): every differing
    component gets at least one line, so an option the index keeps apart always says why. Kinds = the
    part to look at: mesh, texture, shader, particles, lights, animation, rig. kind 'minor'
    = context only (re-indexed vertices, a size change already explained by the mesh). m2s: callable ->
    (stock .m2 bytes, pack .m2 bytes), read only to measure moved vertices / remapped UVs."""
    import numpy as np
    ca, cb = stock['c'], pack['c']
    dif = {k for k in ca if ca.get(k) != cb.get(k)}
    out: List[List[str]] = []
    many = len(set(stock['geosets']) | set(pack['geosets'])) > 1
    on = lambda g: f'geoset {g}: ' if many else ''
    # -- mesh / shading / UV ------------------------------------------------------------
    moved = None
    if stock['verts'] == pack['verts'] and stock['verts'] and m2s and dif & {'mesh', 'uv'}:
        va, vb = (_verts(x) for x in m2s())
        with np.errstate(all='ignore'):
            d = np.nan_to_num(np.linalg.norm(_pos(va) - _pos(vb), axis=1), nan=1e9, posinf=1e9)
            du = np.nan_to_num(np.abs(_uv(va) - _uv(vb)).max(axis=1), nan=1.0, posinf=1.0)
        moved = (int((d > 0.0005).sum()), float(d.max()) if len(d) else 0.0, int((du > 0.0005).sum()))
    if 'mesh' in dif:
        if stock['tris'] != pack['tris']:
            out.append(['mesh', f"rebuilt: {stock['verts']:,} → {pack['verts']:,} vertices, {stock['tris']:,} → {pack['tris']:,} triangles"])
        elif moved and moved[0]:
            out.append(['mesh', f"{moved[0]:,} of {stock['verts']:,} vertices moved (up to {moved[1]:.3f} yd)"])
        else:
            out.append(['mesh', f"reshaped: same {stock['tris']:,} triangles, different vertices"])
        h1, h2 = stock['height'], pack['height']
        if h1 > 0 and abs(h2 - h1) / h1 > 0.03:
            out.append(['mesh', f"height {h1:g} → {h2:g} yd"])
    elif stock['verts'] != pack['verts']:
        out.append(['minor', f"re-indexed: {stock['verts']:,} → {pack['verts']:,} vertices, same triangles"])
    if 'shading' in dif and 'mesh' not in dif:
        out.append(['mesh', 'normals changed: the model is lit / shaded differently'])
    if 'uv' in dif and 'mesh' not in dif:
        out.append(['texture', f"UVs remapped{f' on {moved[2]:,} vertices' if moved and moved[2] else ''}: textures sit differently"])
    ga, gb = set(stock['geosets']), set(pack['geosets'])
    if gb - ga:
        out.append(['mesh', f"adds geosets {_ids(sorted(gb - ga))}"])
    if ga - gb:
        out.append(['mesh', f"drops geosets {_ids(sorted(ga - gb))}"])
    # -- layers: the batches, as keys (geoset, textures, material, derived shader, colour) -------
    if 'layers' in dif:
        n0 = len(out)
        ta = {t for k in stock['batches'] for t in k[1] if t}
        tb = {t for k in pack['batches'] for t in k[1] if t}
        by = lambda ts: {}.__class__((t[1].rsplit('/', 1)[-1], t) for t in ts if t[0] == 0)
        na, nb_ = by(ta - tb), by(tb - ta)
        for base in sorted(set(na) & set(nb_)):             # same file name, another folder
            out.append(['texture', f"{na[base][1]} → {nb_[base][1]}"])
        new_t = sorted(_tname(t) for t in tb - ta if not (t[0] == 0 and t[1].rsplit('/', 1)[-1] in na))
        old_t = sorted(_tname(t) for t in ta - tb if not (t[0] == 0 and t[1].rsplit('/', 1)[-1] in nb_))
        if new_t:
            out.append(['texture', 'uses ' + ', '.join(new_t)])
        if old_t:
            out.append(['texture', 'no longer uses ' + ', '.join(old_t)])
        ka, kb = [tuple(k) for k in stock['batches']], [tuple(k) for k in pack['batches']]
        gone = [k for k in ka if k not in kb]
        new = [k for k in kb if k not in ka]
        names = lambda k: {_tname(t) for t in k[1]}
        for x in list(gone):                                 # same geoset + textures: the batch was edited
            y = next((y for y in new if y[0] == x[0] and names(y) == names(x)), None)
            if y is not None:
                gone.remove(x); new.remove(y)
                out.append(['shader', f"{on(x[0])}{_batch_text(x)} → {_batch_text(y)}"])
        for g in sorted({k[0] for k in gone} | {k[0] for k in new}):
            gg, nn = [k for k in gone if k[0] == g], [k for k in new if k[0] == g]
            if gg and nn and set().union(*map(names, gg)) == set().union(*map(names, nn)):
                out.append(['shader', f"{on(g)}{len(gg)} → {len(nn)} batches, same textures: "
                                      + '; '.join(map(_batch_text, gg)) + ' → ' + '; '.join(map(_batch_text, nn))])
                continue
            out += [['shader', f"{on(g)}removed {_batch_text(k)}"] for k in gg if g in gb]
            out += [['shader', f"{on(g)}added {_batch_text(k)}"] for k in nn if g in ga]
        if len(out) == n0 and not dif & {'mesh', 'uv', 'shading'}:
            out.append(['shader', 'triangles drawn by other batches (same mesh, regrouped)'])
    # -- animation / rig / effects -------------------------------------------------------
    sa, sb = set(stock['anims']), set(pack['anims'])
    if sa != sb:
        fmt = lambda xs: _ids(f'{i}' if v == 0 else f'{i}.{v}' for i, v in sorted(xs))
        out.append(['animation', '; '.join(x for x in (f'+{len(sb - sa)} ({fmt(sb - sa)})' if sb - sa else '',
                                                        f'−{len(sa - sb)} ({fmt(sa - sb)})' if sa - sb else '') if x)])
    elif 'anims' in dif:
        out.append(['animation', 'same animations, different timings'])
    if stock['bones'] != pack['bones']:
        out.append(['rig', f"bones {stock['bones']} → {pack['bones']}"])
    elif 'skeleton' in dif:
        out.append(['animation', 'bone pivots / keyframes differ: the model moves differently'])
    aa, ab = set(stock['attach']), set(pack['attach'])
    if aa != ab:
        out.append(['rig', 'attachments ' + '; '.join(x for x in (
            f'+{_ids(sorted(ab - aa))}' if ab - aa else '', f'−{_ids(sorted(aa - ab))}' if aa - ab else '') if x)])
    for k, word in (('particles', 'particle emitters'), ('ribbons', 'ribbon emitters'), ('lights', 'lights')):
        if stock[k] != pack[k]:
            out.append(['lights' if k == 'lights' else 'particles', f"{word} {stock[k]} → {pack[k]}"])
    if 'counts' in dif and not any(u[0] in ('rig', 'particles', 'lights') for u in out):
        out.append(['rig', 'attachment count differs'])
    return out


def unique(stock_files: Dict[str, 'Path'], pack_files: Dict[str, 'Path'], path: str, cache=None) -> Optional[List[List[str]]]:
    """diff() of two mesh options' files ({normalised path: file}); None when either can't be read."""
    sk = path[:-3] + '00.skin'

    def summ(files):
        if path not in files:
            return None
        f = files[path]
        fn = lambda _f: summary(f.read_bytes(), files[sk].read_bytes() if sk in files else None)
        if cache is None:
            return fn(f)
        # the cache checks the .m2's size + mtime; an option is the PAIR, so the skin's go in the key
        st = files[sk].stat() if sk in files else None
        return cache.get(f'unique5|{files.get(sk, "")}|{st.st_size if st else 0}|{st.st_mtime_ns if st else 0}', f, fn)

    a, b = summ(stock_files), summ(pack_files)
    if a is None or b is None:
        return None
    out = diff(a, b, lambda: (stock_files[path].read_bytes(), pack_files[path].read_bytes()))
    # external .anim files count for the look too (asset_index._look)
    an = lambda fs: {k: fs[k] for k in fs if k.endswith('.anim')}
    xa, xb = an(stock_files), an(pack_files)
    if set(xa) != set(xb) or any(xa[k].read_bytes() != xb[k].read_bytes() for k in xa):
        n = len(set(xa) ^ set(xb)) + sum(1 for k in set(xa) & set(xb) if xa[k].read_bytes() != xb[k].read_bytes())
        out.append(['animation', f"{n} external .anim file{'s' if n > 1 else ''} differ"])
    return out
