"""
F-216 model source scan (prototype).

Resolves every CreatureDisplayInfo row once per *source* -- stock 3.3.5a, each
zpak applied on its own over stock, and the effective build (all enabled zpaks
layered) -- and decodes the M2 each one would ship. Conflicts are keyed on the
display id, not the file path: a pack can change a display's model either by
overwriting the stock M2 in place (Maribeth's Nightmare2) or by repointing the
display/model rows at a new path (spaceslam's NightmareNew). A same-path
duplicate scan only sees the first kind (I-379).

Flags raised per (display, source):
    orphan-texture     hardcoded (type 0) texture used by no batch, particle or ribbon
    fewer-emitters     fewer particle emitters than another source's version
    missing-texture    hardcoded texture not shipped by the source, stock or the build
    missing-skin       a display texture_variation BLP that nobody ships
    missing-skin-file  M2 has N views but a NN.skin file is absent
    missing-model      the resolved M2 path is not shipped anywhere
    bad-batch-index    a .skin batch indexes past the model's lookup tables / submeshes
    bad-sequence-bounds a sequence's bounds miss the mesh entirely (client culls it wrongly)
"""

from __future__ import annotations

import hashlib
import os
import json
import pickle
import re
import struct
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from lib.manifest import load_manifest

TOOLS_ROOT = Path('/workspace/project/Zeppelin-Tools')
STOCK_DBC_DIR = TOOLS_ROOT / 'Original DBC Files' / 'dbc'
# common, common-2, expansion, lichking, patch, patch-2, patch-3 (listfile) of the stock client
STOCK_LISTFILES = TOOLS_ROOT / 'Stock Listfiles'
STOCK_ASSETS = TOOLS_ROOT / 'Asset Library' / 'GAME ASSETS'
# Clean 3.3.5a client, one folder per MPQ (Asset Library/STOCK/files/<mpq>/).
# Listed lowest priority first, as the client loads them: later entries win.
STOCK_FILES = TOOLS_ROOT / 'Asset Library' / 'STOCK' / 'files'
STOCK_MPQ_ORDER = ['common', 'common-2', 'expansion', 'lichking',
                   'enUS/base-enUS', 'enUS/backup-enUS', 'enUS/locale-enUS', 'enUS/expansion-locale-enUS',
                   'enUS/lichking-locale-enUS', 'patch', 'patch-2', 'patch-3',
                   'enUS/patch-enUS', 'enUS/patch-enUS-2', 'enUS/patch-enUS-3']
STOCK_SUFFIXES = ('.m2', '.skin', '.blp', '.anim', '.wmo')
RETAIL_LISTFILE = TOOLS_ROOT / 'Retroport' / 'retroport_tools' / 'MultiConverter2' / 'listfile.csv'

# Known community authors per zpak. Prototype: lives here until F-216 gives
# sources a proper registry.
PROVENANCE = {
    'patch-hd-everything': {'author': 'Maribeth (Odyssey Mods)', 'upstream': 'nexus:850'},
    'patch-gob-retroport': {'author': 'macwarrior (GmFactoryWoW)', 'upstream': 'github:GmFactoryWoW/gob_retroport'},
    'patch-hd-buildings': {'author': 'Appletrey (Classic HD)', 'upstream': ''},
    'patch-hd-creatures-mounts': {
        'author': 'spaceslam',
        'upstream': 'github:valsan-azerty-boi/WotLK3.3.5_New_HD_Patch_2025',
    },
}

CDI_TEX_FIELDS = ('texture_variation_1', 'texture_variation_2', 'texture_variation_3')


def norm(path: str) -> str:
    """Normalise an asset path: lowercase, forward slashes, .mdx/.mdl -> .m2."""
    p = path.replace('\\', '/').strip().lower()
    return re.sub(r'\.md[xl]$', '.m2', p)


# --------------------------------------------------------------------------
# Stock DBC (binary WDBC)
# --------------------------------------------------------------------------

def _read_wdbc(path: Path, string_fields: Iterable[int], names: List[str],
               float_fields: Iterable[int] = ()) -> Dict[int, dict]:
    data = path.read_bytes()
    if data[:4] != b'WDBC':
        raise ValueError(f'{path} is not WDBC')
    n, fc, rs, _ = struct.unpack_from('<4I', data, 4)
    strings = data[20 + n * rs:]
    sf, ff = set(string_fields), set(float_fields)
    rows = {}
    for i in range(n):
        vals = struct.unpack_from(f'<{fc}I', data, 20 + i * rs)
        row = {}
        for idx, name in enumerate(names):
            v = vals[idx]
            if idx in sf:
                end = strings.index(b'\0', v)
                v = strings[v:end].decode('utf-8', 'replace')
            elif idx in ff:
                v = struct.unpack('<f', struct.pack('<I', v))[0]
            row[name] = v
        rows[row['id']] = row
    return rows


CDI_COLUMNS = ['id', 'model_id', 'sound_id', 'extended_display_info_id', 'creature_model_scale',
               'creature_model_alpha', *CDI_TEX_FIELDS, 'portrait_texture_name', 'blood_level', 'blood_id',
               'npc_sound_id', 'praticle_color_id', 'creature_geoset_data', 'obj_effect_package_id']
CMD_COLUMNS = ['id', 'flags', 'model_path', 'size_class', 'model_scale', 'blood_id', 'footprint_texture_id',
               'footprint_texture_length', 'footprint_texture_width', 'footprint_particle_scale',
               'foley_material_id', 'footstep_shake_size', 'death_thud_shake_size', 'sound_data',
               'collision_width', 'collision_height', 'mount_height', 'geo_box_min_x', 'geo_box_min_y',
               'geo_box_min_z', 'geo_box_max_x', 'geo_box_max_y', 'geo_box_max_z', 'world_effect_scale',
               'attached_effect_scale', 'missile_collision_radius', 'missile_collision_push',
               'missile_collision_raise']


CDX_COLUMNS = ['id', 'race', 'gender', 'skin_color', 'face_type', 'hair_style', 'hair_color', 'facial_hair',
               'helm_id', 'shoulders_id', 'shirt_id', 'chest_id', 'belt_id', 'legs_id', 'boots_id', 'wrists_id',
               'gloves_id', 'tabard_id', 'cape_id', 'can_equip', 'texture']
CHS_COLUMNS = ['id', 'race', 'gender', 'base_section', 'texture_1', 'texture_2', 'texture_3', 'flags', 'type',
               'color_index']


def load_stock_char_dbc() -> Tuple[Dict[int, dict], Dict[int, dict]]:
    """Stock CreatureDisplayInfoExtra (NPC bake + look) and CharSections."""
    cdx = _read_wdbc(STOCK_DBC_DIR / 'CreatureDisplayInfoExtra.dbc', (20,), CDX_COLUMNS)
    chs = _read_wdbc(STOCK_DBC_DIR / 'CharSections.dbc', (4, 5, 6), CHS_COLUMNS)
    return cdx, chs


