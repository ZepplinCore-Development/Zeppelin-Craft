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
import struct
import shutil
import hashlib
import zipfile
import tempfile
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
# wago Cata Classic (4.4.x) CSV extracts — a 3rd reference source that carries fields
# the 4.3.4 client computes at runtime and doesn't store (weapon MinDamage/MaxDamage,
# MaxDurability, etc.). Lives under Zeppelin-Tools; source of the committed item data.
WAGO_DIR = os.getenv("WAGO_DIR", os.path.join(TOOLS, "wago-cata-classic"))

DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_PORT = int(os.getenv("DB_PORT", "3306"))
DB_ROOT_USER = os.getenv("DB_ROOT_USER", "root")
DB_ROOT_PASS = os.getenv("DB_ROOT_PASS", "")

# 3.3.5a DBC database (target client data) + zpak / fixtures for the gen layer.
DBC_HOST = os.getenv("DBC_HOST", DB_HOST)
DBC_PORT = int(os.getenv("DBC_PORT", str(DB_PORT)))
DBC_USER = os.getenv("DBC_USER", os.getenv("DB_USER", "acore"))
DBC_PASS = os.getenv("DBC_PASS", os.getenv("DB_PASS", "acore"))
DBC_NAME = os.getenv("LIVE_DBC_NAME", "dbc")   # the live DBC data db (not the spell-editor db)
# Pristine 3.3.5a stock DBC (never modified). Resolving stock references against this
# (not the live/edited db) keeps generation deterministic regardless of applied state.
STOCK_DBC_NAME = os.getenv("BACKUP_DBC_NAME", "original_dbc")
_CLI_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ZPAK_DIR = os.path.join(os.path.dirname(_CLI_DIR), "zpaks", "zep-goblin-start")
FIXTURES_DIR = os.path.join(_CLI_DIR, "data", "goblin", "fixtures")

# Banner stamped onto generated [AUTO,F-011] output (matches the pipeline banner).
_AUTO_BANNER = (
    "-- ============================================================\n"
    "-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.\n"
    "-- Produced by `zep goblin gen` (F-011 translation layer).\n"
    "-- Any manual edit here is overwritten the next time gen runs.\n"
    "--   * To change this output: edit the gen emitter or a fixture.\n"
    "--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file\n"
    "--     (it loads after these rows and overrides the ones it needs).\n"
    "-- ============================================================\n\n"
)

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
    "npc_trainer", "npc_vendor", "npc_spellclick_spells", "spell_dbc",
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


# --------------------------------------------------------------------------
# StormLib incremental-patch (PTCH) application.
# The wow-update-*.MPQ archives store many files (incl. the key DBCs) as PTCH
# incremental patches (RLE-compressed StormLib BSDIFF40). mpqcli extracts the raw
# PTCH; to get the effective client file we must apply the patch chain onto the
# base. Ported verbatim from StormLib SFilePatchArchives.cpp (TPatchHeader /
# Decompress_RLE / ApplyMpqPatch_BSD0); verified against each patch's own MD5.
# --------------------------------------------------------------------------
_PTCH_HEADER_SIZE = 68            # sizeof(TPatchHeader)
_SIZE_OF_XFRM_HEADER = 0x0C


def _decompress_rle(comp, cb_out):
    out = bytearray(cb_out)       # pre-filled with zeros
    src, dst, n = 4, 0, len(comp)  # skip the leading DWORD
    while src < n and dst < cb_out:
        b = comp[src]; src += 1
        if b & 0x80:
            take = min((b & 0x7F) + 1, n - src, cb_out - dst)
            out[dst:dst + take] = comp[src:src + take]
            dst += take; src += take
        else:
            dst += (b + 1)
    return bytes(out)


def _apply_bsdiff(old, blob):
    import numpy as np
    sig, ctrl_sz, data_sz, _new = struct.unpack_from("<8sQQQ", blob, 0)
    if sig != b"BSDIFF40":
        raise ValueError("bad BSDIFF signature %r" % sig)
    p = 32
    ctrl = blob[p:p + ctrl_sz]; p += ctrl_sz
    data = blob[p:p + data_sz]; p += data_sz
    extra = blob[p:]
    old = np.frombuffer(old, dtype=np.uint8)
    new = np.zeros(_new, dtype=np.uint8)
    no = oo = cp = dp = ep = 0
    osz = len(old)
    while no < _new:
        add, mov, omv = struct.unpack_from("<III", ctrl, cp); cp += 12
        if add:
            seg = np.frombuffer(data[dp:dp + add], dtype=np.uint8).copy(); dp += add
            k = min(add, osz - oo)
            if k > 0:
                seg[:k] = (seg[:k] + old[oo:oo + k]) & 0xFF
            new[no:no + add] = seg; no += add; oo += add
        if mov:
            new[no:no + mov] = np.frombuffer(extra[ep:ep + mov], dtype=np.uint8)
            ep += mov; no += mov
        if omv & 0x80000000:
            omv = (0x80000000 - omv) & 0xFFFFFFFF
        oo = (oo + omv) & 0xFFFFFFFF
    return new.tobytes()


