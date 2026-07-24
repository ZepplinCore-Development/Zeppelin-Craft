"""gen domain: kajamite.

Quest 14124 'Liberate the Kaja'mite' is a KEZAN quest (giver Foreman Dampwick,
POI = the Kaja'mite Cavern under KTC HQ) but neither deposit chain existed live
(I-256): Neltharion has NO spawns for the cavern deposits 195488/195489 (only
TDB 4.3.4 sniffed them), and no source spawns GO 195492 "Kaja'mite Chunk" (the
lootable type-3 node) at all. This domain owns the whole quest-14124 GO chain.

Flow (verified vs Whitemane: chunks exist ONLY after a deposit is bombed):
  Kablooey Bombs 67682 (effect 86 ACTIVATE_OBJECT action 8 Open) forces
  GameObject::Use() on the deposit goober -> SetLootState(GO_ACTIVATED) ->
  SmartGameObjectAI event 70 (GO_STATE_CHANGED, state 2) -> action 50
  SUMMON_GO spawns chunk 195492 at the deposit (120s despawn, free-standing:
  a GO summoner sets SetSpawnedByDefault(false), so the chunk survives the
  deposit's own consumable despawn 2s later and inherits its phaseMask) ->
  player clicks the chunk (lock 43, 'Collecting' cast bar) -> loots quest
  item 84467.

Kezan pass (_K):
  - deposit templates 195488/195489: type-10 goobers, AIName SmartGameObjectAI,
    autoClose 2000ms + consumable=1 (bomb blows the deposit away, 300s respawn),
    not hand-selectable (flags 16 via gameobject_template_addon; the spell's
    forced Use() ignores selectability). Retail's own chain (195488 linked trap
    195493 -> spell 67507, 195489 eventId 2000) is unportable — the trap spell
    doesn't exist in 3.3.5a; the SAI summon replicates its observable result.
  - deposit spawns from TDB 4.3.4 (Neltharion lacks them), map648->map1 offset,
    cross-id position dedupe (the sniff carries every deposit twice: all 16
    195488 rows stack on a 195489 within 0.14yd), phaseMask 65535 (the sniff's
    pmask 1 is meaningless under F-194 staging: the mine quest window runs in
    phase 2048->4096), two off-mesh spawns snapped to walkable polys so the
    summoned chunks are always loot-reachable.
  - smart_scripts rows for the summon (source_type 1).

Lost Isles pass (""):
  - chunk template + loot (item 84467, quest-gated) -> collector, plus the
    gameobject DELETE that clears the historical pre-placed chunk spawns
    (guids 6500426+ / 6550200+; superseded by the summon-on-bomb flow).
"""
NAME = "kajamite"
TABLES = ["gameobject_template", "gameobject_template_addon", "gameobject",
          "gameobject_loot_template", "smart_scripts", "gameobjectdisplayinfo"]
TIER = "base"

DX, DY = -533.3333, -12800.0          # map648 -> map1 offset (matches migrate_gameobjects)
K_DEP_GUID0 = 6550000                 # Kezan cavern deposit spawns (I-256)
K_DEPOSITS = (195488, 195489)         # Kezan Kaja'mite Cavern deposit GOs (tdb434-only)
CHUNK = 195492                        # summoned lootable chunk chest
CHUNK_DESPAWN = 120                   # seconds a blasted-free chunk stays lootable

# I-256: two deposits sit 4.9-8.3yd off the walkable cave navmesh (narrower than
# the visual floor; validated with cli/lib/navmesh_checker/mmap_query, per
# F-170: navmesh detects — and inside the cave the heightmap reads the SURFACE,
# so mesh Z is authoritative). Since chunks now summon AT the deposit, the
# deposits themselves are snapped so loot is always reachable. Keyed by the
# deposit's FINAL map-1 position (rounded to 1 yd — stable across regens,
# unlike guids/indices); value = nearest flat walkable poly from mmap_query.
K_DEP_SNAP = {
    (-9016, -11542): (-9008.0, -11541.3, 61.205),
    (-9163, -11486): (-9159.4658, -11488.2666, 37.2499),
}


