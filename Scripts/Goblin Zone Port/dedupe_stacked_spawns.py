#!/usr/bin/env python3
"""
F-011: Cata phasing artifact — the source separates same-spot spawns by phaseMask; the
migration flattened phaseMask to 1, so all phase-variants of a creature spawn stacked on
top of each other. Dedupe: for each (creature id, ~3-yard cell) keep one spawn (lowest
guid), delete the rest. Only touches F-011 spawn guid blocks (11M LI / 12M Kezan).
"""
import subprocess, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
CLI = "/workspace/project/Zeppelin-Craft"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
GRID = 3.0

def q(sql):
    return subprocess.run(["python3","-m","cli.zep","world","sql","query",sql],cwd=CLI,capture_output=True,text=True).stdout

rows = []
for line in q("SELECT guid,id,position_x,position_y FROM creature WHERE map=1 AND guid BETWEEN 11000000 AND 13000000").splitlines():
    p = line.split("\t")
    if len(p) == 4 and p[0].strip().isdigit():
        rows.append((int(p[0]), int(p[1]), float(p[2]), float(p[3])))

# group by (id, cell); keep lowest guid, mark the rest for deletion
seen = {}
delete = []
for guid, cid, x, y in sorted(rows):
    key = (cid, round(x / GRID), round(y / GRID))
    if key in seen:
        delete.append(guid)
    else:
        seen[key] = guid

print("F-011 map-1 spawns: %d | keep: %d | delete (stacked dupes): %d" % (len(rows), len(seen), len(delete)))
if delete:
    with open(ZPAK + "/sql/zz_[F-011]_dedupe_stacked_spawns.sql", "w") as f:
        f.write("-- F-011 remove phasing-artifact stacked spawns (Cata phaseMask flattened -> dupes on one spot)\n")
        f.write("-- Keeps one spawn per (creature, %g-yard cell); deletes %d redundant guids.\n\n" % (GRID, len(delete)))
        # chunk the IN() list
        for i in range(0, len(delete), 500):
            chunk = delete[i:i+500]
            f.write("DELETE FROM creature WHERE guid IN (%s);\n" % ",".join(str(g) for g in chunk))
    print("wrote dedupe SQL")
