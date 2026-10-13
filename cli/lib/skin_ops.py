"""Edit ops for WotLK .skin files, replayed from model_transforms.json (I-392).

A .skin recipe key is the skin's parsed-assets path; the ops get the skin bytes plus
the bytes of the model it belongs to (vertex positions and bone weights live there).

  {"op": "skin.lod_rebase"}
      Retail LOD skins (01-03) store a global vertex offset at header 0x2C, the slot
      WotLK reads as boneCountMax. Add it to the vertex lookup and zero the slot, so a
      retail LOD skin can ship as a WotLK skin00.

  {"op": "skin.geoset.split", "group": 1, "parts": {"5": [6, 49], ...}, "majority": 0.75}
      Split every submesh of geoset group `group` into one submesh per part. A vertex
      belongs to the part listing the key bone its heaviest bone hangs under (walked up
      the parent chain to the first bone with a key-bone id). Mesh islands (triangles
      joined through vertices welded by position) go whole to the part owning at least
      `majority` of their vertices; mixed islands are split per triangle. Part submesh
      id = part_group * 100 + the source variant (102 -> 502, 602, ...). Each part keeps
      the source submesh's vertex range and bone combo; its batches are copied per part.
      Optional "mixed": per source variant, what a mixed island does instead of a plain per-triangle
      split. A part number sends the whole island there (dragonspawn2 102/103/106/107: the sash and
      the straps over the shoulders ride on the shoulder bones; cut by bone they became fake pads).
      A map {"6": 1} still splits per triangle but moves those parts' triangles (105: the hood is
      welded to the helmet, collar and shoulders; only the helmet comes out of it).
      Optional "drop": {"105": [6, 7]}: a source variant's parts left out (105's circlets, the same
      pieces 604/704 already offer).

  {"op": "skin.import", "donor_model": ..., "donor_skin": ..., "at": 36539, "variant": 8,
   "parts": {"5": [6, 49], "6": [2, 0], "7": [3, 1]},
   "submeshes": [{"submesh": 2, "batch": {"material": 2, "texcombo": 4}}, ...]}
      Pieces of ANOTHER model on the same rig (dragonspawn2boss's pads and helm) as new geosets
      (part * 100 + variant), on the vertices and bone combos the model op m2.import_vertices
      wrote (same donor, submeshes and `at`; checked here). Each triangle goes to the part owning
      its vertices' key bones. Batch fields name this model's tables: material, texcombo, coord,
      weight, transform (the model ops m2.texture.add / m2.texlookup.set / m2.table.append add
      what the donor needs).

  {"op": "skin.uv_split", "parts": [{"name": "stem", "combo_add": 0, "boxes": [[u0, v0, u1, v1], ...]},
                                    ..., {"name": "flower", "combo_add": 2}]}
      Split every submesh into one submesh per part by TEXTURE REGION, so each part can sample its
      own creature skin slot (I-396 lasher: stem/roots, flower, beak on skins 1/2/3). Triangles are
      grouped into UV islands (joined through shared vertex indices); an island goes to the first
      part with a box containing its UV centroid (wrapped to 0..1), or to the first part with no
      boxes. Part submeshes keep the source's geoset id, vertex range and bone combo (they all
      show together); the source's batches are copied per part with textureComboIndex +=
      combo_add, so the model's texture lookup must hold each part's (skin, layer...) run at that
      offset (m2.texlookup.set).

  {"op": "skin.overlay", "submesh": 2, "expect_id": 0,
   "variants": [{"id": 101}, {"id": 102, "batch": {"material": 4, "texcombo": 6}}, ...]}
      Selectable layers drawn over one submesh (I-396 lasher petal spots / stripes): each variant
      is a new submesh on the SAME index range (same vertices, so the same depth; a blended pass
      over it draws like a material layer) with one single-texture batch built from the fields
      given (material, texcombo, coord, weight, transform, priority, flags, shader). A variant
      without "batch" is an empty submesh: the "no layer" choice a display's
      creature_geoset_data can name. Variant ids should share one geoset group (101/102/103),
      so a display picks exactly one.

"""
import collections
import struct
from typing import Any, Dict, List, Tuple

_HDR = 0x30


def _arr(b: bytes, at: int) -> Tuple[int, int]:
    return struct.unpack_from('<II', b, at)


