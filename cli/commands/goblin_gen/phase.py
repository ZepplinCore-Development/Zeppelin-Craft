"""gen domain: phase (F-194, not F-011).

Generate the phase_definitions table + rows + phase conditions for the goblin zone.
- phase_definitions: rows for zones 4720 (Lost Isles) + 4737 (Kezan). terrainswapmap /
  phaseId / originmap ZEROED (terrain swaps deferred; PhaseMgr uses phasemask only).
- conditions: the Neltharion source-type-25 (PHASE_DEFINITION) quest conditions for those
  zones, emitted as AC CONDITION_SOURCE_TYPE_PHASE (26). Condition type numbers are identical
  (QUESTREWARDED=8, QUESTTAKEN=9, QUEST_NONE=14, QUEST_COMPLETE=28).

Ported from Scripts/Goblin Zone Port/gen_phase_sql.py. The original read phase_definitions
from a saved text dump and the conditions from a local sqlite; this reads phase_definitions
straight from the Neltharion world.zip dump (that table is not part of the standard
`extract-neltharion` load) and the conditions from the Neltharion MySQL via ctx.q.

Tagged [AUTO,F-194] (single non-SFX file); emitted on the Lost Isles pass only.
"""
import io
import os
import re
import zipfile

NAME = "phase"

ZONES = (4720, 4737)

# world.zip dump path (same resolution as `zep goblin extract-neltharion`).
_TOOLS = "/workspace/project/Zeppelin-Tools"
_DEFAULT_WORLD_ZIP = os.getenv(
    "NELTHARION_WORLD_ZIP",
    os.path.join(_TOOLS, "Neltharion-Source", "Project-Neltharion-4.3.4-Cataclysm",
                 "source", "sql", "base", "world.zip"))

_HDR = re.compile(r"^\s*REPLACE\s+INTO\s+`([a-z0-9_]+)`\s*\(([^)]*)\)\s+VALUES\s+", re.I | re.S)


def _open_world_sql(world_zip):
    if world_zip.lower().endswith(".zip"):
        zf = zipfile.ZipFile(world_zip)
        name = next((n for n in zf.namelist() if n.lower().endswith(".sql")), None)
        if not name:
            raise RuntimeError("no .sql member inside %s" % world_zip)
        return io.TextIOWrapper(zf.open(name), encoding="utf-8", errors="replace")
    return open(world_zip, "r", encoding="utf-8", errors="replace")


def _statements(fh, chunk=1 << 20):
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


def _load_phase_definitions():
    """(zoneId, entry, phaseMask, flags, comment) for ZONES, in dump order."""
    if not os.path.exists(_DEFAULT_WORLD_ZIP):
        raise RuntimeError("Neltharion world dump not found: %s "
                           "(set NELTHARION_WORLD_ZIP)" % _DEFAULT_WORLD_ZIP)
    fh = _open_world_sql(_DEFAULT_WORLD_ZIP)
    out = []
    try:
        for stmt in _statements(fh):
            m = _HDR.match(stmt)
            if not m or m.group(1) != "phase_definitions":
                continue
            cols = [c.strip().strip('`') for c in m.group(2).split(',')]
            idx = {c: k for k, c in enumerate(cols)}
            for r in _parse_values(stmt[m.end():]):
                if len(r) != len(cols):
                    continue
                z = int(r[idx["zoneId"]])
                if z not in ZONES:
                    continue
                out.append((z, int(r[idx["entry"]]), int(r[idx["phaseMask"]]),
                            int(r[idx["flags"]]), (r[idx["comment"]] or "").strip()))
    finally:
        fh.close()
    return out


def emit(ctx):
    if ctx.sfx:                       # single non-SFX file; emit on the Lost Isles pass only
        return "skipped (emitted on Lost Isles pass)"

    defs = _load_phase_definitions()

    def gi(v, d=0):
        try:
            return int(float(str(v).strip()))
        except (TypeError, ValueError):
            return d

    # --- phase conditions (source type 25 in export -> 26 in AC) ---
    conds = []
    for z in ZONES:
        rows = ctx.q("SELECT * FROM conditions "
                     "WHERE TRIM(SourceTypeOrReferenceId)='25' AND TRIM(SourceGroup)=%s", (str(z),))
        # stable sort by SourceEntry preserves dump order within an entry (matches the
        # original sqlite `ORDER BY CAST(SourceEntry AS INT)`, which was stable on row order).
        rows.sort(key=lambda r: gi(r["SourceEntry"]))
        for r in rows:
            conds.append((z, gi(r["SourceEntry"]), gi(r["SourceId"]), gi(r["ElseGroup"]),
                          gi(r["ConditionTypeOrReference"]), gi(r["ConditionTarget"]),
                          gi(r["ConditionValue1"]), gi(r["ConditionValue2"]), gi(r["ConditionValue3"]),
                          gi(r["NegativeCondition"])))

    b = []
    b.append("-- F-194 Cata zone phasing progression: phase_definitions + phase conditions.")
    b.append("-- Lost Isles (4720) + Kezan (4737). Terrain swaps deferred -> terrainswapmap/phaseId/originmap = 0.\n")
    b.append("CREATE TABLE IF NOT EXISTS `phase_definitions` (")
    b.append("  `zoneId` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `entry` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `phaseMask` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `phaseId` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `originmap` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `terrainswapmap` INT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `flags` TINYINT UNSIGNED NOT NULL DEFAULT 0,")
    b.append("  `comment` TEXT DEFAULT NULL,")
    b.append("  PRIMARY KEY (`zoneId`,`entry`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n")
    b.append("DELETE FROM `phase_definitions` WHERE `zoneId` IN (%s);" % ",".join(map(str, ZONES)))
    b.append("INSERT INTO `phase_definitions` (`zoneId`,`entry`,`phaseMask`,`phaseId`,`originmap`,`terrainswapmap`,`flags`,`comment`) VALUES")
    b.append(",\n".join("  (%d,%d,%d,0,0,0,%d,'%s')" % (z, e, pm, fl, cm.replace("'", "''"))
                        for z, e, pm, fl, cm in defs) + ";\n")

    ids = ",".join(map(str, ZONES))
    b.append("-- phase conditions (CONDITION_SOURCE_TYPE_PHASE = 26; SourceGroup=zoneId, SourceEntry=phase entry)")
    b.append("DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup` IN (%s);" % ids)
    b.append("INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES")
    b.append(",\n".join("  (26,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,0,0,'','F-194 phase')" % cd
                        for cd in conds) + ";")

    ctx.write("sql/zz_[AUTO,F-194]_phase_definitions.sql", "\n".join(b) + "\n")
    return "phase_definitions=%d (%d LI, %d Kezan) conditions=%d" % (
        len(defs), sum(1 for d in defs if d[0] == 4720), sum(1 for d in defs if d[0] == 4737), len(conds))