def load_stock_dbc() -> Tuple[Dict[int, dict], Dict[int, dict]]:
    # Scale columns decoded as floats (the viewer's in-game size); the other float
    # columns stay raw uint32 bits, nothing reads them.
    cdi = _read_wdbc(STOCK_DBC_DIR / 'CreatureDisplayInfo.dbc', (6, 7, 8, 9), CDI_COLUMNS, (4,))
    cmd = _read_wdbc(STOCK_DBC_DIR / 'CreatureModelData.dbc', (2,), CMD_COLUMNS, (4,))
    return cdi, cmd


# --------------------------------------------------------------------------
# zpak DBC SQL (the four statement shapes the zpaks use)
# --------------------------------------------------------------------------

# creaturedisplayinfoextra + charsections feed the character-model viewer (bake,
# hair); the HD packs edit both (HD bake names, HD hair textures).
_TABLES = ('creaturedisplayinfo', 'creaturemodeldata', 'creaturedisplayinfoextra', 'charsections')
_STMT_RE = re.compile(r"(?is)^\s*(insert|update|delete|replace)\b.*?\b`?(creaturedisplayinfoextra|creaturedisplayinfo|creaturemodeldata|charsections)`?\b")
_ASSIGN_RE = re.compile(r"`?(\w+)`?\s*=\s*('(?:[^']|'')*'|-?[\d.]+(?:e-?\d+)?|0x[0-9a-f]+)", re.I)


def _val(tok: str):
    tok = tok.strip()
    if tok.startswith("'"):
        return tok[1:-1].replace("''", "'").replace('\\\\', '\\')
    try:
        return int(tok, 0)
    except ValueError:
        try:
            return float(tok)
        except ValueError:
            return tok


def _split_statements(sql: str) -> List[str]:
    """Split on ';' outside quotes, dropping -- comments."""
    out, buf, q = [], [], False
    i = 0
    while i < len(sql):
        c = sql[i]
        if not q and c == '-' and sql.startswith('--', i):
            j = sql.find('\n', i)
            i = len(sql) if j < 0 else j
            continue
        if c == "'":
            if q and sql.startswith("''", i):
                buf.append("''")
                i += 2
                continue
            q = not q
        if c == ';' and not q:
            out.append(''.join(buf))
            buf = []
        else:
            buf.append(c)
        i += 1
    if ''.join(buf).strip():
        out.append(''.join(buf))
    return out


def _tuple_values(s: str) -> List[List]:
    """Parse '(a, 'b', c), (...)' into lists of values."""
    rows, cur, tok, q, depth = [], [], [], False, 0
    i = 0
    while i < len(s):
        c = s[i]
        if c == "'":
            if q and s.startswith("''", i):
                tok.append("''")
                i += 2
                continue
            q = not q
            tok.append(c)
        elif q:
            tok.append(c)
        elif c == '(':
            depth += 1
            if depth == 1:
                cur, tok = [], []
            else:
                tok.append(c)
        elif c == ')':
            depth -= 1
            if depth == 0:
                cur.append(_val(''.join(tok)))
                rows.append(cur)
            else:
                tok.append(c)
        elif c == ',' and depth == 1:
            cur.append(_val(''.join(tok)))
            tok = []
        elif depth >= 1:
            tok.append(c)
        i += 1
    return rows


_COND_RE = re.compile(
    r"""^`?(\w+)`?\s*(?:(=|!=|<>|>=|<=|>|<)\s*('(?:[^']|'')*'|-?[\d.]+|0x[0-9a-f]+)"""
    r"""|(not\s+in|in)\s*\(([^)]*)\))$""", re.I)


def _parse_where(stmt: str):
    """WHERE clause -> list of (col, op, values), ANDed. None if unsupported
    (OR, functions, subqueries ...)."""
    m = re.search(r'(?is)\bwhere\b(.*)$', stmt)
    if not m:
        return None
    clause = m.group(1).replace('\\!=', '!=').strip()
    if re.search(r'(?i)\bor\b|\(\s*select\b', clause):
        return None
    preds = []
    # "col BETWEEN a AND b" -> two predicates (before the AND split eats it)
    clause = re.sub(r'(?i)`?(\w+)`?\s+between\s+(-?[\d.]+)\s+and\s+(-?[\d.]+)', r'\1 >= \2 AND \1 <= \3', clause)
    for part in re.split(r'(?i)\s+and\s+', clause):
        part = part.strip()
        while part.startswith('(') and part.endswith(')') and part.count('(') == part.count(')') \
                and not re.match(r'(?i)^\(\s*\w+\s+(not\s+)?in\b', part):
            part = part[1:-1].strip()
        cm = _COND_RE.match(part)
        if not cm:
            return None
        col = cm.group(1).lower()
        if cm.group(2):
            preds.append((col, cm.group(2).replace('<>', '!='), [_val(cm.group(3))]))
        else:
            vals = [_val(v) for v in re.findall(r"'(?:[^']|'')*'|-?[\d.]+", cm.group(5))]
            preds.append((col, 'not in' if cm.group(4).lower().startswith('not') else 'in', vals))
    return preds


def _where_key(stmt: str):
    """Fast path: a plain id = N / id IN (...) gives a list of ids; anything else
    gives a predicate tuple; None when the clause can't be understood."""
    preds = _parse_where(stmt)
    if preds is None:
        return None
    if len(preds) == 1 and preds[0][0] == 'id' and preds[0][1] in ('=', 'in'):
        return [int(v) for v in preds[0][2]]
    return tuple((c, o, tuple(v)) for c, o, v in preds)


def _match(row: dict, preds) -> Optional[bool]:
    for col, op, vals in preds:
        if col not in row:
            return None                      # column not loaded for this row
        v = row[col]
        if isinstance(v, str):
            v, vals = v.lower(), [x.lower() if isinstance(x, str) else x for x in vals]
        ok = {'=': lambda: v == vals[0], '!=': lambda: v != vals[0], '>': lambda: v > vals[0],
              '<': lambda: v < vals[0], '>=': lambda: v >= vals[0], '<=': lambda: v <= vals[0],
              'in': lambda: v in vals, 'not in': lambda: v not in vals}[op]()
        if not ok:
            return False
    return True


@dataclass
class DbcDelta:
    """Ordered per-table operations from one zpak: ('set'|'update'|'delete', id, fields)."""
    ops: Dict[str, List[Tuple[str, object, dict]]] = field(default_factory=lambda: {t: [] for t in _TABLES})
    unparsed: List[str] = field(default_factory=list)   # "file: statement" we could not apply
    origin: Dict[str, List[str]] = field(default_factory=lambda: {t: [] for t in _TABLES})  # SQL file per op

    def empty(self) -> bool:
        return not any(self.ops.values())


