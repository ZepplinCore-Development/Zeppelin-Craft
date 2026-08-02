"""md5translate.trs <-> SQL utilities (F-201).

The client minimap texture table (textures/minimap/md5translate.trs) is managed
like a DBC table: rows live in the `md5translate` table of the DBC databases
(original_dbc = stock layer, dbc = live, expected_dbc = tracking), zpak SQL
files layer modifications on top, and the PATCH-Z build serializes the live
table back into a complete .trs via the 'trs-generate' preprocessor.

File format (CRLF text):
    dir: <section name>
    <src path>\t<dst file>
    ...

Client lookup semantics (verified against the upstream OA 2025 file):
- The client resolves entries by src path; when a src appears on multiple
  lines, the LAST occurrence wins (OA appends fix-layer sections that
  re-map earlier Crestfall/expansion tiles to plain Azeroth_X_Y tiles, and
  the plain tiles are what renders in-game).
- Section headers are not reliably dirname(src) upstream (space-truncated
  headers like "WMO\\KhazModan\\Collidable" exist), so the header string is
  stored verbatim per row and reproduced on serialization.
"""

from pathlib import Path
from typing import Dict, List, Tuple

TABLE = 'md5translate'

CREATE_TABLE_SQL = f"""
CREATE TABLE IF NOT EXISTS `{TABLE}` (
  `src` VARCHAR(150) NOT NULL,
  `dst` VARCHAR(100) NOT NULL,
  `dir` VARCHAR(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
"""


def parse_trs(data: bytes) -> Dict[str, Tuple[str, str]]:
    """Parse .trs bytes into {src_lower: (src, dst, dir)} with last-wins dedup.

    Returns a dict keyed on lowercased src; values keep the raw src of the
    last occurrence so serialization reproduces original casing.
    """
    entries: Dict[str, Tuple[str, str, str]] = {}
    cur_dir = ''
    for line in data.decode('utf-8').split('\r\n'):
        if not line.strip():
            continue
        if line.startswith('dir: '):
            cur_dir = line[5:]
            continue
        if '\t' not in line:
            continue  # tolerate malformed lines rather than dying mid-build
        src, dst = line.split('\t', 1)
        entries[src.lower()] = (src, dst, cur_dir)
    return entries


def parse_trs_file(path: Path) -> Dict[str, Tuple[str, str, str]]:
    return parse_trs(Path(path).read_bytes())


def serialize_trs(rows: List[Tuple[str, str, str]]) -> bytes:
    """Serialize (src, dst, dir) rows into deterministic .trs bytes.

    Rows are grouped into dir: sections; sections and entries are sorted
    case-insensitively so repeated builds are byte-identical. The client
    keys lookups on src, so ordering differences vs the upstream file are
    cosmetic.
    """
    sections: Dict[str, List[Tuple[str, str]]] = {}
    for src, dst, d in rows:
        sections.setdefault(d, []).append((src, dst))
    out: List[str] = []
    for d in sorted(sections, key=str.lower):
        out.append(f'dir: {d}')
        for src, dst in sorted(sections[d], key=lambda e: e[0].lower()):
            out.append(f'{src}\t{dst}')
    return ('\r\n'.join(out) + '\r\n').encode('utf-8')


def sql_str(s: str) -> str:
    """Escape a value for a MySQL single-quoted string literal.

    Backslashes are path separators in every row, so they MUST be doubled
    (MySQL treats backslash as an escape character by default).
    """
    return "'" + s.replace('\\', '\\\\').replace("'", "''") + "'"


def emit_sql(rows: List[Tuple[str, str, str]], header_lines: List[str],
             batch: int = 250) -> str:
    """Emit idempotent DELETE+INSERT SQL for (src, dst, dir) rows.

    Follows the [BASE,...] convention (delete owned rows, then insert),
    batched so the OA-sized layer (~20k rows) stays applyable in seconds.
    """
    rows = sorted(rows, key=lambda r: (r[2].lower(), r[0].lower()))
    lines: List[str] = list(header_lines)
    for i in range(0, len(rows), batch):
        chunk = rows[i:i + batch]
        keys = ', '.join(sql_str(r[0]) for r in chunk)
        lines.append(f'DELETE FROM `{TABLE}` WHERE `src` IN ({keys});')
        values = ',\n'.join(
            f'({sql_str(r[0])}, {sql_str(r[1])}, {sql_str(r[2])})'
            for r in chunk)
        lines.append(
            f'INSERT INTO `{TABLE}` (`src`, `dst`, `dir`) VALUES\n{values};')
    return '\n'.join(lines) + '\n'


def export_trs_from_db(config, database: str, out_path: Path) -> int:
    """Serialize `md5translate` from a DBC database into a .trs file.

    Shared by 'zep dbc trs export' and the 'trs-generate' build preprocessor.
    Returns the number of entries written.
    """
    from lib.dbc_utils import DBCConnection

    with DBCConnection(config) as db_conn:
        conn = db_conn.get_connection(database)
        cur = conn.cursor()
        cur.execute(f"SELECT `src`, `dst`, `dir` FROM `{TABLE}`")
        rows = list(cur.fetchall())
        cur.close()
    out_path = Path(out_path)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_bytes(serialize_trs(rows))
    return len(rows)


def diff_rows(file_entries: Dict[str, Tuple[str, str, str]],
              base_entries: Dict[str, Tuple[str, str, str]]):
    """Split a full-file entry dict into (changed_or_new, removed) vs a base.

    changed_or_new: rows in the file that are absent from or differ from the
    base layer (these become the zpak's SQL layer).
    removed: srcs present in base but absent from the file (emitted as
    DELETEs so a zpak can retire stock entries).
    """
    changed = []
    for k, (src, dst, d) in file_entries.items():
        b = base_entries.get(k)
        if b is None or b[1] != dst or b[2] != d:
            changed.append((src, dst, d))
    removed = [base_entries[k][0] for k in base_entries if k not in file_entries]
    return changed, removed
