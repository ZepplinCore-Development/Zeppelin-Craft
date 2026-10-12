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


OPS = {
    'skin.lod_rebase': _op_lod_rebase,
    'skin.geoset.split': _op_geoset_split,
    'skin.uv_split': _op_uv_split,
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