def parse_zpak_dbc(dbc_dir: Path) -> DbcDelta:
    delta = DbcDelta()
    if not dbc_dir.is_dir():
        return delta
    for f in sorted(dbc_dir.glob('*.sql')):
        text = f.read_text(errors='replace')
        if not re.search(r'(?i)creaturedisplayinfo(extra)?\b|creaturemodeldata\b|charsections\b', text):
            continue
        for stmt in _split_statements(text):
            m = _STMT_RE.match(stmt)
            if not m:
                continue
            kind, table = m.group(1).lower(), m.group(2).lower()
            ops = delta.ops[table]
            if kind in ('delete', 'update'):
                key = _where_key(stmt)
                if key is None:
                    delta.unparsed.append(f'{f.name}: {" ".join(stmt.split())[:160]}')
                    continue
                fields = {}
                if kind == 'update':
                    set_part = re.split(r'(?is)\bwhere\b', re.split(r'(?is)\bset\b', stmt, 1)[1])[0]
                    fields = {k.lower(): _val(v) for k, v in _ASSIGN_RE.findall(set_part)}
                for k in (key if isinstance(key, list) else [key]):
                    ops.append((kind, k, fields))
                    delta.origin[table].append(f.name)
            else:  # insert / replace
                cm = re.search(r'(?is)\b(?:creaturedisplayinfoextra|creaturedisplayinfo|creaturemodeldata|charsections)`?\s*\(([^)]*)\)\s*values\s*(.*)$', stmt)
                if cm:
                    cols = [c.strip(' `\n\t').lower() for c in cm.group(1).split(',')]
                    for vals in _tuple_values(cm.group(2)):
                        row = dict(zip(cols, vals))
                        if 'id' in row:
                            ops.append(('set', int(row['id']), row))
                            delta.origin[table].append(f.name)
                else:
                    set_part = re.split(r'(?is)\bset\b', stmt, 1)
                    if len(set_part) == 2:
                        row = {k.lower(): _val(v) for k, v in _ASSIGN_RE.findall(set_part[1])}
                        if 'id' in row:
                            ops.append(('set', int(row['id']), row))
                            delta.origin[table].append(f.name)
    return delta


def apply_delta(base: Dict[int, dict], ops, unresolved: Optional[List[str]] = None) -> Dict[int, dict]:
    """Copy-on-write apply. Only touched rows are copied. Predicate ops are
    evaluated against the table as it stands at that point, like MySQL."""
    out = dict(base)
    for kind, key, fields in ops:
        if isinstance(key, tuple):
            ids = []
            for i, row in out.items():
                hit = _match(row, key)
                if hit is None:
                    if unresolved is not None:
                        unresolved.append(f'predicate on unloaded column: {key}')
                    break
                if hit:
                    ids.append(i)
        else:
            ids = [key]
        for i in ids:
            if kind == 'delete':
                out.pop(i, None)
            elif kind == 'set':
                out[i] = dict(fields)
            elif i in out:  # UPDATE on a missing row is a no-op, as in MySQL
                row = dict(out[i])
                row.update(fields)
                out[i] = row
    return out


# --------------------------------------------------------------------------
# Assets
# --------------------------------------------------------------------------

def load_stock_listfile() -> set:
    paths = set()
    for f in STOCK_LISTFILES.iterdir():
        for line in f.read_text(errors='replace').splitlines():
            line = line.strip()
            if line:
                paths.add(norm(line))
    return paths


_stock_asset_index: Optional[Dict[str, Path]] = None


def _build_stock_index() -> Dict[str, Path]:
    """normalised path -> file. Uses the clean client extraction when present
    (precedence = client load order), else the legacy mixed Asset Library."""
    idx: Dict[str, Path] = {}
    if STOCK_FILES.is_dir():
        cache = Path('/workspace/project/logs/stock_index.pkl')
        key = [STOCK_SUFFIXES] + [(m, (STOCK_FILES / m).stat().st_mtime) for m in STOCK_MPQ_ORDER
                                  if (STOCK_FILES / m).is_dir()]   # the suffix list too: a new type re-indexes
        if cache.exists():
            try:
                k, data = pickle.loads(cache.read_bytes())
                if k == key:
                    return {p: Path(f) for p, f in data.items()}
            except Exception:
                pass
        for m in STOCK_MPQ_ORDER:
            root = STOCK_FILES / m
            for k, f in list_files(root).items():
                if k.endswith(STOCK_SUFFIXES):
                    idx[k] = f                                             # later MPQ wins
        try:
            cache.parent.mkdir(parents=True, exist_ok=True)
            cache.write_bytes(pickle.dumps((key, {p: str(f) for p, f in idx.items()})))
        except OSError:
            pass
        return idx
    if STOCK_ASSETS.is_dir():
        for p in STOCK_ASSETS.rglob('*'):
            if p.suffix.lower() in STOCK_SUFFIXES and p.is_file():
                idx[norm(str(p.relative_to(STOCK_ASSETS)))] = p
    return idx


def stock_asset(path_n: str) -> Optional[Path]:
    """A STOCK file by normalised path (clean client extraction when present)."""
    global _stock_asset_index
    if _stock_asset_index is None:
        _stock_asset_index = _build_stock_index()
    return _stock_asset_index.get(path_n)


# (size, mtime) of every file a listing saw - the cache key for per-file work downstream
FILE_STAT: Dict[str, Tuple[int, int]] = {}


def list_files(root: Path) -> Dict[str, Path]:
    """normalised relative path -> file, via ONE `find` (C, a single process): ~3 s for 190k
    files on the UNRAID share where a Python rglob + is_file took over 2 minutes. Records
    each file's size and mtime in FILE_STAT."""
    import subprocess
    idx: Dict[str, Path] = {}
    if not root.is_dir():
        return idx
    r = subprocess.run(['find', str(root), '-type', 'f', '-printf', '%P\t%s\t%T@\n'],
                       capture_output=True, text=True, errors='replace')
    for line in r.stdout.splitlines():
        rel, _, rest = line.partition('\t')
        size, _, mt = rest.partition('\t')
        if not rel or not size.isdigit():
            continue
        f = root / rel
        idx[norm(rel)] = f
        FILE_STAT[str(f)] = (int(size), int(float(mt or 0)))
    return idx


def index_zpak_assets(src: Path) -> Dict[str, Path]:
    return list_files(src)


def load_retail_listfile() -> Dict[str, int]:
    out = {}
    if RETAIL_LISTFILE.exists():
        with RETAIL_LISTFILE.open(errors='replace') as fh:
            for line in fh:
                fdid, _, p = line.rstrip('\r\n').partition(';')
                if p.endswith('.m2'):
                    out[p.lower()] = int(fdid)
    return out


# --------------------------------------------------------------------------
# M2 decode (header + the arrays the lints need, by seek)
# --------------------------------------------------------------------------

