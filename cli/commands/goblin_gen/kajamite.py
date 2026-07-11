"""gen domain: kajamite.

The Neltharion source has NO spawns for GO 195492 "Kaja'mite Chunk" (the lootable
type-3 node for Lost Isles quest 14124 'Liberate the Kaja'mite'), so the quest had
nothing to mine. Create the template + loot (item 84467) + place a chunk at each Lost
Isles Kaja'mite deposit (195622 / 202593), applying the map648->map1 offset with a small
deterministic scatter so chunks don't stack exactly on the deposit model. Freely lootable
(no lock; the quest is the gate).

Lost Isles only -> single non-SFX file (skips the Kezan pass). Ported verbatim from
Scripts/Goblin Zone Port/create_kajamite_chunks.py; the original read the already-migrated
live gameobject spawns, this reads the Neltharion source directly and applies the offset.
"""
NAME = "kajamite"

DX, DY = -533.3333, -12800.0          # map648 -> map1 offset (matches migrate_gameobjects)
GUID0 = 6500426                       # first chunk spawn guid
DEPOSITS = (195622, 202593)           # live Lost Isles Kaja'mite deposit GOs
# small deterministic scatter so chunks don't stack exactly on the deposit model
OFF = [(1.5, 1.0), (-1.2, 1.4), (1.8, -1.1), (-1.6, -1.3), (0.4, 2.0)]


def emit(ctx):
    if ctx.sfx:                       # Lost Isles only (quest 14124); no Kezan variant
        return "skipped (Lost Isles only)"

    rows = ctx.q(
        "SELECT position_x,position_y,position_z,orientation FROM gameobject "
        "WHERE id IN (%d,%d) ORDER BY CAST(guid AS UNSIGNED)" % DEPOSITS)

    b = []
    b.append("-- F-011 create lootable Kaja'mite Chunk nodes (GO 195492) for quest 14124 'Liberate the Kaja'mite'.")
    b.append("-- Source DB had 0 spawns for this node; place one at each live deposit (195622/202593).\n")
    # template (type 3 chest; Data0=0 no lock so freely lootable; Data1=195492 lootId)
    b.append("DELETE FROM gameobject_template WHERE entry=195492;")
    b.append("INSERT INTO gameobject_template (entry,type,displayId,name,size,Data0,Data1,Data3,ScriptName) VALUES")
    b.append("  (195492,3,9129,'Kaja''mite Chunk',0.5,0,195492,1,'');\n")
    # loot: quest item 84467 (was 48766), 100%
    b.append("DELETE FROM gameobject_loot_template WHERE Entry=195492;")
    b.append("INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES")
    b.append("  (195492,84467,0,100,1,1,0,1,1);\n")
    # spawns
    b.append("DELETE FROM gameobject WHERE id=195492;")
    b.append("INSERT INTO gameobject (guid,id,map,zoneId,areaId,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,VerifiedBuild) VALUES")
    vals = []
    for i, r in enumerate(rows):
        x = float(r["position_x"]) + DX
        y = float(r["position_y"]) + DY
        z = float(r["position_z"])
        o = float(r["orientation"])
        dx, dy = OFF[i % len(OFF)]
        g = GUID0 + i
        vals.append("  (%d,195492,1,0,0,1,1,%.4f,%.4f,%.4f,%.4f,0,0,0,1,120,100,1,0)" % (g, x + dx, y + dy, z, o))
    b.append(",\n".join(vals) + ";")

    ctx.write("sql/zz_[AUTO,F-011]_kajamite_chunk_nodes.sql", "\n".join(b) + "\n")
    return "chunks=%d (guids %d..%d)" % (len(rows), GUID0, GUID0 + len(rows) - 1)
