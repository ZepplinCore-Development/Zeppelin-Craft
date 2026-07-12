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
TABLES = ["gameobject_template", "gameobject", "gameobject_loot_template"]
TIER = "base"

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

    # template (type 3 chest; Data0=0 no lock so freely lootable; Data1=195492 lootId) -> collector
    ctx.col.put("gameobject_template", 195492, {
        "entry": 195492, "type": 3, "displayId": 9129, "name": "Kaja'mite Chunk",
        "size": 0.5, "Data0": 0, "Data1": 195492, "Data3": 1, "ScriptName": "",
    }, tier="base", zone=ctx.sfx, owner="kajamite")

    # loot: quest item 84467 (was 48766), 100%
    ctx.col.delete("gameobject_loot_template", "Entry=195492")
    ctx.col.add("gameobject_loot_template", {
        "Entry": 195492, "Item": 84467, "Reference": 0, "Chance": 100,
        "QuestRequired": 1, "LootMode": 1, "GroupId": 0, "MinCount": 1, "MaxCount": 1,
    })
    # spawns (one chunk per live deposit; deterministic scatter)
    ctx.col.delete("gameobject", "id=195492")
    R = ctx.col.Raw
    for i, r in enumerate(rows):
        x = float(r["position_x"]) + DX
        y = float(r["position_y"]) + DY
        z = float(r["position_z"])
        o = float(r["orientation"])
        dx, dy = OFF[i % len(OFF)]
        g = GUID0 + i
        ctx.col.add("gameobject", {
            "guid": g, "id": 195492, "map": 1, "zoneId": 0, "areaId": 0,
            "spawnMask": 1, "phaseMask": 1,
            "position_x": R("%.4f" % (x + dx)), "position_y": R("%.4f" % (y + dy)),
            "position_z": R("%.4f" % z), "orientation": R("%.4f" % o),
            "rotation0": 0, "rotation1": 0, "rotation2": 0, "rotation3": 1,
            "spawntimesecs": 120, "animprogress": 100, "state": 1, "VerifiedBuild": 0,
        }, sort_key=g)
    return "chunks=%d (guids %d..%d)" % (len(rows), GUID0, GUID0 + len(rows) - 1)
