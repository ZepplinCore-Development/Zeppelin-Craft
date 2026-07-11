#!/usr/bin/env python3
"""
F-011 fix: the source Neltharion DB has NO spawns for GO 195492 "Kaja'mite Chunk"
(the lootable type-3 node for quest 14124 'Liberate the Kaja'mite'), so the quest had
nothing to mine. Create the template + loot (item 84467) + place a chunk at each live
Lost Isles Kaja'mite deposit (195622/202593). Freely lootable (no lock; quest is the gate).
"""
import subprocess, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
CLI = "/workspace/project/Zeppelin-Craft"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"

def q(sql):
    return subprocess.run(["python3","-m","cli.zep","world","sql","query",sql],
                          cwd=CLI, capture_output=True, text=True).stdout

# live deposit anchor coords (map 1)
rows = []
for line in q("SELECT position_x,position_y,position_z,orientation FROM gameobject WHERE id IN (195622,202593) AND map=1").splitlines():
    p = line.split("\t")
    if len(p) == 4 and p[0].replace('.','').replace('-','').strip().isdigit():
        rows.append(tuple(float(x) for x in p))
print("anchor deposits:", len(rows))

GUID0 = 6500426
# small deterministic scatter so chunks don't stack exactly on the deposit model
OFF = [(1.5,1.0),(-1.2,1.4),(1.8,-1.1),(-1.6,-1.3),(0.4,2.0)]
with open(ZPAK + "/sql/zz_[F-011]_kajamite_chunk_nodes.sql", "w") as f:
    f.write("-- F-011 create lootable Kaja'mite Chunk nodes (GO 195492) for quest 14124 'Liberate the Kaja'mite'.\n")
    f.write("-- Source DB had 0 spawns for this node; place one at each live deposit (195622/202593).\n\n")
    # template (type 3 chest; Data0=0 no lock so freely lootable; Data1=195492 lootId)
    f.write("DELETE FROM gameobject_template WHERE entry=195492;\n")
    f.write("INSERT INTO gameobject_template (entry,type,displayId,name,size,Data0,Data1,Data3,ScriptName) VALUES\n")
    f.write("  (195492,3,9129,'Kaja''mite Chunk',0.5,0,195492,1,'');\n\n")
    # loot: quest item 84467 (was 48766), 100%
    f.write("DELETE FROM gameobject_loot_template WHERE Entry=195492;\n")
    f.write("INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES\n")
    f.write("  (195492,84467,0,100,1,1,0,1,1);\n\n")
    # spawns
    f.write("DELETE FROM gameobject WHERE id=195492;\n")
    f.write("INSERT INTO gameobject (guid,id,map,zoneId,areaId,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,VerifiedBuild) VALUES\n")
    vals = []
    for i, (x, y, z, o) in enumerate(rows):
        dx, dy = OFF[i % len(OFF)]
        g = GUID0 + i
        vals.append("  (%d,195492,1,0,0,1,1,%.4f,%.4f,%.4f,%.4f,0,0,0,1,120,100,1,0)" % (g, x+dx, y+dy, z, o))
    f.write(",\n".join(vals) + ";\n")
print("wrote %d chunk spawns (guids %d..%d)" % (len(rows), GUID0, GUID0+len(rows)-1))