@dataclass
class M2Info:
    version: int
    size: int
    sha256: str
    bones: int
    views: int
    particles: int
    ribbons: int
    textures: List[Tuple[int, str]]      # (type, filename)
    used_textures: set
    error: str = ''
    # lookup-table sizes the .skin batches index into (bad-batch-index lint)
    counts: dict = field(default_factory=dict)

    def orphan_textures(self) -> List[str]:
        return [name for i, (t, name) in enumerate(self.textures)
                if t == 0 and name and i not in self.used_textures]

    def unnamed_textures(self) -> List[int]:
        """Hardcoded (type 0) textures with an EMPTY filename that something uses:
        the MultiConverter signature (TXID file ids never inlined as names). Nothing
        can load, so the batch draws black or untextured."""
        return [i for i, (t, name) in enumerate(self.textures)
                if t == 0 and not name and i in self.used_textures]

    def hardcoded_textures(self) -> List[str]:
        return [name for t, name in self.textures if t == 0 and name]


def batch_textures(info: 'M2Info', skin: bytes) -> set:
    """Texture indices the .skin batches actually draw (texture combo ->
    texlookup -> texture), plus particle textures."""
    c = info.counts or {}
    tl = c.get('texlookup') or []
    out = set(c.get('particle_tex') or [])
    if len(skin) < 44 or skin[:4] != b'SKIN':
        return out
    nb, ob = struct.unpack_from('<II', skin, 36)
    for i in range(nb):
        if ob + 24 * i + 24 > len(skin):
            break
        tc, tcombo = struct.unpack_from('<HH', skin, ob + 24 * i + 14)
        for k in range(max(1, tc)):
            if tcombo + k < len(tl) and tl[tcombo + k] >= 0:
                out.add(tl[tcombo + k])
    return out


def bad_batches(info: 'M2Info', skin: bytes) -> int:
    """Batches whose first combo index runs past the model's lookup tables, or
    whose submesh/material does not exist (downport defect; the engine paints
    garbage, the game hides or drops it). Only the FIRST entry of each combo must
    exist: working 2-texture env batches often have a 1-entry texunit lookup."""
    c = info.counts
    if not c or len(skin) < 44 or skin[:4] != b'SKIN':
        return 0
    n_sub = struct.unpack_from('<I', skin, 28)[0]
    nb, ob = struct.unpack_from('<II', skin, 36)
    bad = 0
    for i in range(nb):
        if ob + 24 * i + 24 > len(skin):
            break
        _, _, _, sub, _, col, mat, _, tcount, tcombo, uvc, wc, ttc = struct.unpack_from('<BbHHHhHHHHHHH', skin, ob + 24 * i)
        if (tcount == 0 or sub >= n_sub or mat >= c['mat'] or (col >= 0 and col >= c['col']) or tcombo >= c['tex']
                or uvc >= c['tu'] or wc >= c['tr'] or ttc >= c['uv']):
            bad += 1
    return bad


def _sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()


def decode_m2(path: Path) -> M2Info:
    data = path.read_bytes()
    sha = hashlib.sha256(data).hexdigest()
    base = 0
    if data[:4] == b'MD21':
        base = 8
    if data[base:base + 4] != b'MD20':
        return M2Info(0, len(data), sha, 0, 0, 0, 0, [], set(), error='not MD20/MD21')
    d = memoryview(data)[base:]
    try:
        ver = struct.unpack_from('<I', d, 4)[0]

        def arr(off):
            return struct.unpack_from('<II', d, off)

        n_bones = arr(0x2C)[0]
        views = struct.unpack_from('<I', d, 0x44)[0]
        n_tex, o_tex = arr(0x50)
        textures = []
        for i in range(n_tex):
            t, _f, ln, no = struct.unpack_from('<IIII', d, o_tex + 16 * i)
            name = bytes(d[no:no + ln]).split(b'\0')[0].decode('latin-1') if ln else ''
            textures.append((t, name))
        used = set()
        n_lk, o_lk = arr(0x80)
        for i in range(n_lk):
            used.add(struct.unpack_from('<h', d, o_lk + 2 * i)[0])
        n_rib, o_rib = arr(0x120)
        rib_size = 0xB0
        for i in range(n_rib):
            nti, oti = struct.unpack_from('<II', d, o_rib + rib_size * i + 20)
            if oti + 2 * nti > len(d):
                continue
            for k in range(min(nti, 16)):
                t = struct.unpack_from('<H', d, oti + 2 * k)[0]
                if t < n_tex:
                    used.add(t)
        n_par, o_par = arr(0x128)
        par_size = 476 if ver <= 264 else 492
        for i in range(n_par):
            tex = struct.unpack_from('<H', d, o_par + par_size * i + 22)[0]
            if ver <= 264:
                used.add(tex)
            else:  # Cata+ packs up to 3 indices, 5 bits each
                used.update({tex & 0x1F, (tex >> 5) & 0x1F, (tex >> 10) & 0x1F})
        counts = {k: struct.unpack_from('<I', d, off)[0] for k, off in
                  (('mat', 0x70), ('col', 0x48), ('tex', 0x80), ('tu', 0x88), ('tr', 0x90), ('uv', 0x98))}
        counts['texlookup'] = [struct.unpack_from('<h', d, o_lk + 2 * i)[0] for i in range(n_lk)]
        # Sequence bounds that MISS the rest-pose mesh entirely on some axis
        # (Maribeth's flowerswreath01: bounds float 4-22 yd above a 0.4 yd mesh).
        # Bounds merely smaller than the rest mesh are normal: character models
        # carry every hair/gear geoset, creatures' bounds follow animated poses.
        n_seq, o_seq = arr(0x1C)
        n_vtx, o_vtx = arr(0x3C)
        counts['bad_seq_bounds2'] = False
        if n_vtx and n_seq and o_vtx + 48 * n_vtx <= len(d) and o_seq + 64 * n_seq <= len(d):
            lo, hi = [1e9] * 3, [-1e9] * 3
            for i in range(n_vtx):
                for k, v in enumerate(struct.unpack_from('<3f', d, o_vtx + 48 * i)):
                    lo[k] = min(lo[k], v); hi[k] = max(hi[k], v)
            for i in range(n_seq):
                bb = struct.unpack_from('<6f', d, o_seq + 64 * i + 32)
                if any(bb[k] > hi[k] or bb[k + 3] < lo[k] for k in range(3)):   # no overlap
                    counts['bad_seq_bounds2'] = True
                    break
        counts['particle_tex'] = sorted(u for u in used if u not in counts['texlookup'])
        return M2Info(ver, len(data), sha, n_bones, views, n_par, n_rib, textures, used, counts=counts)
    except (struct.error, ValueError) as e:
        return M2Info(0, len(data), sha, 0, 0, 0, 0, [], set(), error=f'decode: {e}')


