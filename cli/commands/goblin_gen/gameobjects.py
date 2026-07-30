"""gen domain: gameobjects.

gameobject_template / gameobject (spawns) / gameobject_loot_template (Cata,
neltharion) -> AC 3.3.5a, plus GameObjectDisplayInfo DBC additions for models
missing from the 3.3.5a client. Ported from
Scripts/Goblin Zone Port/migrate_gameobjects.py.

Per zone it emits four world-SQL files + one DBC file:
    gameobjects_01_template  — gameobject_template for every spawned GO
                               (Cata Data0-23 kept; faction/flags/questItem dropped;
                               stock herb/mining nodes left to AC, not re-emitted).
    gameobjects_02_spawns    — gameobject rows (map648->map1 coord offset applied,
                               source phaseMask preserved for F-194 phasing).
    gameobjects_03_loot      — gameobject_loot_template for chest/node GOs
                               (custom items remapped via item_remap fixture).
    gameobjects_04_quest_go  — templates for GOs referenced by in-scope quest
                               objectives but never fixed-spawned (keeps the quest
                               objective refs valid). Only written when non-empty.
    dbc gameobjectdisplayinfo — model_name rows for display IDs absent from 3.3.5a.

Fixtures: go_scope[/ _K] (spawned GO entries), go_disp_paths[/ _K] (missing
display -> client model path), item_remap (Cata item -> custom AC item),
item_scope[/ _K] (quest scope, for the quest-summoned GO templates).

The source script also copies GO M2 models into the zpak MPQ folder; that asset
step is out of scope here (this module only emits SQL/DBC).
"""
import importlib.util
import os

NAME = "gameobjects"
TABLES = ["gameobject_template", "gameobjectdisplayinfo", "gameobject",
          "gameobject_loot_template"]
TIER = "base"