class _Skin:
    def __init__(self, data: bytes):
        if data[:4] != b'SKIN':
            raise ValueError('not a SKIN file')
        self.d = data
        n, o = _arr(data, 4)
        self.lookup = list(struct.unpack_from('<%dH' % n, data, o))
        n, o = _arr(data, 12)
        self.idx = list(struct.unpack_from('<%dH' % n, data, o))
        n, o = _arr(data, 20)
        self.props = data[o:o + 4 * n]
        n, o = _arr(data, 28)
        self.subs = [bytearray(data[o + 48 * j:o + 48 * j + 48]) for j in range(n)]
        n, o = _arr(data, 36)
        self.batches = [bytearray(data[o + 24 * j:o + 24 * j + 24]) for j in range(n)]
        self.x2c = struct.unpack_from('<I', data, 0x2C)[0]

    def sub(self, j: int) -> dict:
        f = struct.unpack_from('<10H', self.subs[j])
        return {'id': f[0], 'istart': f[4] | (f[1] << 16), 'icount': f[5]}

    def pack(self) -> bytes:
        if len(self.idx) > 0xFFFF + 1 or max(self.lookup, default=0) > 0xFFFF:
            raise ValueError('skin exceeds WotLK u16 limits')
        body = bytearray()

        def put(blob: bytes) -> int:
            off = _HDR + len(body)
            body.extend(blob)
            body.extend(b'\0' * (-len(body) % 16))
            return off
        oL = put(struct.pack('<%dH' % len(self.lookup), *self.lookup))
        oI = put(struct.pack('<%dH' % len(self.idx), *self.idx))
        oP = put(self.props)
        oS = put(b''.join(self.subs))
        oB = put(b''.join(self.batches))
        hdr = b'SKIN' + struct.pack('<10II', len(self.lookup), oL, len(self.idx), oI, len(self.props) // 4, oP,
                                    len(self.subs), oS, len(self.batches), oB, self.x2c)
        return hdr + bytes(body)


class _Model:
    """Just what the split needs from an MD20 v264 model: vertices and the bone tree."""
    def __init__(self, data: bytes):
        if data[:4] != b'MD20' or struct.unpack_from('<I', data, 4)[0] != 264:
            raise ValueError('model is not a WotLK MD20 v264')
        n, o = _arr(data, 0x3C)
        self.pos = [struct.unpack_from('<3f', data, o + 48 * i) for i in range(n)]
        self.dom = []
        for i in range(n):
            w = data[o + 48 * i + 12:o + 48 * i + 16]
            bi = data[o + 48 * i + 16:o + 48 * i + 20]
            self.dom.append(bi[max(range(4), key=lambda k: w[k])])
        n, o = _arr(data, 0x2C)
        self.key, self.parent = [], []
        for i in range(n):
            kb, _fl, par = struct.unpack_from('<iIh', data, o + 88 * i)
            self.key.append(kb)
            self.parent.append(par)

    def key_of(self, bone: int) -> int:
        for _ in range(len(self.key)):
            if bone < 0:
                return -1
            if self.key[bone] >= 0:
                return self.key[bone]
            bone = self.parent[bone]
        return -1


def _op_lod_rebase(sk: _Skin, model: bytes, cfg: Dict[str, Any]) -> str:
    off = sk.x2c
    if not off:
        return 'lod_rebase: offset already 0'
    sk.lookup = [v + off for v in sk.lookup]
    sk.x2c = 0
    return f'lod_rebase: vertex offset {off} baked into {len(sk.lookup)} lookups'