class M2Cache:
    """Persistent decode cache keyed on (abs path, size, mtime)."""

    def __init__(self, path: Path):
        self.path = path
        self.data: Dict[str, Tuple[int, float, M2Info]] = {}
        if path.exists():
            try:
                self.data = pickle.loads(path.read_bytes())
            except Exception:
                self.data = {}
        self.hits = self.misses = 0

    def get(self, p: Path) -> M2Info:
        st = p.stat()
        key = str(p)
        hit = self.data.get(key)
        if hit and hit[0] == st.st_size and hit[1] == st.st_mtime and 'bad_seq_bounds2' in (getattr(hit[2], 'counts', None) or {}):
            self.hits += 1
            return hit[2]
        self.misses += 1
        info = decode_m2(p)
        self.data[key] = (st.st_size, st.st_mtime, info)
        return info

    def save(self):
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.path.write_bytes(pickle.dumps(self.data))


# --------------------------------------------------------------------------
# Sources and the scan
# --------------------------------------------------------------------------

@dataclass
class Source:
    name: str
    kind: str                 # 'stock' | 'zpak' | 'effective'
    enabled: bool = True
    priority: int = 0
    client_patch: str = ''
    assets: Dict[str, Path] = field(default_factory=dict)
    delta: DbcDelta = field(default_factory=DbcDelta)
    cdi: Dict[int, dict] = field(default_factory=dict)
    cmd: Dict[int, dict] = field(default_factory=dict)
    # effective only: normalised path -> winning zpak name
    owner: Dict[str, str] = field(default_factory=dict)

    cdx: Dict[int, dict] = field(default_factory=dict)   # CreatureDisplayInfoExtra
    chs: Dict[int, dict] = field(default_factory=dict)   # CharSections
    manifest_author: str = ''
    manifest_source: str = ''

    # Curated PROVENANCE wins over the manifest (manifests say "Nexusmods (mod 891)").
    @property
    def author(self) -> str:
        return PROVENANCE.get(self.name, {}).get('author') or self.manifest_author

    @property
    def upstream(self) -> str:
        return PROVENANCE.get(self.name, {}).get('upstream') or self.manifest_source


def discover_sources(craft_root: Path) -> List[Source]:
    sources = []
    for base in (craft_root / 'zpaks', craft_root / 'external'):
        if not base.is_dir():
            continue
        for d in sorted(base.iterdir()):
            man = load_manifest(d / 'zpak.json') if (d / 'zpak.json').exists() else None
            if not man:
                continue
            if man.get('name', d.name) == 'zep-hd-curated':
                continue          # F-216's build OUTPUT (picked files), never an option to pick from
            # parsed-assets is what gets packed (the resource parser adds and
            # renames files), so it wins over source-assets for the same path.
            assets = index_zpak_assets(d / 'mpq' / 'source-assets')
            assets.update(index_zpak_assets(d / 'mpq' / 'parsed-assets'))
            # .anim too: HD character models ship their own external animation files,
            # and a pack's mesh played with stock .anim data is not what it ships
            assets = {k: v for k, v in assets.items() if k.endswith(('.m2', '.skin', '.blp', '.anim', '.wmo'))}
            delta = parse_zpak_dbc(d / 'dbc')
            if not delta.empty() or any(k.endswith('.m2') for k in assets):
                src = Source(man.get('name', d.name), 'zpak', bool(man.get('enabled', True)),
                             int(man.get('priority', 0) or 0), man.get('client_patch', '') or '',
                             assets, delta)
                src.manifest_author = man.get('author', '') or ''
                src.manifest_source = (man.get('source') or {}).get('url', '')
                sources.append(src)
    lib = library_sources()
    # supersession: a library release replaces an older zpak copy of the same pack - it takes
    # that zpak's patch letter, priority and enabled state, and the old copy stops being a source
    by_name = {x.name: x for x in sources}
    for ls in lib:
        for old in getattr(ls, 'supersedes', []):
            o = by_name.pop(old, None)
            if o is None:
                continue
            ls.enabled, ls.priority, ls.client_patch = o.enabled, o.priority, o.client_patch
            ls.superseded = old
            if ls.delta.empty():
                ls.delta = o.delta                # the old copy's DBC deltas carry on until the release ships its own
            sources.remove(o)
    return sources + lib


COMMUNITY_LIBRARY = Path('/workspace/project/Zeppelin-Tools/Asset Library/COMMUNITY')


def library_sources() -> List[Source]:
    """F-216 Asset Library packs (COMMUNITY/<pack>/source.json): offered in the model viewer as
    options, never shipped as zpaks (enabled=False keeps them out of the live winners)."""
    out = []
    if not COMMUNITY_LIBRARY.is_dir():
        return out
    for d in sorted(COMMUNITY_LIBRARY.iterdir()):
        mf = d / 'source.json'
        if not mf.is_file():
            continue
        man = json.loads(mf.read_text())
        assets: Dict[str, Path] = {}
        for sub in man.get('files', []):                       # client load order: later wins
            assets.update(index_zpak_assets(d / sub))
        assets = {k: v for k, v in assets.items() if k.endswith(('.m2', '.skin', '.blp', '.anim', '.wmo'))}
        src = Source(man.get('name', d.name), 'library', False, 0, '', assets, parse_zpak_dbc(d / 'dbc'))
        src.supersedes = list(man.get('supersedes') or [])
        src.manifest_author = man.get('author', '') or ''
        src.manifest_source = man.get('source', '') or ''
        out.append(src)
    return out


def _patch_order(s: Source) -> Tuple[str, int]:
    # Client loads patch-X MPQs alphanumerically (later wins); inside one MPQ the
    # merge keeps the higher-priority zpak's copy.
    return (s.client_patch.upper(), s.priority)


@dataclass
class Resolved:
    model_id: int
    model_path: str           # normalised
    origin: str               # which source supplies the M2 file ('' if nobody)
    m2: Optional[M2Info]
    skins: List[str]
    flags: List[str]


SCAN_CODE_VERSION = 1          # bump when run_scan's output changes shape: forces a full scan


def _scan_fingerprint(sources: List['Source'], craft_root: Path, include_disabled: bool) -> str:
    """Everything run_scan reads: each source's file listing (path, size, mtime), its DBC SQL
    files' mtimes and its manifest state. Same fingerprint = same scan result."""
    h = hashlib.sha1(repr((SCAN_CODE_VERSION, include_disabled)).encode())
    for src in sorted(sources, key=lambda x: x.name):
        h.update(repr((src.name, src.enabled, src.priority, src.client_patch)).encode())
        for k in sorted(src.assets):
            st = FILE_STAT.get(str(src.assets[k]))
            h.update(f'{k}={st}'.encode())
    for f in sorted(craft_root.glob('zpaks/*/dbc/*.sql')) + sorted(COMMUNITY_LIBRARY.glob('*/dbc/*.sql')):
        st = f.stat()
        h.update(f'{f}={st.st_size},{int(st.st_mtime)}'.encode())
    return h.hexdigest()


