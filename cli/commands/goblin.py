"""zep goblin — Lost Isles / Kezan (F-011) source extraction + translation pipeline.

Replaces the standalone scripts in Scripts/Goblin Zone Port/ with a reproducible,
two-layer CLI pipeline:

  Layer 1 — source extraction (source data lives under Zeppelin-Tools/):
    extract-neltharion : load the Project Neltharion 4.3.4 world dump (a data-only
                         MariaDB dump) into a MySQL database on the existing server.
    extract-whitemane  : unpack the Whitemane 3.3.5a client MPQs (DBC / M2 / BLP).

  Layer 2 — translation (F-011):
    gen                : read Neltharion (MySQL) + extracted Whitemane DBCs + committed
                         fixtures -> [AUTO,F-011] world-DB SQL + DBC into the zpak, and
                         copy needed assets into the zpak MPQ folder.

Only the SQL/DBC emitters are in scope for CLI integration; heavy asset builds
(retroport, model conversion) remain separate for now.
"""
import os
import sys
import re
import glob
import zipfile
import subprocess

import click

# Load .env the same way the rest of the CLI does.
try:
    from lib.env import _env_file  # noqa: F401 — importing triggers load_dotenv
except Exception:
    from dotenv import load_dotenv
    load_dotenv(os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), ".env"))

# ---- config (env-overridable) ----
TOOLS = "/workspace/project/Zeppelin-Tools"
DEFAULT_WORLD_ZIP = os.getenv(
    "NELTHARION_WORLD_ZIP",
    os.path.join(TOOLS, "Neltharion-Source", "Project-Neltharion-4.3.4-Cataclysm",
                 "source", "sql", "base", "world.zip"),
)
NELTHARION_DB = os.getenv("NELTHARION_DB_NAME", "neltharion")
WHITEMANE_DATA = os.getenv("WHITEMANE_DATA", os.path.join(TOOLS, "whitemane-15595", "Data"))
WHITEMANE_OUT = os.getenv("WHITEMANE_OUT", os.path.join(os.path.dirname(WHITEMANE_DATA), "extracted"))
MPQCLI = os.getenv("MPQCLI_PATH", os.path.join(TOOLS, "mpqcli", "mpqcli"))

DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_PORT = int(os.getenv("DB_PORT", "3306"))
DB_ROOT_USER = os.getenv("DB_ROOT_USER", "root")
DB_ROOT_PASS = os.getenv("DB_ROOT_PASS", "")

# Content tables the F-011 translation layer reads. --all-tables overrides this.
TARGET_TABLES = {
    "creature_template", "creature", "creature_template_addon", "creature_addon",
    "creature_equip_template", "creature_model_info", "creature_text",
    "creature_loot_template", "creature_questrelation", "creature_involvedrelation",
    "quest_template", "quest_template_perma", "quest_poi", "quest_poi_points",
    "gameobject_template", "gameobject", "gameobject_loot_template",
    "gameobject_questrelation", "gameobject_involvedrelation",
    "smart_scripts", "gossip_menu", "gossip_menu_option",
    "waypoints", "waypoint_data", "points_of_interest", "conditions",
    "reference_loot_template", "npc_text",
    "skinning_loot_template", "pickpocketing_loot_template",
    "npc_trainer", "npc_vendor", "spell_dbc",
}

_HDR = re.compile(r"^\s*REPLACE\s+INTO\s+`([a-z0-9_]+)`\s*\(([^)]*)\)\s+VALUES\s+", re.I | re.S)


# ---------------------------------------------------------------------------
# Dump parsing (adapted from Scripts/Goblin Zone Port/load_dump.py — the dump is
# a HeidiSQL/MariaDB data-only export: `REPLACE INTO `t` (cols) VALUES (..),(..);`)
# ---------------------------------------------------------------------------
def _statements(fh, chunk=1 << 20):
    """Yield complete SQL statements from a text stream, splitting on top-level ';'."""
    buf, in_str, esc = [], False, False
    while True:
        data = fh.read(chunk)
        if not data:
            break
        for ch in data:
            if in_str:
                buf.append(ch)
                if esc:
                    esc = False
                elif ch == "\\":
                    esc = True
                elif ch == "'":
                    in_str = False
                continue
            if ch == "'":
                in_str = True
                buf.append(ch)
            elif ch == ";":
                yield "".join(buf)
                buf = []
            else:
                buf.append(ch)
    tail = "".join(buf).strip()
    if tail:
        yield tail