def _op_geoset_split(sk: _Skin, model: bytes, cfg: Dict[str, Any]) -> str:
    m = _Model(model)
    group = int(cfg['group'])
    owner = {}                                     # key-bone id -> part group
    for g, keys in cfg['parts'].items():
        for k in keys:
            owner[int(k)] = int(g)
    majority = float(cfg.get('majority', 0.75))
    mixed_to = {int(k): (int(g) if not isinstance(g, dict) else {int(a): int(b) for a, b in g.items()})
                for k, g in (cfg.get('mixed') or {}).items()}
    drop = {int(k): {int(g) for g in v} for k, v in (cfg.get('drop') or {}).items()}

    def vpart(v: int) -> int:
        k = m.key_of(m.dom[sk.lookup[v]])
        if k not in owner:
            raise ValueError(f'vertex {v}: key bone {k} is in no part')
        return owner[k]

    def islands(tris: List[tuple]) -> List[List[tuple]]:
        par: Dict[tuple, tuple] = {}

        def find(x):
            while par.setdefault(x, x) != x:
                par[x] = par[par[x]]
                x = par[x]
            return x
        weld = lambda v: tuple(round(c, 4) for c in m.pos[sk.lookup[v]])
        for t in tris:
            a = find(weld(t[0]))
            for v in t[1:]:
                par[find(weld(v))] = a
        out = collections.defaultdict(list)
        for t in tris:
            out[find(weld(t[0]))].append(t)
        return list(out.values())

    by_sub = collections.defaultdict(list)
    for b in sk.batches:
        by_sub[struct.unpack_from('<H', b, 4)[0]].append(b)
    subs, idx, batches, made = [], [], [], []

    def emit(raw: bytearray, gid: int, tris: List[tuple], src: int):
        f = list(struct.unpack_from('<10H', raw))
        start = len(idx)
        if start > 0xFFFF:
            raise ValueError('index start past 65535')
        f[0], f[1], f[4], f[5] = gid, 0, start, 3 * len(tris)
        for t in tris:
            idx.extend(t)
        nr = bytearray(raw)
        struct.pack_into('<10H', nr, 0, *f)
        subs.append(nr)
        for b in by_sub[src]:
            nb = bytearray(b)
            struct.pack_into('<H', nb, 4, len(subs) - 1)
            batches.append(nb)

    for j in range(len(sk.subs)):
        s = sk.sub(j)
        tris = [tuple(sk.idx[t:t + 3]) for t in range(s['istart'], s['istart'] + s['icount'], 3)]
        if s['id'] // 100 != group:
            emit(sk.subs[j], s['id'], tris, j)
            continue
        parts = collections.defaultdict(list)
        for isl in islands(tris):
            c = collections.Counter(vpart(v) for t in isl for v in t)
            top, n = c.most_common(1)[0]
            if n >= majority * sum(c.values()):
                parts[top] += isl
            elif isinstance(mixed_to.get(s['id']), int):
                parts[mixed_to[s['id']]] += isl
            else:
                remap = mixed_to.get(s['id']) or {}
                for t in isl:
                    g = collections.Counter(vpart(v) for v in t).most_common(1)[0][0]
                    parts[remap.get(g, g)].append(t)
        for g in drop.get(s['id'], ()):
            if parts.pop(g, None):
                made.append(f'{s["id"]}->{g * 100 + s["id"] % 100}:dropped')
        for g in sorted(parts):
            gid = g * 100 + s['id'] % 100
            emit(sk.subs[j], gid, parts[g], j)
            made.append(f'{s["id"]}->{gid}:{len(parts[g])}')
    sk.subs, sk.idx, sk.batches = subs, idx, batches
    return f'geoset.split group {group}: {len(made)} parts ({" ".join(made)})'


def _op_uv_split(sk: _Skin, model: bytes, cfg: Dict[str, Any]) -> str:
    parts = cfg['parts']
    default = [i for i, p in enumerate(parts) if not p.get('boxes')]
    if len(default) != 1:
        raise ValueError('skin.uv_split needs exactly one part without boxes (the default)')
    if model[:4] != b'MD20':
        raise ValueError('skin.uv_split: model is not an MD20')
    n, o = _arr(model, 0x3C)
    if max(sk.lookup, default=0) >= n:
        raise ValueError('skin.uv_split: skin indexes past the model\'s vertices (wrong model?)')
    uv = [struct.unpack_from('<2f', model, o + 48 * i + 32) for i in range(n)]

    def part_of(island: List[tuple]) -> int:
        pts = [uv[sk.lookup[v]] for t in island for v in t]
        cu = sum(p[0] for p in pts) / len(pts) % 1.0
        cv = sum(p[1] for p in pts) / len(pts) % 1.0
        for i, p in enumerate(parts):
            if any(b[0] <= cu < b[2] and b[1] <= cv < b[3] for b in p.get('boxes') or []):
                return i
        return default[0]

    by_sub = collections.defaultdict(list)
    for b in sk.batches:
        by_sub[struct.unpack_from('<H', b, 4)[0]].append(b)
    subs, idx, batches = [], [], []
    count = collections.Counter()
    for j in range(len(sk.subs)):
        s = sk.sub(j)
        tris = [tuple(sk.idx[t:t + 3]) for t in range(s['istart'], s['istart'] + s['icount'], 3)]
        par: Dict[int, int] = {}

        def find(x):
            while par.setdefault(x, x) != x:
                par[x] = par[par[x]]
                x = par[x]
            return x
        for t in tris:
            a = find(t[0])
            for v in t[1:]:
                par[find(v)] = a
        islands = collections.defaultdict(list)
        for t in tris:
            islands[find(t[0])].append(t)
        split = collections.defaultdict(list)
        for isl in islands.values():
            split[part_of(isl)] += isl
        for i in sorted(split):
            start = len(idx)
            if start > 0xFFFF:
                raise ValueError('index start past 65535')
            f = list(struct.unpack_from('<10H', sk.subs[j]))
            f[1], f[4], f[5] = 0, start, 3 * len(split[i])
            for t in split[i]:
                idx.extend(t)
            nr = bytearray(sk.subs[j])
            struct.pack_into('<10H', nr, 0, *f)
            subs.append(nr)
            for b in by_sub[j]:
                nb = bytearray(b)
                combo = struct.unpack_from('<H', nb, 16)[0] + int(parts[i].get('combo_add', 0))
                struct.pack_into('<H', nb, 4, len(subs) - 1)
                if struct.unpack_from('<H', b, 6)[0] == j:       # geosetIndex mirrors the submesh
                    struct.pack_into('<H', nb, 6, len(subs) - 1)
                struct.pack_into('<H', nb, 16, combo)
                batches.append(nb)
            count[parts[i].get('name', str(i))] += len(split[i])
    sk.subs, sk.idx, sk.batches = subs, idx, batches
    return 'uv_split: ' + ', '.join(f'{k} {v} tris' for k, v in count.items())


