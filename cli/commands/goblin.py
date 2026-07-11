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
import zipfile

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
def extract_neltharion(world_zip, db_name, all_tables, batch):
    """Load the Project Neltharion 4.3.4 world dump into a MySQL database.

    The dump is data-only (REPLACE INTO ... VALUES). Each target table is created
    with a VARCHAR key column + LONGTEXT columns (the translation layer casts
    values itself), then bulk-loaded. Idempotent: DROP + CREATE DATABASE first.
    """
    if not os.path.exists(world_zip):
        raise click.ClickException(f"World dump not found: {world_zip}")

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

    created, counts, warned = set(), {}, {}
    want = None if all_tables else TARGET_TABLES

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
                # first column (usually the PK) is an indexed VARCHAR; rest LONGTEXT.
                defs = [f"`{cols[0]}` VARCHAR(64)"] + [f"`{c}` LONGTEXT" for c in cols[1:]]
                cur.execute(f"CREATE TABLE `{t}` ({', '.join(defs)}, KEY `k0` (`{cols[0]}`)) ENGINE=InnoDB")
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


@goblin.command("extract-whitemane")
@click.option("--data", "data_dir", default=WHITEMANE_DATA, show_default=True,
              help="Whitemane client Data/ directory containing the .MPQ archives.")
def extract_whitemane(data_dir):
    """Unpack the Whitemane 3.3.5a client MPQs (DBC / M2 / BLP). [Phase 1b — TODO]"""
    raise click.ClickException(
        "extract-whitemane is not implemented yet (Phase 1b). It will unpack "
        f"{data_dir}/*.MPQ via mpqcli (MPQCLI_PATH) into an extracted-assets cache."
    )


@goblin.command("gen")
@click.argument("target", required=False, default="all")
def gen(target):
    """Translate Neltharion + Whitemane -> [AUTO,F-011] SQL/DBC + assets. [Phase 2 — TODO]"""
    raise click.ClickException(
        "gen is not implemented yet (Phase 2). It will port the SQL/DBC emitters "
        "from Scripts/Goblin Zone Port/ to read the neltharion MySQL DB + extracted "
        "Whitemane DBCs + committed fixtures and emit [AUTO,F-011] output."
    )
