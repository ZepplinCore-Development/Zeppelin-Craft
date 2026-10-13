"""F-216: what is UNIQUE about a pack's model compared with stock - what to look for on its card.

Byte comparison only says a pack's file differs; m2_same says whether it renders the same. This
lists the visible differences, one line each (zangarmushroomtreesmall01: same mesh and texture, the
additive glow pass removed). Compared, M2 + LOD 0 skin:
  geometry   vertex / triangle counts; same count: vertices moved, UVs remapped
  geosets    submesh geoset ids added / removed
  passes     render batches (geoset, blend mode, unlit / unfogged / two-sided, textures, scrolling UV),
             matched as a multiset: a pass only stock draws is "removed", only the pack's is "added"
  textures   fixed texture names (type 0) added / removed / renamed
  effects    particles, ribbons, lights
  rig        bones, attachments, animations (id.variation)
  size       bounding box height
Display-skin slots (types 11-13) are left to the display layer. Textures' own contents are the
texture layer's job and are not compared here.
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
    import numpy as np
    s: dict = {}
    nv = _arr(m2, 0x3C)[0]
    v = _verts(m2)
    s['verts'] = nv
    # hashes, not arrays (the meta cache holds every option): a mismatch re-reads both files for the delta
    with np.errstate(all='ignore'):                      # garbage floats in broken packs overflow round()
        s['pos_h'] = hashlib.sha1(np.round(_pos(v), 3).tobytes()).hexdigest()[:16]
        s['uv_h'] = hashlib.sha1(np.round(_uv(v), 3).tobytes()).hexdigest()[:16]
    s['bones'] = _arr(m2, 0x2C)[0]
    na, oa = _arr(m2, 0x1C)
    s['anims'] = sorted({struct.unpack_from('<HH', m2, oa + 64 * i) for i in range(na)})
    na, oa = _arr(m2, 0xF0)
    s['attach'] = sorted(struct.unpack_from('<I', m2, oa + 40 * i)[0] for i in range(na))
    s['particles'], s['ribbons'], s['lights'] = _arr(m2, 0x128)[0], _arr(m2, 0x120)[0], _arr(m2, 0x108)[0]
    box = struct.unpack_from('<6f', m2, 0xA0)
    s['height'] = round(box[5] - box[2], 2)
    tex = _texnames(m2)
    slot = lambda t, n: n.rsplit('/', 1)[-1] if t == 0 else f'display skin {t}'
    # by file name: a pack moving a texture to another folder draws the same image
    s['textures'] = sorted({slot(t, n) for t, n in tex if n or t})
    nm, om = _arr(m2, 0x70)
    mats = [struct.unpack_from('<HH', m2, om + 4 * i) for i in range(nm)]
    tl, uvl = _lookup(m2, 0x80), _lookup(m2, 0x98)
    s['geosets'], s['tris'], s['layers'] = [], 0, []
    if skin and skin[:4] == b'SKIN' and len(skin) >= 0x30:
        ni = struct.unpack_from('<I', skin, 12)[0]
        ns, os_ = _arr(skin, 28)
        nb, ob = _arr(skin, 36)
        s['tris'] = ni // 3
        subs = [struct.unpack_from('<H', skin, os_ + 48 * j)[0] for j in range(ns)]
        s['geosets'] = sorted(set(subs))
        layers = set()
        for j in range(nb):
            (_, _, _, sec, _, _, mat, _, tc, _, _, _, uvcombo) = struct.unpack_from('<BbHHHhHHHHHHH', skin, ob + 24 * j)
            flags, blend = mats[mat] if mat < len(mats) else (0, 0)
            gid = subs[sec] if sec < len(subs) else -1
            scroll = uvcombo < len(uvl) and uvl[uvcombo] >= 0
            # a layer = what the client blends onto the geoset. A modulate batch and the 2nd texture unit
            # of a multi-texture batch are the same thing re-exported (armour reflection maps), so one kind
            layers.add((gid, 'modulate' if blend in (5, 6) else BLEND.get(blend, f'blend {blend}'), flags & 0x7, scroll))
            if tc > 1:
                layers.add((gid, 'modulate', 0, False))
        s['layers'] = sorted(layers)
    return s


def _layer_text(blend: str, flags: int, scroll: bool) -> str:
    bits = [blend] + [w for b_, w in ((0x1, 'unlit'), (0x2, 'unfogged'), (0x4, 'two-sided')) if flags & b_]
    return ' '.join(bits + (['scrolling'] if scroll else []))


def _ids(xs) -> str:
    xs = list(xs)
    return ', '.join(str(x) for x in xs[:8]) + (f' +{len(xs) - 8} more' if len(xs) > 8 else '')


def diff(stock: dict, pack: dict, m2s: Optional[tuple] = None) -> List[List[str]]:
    """[[kind, what to look for], ...] - empty when nothing visible differs. m2s = (stock .m2 bytes,
    pack .m2 bytes) as a callable, read only when the same vertex count hides moved vertices or UVs."""
    import numpy as np
    out: List[List[str]] = []
    if stock['tris'] == pack['tris'] and stock['verts'] != pack['verts']:
        # same triangles, vertices split or merged at seams: a re-export, nothing to see
        out.append(['minor', f"mesh re-indexed ({stock['verts']:,} → {pack['verts']:,} vertices, same triangles)"])
    elif stock['verts'] != pack['verts'] or stock['tris'] != pack['tris']:
        out.append(['geometry', f"mesh rebuilt: {stock['verts']:,} → {pack['verts']:,} vertices, "
                                f"{stock['tris']:,} → {pack['tris']:,} triangles"])
    elif stock['verts'] and (stock['pos_h'] != pack['pos_h'] or stock['uv_h'] != pack['uv_h']) and m2s:
        va, vb = (_verts(x) for x in m2s())
        with np.errstate(all='ignore'):
            d = np.nan_to_num(np.linalg.norm(_pos(va) - _pos(vb), axis=1), nan=1e9, posinf=1e9)
        moved = int((d > 0.01).sum())
        if moved:
            out.append(['geometry', f"{moved:,} of {stock['verts']:,} vertices moved (up to {float(d.max()):.2f} yd)"])
        with np.errstate(all='ignore'):
            du = np.nan_to_num(np.abs(_uv(va) - _uv(vb)).max(axis=1), nan=1.0, posinf=1.0)
        if int((du > 0.005).sum()):
            out.append(['uv', f"UVs remapped on {int((du > 0.005).sum()):,} vertices (texture sits differently)"])
    ga, gb = set(stock['geosets']), set(pack['geosets'])
    if gb - ga:
        out.append(['geosets', f"adds geosets {_ids(sorted(gb - ga))}"])
    if ga - gb:
        out.append(['geosets', f"drops geosets {_ids(sorted(ga - gb))}"])
    la, lb = set(map(tuple, stock['layers'])), set(map(tuple, pack['layers']))
    many = len(ga | gb) > 1
    on = lambda g: f' on geoset {g}' if many else ''
    gone, new = sorted(la - lb), sorted(lb - la)
    for x in list(gone):
        y = next((y for y in new if y[:2] == x[:2]), None)        # same geoset + blend: flags changed
        if y is not None:
            gone.remove(x); new.remove(y)
            out.append(['layer', f"{_layer_text(*x[1:])} layer{on(x[0])} is now {_layer_text(*y[1:])}"])
    out += [['layer', f"removed {_layer_text(*x[1:])} layer{on(x[0])}"] for x in gone if x[0] in gb]
    out += [['layer', f"added {_layer_text(*x[1:])} layer{on(x[0])}"] for x in new if x[0] in ga]
    ta, tb = set(stock['textures']), set(pack['textures'])
    if tb - ta:
        out.append(['texture', 'uses ' + ', '.join(sorted(tb - ta))])
    if ta - tb:
        out.append(['texture', 'no longer uses ' + ', '.join(sorted(ta - tb))])
    for k, word in (('particles', 'particle emitters'), ('ribbons', 'ribbon emitters'), ('lights', 'lights')):
        if stock[k] != pack[k]:
            out.append(['effects', f"{word} {stock[k]} → {pack[k]}"])
    if stock['bones'] != pack['bones']:
        out.append(['rig', f"bones {stock['bones']} → {pack['bones']}"])
    aa, ab = set(stock['attach']), set(pack['attach'])
    if aa != ab:
        out.append(['rig', 'attachments ' + '; '.join(x for x in (
            f'+{_ids(sorted(ab - aa))}' if ab - aa else '', f'−{_ids(sorted(aa - ab))}' if aa - ab else '') if x)])
    sa, sb = set(stock['anims']), set(pack['anims'])
    if sa != sb:
        fmt = lambda xs: _ids(f'{i}' if v == 0 else f'{i}.{v}' for i, v in sorted(xs))
        out.append(['anims', 'animations ' + '; '.join(x for x in (
            f'+{len(sb - sa)} ({fmt(sb - sa)})' if sb - sa else '', f'−{len(sa - sb)} ({fmt(sa - sb)})' if sa - sb else '') if x)])
    h1, h2 = stock['height'], pack['height']
    if h1 > 0 and abs(h2 - h1) / h1 > 0.03:
        out.append(['size', f"height {h1:g} → {h2:g} yd"])
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
        return cache.get(f'unique2|{files.get(sk, "")}|{st.st_size if st else 0}|{st.st_mtime_ns if st else 0}', f, fn)

    a, b = summ(stock_files), summ(pack_files)
    if a is None or b is None:
        return None
    return diff(a, b, lambda: (stock_files[path].read_bytes(), pack_files[path].read_bytes()))
