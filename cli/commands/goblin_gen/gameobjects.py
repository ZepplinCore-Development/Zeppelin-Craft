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

    # 201938 Town-In-A-Box Plunger — quest 14245 "It's a Town-In-A-Box" (I-315).
    # Same 1511xx dead-spell band as the pod above, and the same silent failure:
    # the click reached GameObject::Use, set spellId = 151144, and the tail
    # logged `WORLD: unknown spell id 151144 at use action for gameobject`
    # (Server.log) — the ONE place AC reports a type-10 goober's dead spell, and
    # only at runtime, only after a player tries it.
    #
    # Data10 (goober.spellId) 151144 -> 68938 "It's A Town-In-A-Box:
    # Town-In-A-Box Plunger - Cover", the whole quest in one spell:
    #   effect 0  140 FORCE_CAST      -> 68935 (the launch cinematic, below)
    #   effect 1   90 KILL_CREDIT     MiscValue 38024, target 25
    # 38024 is exactly quest 14245's RequiredNpcOrGo1, and AC's effect 90 is
    # EffectKillCreditPersonal -> KilledMonsterCredit(MiscValue)
    # (SpellEffects.cpp:5753). Target 25 TARGET_UNIT_TARGET_ANY resolves to the
    # explicit target, and the goober tail casts `spellCaster->CastSpell(user,
    # spellId)` with spellCaster = user, so caster and target are both the
    # clicking player. Confirmed against the 4.3.4 CLIENT Spell.dbc by name, per
    # I-277 — Neltharion's own spell_dbc is a nameless server stub and cannot
    # answer this. TDB 4.3.4 agrees on the spell (68938) but models the GO as a
    # type 22 SPELLCASTER; no TYPE_OVERRIDE is needed, because a type-22 casts
    # GO->user and a type-10 casts user->user and target 25 lands on the player
    # either way. Keeping type 10 is the smaller delta and matches the source.
    #
    # Data3 (goober.autoCloseTime) 0 -> 3000ms. Same AC-only gate as the pod
    # (GameObject.cpp:1716): at 0 the plunger reaches neither GO_STATE_ACTIVE nor
    # GO_ACTIVATED, so the handle never visibly depresses. This is the OTHER half
    # of "hitting the plunger does nothing" — even with a live spell the click
    # would have stayed silent on screen. Data4 customAnim stays 0 (unlike the
    # pod): this goober is NOT consumable, so there is no despawn burst to
    # suppress and we want the real press animation. At 3000ms it presses, then
    # GO_JUST_DEACTIVATED resets it to READY (GameObject.cpp:754) — re-clickable,
    # but not farmable, because the goober's own quest gate breaks out before
    # spellId is assigned once 14245 is no longer QUEST_STATUS_INCOMPLETE.
    #
    # NOT overridden: the town itself. 68935's chain force-casts 68750 "Quest
    # Phase 05" (aura 261 SPELL_AURA_PHASE, MiscValue 2048) — suppressed in
    # spells.EFFECT_OVERRIDE, see there. F-194's phase_definitions already owns
    # that flip (zone 4720 entry 5, phaseMask 2048, condition 28 QUEST_COMPLETE
    # on 14245), so the town appears the instant the credit lands.
    201938: {"Data10": 68938, "Data3": 3000},

    # Still open (I-277), deliberately NOT fixed here: 205061 Big Red Button
    # (Data10 151157) has the same dead-spell defect. TDB 4.3.4 offers Data0
    # 73892, but its quest (25207) is untested and the spell is unverified
    # against the client DBC. Left alone rather than reworked on inference.
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
