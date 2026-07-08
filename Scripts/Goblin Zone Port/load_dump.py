#!/usr/bin/env python3
"""
Load selected content tables from a HeidiSQL mysqldump (world.sql) into a local
SQLite DB. Fully isolated: no network, no external DB server.
Dump uses `REPLACE INTO `tbl` (cols) VALUES (..),(..);` with CRLF + backslash escapes.
For F-011 Goblin Zone (Lost Isles / Kezan) extraction.
"""
import re, sqlite3, sys, os

SRC = sys.argv[1] if len(sys.argv) > 1 else "world.sql"
OUT = sys.argv[2] if len(sys.argv) > 2 else "neltharion.sqlite"

TARGET = {
    "creature_template", "creature", "creature_template_addon", "creature_addon",
    "creature_equip_template", "creature_model_info", "creature_text",
    "creature_loot_template", "creature_questrelation", "creature_involvedrelation",
    "quest_template", "quest_template_perma", "quest_poi", "quest_poi_points",
    "gameobject_template", "gameobject", "gameobject_loot_template",
    "gameobject_questrelation", "gameobject_involvedrelation",
    "smart_scripts", "gossip_menu", "gossip_menu_option",
    "waypoints", "waypoint_data", "points_of_interest", "conditions",
    "reference_loot_template",
}

def statements(path, chunk=1 << 20):
    """Yield complete SQL statements, splitting on top-level ';' (quote-aware)."""
    buf = []
    in_str = False
    esc = False
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        while True:
            data = f.read(chunk)
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

def parse_values(s):
    """Split a VALUES payload '(a,b),(c,d)' into list of lists of python values."""
    rows = []
    i, n = 0, len(s)
    while i < n:
        while i < n and s[i] != '(':
            i += 1
        if i >= n:
            break
        i += 1
        row, field = [], []
        is_null = False
        val_is_str = False
        # track a token to detect NULL vs '' string
        token = []
        in_str = False
        started_str = False
        while i < n:
            c = s[i]
            if in_str:
                if c == '\\':
                    nxt = s[i+1] if i+1 < n else ''
                    field.append({'n': '\n', 'r': '\r', 't': '\t', '0': '\0'}.get(nxt, nxt))
                    i += 2
                    continue
                if c == "'":
                    if i+1 < n and s[i+1] == "'":
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
                in_str = True
                started_str = True
                i += 1
                continue
            if c == ',' or c == ')':
                raw = "".join(field)
                if not started_str and raw.strip().upper() == "NULL":
                    row.append(None)
                else:
                    row.append(raw)
                field = []
                started_str = False
                if c == ')':
                    rows.append(row)
                    i += 1
                    break
                i += 1
                continue
            field.append(c)
            i += 1
    return rows

HDR = re.compile(r"^\s*REPLACE\s+INTO\s+`([a-z0-9_]+)`\s*\(([^)]*)\)\s+VALUES\s+", re.I | re.S)

def main():
    if os.path.exists(OUT):
        os.remove(OUT)
    con = sqlite3.connect(OUT)
    con.execute("PRAGMA journal_mode=OFF")
    con.execute("PRAGMA synchronous=OFF")
    created = set()
    counts = {}

    for stmt in statements(SRC):
        m = HDR.match(stmt)
        if not m:
            continue
        t = m.group(1)
        if t not in TARGET:
            continue
        cols = [c.strip().strip('`') for c in m.group(2).split(',')]
        if t not in created:
            coldef = ",".join("`%s`" % c for c in cols)
            con.execute('CREATE TABLE `%s` (%s)' % (t, coldef))
            created.add(t)
            counts[t] = 0
        payload = stmt[m.end():]
        rows = parse_values(payload)
        good = [r for r in rows if len(r) == len(cols)]
        if good:
            ph = "(" + ",".join("?" * len(cols)) + ")"
            con.executemany('INSERT INTO `%s` VALUES %s' % (t, ph), good)
            counts[t] += len(good)
        if len(good) != len(rows):
            sys.stderr.write("WARN %s: %d/%d row col-mismatch\n" % (t, len(rows)-len(good), len(rows)))

    con.commit()
    print("Loaded tables:")
    for t in sorted(counts):
        print("  %-32s %8d rows" % (t, counts[t]))
    con.close()

if __name__ == "__main__":
    main()
