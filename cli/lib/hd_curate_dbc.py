"""F-216 build integration: the DBC side of the curated HD collection.

The curated zpak takes patch-hd-everything's DBC slot (priority 30, nothing applies
before it). Its dbc/ folder holds, in filename (= apply) order:
  1. [BASE,F-049]_*.sql   Maribeth's pack data, copied as is (today's state)
  2. [F-216]_<table>.sql  overrides: every row a model-viewer choice needs from a
                          pack other than the base, as one consolidated statement
                          per row (UPDATE of the columns that differ from the base
                          state; DELETE + INSERT for rows stock does not have)
  3. [I-xxx]_*.sql        our own fixes that lived in Maribeth's zpak, still last

Rows are typed by the live DBC schema (column names and types), so emitted values
match what the DBC database stores; stock comes from the clean client's WDBC files.
"""
import struct
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from lib import model_sources as ms

# table -> (stock WDBC file, key columns)
TABLES = {
    'creaturedisplayinfo': ('CreatureDisplayInfo.dbc', ('id',)),
    'creaturemodeldata': ('CreatureModelData.dbc', ('id',)),
    'creaturedisplayinfoextra': ('CreatureDisplayInfoExtra.dbc', ('id',)),
    'charsections': ('CharSections.dbc', ('id',)),
    'characterfacialhairstyles': ('CharacterFacialHairStyles.dbc', ('race', 'gender', 'variation_id')),
    'charhairgeosets': ('CharHairGeosets.dbc', ('id',)),
}

_schema_cache: Dict[str, List[Tuple[str, str]]] = {}


