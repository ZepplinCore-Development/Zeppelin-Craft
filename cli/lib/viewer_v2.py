"""F-216 layered picker (v2) deploy: 3D asset tabs + the texture tab, served from a
content-addressed store.

  files/cas/<sha1-20><ext>   every staged file once, named by content
  data/maps/<id>.json        per pane: {normalised path | 'fdid/<n>': cas name}
  data/v2/assets.json        3D assets per tab, each option with its pane descriptor
  data/v2/textures.json      textures with >1 option: options + metadata + how to view
                             them on a model (a pane map + the key to swap)

Panes use the asset index (lib/asset_index.py) for every file: the pane's own mesh
option, everyone else's current mesh option, and each texture's current pick (explicit
choice, else the largest compatible option).
"""
import hashlib
import json
import os
import re
import shutil
from pathlib import Path
from typing import Callable, Dict, List, Optional, Tuple

from lib import asset_index as ai
from lib import model_sources as ms
from lib import model_viewer_deploy as mvd

TABS = ('creature', 'character', 'object', 'item', 'wmo')
# the picker reads data/v2 while a deploy runs: build data/v2.new, swap it in when done
STAGE = 'v2.new'
CHAR_PANE_VERSION = 2          # 2: each option wears the bake it ships with (bake_for), not the live DBC's
PANE_CODE_VERSION = 3          # bump when pane building changes: every cached pane is rebuilt (2: geoset 0 nibbles, I-388; 3: item textures follow their item mesh)
PANE_CACHE = Path('/workspace/project/logs/viewer_pane_cache.pkl')


def _empty_tex_tris(m2: bytes, skin: bytes) -> int:
    import struct
    try:
        if m2[:4] != b'MD20' or skin[:4] != b'SKIN':
            return 0
        n_t, o_t = struct.unpack_from('<II', m2, 0x50)
        empty = {i for i in range(n_t) if struct.unpack_from('<I', m2, o_t + 16 * i)[0] == 0
                 and struct.unpack_from('<I', m2, o_t + 16 * i + 8)[0] <= 1}
        if not empty:
            return 0
        n_l, o_l = struct.unpack_from('<II', m2, 0x80)
        lk = struct.unpack_from(f'<{n_l}h', m2, o_l) if n_l else ()
        n_s, o_s, n_b, o_b = struct.unpack_from('<4I', skin, 28)
        tris = 0
        for i in range(n_b):
            b = o_b + 24 * i
            sec, tc, combo = struct.unpack_from('<H', skin, b + 4)[0], struct.unpack_from('<H', skin, b + 14)[0], struct.unpack_from('<H', skin, b + 16)[0]
            if sec < n_s and any(combo + k < len(lk) and lk[combo + k] in empty for k in range(max(tc, 1))):
                tris += struct.unpack_from('<H', skin, o_s + 48 * sec + 10)[0] // 3
        return tris
    except struct.error:
        return 0


def tab_of(path: str) -> str:
    if path.endswith('.wmo'):
        return 'wmo'
    if path.startswith('character/'):
        return 'character'
    if path.startswith('creature/'):
        return 'creature'
    if path.startswith('item/'):
        return 'item'
    return 'object'


def label(sources: List[str]) -> str:
    return ' + '.join(sources)


class Store:
    """files/cas/: one copy of each file content. Plain copies, no links."""

    def __init__(self, out_root: Path, hasher: ai.Hasher):
        self.dir = out_root / 'files' / 'cas'
        self.dir.mkdir(parents=True, exist_ok=True)
        self.hash = hasher
        self.names: Dict[str, str] = {}
        import os
        self.have = set(os.listdir(self.dir))          # one listing; membership checked in memory

    def put(self, f: Path) -> str:
        k = str(f)
        if k in self.names:
            return self.names[k]
        name = self.hash(f)[:20] + f.suffix.lower()   # content-named: same name = same bytes
        if name not in self.have:
            shutil.copyfile(f, self.dir / name)
            self.have.add(name)
        self.names[k] = name
        return name

    def put_bytes(self, data: bytes, ext: str) -> str:
        name = hashlib.sha1(data).hexdigest()[:20] + ext
        if name not in self.have:
            (self.dir / name).write_bytes(data)
            self.have.add(name)
        return name


class Picks:
    """Current layer-1 / layer-2 picks: explicit v2 choices, migrated v1 mesh picks,
    else today's winner; textures: explicit, else largest compatible."""

    def __init__(self, ix: ai.AssetIndex, result: dict, choices: dict):
        self.ix, self.result = ix, result
        self.owner = result['effective_owner']
        # a model-level pick names its file option separately (file_option) when it also repoints displays
        self.mesh_choice = {p: c.get('file_option') or c['option'] for p, c in (choices.get('mesh') or {}).items()}
        self.tex_choice = {p: c['option'] for p, c in (choices.get('texture') or {}).items()}
        self._mesh_cache: Dict[str, ai.Option] = {}
        self._tex_cache: Dict[Tuple[str, tuple], Tuple[Optional[ai.Option], List[str]]] = {}

    def mesh(self, path: str) -> Optional[ai.Option]:
        if path in self._mesh_cache:
            return self._mesh_cache[path]
        a = self.ix.meshes.get(path)
        o = None
        if a:
            k = self.mesh_choice.get(path)
            o = next((x for x in a.options if x.key == k or (k == 'retail' and 'retail' in x.sources)
                      or k in (x.meta.get('same_look') or [])), None) if k else None
            o = o or a.option_of(self.owner.get(path, 'stock')) or a.option_of('stock') or a.options[0]
        self._mesh_cache[path] = o
        return o

    def texture(self, path: str, override: Dict[str, ai.Option]) -> Tuple[Optional[ai.Option], List[str]]:
        a = self.ix.textures.get(path)
        if a is None:
            return None, []
        k = self.tex_choice.get(path)
        if k:
            o = next((x for x in a.options if x.key == k), None)
            if o:
                return o, []
        meshes = sorted(m for kind, m in self.ix.tex_refs.get(path, set()) if kind == 'mesh')
        if not meshes and any(k == 'race' for k, _ in self.ix.tex_refs.get(path, set())):
            folder = path.rsplit('/', 1)[0] + '/'
            meshes = sorted(m for m in override if m.startswith(folder) and m.endswith('.m2'))
        ctx = tuple((m, override[m].key) for m in meshes if m in override)
        ck = (path, ctx)
        if ck not in self._tex_cache:
            chosen = {m: (override.get(m) or self.mesh(m)) for m in meshes}
            chosen = {m: o for m, o in chosen.items() if o is not None}
            self._tex_cache[ck] = self.ix.default_texture(path, chosen)
        return self._tex_cache[ck]


class Finder:
    """SourceFiles-compatible resolver for one pane: the pane's own mesh option(s),
    everything else from the current picks; stock / live build for what the index
    does not cover."""

    def __init__(self, picks: Picks, override: Dict[str, ai.Option], stock_only: bool = False):
        self.picks, self.override, self.stock_only = picks, override, stock_only
        self.eff = picks.result['effective_assets']
        self.log: Optional[list] = None
        self.conflicts: set = set()       # shared textures no single option fits for every user
        self.item_tex: Dict[str, str] = {}    # an attached item's texture -> its item mesh (set per pane)

    def _mesh_of(self, p: str) -> Optional[str]:
        if p.endswith('.m2') or (p.endswith('.wmo') and not ai._WMO_GROUP.search(p)):
            return p
        if p.endswith('.skin'):
            return p[:-7] + '.m2'
        if p.endswith('.anim'):
            return p[:-12] + '.m2'
        if p.endswith('.wmo'):
            return ai._WMO_GROUP.sub('.wmo', p)
        return None

    def _resolve(self, p: str) -> Optional[Path]:
        if self.stock_only:
            return ms.stock_asset(p)        # the untouched original (Customise's stock reference)
        if p in self.item_tex:
            # an attached item (shoulder, helm, weapon) wears a texture painted for ITS mesh as resolved
            # here: Appletrey's remodelled rshoulder_leather_horde_b_03 with the stock-layout texture drew
            # stretched. Same source as the mesh first, then any layout-compatible option, largest first.
            m = self.item_tex[p]
            ix = self.picks.ix
            mo = self.override.get(m) or (self.picks.mesh(m) if m in ix.meshes else None)
            a = ix.textures.get(p)
            if mo is not None and a is not None:
                same = [x for x in a.options if set(x.sources) & set(mo.sources)]
                ok = same or [x for x in a.options if ix.compatible(p, x, m, mo)]
                if ok:
                    return max(ok, key=lambda x: (x.size, x.sources[0] == 'stock')).files.get(p)
        if p.endswith('.blp') and self.override:
            # a model card shows what ITS option ships: the textures of that option's own packs, else
            # stock - never the Textures layer's picks (an HD pack's in-place skin, painted for its own
            # mesh, scrambled the stock ancient of lore)
            mine = [x for o_ in self.override.values() for x in o_.sources if x not in ('stock', 'retail')]
            for src in mine:
                f = self.picks.ix._src_files(src).get(p)
                if f is not None:
                    return f
            f = ms.stock_asset(p)
            if f is not None:
                return f
        if p.endswith('.blp'):
            o, _ = self.picks.texture(p, self.override)
            if o is None and self.override:
                # no option fits every mesh sharing this texture (an HD gryphon skin on the stock
                # rider): draw THIS option with the one that fits it, and say so (pane conflicts)
                ix = self.picks.ix
                a = ix.textures.get(p)
                mine = [m for k, m in ix.tex_refs.get(p, ()) if k == 'mesh' and m in self.override]
                ok = [x for x in (a.options if a else []) if mine and
                      all(ix.compatible(p, x, m, self.override[m]) for m in mine)]
                if ok:
                    o = max(ok, key=lambda x: (x.size, x.sources[0] == 'stock'))
                    self.conflicts.add(p)
            if o is not None:
                return o.files.get(p)
        else:
            m = self._mesh_of(p)
            if m and m in self.picks.ix.meshes:
                o = self.override.get(m) or self.picks.mesh(m)
                return o.files.get(p) if o else None
        return self.eff.get(p) or ms.stock_asset(p)

    def find(self, p: str) -> Optional[Path]:
        f = self._resolve(p)
        if self.log is not None:
            self.log.append((p, f))
        return f

    def anims(self, stem: str) -> Dict[str, Path]:
        m = stem + '.m2'
        o = self.override.get(m) or self.picks.mesh(m)
        out = {k: v for k, v in (o.files.items() if o else []) if k.endswith('.anim')}
        if self.log is not None:
            self.log += list(out.items())
        return out