def run_scan(craft_root: Path, cache_path: Path, include_disabled: bool = True) -> dict:
    """Cached: when no source's files, DBC SQL or manifest changed, the previous result is
    reused (logs/scan_result_cache.pkl) - the listing alone takes seconds."""
    rc = cache_path.parent / 'scan_result_cache.pkl'
    srcs = discover_sources(craft_root)
    fp = _scan_fingerprint(srcs, craft_root, include_disabled)
    if rc.exists():
        try:
            k, res = pickle.loads(rc.read_bytes())
            if k == fp:
                return res
        except Exception:
            pass
    res = _run_scan(craft_root, cache_path, include_disabled, srcs)
    try:
        tmp = rc.with_suffix('.tmp')
        tmp.write_bytes(pickle.dumps((fp, res)))
        tmp.replace(rc)
    except Exception:
        pass
    return res


def _run_scan(craft_root: Path, cache_path: Path, include_disabled: bool, zsources_pre: List['Source']) -> dict:
    stock_cdi, stock_cmd = load_stock_dbc()
    stock_cdx, stock_chs = load_stock_char_dbc()
    stock_list = load_stock_listfile()
    # Every path the STOCK CreatureModelData references is stock by definition
    # (covers anything a listfile might miss), and so is every file of the
    # clean client extraction.
    stock_list |= {norm(str(r.get('model_path', ''))) for r in stock_cmd.values()}
    if STOCK_FILES.is_dir():
        stock_asset('')
        stock_list |= set(_stock_asset_index)
    retail = load_retail_listfile()
    zsources = zsources_pre
    if not include_disabled:
        zsources = [s for s in zsources if s.enabled]

    stock = Source('stock', 'stock', cdi=stock_cdi, cmd=stock_cmd)
    for s in zsources:
        s.cdx = apply_delta(stock_cdx, s.delta.ops['creaturedisplayinfoextra'], s.delta.unparsed)
        s.chs = apply_delta(stock_chs, s.delta.ops['charsections'], s.delta.unparsed)
        s.cdi = apply_delta(stock_cdi, s.delta.ops['creaturedisplayinfo'], s.delta.unparsed)
        s.cmd = apply_delta(stock_cmd, s.delta.ops['creaturemodeldata'], s.delta.unparsed)

    eff = Source('effective', 'effective')
    enabled = sorted((s for s in zsources if s.enabled), key=lambda s: s.priority)  # DBC: low first
    cdi, cmd = stock_cdi, stock_cmd
    cdx, chs = stock_cdx, stock_chs
    for s in enabled:
        cdi = apply_delta(cdi, s.delta.ops['creaturedisplayinfo'])
        cmd = apply_delta(cmd, s.delta.ops['creaturemodeldata'])
        cdx = apply_delta(cdx, s.delta.ops['creaturedisplayinfoextra'])
        chs = apply_delta(chs, s.delta.ops['charsections'])
    eff.cdi, eff.cmd, eff.cdx, eff.chs = cdi, cmd, cdx, chs
    for s in sorted(enabled, key=_patch_order):                          # files: last wins
        for k, p in s.assets.items():
            eff.assets[k] = p
            eff.owner[k] = s.name

    cache = M2Cache(cache_path)
    skin_cache: Dict[str, tuple] = {}

    def exists_anywhere(path_n: str, src: Source) -> bool:
        return path_n in src.assets or path_n in stock_list or path_n in eff.assets

    def resolve(src: Source, did: int) -> Optional[Resolved]:
        row = src.cdi.get(did)
        if not row:
            return None
        mid = int(row.get('model_id') or 0)
        mrow = src.cmd.get(mid)
        if not mrow:
            return Resolved(mid, '', '', None, [], ['missing-modeldata'])
        mp = norm(str(mrow.get('model_path', '')))
        flags: List[str] = []
        if src.kind == 'stock':
            f = stock_asset(mp) if mp in stock_list else None
            origin = 'stock' if mp in stock_list else ''
        elif src.kind == 'effective':
            f = eff.assets.get(mp)
            origin = eff.owner.get(mp, '')
            if f is None and mp in stock_list:
                f, origin = stock_asset(mp), 'stock'
        else:
            f = src.assets.get(mp)
            origin = src.name if f else ''
            if f is None and mp in stock_list:
                f, origin = stock_asset(mp), 'stock'
        if not origin:
            flags.append('missing-model')
        info = cache.get(f) if f else None
        model_dir = mp.rsplit('/', 1)[0]
        skins = [str(row.get(k) or '') for k in CDI_TEX_FIELDS]
        if info and not info.error:
            if info.orphan_textures():
                flags.append('orphan-texture')
            if (info.counts or {}).get('bad_seq_bounds2'):
                flags.append('bad-sequence-bounds')

            sk0 = f'{mp[:-3]}00.skin'
            skf0 = (src.assets.get(sk0) if src.kind == 'zpak' else None) or \
                   (eff.assets.get(sk0) if src.kind == 'effective' else None) or \
                   (stock_asset(sk0) if sk0 in stock_list else None)
            drawn = batch_textures(info, skf0.read_bytes()) if skf0 is not None else None
            for i, (tt, tn) in enumerate(info.textures):      # only textures something draws
                if tt == 0 and tn and (drawn is None or i in drawn) and not exists_anywhere(norm(tn), src):
                    flags.append('missing-texture')
                    break
            stem = mp[:-3]
            for v in range(info.views):
                if not exists_anywhere(f'{stem}{v:02d}.skin', src):
                    flags.append('missing-skin-file')
                    break
            sk = f'{stem}00.skin'
            skf = (src.assets.get(sk) if src.kind == 'zpak' else None) or \
                  (eff.assets.get(sk) if src.kind == 'effective' else None) or \
                  (stock_asset(sk) if sk in stock_list else None)
            if skf is not None:
                key = str(skf)
                if key not in skin_cache:
                    raw = skf.read_bytes()
                    drawn = batch_textures(info, raw)
                    unnamed = any(i < len(info.textures) and info.textures[i][0] == 0 and not info.textures[i][1]
                                  for i in drawn)
                    skin_cache[key] = (bad_batches(info, raw), unnamed)
                bad, unnamed = skin_cache[key]
                if bad:
                    flags.append('bad-batch-index')
                # unnamed is NOT flagged: most models draw an unnamed texture
                # harmlessly (the derived shader never samples it). It only shows
                # (black) when a modulating combiner samples it, e.g. kraulspine
                # ogremage02 via blend overrides [1,4]. The viewer shows that plainly.
            skin_types = {t for t, _ in info.textures}
            for k, name in enumerate(skins):
                if name and (11 + k) in skin_types and not exists_anywhere(f'{model_dir}/{name.lower()}.blp', src):
                    flags.append('missing-skin')
                    break
        elif info and info.error:
            flags.append('decode-error')
        return Resolved(mid, mp, origin, info, skins, flags)

    all_ids = set(stock_cdi)
    for s in zsources:
        all_ids |= set(s.cdi)
    displays = {}
    for did in sorted(all_ids):
        st = resolve(stock, did)
        per = {}
        for s in zsources:
            r = resolve(s, did)
            if r is None:
                continue
            # A source has an opinion if it changed the chain or ships the M2.
            changed = (st is None or r.model_path != st.model_path or r.skins != st.skins
                       or (r.origin == s.name))
            if changed:
                per[s.name] = r
        if not per:
            continue
        ef = resolve(eff, did)
        # fewer-emitters: compare against the best emitter count among all versions
        versions = [v for v in [st, ef, *per.values()] if v and v.m2 and not v.m2.error]
        best = max((v.m2.particles for v in versions), default=0)
        for v in versions:
            if v.m2.particles < best and 'fewer-emitters' not in v.flags:
                v.flags.append('fewer-emitters')
        # A decision exists when ANY version differs, stock included: HD vs SD is
        # a choice even when every pack ships the same file (most race models).
        cands = [v for v in [st, *per.values()] if v is not None]
        distinct = {(v.model_path, v.m2.sha256 if v.m2 else None, tuple(v.skins)) for v in cands}
        displays[did] = {'stock': st, 'effective': ef, 'sources': per,
                         'conflict': len(distinct) > 1,
                         'retail_fdid': retail.get(st.model_path) if st else None}

    cache.save()
    unparsed = {s.name: sorted(set(s.delta.unparsed)) for s in zsources if s.delta.unparsed}
    return {'sources': zsources, 'displays': displays, 'cache': (cache.hits, cache.misses),
            'unparsed': unparsed, 'effective_assets': eff.assets,
            'stock_dbc': (stock_cdi, stock_cmd), 'effective_dbc': (eff.cdi, eff.cmd),
            'stock_char_dbc': (stock_cdx, stock_chs), 'effective_owner': eff.owner,
            'effective_char_dbc': (eff.cdx, eff.chs),
            'stock_list': stock_list}


