#!/usr/bin/env python3
"""Extraction report for Lost Isles (zone 4720) from the Neltharion SQLite DB."""
import sqlite3, sys
c = sqlite3.connect("neltharion.sqlite")
c.row_factory = sqlite3.Row
def T(x): return (x or "").strip() if isinstance(x, str) else x

ZONE = "4720"
qt_cols = [r[1] for r in c.execute("PRAGMA table_info(quest_template)")]
title_col = "Title" if "Title" in qt_cols else ("LogTitle" if "LogTitle" in qt_cols else qt_cols[1])

print("="*70)
print("LOST ISLES (zone 4720) — Neltharion 4.3.4 extraction")
print("="*70)

# --- coordinate bbox (source map 648) ---
row = c.execute("""SELECT MIN(CAST(position_x AS REAL)), MAX(CAST(position_x AS REAL)),
                          MIN(CAST(position_y AS REAL)), MAX(CAST(position_y AS REAL)),
                          MIN(CAST(position_z AS REAL)), MAX(CAST(position_z AS REAL))
                   FROM creature WHERE TRIM(zone)=?""", (ZONE,)).fetchone()
print("\n[SOURCE COORD BBOX — map 648 local coords]")
print("  X: %.1f .. %.1f   (span %.1f)" % (row[0], row[1], row[1]-row[0]))
print("  Y: %.1f .. %.1f   (span %.1f)" % (row[2], row[3], row[3]-row[2]))
print("  Z: %.1f .. %.1f" % (row[4], row[5]))

# --- NPC roster ---
rows = c.execute("""
  SELECT TRIM(ct.entry) e, ct.name, ct.subname, ct.minlevel, ct.maxlevel, ct.rank,
         ct.npcflag, COUNT(*) n
  FROM creature cr JOIN creature_template ct ON TRIM(cr.id)=TRIM(ct.entry)
  WHERE TRIM(cr.zone)=?
  GROUP BY TRIM(ct.entry)
  ORDER BY n DESC""", (ZONE,)).fetchall()
print("\n[NPC ROSTER] %d distinct entries" % len(rows))
NPCFLAG = {1:"gossip",2:"questgiver",16:"trainer",128:"vendor",4096:"repair",
           65536:"flightmaster",131072:"innkeeper",4194304:"stable",8388608:"repair"}
def flags(v):
    try: v=int(v)
    except: return ""
    return ",".join(n for b,n in NPCFLAG.items() if v & b)
print("  %-7s %-34s %-22s %-7s %-6s %-4s %s" % ("entry","name","subname","lvl","rank","#","flags"))
for r in rows:
    lvl = "%s-%s"%(T(r['minlevel']),T(r['maxlevel']))
    print("  %-7s %-34.34s %-22.22s %-7s %-6s %-4s %s" % (
        r['e'], T(r['name']) or "", T(r['subname']) or "", lvl, T(r['rank']), r['n'], flags(r['npcflag'])))

# --- Quests: those started by NPCs spawned in the zone ---
qs = c.execute("""
  SELECT DISTINCT TRIM(qr.quest) q FROM creature_questrelation qr
  WHERE TRIM(qr.id) IN (SELECT DISTINCT TRIM(id) FROM creature WHERE TRIM(zone)=?)""",(ZONE,)).fetchall()
qids = sorted(set(int(x['q']) for x in qs if T(x['q']) and T(x['q']).lstrip('-').isdigit()))
print("\n[QUESTS started by zone NPCs] %d quests" % len(qids))
if qids:
    qmarks = ",".join("?"*len(qids))
    qrows = c.execute("SELECT TRIM(Id) Id, `%s` t, Level, MinLevel, PrevQuestId, NextQuestId FROM quest_template WHERE TRIM(Id) IN (%s) ORDER BY CAST(MinLevel AS INT), CAST(Id AS INT)" % (title_col, qmarks), [str(x) for x in qids]).fetchall()
    print("  %-7s %-46s %-5s %-5s %-8s" % ("id","title","lvl","min","prev>next"))
    for r in qrows:
        print("  %-7s %-46.46s %-5s %-5s %s>%s" % (r['Id'], T(r['t']) or "", T(r['Level']), T(r['MinLevel']), T(r['PrevQuestId']), T(r['NextQuestId'])))

# --- Gameobjects ---
gos = c.execute("""
  SELECT TRIM(gt.entry) e, gt.name, gt.type, COUNT(*) n
  FROM gameobject g JOIN gameobject_template gt ON TRIM(g.id)=TRIM(gt.entry)
  WHERE TRIM(g.zone)=? GROUP BY TRIM(gt.entry) ORDER BY n DESC LIMIT 40""",(ZONE,)).fetchall()
print("\n[GAMEOBJECTS] top 40 of distinct entries")
for r in gos:
    print("  %-7s %-40.40s type=%s  #%s" % (r['e'], T(r['name']) or "", T(r['type']), r['n']))
