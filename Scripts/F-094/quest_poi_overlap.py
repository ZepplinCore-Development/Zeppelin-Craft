#!/usr/bin/env python3
"""Same-area chain check for quests (F-094).

Classic's worst habit: quest B needs quest A, and B's objective area is A's area again, so the
player clears a camp, walks home, and walks back to clear it a second time. This compares every
pair of quests by their quest_poi objective polygons (turn-in markers ignored), rasterised on a
25 yd grid, and flags pairs that overlap AND sit on one prerequisite path (PrevQuestID, plus every
quest whose NextQuestID points at the other).

  python3 Scripts/F-094/quest_poi_overlap.py 91222-91236 [--min 10]

Prints every overlapping pair; SEQUENTIAL ones at or above --min % are the defects. Exit 1 if any.
Run from Zeppelin-Craft.
"""
import argparse
import itertools
import subprocess
import sys

GRID = 25


def q(sql):
    out = subprocess.run([sys.executable, "-m", "cli.zep", "world", "sql", "query", sql],
                         capture_output=True, text=True, check=True).stdout.splitlines()
    if not out:
        return []
    head = out[0].split("\t")
    return [dict(zip(head, l.split("\t"))) for l in out[1:] if l.strip()]


def inside(p, poly):
    x, y = p
    c = False
    for i in range(len(poly)):
        (x1, y1), (x2, y2) = poly[i], poly[(i + 1) % len(poly)]
        if (y1 > y) != (y2 > y) and x < (x2 - x1) * (y - y1) / (y2 - y1) + x1:
            c = not c
    return c


def cells(polys):
    out = set()
    for poly in polys:
        if len(poly) < 3:
            continue
        xs, ys = [p[0] for p in poly], [p[1] for p in poly]
        for x in range(min(xs) // GRID * GRID, max(xs) + GRID, GRID):
            for y in range(min(ys) // GRID * GRID, max(ys) + GRID, GRID):
                if inside((x, y), poly):
                    out.add((x, y))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("range", help="quest id range a-b")
    ap.add_argument("--min", type=float, default=10, help="overlap %% (of the smaller area) that counts")
    a = ap.parse_args()
    lo, hi = map(int, a.range.split("-"))
    where = f"BETWEEN {lo} AND {hi}"
    polys = {}
    for r in q("SELECT p.QuestID, p.id, pp.X, pp.Y FROM quest_poi p JOIN quest_poi_points pp "
               f"ON pp.QuestID = p.QuestID AND pp.Idx1 = p.id WHERE p.QuestID {where} AND p.ObjectiveIndex <> -1 "
               "ORDER BY p.QuestID, p.id, pp.Idx2"):
        polys.setdefault(int(r["QuestID"]), {}).setdefault(int(r["id"]), []).append((int(r["X"]), int(r["Y"])))
    title = {int(r["ID"]): r["LogTitle"] for r in q(f"SELECT ID, LogTitle FROM quest_template WHERE ID {where}")}
    prereq = {}
    for r in q(f"SELECT ID, PrevQuestID, NextQuestID FROM quest_template_addon WHERE ID {where}"):
        i, p, n = int(r["ID"]), int(r["PrevQuestID"]), int(r["NextQuestID"])
        prereq.setdefault(i, set())
        if p > 0:
            prereq[i].add(p)
        if n:
            prereq.setdefault(n, set()).add(i)

    def ancestors(i, seen=()):
        out = set()
        for p in prereq.get(i, ()):
            if p not in seen:
                out |= {p} | ancestors(p, seen + (i,))
        return out

    area = {k: cells(v.values()) for k, v in polys.items()}
    bad = 0
    for x, y in itertools.combinations(sorted(area), 2):
        inter = len(area[x] & area[y])
        if not inter:
            continue
        pct = 100 * inter / max(1, min(len(area[x]), len(area[y])))
        seq = x in ancestors(y) or y in ancestors(x)
        flag = "SEQUENTIAL" if seq else "concurrent"
        if seq and pct >= a.min:
            bad += 1
            flag += "  <-- same-area chain"
        print(f"{x} {title.get(x, '')[:28]:28} x {y} {title.get(y, '')[:28]:28} {pct:5.1f}%  {flag}")
    print(f"\n{bad} same-area chain(s)")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
