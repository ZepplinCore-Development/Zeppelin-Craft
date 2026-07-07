#!/usr/bin/env python3
"""
F-194: generate the phase_definitions table + rows + phase conditions for the goblin zone.
- phase_definitions: 22 rows for zones 4720 (Lost Isles) + 4737 (Kezan). terrainswapmap /
  phaseId / originmap ZEROED (terrain swaps deferred; PhaseMgr uses phasemask only).
- conditions: the Neltharion source-type-25 (PHASE_DEFINITION) quest conditions for those
  zones, emitted as AC CONDITION_SOURCE_TYPE_PHASE (26). Condition type numbers are identical
  (QUESTREWARDED=8, QUESTTAKEN=9, QUEST_NONE=14, QUEST_COMPLETE=28).
"""
import sqlite3, os, re
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
ZONES = (4720, 4737)

# --- phase_definitions rows (from the saved dump; zero terrain/phase/origin) ---
defs = []
for line in open(os.path.join(SCRATCH, "phase_definitions_f011.txt")):
    m = re.match(r"\((\d+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(\d+),\s*(NULL|\d+),\s*(\d+),\s*'([^']*)'\)", line.strip())
    if not m:
        continue
    zoneId, entry, phaseMask, phaseId, originmap, terrain, wmas, flags, comment = m.groups()
    if int(zoneId) not in ZONES:
        continue
    defs.append((int(zoneId), int(entry), int(phaseMask), int(flags), comment))

# --- phase conditions (source type 25 in export -> 26 in AC) ---
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
def gi(v, d=0):
    try: return int(float(str(v).strip()))
    except: return d
conds = []
for z in ZONES:
    for r in c.execute("SELECT * FROM conditions WHERE TRIM(SourceTypeOrReferenceId)='25' AND TRIM(SourceGroup)=? ORDER BY CAST(SourceEntry AS INT)", (str(z),)):
        conds.append((z, gi(r["SourceEntry"]), gi(r["SourceId"]), gi(r["ElseGroup"]),
                      gi(r["ConditionTypeOrReference"]), gi(r["ConditionTarget"]),
                      gi(r["ConditionValue1"]), gi(r["ConditionValue2"]), gi(r["ConditionValue3"]),
                      gi(r["NegativeCondition"])))

with open(os.path.join(ZPAK, "sql/zz_[F-194]_phase_definitions.sql"), "w") as f:
    f.write("-- F-194 Cata zone phasing progression: phase_definitions + phase conditions.\n")
    f.write("-- Lost Isles (4720) + Kezan (4737). Terrain swaps deferred -> terrainswapmap/phaseId/originmap = 0.\n\n")
    f.write("CREATE TABLE IF NOT EXISTS `phase_definitions` (\n")
    f.write("  `zoneId` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `entry` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `phaseMask` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `phaseId` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `originmap` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `terrainswapmap` INT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `flags` TINYINT UNSIGNED NOT NULL DEFAULT 0,\n")
    f.write("  `comment` TEXT DEFAULT NULL,\n")
    f.write("  PRIMARY KEY (`zoneId`,`entry`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n\n")
    f.write("DELETE FROM `phase_definitions` WHERE `zoneId` IN (%s);\n" % ",".join(map(str, ZONES)))
    f.write("INSERT INTO `phase_definitions` (`zoneId`,`entry`,`phaseMask`,`phaseId`,`originmap`,`terrainswapmap`,`flags`,`comment`) VALUES\n")
    f.write(",\n".join("  (%d,%d,%d,0,0,0,%d,'%s')" % (z, e, pm, fl, cm.replace("'", "''")) for z, e, pm, fl, cm in defs) + ";\n\n")

    ids = ",".join(map(str, ZONES))
    f.write("-- phase conditions (CONDITION_SOURCE_TYPE_PHASE = 26; SourceGroup=zoneId, SourceEntry=phase entry)\n")
    f.write("DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=26 AND `SourceGroup` IN (%s);\n" % ids)
    f.write("INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES\n")
    rows = ["  (26,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,0,0,'','F-194 phase')" % cd for cd in conds]
    f.write(",\n".join(rows) + ";\n")

print("phase_definitions: %d rows (%d LI, %d Kezan) | phase conditions: %d" % (
    len(defs), sum(1 for d in defs if d[0] == 4720), sum(1 for d in defs if d[0] == 4737), len(conds)))