def _res_json(r: Optional[Resolved]) -> Optional[dict]:
    if r is None:
        return None
    m = r.m2
    return {
        'model_id': r.model_id, 'model_path': r.model_path, 'origin': r.origin, 'skins': r.skins,
        'flags': r.flags,
        'm2': None if m is None else {
            'version': m.version, 'size': m.size, 'sha256': m.sha256, 'bones': m.bones,
            'views': m.views, 'particles': m.particles, 'ribbons': m.ribbons,
            'textures': [{'type': t, 'name': n} for t, n in m.textures],
            'orphan_textures': m.orphan_textures(), 'error': m.error,
        },
    }


def report_json(result: dict) -> dict:
    return {
        'unparsed_sql': result.get('unparsed', {}),
        'sources': [{'name': s.name, 'enabled': s.enabled, 'priority': s.priority,
                     'client_patch': s.client_patch, 'author': s.author, 'upstream': s.upstream}
                    for s in result['sources']],
        'displays': {
            str(did): {
                'conflict': d['conflict'], 'retail_fdid': d['retail_fdid'],
                'stock': _res_json(d['stock']), 'effective': _res_json(d['effective']),
                'sources': {k: _res_json(v) for k, v in d['sources'].items()},
            } for did, d in result['displays'].items()
        },
    }


# ---------------------------------------------------------------------------
# Game objects (M2 only for now). Packs never repoint GameObjectDisplayInfo;
# they overwrite the model file in place, so a GO "conflict" is: stock file vs
# each zpak that ships a different file at the display's model path.
# ---------------------------------------------------------------------------

def scan_gobjects(result: dict, cache_path: Path) -> Dict[str, dict]:
    godi = _read_wdbc(STOCK_DBC_DIR / 'GameObjectDisplayInfo.dbc', (1,), ['id', 'model_name'])
    srcs = result['sources']
    cache = M2Cache(cache_path)
    owner = result['effective_owner']
    out: Dict[str, dict] = {}

    def res(gid: int, mp: str, name: str, m2f: Optional[Path], skinf: Optional[Path]) -> Resolved:
        info = cache.get(m2f) if m2f else None
        flags: List[str] = []
        if info and not info.error:
            if info.orphan_textures():
                flags.append('orphan-texture')
            if (info.counts or {}).get('bad_seq_bounds2'):
                flags.append('bad-sequence-bounds')
            if skinf is not None and bad_batches(info, skinf.read_bytes()):
                flags.append('bad-batch-index')
        return Resolved(gid, mp, name if m2f else '', info, ['', '', ''], flags)

    for gid, row in godi.items():
        mp = norm(str(row.get('model_name') or ''))
        if not mp.endswith('.m2'):
            continue
        packs = [s for s in srcs if mp in s.assets]
        if not packs:
            continue
        sk = mp[:-3] + '00.skin'
        st = res(gid, mp, 'stock', stock_asset(mp), stock_asset(sk))
        per = {}
        for s in packs:
            r = res(gid, mp, s.name, s.assets[mp], s.assets.get(sk) or stock_asset(sk))
            if st.m2 and r.m2 and r.m2.sha256 == st.m2.sha256:
                continue          # identical to stock: nothing to choose
            per[s.name] = r
        if not per:
            continue
        eo = owner.get(mp)
        ef = per.get(eo, st)
        versions = [v for v in [st, *per.values()] if v.m2 and not v.m2.error]
        best = max((v.m2.particles for v in versions), default=0)
        for v in versions:
            if v.m2.particles < best and 'fewer-emitters' not in v.flags:
                v.flags.append('fewer-emitters')
        out[f'go:{gid}'] = {'stock': st if st.m2 else None, 'effective': ef, 'sources': per,
                            'conflict': True, 'retail_fdid': None, 'kind': 'gobject'}
    cache.save()
    return out


_ITEM_RACE_SUFFIX = re.compile(r'_[a-z]{2}[mf]$')
_ITEM_FOLDERS = ('head', 'shoulder', 'weapon', 'shield', 'collections', 'waist', 'cape')
_HELM_PREFERENCE = ('hum', 'huf', 'orm', 'orf', 'dwm', 'nim', 'scm', 'tam', 'gnm', 'trm', 'bem', 'drm')


def _item_group(path: str) -> Optional[Tuple[str, str]]:
    """item/objectcomponents/<folder>/<file>.m2 -> (folder, group stem): one choice per
    helm across its race/sex variants, per shoulder across left/right, per weapon."""
    parts = path.split('/')
    if len(parts) != 4 or parts[0] != 'item' or parts[1] != 'objectcomponents' or not parts[3].endswith('.m2'):
        return None
    folder, stem = parts[2], parts[3][:-3]
    if folder not in _ITEM_FOLDERS:
        return None
    if folder == 'head':
        stem = _ITEM_RACE_SUFFIX.sub('', stem)
    elif folder == 'shoulder' and stem[:1] in ('l', 'r') and stem[1:].startswith('shoulder'):
        stem = stem[1:]
    return folder, stem