class Deployer:
    def __init__(self, result: dict, ix: ai.AssetIndex, out_root: Path, choices: dict,
                 names: Dict, equipment: Dict, log: Callable = print):
        self.result, self.ix, self.out = result, ix, out_root
        self.store = Store(out_root, ix.hash)
        self.picks = Picks(ix, result, choices)
        self.names, self.equipment, self.log = names, equipment, log
        self.maps_dir = out_root / 'data' / 'maps'
        self.maps_dir.mkdir(parents=True, exist_ok=True)   # kept between runs; stale maps pruned at the end
        import pickle
        try:
            self.cache = pickle.loads(PANE_CACHE.read_bytes()) if PANE_CACHE.exists() else {}
        except Exception:
            self.cache = {}
        self.used: Dict[str, dict] = {}
        self.reused = 0
        v2dir = out_root / 'data' / STAGE          # built aside, swapped in at the end (swap_v2)
        if v2dir.is_dir():
            shutil.rmtree(v2dir)                      # cleared up front: panes write their provenance into it
        (v2dir / 'tex').mkdir(parents=True)
        # content-named by pane key like data/maps (same key = same provenance): persistent, written once,
        # not ~52k files rewritten into every staged data/v2.new and deleted again at the swap
        self.prov_dir = out_root / 'data' / 'prov'
        self.n_maps = 0
        self.maps: Dict[str, Dict[str, str]] = {}
        self._displays_of = None

    # ---- context: which display shows a model --------------------------------------
    def displays_of(self, path: str) -> List[int]:
        """Displays whose live (effective) model is this path, most used first."""
        if self._displays_of is None:
            cdi, cmd = self.result['effective_dbc']
            by: Dict[str, List[int]] = {}
            for did, row in cdi.items():
                mrow = cmd.get(int(row.get('model_id') or 0))
                if mrow:
                    by.setdefault(ms.norm(str(mrow.get('model_path') or '')), []).append(did)
            for v in by.values():
                v.sort(key=lambda d: (-len(self.names.get(d, [])), d))
            self._displays_of = by
        return self._displays_of.get(path, [])

    # ---- one pane ------------------------------------------------------------------
    def pane(self, path: str, opt: ai.Option, did: Optional[int] = None,
             tex_override: Optional[Dict[str, ai.Option]] = None, dbc_source: Optional[str] = None,
             skins: Optional[tuple] = None, row_over: Optional[dict] = None,
             stock_only: bool = False) -> Optional[dict]:
        """Cached: rebuilt only when re-resolving a path it used gives a different file (a new
        pick, a pack update, a new source) - checked in memory, no file I/O."""
        import copy
        base = (PANE_CODE_VERSION, path, opt.key, did, dbc_source, sorted(opt.sources),
                CHAR_PANE_VERSION if path.startswith('character/') else 0)
        own = self.own_skins(did, opt, dbc_source, path)    # only the panes it changes get a new key
        if row_over:
            own = (own or ()) + (('row', tuple(sorted((k, str(v)) for k, v in row_over.items()))),)
        if dbc_source is None and did is not None:
            live_ = self.result['effective_dbc'][0].get(did) or {}
            ocgd = self.own_cgd(did, opt, path, live_)
            if ocgd is not None and ocgd != int(live_.get('creature_geoset_data') or 0):
                own = (own or ()) + (('cgd', ocgd),)
        if did is not None and path.endswith('.m2') and opt.files.get(path[:-3] + '00.skin') is not None:
            cdi_k = self._srcs()[dbc_source].cdi if dbc_source in self._srcs() else \
                self.result['stock_dbc'][0] if dbc_source == 'stock' else self.result['effective_dbc'][0]
            cg_ = int((cdi_k.get(did) or {}).get('creature_geoset_data') or 0)
            for x_ in own or ():
                if isinstance(x_, tuple) and x_[:1] == ('cgd',):
                    cg_ = x_[1]
            if cg_:
                from lib import geoset_fix as gf
                fx_ = gf.fixed(cg_, self._geosets_of(opt.files[path[:-3] + '00.skin']))
                if fx_ is not None:
                    own = (own or ()) + (('gfix', fx_),)
        from lib import hd_curate_fixes as hcf
        if hcf.key(path) and opt.sources != ['stock']:
            base = base + (('fix', hcf.key(path)),)
        if skins:
            own = skins                                       # guessed from the folder (no display)
        if stock_only:
            base = base + (('stock_only',),)
        if did is not None and path.startswith('character/'):
            # a character display's attached helm / shoulders come from its bake row, not from files the
            # cache checks: a row that gains a shoulder piece (F-220 riders) must rebuild its pane
            cdi_r = (self.result['stock_dbc'][0] if dbc_source == 'stock' else self.result['effective_dbc'][0]).get(did) or {}
            cdx_r = (self.result['stock_char_dbc'][0] if dbc_source == 'stock' else self.result['effective_char_dbc'][0]).get(
                int(cdi_r.get('extended_display_info_id') or 0)) or {}
            hs_ = (int(cdx_r.get('helm_id') or 0), int(cdx_r.get('shoulders_id') or 0))
            if any(hs_):
                base = base + (('items', hs_),)
        key = hashlib.sha1(repr(base + (('skins', own),) if own else base).encode()).hexdigest()[:16]
        hit = self.cache.get(key)
        if hit is not None and stock_only:
            self._publish(key, hit)                            # stock files never change: no re-resolve
            self.reused += 1
            return _sized(copy.deepcopy(hit['pane']), opt)
        if hit is not None:
            f = Finder(self.picks, {path: opt})
            ok = True
            for p, fs in hit['deps']:
                r = f._resolve(p)
                if (str(r) if r is not None else None) != fs:
                    ok = False
                    break
            if ok:
                self._publish(key, hit)
                self.reused += 1
                return _sized(copy.deepcopy(hit['pane']), opt)
        pn = self._build_pane(path, opt, did, tex_override, dbc_source, key, skins, row_over, stock_only)
        return _sized(pn, opt) if pn else pn

    def _geosets_of(self, sk) -> set:
        # submesh ids of a .skin, read once per deploy (pane keys ask for every pane with geoset data)
        c = self.__dict__.setdefault('_gs_cache', {})
        k = str(sk)
        if k not in c:
            from lib import geoset_fix as gf
            c[k] = gf.mesh_geosets(Path(k).read_bytes())
        return c[k]

    def _publish(self, key: str, rec: dict) -> None:
        mid = rec['pane']['map']
        mp = self.maps_dir / f'{mid}.json'
        if not mp.exists():
            mp.write_text(json.dumps(rec['map'], separators=(',', ':')))
        if rec.get('prov') is not None:
            pp = self.prov_dir / f'{mid}.json'
            if not getattr(self, '_prov_have', None):
                self.prov_dir.mkdir(parents=True, exist_ok=True)
                self._prov_have = set(os.listdir(self.prov_dir))   # one listing; membership in memory
            if pp.name not in self._prov_have:
                pp.write_text(json.dumps(rec['prov'], separators=(',', ':'), default=str))
                self._prov_have.add(pp.name)
        self.maps[mid] = rec['map']
        self.used[key] = rec

    def save_cache(self) -> None:
        import pickle
        tmp = PANE_CACHE.with_suffix('.tmp')
        tmp.write_bytes(pickle.dumps(self.used))
        tmp.replace(PANE_CACHE)
        keep = {r['pane']['map'] for r in self.used.values()}
        for f in self.maps_dir.glob('*.json'):
            if f.stem not in keep:
                f.unlink()
        # provenance is content-named by the same map ids; only v2's own 'm...' files are pruned
        # (data/prov/ also holds the v1 viewer's numeric files)
        if self.prov_dir.is_dir():
            for f in self.prov_dir.glob('m*.json'):
                if f.stem not in keep:
                    f.unlink()

    def ignored_skin_names(self, path: str, opt: ai.Option) -> List[str]:
        """Display-skin slots (types 11-13) that carry an embedded filename: the client ignores it
        and uses the display's skin, so a pack that meant a fixed texture there shows the wrong one
        (patch-hd-everything's gryphon_mount: slot 'creature/elitegryphon/elitegryphon.blp')."""
        from lib import skin_fill as sf
        f = opt.files.get(path)
        if f is None or not path.endswith('.m2') or opt.sources == ['stock']:
            return []
        table = self.ix._meta_cache().get('textab', f, lambda x: sf.texture_table(x.read_bytes()))
        folder = path.rsplit('/', 1)[0] + '/'
        return [n for t, n in table if t in (11, 12, 13) and n.endswith('.blp') and not n.startswith(folder)]

    def empty_texture_tris(self, path: str, opt: ai.Option) -> int:
        """Triangles a model draws with a hardcoded texture that has NO filename (a broken
        conversion: patch-hd-everything's golemcannonstone combines its skin with one -> black)."""
        f, sk = opt.files.get(path), opt.files.get(path[:-3] + '00.skin')
        if f is None or sk is None or not path.endswith('.m2'):
            return 0
        return self.ix._meta_cache().get('emptytex', f, lambda _f: _empty_tex_tris(f.read_bytes(), sk.read_bytes()))

    @staticmethod
    def near_diff(path: str, o1: ai.Option, o2: ai.Option) -> Optional[str]:
        """Two options that LOOK identical: same files, every skin/anim byte-identical, and the model
        differing only in a few bytes of metadata (drakemount2grand: attachment 0 z 3.12 vs 3.28 -
        the rider seat). -> a short description of the difference, or None (a real difference)."""
        import struct
        from lib.m2_skin_rebuild import _ELEM
        import numpy as np
        if set(o1.files) != set(o2.files) or path not in o1.files:
            return None
        if o1.files[path].stat().st_size != o2.files[path].stat().st_size:
            return None                                   # cheap reject first
        for k in o1.files:
            if k != path and (o1.files[k].stat().st_size != o2.files[k].stat().st_size or
                              o1.files[k].read_bytes() != o2.files[k].read_bytes()):
                return None
        b1, b2 = o1.files[path].read_bytes(), o2.files[path].read_bytes()
        if b1[:4] != b'MD20' or len(b1) < 0x130:
            return None
        diff = np.nonzero(np.frombuffer(b1, np.uint8) != np.frombuffer(b2, np.uint8))[0]
        if not len(diff) or len(diff) > 256:
            return None
        diff = diff.tolist()
        names = {0x2C: 'bones', 0x1C: 'animations', 0x3C: 'vertices', 0x50: 'textures', 0x70: 'materials',
                 0xF0: 'attachments', 0x100: 'events', 0x108: 'lights', 0x110: 'cameras', 0x118: 'ribbons',
                 0x128: 'particles', 0x58: 'transparency', 0x48: 'colours', 0x60: 'texture animations'}
        attach = {0: 'mount / rider seat (0)', 1: 'right hand (1)', 2: 'left hand (2)', 5: 'right shoulder (5)',
                  6: 'left shoulder (6)', 11: 'head (11)', 18: 'chest (18)'}
        where: Dict[str, set] = {}
        for i in diff:
            if i < 0x130:
                where.setdefault('header', set()); continue
            hit = None
            for at, nm in names.items():
                n, o = struct.unpack_from('<II', b1, at)
                if n and o <= i < o + n * _ELEM.get(at, 1):
                    hit = (nm, (i - o) // _ELEM.get(at, 1))
                    break
            nm, rec = hit or ('animation keyframes', None)
            where.setdefault(nm, set()).add(rec)
        if {'vertices', 'textures', 'materials'} & set(where):
            return None                                   # a visible change, not a near-duplicate
        parts = []
        for nm, recs in where.items():
            if nm == 'attachments':
                n, o = struct.unpack_from('<II', b1, 0xF0)
                ids = sorted(struct.unpack_from('<I', b1, o + 40 * r)[0] for r in recs if r is not None)
                parts.append('attachment ' + ', '.join(attach.get(x, str(x)) for x in ids) + ' position')
            else:
                parts.append(nm)
        return f"{len(diff)} bytes differ: " + '; '.join(parts)

    def own_display(self, path: str, opt: ai.Option, did: int) -> tuple:
        """(display, source) to draw this option with when its packs do NOT put `did` on this model but
        do put another display on it; (None, None) when `did` is fine for it (or no pack row applies)."""
        srcs = self._srcs()
        stock_cmd = self.result['stock_dbc'][1]
        def uses(x, d):
            row = srcs[x].cdi.get(d)
            m = (srcs[x].cmd.get(int(row.get('model_id') or 0)) or stock_cmd.get(int(row.get('model_id') or 0))) if row else None
            return bool(m) and ms.norm(str(m.get('model_path') or '')) == path
        packs = [x for x in opt.sources if x != 'stock' and x in srcs and srcs[x].cdi]
        if not packs or any(uses(x, did) for x in packs) or not any(did in srcs[x].cdi for x in packs):
            return None, None
        for x in packs:
            for d in sorted(srcs[x].cdi):
                if uses(x, d) and self.names.get(d):
                    return d, x
        return None, None

    def home_display(self, path: str) -> Optional[int]:
        """A display whose STOCK row uses this model (the live DBC may point it elsewhere)."""
        if getattr(self, '_home', None) is None:
            cdi, cmd = self.result['stock_dbc']
            self._home = {}
            for d, row in sorted(cdi.items()):
                m = cmd.get(int(row.get('model_id') or 0))
                if m:
                    self._home.setdefault(ms.norm(str(m.get('model_path') or '')), d)
        return self._home.get(path)

    def row_source(self, did: int, path: str, opt: ai.Option) -> str:
        """Which source's display row draws `did` for this option: the option's own pack if its
        row still uses this model, else stock."""
        srcs = self._srcs()
        stock_cmd = self.result['stock_dbc'][1]
        for x in opt.sources:
            if x == 'stock' or x not in srcs:
                continue
            row = srcs[x].cdi.get(did)
            m = (srcs[x].cmd.get(int(row.get('model_id') or 0)) or stock_cmd.get(int(row.get('model_id') or 0))) if row else None
            if m and ms.norm(str(m.get('model_path') or '')) == path:
                return x
        return 'stock'

    def folder_skins(self, path: str, options: List[ai.Option]) -> Optional[tuple]:
        """Skins for a model no display uses and no sibling display can lend (golemharveststage2):
        the folder's own textures, one per creature-skin slot (types 11-13). Slot order from a pack
        that hardcodes them (harveststage2chest1 ~ harveststage2chest, digits stripped), else
        alphabetical. -> (name1, name2, name3) folder-relative, as a display row names them."""
        import re
        import struct
        root = (options[0].files.get(path) if options else None) or self.ix.stock.get(path)
        if root is None:
            return None
        m2 = root.read_bytes()
        if m2[:4] != b'MD20':
            return None
        n, o = struct.unpack_from('<II', m2, 0x50)
        slots = {}
        hard = set()
        for i in range(n):
            typ, _f, ln, no = struct.unpack_from('<4I', m2, o + 16 * i)
            if typ in (11, 12, 13):
                slots[i] = typ
            elif typ == 0 and ln:
                hard.add(m2[no:no + ln - 1].decode('latin1').replace('\\', '/').lower())
        if not slots:
            return None
        folder = path.rsplit('/', 1)[0] + '/'
        files = sorted(p for p in self.ix.stock if p.startswith(folder) and p.endswith('.blp')
                       and '/' not in p[len(folder):] and p not in hard)
        if not files:
            return None
        stem = lambda p: re.sub(r'\d+$', '', p.rsplit('/', 1)[-1].rsplit('.', 1)[0].lower())
        order: Dict[int, str] = {}
        for o_ in options[1:]:                               # a pack that hardcodes the slots
            f = o_.files.get(path)
            b = f.read_bytes() if f else b''
            if b[:4] != b'MD20' or struct.unpack_from('<I', b, 0x50)[0] != n:
                continue
            o2 = struct.unpack_from('<I', b, 0x54)[0]
            for i, typ in slots.items():
                t2, _f, ln, no = struct.unpack_from('<4I', b, o2 + 16 * i)
                if t2 == 0 and ln:
                    want = stem(b[no:no + ln - 1].decode('latin1').replace('\\', '/'))
                    hit = next((p for p in files if stem(p) == want), None)
                    if hit:
                        order[typ] = hit
        rest = [p for p in files if p not in order.values()]
        names = []
        for typ in (11, 12, 13):
            p = order.get(typ) or (rest.pop(0) if typ in slots.values() and rest else None)
            names.append(p.rsplit('/', 1)[-1].rsplit('.', 1)[0] if p else '')
        return tuple(names) if any(names) else None

    def borrow_display(self, path: str) -> Optional[int]:
        """A model no display uses (crabsmall) has nothing to fill its creature-skin slots and
        draws black: borrow a display of a sibling model in the same folder (skin names are
        folder-relative), the most used one with a skin."""
        if getattr(self, '_by_dir', None) is None:
            cdi, cmd = self.result['effective_dbc']
            by: Dict[str, Dict[int, int]] = {}
            for did_, row in cdi.items():
                mrow = cmd.get(int(row.get('model_id') or 0))
                if not mrow or not str(row.get('texture_variation_1') or '').strip():
                    continue
                mp = ms.norm(str(mrow.get('model_path') or ''))
                by.setdefault(mp.rsplit('/', 1)[0], {}).setdefault(int(row.get('model_id') or 0), did_)
            self._by_dir = {d: list(m.values()) for d, m in by.items()}
        ds = self._by_dir.get(path.rsplit('/', 1)[0]) or []
        return ds[0] if ds else None

    def own_skins(self, did: Optional[int], opt: ai.Option, dbc_source, path: Optional[str] = None) -> Optional[tuple]:
        """Creature skins from the option's OWN display row when they differ from the live
        row's: packs rename skins in the live DBC (697 displays) to textures painted for their
        mesh. And when those skins are blank for a model that needs them (a pack swapped in a
        display-skinned model and missed this display), the filled ones (lib/skin_fill).
        None = the live skins are the option's own and complete."""
        if did is None:
            return None
        if dbc_source is not None:
            # a display pane drawn with one source's rows (the Displays tab, a repoint card): that
            # row's skins, filled when it leaves them blank (zombie2/zombiesword: display 21434)
            srcs = self._srcs()
            cdi_s, cmd_s = (srcs[dbc_source].cdi, srcs[dbc_source].cmd) if dbc_source in srcs else self.result['stock_dbc']
            srow = cdi_s.get(did)
            if not srow or not path or not path.endswith('.m2') or opt.files.get(path) is None:
                return None
            by = self.__dict__.setdefault('_src_by_path', {})
            if dbc_source not in by:
                m_ = by[dbc_source] = {}
                for d, r in cdi_s.items():
                    mr = cmd_s.get(int(r.get('model_id') or 0))
                    if mr:
                        m_.setdefault(ms.norm(str(mr.get('model_path') or '')), []).append(d)
            sibs = by[dbc_source].get(path, [])
            return self.fill_skins(path, opt, tuple(str(srow.get(k) or '') for k in ms.CDI_TEX_FIELDS),
                                   [tuple(str(cdi_s[d].get(k) or '') for k in ms.CDI_TEX_FIELDS) for d in sibs])
        live = self.result['effective_dbc'][0].get(did)
        if not live:
            return None
        srcs = self._srcs()
        own = self.row_owner(did, opt, path)
        orow = srcs[own].cdi.get(did) if own else self.result['stock_dbc'][0].get(did)
        theirs = tuple(str(live.get(k) or '') for k in ms.CDI_TEX_FIELDS)
        out = None
        if orow and int(orow.get('model_id') or 0) == int(live.get('model_id') or 0):
            mine = tuple(str(orow.get(k) or '') for k in ms.CDI_TEX_FIELDS)
            if [x.lower() for x in mine] != [x.lower() for x in theirs]:
                out = mine
        base = out or theirs
        if path and path.endswith('.m2') and opt.files.get(path) is not None:
            filled = self.fill_skins(path, opt, base)
            if filled:
                return filled
        return out

    def row_owner(self, did: int, opt: ai.Option, path: Optional[str]) -> Optional[str]:
        """The pack whose display row draws `did` for this option: the first of the option's packs
        with a row whose named skins exist (patch-hd-creatures-mounts names Raptor2Red for raptor
        display 2571, a texture nobody ships - patch-hd-everything's RaptorSkinRed is used instead).
        Packs with a broken row are remembered in self._broken_rows."""
        srcs = self._srcs()
        cands = [x for x in opt.sources if x != 'stock' and x in srcs and srcs[x].cdi.get(did)]
        if not cands or not path:
            return cands[0] if cands else None
        folder = path.rsplit('/', 1)[0] + '/'
        files = [self.ix._src_files(x) for x in opt.sources] + [self.ix.stock]
        for x in cands:
            row = srcs[x].cdi[did]
            names = [str(row.get(k) or '').strip() for k in ms.CDI_TEX_FIELDS]
            if all(any(f'{folder}{n.lower()}.blp' in f for f in files) for n in names if n):
                return x
            self.__dict__.setdefault('_broken_rows', {})[(did, x)] = [n for n in names if n and
                not any(f'{folder}{n.lower()}.blp' in f for f in files)]
        return cands[0]

    def own_cgd(self, did: int, opt: ai.Option, path: Optional[str], row: dict) -> Optional[int]:
        """creature_geoset_data from the option's own display row, when that row puts `did` on the
        same model FILE as `row` (packs book their own CreatureModelData ids, so compare paths)."""
        from lib import repoint_complete as rc
        ox = self.row_owner(did, opt, path)
        cdi, cmd = (self._srcs()[ox].cdi, self._srcs()[ox].cmd) if ox else self.result['stock_dbc']
        orow = cdi.get(did)
        if not orow:
            return None
        mine = rc._path(cmd, orow) or rc._path(self.result['effective_dbc'][1], orow)
        if not mine or mine != rc._path(self.result['effective_dbc'][1], row):
            return None
        return int(orow.get('creature_geoset_data') or 0)

    def fill_skins(self, path: str, opt: ai.Option, base: tuple, extra_sibs=()) -> Optional[tuple]:
        """Skins for a display the option leaves blank on a model that needs them (or None)."""
        if any(str(x).strip() for x in base):
            return None                                   # names skins already: nothing to fill
        from lib import skin_fill as sf
        meta = self.ix._meta_cache()
        table = meta.get('textab', opt.files[path], lambda f: sf.texture_table(f.read_bytes()))
        need = sf.needed(table)
        if not sf.is_blank(base, need):
            return None
        stock = self.ix.stock.get(path)
        stock_table = meta.get('textab', stock, lambda f: sf.texture_table(f.read_bytes())) if stock else []
        files = [self.ix._src_files(x) for x in opt.sources] + [self.ix.stock]
        cdi = self.result['effective_dbc'][0]
        sibs = [tuple(str((cdi.get(d) or {}).get(k) or '') for k in ms.CDI_TEX_FIELDS) for d in self.displays_of(path)]
        got = sf.fill(path, table, stock_table, lambda h: any(h in f for f in files), list(sibs) + list(extra_sibs))
        if got:
            self._filled = getattr(self, '_filled', set())
            self._filled.add((path, opt.key))
        return got

    def _srcs(self):
        if getattr(self, '_srcs_c', None) is None:
            self._srcs_c = {x.name: x for x in self.result['sources']}
        return self._srcs_c

    def bake_for(self, ext: int, mesh: str, opt: ai.Option, live_x, live_chs):
        """(CDX row, CharSections) a character mesh option ships with: the largest NPC bake
        among stock + each source's own CDX row that is compatible with this mesh option
        (hd_curate_v2's bake rule), and the race tables of the mesh's own pack."""
        srcs = {x.name: x for x in self.result['sources']}
        stock_cdx, stock_chs = self.result['stock_char_dbc']
        cands = []
        for src in ['stock'] + [n for n, x in srcs.items() if x.cdx]:
            row = stock_cdx.get(ext) if src == 'stock' else srcs[src].cdx.get(ext)
            if not row or not row.get('texture'):
                continue
            bp = 'textures/bakednpctextures/' + str(row['texture']).lower()
            f = (self.ix.stock if src == 'stock' else srcs[src].assets).get(bp)
            if f is None:
                continue
            if not self.ix.compatible(bp, ai.Option('b', [src], {bp: f}, f.stat().st_size), mesh, opt):
                continue
            cands.append((f.stat().st_size, src, row))
        if not cands:
            return live_x, live_chs
        _, src, row = max(cands, key=lambda c: (c[0], c[1]))
        msrc = next((s_ for s_ in opt.sources if s_ != 'stock' and s_ in srcs), 'stock')
        chs = stock_chs if msrc == 'stock' or not srcs[msrc].chs else {**stock_chs, **srcs[msrc].chs}
        return row, chs

    def _build_pane(self, path: str, opt: ai.Option, did: Optional[int], tex_override, dbc_source,
                    key: str, skins_given: Optional[tuple] = None, row_over: Optional[dict] = None,
                    stock_only: bool = False) -> Optional[dict]:
        """Pane descriptor + map for mesh `path` drawn with option `opt` (on display `did`
        for creature/character models)."""
        kind = tab_of(path)
        override = {path: opt}
        finder = Finder(self.picks, override, stock_only)
        finder.log = []
        fdid_files: Dict[int, Path] = {}

        def alloc(_name: str, f: Path) -> int:
            fid = 900000000 + int(self.ix.hash(f)[:7], 16) % 99000000
            fdid_files[fid] = f
            return fid

        root = opt.files.get(path)
        if root is None:
            return None
        info = ms.decode_m2(root) if path.endswith('.m2') else None
        srcs = {x.name: x for x in self.result['sources']}
        if dbc_source and dbc_source != 'stock' and dbc_source in srcs:
            cdi, cmd = srcs[dbc_source].cdi, srcs[dbc_source].cmd
            char_dbc = (srcs[dbc_source].cdx, srcs[dbc_source].chs)
        elif dbc_source == 'stock':
            cdi, cmd = self.result['stock_dbc']
            char_dbc = self.result['stock_char_dbc']
        else:
            cdi, cmd = self.result['effective_dbc']
            char_dbc = self.result['effective_char_dbc']
        row = cdi.get(did) if did is not None else None
        if row_over and did is not None:
            row = {**(row or {}), **row_over}          # a row we derive (community remaster option)
        mrow = cmd.get(int(row.get('model_id') or 0)) if row else None
        skins = [str(row.get(k) or '') for k in ms.CDI_TEX_FIELDS] if row else ['', '', '']
        own_sk = self.own_skins(did, opt, dbc_source, path)
        if own_sk:
            skins = list(own_sk)
        if skins_given and not row:
            skins = list(skins_given)
        item_prov: List[dict] = []
        mvd._DRY = True
        try:
            if kind == 'wmo':
                pane = {'src': 'v2', 'model': path, 'skins': [0, 0, 0], 'missing': [], 'bbox': None, 'scene': 'wmo'}
                for p in opt.files:
                    finder.find(p)
                for t in ai.wmo_textures(root):
                    finder.find(t)
            else:
                r = ms.Resolved(int(row.get('model_id') or 0) if row else 0, path, label(opt.sources), info, skins, [])
                pane = mvd._stage_pane('v2', r, finder, Path('/nonexistent'), alloc)
                pane['missing'] = list(pane.get('missing') or [])
                if 'retail' in opt.sources and did is not None:
                    # the retail copy of this file wears the retail display's skins only while
                    # that display still uses this file; else the stock skins (same UV layout)
                    from lib import retail
                    ds_ = self.displays_of(path)
                    cdi_e = self.result['effective_dbc'][0]
                    rsk = retail.sibling_textures(did, retail.remaster(path, ds_), ds_, lambda d: tuple(
                        str((cdi_e.get(int(d)) or {}).get(f'texture_variation_{k}') or '').lower() for k in (1, 2, 3)))
                    if any(rsk):
                        pane['missing'] = [m for m in pane['missing'] if not m.endswith('.blp')]
                    for i, fd in enumerate(rsk):
                        f = retail.texture_file(fd)
                        if f is not None:
                            pane['skins'][i] = fd
                            fdid_files[fd] = f
                pane['scale'] = mvd._ingame_scale(row, mrow) if row else 1.0
                x = None
                ext = int((row or {}).get('extended_display_info_id') or 0)
                if ext and kind == 'character':
                    cdx, chs = char_dbc
                    x = cdx.get(ext)
                    if dbc_source is None:
                        # the bake this option would ship with (same rule as zep model curate):
                        # live rows can carry a pack's HD bake, painted for that pack's UVs
                        x, chs = self.bake_for(ext, path, opt, x, chs)
                    if x:
                        pane['tex'], miss = mvd._char_textures('v2', x, chs, finder, Path('/nonexistent'), alloc)
                        pane['missing'] += miss
                        pane['mesh'] = mvd._char_mesh(x, 'effective', pane)
                if 'mesh' not in pane and row:
                    cgd = int(row.get('creature_geoset_data') or 0)
                    if dbc_source is None and did is not None:
                        # geosets from the option's OWN display row too (wendigo2: patch-hd-everything's
                        # 801 hid Spaceslam's face parts; his rows say 0)
                        ocgd = self.own_cgd(did, opt, path, row)
                        if ocgd is not None:
                            cgd = ocgd
                    if cgd and path.endswith('.m2') and opt.files.get(path[:-3] + '00.skin') is not None:
                        # a nibble naming a geoset this mesh lacks draws nothing in game: curate
                        # resets it (lib/geoset_fix); the pane shows what will ship
                        from lib import geoset_fix as gf
                        fx_ = gf.fixed(cgd, self._geosets_of(opt.files[path[:-3] + '00.skin']))
                        if fx_ is not None:
                            pane['geosets_fixed'] = [cgd, fx_]
                            cgd = fx_
                    if cgd:
                        from lib import geoset_fix as gf
                        pane['mesh'], allg = gf.pane_mesh(cgd)
                        if allg:
                            pane['geoall'] = allg
                if kind == 'item':
                    d = self.result['displays'].get(self._item_group(path))
                    if d:
                        mvd._item_texture('v2', d, finder, Path('/nonexistent'), alloc, pane)
                want = mvd._items_for(x, self.equipment.get(did)) if (x or did in self.equipment) else []
                finder.item_tex = {it['t']: it['m'] for it in want if it.get('t') and it.get('m')}
                if want:
                    items, miss = mvd._stage_items('v2', want, finder, Path('/nonexistent'), item_prov)
                    if items:
                        pane['items'] = items
                    pane['missing'] += miss
        finally:
            mvd._DRY = False
        fmap: Dict[str, str] = {}
        for p, f in finder.log:
            if f is None or p in fmap:
                continue
            if p.endswith('.m2') and 256 <= int.from_bytes(f.read_bytes()[4:8], 'little') < 264:
                from lib import m2_tbc
                m2b, skins_b, _ = m2_tbc.convert(f.read_bytes())
                fmap[p] = self.store.put_bytes(m2b, '.m2')
                for v, sb in enumerate(skins_b):
                    fmap[f'{p[:-3]}{v:02d}.skin'] = self.store.put_bytes(sb, '.skin')
                continue
            if p == path:
                # a recorded fix for this pack file (lib/hd_curate_fixes): show what curate ships
                from lib import hd_curate_fixes as hcf
                fx = hcf.fixed(p, f.read_bytes(), self.log)
                if fx:
                    fmap[p] = self.store.put_bytes(fx[0], '.m2')
                    pane['fixed_by_us'] = fx[1].get('note', '')
                    for t in fx[1].get('ship') or []:
                        tf = finder._resolve(t)
                        if tf is not None:
                            fmap[t] = self.store.put(tf)
                    continue
            fmap[p] = self.store.put(f)
        for fid, f in fdid_files.items():
            fmap[f'fdid/{fid}'] = self.store.put(f)
        if 'tex' in pane:
            pane['tex_keys'] = {str(slot): f'fdid/{fid}' for slot, fid in pane['tex'].items()}
        mid = 'm' + key
        self.n_maps += 1
        pv_saved = None
        (self.maps_dir / f'{mid}.json').write_text(json.dumps(fmap, separators=(',', ':')))
        # Sources panel (provenance), loaded on demand: data/prov/<map id>.json
        try:
            layer = ([] if dbc_source == 'stock' else [srcs[dbc_source]] if dbc_source in srcs else
                     sorted((x for x in self.result['sources'] if x.enabled), key=lambda x: x.priority))
            row_ = cdi.get(did) if did is not None else None
            mrow_ = cmd.get(int(row_.get('model_id') or 0)) if row_ else None
            ext_ = int((row_ or {}).get('extended_display_info_id') or 0)
            x_ = char_dbc[0].get(ext_) if ext_ else None
            item_files = {p for it in item_prov for p, _ in it.get('files', [])}
            body = [(p, f) for p, f in finder.log if p not in item_files]
            pv = mvd._provenance(layer, dbc_source or 'live build', did if did is not None else '-', row_,
                                 int((row_ or {}).get('model_id') or 0), mrow_, ext_ if x_ else 0, x_, path,
                                 body, item_prov, srcs)
            for it in pv['items']:
                it.pop('_h', None)
            pv['option'] = label(opt.sources)
            self.prov_dir.mkdir(parents=True, exist_ok=True)
            (self.prov_dir / f'{mid}.json').write_text(json.dumps(pv, separators=(',', ':'), default=str))
            pane['prov'] = mid
            pv_saved = pv
        except Exception as ex:                       # provenance is a report: never fail the pane
            pane['prov_error'] = str(ex)[:200]
        self.maps[mid] = fmap
        pane['map'] = mid
        pane['option'] = opt.key
        pane['sources'] = opt.sources
        pane['size'] = opt.size
        if info and not info.error:
            pane['stats'] = {'version': opt.meta.get('version'), 'mb': round(opt.size / 1048576, 2),
                             'bones': info.bones, 'particles': info.particles, 'ribbons': info.ribbons}
        if did is not None:
            pane['display'] = did
        if finder.conflicts:
            pane['conflicts'] = sorted(finder.conflicts)
        br = [f"{x}: {', '.join(n)}" for (d_, x), n in getattr(self, '_broken_rows', {}).items() if d_ == did and x in opt.sources]
        if br:
            pane['broken_rows'] = br
        if (path, opt.key) in getattr(self, '_filled', set()) and own_sk:
            pane['skins_filled'] = [x for x in own_sk if x]
        import copy
        self.used[key] = {'pane': copy.deepcopy(pane), 'map': fmap, 'prov': pv_saved,
                          'deps': [(p, str(f) if f is not None else None) for p, f in finder.log]}
        return pane

    def _item_group(self, path: str) -> Optional[str]:
        g = ms._item_group(path)
        return f'item:{g[0]}/{g[1]}' if g else None

    # ---- the asset tabs ----------------------------------------------------------------
    def assets(self) -> List[dict]:
        out = []
        item_done = set()
        paths = sorted(p for p, a in self.ix.meshes.items() if len(a.options) > 1)
        for i, p in enumerate(paths):
            a = self.ix.meshes[p]
            tab = tab_of(p)
            if tab == 'item':
                gid = self._item_group(p)
                if gid in item_done:
                    continue
                d = self.result['displays'].get(gid)
                if not d:
                    continue
                item_done.add(gid)
                rep = d['stock'].model_path if d.get('stock') else p
                a = self.ix.meshes.get(rep) or a
                p = rep
                members = d.get('members') or [p]
            else:
                gid, members = p, [p]
            did = None
            if tab in ('creature', 'character'):
                ds = self.displays_of(p)
                if tab == 'character':
                    ds = [x for x in ds if int((self.result['effective_dbc'][0][x]).get('extended_display_info_id') or 0)] or ds
                did = ds[0] if ds else None
            panes = []
            # no LIVE display (a pack repointed them elsewhere, e.g. Big Blizzard Bear 27567): use the
            # displays that start on this model, drawn from each option's own rows
            home = self.home_display(p) if did is None and tab == 'creature' else None
            pdid = did if did is not None or tab != 'creature' else (home or self.borrow_display(p))
            fsk = self.folder_skins(p, a.options) if tab == 'creature' and pdid is None else None
            for o in a.options:
                # the option's pack may not put the shown display on this model at all (tiger2: Spaceslam's
                # rows keep display 320 on the stock tiger): show it on one of ITS displays that use it
                odid, osrc = self.own_display(p, o, pdid) if pdid is not None and tab == 'creature' else (None, None)
                if odid is not None:
                    pn = self.pane(p, o, odid, dbc_source=osrc)
                    if pn:
                        pn['own_display'] = odid
                        panes.append(pn)
                    continue
                pn = self.pane(p, o, pdid, skins=fsk, dbc_source=self.row_source(home, p, o) if home else None)
                if pn:
                    if pdid is not None and did is None and not home:
                        pn['borrowed'], pn['scale'] = pdid, 1.0
                    if home:
                        pn['home_display'] = home
                    if fsk:
                        pn['folder_skins'] = list(fsk)
                    panes.append(pn)
            if len(panes) < 2:
                continue
            # near-duplicates: same look, a few bytes of metadata apart -> one card with variants
            by_key = {o.key: o for o in a.options}
            for pn_ in panes:
                et = self.empty_texture_tris(p, by_key[pn_['option']]) if pn_['option'] in by_key else 0
                if et:
                    pn_['empty_tex'] = et
                ign = self.ignored_skin_names(p, by_key[pn_['option']]) if pn_['option'] in by_key else []
                if ign:
                    pn_['ignored_skin'] = ign
            for i_, p1 in enumerate(panes):
                for p2 in panes[i_ + 1:]:
                    nd = self.near_diff(p, by_key[p1['option']], by_key[p2['option']])
                    if nd:
                        p1.setdefault('near', []).append({'option': p2['option'], 'summary': nd})
                        p2.setdefault('near', []).append({'option': p1['option'], 'summary': nd})
            mvd._pane_cameras(panes)
            cur = self.picks.mesh(p)
            names = self.names.get(gid if tab == 'item' else did, []) if (did or tab == 'item') else []
            out.append({'id': gid, 'tab': tab, 'path': p, 'members': members, 'display': did,
                        'displays': len(self.displays_of(p)),
                        'displays_used': sum(1 for x in self.displays_of(p) if self.names.get(x)),
                        'used_ids': [x for x in self.displays_of(p) if self.names.get(x)][:400], 'names': names[:6],
                        'current': cur.key if cur else None,
                        'explicit': p in self.picks.mesh_choice, 'panes': panes})
            if i % 500 == 499:
                self.log(f'    assets {i + 1:,}/{len(paths):,} ...')
                self.ix.hash.save()
        self.ix.hash.save()
        return out

    # ---- the catalogue (All view): every model, not only the ones with a choice -------------
    def catalog(self) -> List[dict]:
        """One-option entries for everything else (stock-only models, and indexed meshes a single
        source ships), so the picker's All view can be shopped for new content. Items are left out
        (they need a display's textures); the curated build never reads these."""
        out = []
        done = {p for p, a in self.ix.meshes.items() if len(a.options) > 1}
        stock = [p for p in self.ix.stock if p.endswith('.m2') or (p.endswith('.wmo') and not ai._WMO_GROUP.search(p))]
        paths = sorted((set(stock) | set(self.ix.meshes)) - done)
        for i, p in enumerate(paths):
            tab = tab_of(p)
            if tab == 'item':
                continue
            a = self.ix.meshes.get(p)
            if a is not None:
                opts = a.options
            else:
                files = self.ix._mesh_files('stock', p) if p.endswith('.m2') else self.ix._wmo_files('stock', p)
                opts = self.ix._options({'stock': files}) if files else []
            if not opts:
                continue
            ds = self.displays_of(p) if tab in ('creature', 'character') else []
            did = ds[0] if ds else None
            home = self.home_display(p) if did is None and tab == 'creature' else None
            pdid = did if did is not None or tab != 'creature' else (home or self.borrow_display(p))
            fsk = self.folder_skins(p, opts) if tab == 'creature' and pdid is None else None
            pn = self.pane(p, opts[0], pdid, skins=fsk, dbc_source=self.row_source(home, p, opts[0]) if home else None)
            if not pn:
                continue
            if pdid is not None and did is None and not home:
                pn['borrowed'], pn['scale'] = pdid, 1.0
            if home:
                pn['home_display'] = home
            if fsk:
                pn['folder_skins'] = list(fsk)
            mvd._pane_cameras([pn])
            out.append({'id': p, 'tab': tab, 'path': p, 'members': [p], 'display': did, 'displays': len(ds),
                        'names': self.names.get(did, [])[:6] if did else [], 'current': opts[0].key,
                        'single': True, 'panes': [pn]})
            if i % 2000 == 1999:
                self.log(f'    catalogue {i + 1:,}/{len(paths):,} ...')
                self.ix.hash.save()
        self.ix.hash.save()
        return out

    # ---- the texture tab -----------------------------------------------------------------
    def textures(self, asset_panes: Dict[str, dict]) -> List[dict]:
        """Textures with >1 option: options, metadata, current pick, and a view: the pane
        (map) of a model using it and the map key to swap for each option."""
        out = []
        multi = sorted(p for p, a in self.ix.textures.items() if len(a.options) > 1)
        for i, p in enumerate(multi):
            a = self.ix.textures[p]
            cur, why = self.picks.texture(p, {})
            refs = sorted(self.ix.tex_refs.get(p, set()))
            opts = []
            meshes = [m for k, m in refs if k == 'mesh']
            # duplicates: options that decode to the same image (a re-encode, a re-save) are ONE option -
            # the largest file, every source listed
            meta = self.ix._meta_cache()
            reps: List[Tuple[ai.Option, List[ai.Option]]] = []
            for o in sorted(a.options, key=lambda x: -x.size):
                hit, th = None, None
                for r, group in reps:
                    if (r.meta.get('w'), r.meta.get('h')) == (o.meta.get('w'), o.meta.get('h')):
                        # decoded only when a same-size candidate exists (most options have none)
                        th = th if th is not None else meta.get('thumb24m', o.files[p], ai._thumb)
                        tr = meta.get('thumb24m', r.files[p], ai._thumb)
                        if th is not None and tr is not None and sum(abs(x - y) for x, y in zip(th, tr)) / max(1, len(th)) < 2.5:
                            hit = group; break
                (hit.append(o) if hit is not None else reps.append((o, [o])))
            alias = {o.key: r.key for r, g in reps for o in g}
            for r, group in reps:
                o = r
                comp = all(self.ix.compatible(p, o, m, self.picks.mesh(m)) for m in meshes if self.picks.mesh(m))
                srcs_ = sorted({x for g in group for x in g.sources}, key=lambda x: (x != 'stock', x))
                opts.append({'key': o.key, 'sources': srcs_, 'size': o.size, 'cas': self.store.put(o.files[p]),
                             'compatible': comp, 'dupes': len(group) - 1,
                             **{k: o.meta.get(k) for k in ('w', 'h', 'fmt', 'alpha', 'mips')}})
            # only a real choice is offered: 2+ distinct options that fit the picked mesh(es)
            if sum(1 for x in opts if x['compatible']) < 2:
                continue
            if cur is not None:
                cur = next((x for x in a.options if x.key == alias.get(cur.key, cur.key)), cur)
            view = self._texture_view(p, meshes, asset_panes)
            biggest = max(a.options, key=lambda o: o.size)
            out.append({'path': p, 'options': opts, 'current': cur.key if cur else None,
                        'explicit': p in self.picks.tex_choice, 'why': why,
                        'largest_compatible': bool(cur and cur.key == biggest.key),
                        'refs': [f'{k}:{m}' for k, m in refs[:12]], 'nrefs': len(refs), 'view': view})
            if i % 5000 == 4999:
                self.log(f'    textures {i + 1:,}/{len(multi):,} ...')
                self.ix.hash.save()
        self.ix.hash.save()
        return out

    def _texture_view(self, tex: str, meshes: List[str], asset_panes: Dict[str, dict]) -> Optional[dict]:
        """How to show `tex` on a model: an existing pane that uses it + the map key."""
        cur = self._current_file(tex)
        cname = self.store.put(cur) if cur is not None else None
        for m in meshes:
            pn = asset_panes.get(m)
            if pn is None:
                continue
            fm = self.maps.get(pn['map'], {})
            if tex in fm:
                return {'pane': pn, 'key': tex}
            # display skins and character textures sit under fdid/<n> keys: match the file itself
            for k, v in fm.items():
                if k.startswith('fdid/') and cname and v == cname:
                    return {'pane': pn, 'key': k}
        return None

    def _current_file(self, tex: str) -> Optional[Path]:
        o, _ = self.picks.texture(tex, {})
        return o.files.get(tex) if o else None


ITEM_ATTACH = {'head': 11, 'weapon': 1, 'shield': 0}


def _variant_code(path: str) -> str:
    """helm_x_hum.m2 -> 'hum' (race prefix + sex); '' for items without race variants."""
    stem = path.rsplit('/', 1)[1][:-3]
    tail = stem.rsplit('_', 1)[-1]
    return tail if len(tail) == 3 and tail[-1] in 'mf' else ''


RIDER_VERSION = 2
RIDER_CACHE = Path('/workspace/project/logs/viewer_riders.json')


def riders(dep: 'Deployer', bd: Dict[str, dict], log: Callable = print) -> None:
    """Each body seated in its Mount pose (lib/rider), for the picker's Rider toggle on mounts:
    body['rider'] = {m2, skin, tex: {slot: cas}} (content-store names). Cached per body map."""
    from lib import rider
    try:
        cache = json.loads(RIDER_CACHE.read_text())
    except Exception:
        cache = {}
    cas_dir = dep.store.dir
    n_new = 0
    for code, b in bd.items():
        key = f"{RIDER_VERSION}:{b.get('map')}:{','.join(map(str, b.get('mesh') or []))}"
        hit = cache.get(code)
        if not (hit and hit.get('key') == key and (cas_dir / hit['m2']).exists() and (cas_dir / hit['skin']).exists()):
            m = dep.maps.get(b['map']) or json.loads((dep.maps_dir / f"{b['map']}.json").read_text())
            root, skp = m.get(b['model']), m.get(b['model'][:-3] + '00.skin')
            if not root or not skp:
                continue
            try:
                m2b, skb = rider.bake((cas_dir / root).read_bytes(), (cas_dir / skp).read_bytes(), b.get('mesh') or [],
                                      {int(k): f'rider/{code}_{k}.blp' for k in (b.get('tex_keys') or {})})
            except Exception as ex:
                log(f'  rider {code}: skipped - {ex}')
                continue
            hit = cache[code] = {'key': key, 'm2': dep.store.put_bytes(m2b, '.m2'), 'skin': dep.store.put_bytes(skb, '.skin')}
            n_new += 1
        m = dep.maps.get(b['map']) or json.loads((dep.maps_dir / f"{b['map']}.json").read_text())
        b['rider'] = {'m2': hit['m2'], 'skin': hit['skin'],
                      'tex': {k: m.get(v) for k, v in (b.get('tex_keys') or {}).items() if m.get(v)}}
    RIDER_CACHE.write_text(json.dumps(cache))
    log(f'  riders: {sum(1 for b in bd.values() if b.get("rider"))} seated bodies ({n_new} baked)')


def linked_riders(dep: 'Deployer', links: Dict[int, List[Tuple[str, int]]], log: Callable = print) -> dict:
    """F-220: the riders the world DB puts on each mount display (creature X shows rider display R
    and rides mount M), each seated in its Mount pose like the race bodies (lib/rider). The picker's
    Rider toggle on M offers them first. -> {'bodies': {'d<R>': pane}, 'links': {M: [{code, creature,
    display}]}}. The rider's weapons and helm/shoulder attachments are not seated (bare body)."""
    cdi, cmd = dep.result['effective_dbc']
    bd: Dict[str, dict] = {}
    for rdid in sorted({r for rows in links.values() for _, r in rows}):
        row = cdi.get(rdid)
        mrow = cmd.get(int(row.get('model_id') or 0)) if row else None
        path = ms.norm(str(mrow.get('model_path') or '')) if mrow else ''
        if not path:
            continue
        o = dep.picks.mesh(path) or (dep.ix.meshes[path].options[0] if path in dep.ix.meshes else None)
        if o is None:
            stock = ms.stock_asset(path)
            if stock is None:
                continue
            o = ai.Option('stock', ['stock'], {path: stock})
        saved = dep.equipment.pop(rdid, None)
        try:
            pn = dep.pane(path, o, rdid)
        finally:
            if saved is not None:
                dep.equipment[rdid] = saved
        if pn:
            pn.pop('items', None)
            mvd._pane_cameras([pn])
            pn['code'] = f'd{rdid}'
            bd[pn['code']] = pn
    riders(dep, bd, log)
    bd = {k: v for k, v in bd.items() if v.get('rider')}
    out: Dict[str, List[dict]] = {}
    for mdid, rows in sorted(links.items()):
        for cname, rdid in rows:
            if f'd{rdid}' in bd:
                out.setdefault(str(mdid), []).append({'code': f'd{rdid}', 'creature': cname, 'display': rdid})
    log(f'  mount riders: {len(bd)} rider displays seated on {len(out)} mount displays')
    return {'bodies': bd, 'links': out}


def bodies(dep: 'Deployer') -> Dict[str, dict]:
    """One body pane per playable race/sex code ('hum', 'orf', ...): the most used NPC display
    of that race/sex with no helm and no shoulders, wearing the current body pick, no items."""
    _, races, _ = mvd._load_item_lookups()
    cdi, cmd = dep.result['effective_dbc']
    cdx = dep.result['effective_char_dbc'][0]
    best: Dict[str, Tuple[int, int, int, str]] = {}
    for did, row in cdi.items():
        ext = int(row.get('extended_display_info_id') or 0)
        x = cdx.get(ext) if ext else None
        mrow = cmd.get(int(row.get('model_id') or 0))
        if not x or not mrow or int(x.get('helm_id') or 0) or int(x.get('shoulders_id') or 0):
            continue
        path = ms.norm(str(mrow.get('model_path') or ''))
        prefix = (races.get(int(x.get('race') or 0)) or '').lower()
        if not prefix or not path.startswith('character/'):
            continue
        code = prefix + ('f' if int(x.get('gender') or 0) else 'm')
        gear = sum(1 for k in ('chest_id', 'legs_id', 'gloves_id', 'boots_id', 'belt_id', 'tabard_id', 'cape_id') if int(x.get(k) or 0))
        rank = (-len(dep.names.get(did, [])), gear, did)
        if code not in best or rank < best[code][:3]:
            best[code] = (*rank, path)
    out = {}
    for code, (_, _, did, path) in sorted(best.items()):
        o = dep.picks.mesh(path) or (dep.ix.meshes[path].options[0] if path in dep.ix.meshes else None)
        if o is None:
            stock = ms.stock_asset(path)
            if stock is None:
                continue
            o = ai.Option('stock', ['stock'], {path: stock})
        saved = dep.equipment.pop(did, None)           # a bare body: none of the display's weapons
        try:
            pn = dep.pane(path, o, did)
        finally:
            if saved is not None:
                dep.equipment[did] = saved
        if pn:
            pn.pop('items', None)
            mvd._pane_cameras([pn])
            pn['code'] = code
            out[code] = pn
    return out


def item_variants(dep: 'Deployer', e: dict) -> Dict[str, Dict[str, list]]:
    """{option key: {member path: [attach, m2 cas, skin cas, texture path, texture cas]}} for an
    item group, so the picker can put any option's variant on any body."""
    d = dep.result['displays'].get(e['id']) or {}
    texs = d.get('item_tex') or []
    folder = e['path'].split('/')[2]
    out: Dict[str, Dict[str, list]] = {}
    for pn in e['panes']:
        srcs = pn['sources']
        per = {}
        for m in e['members']:
            a = dep.ix.meshes.get(m)
            mo = None
            if a:
                mo = next((o for o in a.options if set(o.sources) & set(srcs)), None)
            files = mo.files if mo else ({m: ms.stock_asset(m)} if ms.stock_asset(m) else {})
            f = files.get(m)
            if f is None:
                continue
            sk = files.get(m[:-3] + '00.skin') or ms.stock_asset(m[:-3] + '00.skin')
            if 256 <= int.from_bytes(f.read_bytes()[4:8], 'little') < 264:
                from lib import m2_tbc
                m2b, skins, _ = m2_tbc.convert(f.read_bytes())
                m2c, skc = dep.store.put_bytes(m2b, '.m2'), (dep.store.put_bytes(skins[0], '.skin') if skins else None)
            else:
                m2c, skc = dep.store.put(f), (dep.store.put(sk) if sk else None)
            tex, texc = '', None
            for t in texs:
                to, _ = dep.picks.texture(t, {m: mo} if mo else {})
                tf = to.files.get(t) if to else ms.stock_asset(t)
                if tf is not None:
                    tex, texc = t, dep.store.put(tf)
                    break
            stem = m.rsplit('/', 1)[1]
            attach = ITEM_ATTACH.get(folder, 1) if folder != 'shoulder' else (6 if stem.startswith('l') else 5)
            per[m] = [attach, m2c, skc, tex, texc]
        out[pn['option']] = per
    return out


def _stem(path: str) -> str:
    return re.sub(r'[^a-z]', '', path.rsplit('/', 1)[-1].rsplit('.', 1)[0].lower())


def reuses_display(stock_path: str, path: str, ext, stock_paths: set) -> bool:
    """I-390: a pack reused a stock display id for a DIFFERENT creature (Spaceslam: display 13
    Peasant Woman -> medivh.m2). True when the pack's model is another existing stock model,
    the row has no ExtendedDisplayInfo (so it isn't a low-poly NPC -> baked character model
    upgrade), and the two file names share no stem (hydra -> hydraoutland, basilisk_outland ->
    basilisk, skeletonnaked -> skeletonmale are real upgrades)."""
    if not stock_path or path == stock_path or path not in stock_paths or int(ext or 0):
        return False
    a, b = _stem(stock_path), _stem(path)
    return not (a in b or b in a or len(os.path.commonprefix([a, b])) >= 4)


def annotate_retroports(dep, assets: list, v2: Path, log=print) -> None:
    """lib/retroport: a pack pane whose model is a retroport of the current retail model is drawn as what
    curate ships - retail's model (pane 'retroport': its FileDataID; the pane fetches it as a retail pane and
    keeps the pack's skins from its own file map) with geosets translated for retail's full mesh."""
    from lib import retroport as rp, retail
    rps = rp.retroports([s for s in dep.result['sources']], log, stock_dbc=dep.result['stock_dbc'][:2])
    srcs = {s.name: s for s in dep.result['sources']}
    stock_cdi, stock_cmd = dep.result['stock_dbc'][0], dep.result['stock_dbc'][1]
    pm_cache: Dict[Tuple[str, str], dict] = {}
    # skin sets per (source, model): the distinct texture_variation triples its display rows use there
    sets_of: Dict[Tuple[str, str], Dict[tuple, int]] = {}

    def skin_sets(src: str, path: str) -> Dict[tuple, int]:
        k = (src, path)
        if k not in sets_of:
            cdi, cmd = (stock_cdi, stock_cmd) if src == 'stock' or src not in srcs else (srcs[src].cdi, srcs[src].cmd)
            mids = {m for m, r in cmd.items() if ms.norm(str(r.get('model_path') or '')).replace('.mdx', '.m2') == path}
            out: Dict[tuple, int] = {}
            for r in cdi.values():
                if int(r.get('model_id') or 0) in mids:
                    t = tuple(str(r.get(f'texture_variation_{i}') or '') for i in (1, 2, 3))
                    if any(t):
                        out[t] = out.get(t, 0) + 1
            sets_of[k] = out
        return sets_of[k]

    n = 0
    for e in assets:
        for p in e.get('panes') or []:
            if p.get('model') and (p.get('sources') or [None])[0]:
                p['skin_sets'] = len(skin_sets(p['sources'][0], p['model']))
            info = rps.get(p.get('model') or '')
            src = next((x for x in p.get('sources') or [] if info and x in info['sources']), None)
            if not src:
                continue
            path = p['model']
            if (src, path) not in pm_cache:
                sk = srcs[src].assets.get(path[:-3] + '00.skin') if src in srcs else None
                pm_cache[(src, path)] = rp.mesh_variants(Path(sk).read_bytes()) if sk else {}
            row = srcs[src].cdi.get(p.get('display')) if p.get('display') is not None and src in srcs else None
            cg = int((row or {}).get('creature_geoset_data') or 0)
            nib = rp.retroport_nibbles(cg, pm_cache[(src, path)], retail.mesh_geosets(info['fdid']))
            p['retroport'] = {'fdid': info['fdid']}
            if info.get('extra_verts', {}).get(src):
                p['retroport']['extra_verts'] = info['extra_verts'][src]     # a small piece the pack added (not shipped)
            if info.get('added_anims', {}).get(src):
                p['retroport']['added_anims'] = info['added_anims'][src]     # the pack's own, covered by our aliases
            if any(nib):
                p['retroport']['mesh'] = [0] + nib
            n += 1
    # the Display editor's skin union for a retail model: every retroport pack's skin sets, staged
    # keyed by the RETAIL model's path (a renamed retroport's retail_path); approved donors (retroport.donors:
    # skins that fit retail's model though the pack's file is not a clean retroport) join them
    pub: Dict[str, dict] = {}
    by_path_, _ = retail.listfile()

    def add_sets(rpath: str, fdid: int, src: str, model: str, how: str):
        folder = model.rsplit('/', 1)[0]
        e_ = pub.setdefault(rpath, {'fdid': fdid, 'sets': []})
        for t, nd in sorted(skin_sets(src, model).items(), key=lambda kv: -kv[1]):
            cas = []
            for name in t:
                f = srcs[src].assets.get(f'{folder}/{name.lower()}.blp') if name and src in srcs else None
                cas.append(dep.store.put(Path(f)) if f else '')
            if any(cas):
                e_['sets'].append([list(t), cas, src, nd, model, how])

    for path, info in rps.items():
        for src in info['sources']:
            add_sets(info.get('retail_path', path), info['fdid'], src, path, 'retroport')
    for rpath, lst in rp.donors().items():
        if rpath in by_path_:
            for d_ in lst:
                add_sets(rpath, by_path_[rpath], d_['source'], d_['model'].lower(), 'approved')
    pub = {k: v for k, v in pub.items() if v['sets']}
    (v2 / 'retroports.json').write_text(json.dumps(pub, separators=(',', ':')))
    log(f'  retroports: {n:,} pack panes drawn as retail\'s model ({len(rps):,} retroport models, '
        f'{sum(len(v["sets"]) for v in pub.values()):,} pack skin sets offered on retail)')


def _sized(pn: dict, opt) -> dict:
    """A cached pane from before its option had a size (stock fallback cards) gets it now; and the option
    keys merged into it as the same look (asset_index._merge_same_look)."""
    if opt.meta.get('same_look'):
        pn['same_look'] = list(opt.meta['same_look'])
    if opt.size and not pn.get('size'):
        pn['size'] = opt.size
        if isinstance(pn.get('stats'), dict):
            pn['stats']['mb'] = round(opt.size / 1048576, 2)
            if opt.meta.get('version') and not pn['stats'].get('version'):
                pn['stats']['version'] = opt.meta['version']
    return pn


def _m2_size(f) -> int:
    """A fallback option's size the way the index counts it: the .m2 plus its .skin and .anim
    files beside it (a single-option stock model has no index option, so its card showed none)."""
    try:
        f = Path(f)
        stem = re.compile(re.escape(f.stem) + r'(\d\d\.skin|\d{4}-\d\d\.anim)$', re.I)
        return f.stat().st_size + sum(x.stat().st_size for x in f.parent.iterdir() if stem.match(x.name))
    except OSError:
        return 0


def _m2_meta(f) -> dict:
    try:
        with open(f, 'rb') as fh:
            h = fh.read(8)
        return {'version': int.from_bytes(h[4:8], 'little')} if h[:4] in (b'MD20', b'MD21') else {}
    except OSError:
        return {}


def display_entries(dep: 'Deployer', edits: Optional[dict], cnames: Dict[int, str]) -> List[dict]:
    """Displays tab: (1) REPOINTS - displays whose packs point them at different models; each
    distinct model is an option, drawn with that pack's own display rows; (2) creature-level
    edits - creatures our zpaks moved off a stock display, shown beside it read-only."""
    out = []
    srcs = {x.name: x for x in dep.result['sources']}
    compare: Dict[int, List[dict]] = {}
    for cid, e in sorted(((edits or {}).get('repointed') or {}).items()):
        for sd in e['stock']:
            for ld in e['live']:
                if ld not in e['stock']:
                    compare.setdefault(sd, []).append({'creature': cid, 'name': cnames.get(cid, ''), 'display': ld,
                                                       'provenance': e.get('provenance', [])})
    cdi_eff, cmd_eff = dep.result['effective_dbc']
    # displays a pack stranded on a model it upgrades everywhere else: completed rows
    # (lib/repoint_complete), injected into that pack's rows so its pane draws them
    from lib import repoint_complete as rc
    comp = rc.completions(dep.result)
    completed: Dict[int, Dict[str, str]] = {}
    for sname, rows in comp.items():
        src = srcs.get(sname)
        if src is None:
            continue
        for cdid, over in rows.items():
            base = dict(src.cdi.get(cdid) or dep.result['stock_dbc'][0].get(cdid) or {})
            base.update(over)
            src.cdi[cdid] = base
            mrow = src.cmd.get(over['model_id']) or dep.result['stock_dbc'][1].get(over['model_id'])
            if mrow:
                completed.setdefault(cdid, {})[sname] = ms.norm(str(mrow.get('model_path') or ''))
    stock_paths = {ms.norm(str(r.get('model_path') or '')) for r in dep.result['stock_dbc'][1].values()}
    # the remaster lookup's community half: a model a pack moved MOST of a stock model's displays onto
    # is offered to that model's other displays (lib/repoint_complete.community_remasters)
    remasters = rc.remaster_options(dep.result)       # + modular rebuilds (rc.modular_variants)
    geo_l = None
    cust_c: Dict[str, dict] = {}
    def cust_of(path: str, o) -> Optional[dict]:
        # what Customise needs to edit a display on this option's model: geoset groups, skin slots
        if path not in cust_c:
            root = o.files.get(path)
            if root is None:
                cust_c[path] = None
            else:
                sk = o.files.get(path[:-3] + '00.skin')
                cust_c[path] = {'groups': skin_geosets(Path(str(root))) if sk is None else skin_geosets_file(sk),
                                'slots': _skin_slots(root)}
        return cust_c[path]
    for did, d in dep.result['displays'].items():
        if not isinstance(did, int) or d.get('kind', 'creature') != 'creature':
            continue
        by_path: Dict[str, List[str]] = {}
        for name, r in [('stock', d.get('stock')), *d.get('sources', {}).items()]:
            if r is not None and r.model_path and r.m2 is not None:
                if name in completed.get(did, {}):
                    continue
                by_path.setdefault(r.model_path, []).append(name)
        for name, tp in completed.get(did, {}).items():
            by_path.setdefault(tp, []).append(name)
        rem_here = [(sn, b, row) for sn, by in remasters.items() for b, row in (by.get(did) or {}).items()
                    if b not in by_path and sn in srcs]
        repoint = (len(by_path) > 1 or rem_here) and dep.names.get(did)
        if not repoint and did not in compare:
            continue
        panes = []
        if repoint:
            sp = d['stock'].model_path if d.get('stock') else ''
            reused = {path for path, names in by_path.items() if 'stock' not in names and all(
                reuses_display(sp, path, (srcs[n].cdi.get(did) or {}).get('extended_display_info_id'), stock_paths)
                for n in names if n in srcs)}
            # sources that keep this display on one PATH but ship different FILES (stock vs
            # patch-hd-everything kobold.m2) are separate cards: one per file option
            split_: List[Tuple[str, List[str]]] = []
            for path, names in by_path.items():
                a = dep.ix.meshes.get(path)
                if a is not None and len(a.options) > 1 and len(names) > 1:
                    groups_f: Dict[str, List[str]] = {}
                    for n in names:
                        o_ = a.option_of(n)
                        groups_f.setdefault(o_.key if o_ is not None else n, []).append(n)
                    split_ += [(path, ns) for ns in groups_f.values()] if len(groups_f) > 1 else [(path, names)]
                else:
                    split_.append((path, names))
            for path, names in sorted(split_, key=lambda kv: (kv[1][0] != 'stock', kv[0] in reused, kv[0], kv[1])):
                a = dep.ix.meshes.get(path)
                o = (a.option_of(names[0]) if a else None) or dep.picks.mesh(path)
                fpick = None
                if o is None:
                    f = ms.stock_asset(path) if names[0] == 'stock' else srcs[names[0]].assets.get(path)
                    if f is None:
                        continue
                    o = ai.Option('d' + path[-11:], [names[0]], {path: f}, _m2_size(f), _m2_meta(f))
                pn = dep.pane(path, o, did, dbc_source=names[0])
                if pn:
                    # a path split by file gets a key per file (the model path stays pn['model'])
                    pn['option'] = path if sum(1 for p_, _ in split_ if p_ == path) == 1 else f"{path}#{'+'.join(names)}"
                    pn['sources'] = names
                    if fpick:
                        pn['file_pick'] = fpick
                    done_by = [n for n in names if completed.get(did, {}).get(n) == path]
                    if done_by:
                        pn['completed'] = done_by       # we finished this pack's repoint
                    if path in reused:
                        pn['reused'] = True             # I-390: the pack put another creature on this id
                    pn['cust'] = cust_of(path, o)
                    pn['tex_key'] = tex_key(path, names)
                    srow_ = (srcs[names[0]].cdi.get(did) if names[0] in srcs else dep.result['stock_dbc'][0].get(did)) or {}
                    if names[0] in completed.get(did, {}) or not srow_:
                        srow_ = cdi_eff.get(did) or srow_
                    pn['skin_names'] = [str(srow_.get(f'texture_variation_{k}') or '') for k in (1, 2, 3)]
                    ext_ = int(srow_.get('extended_display_info_id') or 0)
                    if path.startswith('character/') and ext_:
                        cdx_ = srcs[names[0]].cdx if names[0] in srcs and srcs[names[0]].cdx else dep.result['stock_char_dbc'][0]
                        x_ = cdx_.get(ext_) or dep.result['effective_char_dbc'][0].get(ext_)
                        if x_:
                            if geo_l is None:
                                geo_l = mvd._geo_lookups('effective')
                            pn['char'] = char_info(x_, *geo_l)
                            try:
                                from lib import outfitter335
                                pn['char']['cs'] = outfitter335.char_layers(dep, x_, ({**dep.result['stock_char_dbc'][1], **srcs[names[0]].chs} if names[0] in srcs and srcs[names[0]].chs else dep.result['effective_char_dbc'][1]))
                                pn['char']['outfit'] = {s_: int(x_.get(c_) or 0) for s_, c_ in outfitter335.CDX_COL.items() if int(x_.get(c_) or 0)}
                            except Exception:
                                pass
                    panes.append(pn)
            for sn, b, row in rem_here:
                a_ = dep.ix.meshes.get(b)
                o = a_.option_of(sn) if a_ else None
                if o is None:
                    f = srcs[sn].assets.get(b)
                    if f is None:
                        continue
                    o = ai.Option('r' + b[-11:], [sn], {b: f}, _m2_size(f), _m2_meta(f))
                pn = dep.pane(b, o, did, dbc_source=sn, row_over={k: v for k, v in row.items() if not k.startswith('_')})
                if pn:
                    pn['option'] = b
                    pn['sources'] = [sn]
                    pn['remaster'] = {'of': d['stock'].model_path if d.get('stock') else '', 'moved': row.get('_moved', 0)}
                    if row.get('_modular'):
                        pn['remaster']['modular'] = row['_modular']   # a modular rebuild of that model (I-392)
                    pn['cust'] = cust_of(b, o)
                    pn['tex_key'] = tex_key(b, [sn])
                    pn['skin_names'] = [str(row.get(f'texture_variation_{k}') or '') for k in (1, 2, 3)]
                    panes.append(pn)
        cmp_panes = []
        for c in compare.get(did, [])[:3]:
            row = cdi_eff.get(c['display'])
            mrow = cmd_eff.get(int(row.get('model_id') or 0)) if row else None
            if not mrow:
                continue
            path = ms.norm(str(mrow.get('model_path') or ''))
            o = dep.picks.mesh(path) or (ai.Option('live', ['live'], {path: dep.result['effective_assets'].get(path) or ms.stock_asset(path)})
                                         if (dep.result['effective_assets'].get(path) or ms.stock_asset(path)) else None)
            if o is None:
                continue
            pn = dep.pane(path, o, c['display'])
            if pn:
                pn['compare'] = c
                cmp_panes.append(pn)
        if len(panes) < 2 and not cmp_panes:
            continue
        mvd._pane_cameras(panes + cmp_panes)
        cur_path = None
        row = cdi_eff.get(did)
        if row:
            mrow = cmd_eff.get(int(row.get('model_id') or 0))
            cur_path = ms.norm(str(mrow.get('model_path') or '')) if mrow else None
        out.append({'id': f'display:{did}', 'tab': 'display', 'display': did, 'path': f'display:{did}',
                    'names': dep.names.get(did, [])[:6], 'kw': ' '.join(dep.names.get(did, [])[6:120]).lower(),
                    'members': [], 'displays': 1,
                    'current': cur_path, 'panes': panes, 'compare': cmp_panes})
    # src_partial: a pack that moves this display keeps other USED displays of the same stock
    # model where they are (tiger.m2: 15 of 58 move to tiger2), or sends them to several models
    # (frostsabre -> tiger2 + frostsabre2) - not a model swap, so the target
    # model's file is chosen here, per display, not on its model card (the picker's rule)
    by_src: Dict[str, List[int]] = {}
    for d_, x_ in dep.result['displays'].items():
        st_ = x_.get('stock') if isinstance(d_, int) else None
        if st_ is not None and st_.model_path and dep.names.get(d_):
            by_src.setdefault(st_.model_path, []).append(d_)
    kept: Dict[Tuple[str, str], bool] = {}
    def _kept(pack: str, sp: str) -> bool:
        # split = some displays stay, or the moved ones go to more than one model (felbat rule)
        if (pack, sp) not in kept:
            to = set()
            for d_ in by_src.get(sp, []):
                r_ = (dep.result['displays'][d_].get('sources') or {}).get(pack)
                to.add((r_.model_path or sp) if r_ is not None else sp)
            kept[(pack, sp)] = sp in to or len(to) > 1
        return kept[(pack, sp)]
    for e in out:
        if len(e['panes']) > 1:
            sp = e['panes'][0].get('model')
            e['src_partial'] = any(_kept(x, sp) for pn in e['panes'][1:] for x in pn.get('sources', []) if x not in ('stock', 'retail'))
    # look groups: displays with an identical STOCK look (model, skins, geoset data, bake) AND identical
    # options are one decision - the picker queues the group once and applies a pick to every member
    scdi_, scmd_ = dep.result['stock_dbc']
    groups_: Dict[tuple, List[dict]] = {}
    for e in out:
        r_ = scdi_.get(e['display'])
        m_ = scmd_.get(int((r_ or {}).get('model_id') or 0)) if r_ else None
        if not m_ or not e['panes']:
            continue
        look = (ms.norm(str(m_.get('model_path') or '')),
                *[str(r_.get(f'texture_variation_{k}') or '').lower() for k in (1, 2, 3)],
                int(r_.get('creature_geoset_data') or 0), int(r_.get('extended_display_info_id') or 0))
        opts = tuple(sorted((p.get('option'), tuple(sorted(p.get('sources') or [])), tuple(p.get('skin_names') or []))
                            for p in e['panes']))
        groups_.setdefault((look, opts), []).append(e)
    for es in groups_.values():
        if len(es) > 1:
            ids = sorted(x['display'] for x in es)
            for x in es:
                x['look_group'] = ids
    return out


def retail_only(dep: 'Deployer', entries: List[dict], offered=()) -> List[list]:
    """Retail models the 3.3.5 client and our sources do not have, for shopping new content:
    [path, tab, fdid, [skins x3]] (creature skins from the first retail display using the file)."""
    from lib import retail
    by_path, _ = retail.listfile()
    # offered = retail remasters already shown on a classic model's listing (wendigo_02 on wendigo)
    have = {e['path'] for e in entries} | set(dep.ix.stock) | set(dep.ix.meshes) | set(offered)
    retail.display_row(0)                                     # loads retail CreatureDisplayInfo
    skins: Dict[int, List[int]] = {}
    for did in sorted(retail._cdi):
        mf, tex = retail._cdi[did]
        if mf and any(tex) and mf not in skins:
            skins[mf] = tex[:3]
    out = []
    for p, fd in sorted(by_path.items()):
        if not p.endswith('.m2') or p in have or not p.startswith(('creature/', 'world/')):
            continue
        tab = tab_of(p)
        out.append([p, tab, fd, skins.get(fd, [0, 0, 0]) if tab == 'creature' else [0, 0, 0]])
    return out


def publish_retail_sets(v2: Path, log: Callable = print) -> int:
    """data/v2/retail_sets.json: what the Display editor needs to dress ANY retail creature model the moment it
    is picked from "Search all models" (no deploy in between). DB2 only, no model downloads (~2 s):
      {sets: {fdid: [[skins x3, displays, [[[[geoset index, value]], displays]]]]},   up to 40 sets, commonest first
       thumb: {fdid: retail display id}  (Wowhead's webthumbs/npc render of that display),
       folder: {fdid: [blp fdid]}         (models no retail display uses: their folder's textures),
       names: {texture fdid: file stem}}
    The browser reads the model's own geosets / animations / texture types straight from wago.tools and
    translates the geoset pairs to 3.3.5 nibbles for that mesh (retail.to_335_nibbles, ported)."""
    from collections import Counter
    from lib import retail
    by_path, by_id = retail.listfile()
    retail.display_row(0)
    by_m: Dict[int, List[int]] = {}
    for did, (mf, _) in retail._cdi.items():
        by_m.setdefault(mf, []).append(did)
    cre = sorted({fd for p_, fd in by_path.items() if p_.startswith('creature/') and p_.endswith('.m2')})
    blps: Dict[str, List[int]] = {}
    for p_, fd in by_path.items():
        if p_.startswith('creature/') and p_.endswith('.blp'):
            blps.setdefault(p_.rsplit('/', 1)[0], []).append(fd)
    sets, thumb, folder, tex = {}, {}, {}, set()
    for fd in cre:
        dids = sorted(by_m.get(fd, []))
        if not dids:
            fl = sorted(blps.get(by_id.get(fd, '').rsplit('/', 1)[0], []))[:60]
            if fl:
                folder[fd] = fl
                tex.update(fl)
            continue
        by_set: Dict[tuple, Counter] = {}
        first: Dict[tuple, int] = {}
        for did in by_m[fd]:                           # retail's row order, as skin_sets_geo counts (ties)
            t_ = tuple(retail._cdi[did][1][:3])
            if not any(t_):
                continue
            by_set.setdefault(t_, Counter())[tuple(retail.geoset_data(did))] += 1
            first.setdefault(t_, did)
        # every raw geoset choice with its count: the browser translates them for the mesh FIRST, then takes the
        # commonest (two raw choices can be one 3.3.5 look - wendigo2's 1604204 set)
        rows = sorted(([list(k), sum(c.values()), [[[list(x) for x in g], n] for g, n in c.items()]] for k, c in by_set.items()),
                      key=lambda x: (-x[1], x[0]))[:40]
        sets[fd] = rows
        thumb[fd] = first[tuple(rows[0][0])] if rows else dids[0]
        for r_ in rows:
            tex.update(x for x in r_[0] if x)
    names = {f: by_id[f].rsplit('/', 1)[-1][:-4] for f in tex if f in by_id}
    (v2 / 'retail_sets.json').write_text(json.dumps({'sets': sets, 'thumb': thumb, 'folder': folder, 'names': names},
                                                    separators=(',', ':')))
    log(f'  retail sets: {len(sets):,} retail creature models dressed, {len(folder):,} by folder (Search all models)')
    return len(sets)


def publish_retail_index(out_root: Path, assets: List[dict], log: Callable = print, dep_displays=None, dep=None) -> int:
    """data/v2/retail.json: {build, models: {path: fdid}, skins: {display: [fdid x3]}} for the
    creature/object assets, so the picker shows a LIVE Retail pane straight from wago.tools
    (CORS-open) the moment a comparison opens. No model downloads here: the WXL-converted
    file is made only when Retail is picked (zep model curate)."""
    from lib import retail
    by_path, _ = retail.listfile()
    # Retail = the REMASTER: a new file retail moved every one of the model's displays to
    # (the retail copy of the same path is mostly the old model again)
    models, skins, names = {}, {}, {}
    _, by_id = retail.listfile()
    for e in assets:
        if e.get('tab') != 'creature' or not e.get('display'):
            continue
        fd = retail.remaster(e['path'], dep_displays(e['path']))
        if not fd:
            continue
        models[e['path']] = fd
        names[str(fd)] = by_id.get(fd, '')
        ds_ = dep_displays(e['path'])
        cdi_e = dep.result['effective_dbc'][0] if dep is not None else {}
        t = retail.sibling_textures(int(e['display']), fd, ds_, lambda d: tuple(
            str((cdi_e.get(int(d)) or {}).get(f'texture_variation_{k}') or '').lower() for k in (1, 2, 3)))
        if any(t):
            skins[str(e['display'])] = t
    named = named_remaster_index(dep, dict(models), log) if dep is not None else {}
    for v in named.values():                                 # the picker labels targets and skins by path
        for t in v['targets']:
            names[str(t[1])] = by_id.get(t[1], '')
            for st in t[3]:                                  # [skins, displays(, geoset nibbles)]
                for fd in st[0]:
                    if fd:
                        names[str(fd)] = by_id.get(fd, '')
    (out_root / 'data' / STAGE / 'retail.json').write_text(json.dumps(
        {'build': retail.build(), 'models': models, 'skins': skins, 'names': names, 'named': named},
        separators=(',', ':')))
    log(f'  retail (live): {len(models):,} models have a retail remaster, {len(named):,} more by name (per display)')
    return len(models)


def named_remaster_index(dep: 'Deployer', skip: set, log: Callable = print) -> Dict[str, dict]:
    """Remasters found by NAME (retail.named_remasters, plus the retail models in the folders of the pack
    models its displays are moved to - retail.folder_remasters) for stock creature models the display rule
    misses, keyed by the STOCK model path - a display a zpak already repointed (I-154 Landslide ->
    mountaingiant_howling) is still offered its stock model's remaster:
      {path: {stock_anims, displays: [[did, names, stock skins]],
              targets: [[path, fdid, retail displays, [[skins x3, displays]], anims]]}}"""
    from lib import retail
    scdi, scmd = dep.result['stock_dbc']
    by_stock: Dict[str, List[int]] = {}
    for did, row in scdi.items():
        mrow = scmd.get(int(row.get('model_id') or 0))
        if mrow and dep.names.get(did):
            by_stock.setdefault(ms.norm(str(mrow.get('model_path') or '')), []).append(did)
    # the pack models each stock model's displays are moved to: their retail originals are leads too
    stock_paths = {ms.norm(str(r.get('model_path') or '')).replace('.mdx', '.m2') for r in scmd.values()}
    pack_to: Dict[str, set] = {}
    moved_n: Dict[Tuple[str, str], int] = {}
    for did_, d_ in dep.result['displays'].items():
        st_ = d_.get('stock') if isinstance(did_, int) else None
        if st_ is None or not st_.model_path:
            continue
        for r_ in {r_.model_path: r_ for r_ in (d_.get('sources') or {}).values() if r_ is not None and r_.model_path}.values():
            if r_.model_path != st_.model_path:
                moved_n[(st_.model_path, r_.model_path)] = moved_n.get((st_.model_path, r_.model_path), 0) + 1
    for (sp_, tp_), n_ in moved_n.items():
        # a lead only when a pack moves at least half the model's named displays there: one peasant display
        # moved onto medivh.m2 must not offer medivh2 as hufmcitizenlow's remaster
        # (and the two must be the same creature by name: a pack REUSING display 13 for Medivh is not a remaster)
        if tp_ not in stock_paths or (2 * n_ >= max(1, len(by_stock.get(sp_, []))) and retail._related(sp_, tp_)):
            pack_to.setdefault(sp_, set()).add(tp_)
    out: Dict[str, dict] = {}
    for path, dids in sorted(by_stock.items()):
        if not path.startswith('creature/'):
            continue
        rule = path in skip            # retail MOVED these displays to a remaster: a model-level pick too
        targets = [] if not rule else [(t_, fd_) for t_, fd_ in [(retail.listfile()[1].get(skip[path], ''), skip[path])] if fd_]
        if not rule:
            targets = list(retail.named_remasters(path))
        for pp in sorted(pack_to.get(path, ())):
            # a pack model at a NEW path: the retail models of its folder; a pack that moves the displays
            # onto ANOTHER STOCK model (patch-hd-creatures-mounts: basilisk_outland -> basilisk) points at
            # that model's own by-name remasters (basilisk2)
            leads = retail.named_remasters(pp) if pp in stock_paths else retail.folder_remasters(pp, stock_paths)
            for t_ in leads:
                if t_[0] not in {x[0] for x in targets} and t_[0] != path:
                    targets.append(t_)
        # leads from a DISPLAY's own creature / skin name (8269 Molten Giant on mountaingiant.m2 ->
        # creature/moltengiant/moltengiant.m2): offered on those displays only (target field 6 = `only`)
        only: Dict[str, List[int]] = {}
        for did_ in dids:
            skins_ = [str((scdi.get(did_) or {}).get(f'texture_variation_{k}') or '') for k in (1, 2, 3)]
            for t_ in retail.name_remasters(list(dep.names.get(did_, [])) + skins_):
                if t_[0] != path and t_[0] not in stock_paths and t_[0] not in {x[0] for x in targets}:
                    only.setdefault(t_[0], [])
                    if did_ not in only[t_[0]]:
                        only[t_[0]].append(did_)
        by_path_ = retail.listfile()[0]
        targets = targets + [(t_, by_path_[t_]) for t_ in sorted(only)]
        if not targets:
            continue
        sf = ms.stock_asset(path)
        rows = []
        for tp, fd in targets:
            sets_g, groups_g = retail.skin_sets_geo(fd)
            for g_, vs_ in retail.mesh_geosets(fd).items():      # every variant the mesh has, not only the used ones
                groups_g[g_] = sorted(set(groups_g.get(g_, [])) | set(vs_))
            # [path, fdid, retail displays, [[skins, displays, geoset nibbles]], anims, {group: values}]
            rows.append([tp, fd, retail.retail_displays(fd), sets_g[:40], retail.retail_anim_ids(fd), groups_g]
                        + ([sorted(only[tp])] if tp in only else []))
        dids.sort(key=lambda d: (-len(dep.names.get(d, [])), d))
        out[path] = {'rule': rule, 'stock_anims': retail.anim_ids(sf.read_bytes()) if sf else [],
                     'displays': [[d, dep.names.get(d, [])[:3],
                                   [str((scdi.get(d) or {}).get(f'texture_variation_{k}') or '') for k in (1, 2, 3)]]
                                  for d in dids[:200]],
                     'targets': rows}
    return out


def skin_geosets(m2: Path) -> Dict[int, List[int]]:
    """Geoset values per group in a model's first skin: {group: [values]} (group = id // 100)."""
    import struct
    sk = m2.with_name(m2.name[:-3] + '00.skin') if m2.name.endswith('.m2') else None
    if sk is None or not sk.exists():
        return {}
    data = sk.read_bytes()
    if data[:4] != b'SKIN':
        return {}
    n, o = struct.unpack_from('<II', data, 28)
    out: Dict[int, set] = {}
    for i in range(n):
        gid = struct.unpack_from('<H', data, o + 48 * i)[0]
        out.setdefault(gid // 100, set()).add(gid % 100)
    return {g: sorted(v) for g, v in sorted(out.items())}


def customise_entries(dep: 'Deployer', assets: List[dict]) -> List[dict]:
    """Layer 3 (per display): creature geoset groups / character hair + facial hair.
    Each entry previews on its mesh's current pane (geosets via the pane's mesh param)."""
    out = []
    cdi, cmd = dep.result['effective_dbc']
    cdx = dep.result['effective_char_dbc'][0]
    by_path = {}
    for e in assets:
        if e['tab'] in ('creature', 'character'):
            if not e['panes']:
                continue
            pn = next((x for x in e['panes'] if x['option'] == e['current']), e['panes'][0])
            by_path[e['path']] = pn
    hair_t, facial_t = mvd._geo_lookups('effective')
    slots_c: Dict[str, List[int]] = {}
    for path, pn in by_path.items():
        o = dep.picks.mesh(path)
        root = o.files.get(path) if o else None
        sk = o.files.get(path[:-3] + '00.skin') if o else None
        if root is None:
            # a single-option model (the All catalogue: stock hufmcitizenlow for display 13) has no
            # pick to resolve; its one file is the stock one
            root = ms.stock_asset(path)
            sk = ms.stock_asset(path[:-3] + '00.skin') if root is not None else None
        if root is None:
            continue
        groups = skin_geosets(Path(str(root))) if sk is None else skin_geosets_file(sk)
        for did in dep.displays_of(path):
            nm = dep.names.get(did, [])
            if not nm:
                continue
            row = cdi.get(did) or {}
            e = {'display': did, 'path': path, 'names': nm[:4], 'groups': groups}   # pane: the mesh entry's current one
            if len(nm) > 4:
                e['kw'] = ' '.join(nm[4:120]).lower()          # every creature on it is searchable
            e['skins'] = [str(row.get(f'texture_variation_{k}') or '') for k in (1, 2, 3)]
            e['slots'] = slots_c.setdefault(path, _skin_slots(root))
            e['tex_key'] = tex_key(path, o.sources if o else [])
            ext = int(row.get('extended_display_info_id') or 0)
            x = cdx.get(ext) if ext else None
            if x:
                e['char'] = char_info(x, hair_t, facial_t)
                try:
                    from lib import outfitter335
                    e['char']['cs'] = outfitter335.char_layers(dep, x, dep.result['effective_char_dbc'][1])
                    e['char']['outfit'] = {s_: int(x.get(c_) or 0) for s_, c_ in outfitter335.CDX_COL.items() if int(x.get(c_) or 0)}
                except Exception:
                    pass
            else:
                cgd = int(row.get('creature_geoset_data') or 0)
                e['cgd'] = [(cgd >> (4 * k)) & 0xF for k in range(8)]
            out.append(e)
    return out


def char_info(x: dict, hair_t, facial_t) -> dict:
    """Customise's character facts for one CreatureDisplayInfoExtra row: its look and the hair /
    facial-hair choices (with their geosets) of its race and sex."""
    race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
    _, races_, _ = mvd._load_item_lookups()
    return {'race': race, 'gender': sex, 'prefix': str(races_.get(race, '')).lower(), 'hair_style': int(x.get('hair_style') or 0),
            'facial_hair': int(x.get('facial_hair') or 0), 'hair_color': int(x.get('hair_color') or 0),
            'hair_options': sorted({k[2] for k in hair_t if k[:2] == (race, sex)}),
            'facial_options': sorted({k[2] for k in facial_t if k[:2] == (race, sex)}),
            'hair_geo': {str(k[2]): v[0] for k, v in hair_t.items() if k[:2] == (race, sex)},
            'facial_geo': {str(k[2]): list(v[:3]) for k, v in facial_t.items() if k[:2] == (race, sex)}}


def flag_texture_misfits(dep: 'Deployer', assets: List[dict], log: Callable = print) -> None:
    """pane['misfit']: explicit texture picks that do not fit that card's mesh option. The card is drawn
    as it would ship (patch-hd-everything's ancientofloreskin, painted for its own mesh, scrambles the
    stock ancient of lore), so it must say why. Few picks -> a cheap pass over the affected cards."""
    ix, picks = dep.ix, dep.picks
    by_mesh: Dict[str, List[Tuple[str, object]]] = {}
    for tex, key in picks.tex_choice.items():
        a = ix.textures.get(tex)
        o = next((x for x in (a.options if a else []) if x.key == key), None)
        if o is None:
            continue
        for kind, m in ix.tex_refs.get(tex, ()):
            if kind == 'mesh':
                by_mesh.setdefault(m, []).append((tex, o))
    n = 0
    for e in assets:
        for p in e.get('panes') or []:
            m = p.get('model')
            if m not in by_mesh:
                continue
            am = ix.meshes.get(m)
            mo = next((am.option_of(sn) for sn in (p.get('sources') or []) if am and am.option_of(sn)), None) if am else None
            if mo is None:
                continue
            used = dep.maps.get(p.get('map'), {})            # the card's own file map: textures it loads
            bad = sorted(t for t, o in by_mesh[m] if t in used and not ix.compatible(t, o, m, mo))
            if bad:
                p['misfit'] = bad; n += 1
    log(f'  texture misfits: {n:,} cards where an explicit texture pick does not fit the mesh')


def merge_resaves(dep: 'Deployer', assets: List[dict], log: Callable = print) -> None:
    """A pack option that RENDERS the same as stock (lib/m2_same: a tool re-save - padding, offsets,
    re-cased texture names, flag 0x80) is not a choice: its sources join the stock card (resaves) and
    the card goes. A model left with one card has nothing to decide. Cached per pack file."""
    from lib.m2_same import same_render
    meta = dep.ix._meta_cache()
    n = models = 0
    for e in assets:
        if e.get('tab') == 'display' or len(e.get('panes') or []) < 2:
            continue
        path = e['path']
        a = dep.ix.meshes.get(path)
        st = next((p for p in e['panes'] if 'stock' in p.get('sources', [])), None)
        so = a.option_of('stock') if a else None
        if a is None or st is None or so is None or not path.endswith('.m2'):
            continue
        sk = path[:-3] + '00.skin'
        if path not in so.files or sk not in so.files:
            continue
        keep = []
        for p in e['panes']:
            if p is st:
                keep.append(p); continue
            o = next((a.option_of(x) for x in p.get('sources', []) if a.option_of(x)), None)
            if o is None or path not in o.files or sk not in o.files:
                keep.append(p); continue
            same = meta.get('resave1|' + str(so.files[path]), o.files[path], lambda f, o=o: same_render(
                so.files[path].read_bytes(), so.files[sk].read_bytes(), f.read_bytes(), o.files[sk].read_bytes()))
            if same:
                st['sources'] = st['sources'] + [x for x in p['sources'] if x not in st['sources']]
                st.setdefault('resaves', []).extend(p['sources'])
                n += 1
            else:
                keep.append(p)
        if len(keep) != len(e['panes']):
            e['panes'] = keep
            models += 1
            if len(keep) == 1:
                e['single'] = True
    log(f'  re-saves: {n:,} pack options render the same as stock (merged into the stock card on {models:,} models)')


def flag_unique(dep: 'Deployer', assets: List[dict], log: Callable = print) -> None:
    """pane['unique'] (lib/m2_unique): on a model card, what a pack option changes from the stock
    option - [[kind, text]], kind 'minor' for re-export noise - so the card says what to look for
    (zangarmushroomtreesmall01: the additive glow layer removed). A model with no stock file is
    compared with its current pick (pane['unique_vs'] names it). Cached per option file."""
    from lib.m2_unique import unique
    meta = dep.ix._meta_cache()
    n = 0
    for e in assets:
        if e.get('tab') == 'display' or not e['path'].endswith('.m2'):
            continue
        a = dep.ix.meshes.get(e['path'])
        if a is None:
            continue
        by_key = {o.key: o for o in a.options}
        # no stock file (a pack-only model: Cata doodads): compare with the current pick, else the first
        so = a.option_of('stock') or by_key.get(e.get('current')) or a.options[0]
        vs = None if 'stock' in so.sources else ' + '.join(so.sources)
        for p in e.get('panes') or []:
            o = by_key.get(p.get('option'))
            if o is None or o is so or p.get('model') not in (None, e['path']):
                continue
            u = unique(so.files, o.files, e['path'], meta)
            if u is not None:
                p['unique'] = u
                if vs:
                    p['unique_vs'] = vs
                n += 1
    meta.save()
    log(f'  unique vs stock: {n:,} pack options described')


def add_outfits(dep: 'Deployer', assets: List[dict], cat: List[dict], log: Callable = print) -> None:
    """pane['outfit'] (lib/npc_outfit): a character-model display's items from its bake row (exact),
    or, on a STOCK pane of a character clone baked into a creature model, the items its skin matches."""
    from lib.npc_outfit import Outfits, FUSED, race_sex
    from lib.skin_fill import texture_table
    from lib.geoset_fix import mesh_geosets
    from PIL import Image
    import time as _t
    t0 = _t.time()
    # item textures the zpaks / packs add (goblin, worgen, wardrobe sets): searched with stock's
    extra = {k: f for s_ in dep.ix.sources for k, f in dep.ix._src_files(s_.name).items()
             if k.startswith('item/texturecomponents/') and k not in dep.ix.stock}
    out = Outfits(dep.ix.stock, dep.ix._meta_cache(), log, extra)
    out.idi(); log(f'    outfit: item displays loaded ({_t.time() - t0:.0f}s)')
    out.items(); log(f'    outfit: items loaded ({_t.time() - t0:.0f}s)')
    cdi_e = dep.result['effective_dbc'][0]
    cdx_e = dep.result['effective_char_dbc'][0]
    srcs = dep._srcs()
    clone: Dict[str, bool] = {}
    def walk():
        nonlocal n_exact, n_guess, n_fused
        n_exact = n_guess = n_fused = 0
        for i_, e in enumerate(assets + cat):
            if i_ % 5000 == 0:
                log(f'    outfit: {i_:,} entries, {n_exact:,} exact, {n_guess:,} matched ({_t.time() - t0:.0f}s)')
            for p in e.get('panes') or []:
                did, path = p.get('display'), p.get('model') or ''
                if did is None or 'outfit' in p:
                    continue
                row = cdi_e.get(did) or {}
                if path.startswith('character/'):
                    # the option's OWN display row and bake (display 213: patch-hd-creatures-mounts' humanfemale
                    # bake 1567, while the live row is still the stock peasant)
                    x = None
                    for sn in p.get('sources') or []:
                        sx = srcs.get(sn)
                        r_ = sx.cdi.get(did) if sx is not None else None
                        e_ = int((r_ or {}).get('extended_display_info_id') or 0)
                        if e_:
                            x = (sx.cdx or {}).get(e_) or cdx_e.get(e_)
                            if x:
                                break
                    if x is None and 'stock' in (p.get('sources') or []):
                        # a STOCK pane (the Display editor's reference): the stock row and stock bake
                        sr_ = dep.result['stock_dbc'][0].get(did) or {}
                        x = dep.result['stock_char_dbc'][0].get(int(sr_.get('extended_display_info_id') or 0))
                    if x is None:
                        x = cdx_e.get(int(row.get('extended_display_info_id') or 0))
                    if x:
                        rows = out.exact(x)
                        if rows:
                            put(p, rows); n_exact += 1
                elif path.rsplit('/', 1)[-1] in FUSED and 'stock' in (p.get('sources') or []):
                    # F-220: the rider baked into a mount model - its skin, hair and 3D pieces
                    f = dep.ix.stock.get(path)
                    if f is None:
                        continue
                    sr_ = dep.result['stock_dbc'][0].get(did) or row
                    folder = path.rsplit('/', 1)[0] + '/'
                    slots = [folder + str(sr_.get(f'texture_variation_{k}') or '').lower() + '.blp'
                             if sr_.get(f'texture_variation_{k}') else '' for k in (1, 2, 3)]
                    rows = out.fused(path, dep.ix._meta_cache().get('textab', f, lambda x: texture_table(x.read_bytes())), slots)
                    if rows:
                        put(p, rows); n_fused += 1
                elif path.startswith('creature/') and 'stock' in (p.get('sources') or []):
                    if path not in clone:
                        sk = dep.ix.stock.get(path[:-3] + '00.skin')
                        clone[path] = bool(sk) and out.is_char_clone(dep.ix._meta_cache().get(
                            'geoids', sk, lambda f: sorted(mesh_geosets(f.read_bytes()))), (256, 256))
                    if not clone[path]:
                        continue
                    stem = str(row.get('texture_variation_1') or '').lower()
                    f = dep.ix.stock.get(path.rsplit('/', 1)[0] + '/' + stem + '.blp') if stem else None
                    if f is None:
                        continue
                    try:
                        if Image.open(f).size != (256, 256):
                            continue
                    except Exception:
                        continue
                    rows = out.guess(f, 'f' if 'female' in path else 'm')
                    rs = race_sex(path)
                    if rs:
                        rows = out.with_lookalike(rows, f, *rs)
                    if any(r[1] or r[3] for r in rows):         # retail rows: no display id, an r:<item> item
                        put(p, rows); n_guess += 1

    put_done: List[dict] = []

    def put(p, rows):
        p['outfit'] = rows
        put_done.append(p)
    n_exact = n_guess = n_fused = 0
    # pass 1 only collects the look-alikes not cached yet; they are computed in parallel, then the
    # outfits are walked again from the cache (a cached deploy does one quick pass)
    out.collecting = True
    walk()
    out.collecting = False
    if out.look_jobs:
        log(f'    outfit: {len(out.look_jobs):,} look-alikes to compute ({_t.time() - t0:.0f}s)')
        out.prefetch_lookalikes(log=log)
        for p in put_done:
            p.pop('outfit', None)
        put_done.clear()
        walk()
    log(f'  outfit: {n_exact:,} panes from bake rows, {n_guess:,} matched from character-clone skins, '
        f'{n_fused:,} fused riders (F-220)')


def tex_key(path: str, sources) -> str:
    """customise_tex.json key: the model and the packs its textures come from (stock is the fallback)."""
    return path + '|' + ','.join(sorted(x for x in sources if x not in ('stock', 'retail')))


_SLOT_IX = None


def _skin_slots(root) -> List[int]:
    """Display-skin slots (0..2 = texture_variation_1..3) the model reads (texture types 11-13).
    Through the asset index's persistent MetaCache ('textab', the same entry fill_skins uses)."""
    from lib import skin_fill as sf
    try:
        f = Path(str(root))
        if _SLOT_IX is not None:
            return sf.needed(_SLOT_IX._meta_cache().get('textab', f, lambda x: sf.texture_table(x.read_bytes())))
        return sf.needed(sf.texture_table(f.read_bytes()))
    except OSError:
        return []


def creator_models(dep: 'Deployer', entries: List[dict], v2: Path, log: Callable = print) -> List[dict]:
    """The Display editor's display CREATOR: a new display id on any creature model of the catalogue.
      creator.json  {max_display: the highest CreatureDisplayInfo id anywhere (live, stock, any pack),
                     models: [[path, label, pane, {groups}, [slots], tex_key, names]]}
    -> customise_extras rows (path, slots, srcs) so the folder textures / skin sets are written too."""
    ids = [d for d in dep.result['displays'] if isinstance(d, int)]
    ids += list(dep.result['stock_dbc'][0])
    for sx in dep._srcs().values():
        ids += list(getattr(sx, 'cdi', None) or {})
    ids += list((dep.result.get('effective_dbc') or ({},))[0])          # the live DBC (ours included)
    out, extra = [], []
    for e in entries:
        if e.get('tab') != 'creature' or e.get('retailOnly') or not e.get('panes'):
            continue
        pn = next((x for x in e['panes'] if x.get('option') == e.get('current')), e['panes'][0])
        path = e['path']
        f = dep.ix.stock.get(path) or dep.result['effective_assets'].get(path)
        if f is None:
            continue
        sk = dep.ix.stock.get(path[:-3] + '00.skin') or dep.result['effective_assets'].get(path[:-3] + '00.skin')
        try:
            groups = skin_geosets(Path(str(f))) if sk is None else skin_geosets_file(sk)
        except Exception:
            groups = {}
        slots = _skin_slots(f)
        srcs = [x for x in (pn.get('sources') or []) if x not in ('stock', 'retail')]
        lite = {k: pn[k] for k in ('src', 'model', 'map', 'skins', 'scale', 'bbox', 'camera', 'option', 'sources', 'stats', 'items', 'display') if k in pn}
        out.append([path, label_of(pn.get('sources') or ['stock']), lite, groups, slots, tex_key(path, srcs), (e.get('names') or [])[:3]])
        if slots:
            extra.append({'path': path, 'slots': slots, 'srcs': pn.get('sources') or []})
    mx = max(ids) if ids else 0
    (v2 / 'creator.json').write_text(json.dumps({'max_display': mx, 'models': out}, separators=(',', ':')))
    log(f'  display creator: {len(out):,} creature models, highest display id {mx:,}')
    return extra


def display_bakes(dep: 'Deployer', mesh: str, ext: int) -> List[list]:
    """The NPC bakes a character display can ship - one per source whose bake row (ext) names a bake it
    ships - as curate weighs them (hd_curate_v2: the largest one compatible with the picked mesh, unless
    the display's pick names a source): [[source, cas, size, [mesh option keys it fits], {slot: cas}]]
    (the last: _bake_char_tex - that source's hair / extra skin).
    Packs replace character models IN PLACE and ship their own HD bake per display (5785: both HD packs
    ship creaturedisplayextra-03838_hd.blp), so a character display's real choice is its bake."""
    a = dep.ix.meshes.get(mesh)
    mopts = a.options if a else []
    out = []
    for src in ['stock'] + [x.name for x in dep.ix.sources if x.cdx]:
        cdx = dep.result['stock_char_dbc'][0] if src == 'stock' else dep._srcs()[src].cdx
        x = cdx.get(ext)
        if not x or not x.get('texture'):
            continue
        bp = 'textures/bakednpctextures/' + str(x['texture']).lower()
        f = (dep.ix.stock if src == 'stock' else dep.ix._src_files(src)).get(bp)
        if f is None:
            continue
        topt = ai.Option('b', [src], {bp: f}, f.stat().st_size)
        fits = [o.key for o in mopts if dep.ix.compatible(bp, topt, mesh, o)]
        classic = not bp.endswith('_hd.blp')
        # hair / extra skin as the MODEL it is drawn on ships them: a zpak with bakes only
        # (zep-npc-wardrobe) is drawn on a pack's HD model (or, classic, on stock), so it wears that
        # pack's files - its own fallback to stock put classic hair and no extra skin on HD UVs
        ctex = _bake_char_tex(dep, src, x)
        if src != 'stock' and not any(src in o.sources for o in mopts):
            ctex = {}
            if not classic:
                for o in mopts:
                    if o.key in fits and o.sources != ['stock']:
                        for s_ in o.sources:
                            ctex = _bake_char_tex(dep, s_, x) if s_ != 'stock' else {}
                            if '8' in ctex:
                                break
                        break
            if not ctex:
                ctex = _bake_char_tex(dep, 'stock', x)
        # 6th: a classic-layout bake (no _HD in the name) - drawn on the classic model (F-220 fake riders)
        out.append([src, dep.store.put(f), f.stat().st_size, fits, ctex, classic])
    return out


def _bake_char_tex(dep: 'Deployer', src: str, x: dict) -> Dict[str, str]:
    """{slot: cas} for the hair (6) and extra skin (8) the client reads from CharSections for this
    bake row, as SOURCE ships them. A pack's character model is re-UV'd for its own Hair00_xx /
    *_Extra.blp, so a pack card wearing the stock pane's files draws black tusks and classic hair
    on HD UVs (I-397: troll male 900401 - stock 3.3.5 has no TrollMaleSkin00_xx_Extra at all)."""
    stock_chs = dep.result['stock_char_dbc'][1]
    sx = None if src == 'stock' else dep._srcs().get(src)
    chs = {**stock_chs, **sx.chs} if sx is not None and sx.chs else stock_chs
    files = dep.ix.stock if sx is None else dep.ix._src_files(src)
    race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
    want: Dict[str, str] = {}
    for r in chs.values():
        if r.get('race') != race or r.get('gender') != sex:
            continue
        if (r.get('base_section') == 3 and r.get('type') == int(x.get('hair_style') or 0)
                and r.get('color_index') == int(x.get('hair_color') or 0) and r.get('texture_1')):
            want['6'] = ms.norm(str(r['texture_1']))
        if (r.get('base_section') == 0 and r.get('type') == 0
                and r.get('color_index') == int(x.get('skin_color') or 0) and r.get('texture_2')):
            want['8'] = ms.norm(str(r['texture_2']))
    out: Dict[str, str] = {}
    for slot, p in want.items():
        f = files.get(p) or dep.ix.stock.get(p)       # a pack ships only what it changes
        if f is not None:
            out[slot] = dep.store.put(f)
    return out


def label_of(sources: List[str]) -> str:
    return ' + '.join(sources)


def customise_extras(dep: 'Deployer', custom: List[dict], v2: Path, log: Callable = print, disp: Optional[List[dict]] = None,
                     models: Optional[List[dict]] = None, more: Optional[List[dict]] = None) -> None:
    """Customise layer, loaded on demand (not at startup):
      customise_tex.json   {tex: {path|packs: [[texture stem, cas name], ...]}, sets: {path|packs:
                           [[[skin1, skin2, skin3], displays], ...]}} - the folder's textures (to load
                           them) and the skin SETS used with the model (what the editor offers);
      custom_stock/<n>.json {display: pane} for displays n*1000..n*1000+999 - the STOCK look of the
                           display (stock model + stock row), shown beside the customisation."""
    folders: Dict[str, Dict[str, Path]] = {}
    def folder_index(files: Dict[str, Path]) -> Dict[str, List[Tuple[str, Path]]]:
        out: Dict[str, List[Tuple[str, Path]]] = {}
        for k, f in files.items():
            if k.endswith('.blp') and '/' in k:
                out.setdefault(k.rsplit('/', 1)[0], []).append((k.rsplit('/', 1)[1][:-4], f))
        return out
    by_src = {'stock': folder_index(dep.ix.stock)}
    tex: Dict[str, List[List[str]]] = {}
    sets: Dict[str, list] = {}
    from collections import Counter
    sc_cache: Dict[str, Dict[str, Counter]] = {}
    def set_counts(src: str) -> Dict[str, Counter]:
        # {model path: Counter(skin tuple)} over one source's display rows (stock: the stock DBC)
        if src not in sc_cache:
            sx = dep._srcs().get(src)
            cdi_, cmd_ = (sx.cdi, sx.cmd) if sx is not None else dep.result['stock_dbc']
            out_: Dict[str, Counter] = {}
            for r_ in cdi_.values():
                mr_ = cmd_.get(int(r_.get('model_id') or 0)) or dep.result['stock_dbc'][1].get(int(r_.get('model_id') or 0))
                if mr_:
                    mp_ = ms.norm(str(mr_.get('model_path') or '')).replace('.mdx', '.m2')
                    out_.setdefault(mp_, Counter())[tuple(str(r_.get(f'texture_variation_{k}') or '') for k in (1, 2, 3))] += 1
            sc_cache[src] = out_
        return sc_cache[src]
    # keyed per model AND option: a pack's texture is painted for that pack's mesh (patch-hd-everything's
    # humanfemalepeasant_bluedress on patch-hd-creatures-mounts' mesh = a broken look)
    extra = [{'path': p['model'], 'slots': (p.get('cust') or {}).get('slots'), 'srcs': p.get('sources') or []}
             for d in (disp or []) for p in d.get('panes', []) if (p.get('cust') or {}).get('slots')]
    # every file option on a creature model card: a display page draws those in its own skins
    slots_of = {e['path']: e.get('slots') for e in custom if e.get('slots')}
    extra += [{'path': m['path'], 'slots': slots_of[m['path']], 'srcs': p.get('sources') or []}
              for m in (models or []) for p in m.get('panes', []) if m['path'] in slots_of]
    extra += list(more or [])
    for e in list(custom) + extra:
        path = e['path']
        if not e.get('slots'):
            continue
        if 'srcs' in e:
            srcs_ = [x for x in e['srcs'] if x not in ('stock', 'retail')]
        else:
            o = dep.picks.mesh(path)
            srcs_ = [x for x in (o.sources if o else []) if x not in ('stock', 'retail')]
        tk = tex_key(path, srcs_)
        if tk in tex:
            continue
        folder = path.rsplit('/', 1)[0]
        seen: Dict[str, Path] = {}
        for src in srcs_ + ['stock']:
            if src not in by_src:
                by_src[src] = folder_index(dep.ix._src_files(src))
            for stem, f in by_src[src].get(folder, []):
                seen.setdefault(stem.lower(), f)
        tex[tk] = [[stem, dep.store.put(f)] for stem, f in sorted(seen.items())]
        # the skin SETS used with this model: the packs' own display rows on it, else stock's. The
        # editor offers only these, never a free per-slot mix (incompatible combinations)
        got = None
        for src in srcs_:
            c_ = set_counts(src).get(path)
            if c_:
                got = c_ if got is None else got + c_
        sets[tk] = [[list(k), n_] for k, n_ in (got or set_counts('stock').get(path) or Counter()).most_common(40) if any(k)]
    (v2 / 'customise_tex.json').write_text(json.dumps({'tex': tex, 'sets': sets}, separators=(',', ':')))
    # stock look per display
    stock_cdi, stock_cmd = dep.result['stock_dbc']
    chunks: Dict[int, Dict[str, dict]] = {}
    n = 0
    eff_cdi, eff_cmd = dep.result['effective_dbc']
    for e in custom:
        did = e['display']
        row = stock_cdi.get(did)
        own = row is None                             # our own display (9xxxxx): no stock row, so its own row
        if own:                                       # on the stock model file is its reference look
            row = eff_cdi.get(did)
        mrow = (eff_cmd.get(int(row.get('model_id') or 0)) or stock_cmd.get(int(row.get('model_id') or 0)) if own
                else stock_cmd.get(int(row.get('model_id') or 0))) if row else None
        sp = ms.norm(str((mrow or {}).get('model_path') or '')).replace('.mdx', '.m2')
        f = ms.stock_asset(sp) if sp else None
        if f is None:
            continue
        try:
            # our own display's reference resolves its other files normally, so its mesh option must
            # carry the WHOLE stock file set (.skin, .anim): a bare {.m2} let the HD pack's .skin in
            m_ = dep.ix.meshes.get(sp)
            so_ = next((o for o in (m_.options if m_ else []) if 'stock' in o.sources), None) if own else None
            pn = dep.pane(sp, so_ or ai.Option('stock:' + sp[-24:], ['stock'], {sp: f}), did,
                          dbc_source=None if own else 'stock', stock_only=not own)
            # our own display: the classic model as its reference, but its bake / item models /
            # item textures resolve normally - they ship in our zpaks (F-220 rider shoulders)
        except Exception:
            pn = None
        if pn:
            if not pn.get('camera'):
                mvd._pane_cameras([pn])               # the same framing every other pane gets
            if sp.startswith('character/') and int(row.get('extended_display_info_id') or 0):
                try:
                    pn['bakes'] = display_bakes(dep, sp, int(row['extended_display_info_id']))
                except Exception:
                    pass
            chunks.setdefault(did // 1000, {})[str(did)] = pn
            n += 1
    try:                                              # the reference panes get their outfit too
        add_outfits(dep, [{'panes': [pn for ch in chunks.values() for pn in ch.values()]}], [], log)
    except Exception as ex:
        log(f'  outfit (stock references): skipped - {ex}')
    d = v2 / 'custom_stock'
    d.mkdir(exist_ok=True)
    for k, v in chunks.items():
        (d / f'{k}.json').write_text(json.dumps(v, separators=(',', ':')))
    log(f'  customise: folder textures for {len(tex):,} models, stock look for {n:,} displays')


def skin_geosets_file(sk: Path) -> Dict[int, List[int]]:
    import struct
    data = sk.read_bytes()
    if data[:4] != b'SKIN':
        return {}
    n, o = struct.unpack_from('<II', data, 28)
    out: Dict[int, set] = {}
    for i in range(n):
        gid = struct.unpack_from('<H', data, o + 48 * i)[0]
        out.setdefault(gid // 100, set()).add(gid % 100)
    return {g: sorted(v) for g, v in sorted(out.items())}


def swap_v2(out_root: Path) -> None:
    """Put the freshly built data/v2.new in place of data/v2 (two renames, no gap to speak of)."""
    data = out_root / 'data'
    new, live, old = data / STAGE, data / 'v2', data / 'v2.old'
    if not new.exists():
        return
    if old.exists():
        shutil.rmtree(old)
    if live.exists():
        live.rename(old)
    new.rename(live)
    shutil.rmtree(old, ignore_errors=True)


def geoset_labels(v2: Path, log: Callable = print) -> int:
    """data/v2/geoset_labels.json {model path: {group: label}}: the names a pack gives its own
    model's geoset groups (model_transforms.json, "geoset_labels" on the .M2 recipe; I-392
    dragonspawn2_modular). The Display editor shows them in place of the bone-region guess."""
    out: Dict[str, Dict[str, str]] = {}
    for f in sorted((Path(__file__).resolve().parents[2] / 'zpaks').glob('*/model_transforms.json')):
        try:
            recipes = json.loads(f.read_text(encoding='utf-8-sig'))
        except (OSError, ValueError):
            continue
        for key, cfg in recipes.items():
            if isinstance(cfg, dict) and cfg.get('geoset_labels') and key.upper().endswith('.M2'):
                out[ms.norm(key)] = {str(g): str(t) for g, t in cfg['geoset_labels'].items()}
    (v2 / 'geoset_labels.json').write_text(json.dumps(out, separators=(',', ':')))
    log(f'  geoset labels: {len(out)} model(s) name their groups')
    return len(out)


def deploy_v2(result: dict, ix: ai.AssetIndex, out_root: Path, choices: dict, names: Dict,
              equipment: Dict, log: Callable = print, edits: Optional[dict] = None,
              cnames: Optional[Dict[int, str]] = None,
              mount_riders: Optional[Dict[int, List[Tuple[str, int]]]] = None) -> dict:
    dep = Deployer(result, ix, out_root, choices, names, equipment, log)
    global _SLOT_IX
    _SLOT_IX = ix                                     # _skin_slots reads through ix's MetaCache
    assets = dep.assets()
    disp = display_entries(dep, edits, cnames or {})
    log(f"  displays: {sum(1 for e in disp if len(e['panes']) > 1):,} repoints, "
        f"{sum(1 for e in disp if e['compare']):,} with creature-level edits")
    assets += disp
    # I-390: a display no in-game creature can show needs no decision (picker drops it from Undecided).
    # Only models some creature template uses are judged; a model with none may still be a spell or
    # doodad asset.
    reach = None
    try:
        from lib.display_reach import reachable_displays
        reach = reachable_displays(log)
        for e in assets:
            if e['tab'] == 'display':
                e['ingame'] = e['display'] in reach
            elif e['tab'] == 'creature' and e.get('displays_used'):
                e['ingame'] = any(x in reach for m in (e['members'] or [e['path']]) for x in dep.displays_of(m))
        log(f"  not in game: {sum(1 for e in assets if e.get('ingame') is False):,} entries leave Undecided")
    except Exception as ex:                                  # never block a deploy on it
        log(f'  in-game filter: skipped - {ex}')
    log(f'  assets: {len(assets):,} with >1 option, {dep.n_maps:,} panes')
    # the current option's pane of each mesh, for the texture tab's 3D view
    cur_pane: Dict[str, dict] = {}
    for e in assets:
        if not e['panes']:
            continue                  # compare-only Displays entries have nothing to pick
        pn = next((x for x in e['panes'] if x['option'] == e['current']), e['panes'][0])
        for m in e['members']:
            cur_pane[m] = pn
    textures = dep.textures(cur_pane)
    log(f'  textures: {len(textures):,} with >1 option')
    v2 = out_root / 'data' / STAGE
    (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
    for e in assets:
        if e['tab'] == 'item':
            e['variants'] = item_variants(dep, e)
            e['codes'] = sorted({_variant_code(m) for m in e['members']} - {''})
    bd = bodies(dep)
    riders(dep, bd, log)
    (v2 / 'bodies.json').write_text(json.dumps(bd, separators=(',', ':')))
    log(f'  bodies: {len(bd)} race/sex bodies for item fitting')
    (v2 / 'mountriders.json').write_text(json.dumps(linked_riders(dep, mount_riders or {}, log), separators=(',', ':')))
    (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
    cat = dep.catalog()
    try:
        merge_resaves(dep, assets, log)
    except Exception as ex:
        log(f'  re-saves: skipped - {ex}')
    try:
        flag_unique(dep, assets, log)
    except Exception as ex:                            # optional: cards just lack the "N unique" tag
        log(f'  unique vs stock: skipped - {ex}')
    try:
        add_outfits(dep, assets, cat, log)
    except Exception as ex:                            # optional: cards just lack the Outfit section
        log(f'  outfit: skipped - {ex}')
    (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
    # a stock model that packs repoint displays OFF (to a model of their own - often an HD remaster
    # under a new name: skeletonmage -> maldraxxusskeleton) has a real model-level choice even though
    # no pack ships a file of its name: give it a card in the chooser, not a catalogue row
    rep_src = {d['panes'][0].get('model') for d in assets if d.get('tab') == 'display' and d.get('panes')
               and 'stock' in d['panes'][0].get('sources', [])}
    have = {e['path'] for e in assets}
    moved = [e for e in cat if e.get('tab') == 'creature' and e['path'] in rep_src and e['path'] not in have]
    if moved:
        mset = {e['path'] for e in moved}
        cat = [e for e in cat if e['path'] not in mset]
        for e in moved:
            e.pop('single', None)
            e['repoint_source'] = True
            e['used_ids'] = [x for x in dep.displays_of(e['path']) if dep.names.get(x)][:400]
            e['displays_used'] = len(e['used_ids'])
            if reach is not None and e['displays_used']:          # I-390, as for the cards above
                e['ingame'] = any(x in reach for x in dep.displays_of(e['path']))
        assets += moved
        (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
        log(f'  repoint sources: {len(moved):,} stock models packs move displays off join the chooser')
    try:
        annotate_retroports(dep, assets, v2, log)
        (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
    except Exception as ex:                                  # a preview nicety: never block a deploy
        log(f'  retroports: skipped - {ex}')
    log(f'  catalogue: {len(cat):,} more models with a single option (All view)')
    try:
        publish_retail_index(out_root, assets + cat, log, dep.displays_of, dep)
    except Exception as ex:                                  # live retail is optional
        log(f'  retail (live): skipped - {ex}')
    try:
        publish_retail_sets(v2, log)
    except Exception as ex:
        log(f'  retail sets: skipped - {ex}')
    try:
        named_ = json.loads((v2 / 'retail.json').read_text()).get('named', {}) if (v2 / 'retail.json').exists() else {}
        ronly = retail_only(dep, assets + cat, {t[0] for n in named_.values() for t in n.get('targets', [])})
    except Exception as ex:
        ronly = []
        log(f'  retail-only catalogue: skipped - {ex}')
    log(f'  retail-only: {len(ronly):,} creature / object models not in the 3.3.5 client (live panes)')
    try:                                                     # search keywords (names, retail type/family, path words)
        from lib import model_keywords as mk
        for e in assets + cat:
            if e.get('path'):
                e['kw'] = mk.keywords(e['path'], e.get('names') or [])
        for r in ronly:
            r.append(mk.keywords(r[0], (), r[2]))
        (v2 / 'assets.json').write_text(json.dumps({'assets': assets}, separators=(',', ':')))
    except Exception as ex:
        log(f'  keywords: skipped - {ex}')
    (v2 / 'catalog.json').write_text(json.dumps({'stock': cat, 'retail': ronly}, separators=(',', ':')))
    try:                                              # the outfitter's browse grid (retail armour per slot)
        from lib import retail_wardrobe
        retail_wardrobe.build(v2 / 'wardrobe', log)
    except Exception as ex:
        log(f'  wardrobe: skipped - {ex}')
    try:                                              # the 3.3.5 outfitter: item displays + files for live bakes
        from lib import outfitter335
        outfitter335.build(dep, v2, log)
    except Exception as ex:
        log(f'  outfitter 3.3.5: skipped - {ex}')
    custom = customise_entries(dep, assets + cat)   # every used display, not only models with choices
    (v2 / 'customise.json').write_text(json.dumps({'displays': custom}, separators=(',', ':')))
    try:
        more = creator_models(dep, assets + cat, v2, log)
    except Exception as ex:
        log(f'  display creator: skipped - {ex}'); more = []
    customise_extras(dep, custom, v2, log, [e for e in assets if e.get('tab') == 'display'],
                     [e for e in assets if e.get('tab') == 'creature' and len(e.get('panes') or []) > 1], more)
    log(f'  customise: {len(custom):,} named displays')
    try:
        geoset_labels(v2, log)
    except Exception as ex:
        log(f'  geoset labels: skipped - {ex}')
    # textures: a light index for the list (filters/search) + detail shards loaded on demand
    CH = 400
    index = []
    for i in range(0, len(textures), CH):
        chunk = textures[i:i + CH]
        (v2 / 'tex' / f'{i // CH}.json').write_text(json.dumps(chunk, separators=(',', ':')))
        for t in chunk:
            flags = []
            if not t['current']:
                flags.append('none-compatible')
            elif not t['largest_compatible']:
                flags.append('largest-incompatible')
            index.append([t['path'], len(t['options']), t['current'], i // CH, flags, t['nrefs']])
    (v2 / 'textures_index.json').write_text(json.dumps(index, separators=(',', ':')))
    dep.save_cache()
    log(f'  panes: {dep.reused:,} reused from the last deploy, {dep.n_maps:,} rebuilt')
    # the per-file metadata cache (texture tables, BLP thumbnails) is only saved by an index BUILD;
    # a deploy reusing the index added to it and threw it away - 124 s of thumbnail decodes and 85 s of
    # .m2 reads every run (profile 2026-10-08)
    dep.ix._meta_cache().save()
    return {'assets': len(assets), 'textures': len(textures), 'maps': len(dep.used)}