def schema(table: str) -> List[Tuple[str, str]]:
    """[(column, kind)] in table order; kind = 'int' | 'float' | 'str'."""
    if table not in _schema_cache:
        import subprocess
        import sys
        r = subprocess.run([sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', f'SHOW COLUMNS FROM {table}'],
                           cwd=str(Path(__file__).resolve().parents[2]), capture_output=True, text=True)
        cols = []
        for line in r.stdout.splitlines():
            parts = line.split('\t')
            if len(parts) < 2 or parts[0] in ('Field',) or ' ' in parts[0]:
                continue
            t = parts[1].lower()
            kind = 'float' if ('float' in t or 'double' in t) else 'str' if ('char' in t or 'text' in t) else 'int'
            cols.append((parts[0], kind))
        if not cols:
            raise RuntimeError(f'no schema for {table}: {r.stderr[-300:]}')
        _schema_cache[table] = cols
    return _schema_cache[table]


def meta(table: str) -> Tuple[str, Tuple[str, ...]]:
    """(stock WDBC file name, key columns) for any DBC table."""
    if table in TABLES:
        return TABLES[table]
    names = {p.name.lower(): p.name for p in ms.STOCK_DBC_DIR.glob('*.dbc')}
    fn = names.get(f'{table}.dbc')
    if not fn:
        raise RuntimeError(f'no stock DBC for {table}')
    cols = [c for c, _ in schema(table)]
    return fn, ('id',) if 'id' in cols else (cols[0],)


def _key(table: str, row: dict) -> tuple:
    return tuple(row[k] for k in meta(table)[1])


def stock_rows(table: str) -> Dict[tuple, dict]:
    """Stock rows from the clean client's WDBC, typed by the live schema."""
    cols = schema(table)
    data = (ms.STOCK_DBC_DIR / meta(table)[0]).read_bytes()
    n, fc, rs, _ = struct.unpack_from('<4I', data, 4)
    if fc != len(cols):
        raise RuntimeError(f'{table}: WDBC has {fc} fields, schema {len(cols)}')
    strings = data[20 + n * rs:]
    out = {}
    for i in range(n):
        o = 20 + i * rs
        row = {}
        for j, (name, kind) in enumerate(cols):
            raw = data[o + 4 * j: o + 4 * j + 4]
            if kind == 'float':
                v = struct.unpack('<f', raw)[0]
            elif kind == 'str':
                off = struct.unpack('<I', raw)[0]
                v = strings[off:strings.index(b'\0', off)].decode('utf-8', 'replace')
            else:
                v = struct.unpack('<i', raw)[0]
            row[name] = v
        out[_key(table, row)] = row
    return out


def _coerce(table: str, row: dict) -> dict:
    kinds = dict(schema(table))
    out = {}
    for k, v in row.items():
        kk = k.lower()
        kind = kinds.get(kk)
        if kind == 'float' and v is not None and not isinstance(v, str):
            v = float(v)
        elif kind == 'int' and isinstance(v, float) and v.is_integer():
            v = int(v)
        elif kind == 'int' and isinstance(v, int) and v > 0x7FFFFFFF:
            v -= 1 << 32                                  # uint32 literal of a signed column
        out[kk] = v
    return out


def apply_files(table: str, rows: Dict[tuple, dict], files: Iterable[Path]) -> Dict[tuple, dict]:
    """Apply the INSERT / INSERT SET / UPDATE / DELETE statements for `table`."""
    import re
    rows = {k: dict(v) for k, v in rows.items()}
    tname = re.compile(rf'(?is)^\s*(insert|replace|update|delete)\b[^;]*?`?{table}`?(\s|\(|$)')
    for f in files:
        for stmt in ms._split_statements(f.read_text(errors='replace')):
            m = tname.match(stmt)
            if not m:
                continue
            kind = m.group(1).lower()
            if kind in ('insert', 'replace'):
                cm = re.search(rf'(?is)`?{table}`?\s*\(([^)]*)\)\s*values\s*(.*)$', stmt)
                if cm:
                    cols = [c.strip(' `\n\t').lower() for c in cm.group(1).split(',')]
                    new = [dict(zip(cols, vals)) for vals in ms._tuple_values(cm.group(2))]
                else:
                    sp = re.split(r'(?is)\bset\b', stmt, 1)
                    new = [{k.lower(): ms._val(v) for k, v in ms._ASSIGN_RE.findall(sp[1])}] if len(sp) == 2 else []
                for r in new:
                    r = _coerce(table, r)
                    rows[_key(table, r)] = r
                continue
            preds = ms._parse_where(stmt)
            if preds is None:
                raise RuntimeError(f'{f.name}: unsupported WHERE: {" ".join(stmt.split())[:160]}')
            if meta(table)[1] == ('id',) and len(preds) == 1 and preds[0][0] == 'id' and preds[0][1] in ('=', 'in'):
                hits = [(int(v),) for v in preds[0][2] if (int(v),) in rows]      # fast path: by id
            else:
                hits = [k for k, r in rows.items() if ms._match(r, preds)]
            if kind == 'delete':
                for k in hits:
                    rows.pop(k, None)
            else:
                sets = _coerce(table, {k.lower(): ms._val(v) for k, v in ms._ASSIGN_RE.findall(
                    re.split(r'(?is)\bwhere\b', re.split(r'(?is)\bset\b', stmt, 1)[1])[0])})
                for k in hits:
                    rows[k] = {**rows[k], **sets}
    return rows


def _zpak_files(craft_root: Path, zpak: str, table: str, base_only: bool = False) -> List[Path]:
    d = craft_root / 'zpaks' / zpak / 'dbc'
    fs = sorted(p for p in d.glob('*.sql') if p.name.lower().endswith(f'_{table}.sql'))
    if base_only:
        fs = [p for p in fs if p.name.startswith('[BASE,')]
    return fs


def _same(a, b) -> bool:
    if isinstance(a, float) or isinstance(b, float):
        try:
            return abs(float(a) - float(b)) <= 1e-5 * max(1.0, abs(float(a)), abs(float(b)))
        except (TypeError, ValueError):
            return False
    if isinstance(a, str) or isinstance(b, str):
        return str(a).lower() == str(b).lower()
    return a == b


def _lit(v) -> str:
    if isinstance(v, str):
        return "'" + v.replace("'", "''") + "'"
    if isinstance(v, float):
        return repr(round(v, 6))
    return str(v)


class Layers:
    """Typed table states: stock, the curated base (stock + Maribeth's [BASE] files)
    and each candidate source's own state (stock + that zpak's files for the table)."""

    BASE_ZPAK = 'patch-hd-everything'

    def __init__(self, craft_root: Path):
        self.root = craft_root
        self._stock: Dict[str, dict] = {}
        self._state: Dict[Tuple[str, str], dict] = {}

    def stock(self, table: str) -> Dict[tuple, dict]:
        if table not in self._stock:
            self._stock[table] = stock_rows(table)
        return self._stock[table]

    def state(self, table: str, source: str) -> Dict[tuple, dict]:
        """'base' = what the curated zpak's [BASE] files produce; 'stock'; or a zpak."""
        k = (table, source)
        if k not in self._state:
            if source == 'stock':
                self._state[k] = self.stock(table)
            elif source in ('base', self.BASE_ZPAK):
                # the base pack's own [I-xxx] fixes apply after the overrides anyway
                self._state[k] = apply_files(table, self.stock(table),
                                             _zpak_files(self.root, self.BASE_ZPAK, table, base_only=True))
            else:
                self._state[k] = apply_files(table, self.stock(table), _zpak_files(self.root, source, table))
        return self._state[k]


def row_needs(result: dict, choices: Dict[str, dict], layers: Layers) -> Dict[Tuple[str, tuple], Dict[str, set]]:
    """(table, key) -> {source: displays} for every DBC row a choice depends on."""
    needs: Dict[Tuple[str, tuple], Dict[str, set]] = {}

    def need(table, key, src, did):
        needs.setdefault((table, key), {}).setdefault(src, set()).add(did)

    for did_s, c in choices.items():
        if not did_s.isdigit():
            continue                      # game objects / items: no DBC rows of their own
        did, src = int(did_s), c['source']
        cdi = layers.state('creaturedisplayinfo', src).get((did,))
        if not cdi:
            continue
        need('creaturedisplayinfo', (did,), src, did)
        mid = int(cdi.get('model_id') or 0)
        if mid:
            need('creaturemodeldata', (mid,), src, did)
        ext = int(cdi.get('extended_display_info_id') or 0)
        if ext:
            need('creaturedisplayinfoextra', (ext,), src, did)
            x = layers.state('creaturedisplayinfoextra', src).get((ext,))
            if x:
                race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
                # the race model's geoset + skin tables come with the pick of that body
                for t in ('characterfacialhairstyles', 'charhairgeosets', 'charsections'):
                    for k, r in layers.state(t, src).items():
                        if r.get('race') == race and r.get('gender') == sex:
                            need(t, k, src, did)
                    for k, r in layers.state(t, 'base').items():
                        if r.get('race') == race and r.get('gender') == sex:
                            need(t, k, src, did)
    return needs


def resolve_rows(needs: Dict[Tuple[str, tuple], Dict[str, set]], layers: Layers):
    """-> ({(table, key): wanted row or None}, collisions). The majority of displays
    wins a row that several picks disagree on."""
    wanted: Dict[Tuple[str, tuple], Optional[dict]] = {}
    collisions = []
    for (table, key), by_src in sorted(needs.items(), key=lambda kv: (kv[0][0], kv[0][1])):
        cands: Dict[str, Tuple[Optional[dict], set, List[str]]] = {}
        for src, dids in by_src.items():
            row = layers.state(table, src).get(key)
            sig = repr(sorted(row.items())) if row else 'ABSENT'
            if sig not in cands:
                cands[sig] = (row, set(), [])
            cands[sig][1].update(dids)
            cands[sig][2].append(src)
        ranked = sorted(cands.values(), key=lambda t: -len(t[1]))
        want, dids, srcs = ranked[0]
        if len(ranked) > 1:
            collisions.append({'table': table, 'key': list(key), 'kept': f"{'/'.join(srcs)} ({len(dids)} displays)",
                               'lost': [f"{'/'.join(s)} ({len(d)} displays)" for _, d, s in ranked[1:]],
                               'displays': {'/'.join(s): sorted(map(str, d)) for _, d, s in ranked}})
        wanted[(table, key)] = want
    return wanted, collisions


def base_tables(layers: Layers) -> List[str]:
    """Every table the base pack's [BASE] files touch."""
    out = set()
    for f in (layers.root / 'zpaks' / layers.BASE_ZPAK / 'dbc').glob('[[]BASE,*.sql'):
        out.add(f.name.split(']_', 1)[1][:-4].lower())
    return sorted(out)


def final_state(table: str, layers: Layers, wanted: Dict[Tuple[str, tuple], Optional[dict]]) -> Dict[tuple, dict]:
    """The curated collection's rows: the base pack's state, with every row a pick
    depends on replaced by the picked source's row."""
    rows = dict(layers.state(table, 'base'))
    for (t, key), row in wanted.items():
        if t != table:
            continue
        if row is None:
            rows.pop(key, None)
        else:
            rows[key] = row
    return rows


def stock_diff_sql(table: str, final: Dict[tuple, dict], stock: Dict[tuple, dict]) -> List[str]:
    """Stock -> curated, one statement per row: UPDATE of the columns that differ
    from STOCK; DELETE + INSERT for rows stock does not have; DELETE for stock rows
    the curated state removes."""
    cols = [c for c, _ in schema(table)]
    keyc = meta(table)[1]
    out = []

    def where(key):
        return ' AND '.join(f'`{k}` = {_lit(v)}' for k, v in zip(keyc, key))
    for key in sorted(set(final) | set(stock), key=lambda k: tuple(str(x) for x in k) if any(isinstance(x, str) for x in k) else k):
        f, st = final.get(key), stock.get(key)
        if f is None:
            out.append(f'DELETE FROM `{table}` WHERE {where(key)};')
        elif st is None:
            out.append(f'DELETE FROM `{table}` WHERE {where(key)};')
            out.append(f'INSERT INTO `{table}` (' + ', '.join(f'`{c}`' for c in cols) + ') VALUES ('
                       + ', '.join(_lit(f.get(c)) for c in cols) + ');')
        else:
            diff = [c for c in cols if not _same(f.get(c), st.get(c))]
            if diff:
                out.append(f'UPDATE `{table}` SET ' + ', '.join(f'`{c}` = {_lit(f.get(c))}' for c in diff)
                           + f' WHERE {where(key)};')
    return out


def curated_sql(layers: Layers, wanted: Dict[Tuple[str, tuple], Optional[dict]]) -> Dict[str, List[str]]:
    """{table: statements} for every table the base pack or a pick touches."""
    tables = sorted(set(base_tables(layers)) | {t for t, _ in wanted})
    return {t: stock_diff_sql(t, final_state(t, layers, wanted), layers.stock(t)) for t in tables}