def _emit_lost_isles(ctx):
    # template (type 3 chest) -> collector. Retail-faithful fields (I-256):
    # Data0=43 = the standard click-to-open lock — the CLIENT derives the open
    # action from Lock.dbc via the template's lockId, so lockId 0 makes clicks
    # dead (cursor shows, nothing happens). Data1=195492 lootId (quest-gated
    # item 84467). Data8=14124 chest questId (sparkle only while on quest).
    # displayId 9436 = retail's dedicated crystal-cluster chunk model
    # (kajamite_01.m2, MultiConverter v272->v264, shipped in this zpak with
    # its skin + KAJAMITE_BAR_01/NEX_ENVMAP03 textures).
    ctx.col.put("gameobject_template", CHUNK, {
        "entry": CHUNK, "type": 3, "displayId": 9436, "name": "Kaja'mite Chunk",
        "castBarCaption": "Collecting", "size": 0.5,
        "Data0": 43, "Data1": CHUNK, "Data3": 1, "Data8": 14124, "ScriptName": "",
    }, tier="base", zone=ctx.sfx, owner="kajamite")
    ctx.col.put("gameobjectdisplayinfo", 9436, {
        "id": 9436,
        "model_name": r"world\skillactivated\tradeskillnodes\kajamite_01.mdx",
    }, tier="base", zone=ctx.sfx, owner="kajamite")

    # loot: quest item 84467 (was 48766), 100%
    ctx.col.delete("gameobject_loot_template", "Entry=%d" % CHUNK)
    ctx.col.add("gameobject_loot_template", {
        "Entry": CHUNK, "Item": 84467, "Reference": 0, "Chance": 100,
        "QuestRequired": 1, "LootMode": 1, "GroupId": 0, "MinCount": 1, "MaxCount": 1,
    })
    # no fixed chunk spawns anywhere (Whitemane-verified: chunks exist only
    # after a bombing); the DELETE clears the historical pre-placed rows.
    ctx.col.delete("gameobject", "id=%d" % CHUNK)
    return "chunk template+loot (spawns are SAI-summoned; fixed spawns cleared)"