def _parse_values(s):
    """Split a VALUES payload '(a,b),(c,d)' into a list of rows (NULL -> None)."""
    rows = []
    i, n = 0, len(s)
    while i < n:
        while i < n and s[i] != '(':
            i += 1
        if i >= n:
            break
        i += 1
        row, field = [], []
        in_str, started_str = False, False
        while i < n:
            c = s[i]
            if in_str:
                if c == '\\':
                    nxt = s[i + 1] if i + 1 < n else ''
                    field.append({'n': '\n', 'r': '\r', 't': '\t', '0': '\0'}.get(nxt, nxt))
                    i += 2
                    continue
                if c == "'":
                    if i + 1 < n and s[i + 1] == "'":
                        field.append("'")
                        i += 2
                        continue
                    in_str = False
                    i += 1
                    continue
                field.append(c)
                i += 1
                continue
            if c == "'":
                in_str, started_str = True, True
                i += 1
                continue
            if c == ',' or c == ')':
                raw = "".join(field)
                row.append(None if (not started_str and raw.strip().upper() == "NULL") else raw)
                field, started_str = [], False
                if c == ')':
                    rows.append(row)
                    i += 1
                    break
                i += 1
                continue
            field.append(c)
            i += 1
    return rows


_INT_RE = re.compile(r'^-?\d+$')
_FLOAT_RE = re.compile(r'^-?(?:\d+\.\d*|\.\d+|\d+(?:\.\d*)?)(?:[eE][-+]?\d+)?$')


def _infer_types(fh, want):
    """Stream the dump once and infer a proper column type per table column.

    The Neltharion (SkyFire/ArkCORE lineage) world schema is not shipped as DDL —
    only the data-only dump exists — so we derive INT/BIGINT/DOUBLE/VARCHAR/TEXT
    from the actual values. O(columns) memory; no rows held.
    """
    info = {}
    for stmt in _statements(fh):
        m = _HDR.match(stmt)
        if not m:
            continue
        t = m.group(1)
        if want is not None and t not in want:
            continue
        cols = [c.strip().strip('`') for c in m.group(2).split(',')]
        d = info.get(t)
        if d is None:
            k = len(cols)
            d = info[t] = {"cols": cols, "int": [True] * k, "flt": [True] * k,
                           "seen": [False] * k, "maxlen": [0] * k, "maxabs": [0] * k}
        for r in _parse_values(stmt[m.end():]):
            if len(r) != len(cols):
                continue
            for i, v in enumerate(r):
                if v is None:
                    continue
                d["seen"][i] = True
                if len(v) > d["maxlen"][i]:
                    d["maxlen"][i] = len(v)
                s = v.strip()
                if d["int"][i]:
                    if _INT_RE.match(s):
                        a = abs(int(s))
                        if a > d["maxabs"][i]:
                            d["maxabs"][i] = a
                    else:
                        d["int"][i] = False
                if d["flt"][i] and not _FLOAT_RE.match(s):
                    d["flt"][i] = False

    schema = {}
    for t, d in info.items():
        cols_out = []
        for i, c in enumerate(d["cols"]):
            if not d["seen"][i]:
                ty = "INT"                      # all-NULL column
            elif d["int"][i]:
                ty = "BIGINT" if d["maxabs"][i] > 2147483647 else "INT"
            elif d["flt"][i]:
                ty = "DOUBLE"
            else:
                L = d["maxlen"][i]
                ty = (f"VARCHAR({max(1, L)})" if L <= 255
                      else "TEXT" if L <= 65535
                      else "MEDIUMTEXT" if L <= 16777215 else "LONGTEXT")
            cols_out.append((c, ty))
        schema[t] = cols_out
    return schema


def _open_world_sql(world_zip):
    """Return a text stream over world.sql, from a .zip or a plain .sql path."""
    if world_zip.lower().endswith(".zip"):
        zf = zipfile.ZipFile(world_zip)
        name = next((n for n in zf.namelist() if n.lower().endswith(".sql")), None)
        if not name:
            raise click.ClickException(f"No .sql member found inside {world_zip}")
        import io
        return io.TextIOWrapper(zf.open(name), encoding="utf-8", errors="replace")
    return open(world_zip, "r", encoding="utf-8", errors="replace")


def _root_connect(database=None):
    try:
        import mysql.connector
    except ImportError:
        raise click.ClickException("mysql-connector-python is required (pip install mysql-connector-python)")
    return mysql.connector.connect(
        host=DB_HOST, port=DB_PORT, user=DB_ROOT_USER, password=DB_ROOT_PASS,
        database=database, autocommit=False,
    )


# ---------------------------------------------------------------------------
# Command group
# ---------------------------------------------------------------------------
@click.group()
def goblin():
    """Lost Isles / Kezan (F-011) source extraction + translation pipeline."""


@goblin.command("extract-neltharion")
@click.option("--world-zip", default=DEFAULT_WORLD_ZIP, show_default=True,
              help="Path to the Neltharion world dump (.zip or .sql).")