def _pivots(model: bytes) -> List[tuple]:
    n, o = _arr(model, 0x2C)
    return [struct.unpack_from('<3f', model, o + 88 * i + 76) for i in range(n)]


def bone_map(donor: bytes, model: bytes) -> List[int]:
    """donor bone -> model bone, for two models on one rig (dragonspawn2boss on dragonspawn2):
    the model bone with the same pivot and key-bone ancestor; a donor-only bone (the boss's pad
    flap bones) takes its nearest ancestor that has a twin, so its vertices ride rigidly."""
    dm, mm = _Model(donor), _Model(model)
    dp, mp = _pivots(donor), _pivots(model)
    twin = {}
    for b in range(len(dp)):
        c = [j for j in range(len(mp)) if sum((dp[b][i] - mp[j][i]) ** 2 for i in range(3)) < 1e-8
             and mm.key_of(j) == dm.key_of(b)]
        if c:
            twin[b] = min(c, key=lambda j: abs(j - b))
    out = []
    for b in range(len(dp)):
        a = b
        while a >= 0 and a not in twin:
            a = dm.parent[a]
        out.append(twin.get(a, 0))
    return out


def _import_plan(donor_skin: bytes, subs: List[int]):
    """The donor vertices the listed submeshes draw (sorted) and each submesh's (raw fields,
    props reach): shared by m2.import_vertices and skin.import so both lay things out alike."""
    sk = _Skin(donor_skin)
    verts, info = set(), []
    for j in subs:
        f = struct.unpack_from('<10H', sk.subs[j])
        vs, vc = f[2] | (f[1] << 16), f[3]
        verts |= {v + sk.x2c for v in sk.lookup[vs:vs + vc]}
        info.append((j, f, vs, vc, max(sk.props[4 * vs:4 * (vs + vc)]) + 1))
    return sk, sorted(verts), info