def scan_items(result: dict, cache_path: Path) -> Dict[str, dict]:
    """Item models (helms, shoulders, weapons, ...) any pack replaces, one entry per
    item group, shaped like scan_gobjects' entries plus `members` (every model path
    of the group) and `item_tex` (its texture variants, most used first)."""
    from lib import model_viewer_deploy as mvd
    idi = _read_wdbc(mvd._dbc_path('ItemDisplayInfo.dbc'), (1, 2, 3, 4),
                     ['id', 'left_model', 'right_model', 'left_tex', 'right_tex'])
    srcs = result['sources']
    cache = M2Cache(cache_path)
    owner = result['effective_owner']
    groups: Dict[Tuple[str, str], set] = {}
    for src in srcs:
        for p in src.assets:
            g = _item_group(p)
            if g:
                groups.setdefault(g, set()).add(p)
    # texture variants per group, from ItemDisplayInfo (model name stem -> texture names)
    tex_use: Dict[Tuple[str, str], Dict[str, int]] = {}
    idi_of: Dict[Tuple[str, str], List[int]] = {}
    for row in idi.values():
        for mk, tk in (('left_model', 'left_tex'), ('right_model', 'right_tex')):
            mname, tname = str(row.get(mk) or ''), str(row.get(tk) or '')
            if not mname:
                continue
            stem = mname.lower().rsplit('.', 1)[0]
            for folder in _ITEM_FOLDERS:
                g = _item_group(f'item/objectcomponents/{folder}/{stem}.m2')
                if g and g in groups:
                    idi_of.setdefault(g, []).append(int(row['id']))
                    if tname:
                        t = f'item/objectcomponents/{folder}/{tname.lower()}.blp'
                        tex_use.setdefault(g, {})[t] = tex_use.get(g, {}).get(t, 0) + 1
    out: Dict[str, dict] = {}
    for (folder, stem), members in sorted(groups.items()):
        # the representative model a pane draws: shipped by the most sources
        ranked = sorted(members, key=lambda m: (-sum(1 for s in srcs if m in s.assets),
                                                 next((i for i, k in enumerate(_HELM_PREFERENCE)
                                                       if m[:-3].endswith('_' + k)), 99), m))
        rep = ranked[0]
        sk = rep[:-3] + '00.skin'

        def res(name: str, m2f: Optional[Path]) -> Resolved:
            info = cache.get(m2f) if m2f else None
            return Resolved(0, rep, name if m2f else '', info, ['', '', ''], [])
        st = res('stock', stock_asset(rep))
        per = {}
        for s in srcs:
            if rep not in s.assets:
                continue
            r = res(s.name, s.assets[rep])
            if st.m2 and r.m2 and r.m2.sha256 == st.m2.sha256 and \
                    all(s.assets.get(t) is None for t in tex_use.get((folder, stem), {})):
                continue          # same mesh as stock and no own textures: nothing to choose
            per[s.name] = r
        if not per:
            continue
        texs = sorted(tex_use.get((folder, stem), {}).items(), key=lambda kv: -kv[1])
        eo = owner.get(rep)
        out[f'item:{folder}/{stem}'] = {
            'stock': st if st.m2 else None, 'effective': per.get(eo, st), 'sources': per,
            'conflict': True, 'retail_fdid': None, 'kind': 'item',
            'members': sorted(members), 'item_tex': [t for t, _ in texs],
            'idi': sorted(set(idi_of.get((folder, stem), []))), 'skin': sk}
    cache.save()
    return out


# ---------------------------------------------------------------------------
# Creature-level edits: which creatures no longer use their stock displays.
# Baseline = AzerothCore's base creature_template_model.sql; current = live DB.
# Provenance = the zpak SQL files that touch creature_template_model.
# ---------------------------------------------------------------------------

AC_BASE_CTM = Path('/workspace/project/Zeppelin-Core/data/sql/base/db_world/creature_template_model.sql')


def load_base_ctm() -> Dict[int, List[Tuple[int, float]]]:
    """creature -> [(display, scale)] in Idx order, from AC's base data."""
    out: Dict[int, List[Tuple[int, int, float]]] = {}
    text = AC_BASE_CTM.read_text(errors='replace')
    for m in re.finditer(r'\((\d+),(\d+),(\d+),([\d.]+),([\d.]+),\d+\)', text):
        cid, idx, did, scale = int(m.group(1)), int(m.group(2)), int(m.group(3)), float(m.group(4))
        out.setdefault(cid, []).append((idx, did, scale))
    return {c: [(d, sc) for _, d, sc in sorted(v)] for c, v in out.items()}


def ctm_provenance(craft_root: Path) -> Dict[int, List[str]]:
    """creature -> zpak SQL files (zpak/file) that touch its creature_template_model rows."""
    prov: Dict[int, List[str]] = {}
    for f in sorted((craft_root / 'zpaks').glob('*/sql/*.sql')):
        text = f.read_text(errors='replace')
        if 'creature_template_model' not in text:
            continue
        tag = f'{f.parent.parent.name}/{f.name}'
        ids = set()
        for stmt in _split_statements(text):
            if 'creature_template_model' not in stmt:
                continue
            for m in re.finditer(r'(?i)CreatureID`?\s*(?:=\s*(\d+)|IN\s*\(([^)]*)\))', stmt):
                ids.update(int(x) for x in re.findall(r'\d+', m.group(1) or m.group(2)))
            vm = re.search(r'(?is)\bvalues\s*(.*)$', stmt)
            if vm:
                ids.update(int(t[0]) for t in _tuple_values(vm.group(1)) if t and isinstance(t[0], int))
        for c in ids:
            prov.setdefault(c, []).append(tag)
    return prov


def creature_edits(live_rows: Iterable[Tuple[int, int, int, float]], craft_root: Path) -> dict:
    """live_rows = (creature, idx, display, scale). Returns repointed / rescaled creatures."""
    base = load_base_ctm()
    live: Dict[int, List[Tuple[int, int, float]]] = {}
    for cid, idx, did, sc in live_rows:
        live.setdefault(cid, []).append((idx, did, sc))
    live = {c: [(d, s) for _, d, s in sorted(v)] for c, v in live.items()}
    prov = ctm_provenance(craft_root)
    repointed, rescaled = {}, {}
    for cid, now in live.items():
        was = base.get(cid)
        if was is None:
            continue                       # custom creature: no stock baseline
        if sorted(d for d, _ in was) != sorted(d for d, _ in now):
            repointed[cid] = {'stock': [d for d, _ in was], 'live': [d for d, _ in now],
                              'provenance': prov.get(cid, [])}
        elif sorted(was) != sorted(now):
            rescaled[cid] = {'stock': was, 'live': now, 'provenance': prov.get(cid, [])}
    return {'repointed': repointed, 'rescaled': rescaled}
