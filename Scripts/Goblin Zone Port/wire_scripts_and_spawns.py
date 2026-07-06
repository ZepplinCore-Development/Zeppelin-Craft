#!/usr/bin/env python3
"""
F-011: (1) spell_script_names for the 5 core-C++ quest-credit spells, and
(2) import the missed Buzzbox spawns (37872/95/96/97) that 'Capturing the Unknown'
photographs — source has them in zone 4720 map 648; apply the map648->map1 transform.
"""
import sqlite3, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
DX, DY = -533.33, -12800.0   # map648 -> map1 uniform offset (F-011)

SCRIPTS = [
    (67917, "spell_zep_q14019_monkey_business"),
    (68211, "spell_zep_q14236_weed_whacker"),
    (68280, "spell_zep_q14031_ktc_snapflash"),
    (71170, "spell_zep_q24671_cluster_cluck"),
    (72891, "spell_zep_q24942_zombies_booster"),
]
with open(ZPAK + "/sql/zz_[F-011]_spell_scripts.sql", "w") as f:
    f.write("-- F-011 register core-C++ quest-credit spell scripts (zeppelin_goblin_start.cpp)\n\n")
    f.write("DELETE FROM spell_script_names WHERE spell_id IN (%s);\n" % ",".join(str(s) for s, _ in SCRIPTS))
    f.write("INSERT INTO spell_script_names (spell_id, ScriptName) VALUES\n")
    f.write(",\n".join("  (%d,'%s')" % (s, n) for s, n in SCRIPTS) + ";\n")

# --- missed Buzzbox spawns ---
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
GUID0 = 6700001
BUZZ = (37872, 37895, 37896, 37897)
spawns = []
for e in BUZZ:
    for r in c.execute("SELECT * FROM creature WHERE TRIM(id)=? AND TRIM(map)='648'", (str(e),)):
        x = float(str(r["position_x"]).strip()) + DX
        y = float(str(r["position_y"]).strip()) + DY
        z = float(str(r["position_z"]).strip())
        o = float(str(r["orientation"]).strip())
        spawns.append((e, x, y, z, o))
with open(ZPAK + "/sql/zz_[F-011]_creatures_06_buzzbox_spawns.sql", "w") as f:
    f.write("-- F-011 missed 'Capturing the Unknown' photograph targets (source zone 4720 map648 -> map1)\n\n")
    f.write("DELETE FROM creature WHERE id IN (%s) AND map=1;\n" % ",".join(str(e) for e in BUZZ))
    f.write("INSERT INTO creature (guid,id,map,zoneId,areaId,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,curhealth,MovementType) VALUES\n")
    vals = []
    for i, (e, x, y, z, o) in enumerate(spawns):
        vals.append("  (%d,%d,1,0,0,1,1,0,%.4f,%.4f,%.4f,%.4f,300,0,1,0)" % (GUID0 + i, e, x, y, z, o))
    f.write(",\n".join(vals) + ";\n")
print("spell_script_names: %d | buzzbox spawns: %d" % (len(SCRIPTS), len(spawns)))