def _emit_kezan(ctx):
    # ---- deposit goober templates (I-256; see module docstring) ----
    for e in K_DEPOSITS:
        cols = {"entry": e, "type": 10, "displayId": 9129, "name": "Kaja'mite Deposit",
                "size": 2.0, "Data3": 2000, "Data5": 1,
                "AIName": "SmartGameObjectAI", "ScriptName": ""}
        if e == 195489:
            cols["Data0"] = 43        # retail lock (stock in 3.3.5a Lock.dbc)
        ctx.col.put("gameobject_template", e, cols,
                    tier="base", zone=ctx.sfx, owner="kajamite")
        # AC keeps GO flags in the addon table. Retail used flags 16
        # (NOT_SELECTABLE), but AC's GameObject::Use() has a xinef guard that
        # hard-returns on that flag — it killed the bomb's forced Use() too
        # (I-256 round 3). flags 4 = GO_FLAG_INTERACT_COND: the CLIENT refuses
        # hand interaction, while the spell/SAI path (which only guards
        # NOT_SELECTABLE) still activates the goober.
        ctx.col.put("gameobject_template_addon", e,
                    {"entry": e, "faction": 0, "flags": 4},
                    tier="base", zone=ctx.sfx, owner="kajamite")

    # ---- SAI: bomb-activated goober summons 3 lootable chunks scattered
    # around itself (Whitemane-verified count/spread). SUMMON_GO adds the SAI
    # row's target_x/y/z to the target's position, so target 1 (self) +
    # per-row offsets = chunks within a couple yards of the blasted node. ----
    ctx.col.delete("smart_scripts",
                   "entryorguid IN (%d,%d) AND source_type=1" % K_DEPOSITS)
    scatter = [(1.8, 1.1), (-2.0, 0.7), (0.2, -2.1)]
    for e in K_DEPOSITS:
        for sid, (ox, oy) in enumerate(scatter):
            ctx.col.add("smart_scripts", {
                "entryorguid": e, "source_type": 1, "id": sid, "link": 0,
                "event_type": 70, "event_phase_mask": 0, "event_chance": 100,
                "event_flags": 0,
                "event_param1": 2, "event_param2": 0, "event_param3": 0,
                "event_param4": 0, "event_param5": 0, "event_param6": 0,
                "action_type": 50,
                "action_param1": CHUNK, "action_param2": CHUNK_DESPAWN,
                "action_param3": 0, "action_param4": 0, "action_param5": 0,
                "action_param6": 0,
                "target_type": 1, "target_param1": 0, "target_param2": 0,
                "target_param3": 0, "target_param4": 0,
                "target_x": ox, "target_y": oy, "target_z": 0, "target_o": 0,
                "comment": "Kaja'mite Deposit - On Activated (Kablooey Bombs) - Summon Kaja'mite Chunk %d/3 (I-256)" % (sid + 1),
            }, sort_key=e * 10 + sid)

    # ---- deposit spawns from TDB 4.3.4 (Neltharion lacks them). Dedupe by
    # POSITION ONLY (<1.5yd): the sniff carries every deposit twice — the 16
    # 195488 rows all stack on a 195489 within 0.14 yd (alternate-build sniffs
    # of the same physical deposit). First-seen wins (guid order -> 195489). ----
    rows = ctx.tdb_q(
        "SELECT id,position_x,position_y,position_z,orientation,"
        "rotation0,rotation1,rotation2,rotation3,phaseMask "
        "FROM gameobject WHERE id IN (%d,%d) ORDER BY CAST(guid AS UNSIGNED)" % K_DEPOSITS)
    spawns = []
    for r in rows:
        x, y = float(r["position_x"]), float(r["position_y"])
        if any((x - float(k["position_x"])) ** 2 + (y - float(k["position_y"])) ** 2 < 1.5 ** 2
               for k in spawns):
            continue
        spawns.append(r)

    ctx.col.delete("gameobject", "id IN (%d,%d)" % K_DEPOSITS)
    R = ctx.col.Raw
    import math
    for i, s in enumerate(spawns):
        g = K_DEP_GUID0 + i
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        z = float(s["position_z"])
        x, y, z = K_DEP_SNAP.get((round(x), round(y)), (x, y, z))
        # unit quaternion derived from orientation (%.4f-rounding the sniffed
        # quaternion made it non-unit -> core warns + discards it anyway)
        o = float(s["orientation"])
        ctx.col.add("gameobject", {
            "guid": g, "id": int(s["id"]), "map": 1, "zoneId": 0, "areaId": 0,
            "spawnMask": 1, "phaseMask": 65535,
            "position_x": R("%.4f" % x), "position_y": R("%.4f" % y),
            "position_z": R("%.4f" % z),
            "orientation": R("%.4f" % o),
            "rotation0": 0, "rotation1": 0,
            "rotation2": R("%.9f" % math.sin(o / 2)),
            "rotation3": R("%.9f" % math.cos(o / 2)),
            "spawntimesecs": 300, "animprogress": 255, "state": 1, "VerifiedBuild": 0,
            "Comment": "F-011 Kezan Kaja'mite Cavern (I-256)",
        }, sort_key=g)

    return ("Kezan deposits=%d (guids %d..%d) + SAI chunk-summon on bomb"
            % (len(spawns), K_DEP_GUID0, K_DEP_GUID0 + len(spawns) - 1))


def emit(ctx):
    return _emit_kezan(ctx) if ctx.sfx else _emit_lost_isles(ctx)