def _apply_ptch(base, ptch):
    """Apply a StormLib PTCH incremental patch to `base`, returning the patched bytes."""
    if ptch[:4] != b"PTCH":
        raise ValueError("not a PTCH file")
    sz_data = struct.unpack_from("<I", ptch, 0x04)[0]
    md5_before, md5_after = ptch[0x18:0x28], ptch[0x28:0x38]
    if ptch[0x38:0x3C] != b"XFRM":
        raise ValueError("missing XFRM block")
    xfrm_sz = struct.unpack_from("<I", ptch, 0x3C)[0]
    ptype = ptch[0x40:0x44]
    if hashlib.md5(base).digest() != md5_before:
        raise ValueError("base md5 does not match patch's md5_before")
    payload = ptch[_PTCH_HEADER_SIZE:_PTCH_HEADER_SIZE + (xfrm_sz - _SIZE_OF_XFRM_HEADER)]
    if ptype == b"COPY":
        result = payload
    elif ptype == b"BSD0":
        cb_dec = sz_data - _PTCH_HEADER_SIZE
        blob = _decompress_rle(payload, cb_dec) if len(payload) < cb_dec else payload[:cb_dec]
        result = _apply_bsdiff(base, blob)
    else:
        raise ValueError("unknown patch type %r" % ptype)
    if hashlib.md5(result).digest() != md5_after:
        raise ValueError("patched result md5 mismatch")
    return result


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

    ok, patched, failures = 0, 0, []
    for i, m in enumerate(mpqs, 1):
        is_patch = "wow-update" in os.path.basename(m).lower()
        click.echo(f"[{i:2}/{len(mpqs)}] {os.path.basename(m)}{'  (patch)' if is_patch else ''}")

        if not is_patch:
            # base/locale archive: complete files, extract straight into the tree
            r = subprocess.run([MPQCLI, "extract", m, "-o", out_dir, "-k"],
                               capture_output=True, text=True)
            if r.returncode == 0:
                ok += 1
            else:
                failures.append((os.path.basename(m), (r.stderr or r.stdout or "").strip()[:200]))
            continue

        # patch archive: extract to a temp dir, then merge each file. PTCH files are
        # applied onto the current tree version (chain); complete files just overwrite.
        tmp = tempfile.mkdtemp(prefix="wm_patch_")
        try:
            r = subprocess.run([MPQCLI, "extract", m, "-o", tmp, "-k"],
                               capture_output=True, text=True)
            if r.returncode != 0:
                failures.append((os.path.basename(m), (r.stderr or r.stdout or "").strip()[:200]))
                continue
            ok += 1
            for root, _dirs, files in os.walk(tmp):
                for fn in files:
                    src = os.path.join(root, fn)
                    rel = os.path.relpath(src, tmp)
                    dst = os.path.join(out_dir, rel)
                    with open(src, "rb") as fh:
                        data = fh.read()
                    if data[:4] == b"PTCH":
                        if not os.path.exists(dst):
                            failures.append((rel, "PTCH with no base file to patch"))
                            continue
                        try:
                            with open(dst, "rb") as fh:
                                base = fh.read()
                            merged = _apply_ptch(base, data)
                        except Exception as e:  # keep the base file rather than a broken one
                            failures.append((rel, f"patch apply failed: {e}"))
                            continue
                        with open(dst, "wb") as fh:
                            fh.write(merged)
                        patched += 1
                    else:
                        os.makedirs(os.path.dirname(dst), exist_ok=True)
                        with open(dst, "wb") as fh:
                            fh.write(data)
        finally:
            shutil.rmtree(tmp, ignore_errors=True)

    dbc = len(glob.glob(os.path.join(out_dir, "DBFilesClient", "*")))
    still_ptch = sum(1 for f in glob.glob(os.path.join(out_dir, "DBFilesClient", "*"))
                     if open(f, "rb").read(4) == b"PTCH")
    click.echo(f"\nExtracted {ok}/{len(mpqs)} MPQs into {out_dir}")
    click.echo(f"Applied {patched} incremental patches")
    click.echo(f"DBFilesClient entries: {dbc}  (unresolved PTCH: {still_ptch})")
    if failures:
        click.echo(f"\n{len(failures)} issue(s):")
        for n, e in failures[:20]:
            click.echo(f"  {n}: {e}")
    click.echo("\nNext: `zep goblin gen`.")


