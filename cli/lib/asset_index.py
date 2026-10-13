"""F-216 layered asset selection: the asset index every viewer reads.

Layers: 1. 3D asset (mesh)  ->  2. 2D asset (texture)  ->  3. customisation (per display).

  mesh asset    an .m2 (+ its .skin views and .anim files) or a WMO root (+ its groups),
                keyed by its normalised path. Options = the DISTINCT contents across
                stock and every source; sources shipping byte-identical files share one
                option, and a source identical to stock is part of the Stock option.
  texture       a .blp path. Options = distinct contents, with size and BLP metadata;
                the default pick is the largest file among the COMPATIBLE options.
  links         texture <-> assets that reference it: M2 texture names, display skins
                (CreatureDisplayInfo), CharSections skins, NPC bakes (via
                CreatureDisplayInfoExtra), item textures (ItemDisplayInfo), WMO MOTX.

Compatibility (a texture is painted for one mesh's UV layout): texture option T from
source S fits mesh option M when S serves M itself (S is one of M's sources), or when S
ships no mesh of its own for that asset AND none of M's sources ships its own copy of the
texture (M relies on an outside texture, so a stock-layout retexture fits it). Stock
textures count as such a retexture. Anything else is shown but never auto-picked.
"""
import hashlib
import os
import pickle
import re
import struct
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set, Tuple

from lib import model_sources as ms

HASH_CACHE = Path('/workspace/project/logs/asset_hash_cache.pkl')
_WMO_GROUP = re.compile(r'_\d{3}\.wmo$')


# --------------------------------------------------------------------------
# content hashing (cached by path + size + mtime)
# --------------------------------------------------------------------------

class Hasher:
    def __init__(self, path: Path = HASH_CACHE):
        self.path = path
        self.data: Dict[str, Tuple[int, int, str]] = {}
        if path.exists():
            try:
                self.data = pickle.loads(path.read_bytes())
            except Exception:
                self.data = {}
        self.dirty = False

    def __call__(self, f: Path) -> str:
        k = str(f)
        size, mtime = stat_of(f)
        hit = self.data.get(k)
        if hit and hit[0] == size and hit[1] == mtime:
            return hit[2]
        h = hashlib.sha1()
        with f.open('rb') as fh:
            for chunk in iter(lambda: fh.read(1 << 20), b''):
                h.update(chunk)
        self.data[k] = (size, mtime, h.hexdigest())
        self.dirty = True
        return self.data[k][2]

    def save(self):
        if self.dirty:
            self.path.parent.mkdir(parents=True, exist_ok=True)
            tmp = self.path.with_suffix('.tmp')
            tmp.write_bytes(pickle.dumps(self.data))
            tmp.replace(self.path)
            self.dirty = False


def stat_of(f: Path) -> Tuple[int, int]:
    """(size, mtime) from the file listing when it saw the file, else a stat."""
    hit = ms.FILE_STAT.get(str(f))
    if hit:
        return hit
    st = f.stat()
    return st.st_size, int(st.st_mtime)


def _thumb(f: Path):
    """24x24 RGB thumbnail of a BLP as a flat list (None if it can't be decoded). Decodes only the
    smallest mip level still >= 24 px (a 2048 world texture's full mip 0 in PIL's pure-Python DXT
    decoder took seconds - the F-216 texture dedupe sat on it for half an hour)."""
    try:
        from PIL import Image
        img = _small_mip(f)
        if img is None:
            img = Image.open(f).convert('RGB')
        return list(img.resize((24, 24), Image.BILINEAR).tobytes())
    except Exception:
        return None