def _sibling_const(modname, attr):
    """Read a constant from a sibling gen-domain module (single source of truth)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return getattr(mod, attr)


# I-234/I-261: a Cata cursor IconName the 3.3.5a client doesn't know blanks the
# mouseover cursor (vault 195525 shipped 'openhandglow'). Same map as creatures.
ICONNAME_MAP = _sibling_const("creatures", "ICONNAME_MAP")

# Stock herb/mining nodes that already exist in AC — spawn them, but reuse AC's
# template + loot rather than overwriting them.
STOCK_GO = {1617, 1618, 1619, 1731}

# Kezan PoolElevator GOs are type 11 (TRANSPORT) in the Cata source, but the
# WotLK model (9135) has no TransportAnimation -> StaticTransport::Create fails
# at grid load and they never spawn. Emit as type 5 (GENERIC static prop) so
# they render as scenery.
TYPE_OVERRIDE = {196837: 5, 196838: 5}

# I-277: per-entry corrections to the raw Cata Data0-23 block, applied last so
# they beat both the verbatim copy and the type-based zeroing below.
#
# The Neltharion dump carries GO data-field spell ids from a build LATER than
# the 4.3.4 client DBCs the port validates against (a 1511xx band; same shape as
# the unportable 1511xx phase spells in I-274). _spellscope walks these fields
# (GO_SPELL_FIELDS, I-275) and correctly rejects them — "absent from the 4.3.4
# client Spell.dbc" — but nothing rewrote the field, so the emitted GO cast a
# spell that exists nowhere. AC never reports it for a type-10 goober:
# ObjectMgr::CheckGOSpellId (ObjectMgr.cpp:8040) has one call site and it only
# covers type-22 SPELLCASTER. Silent no-op.
#
# Values below are real 4.3.4 client spells, resolved by name out of the
# Whitemane Spell.dbc. Correcting the field here (rather than in an override
# SQL file) is what lets _spellscope reach the right spell and port it, since
# the walk reads the collector, not the source DB.
DATA_OVERRIDE = {
    # 195188 Goblin Escape Pod — quest 14474 "Goblin Escape Pods".
    #
    # Data10 (goober.spellId) 151140 -> 66137 "Goblin Escape Pods: Summon Live
    # Goblin Survivor" (effect 28 SUMMON, MiscValue 34748, SummonProperties 64).
    # Retail points this at 66136, a bare DUMMY whose C++ script rolls live
    # (66137) against dead (66138) — 66138 summons 34736, which the port does
    # not carry, and we have no script for the controller, so the live branch is
    # wired directly. Summoning 34748 from the player is the whole credit path:
    # SmartAI 34748 event 54 JUST_SUMMONED -> actionlist 3474800 -> action 33
    # KILL_CREDIT 34748 on target_type 7 ACTION_INVOKER, which is the summoner.
    # TDB 4.3.4's answer here (67474 "Goblin Escape Pods: Force Cast") is a
    # server-side spell_dbc stub with ZERO spelleffect_dbc rows — TC never
    # implemented the pod either, so it is no use to us.
    #
    # Data3 (goober.autoCloseTime) 0 -> 1000ms. AC gates the entire goober state
    # change on it (GameObject.cpp:1615, `if (info->GetAutoCloseTime())`) where
    # TC does not; at 0 the pod reaches neither SetGoState(GO_STATE_ACTIVE) nor
    # SetLootState(GO_ACTIVATED), so it never opens and Data5 (consumable=1)
    # never processes. Both source dumps carry 0 — this is an AC-specific
    # adaptation, not a correction of the source.
    #
    # Data4 (goober.customAnim) 0 -> 1 SUPPRESSES THE SECOND EXPLOSION.
    # A consumable goober bursts TWICE: once on use via SetGoState(GO_STATE_ACTIVE),
    # and again when autoCloseTime expires, where AC runs in one tick
    # SetGoState(GO_STATE_READY) -> SendObjectDeSpawnAnim -> DestroyForVisiblePlayers
    # (GameObject.cpp:830-878). The tail pair is not suppressible from data:
    # the state reset is unconditional for goobers, and SendObjectDeSpawnAnim is
    # gated on IsDespawnAtAction() == goober.consumable (GameObjectData.h:398),
    # which we must keep or the pod stays standing and re-clickable and one pod
    # farms all six credits. Shortening Data3 does NOT merge them — tested at
    # 1000ms and the two bursts were still ~1s apart.
    #
    # So kill the FIRST one instead. customAnim makes Use() skip
    # SetGoState(GO_STATE_ACTIVE) entirely and call SendCustomAnim(GetGoAnimProgress())
    # instead — and animprogress is 255 on every pod spawn, which is not a valid
    # animation index, so nothing plays. The pod then never leaves GO_STATE_READY,
    # so the tail SetGoState(GO_STATE_READY) is a no-op that sends no update at all
    # (Object::SetByteValue:749 only dirties on an actual change). What survives is
    # exactly one SendObjectDeSpawnAnim, fired as the pod is destroyed.
    #
    # Net: click -> Data3 -> ONE burst, and the pod is gone with it. Data3 is now
    # just the delay between the click and that burst; 500ms keeps it snappy.
    195188: {"Data10": 66137, "Data3": 500, "Data4": 1},
    # Still open (I-277), deliberately NOT fixed here: 201938 Town-In-A-Box
    # Plunger (Data10 151144) and 205061 Big Red Button (Data10 151157) have the
    # same dead-spell defect. TDB 4.3.4 models both as type 22 SPELLCASTER with
    # Data0 68938 / 73892 rather than type 10, so they need a TYPE_OVERRIDE plus
    # a field move, and their quests (14245, 25207) are untested. Left alone
    # rather than reworked on inference.
}

# I-284: Cata ships these quest pickups as type-3 CHESTS whose loot is a single
# quest-required item. AC never gates chest INTERACTION on quest status —
# chest.questId is dead in the core ("not used currently", GameObjectData.h:92),
# it only feeds the sparkle through ActivateToQuest. Opening runs entirely
# client-side lock cast -> Spell::EffectOpenLock -> Player::SendLoot, and nothing
# on that path reads the quest. So once the objective is full the crate is STILL
# clickable: the loot itself does come out empty (AllowedForPlayer -> false, since
# HasQuestForItem stops matching at count == RequiredItemCount), but the click
# still lands, and with consumable=1 the release sets GO_JUST_DEACTIVATED
# (LootHandler.cpp:313) and despawns the crate for its full respawn timer — a
# player who has finished the quest can walk the beach deleting the crates the
# players behind them still need.
#
# 3.3.5a models this shape as a type-10 GOOBER, and stock ships 168 of them.
# GameObject::Use (GameObject.cpp:1646-1652) breaks out of the whole switch when
# goober.questId is not QUEST_STATUS_INCOMPLETE — no spell, no kill credit, no
# state change, no despawn — and ActivateToQuest then returns false, so the
# activate/sparkle dynflag drops with it. The item comes from goober.spellId, a
# plain CREATE_ITEM spell the player casts on themselves.
#
# Reference twin, stock 190510 "Captured Jormungar Spawn" (quest 12078, collect
# 3x item 36772): type 10, lockId 0, questId in Data1, consumable 1, spellId
# 47451 (effect 24 CREATE_ITEM). Our crates already carry the same
# castBarCaption ('Retrieving') and openTextID (23645) as that GO, which is the
# tell that the Cata source object was the same kind of "retrieve" prop.
#
# autoCloseTime MUST be non-zero: AC gates the whole goober state change on it
# (GameObject.cpp:1615) where TC does not, and at 0 a consumable goober never
# despawns. Same AC-specific adaptation as the escape pod in DATA_OVERRIDE.
# 1000ms keeps the crate's current "gone right after you take it" feel (stock
# 190510 sits at 3000).
#
# The spells are custom — Cata has no counterpart because it used chest loot —
# and live in dbc/[I-284]_spell.sql, one per item, each named after that crate's
# existing castBarCaption. They MUST stay instant: Use() commits the crate
# (GO_FLAG_IN_USE + GO_ACTIVATED + m_cooldownTime) BEFORE casting, so a cast that
# gets interrupted — moving, or SPELL_FAILED_SPELL_IN_PROGRESS from clicking a
# second crate — consumes the crate and hands over nothing. Giving them the
# chest's old 1s bar made quest credit intermittent; see that file's header.
#
# NOT converted, deliberately:
#   202552 Kaja'Cola Zero-One — two loot items, one of them on a 7.3% roll, and
#          its Data8 quest 25122 "Morale Boost" is NPC credit (38441) rather than
#          an item count, so neither a single-item spell nor the questId gate
#          models it. Left as a chest.
#   195492 Kaja'mite Chunk — owned by kajamite.py (SUMMON_GO'd onto a bombed
#          deposit, 120s life), so its conversion belongs in that domain.
QUEST_ITEM_GOOBER = {
    # GO entry: (goober.questId, goober.spellId)          item x count  (quest)
    195201: (14014, 900409),   # Crate of Tools           84300 x8   Get Our Stuff Back!
    201603: (24488, 900410),   # Replacement Parts        84472 x6   The Replacements
    202351: (24946, 900411),   # Rockin' Powder           84321 x5   Rockin' Powder
    202553: (25110, 900412),   # Kaja'Cola Zero-One       84331 x1   Kaja'Cola Gives You IDEAS! (TM)
    202554: (25110, 900412),   # ^ second dispenser entry, same quest + item
    202607: (25201, 900413),   # Spare Shredder Parts     84333 x8   The Ultimate Footbomb Uniform
    202608: (25201, 900413),   # ^ second parts-pile entry, same quest + item
}

# map648 (Cata Lost Isles/Kezan) -> map1 (Kalimdor) coordinate offset.
DX, DY = -533.3333, -12800.0

# Per-zone source zone id + emitted guid block base.
_ZONE = {"": "4720", "_K": "4737"}
_GUID = {"": 6000000, "_K": 6500000}


def _esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def _gi(r, k, d=0):
    try:
        return int(float(r[k])) if r[k] not in (None, "") else d
    except Exception:
        return d


def _template_cols(e, t):
    """Build the ordered gameobject_template column dict for one GO entry."""
    typ = TYPE_OVERRIDE.get(e, _gi(t, "type"))
    icon = (t["IconName"] or "").strip()
    col = {"entry": e, "type": typ, "displayId": _gi(t, "displayId"),
           "name": (t["name"] or "").strip(), "IconName": ICONNAME_MAP.get(icon, icon),
           "castBarCaption": (t["castBarCaption"] or "").strip(), "unk1": (t["unk1"] or "").strip(),
           "size": float(t["size"] or 1)}
    for n in range(24):
        col["Data%d" % n] = _gi(t, "data%d" % n)
    # Gossip menu refs live in the data fields (type 2 questgiver -> Data3,
    # type 10 goober -> Data19) and are raw Cata menu ids that collide with the
    # stock 3.3.5 menu space (I-261: vault 195525 Data19=11013 = the stock ICC
    # Scourge Transporter menu). Zero them here; gossip.py overlays the
    # remapped 510xxx id for menus it ports.
    if typ == 2:
        col["Data3"] = 0
    elif typ == 10:
        col["Data19"] = 0
    # I-284 chest -> goober conversion (see QUEST_ITEM_GOOBER). The whole Data
    # block is rebuilt, not patched: the source fields are chest fields and every
    # index means something else to a goober (chest.lootId at 1 would read as
    # goober.questId). openTextID is the one field that survives — index 14 in
    # both layouts.
    if e in QUEST_ITEM_GOOBER:
        quest_id, spell_id = QUEST_ITEM_GOOBER[e]
        open_text = col["Data14"]
        col["type"] = 10
        for n in range(24):
            col["Data%d" % n] = 0
        col["Data1"] = quest_id     # goober.questId — THE interaction gate
        col["Data3"] = 1000         # goober.autoCloseTime (must be > 0, see above)
        col["Data5"] = 1            # goober.consumable — crate goes away on use
        col["Data10"] = spell_id    # goober.spellId — CREATE_ITEM, dbc/[I-284]_spell.sql
        col["Data14"] = open_text   # goober.openTextID
    # I-277 corrections last, so they win over both the verbatim copy and the
    # gossip zeroing above.
    col.update(DATA_OVERRIDE.get(e, {}))
    col.update({"AIName": "", "ScriptName": "", "VerifiedBuild": 0})
    return col


def emit(ctx):
    sfx = ctx.sfx
    zone = _ZONE[sfx]
    guid_base = _GUID[sfx]
    disp_paths = {int(k): v for k, v in ctx.fixture("go_disp_paths" + sfx).items()}
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    scope = ctx.fixture("go_scope" + sfx)

    gt = {int(r["entry"]): r for r in ctx.q("SELECT * FROM gameobject_template")}
    ents = [e for e in scope["ents"] if e in gt]

    # ---- 01 gameobject_template (skip stock collisions) -> collector ----
    for e in sorted(ents):
        if e in STOCK_GO:
            continue
        ctx.col.put("gameobject_template", e, _template_cols(e, gt[e]),
                    tier="base", zone=sfx, owner="gameobjects")

    # ---- 02 gameobject spawns (scope-curated: keeps dev props like the I-233
    # Gnomey crate/aura column out even though their templates exist in source).
    # Fixed 500,000-guid block DELETE per zone (count-independent) so stale
    # spawns beyond the current count are always cleared; kajamite's chunk guids
    # live inside the Kezan block and re-insert from the same collected file. ----
    spawns = ctx.q("SELECT * FROM gameobject WHERE TRIM(zone)=%s ORDER BY CAST(guid AS UNSIGNED)", (zone,))
    scope_set = set(scope["ents"]) | STOCK_GO
    spawns = [s for s in spawns if int(s["id"]) in gt and int(s["id"]) in scope_set]
    ctx.col.delete("gameobject", "guid BETWEEN %d AND %d" % (guid_base, guid_base + 499999))
    g = guid_base
    for s in spawns:
        g += 1
        x = float(s["position_x"]) + DX
        y = float(s["position_y"]) + DY
        pmask = _gi(s, "phaseMask", 1) or 1   # F-194 preserve Cata phaseMask
        ctx.col.add("gameobject", {
            "guid": g, "id": int(s["id"]), "map": 1, "zoneId": 0, "areaId": 0,
            "spawnMask": 1, "phaseMask": pmask,
            "position_x": x, "position_y": y, "position_z": float(s["position_z"]),
            "orientation": float(s["orientation"]),
            "rotation0": float(s["rotation0"] or 0), "rotation1": float(s["rotation1"] or 0),
            "rotation2": float(s["rotation2"] or 0), "rotation3": float(s["rotation3"] or 0),
            "spawntimesecs": _gi(s, "spawntimesecs", 300),
            "animprogress": _gi(s, "animprogress", 255), "state": _gi(s, "state"),
            "ScriptName": "", "VerifiedBuild": 0,
            "Comment": "F-011 %s" % ("Kezan" if sfx else "Lost Isles"),
        }, sort_key=g)

    # ---- 03 gameobject_loot_template (chest GOs, remap custom items) ----
    gl_entries = set(int(r["entry"]) for r in
                     ctx.q("SELECT DISTINCT TRIM(entry) AS entry FROM gameobject_loot_template"))
    loot_rows, loot_tables = [], set()
    for e in ents:
        if e in STOCK_GO:
            continue
        t = gt[e]
        if _gi(t, "type") == 3:
            lid = _gi(t, "data1")
            if lid in gl_entries:
                # I-284: converted to a goober, so it has no loot table any more.
                # Still claim the id so the DELETE keeps clearing the rows this
                # emitter used to write (dropping the row without the DELETE would
                # leave the old chest loot behind in live).
                if e in QUEST_ITEM_GOOBER:
                    loot_tables.add(lid)
                    continue
                for r in ctx.q("SELECT * FROM gameobject_loot_template WHERE TRIM(entry)=%s", (str(lid),)):
                    mcr = int(r["mincountOrRef"] or 0)
                    if mcr < 0:
                        continue
                    it = int(r["item"] or 0)
                    if it <= 0:
                        continue
                    chance = float(r["ChanceOrQuestChance"] or 0)
                    loot_rows.append((lid, remap.get(it, it), abs(chance), 1 if chance < 0 else 0,
                                      int(r["lootmode"] or 1), int(r["groupid"] or 0),
                                      max(mcr, 1), max(int(r["maxcount"] or 1), mcr, 1)))
                    loot_tables.add(lid)
    if loot_tables:
        ctx.col.delete("gameobject_loot_template",
                       "Entry IN (%s)" % ",".join(str(x) for x in sorted(loot_tables)))
        for (ent, it, ch, q2, lm, gid, mn, mx) in loot_rows:
            ctx.col.add("gameobject_loot_template", {
                "Entry": ent, "Item": it, "Reference": 0, "Chance": ch,
                "QuestRequired": q2, "LootMode": lm, "GroupId": gid,
                "MinCount": mn, "MaxCount": mx,
            })

    # ---- 04 quest-summoned GO templates (referenced by in-scope quests, not spawned) ----
    quests = ctx.fixture("item_scope" + sfx)["quests"]
    refgo = set()
    if quests:
        q_in = ",".join(str(int(q)) for q in quests)
        rows = ctx.q("SELECT RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4 "
                     "FROM quest_template WHERE TRIM(Id) IN (%s)" % q_in)
        for r in rows:
            for k in ("RequiredNpcOrGo1", "RequiredNpcOrGo2", "RequiredNpcOrGo3", "RequiredNpcOrGo4"):
                v = r[k]
                if v is not None and int(v) < 0:
                    refgo.add(-int(v))
    spawned = set(scope["ents"])
    quest_go = sorted(g for g in refgo if g not in spawned and g in gt)
    for e in quest_go:
        ctx.col.put("gameobject_template", e, _template_cols(e, gt[e]),
                    tier="base", zone=sfx, owner="gameobjects")

    # ---- DBC: GameObjectDisplayInfo additions (models absent from 3.3.5a) ----
    needed = sorted(set(_gi(gt[e], "displayId") for e in ents
                        if _gi(gt[e], "displayId") in disp_paths))
    for did in needed:
        ctx.col.put("gameobjectdisplayinfo", did,
                    {"id": did, "model_name": disp_paths[did]},
                    tier="base", zone=sfx, owner="gameobjects")

    return ("templates=%d spawns=%d loot=%d/%d(rows/tables) quest_go=%d dbc_disp=%d"
            % (len([e for e in ents if e not in STOCK_GO]), len(spawns),
               len(loot_rows), len(loot_tables), len(quest_go), len(needed)))