# --------------------------------------------------------------------------
# Layer 2 — translation (gen). Reads: neltharion (MySQL, Cata source), the 3.3.5a
# DBC db (target client data), extracted Whitemane DBCs, and committed fixtures.
# Emits [AUTO,F-011]-tagged SQL/DBC into the zpak. Each domain is a _gen_* fn.
# --------------------------------------------------------------------------
def _zpak_write(rel_name, body):
    path = os.path.join(ZPAK_DIR, rel_name)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(_AUTO_BANNER + body)
    return path


class _GenCtx:
    def __init__(self, sfx, col=None):
        import mysql.connector
        self.sfx = sfx                       # "" (Lost Isles) or "_K" (Kezan)
        self.zone = sfx                      # alias used by collector-aware domains
        self.col = col                       # shared cross-zone Collector (or None pre-migration)
        self.nel = mysql.connector.connect(
            host=DB_HOST, port=DB_PORT, user=DB_ROOT_USER, password=DB_ROOT_PASS,
            database=NELTHARION_DB, autocommit=False)
        self._dbc = None

    def q(self, sql, params=None):
        cur = self.nel.cursor(dictionary=True)
        cur.execute(sql, params or ())
        rows = cur.fetchall(); cur.close()
        return rows

    def dbc_spell_ids(self):
        """Spell IDs present in the 3.3.5a target DBC (what a trainer can teach)."""
        import mysql.connector
        con = mysql.connector.connect(host=DBC_HOST, port=DBC_PORT, user=DBC_USER,
                                      password=DBC_PASS, database=DBC_NAME)
        cur = con.cursor(); cur.execute("SELECT ID FROM spell")
        ids = set(r[0] for r in cur.fetchall()); cur.close(); con.close()
        return ids

    def fixture(self, name):
        import json
        return json.load(open(os.path.join(FIXTURES_DIR, name + ".json")))

    def dbc_query(self, sql, params=None, db=None):
        """Query the live 3.3.5a DBC database (target client data), or `db` if given."""
        import mysql.connector
        con = mysql.connector.connect(host=DBC_HOST, port=DBC_PORT, user=DBC_USER,
                                      password=DBC_PASS, database=db or DBC_NAME)
        cur = con.cursor(dictionary=True); cur.execute(sql, params or ())
        rows = cur.fetchall(); cur.close(); con.close()
        return rows

    def stock_dbc_query(self, sql, params=None):
        """Query the pristine stock DBC (original_dbc). Use this for STOCK references
        so generation is deterministic and independent of what has been applied live."""
        return self.dbc_query(sql, params, db=STOCK_DBC_NAME)

    def whitemane_dbc(self, name):
        """Path to an extracted (fully patched) Whitemane Cata DBC/DB2 file."""
        return os.path.join(WHITEMANE_OUT, "DBFilesClient", name)

    def wago(self, name):
        """Rows (list[dict]) from a wago Cata Classic 4.4.x CSV extract, e.g. 'itemsparse_442'.
        Carries fields the 4.3.4 client computes at runtime (weapon damage, MaxDurability)."""
        import csv
        with open(os.path.join(WAGO_DIR, name + ".csv"), newline="", encoding="utf-8") as f:
            return list(csv.DictReader(f))

    @staticmethod
    def read_wdbc(path):
        """Read a WDBC file -> (records: list[tuple[int32 fields]], get_string(offset)->str)."""
        d = open(path, "rb").read()
        _magic, rc, fc, rs, _ss = struct.unpack_from("<4sIIII", d, 0)
        base, sb = 20, 20 + rc * rs
        recs = [struct.unpack_from("<%dI" % fc, d, base + i * rs) for i in range(rc)]

        def get_string(off):
            e = d.index(b"\0", sb + off)
            return d[sb + off:e].decode("latin1")
        return recs, get_string

    @staticmethod
    def esc(v):
        if isinstance(v, str):
            return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
        return str(v)

    def write(self, rel_name, body):
        return _zpak_write(rel_name, body)

    def close(self):
        try: self.nel.close()
        except Exception: pass


