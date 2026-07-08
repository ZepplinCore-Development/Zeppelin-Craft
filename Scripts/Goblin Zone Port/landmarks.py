#!/usr/bin/env python3
"""Validate offset vs WorldMapArea center; emit translated map-1 landmark coords."""
import sqlite3
DX, DY = -533.3333, -12800.0
con = sqlite3.connect("neltharion.sqlite")

def tr(x, y, z): return (x + DX, y + DY, z)

# global centroid vs WMA center (validation)
r = con.execute("SELECT AVG(position_x),AVG(position_y) FROM creature WHERE TRIM(zone)='4720'").fetchone()
cx, cy, _ = tr(r[0], r[1], 0)
print("VALIDATION vs WorldMapArea")
print("  translated spawn centroid: X=%.1f Y=%.1f" % (cx, cy))
print("  WorldMapArea 4720 center:  X=842.7 Y=-10673.9  (box X[-662,2348] Y[-12931,-8417])")
print()

# landmark = centroid of a named NPC's spawns, or of an area
def area_center(area, label):
    r = con.execute("""SELECT AVG(CAST(position_x AS REAL)),AVG(CAST(position_y AS REAL)),
                              AVG(CAST(position_z AS REAL)),COUNT(*)
                       FROM creature WHERE TRIM(zone)='4720' AND TRIM(area)=?""",(area,)).fetchone()
    if not r or not r[3]: return
    x,y,z = tr(r[0],r[1],r[2])
    print("  %-26s area %-5s  map1: %8.1f %9.1f %7.1f   (.go xyz %.1f %.1f %.1f 1)"%(
        label,area,x,y,z,x,y,z))

def npc_center(entry, label):
    r = con.execute("""SELECT AVG(CAST(position_x AS REAL)),AVG(CAST(position_y AS REAL)),
                              AVG(CAST(position_z AS REAL)),COUNT(*)
                       FROM creature WHERE TRIM(zone)='4720' AND TRIM(id)=?""",(entry,)).fetchone()
    if not r or not r[3]: return
    x,y,z = tr(r[0],r[1],r[2])
    print("  %-26s npc %-6s map1: %8.1f %9.1f %7.1f   (.go xyz %.1f %.1f %.1f 1)"%(
        label,entry,x,y,z,x,y,z))

print("KEY LANDMARKS (map 1 / Kalimdor world coords):")
area_center("4721","Shipwreck Shore (start)")
area_center("4871","Town-In-A-Box (hub)")
area_center("4778","Kaja'mite Cavern")
area_center("4912","Warchief's Lookout")
area_center("4924","Gallywix Labor Mine")
print()
print("KEY NPCs:")
npc_center("38746","Gobber (Innkeeper)")
npc_center("45286","KTC Train-a-Tron (prof trainer)")
npc_center("38120","Hobart Grapplehammer")
npc_center("38518","Warrior-Matic NX-01 (trainer)")
npc_center("36471","Foreman Dampwick")
