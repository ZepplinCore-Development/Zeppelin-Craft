"""F-216: community-pack models that are RETROPORTS of the current retail model.

A pack .m2 at a path retail also has, whose every vertex (position + UV) is one of retail's and whose
every animation retail also has: the pack downported retail's file (trimmed to the vertices its first
.skin uses, maybe reordered) and added nothing. Its skins
then fit retail's model as they are, so for a retroport the choice between the pack's file and retail's
is no choice: the curated build ships OUR WXL conversion of retail's model (lib/retail.convert: retail's
particle blends, decoded gravity, every LOD) and the pack keeps its skins and display rows. The pack's
own conversion forced particles additive (revenant2_earth / _fire / _water, revenantair2, imp3 ...).

A pack display row's geosets were written for the pack's trimmed mesh (a 0 nibble = every variant IT
kept); retroport_nibbles() turns them into nibbles that draw exactly those variants on retail's full mesh.

retroports(sources) -> {path: {'fdid': n, 'sources': [pack names]}}, cached per (pack file, retail
content) in logs/retroport_cache.pkl.
"""
import pickle
import struct
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

CACHE = Path('/workspace/project/logs/retroport_cache.pkl')
VERSION = 3                       # bump when is_retroport changes (2: animation guard; 3: aliases cover added anims)
TOLERANCE = 0.01                  # share of pack vertices allowed to miss retail's set: rounding, or a small piece
                                  # the pack added (maldraxxusskeleton: 16 of 3,943) - reported, not shipped
SKIP = ('stock', 'retail', 'effective', 'zep-hd-curated')
_cache: Optional[dict] = None


def _verts(d: bytes, base: int) -> Optional[set]:
    if len(d) < base + 0x48:
        return None
    n, o = struct.unpack_from('<II', d, base + 0x3C)
    if not n or base + o + 48 * n > len(d):
        return None
    out = set()
    for i in range(n):
        at = base + o + 48 * i
        x, y, z = struct.unpack_from('<3f', d, at)
        u, v = struct.unpack_from('<2f', d, at + 32)
        out.add((round(x, 3), round(y, 3), round(z, 3), round(u, 3), round(v, 3)))
    return out


def _anims(d: bytes, base: int) -> set:
    n, o = struct.unpack_from('<II', d, base + 0x1C)
    if base + o + 0x40 * n > len(d):
        return set()
    return {struct.unpack_from('<H', d, base + o + 0x40 * i)[0] for i in range(n)}


def compare(pack: bytes, retail_bytes: bytes) -> Optional[dict]:
    """None when the pack model is not a retroport of retail's, else {'extra_verts': n, 'added_anims': [...]}."""
    from lib import retail
    if pack[:4] != b'MD20':
        return None
    rb = 8 if retail_bytes[:4] == b'MD21' else 0
    if retail_bytes[rb:rb + 4] != b'MD20':
        return None
    # an animation the pack ADDED is fine only when our conversion adds the same id (retail.classic_standins:
    # maldraxxusskeleton's SpellCast 32, copied by hand from SpellCastOmni 54 - our alias does the same)
    ra = _anims(retail_bytes, rb)
    added = _anims(pack, 0) - ra
    if added - {x for x, _ in retail.classic_standins(ra)}:
        return None
    a, r = _verts(pack, 0), _verts(retail_bytes, rb)
    if not a or not r or len(a - r) > len(a) * TOLERANCE:
        return None
    return {'extra_verts': len(a - r), 'added_anims': sorted(added)}


def is_retroport(pack: bytes, retail_bytes: bytes) -> bool:
    return compare(pack, retail_bytes) is not None


RETAIL_INDEX = Path('/workspace/project/nginx/wow/modelviewer/data/v2/retail.json')
DONORS = Path(__file__).resolve().parents[2] / 'zpaks' / 'zep-hd-curated' / 'retail_skin_donors.json'


def remaster_candidates() -> Dict[str, List[Tuple[str, int]]]:
    """{stock model path: [(retail path, fdid)]} - the picker's remaster index (retail.json 'named': by
    display rule, by name, by creature name), so a pack model under a NEW name (cosmicraynew.m2 on the
    ridingnetherray displays) is compared with the retail models the stock one maps to."""
    import json
    try:
        named = json.loads(RETAIL_INDEX.read_text()).get('named') or {}
    except (OSError, ValueError):
        return {}
    return {sp: [(t[0], int(t[1])) for t in (v.get('targets') or []) if t and t[1]] for sp, v in named.items()}


def donors() -> Dict[str, List[dict]]:
    """Approved skin donors that are NOT clean retroports: {retail path: [{source, model, note}]}. Their skins
    fit retail's model (checked by eye / render) though the pack's own file must not replace it - a pack
    skin is offered on a retail model only through a retroport or an entry here."""
    import json
    try:
        raw = json.loads(DONORS.read_text())
    except (OSError, ValueError):
        return {}
    return {k.lower(): v for k, v in raw.items() if not k.startswith('_')}


