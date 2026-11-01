#!/usr/bin/env python3
"""Quest POI polygons from creature spawns (F-094).

Prints quest_poi_points rows: one convex hull per spawn cluster, padded and
cut down to <= 12 points (the client crashes #132 on more, see the Quests
guidance note).

Usage (from Zeppelin-Craft):
  python3 Scripts/F-094/quest_poi_hull.py 3782,3784 [--map 1] [--eps 250]
          [--pad 40] [--min 3] [--box x0 x1 y0 y1]
"""
import argparse
import math
import subprocess
import sys


def query(sql):
    out = subprocess.run([sys.executable, "-m", "cli.zep", "world", "sql", "query", sql],
                         capture_output=True, text=True, check=True).stdout
    lines = [l for l in out.splitlines() if l.strip()]
    return [l.split("\t") for l in lines[1:]]


def clusters(pts, eps):
    """Single-link clustering: points closer than eps share a cluster."""
    left = set(range(len(pts)))
    groups = []
    while left:
        seed = left.pop()
        grp, todo = [seed], [seed]
        while todo:
            i = todo.pop()
            near = [j for j in left if math.dist(pts[i], pts[j]) <= eps]
            for j in near:
                left.discard(j)
                grp.append(j)
                todo.append(j)
        groups.append([pts[i] for i in grp])
    return groups


def hull(pts):
    pts = sorted(set(pts))
    if len(pts) < 3:
        return pts

    def cross(o, a, b):
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

    lo, hi = [], []
    for p in pts:
        while len(lo) >= 2 and cross(lo[-2], lo[-1], p) <= 0:
            lo.pop()
        lo.append(p)
    for p in reversed(pts):
        while len(hi) >= 2 and cross(hi[-2], hi[-1], p) <= 0:
            hi.pop()
        hi.append(p)
    return lo[:-1] + hi[:-1]


def pad(ring, d):
    """Push each vertex out from the centroid by d yards."""
    cx = sum(p[0] for p in ring) / len(ring)
    cy = sum(p[1] for p in ring) / len(ring)
    out = []
    for x, y in ring:
        r = math.hypot(x - cx, y - cy) or 1.0
        out.append((x + (x - cx) / r * d, y + (y - cy) / r * d))
    return out


def simplify(ring, n):
    """Visvalingam-Whyatt on a closed ring down to n points."""
    ring = list(ring)
    while len(ring) > n:
        best, bi = None, 0
        for i in range(len(ring)):
            a, b, c = ring[i - 1], ring[i], ring[(i + 1) % len(ring)]
            area = abs((b[0] - a[0]) * (c[1] - a[1]) - (c[0] - a[0]) * (b[1] - a[1])) / 2
            if best is None or area < best:
                best, bi = area, i
        ring.pop(bi)
    return ring


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("entries")
    ap.add_argument("--map", type=int, default=1)
    ap.add_argument("--eps", type=float, default=250)
    ap.add_argument("--pad", type=float, default=40)
    ap.add_argument("--min", type=int, default=3, help="drop clusters smaller than this")
    ap.add_argument("--max-points", type=int, default=12)
    ap.add_argument("--box", type=float, nargs=4, metavar=("X0", "X1", "Y0", "Y1"))
    a = ap.parse_args()

    where = f"map = {a.map} AND id IN ({a.entries}) AND phaseMask & 1"
    if a.box:
        where += f" AND position_x BETWEEN {a.box[0]} AND {a.box[1]} AND position_y BETWEEN {a.box[2]} AND {a.box[3]}"
    rows = query(f"SELECT position_x, position_y FROM creature WHERE {where}")
    pts = [(float(x), float(y)) for x, y in rows]
    groups = sorted(clusters(pts, a.eps), key=len, reverse=True)
    print(f"-- {len(pts)} spawns, {len(groups)} clusters: {[len(g) for g in groups]}")
    for gi, g in enumerate([g for g in groups if len(g) >= a.min]):
        ring = simplify(pad(hull(g), a.pad), a.max_points)
        cx = sum(p[0] for p in g) / len(g)
        cy = sum(p[1] for p in g) / len(g)
        print(f"-- group {gi}: {len(g)} spawns, centre {cx:.0f} {cy:.0f}, {len(ring)} points")
        print("    " + ",\n    ".join(f"(@QUESTID, {{IDX}}, {i}, {round(x)}, {round(y)}, 0)"
                                       for i, (x, y) in enumerate(ring)))


if __name__ == "__main__":
    main()