def _small_mip(f: Path):
    """A BLP2's smallest mip >= 24 px as a PIL RGB image, or None (BLP1 / no mips: caller falls back)."""
    import struct
    import numpy as np
    from PIL import Image
    b = Path(f).read_bytes()
    if b[:4] != b'BLP2' or len(b) < 148:
        return None
    comp, adepth, atype, mips = b[8], b[9], b[10], b[11]
    w, h = struct.unpack_from('<II', b, 12)
    offs = struct.unpack_from('<16I', b, 20)
    sizes = struct.unpack_from('<16I', b, 84)
    lvl = 0
    while mips and lvl + 1 < 16 and offs[lvl + 1] and sizes[lvl + 1] and min(w >> (lvl + 1), h >> (lvl + 1)) >= 24:
        lvl += 1
    mw, mh = max(1, w >> lvl), max(1, h >> lvl)
    data = b[offs[lvl]:offs[lvl] + sizes[lvl]]
    if comp == 1:
        pal = np.frombuffer(b[148:148 + 1024], np.uint8).reshape(256, 4)
        idx = np.frombuffer(data[:mw * mh], np.uint8)
        if idx.size < mw * mh:
            return None
        return Image.fromarray(pal[idx][:, [2, 1, 0]].reshape(mh, mw, 3).copy())
    if comp == 3:
        a = np.frombuffer(data[:mw * mh * 4], np.uint8)
        if a.size < mw * mh * 4:
            return None
        return Image.fromarray(a.reshape(mh, mw, 4)[:, :, [2, 1, 0]].copy())
    if comp != 2:
        return None
    # DXT1 (alpha type 0) / DXT3 (1) / DXT5 (7): colour block is the last 8 bytes of each block
    bpb = 8 if atype == 0 else 16
    bw, bh = max(1, (mw + 3) // 4), max(1, (mh + 3) // 4)
    blk = np.frombuffer(data[:bw * bh * bpb], np.uint8)
    if blk.size < bw * bh * bpb:
        return None
    blk = blk.reshape(bw * bh, bpb)[:, bpb - 8:]
    c = blk[:, :4].copy().view('<u2').astype(np.int32)
    bits = blk[:, 4:].copy().view('<u4')[:, 0]
    def rgb(v):
        return np.stack([((v >> 11) & 31) * 255 // 31, ((v >> 5) & 63) * 255 // 63, (v & 31) * 255 // 31], -1)
    c0, c1 = rgb(c[:, 0]), rgb(c[:, 1])
    four = (c[:, 0] > c[:, 1]) | (atype != 0)
    p2 = np.where(four[:, None], (2 * c0 + c1) // 3, (c0 + c1) // 2)
    p3 = np.where(four[:, None], (c0 + 2 * c1) // 3, 0)
    pal = np.stack([c0, c1, p2, p3], 1)                                    # (n, 4, 3)
    ix = (bits[:, None] >> (2 * np.arange(16, dtype=np.uint32))) & 3       # (n, 16)
    px = np.take_along_axis(pal, ix[:, :, None].astype(np.int64).repeat(3, 2), 1)   # (n, 16, 3)
    img = px.reshape(bh, bw, 4, 4, 3).transpose(0, 2, 1, 3, 4).reshape(bh * 4, bw * 4, 3)[:mh, :mw]
    return Image.fromarray(img.astype(np.uint8))


def _corr(a, b) -> float:
    import numpy as np
    x, y = np.asarray(a, float), np.asarray(b, float)
    x -= x.mean(); y -= y.mean()
    d = float(np.sqrt((x * x).sum() * (y * y).sum()))
    return float((x * y).sum() / d) if d else 0.0


INDEX_VERSION = 2      # bump when how options are built changes (2: same-look options merged, lib/m2_unique)


class MetaCache:
    """Per-file derived data (M2 texture names, BLP header) cached on (size, mtime)."""

    def __init__(self, path: Path = Path('/workspace/project/logs/asset_meta_cache.pkl')):
        self.path = path
        try:
            self.data = pickle.loads(path.read_bytes()) if path.exists() else {}
        except Exception:
            self.data = {}
        self.dirty = False

    def get(self, kind: str, f: Path, fn):
        k = (kind, str(f))
        size, mtime = stat_of(f)
        hit = self.data.get(k)
        if hit and hit[0] == size and hit[1] == mtime:
            return hit[2]
        v = fn(f)
        self.data[k] = (size, mtime, v)
        self.dirty = True
        return v

    def save(self):
        if self.dirty:
            tmp = self.path.with_suffix('.tmp')
            tmp.write_bytes(pickle.dumps(self.data))
            tmp.replace(self.path)
            self.dirty = False


# --------------------------------------------------------------------------
# small format readers
# --------------------------------------------------------------------------

def blp_info(f: Path) -> dict:
    """Width, height, encoding, alpha depth, mip count of a BLP2."""
    with f.open('rb') as fh:
        h = fh.read(148)
    if len(h) < 148 or h[:4] != b'BLP2':
        return {'fmt': 'not-blp2'}
    enc, adepth, atype, has_mips = struct.unpack_from('<BBBB', h, 8)
    w, hgt = struct.unpack_from('<II', h, 12)
    offs = struct.unpack_from('<16I', h, 20)
    lens = struct.unpack_from('<16I', h, 84)
    fmt = {1: 'palette', 2: {0: 'DXT1', 1: 'DXT3', 7: 'DXT5'}.get(atype, f'DXT?{atype}'), 3: 'ARGB8888'}.get(enc, f'enc{enc}')
    if enc == 2 and atype == 0 and adepth:
        fmt = 'DXT1a'
    return {'w': w, 'h': hgt, 'fmt': fmt, 'alpha': adepth,
            'mips': sum(1 for o, l in zip(offs, lens) if o and l)}


def wmo_textures(f: Path) -> List[str]:
    """MOTX texture names of a WMO root."""
    data = f.read_bytes()
    o, out = 0, []
    while o + 8 <= len(data):
        cid, size = data[o:o + 4], struct.unpack_from('<I', data, o + 4)[0]
        if cid == b'XTOM':                               # 'MOTX', stored reversed
            for name in data[o + 8:o + 8 + size].split(b'\0'):
                if name:
                    out.append(ms.norm(name.decode('latin-1')))
            break
        o += 8 + size
    return out


def wmo_group_count(f: Path) -> int:
    data = f.read_bytes()
    o = 0
    while o + 8 <= len(data):
        cid, size = data[o:o + 4], struct.unpack_from('<I', data, o + 4)[0]
        if cid == b'DHOM':                               # 'MOHD'
            return struct.unpack_from('<I', data, o + 8 + 4)[0]
        o += 8 + size
    return 0


# --------------------------------------------------------------------------
# index structures
# --------------------------------------------------------------------------

@dataclass
class Option:
    key: str                          # content fingerprint of the option
    sources: List[str]                # 'stock' first when stock has this content
    files: Dict[str, Path]            # normalised path -> one file with this content
    size: int = 0
    meta: dict = field(default_factory=dict)


@dataclass
class Asset:
    kind: str                         # 'm2' | 'wmo' | 'blp'
    path: str
    options: List[Option] = field(default_factory=list)

    def option_of(self, source: str) -> Optional[Option]:
        return next((o for o in self.options if source in o.sources), None)


class AssetIndex:
    """Built from the model-sources scan result (its Source list) + the stock index."""

    def __init__(self, sources: List['ms.Source'], log=print):
        self.sources = [s for s in sources if s.name != 'zep-hd-curated']
        self.stock = ms._stock_asset_index or ms._build_stock_index()
        ms._stock_asset_index = self.stock
        self.hash = Hasher()
        self.meshes: Dict[str, Asset] = {}
        self.textures: Dict[str, Asset] = {}
        self.tex_refs: Dict[str, Set[Tuple[str, str]]] = {}     # texture -> {(kind, asset id)}
        self.asset_tex: Dict[Tuple[str, str], Set[str]] = {}     # (kind, asset id) -> {texture}
        self.retail: Dict[str, Path] = {}                       # Retail option files (lib/retail.py)
        self.log = log

    def _meta_cache(self) -> 'MetaCache':
        # loaded ONCE (dict.setdefault(k, MetaCache()) built - and unpickled - a new cache per call)
        if '_meta' not in self.__dict__:
            self._meta = MetaCache()
        return self._meta

    def __getstate__(self):
        d = dict(self.__dict__)
        for k in ('_stem_cache', '_meta', 'log', '_lls'):
            d.pop(k, None)                    # caches persist on their own; never in the index pickle
        return d

    # ---- per-source file lookup -------------------------------------------------
    def _src_files(self, name: str) -> Dict[str, Path]:
        if name == 'stock':
            return self.stock
        if name == 'retail':
            return self.retail
        return next((s.assets for s in self.sources if s.name == name), {})   # synthetic options ('live'): nothing

    def _source_names(self) -> List[str]:
        return ['stock'] + [s.name for s in self.sources]

    # ---- options ----------------------------------------------------------------
    def _options(self, files_per_source: Dict[str, Dict[str, Path]]) -> List[Option]:
        """files_per_source: source -> {path: file} for ONE asset. Group by content."""
        by_key: Dict[str, Option] = {}
        for src, files in files_per_source.items():
            if not files:
                continue
            parts = sorted(f'{p}={self.hash(f)}' for p, f in files.items())
            key = hashlib.sha1('\n'.join(parts).encode()).hexdigest()[:12]
            o = by_key.get(key)
            if o is None:
                o = by_key[key] = Option(key, [], dict(files), sum(f.stat().st_size for f in files.values()))
            o.sources.append(src)
        opts = list(by_key.values())
        for o in opts:
            o.sources.sort(key=lambda s: (s != 'stock', s))
        opts.sort(key=lambda o: (o.sources[0] != 'stock', o.sources[0]))
        return opts

    def _look(self, p: str, o: 'Option') -> Optional[str]:
        """An option's look: lib/m2_unique's components (the same parts the picker's "unique" tags name)
        and its .anim files' contents (LOD skins 01-03 do not count: the close-up look is what is picked)."""
        from lib import m2_unique as mu
        f, sk = o.files.get(p), o.files.get(p[:-3] + '00.skin')
        if f is None or sk is None:
            return None
        ss = stat_of(sk)
        render = self._meta_cache().get(f'look1|{sk}|{ss[0]}|{ss[1]}', f,
                                        lambda x: mu.look(x.read_bytes(), sk.read_bytes()))
        if render is None:
            return None
        anims = sorted((k, self.hash(v)) for k, v in o.files.items() if k.endswith('.anim'))
        return hashlib.sha1(repr((render, anims)).encode()).hexdigest()[:16]

    def _merge_same_look(self, p: str, opts: List['Option']) -> List['Option']:
        """Options whose files differ but draw the same (two packs' gilneas_vines_02.m2: other byte layout,
        a stored shader id the client ignores) are ONE option: the first's files (stock first), every
        source. The merged-away keys stay in meta['same_look'] so picks saved under them still resolve."""
        out: List[Option] = []
        seen: Dict[str, Option] = {}
        for o in opts:
            lk = self._look(p, o)
            m = seen.get(lk) if lk else None
            if m is None:
                if lk:
                    seen[lk] = o
                out.append(o)
                continue
            m.sources = sorted(set(m.sources) | set(o.sources), key=lambda s: (s != 'stock', s))
            m.meta.setdefault('same_look', []).append(o.key)
            self.__dict__['same_look_merged'] = self.__dict__.get('same_look_merged', 0) + 1
        return out

    def _mesh_files(self, src: str, m2: str) -> Dict[str, Path]:
        idx = self._src_files(src)
        f = idx.get(m2)
        if f is None:
            return {}
        out = {m2: f}
        stem = m2[:-3]
        for v in range(4):
            sk = idx.get(f'{stem}{v:02d}.skin')
            if sk is not None:
                out[f'{stem}{v:02d}.skin'] = sk
        for k in self._by_stem(src, 'anim').get(stem, ()):
            out[k] = idx[k]
        return out

    def _by_stem(self, src: str, kind: str) -> Dict[str, List[str]]:
        """Per source: model stem -> its .anim files / WMO root stem -> its group files, built once
        (scanning the whole index per mesh per source was most of the mesh-index time)."""
        cache = self.__dict__.setdefault('_stem_cache', {})
        if (src, kind) not in cache:
            out: Dict[str, List[str]] = {}
            for k in self._src_files(src):
                if kind == 'anim' and k.endswith('.anim') and len(k) > 12 and k[-12:-8].isdigit():
                    out.setdefault(k[:-12], []).append(k)
                elif kind == 'wmo' and _WMO_GROUP.search(k):
                    out.setdefault(k[:-8], []).append(k)
            cache[(src, kind)] = out
        return cache[(src, kind)]

    def _wmo_files(self, src: str, root: str) -> Dict[str, Path]:
        idx = self._src_files(src)
        f = idx.get(root)
        if f is None:
            return {}
        out = {root: f}
        for k in self._by_stem(src, 'wmo').get(root[:-4], ()):
            out[k] = idx[k]
        return out

    # ---- build ------------------------------------------------------------------
    def build_meshes(self, paths: Optional[Iterable[str]] = None):
        """Mesh assets any source replaces (paths given, or every .m2/.wmo a source ships)."""
        if paths is None:
            paths = set()
            for s in self.sources:
                paths.update(p for p in s.assets if p.endswith('.m2') or (p.endswith('.wmo') and not _WMO_GROUP.search(p)))
        anim_cache: Dict[str, Dict[str, List[str]]] = {}
        for i, p in enumerate(sorted(paths)):
            per = {}
            for src in self._source_names():
                per[src] = self._mesh_files(src, p) if p.endswith('.m2') else self._wmo_files(src, p)
            opts = self._options(per)
            if p.endswith('.m2') and len(opts) > 1:
                opts = self._merge_same_look(p, opts)
            if opts:
                kind = 'm2' if p.endswith('.m2') else 'wmo'
                a = self.meshes[p] = Asset(kind, p, opts)
                for o in opts:
                    root = o.files.get(p)
                    if root is None:
                        continue
                    o.meta['version'] = int.from_bytes(root.read_bytes()[4:8], 'little') if kind == 'm2' else None
                    for t in self._textures_named_in(kind, root):
                        self._link(t, ('mesh', p))
            if i % 2000 == 1999:
                self.log(f'    meshes {i + 1:,} ...')
                self.hash.save()
        self.hash.save()
        self._meta_cache().save()

    def _textures_named_in(self, kind: str, f: Path) -> List[str]:
        meta = self._meta_cache()
        return meta.get('tex-' + kind, f, lambda x: self._textures_named_raw(kind, x))

    def _textures_named_raw(self, kind: str, f: Path) -> List[str]:
        if kind == 'wmo':
            return wmo_textures(f)
        try:
            info = ms.decode_m2(f)
        except Exception:
            return []
        if info.error:
            return []
        return [ms.norm(n) for t, n in info.textures if t == 0 and n]

    def _link(self, tex: str, asset: Tuple[str, str]):
        self.tex_refs.setdefault(tex, set()).add(asset)
        self.asset_tex.setdefault(asset, set()).add(tex)

    def link_dbc(self, result: dict):
        """Display skins, NPC bakes and CharSections skins -> the meshes they paint."""
        srcs = {s.name: s for s in self.sources}
        layers = [('stock', result['stock_dbc'][0], result['stock_dbc'][1], *result['stock_char_dbc'])] + \
                 [(s.name, s.cdi, s.cmd, s.cdx, s.chs) for s in self.sources if s.cdi]
        for name, cdi, cmd, cdx, chs in layers:
            for did, row in cdi.items():
                mrow = cmd.get(int(row.get('model_id') or 0))
                if not mrow:
                    continue
                mp = ms.norm(str(mrow.get('model_path') or ''))
                if not mp.endswith('.m2'):
                    continue
                mdir = mp.rsplit('/', 1)[0]
                for k in ms.CDI_TEX_FIELDS:
                    if row.get(k):
                        self._link(f'{mdir}/{str(row[k]).lower()}.blp', ('mesh', mp))
                ext = int(row.get('extended_display_info_id') or 0)
                x = cdx.get(ext) if ext else None
                if x and x.get('texture'):
                    self._link('textures/bakednpctextures/' + str(x['texture']).lower(), ('mesh', mp))
            # CharSections: race/sex skins -> that race's character model
            for r in chs.values():
                for k in ('texture_1', 'texture_2', 'texture_3'):
                    if r.get(k):
                        self._link(ms.norm(str(r[k])), ('race', f"{r.get('race')}/{r.get('gender')}"))

    def link_items(self, items: Dict[str, dict]):
        for gid, d in items.items():
            for t in d.get('item_tex') or []:
                for m in d.get('members') or []:
                    self._link(t, ('mesh', m))

    def build_textures(self, paths: Optional[Iterable[str]] = None):
        """Texture assets: every linked texture plus every .blp a source ships."""
        if paths is None:
            paths = set(self.tex_refs)
            for s in self.sources:
                paths.update(p for p in s.assets if p.endswith('.blp'))
        for i, p in enumerate(sorted(paths)):
            per = {src: ({p: f} if (f := self._src_files(src).get(p)) is not None else {})
                   for src in self._source_names()}
            opts = self._options(per)
            if not opts:
                continue
            meta = self._meta_cache()
            for o in opts:
                o.meta.update(meta.get('blp', o.files[p], blp_info))
            self.textures[p] = Asset('blp', p, opts)
            if i % 5000 == 4999:
                self.log(f'    textures {i + 1:,} ...')
                self.hash.save()
        self.hash.save()
        self._meta_cache().save()

    def add_retail(self, paths: Iterable[str], log=print, fdids: Optional[Dict[str, int]] = None) -> int:
        """Add a Retail option (the modern model, converted the WXL way) to each mesh
        asset that has one in retail. Creature/object models only (see lib/retail.py)."""
        from lib import retail
        from concurrent.futures import ThreadPoolExecutor
        fdids = fdids or {}
        # the Retail option is the REMASTER (a different retail file), never the same file again
        todo = [p for p in sorted(paths) if p.endswith('.m2') and not p.startswith(('character/', 'item/')) and fdids.get(p)]
        retail.listfile()
        retail.build()
        # downloads are network-bound (~2 s each): fetch several models at once
        with ThreadPoolExecutor(max_workers=6) as pool:
            converted = list(pool.map(lambda q: (q, retail.convert(q, log=log, fdid=fdids[q])), todo))
        n = 0
        for i, (p, files) in enumerate(converted):
            if not files or p not in files:
                continue
            self.retail.update(files)
            a = self.meshes.setdefault(p, Asset('m2', p, []))
            a.options = [o for o in a.options if 'retail' not in o.sources]
            mesh_files = {k: v for k, v in files.items() if not k.endswith('.blp')}
            parts = sorted(f'{k}={self.hash(v)}' for k, v in mesh_files.items())
            key = 'r' + hashlib.sha1('\n'.join(parts).encode()).hexdigest()[:11]
            o = Option(key, ['retail'], mesh_files, sum(f.stat().st_size for f in mesh_files.values()), {'version': 264, 'retail': True})
            a.options.append(o)
            for t in files:
                if t.endswith('.blp'):
                    self._link(t, ('mesh', p))
                    ta = self.textures.setdefault(t, Asset('blp', t, []))
                    if not any('retail' in x.sources for x in ta.options):
                        ta.options.append(Option('r' + self.hash(files[t])[:11], ['retail'], {t: files[t]},
                                                 files[t].stat().st_size, blp_info(files[t])))
            n += 1
            if i % 100 == 99:
                log(f'    retail {i + 1:,} ...')
                self.hash.save()
        self.hash.save()
        return n

    # ---- layer 2: compatibility + default ------------------------------------------
    def ships_mesh(self, source: str, mesh: str) -> bool:
        return mesh in self._src_files(source)

    def pack_refs(self, result: dict) -> None:
        """(source, creature skin path) for every skin a source's OWN display rows name. A pack that
        ships display rows but a skin none of them uses ships an orphan (patch-hd-creatures-mounts'
        creature/dragon/dragonskin1green.blp, painted for another dragon): not an upscale of stock."""
        stock_cmd = result['stock_dbc'][1]
        refs = set()
        for s in self.sources:
            if not s.cdi:
                continue
            for row in s.cdi.values():
                mrow = s.cmd.get(int(row.get('model_id') or 0)) or stock_cmd.get(int(row.get('model_id') or 0))
                if not mrow:
                    continue
                mdir = ms.norm(str(mrow.get('model_path') or '')).rsplit('/', 1)[0]
                for k in ms.CDI_TEX_FIELDS:
                    if row.get(k):
                        refs.add((s.name, f'{mdir}/{str(row[k]).lower()}.blp'))
        # only stock DISPLAY skins can be orphaned this way (hardcoded mesh textures are upscaled freely)
        skins = set()
        for row in result['stock_dbc'][0].values():
            mrow = stock_cmd.get(int(row.get('model_id') or 0))
            if mrow:
                mdir = ms.norm(str(mrow.get('model_path') or '')).rsplit('/', 1)[0]
                skins |= {f'{mdir}/{str(row[k]).lower()}.blp' for k in ms.CDI_TEX_FIELDS if row.get(k)}
        self._pack_refs = refs
        self._stock_skins = skins
        self._pack_has_cdi = {s.name for s in self.sources if s.cdi}

    def _looks_like_stock(self, tex: str, topt: Option) -> bool:
        """Is this texture option an upscale of the stock one (same layout)? 24x24 thumbnails,
        correlation >= 0.5: real upscales score ~1.0, skins painted for another mesh < 0.3."""
        memo = self.__dict__.setdefault('_lls', {})
        k = (tex, topt.key)
        if k not in memo:
            st = self.stock.get(tex)
            f = topt.files.get(tex)
            a, b = (self._meta_cache().get('thumb24', x, _thumb) if x else None for x in (f, st))
            memo[k] = True if a is None or b is None else _corr(a, b) >= 0.5
        return memo[k]

    def compatible(self, tex: str, topt: Option, mesh: str, mopt: Option) -> bool:
        """Is texture option topt painted for mesh option mopt's UV layout?"""
        if set(topt.sources) & set(mopt.sources):
            return True                                   # the same source serves both
        refs = getattr(self, '_pack_refs', None)
        if refs is not None and tex in self._stock_skins and all(
                s in self._pack_has_cdi and (s, tex) not in refs for s in topt.sources if s != 'stock') \
                and any(s != 'stock' for s in topt.sources) and not self._looks_like_stock(tex, topt):
            return False                                  # an orphan skin painted for another mesh
        # Painted for the pack's OWN mesh if that pack ships a mesh for ANY model using this texture -
        # sibling race variants included (I-114: Appletrey's priest-helm texture on another pack's
        # Draenei helm, a variant he no longer ships, renders as teal corruption).
        users = [m for k, m in self.tex_refs.get(tex, set()) if k == 'mesh'] or [mesh]
        own_mesh = any(s != 'stock' and any(self.ships_mesh(s, u) for u in users) for s in topt.sources)
        mesh_ships_tex = any(tex in self._src_files(s) for s in mopt.sources if s != 'stock')
        return not own_mesh and not mesh_ships_tex

    def default_texture(self, tex: str, mesh_choices: Dict[str, Option]) -> Tuple[Optional[Option], List[str]]:
        """Largest option compatible with every chosen mesh that uses this texture.
        -> (option, reasons it could not auto-pick)."""
        a = self.textures.get(tex)
        if a is None:
            return None, ['no options']
        meshes = [m for k, m in self.tex_refs.get(tex, set()) if k == 'mesh' and m in mesh_choices]
        if not meshes and any(k == 'race' for k, _ in self.tex_refs.get(tex, set())):
            # a race texture (CharSections: skins, fins, faces) paints the character model in its own
            # folder: the stock naga must not wear the HD packs' fins
            folder = tex.rsplit('/', 1)[0] + '/'
            meshes = [m for m in mesh_choices if m.startswith(folder) and m.endswith('.m2')]
        ok = [o for o in a.options if all(self.compatible(tex, o, m, mesh_choices[m]) for m in meshes)]
        if not ok:
            return None, [f'no option fits all of: {", ".join(sorted(meshes)[:4])}']
        return max(ok, key=lambda o: (o.size, o.sources[0] == 'stock')), []