def import_vertices(data: bytearray, cfg: Dict[str, Any]) -> str:
    """MODEL op m2.import_vertices {"donor_model", "donor_skin", "submeshes": [2, 3], "at": 36539}:
    the donor vertices those submeshes draw, bones remapped (bone_map), written over this model's
    vertices from `at` on (vertices no skin of this one-view model draws: past its LOD skin's
    range; a skin lookup is u16, so they cannot go at the end), and each submesh's bone combo
    (as far as its props reach) remapped and appended to the bone lookup (0x78, moved to the end).
    patch_builder passes the donor files' bytes as cfg['_donor_model'] / cfg['_donor_skin']."""
    from lib.m2_ops import _relocate_array
    if bytes(data[:4]) != b'MD20' or struct.unpack_from('<I', data, 4)[0] != 264:
        raise ValueError('m2.import_vertices: model is not a WotLK MD20 v264')
    donor = cfg['_donor_model']
    bmap = bone_map(donor, bytes(data))
    sk, verts, info = _import_plan(cfg['_donor_skin'], [int(j) for j in cfg['submeshes']])
    at = int(cfg['at'])
    nv, ov = _arr(data, 0x3C)
    if at + len(verts) > min(nv, 0x10000):
        raise ValueError(f'm2.import_vertices: no room for {len(verts)} vertices at {at} ({nv} in the model)')
    dn, do = _arr(donor, 0x3C)
    out = bytearray()
    for v in verts:
        r = bytearray(donor[do + 48 * v:do + 48 * v + 48])
        r[16:20] = bytes(bmap[b] for b in r[16:20])
        out += r
    data[ov + 48 * at:ov + 48 * (at + len(verts))] = out
    dl, dlo = _arr(donor, 0x78)
    dlook = struct.unpack_from('<%dH' % dl, donor, dlo)
    nl, ol = _arr(data, 0x78)
    look = list(struct.unpack_from('<%dH' % nl, data, ol))
    for j, f, vs, vc, reach in info:
        look += [bmap[b] for b in dlook[f[7]:f[7] + reach]]
    _relocate_array(data, 0, 0x78, struct.pack('<%dH' % len(look), *look), len(look))
    flap = sorted({b for b in range(len(bmap)) if _pivots(donor)[b] != _pivots(bytes(data))[bmap[b]]} &
                  {b for j, f, vs, vc, r in info for b in dlook[f[7]:f[7] + r]})
    return (f"import_vertices: donor submeshes {cfg['submeshes']}: {len(verts)} vertices -> {at}..{at + len(verts) - 1}, "
            f"bone combos -> {nl}..{len(look) - 1}" + (f", donor-only bones {flap} ride their parents" if flap else ''))


_TABLES = {'materials': (0x70, '<HH'), 'texunit_lookup': (0x88, '<h')}


def table_append(data: bytearray, cfg: Dict[str, Any]) -> str:
    """MODEL op m2.table.append {"table": "materials" | "texunit_lookup", "values": [...],
    "expect_count": n}: entries added at the end of the table (it moves to the end of the file).
    materials values are [flags, blend] pairs."""
    from lib.m2_ops import _relocate_array
    at, fmt = _TABLES[cfg['table']]
    size = struct.calcsize(fmt)
    n, o = _arr(data, at)
    if 'expect_count' in cfg and n != int(cfg['expect_count']):
        raise ValueError(f"{cfg['table']} has {n} entries, expected {cfg['expect_count']} - refusing")
    blob = bytes(data[o:o + size * n]) + b''.join(
        struct.pack(fmt, *(v if isinstance(v, (list, tuple)) else [v])) for v in cfg['values'])
    _relocate_array(data, 0, at, blob, n + len(cfg['values']))
    return f"{cfg['table']}: {n} -> {n + len(cfg['values'])} entries"