def _load_collector():
    """Load the (underscore-prefixed, non-domain) collector module."""
    import importlib.util
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "goblin_gen", "_collect.py")
    spec = importlib.util.spec_from_file_location("goblin_gen__collect", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def _discover_domains():
    """Auto-discover gen domain modules in ./goblin_gen/ (each defines NAME + emit(ctx))."""
    import importlib.util
    mods = {}
    d = os.path.join(os.path.dirname(os.path.abspath(__file__)), "goblin_gen")
    for path in sorted(glob.glob(os.path.join(d, "*.py"))):
        base = os.path.basename(path)
        if base.startswith("_"):
            continue
        try:
            spec = importlib.util.spec_from_file_location("goblin_gen_" + base[:-3], path)
            mod = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mod)
        except Exception as e:      # a broken/half-written module must not break other domains
            click.echo(f"  (skipping domain module {base}: {e})", err=True)
            continue
        if hasattr(mod, "NAME") and hasattr(mod, "emit"):
            mods[mod.NAME] = mod
    return mods


_GEN_DOMAIN_MODS = _discover_domains()
_GEN_DOMAINS = {name: mod.emit for name, mod in _GEN_DOMAIN_MODS.items()}


def _domain_tables(name):
    return set(getattr(_GEN_DOMAIN_MODS[name], "TABLES", []) or [])


def _domain_tier(name):
    return getattr(_GEN_DOMAIN_MODS[name], "TIER", "base")


def _contributor_closure(requested):
    """Expand `requested` to every domain that contributes to any table those
    domains touch, so a partial `gen <domain>` still emits complete per-table files."""
    t2d = {}
    for name in _GEN_DOMAIN_MODS:
        for t in _domain_tables(name):
            t2d.setdefault(t, set()).add(name)
    closure = set(requested)
    changed = True
    while changed:
        changed = False
        for name in list(closure):
            for t in _domain_tables(name):
                for d in t2d.get(t, ()):
                    if d not in closure:
                        closure.add(d); changed = True
    return closure


@goblin.command("gen")
@click.argument("domains", nargs=-1)
@click.option("--zone", type=click.Choice(["lost-isles", "kezan", "both"]), default="both",
              show_default=True, help="Which zone(s) to emit.")
def gen(domains, zone):
    """Translate Neltharion + Whitemane -> [AUTO,F-011] SQL/DBC (per domain).

    DOMAINS: one or more emitter names (default: all discovered domains in
    goblin_gen/). Run `zep goblin gen <bad>` to see the available list.
    """
    requested = list(domains) if domains else list(_GEN_DOMAINS)
    unknown = [d for d in requested if d not in _GEN_DOMAINS]
    if unknown:
        raise click.ClickException(
            f"Unknown/unported domain(s): {', '.join(unknown)}. "
            f"Available now: {', '.join(sorted(_GEN_DOMAINS))}.")
    # Expand to the contributor closure so a partial run still writes complete
    # per-table files (a lone overlay would otherwise clobber a table's file with
    # a base-less version), then keep discovery order.
    closure = _contributor_closure(requested)
    todo = [d for d in _GEN_DOMAINS if d in closure]
    if set(todo) != set(requested):
        pulled = sorted(set(todo) - set(requested))
        if pulled:
            click.echo(f"(+ pulled in co-table domains: {', '.join(pulled)})")
    sfxs = {"lost-isles": [""], "kezan": ["_K"], "both": ["", "_K"]}[zone]

    # Two-wave execution: all base-tier domains, then all overlay-tier domains,
    # so overlays may read already-collected base rows (col.get / col.pks).
    base_domains = [d for d in todo if _domain_tier(d) == "base"]
    overlay_domains = [d for d in todo if _domain_tier(d) == "overlay"]

    col = _load_collector().Collector()
    failed = []
    for sfx in sfxs:
        label = "Kezan" if sfx == "_K" else "Lost Isles"
        ctx = _GenCtx(sfx, col)
        try:
            for d in base_domains + overlay_domains:
                try:
                    click.echo(f"[{label}] gen {d}: " + _GEN_DOMAINS[d](ctx))
                except Exception as e:   # one domain's failure must not abort the rest
                    failed.append((label, d, str(e)))
                    click.echo(f"[{label}] gen {d}: FAILED — {e}", err=True)
        finally:
            ctx.close()

    # Single flush after both zone passes: one file per touched table.
    try:
        written = col.flush(_zpak_write)
        if written:
            click.echo(f"\nCollector flushed {len(written)} per-table file(s):")
            for rel in written:
                click.echo(f"  {rel}")
    except Exception as e:
        failed.append(("flush", "collector", str(e)))
        click.echo(f"collector flush FAILED — {e}", err=True)

    if failed:
        click.echo(f"\n{len(failed)} domain run(s) failed:")
        for lbl, d, e in failed:
            click.echo(f"  [{lbl}] {d}: {e}")
    click.echo("\nDone. Review the emitted zz_[AUTO,F-011]_* files.")