def retroports(sources: Iterable, log=print, stock_dbc=None) -> Dict[str, dict]:
    """{pack model path: {fdid, sources, retail_path?, ...}}. Same-path pack models are compared with retail's
    file of that path; with stock_dbc=(cdi, cmd), a pack model at a path retail lacks is compared with the
    remaster candidates of the stock models whose displays it takes over (a renamed retroport: retail_path)."""
    global _cache
    from lib import retail, casc_store
    by_path, _ = retail.listfile()
    sources = list(sources)
    cands = remaster_candidates() if stock_dbc else {}
    if _cache is None:
        try:
            _cache = pickle.loads(CACHE.read_bytes())
        except Exception:
            _cache = {}
    out: Dict[str, dict] = {}
    new = 0
    for s in sources:
        if s.name in SKIP or s.kind == 'stock':
            continue
        renamed: Dict[str, List[Tuple[str, int]]] = {}
        if cands:
            # the stock models whose displays this pack moves onto each of its models
            pm = {mid: ms_norm(r.get('model_path')) for mid, r in s.cmd.items()}
            scdi, scmd = stock_dbc
            for did, r in s.cdi.items():
                p_ = pm.get(int(r.get('model_id') or 0), '')
                if not p_ or p_ in by_path or p_ not in s.assets:
                    continue
                so = scdi.get(did)
                sp = ms_norm((scmd.get(int((so or {}).get('model_id') or 0)) or {}).get('model_path')) if so else ''
                for c in cands.get(sp, []):
                    if c not in renamed.setdefault(p_, []):
                        renamed[p_].append(c)
        for path, f in s.assets.items():
            if not path.endswith('.m2'):
                continue
            tries = [(path, by_path[path])] if path in by_path else renamed.get(path, [])
            for rpath, rfd in tries:
                if _check(out, s, path, f, rpath, rfd):
                    new += 1 if _check.new else 0
                    break
                new += 1 if _check.new else 0
    if new:
        tmp = CACHE.with_suffix('.tmp')
        tmp.write_bytes(pickle.dumps(_cache))
        tmp.replace(CACHE)
    log(f'  retroports: {len(out):,} pack models are retail downports '
        f'({sum(1 for v in out.values() if v.get("retail_path")):,} under a new name; {new:,} newly compared)')
    return out


def ms_norm(p) -> str:
    return str(p or '').replace('\\', '/').lower().replace('.mdx', '.m2')


def _check(out: dict, s, path: str, f, rpath: str, rfd: int) -> bool:
    """Compare pack file f (at path) with retail rpath; record a hit in out. _check.new: a fresh comparison."""
    from lib import casc_store
    _check.new = False
    cp = casc_store.path(rfd)
    if cp is None:
        return False
    try:
        st = Path(f).stat()
    except OSError:
        return False
    key = (VERSION, str(f), st.st_size, st.st_mtime_ns, cp.name)
    if key not in _cache:
        _cache[key] = compare(Path(f).read_bytes(), cp.read_bytes())
        _check.new = True
    hit = _cache[key]
    if hit is None:
        return False
    e = out.setdefault(path, {'fdid': rfd, 'sources': [], 'extra_verts': {}, 'added_anims': {}})
    if rpath != path:
        e['retail_path'] = rpath
    e['sources'].append(s.name)
    if hit['extra_verts']:
        e['extra_verts'][s.name] = hit['extra_verts']
    if hit['added_anims']:
        e['added_anims'][s.name] = hit['added_anims']
    return True


def mesh_variants(skin_bytes: bytes) -> Dict[int, set]:
    """{group: {variants}} a .skin's submeshes draw (group = id // 100, groups >= 1)."""
    out: Dict[int, set] = {}
    if skin_bytes[:4] != b'SKIN':
        return out
    n, o = struct.unpack_from('<II', skin_bytes, 0x1C)
    for i in range(n):
        gid = struct.unpack_from('<H', skin_bytes, o + 48 * i)[0]
        if gid >= 100 and gid % 100:                     # as retail.mesh_geosets: variant 0 is not selectable
            out.setdefault(gid // 100, set()).add(gid % 100)
    return out


def retroport_nibbles(pack_cgd: int, pack_mesh: Dict[int, set], retail_mesh: Dict[int, List[int]]) -> List[int]:
    """A pack display's creature_geoset_data (written for its trimmed mesh) as 3.3.5 nibbles for retail's
    full mesh: the variants the pack showed, and nothing the pack had trimmed away. A group the pack drew
    with several variants keeps 0 only when that is all of retail's; otherwise its lowest shown variant."""
    out = [0] * 8
    for g in range(1, 9):
        rv = set(retail_mesh.get(g, []))
        if not rv:
            continue
        n = (int(pack_cgd) >> (4 * (g - 1))) & 0xF
        pv = pack_mesh.get(g, set())
        shown = (pv if n == 0 else {n} & pv) & rv
        if shown == rv:
            out[g - 1] = 0                                  # every variant, as the pack showed
        elif len(shown) >= 1:
            out[g - 1] = min(shown)
        else:
            out[g - 1] = next((x for x in range(1, 16) if x not in rv), 0)   # none: an absent variant
    return out