def _op_import(sk: _Skin, model: bytes, cfg: Dict[str, Any]) -> str:
    """skin.import: see the module doc."""
    donor = cfg['_donor_model']
    dm = _Model(donor)
    bmap = bone_map(donor, model)
    items = cfg['submeshes']
    dsk, verts, info = _import_plan(cfg['_donor_skin'], [int(x['submesh']) for x in items])
    rank = {v: i for i, v in enumerate(verts)}
    at = int(cfg['at'])
    owner = {int(k): int(g) for g, keys in cfg['parts'].items() for k in keys}
    nl, ol = _arr(model, 0x78)
    look = struct.unpack_from('<%dH' % nl, model, ol)
    dl, dlo = _arr(donor, 0x78)
    dlook = struct.unpack_from('<%dH' % dl, donor, dlo)
    combo = nl - sum(r for *_, r in info)
    nv, ov = _arr(model, 0x3C)
    dn, do = _arr(donor, 0x3C)
    for v in verts[::max(1, len(verts) // 16)]:          # the model must carry m2.import_vertices
        if model[ov + 48 * (at + rank[v]):ov + 48 * (at + rank[v]) + 12] != donor[do + 48 * v:do + 48 * v + 12]:
            raise ValueError('skin.import: model vertices differ from the donor (the .M2 recipe needs m2.import_vertices)')
    made = []
    for item, (j, f, vs, vc, reach) in zip(items, info):
        if list(look[combo:combo + reach]) != [bmap[b] for b in dlook[f[7]:f[7] + reach]]:
            raise ValueError('skin.import: bone combo mismatch (the .M2 recipe needs m2.import_vertices)')
        nstart = len(sk.lookup)
        sk.lookup += [at + rank[v + dsk.x2c] for v in dsk.lookup[vs:vs + vc]]
        sk.props += dsk.props[4 * vs:4 * (vs + vc)]
        ds = dsk.sub(j)
        parts = collections.defaultdict(list)
        for t in range(ds['istart'], ds['istart'] + ds['icount'], 3):
            tri = dsk.idx[t:t + 3]
            g = collections.Counter(owner.get(dm.key_of(dm.dom[dsk.lookup[x] + dsk.x2c]), -1) for x in tri).most_common(1)[0][0]
            if g < 0:
                raise ValueError(f'skin.import: donor submesh {j} has a triangle on no part')
            parts[g] += [x - vs + nstart for x in tri]
        for g in sorted(parts):
            raw = bytearray(dsk.subs[j])
            fl = list(f)
            fl[0], fl[1], fl[2], fl[4], fl[5], fl[7], fl[9] = (g * 100 + int(cfg['variant']), 0, nstart, len(sk.idx),
                                                               len(parts[g]), combo, bmap[f[9]])
            struct.pack_into('<10H', raw, 0, *fl)
            sk.idx += parts[g]
            sk.subs.append(raw)
            b = item['batch']
            si = len(sk.subs) - 1
            sk.batches.append(bytearray(struct.pack('<BbHHHhHHHHHHH', int(b.get('flags', 16)), 0, int(b.get('shader', 32769)),
                                                    si, si, -1, int(b['material']), 0, int(b.get('textures', 2)),
                                                    int(b['texcombo']), int(b.get('coord', 0)), int(b.get('weight', 0)),
                                                    int(b.get('transform', 0)))))
            made.append(f'{j}->{g * 100 + int(cfg["variant"])}:{len(parts[g]) // 3}')
        combo += reach
    return f'import: {" ".join(made)}'


def _op_overlay(sk: _Skin, model: bytes, cfg: Dict[str, Any]) -> str:
    """skin.overlay: see the module doc."""
    j = int(cfg['submesh'])
    if j >= len(sk.subs):
        raise ValueError(f'skin.overlay: submesh {j} but the skin has {len(sk.subs)}')
    src = sk.sub(j)
    if 'expect_id' in cfg and src['id'] != int(cfg['expect_id']):
        raise ValueError(f'skin.overlay: submesh {j} is geoset {src["id"]}, expected {cfg["expect_id"]} - refusing')
    made = []
    for v in cfg['variants']:
        f = list(struct.unpack_from('<10H', sk.subs[j]))
        f[0] = int(v['id'])
        b = v.get('batch')
        if not b:                                            # the empty "no layer" choice
            f[3], f[1], f[4], f[5] = 0, 0, len(sk.idx) & 0xFFFF, 0
        raw = bytearray(sk.subs[j])
        struct.pack_into('<10H', raw, 0, *f)
        sk.subs.append(raw)
        si = len(sk.subs) - 1
        if b:
            sk.batches.append(bytearray(struct.pack(
                '<BbHHHhHHHHHHH', int(b.get('flags', 16)), int(b.get('priority', 0)), int(b.get('shader', 0)),
                si, si, -1, int(b['material']), 0, 1, int(b['texcombo']), int(b.get('coord', 0)),
                int(b.get('weight', 0)), int(b.get('transform', 0)))))
        made.append(f'{v["id"]}' + (f' (material {b["material"]}, combo {b["texcombo"]})' if b else ' (empty)'))
    return f'overlay on submesh {j}: ' + ', '.join(made)


OPS = {
    'skin.overlay': _op_overlay,
    'skin.lod_rebase': _op_lod_rebase,
    'skin.geoset.split': _op_geoset_split,
    'skin.uv_split': _op_uv_split,
    'skin.import': _op_import,
}


def apply_ops_bytes(skin: bytes, model: bytes, ops: List[Dict[str, Any]]) -> Tuple[bytes, List[str]]:
    sk = _Skin(skin)
    log = []
    for cfg in ops:
        fn = OPS.get(cfg.get('op'))
        if fn is None:
            raise ValueError(f'unknown skin op {cfg.get("op")!r} (known: {", ".join(OPS)})')
        log.append(fn(sk, model, cfg))
    return sk.pack(), log