@click.option("--db", "db_name", default=NELTHARION_DB, show_default=True,
              help="Target MySQL database to (re)create.")
@click.option("--all-tables", is_flag=True,
              help="Load every table in the dump, not just the F-011 content tables.")
@click.option("--batch", default=2000, show_default=True, help="Rows per INSERT batch.")
@click.option("--text-schema", is_flag=True,
              help="Skip type inference; make every column LONGTEXT (faster, single pass).")
def extract_neltharion(world_zip, db_name, all_tables, batch, text_schema):
    """Load the Project Neltharion 4.3.4 world dump into a MySQL database.

    The dump is data-only (REPLACE INTO ... VALUES) and the Neltharion (SkyFire/
    ArkCORE lineage) schema DDL is not shipped, so column TYPES are inferred from
    the data — a first pass derives INT/BIGINT/DOUBLE/VARCHAR/TEXT per column, then
    a second pass creates the typed tables and bulk-loads. --text-schema skips
    inference (all LONGTEXT, one pass). Idempotent: DROP + CREATE DATABASE first.
    """
    if not os.path.exists(world_zip):
        raise click.ClickException(f"World dump not found: {world_zip}")
    want = None if all_tables else TARGET_TABLES

    # ---- pass 1: infer column types (unless --text-schema) ----
    schema = None
    if not text_schema:
        click.echo("Pass 1/2: inferring column types from data ...")
        fh = _open_world_sql(world_zip)
        try:
            schema = _infer_types(fh, want)
        finally:
            fh.close()
        click.echo(f"  inferred types for {len(schema)} tables")

    click.echo(f"Recreating database `{db_name}` on {DB_HOST}:{DB_PORT} ...")
    root = _root_connect()
    cur = root.cursor()
    cur.execute(f"DROP DATABASE IF EXISTS `{db_name}`")
    cur.execute(f"CREATE DATABASE `{db_name}` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
    cur.close()
    root.close()

    con = _root_connect(db_name)
    cur = con.cursor()
    cur.execute("SET SESSION sql_mode=''")
    cur.execute("SET SESSION unique_checks=0")
    cur.execute("SET SESSION foreign_key_checks=0")

    def _create(t, cols):
        if schema is not None:
            defs = [f"`{c}` {ty}" for c, ty in schema[t]]
            keyty = schema[t][0][1]
            keylen = "(64)" if keyty.upper() in ("TEXT", "MEDIUMTEXT", "LONGTEXT") else ""
        else:
            defs = [f"`{cols[0]}` VARCHAR(64)"] + [f"`{c}` LONGTEXT" for c in cols[1:]]
            keylen = ""
        cur.execute(f"CREATE TABLE `{t}` ({', '.join(defs)}, KEY `k0` (`{cols[0]}`{keylen})) ENGINE=InnoDB")

    created, counts, warned = set(), {}, {}
    click.echo(f"Pass 2/2: loading {'(typed)' if schema else '(text)'} tables ...")
    fh = _open_world_sql(world_zip)
    try:
        for stmt in _statements(fh):
            m = _HDR.match(stmt)
            if not m:
                continue
            t = m.group(1)
            if want is not None and t not in want:
                continue
            cols = [c.strip().strip('`') for c in m.group(2).split(',')]
            if t not in created:
                _create(t, cols)
                created.add(t)
                counts[t] = 0
            rows = _parse_values(stmt[m.end():])
            good = [r for r in rows if len(r) == len(cols)]
            if len(good) != len(rows):
                warned[t] = warned.get(t, 0) + (len(rows) - len(good))
            ph = "(" + ",".join(["%s"] * len(cols)) + ")"
            insert = f"INSERT INTO `{t}` VALUES {ph}"
            for j in range(0, len(good), batch):
                cur.executemany(insert, good[j:j + batch])
            counts[t] += len(good)
        con.commit()
    finally:
        fh.close()
        cur.close()
        con.close()

    click.echo(f"\nLoaded {len(counts)} tables into `{db_name}`:")
    for t in sorted(counts):
        w = f"  (WARN {warned[t]} col-mismatch)" if t in warned else ""
        click.echo(f"  {t:34} {counts[t]:>9,} rows{w}")
    click.echo("\nNext: `zep goblin extract-whitemane`, then `zep goblin gen`.")


# WoW 4.3.4 client MPQ load order, low -> high priority (later overrides earlier).
# Tiers: base content < locale archives < wow-update-* patches (by build). Within the
# base tier, supplementary/newer archives rank later. In this client the only cross-
# archive conflicts are terrain (world/world2/expansionN) + a few sound files;
# DBFilesClient and creature/item models/textures do NOT conflict, so this ordering
# affects only terrain fidelity, never the F-011 translation inputs.
_BASE_RANK = [
    ("world.mpq", 10), ("world2.mpq", 11),
    ("expansion1.mpq", 20), ("expansion2.mpq", 21), ("expansion3.mpq", 22),
    ("oldworld.mpq", 30), ("sound.mpq", 40), ("art.mpq", 41),
    ("alternate.mpq", 50), ("base-", 51),
]


def _order_mpqs(paths, data_dir):
    """Order MPQs so the client's highest-priority version of each file is written last."""
    data_dir = os.path.abspath(data_dir)

    def key(p):
        name = os.path.basename(p).lower()
        if "wow-update" in name:                       # patch tier: always last, by build
            m = re.search(r"(\d{4,6})", name)
            return (300, int(m.group(1)) if m else 0, name)
        is_locale = os.path.dirname(os.path.abspath(p)) != data_dir
        if is_locale:                                  # locale tier: above base, below patches
            sub = 5 if name.startswith("expansion") else 20 if "speech" in name else 10
            return (200, sub, name)
        for pat, r in _BASE_RANK:                       # base tier: explicit rank
            if name == pat or name.startswith(pat):
                return (100, r, name)
        return (100, 90, name)

    return sorted(paths, key=key)


@goblin.command("extract-whitemane")
@click.option("--data", "data_dir", default=WHITEMANE_DATA, show_default=True,
              help="Whitemane client Data/ directory containing the .MPQ archives.")
@click.option("--out", "out_dir", default=WHITEMANE_OUT, show_default=True,
              help="Output directory for the merged extracted tree.")
@click.option("--include-cache", is_flag=True,
              help="Also extract Data/Cache/*.MPQ (runtime caches; normally skipped).")
def extract_whitemane(data_dir, out_dir, include_cache):
    """Extract every Whitemane 4.3.4 client MPQ into one merged tree.

    Walks Data/*.MPQ plus the locale sub-dirs (Data/<locale>/*.MPQ) and extracts
    each archive (keeping folder structure) into a single output tree. Archives are
    applied in patch order — base/locale first, then wow-update-* by build number —
    so later patches overwrite earlier files, yielding the effective client
    filesystem (DBFilesClient DBCs/DB2s, M2, BLP, etc.).
    """
    if not os.path.isdir(data_dir):
        raise click.ClickException(f"Whitemane Data dir not found: {data_dir}")
    if not os.path.exists(MPQCLI):
        raise click.ClickException(f"mpqcli not found at {MPQCLI} (set MPQCLI_PATH)")

    mpqs = glob.glob(os.path.join(data_dir, "*.[Mm][Pp][Qq]"))
    for sub in sorted(os.listdir(data_dir)):
        subp = os.path.join(data_dir, sub)
        if not os.path.isdir(subp):
            continue
        if sub.lower() == "cache" and not include_cache:
            continue
        mpqs += glob.glob(os.path.join(subp, "*.[Mm][Pp][Qq]"))
    if not mpqs:
        raise click.ClickException(f"No .MPQ archives found under {data_dir}")

    mpqs = _order_mpqs(mpqs, data_dir)
    os.makedirs(out_dir, exist_ok=True)
    click.echo(f"Extracting {len(mpqs)} MPQ(s) into {out_dir}")
    click.echo("(patch order: base/locale first, wow-update-* last)\n")

    ok, failures = 0, []
    for i, m in enumerate(mpqs, 1):
        click.echo(f"[{i:2}/{len(mpqs)}] {os.path.basename(m)}")
        r = subprocess.run([MPQCLI, "extract", m, "-o", out_dir, "-k"],
                           capture_output=True, text=True)
        if r.returncode == 0:
            ok += 1
        else:
            failures.append((os.path.basename(m), (r.stderr or r.stdout or "").strip()[:200]))

    dbc = len(glob.glob(os.path.join(out_dir, "DBFilesClient", "*")))
    click.echo(f"\nExtracted {ok}/{len(mpqs)} MPQs into {out_dir}")
    click.echo(f"DBFilesClient entries: {dbc}")
    if failures:
        click.echo("\nFailures:")
        for n, e in failures:
            click.echo(f"  {n}: {e}")
    click.echo("\nNext: `zep goblin gen`.")


@goblin.command("gen")
@click.argument("target", required=False, default="all")
def gen(target):
    """Translate Neltharion + Whitemane -> [AUTO,F-011] SQL/DBC + assets. [Phase 2 — TODO]"""
    raise click.ClickException(
        "gen is not implemented yet (Phase 2). It will port the SQL/DBC emitters "
        "from Scripts/Goblin Zone Port/ to read the neltharion MySQL DB + extracted "
        "Whitemane DBCs + committed fixtures and emit [AUTO,F-011] output."
    )
