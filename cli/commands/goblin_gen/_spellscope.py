"""Shared helper: the port's DERIVED spell requirement (I-274).

Leading underscore -> not a gen domain; loaded by spells.py / smartai.py /
spellclick.py / vehicles.py via their sibling-module loader.

WHY THIS EXISTS
---------------
`spells.py` used to port exactly the ids hand-listed in the `missing_spells`
fixture. Nothing derived that list and nothing fed it, so a Cata spell reached
only from a SmartAI action was never ported — and `smartai.py`, which drops any
cast/aura action whose spell is absent from the 3.3.5a DBC, then silently
dropped the row that referenced it. Where that row was the head of a quest's
credit chain the objective became uncompletable with no error anywhere
(I-274: quest 14125 "447" lost all four objectives; 24925 "Free the Captives"
lost its only credit path).

The fixture grew only when a human tripped over a broken quest — see its git
history: three commits, three hand-patched quests (I-242, I-246, I-254).

WHAT REPLACED IT
----------------
`required()` walks the port's actual reference sites and takes the transitive
closure over `effect_trigger_spell`. `ported()` then filters that to the spells
3.3.5a can actually represent, checking the four fields the core ASSERTs on in
`SpellMgr::LoadSpellInfoCustomAttributes`:

    ASSERT(Effect        < TOTAL_SPELL_EFFECTS)   // 165
    ASSERT(ApplyAuraName < TOTAL_AURAS)           // 318
    ASSERT(TargetA       < TOTAL_SPELL_TARGETS)   // 111
    ASSERT(TargetB       < TOTAL_SPELL_TARGETS)

That assert block is what actually crashed the earlier wide-port attempt
(I-230) — a boot-time ASSERT naming the offending field, not an unfixable
NULL deref. The old emitter copied all four straight through unchecked while
carefully guarding cast/duration/range against the stock index tables; these
are the four checks it was missing. Rejection is per-EFFECT where the effect is
merely unrepresentable, and per-SPELL only when nothing usable survives, so one
Cata-only aura on effect 2 no longer costs us effects 1 and 3.

`rejects()` returns the refusals with reasons so the caller can PRINT them.
A dropped spell must never again be a silent counter.

SCOPE (deliberately bounded)
----------------------------
Reference sites walked: SmartAI cast/aura actions on owned creature/GO
templates (plus their timed-actionlist closure), `npc_spellclick_spells` on
owned creatures, `quest_template.RequiredSpellCast*` on ported quests, and the
spell ids GO templates cast out of their own data fields (I-275: the Life
Savings boarding mortar, a type-22 SPELLCASTER, was a dead click because its
Data0 spell reached no reference site), and vehicle action bars — source
`creature_template.spell1-8` on creatures with a VehicleId (I-311: the
Warchief's Revenge cyclone shipped with an empty bar because 68445 reached no
reference site) — i.e. the sites where a missing spell silently breaks a
quest. Non-vehicle creature ability spells are NOT walked yet; `uncovered()`
counts them so the remaining gap is visible rather than assumed absent.

The `missing_spells` fixture survives as an explicit ADDITIONS list (things no
reference site can reach, e.g. hand-authored substitutes), unioned in by
`required()`. It is no longer the source of truth.
"""

import os

# --- SmartAI constants (shared with smartai.py so the two agree by construction) ---
# SMART_ACTION types whose action_param1 is a spellId. A cast/aura action whose
# spell is absent from Spell.dbc crashes the worldserver on fire (I-230).
SPELL_ACTION_TYPES = {11, 28, 75, 85, 86, 118, 134}
# 3.3.5a valid ceilings (AC 3.3.5a): SMART_EVENT ~ up to 74, SMART_ACTION up to ~135
MAX_EVENT, MAX_ACTION = 74, 135
TAL_CALL = 80          # CALL_TIMED_ACTIONLIST: param1 = id
TAL_RANDOM = 87        # CALL_RANDOM_TIMED_ACTIONLIST: params 1-6 = ids (0 = unused)
TAL_RANGE = 88         # CALL_RANDOM_RANGE_TIMED_ACTIONLIST: param1..param2 = id range

# --- SMART_ACTION / SMART_EVENT opcode divergence, source vs AC (I-274) -----
# The port imports smart_scripts rows verbatim, but the two cores do NOT agree on
# every opcode number. Audited by diffing the enums in
#   Zeppelin-Tools/Neltharion-Source/.../AI/SmartScripts/SmartScriptMgr.h   (4.3.4)
#   Zeppelin-Core/src/server/game/AI/SmartScripts/SmartScriptMgr.h          (AC 3.3.5a)
# 26 action ids and 12 event ids differ by name. Most are pure renames of the same
# semantic (WP_* -> ESCORT_*, HEALT_PCT -> HEALTH_PCT, TARGET_CASTING ->
# VICTIM_CASTING, the QUEST_OBJ_COPLETETION typo) and need no handling. Ids above
# MAX_ACTION never import. What is left is below.
#
# ACTION_REMAP: same semantic, different number — rewrite on import.
#   85: source INVOKER_CAST. AC uses 85 for SELF_CAST (which its validator does not
#       even handle) and puts INVOKER_CAST at 134. Importing 85 verbatim made
#       SmartAIMgr log "Not handled action_type(85) ... skipped" and drop the row —
#       which is why quest 14125 "447" still gave no credit after its rows were
#       restored: they loaded into the DB and the core threw them away.
ACTION_REMAP = {85: 134}
#
# ACTION_DIVERGENT / EVENT_DIVERGENT: the id means something ELSE in AC and there is
# no safe equivalent. None currently appear in the imported set, but importing one
# verbatim would silently execute the wrong opcode — far worse than a dropped row —
# so they are refused loudly instead of trusted.
ACTION_DIVERGENT = {
    16:  "source SEND_CASTCREATUREORGO; AC 16 is RESERVED_16",
    103: "source SEND_QUEST_EVENT; AC 103 is SET_ROOT",
    114: "source MOVE_OFFSET; AC 114 is RISE_UP",
    121: "source SET_ROOT; AC 121 is SET_SIGHT_DIST",
}
EVENT_DIVERGENT = {
    66: "source DUMMY_EFFECT; AC 66 is EVENT_PHASE_CHANGE",
    78: "source DISTANCE_PLAYER; AC 78 is SCENE_START",
}

# --- 3.3.5a core ceilings -------------------------------------------------
# Mirrors the ASSERT block in SpellMgr::LoadSpellInfoCustomAttributes. Keep in
# step with TOTAL_SPELL_EFFECTS / TOTAL_AURAS / TOTAL_SPELL_TARGETS in the core
# (SharedDefines.h, SpellAuraDefines.h) — a ported row above any of these is a
# boot-time ASSERT, not a soft failure.
TOTAL_SPELL_EFFECTS = 165
TOTAL_AURAS = 318
TOTAL_SPELL_TARGETS = 111

# SpellEffect.dbc (4.3.4) field indices — same layout spells.py reads.
E_EFFECT, E_AURA, E_RADIUS = 1, 3, 15
E_RADIUS_MAX = 16          # 4.3.4 only: EffectRadiusMaxIndex (see radius_index())
E_TRIGGER, E_TARGET_A, E_TARGET_B = 21, 22, 23
E_SPELLID, E_INDEX = 24, 25


def radius_index(e):
    """The single 3.3.5a `effect_radius_index` for one 4.3.4 SpellEffect row (I-287).

    4.3.4 split the radius into `EffectRadiusIndex` (min) + `EffectRadiusMaxIndex`,
    and Cata routinely leaves the MIN index 0 and carries the real value in the MAX
    one — 4517 area-target effects in the 4.3.4 SpellEffect.dbc are shaped that way.
    3.3.5a has one index, so reading only field 15 shipped radius 0.

    A radius of 0 is NOT a harmless default for an area target: `CalcRadius` returns
    0.0f with no SpellRadius row, and `Spell::SelectImplicitAreaTargets` then searches
    a 0-yard sphere and finds nothing. The spell casts, consumes the item, and does
    nothing — no error anywhere (I-287: quest 14031 "Capturing the Unknown", where
    the KTC Snapflash 68280 is `TARGET_SRC_CASTER` + `TARGET_UNIT_SRC_AREA_ENTRY`
    with RadiusIndex 0 / RadiusMaxIndex 9).
    """
    return e[E_RADIUS] or e[E_RADIUS_MAX]

# --- GO templates that cast a spell out of their own data fields (I-275) ---
# gameobjects.py copies Cata Data0-23 through verbatim, so the reference ships;
# nothing used to tell this walk the spell was needed. A type-22 SPELLCASTER
# whose Data0 spell is absent is the only one AC reports (ObjectMgr.cpp:8040
# CheckGOSpellId, its single call site) — the type-10 goobers fail silently.
# Field indices are AC 3.3.5a's GameObjectTemplate union (GameObjectData.h);
# the Cata source agrees on every index listed here.
GO_SPELL_FIELDS = {
    6:  ("Data3",),             # trap.spellId
    10: ("Data10",),            # goober.spellId
    18: ("Data1", "Data4"),     # summoningRitual.spellId / .casterTargetSpell
    22: ("Data0",),             # spellcaster.spellId
}

# TARGET_DEST_DB — the implicit target that reads its destination from the world
# DB table `spell_target_position` (SpellMgr.cpp:1561). A spell using it without
# a destination row lands the caster nowhere, so the scope treats a missing
# destination as an unrepresentable effect rather than shipping a silent no-op.
TARGET_DEST_DB = 17


def _val(v):
    if isinstance(v, float) and v.is_integer():
        v = int(v)
    v = (str(v).strip() if v is not None else "")
    if v == "" or v.lower() == "none":
        return "0"
    return v


def _num(v):
    return int(float(_val(v)))


def tal_refs(rows):
    """Timed-action-list ids called by `rows` (actions 80/87/88)."""
    ids = set()
    for r in rows:
        at = _num(r["action_type"])
        if at == TAL_CALL:
            ids.add(_num(r["action_param1"]))
        elif at == TAL_RANDOM:
            for c in ("action_param1", "action_param2", "action_param3",
                      "action_param4", "action_param5", "action_param6"):
                v = _num(r[c])
                if v:
                    ids.add(v)
        elif at == TAL_RANGE:
            a, b = _num(r["action_param1"]), _num(r["action_param2"])
            if 0 < a <= b and b - a <= 200:
                ids.update(range(a, b + 1))
    ids.discard(0)
    return ids


def _memo(ctx, name, build):
    """Cache `build(ctx)` on the collector, keyed by the current collected scope.

    The collector is shared across both zone passes, so a value computed on the
    Lost Isles pass (Kezan templates not collected yet) must not be handed back
    on the Kezan pass. Keying on the scope size makes the cache self-invalidate
    when the scope grows, whatever order the domains run in.
    """
    sig = (len(ctx.col.pks("creature_template", owned=True)),
           len(ctx.col.pks("gameobject_template", owned=True)))
    store = getattr(ctx.col, "_spellscope_memo", None)
    if store is None:
        store = ctx.col._spellscope_memo = {}
    hit = store.get(name)
    if hit is not None and hit[0] == sig:
        return hit[1]
    val = build(ctx)
    store[name] = (sig, val)
    return val


def sai_scope(ctx):
    """(creature_entries, gameobject_entries) whose source SmartAI the port imports.

    Owned template rows minus the smartai_exclude blacklist — the same derived
    scope smartai.py uses, defined once here so the two cannot drift.
    """
    excl = ctx.fixture("smartai_exclude")
    excl_cre, excl_go = set(excl.get("cre", [])), set(excl.get("go", []))
    cre = sorted(int(e) for e in ctx.col.pks("creature_template", owned=True)
                 if int(e) not in excl_cre)
    go = sorted(int(e) for e in ctx.col.pks("gameobject_template", owned=True)
                if int(e) not in excl_go)
    return cre, go


# --- pre-sweep scope: collector-independent stand-in for sai_scope() ---------
# `sai_scope()` reads the COLLECTED creature/GO templates, which makes it unusable
# by the domains that run BEFORE creature_template is populated — and those are
# exactly the domains that need to know which creatures a ported spell SUMMONS, so
# the summon-only templates can join the sweep in the first place (I-285).
# The zone spawn sweep is the one scope available that early: it is what
# creatures.py itself starts from, so it is a superset of the SAI scope for every
# entry that carries a summoning script. Being wider than sai_scope() is safe here
# — an extra reference only means an extra template offered to the sweep, and the
# sweep drops entries the source does not have.
ZONE_IDS = ("4720", "4737")


def presweep_scope(ctx):
    """(creature_entries, gameobject_entries) from the SOURCE zone spawn sweep.

    Zone-independent (both zones, always) so the value does not change between
    the two passes, and collector-independent so it is valid before any domain
    has collected a template.
    """
    cached = getattr(ctx.col, "_spellscope_presweep_scope", None)
    if cached is not None:
        return cached
    zones = ",".join("'%s'" % z for z in ZONE_IDS)

    def sweep(spawn_table, tmpl_table):
        spawned = {_num(r["id"]) for r in ctx.q(
            "SELECT DISTINCT TRIM(id) AS id FROM %s WHERE TRIM(zone) IN (%s)"
            % (spawn_table, zones))}
        # e < 1000000: Neltharion dev/test NPCs use leet/placeholder entries (I-233).
        known = {_num(r["entry"]) for r in ctx.q(
            "SELECT entry FROM %s WHERE entry < 1000000" % tmpl_table)}
        return sorted(spawned & known)

    val = (sweep("creature", "creature_template"),
           sweep("gameobject", "gameobject_template"))
    ctx.col._spellscope_presweep_scope = val
    return val


def _sai_rows(ctx, scope=None):
    """All in-scope source smart_scripts rows, incl. the timed-actionlist closure.

    Bulk-fetched (one query per source_type) and cached on the collector, since
    both spells.py and smartai.py need the same set on the same pass. `scope`
    overrides sai_scope() for the pre-sweep walk (cached separately, since it
    does not move with the collected scope).
    """
    if scope is not None:
        cached = getattr(ctx.col, "_spellscope_presweep_sai", None)
        if cached is None:
            cached = ctx.col._spellscope_presweep_sai = _build_sai_rows(ctx, scope)
        return cached
    return _memo(ctx, "sai_rows", _build_sai_rows)


def _build_sai_rows(ctx, scope=None):
    cre, go = scope if scope is not None else sai_scope(ctx)
    rows = []

    def fetch(source_type, entries):
        if not entries:
            return []
        ids = ",".join(str(int(e)) for e in entries)
        return ctx.q("SELECT * FROM smart_scripts WHERE source_type=%d "
                     "AND entryorguid IN (%s) ORDER BY entryorguid, id" % (source_type, ids))

    rows.extend(fetch(0, cre))
    rows.extend(fetch(1, go))
    # actionlist closure to a fixpoint
    seen_tal = set()
    pending = tal_refs(rows)
    while pending:
        batch = sorted(pending - seen_tal)
        if not batch:
            break
        seen_tal |= set(batch)
        got = fetch(9, batch)
        rows.extend(got)
        pending = tal_refs(got) - seen_tal
    return rows


ESCORT_START = 53      # SMART_ACTION_ESCORT_START (source WP_START): param2 = pathID


def escort_paths(ctx):
    """{pathID: [(source_type, entryorguid)]} for escort paths the port references.

    `SMART_ACTION_ESCORT_START` (53, same number and param layout in both cores)
    takes a pathID in action_param2 that AC resolves through SmartWaypointMgr —
    the **`waypoints`** table, NOT `waypoint_data`. The port never carried
    `waypoints` at all, so every ported escort silently stood still: 9 paths
    referenced, 0 present (I-274 — the quest 447 Gasbot never drove into the
    building, so its arrival event never fired and the quest never completed).

    Only rows that survive the same filters smartai.py applies are counted, so a
    path referenced solely by a dropped row is not ported.
    """
    return _memo(ctx, "escort_paths", _build_escort_paths)


def _build_escort_paths(ctx):
    out = {}
    for r in _sai_rows(ctx):
        et, at = _num(r["event_type"]), _num(r["action_type"])
        if et > MAX_EVENT or at > MAX_ACTION:
            continue
        if at in ACTION_DIVERGENT or et in EVENT_DIVERGENT:
            continue
        if at != ESCORT_START:
            continue
        pid = _num(r["action_param2"])
        if pid:
            out.setdefault(pid, []).append((_num(r["source_type"]), _num(r["entryorguid"])))
    return out


def _spell_refs(ctx, scope=None):
    """Spell ids the port references, before closure/validation, with provenance.

    Returns {spell_id: set(reason strings)} so a reject can be reported against
    the thing that will break. `scope` overrides sai_scope() for the pre-sweep
    walk; in that mode step 4 reads GO data fields from the SOURCE templates,
    since the collector holds none yet.
    """
    refs = {}

    def note(sid, why):
        if sid:
            refs.setdefault(int(sid), set()).add(why)

    # 1. SmartAI cast/aura actions (only on rows the port would actually keep —
    #    a row dropped for an untranslatable event/action needs no spell).
    for r in _sai_rows(ctx, scope):
        et, at = _num(r["event_type"]), _num(r["action_type"])
        if et > MAX_EVENT or at > MAX_ACTION:
            continue
        if at in SPELL_ACTION_TYPES:
            note(_num(r["action_param1"]),
                 "SAI %s:%s action %d" % (_num(r["source_type"]), _num(r["entryorguid"]), at))

    # 2. spellclick spells on owned creatures
    cre, _go = scope if scope is not None else sai_scope(ctx)
    if cre:
        ids = ",".join(str(e) for e in cre)
        for r in ctx.q("SELECT npc_entry, spell_id FROM npc_spellclick_spells "
                       "WHERE npc_entry IN (%s)" % ids):
            note(_num(r["spell_id"]), "spellclick on %d" % _num(r["npc_entry"]))

    # 2b. vehicle action bars (I-311) — source creature_template.spell1-8 on owned
    #     creatures with a VehicleId. vehicles.py filters the bar to spells 3.3.5a
    #     will have, so a bar spell missing from this walk was silently dropped and
    #     the rider sat in a vehicle with an empty action bar (quest 14243's Cyclone
    #     of the Elements lost 68445 Lightning Strike). Non-vehicle ability spells
    #     stay unwalked — `uncovered()` still counts those.
    if cre:
        ids = ",".join(str(e) for e in cre)
        cols = ", ".join("spell%d" % n for n in range(1, 9))
        for r in ctx.q("SELECT entry, VehicleId, " + cols +
                       " FROM creature_template WHERE entry IN (%s)" % ids):
            if not _num(r["VehicleId"]):
                continue
            for n in range(1, 9):
                note(_num(r["spell%d" % n]),
                     "vehicle bar on %d" % _num(r["entry"]))

    # 3. quest RequiredSpellCast objectives (I-247) — the cast that grants credit
    qids = sorted(set(ctx.fixture("item_scope").get("quests", []))
                  | set(ctx.fixture("item_scope_K").get("quests", [])))
    if qids:
        cols = ", ".join("RequiredSpellCast%d" % n for n in (1, 2, 3, 4))
        q = ("SELECT Id, " + cols + " FROM quest_template WHERE Id IN (%s)"
             % ",".join(str(int(x)) for x in qids))
        for r in ctx.q(q):
            for n in (1, 2, 3, 4):
                note(_num(r["RequiredSpellCast%d" % n]), "quest %d objective" % _num(r["Id"]))

    # 4. gameobject templates that cast a spell out of their data fields (I-275).
    #    Read from the COLLECTOR, not the source DB, so the walk sees the row the
    #    port will actually emit — gameobjects.py rewrites `type` for some entries
    #    (TYPE_OVERRIDE) and zeroes gossip ids, and a spell reference derived from
    #    a template we do not ship would be a phantom requirement.
    if scope is None:
        go_rows = ((e, ctx.col.get("gameobject_template", e) or {})
                   for e in sorted(int(x) for x in ctx.col.pks("gameobject_template", owned=True)))
    else:
        _cre, go_scope = scope
        go_rows = (((_num(r["entry"])), r) for r in (ctx.q(
            "SELECT * FROM gameobject_template WHERE entry IN (%s)"
            % ",".join(str(int(e)) for e in go_scope)) if go_scope else []))
    for e, row in go_rows:
        for f in GO_SPELL_FIELDS.get(_num(row.get("type", 0)), ()):
            note(_num(row.get(f, 0)), "GO %d %s (type %d)" % (e, f, _num(row.get("type", 0))))

    # 4b. permanent auras a creature is spawned with (I-292).
    #     `creature_addon.py` drops any aura whose spell 3.3.5a lacks, and nothing
    #     told this walk those spells were needed — so an NPC's defining aura was
    #     silently thrown away. Cost: quest 14031's four camera markers each carry a
    #     MOD_INVISIBILITY aura (68231 / 70686 / 70687 / 70688) whose matching
    #     "See Invis Target Bunny" detect spells DID port (the actionlists reference
    #     them). Half the pair shipped, so the markers were visible to everybody,
    #     quest or not.
    if cre:
        ids = ",".join(str(e) for e in cre)
        for r in ctx.q("SELECT entry, auras FROM creature_template_addon "
                       "WHERE entry IN (%s)" % ids):
            for tok in str(r["auras"] or "").split():
                note(_num(tok), "creature_template_addon aura on %d" % _num(r["entry"]))

    # 5. explicit additions the reference walk cannot reach
    for sid in ctx.fixture("missing_spells"):
        note(int(sid), "missing_spells fixture")
    return refs


def whitemane_spells(ctx):
    """(spell_ids_present, {spell_id: {effect_index: fields}}) from the Whitemane DBCs."""
    cached = getattr(ctx.col, "_spellscope_wm", None)
    if cached is not None:
        return cached
    import struct

    def read(path):
        d = open(path, "rb").read()
        rc, fc, rs, _ss = struct.unpack("<4I", d[4:20])
        out = []
        for i in range(rc):
            b = 20 + i * rs
            out.append([struct.unpack_from("<i", d, b + f * 4)[0] for f in range(fc)])
        return out

    have = {r[0] for r in read(ctx.whitemane_dbc("Spell.dbc"))}
    eff = {}
    for r in read(ctx.whitemane_dbc("SpellEffect.dbc")):
        eff.setdefault(r[E_SPELLID], {})[r[E_INDEX]] = r
    ctx.col._spellscope_wm = (have, eff)
    return have, eff


SRC_MAP, DST_MAP = 648, 1
DX, DY = -533.3333, -12800.0   # map648 -> map1 offset (mirrors gameobjects.py)


def dest_positions(ctx):
    """{spell_id: {effect_index: dict(MapID, PositionX/Y/Z, Orientation)}}.

    Destinations for TARGET_DEST_DB effects. TDB 4.3.4 is the only source we hold
    that carries `spell_target_position` at all — the Neltharion dump has no such
    table, and the GOs whose spells it would cover are driven there by C++ scripts
    that are not in its source tree. Rows on map 648 are translated to map 1 with
    the same offset the spawn emitters apply; rows on any other map pass through.

    The whole table is read once (a few thousand rows) rather than filtered by the
    required set, so this stays free of the required() -> analyse() cycle.
    """
    cached = getattr(ctx.col, "_spellscope_dest", None)
    if cached is not None:
        return cached
    out = {}
    for r in ctx.tdb_q("SELECT ID, EffectIndex, MapID, PositionX, PositionY, "
                       "PositionZ, Orientation FROM spell_target_position"):
        m = _num(r["MapID"])
        x, y = float(r["PositionX"]), float(r["PositionY"])
        if m == SRC_MAP:
            m, x, y = DST_MAP, x + DX, y + DY
        out.setdefault(_num(r["ID"]), {})[_num(r["EffectIndex"])] = dict(
            MapID=m, PositionX=x, PositionY=y,
            PositionZ=float(r["PositionZ"]), Orientation=float(r["Orientation"]))

    # hand-authored destinations (I-311): rows NO held source carries — retail kept
    # spell_target_position server-side, so a TARGET_DEST_DB spell whose row never
    # shipped in TDB434 was unportable (the Rope Ladder A/B jumps 68488/68489 were
    # rejected and their type-22 GOs were dead clicks). Fixture rows are FINAL live
    # coords (map 1) — no 648 translation — and win over TDB rows on collision.
    for r in ctx.fixture("spell_target_position")["rows"]:
        out.setdefault(_num(r["ID"]), {})[_num(r["EffectIndex"])] = dict(
            MapID=_num(r["MapID"]), PositionX=float(r["PositionX"]),
            PositionY=float(r["PositionY"]), PositionZ=float(r["PositionZ"]),
            Orientation=float(r["Orientation"]))
    ctx.col._spellscope_dest = out
    return out


def stock_spell_ids(ctx):
    """Spell ids 3.3.5a SHIPPED, read from the pristine stock DBC.

    Deliberately NOT the live DBC: a spell this emitter ported on an earlier run
    is present live, and testing against live would make the emitter treat its
    own past output as "already there" and stop emitting it — the AUTO file is
    full-state and `dbc db rebuild` replays it from scratch, so that silently
    deletes the row. Stock keeps the derivation deterministic and idempotent.
    """
    cached = getattr(ctx.col, "_spellscope_stock", None)
    if cached is None:
        cached = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spell")}
        ctx.col._spellscope_stock = cached
    return cached


def foreign_spell_ids(ctx):
    """Spell ids some OTHER zpak DBC file already defines.

    Hand-authored `[I-xxx]_spell.sql` clones (I-234 66306, I-248, I-251, I-257)
    live outside the AUTO file. One file owns one row id — porting a Whitemane
    version of the same id from here would fight the hand-authored one on apply,
    so those ids are not ours to derive.

    Only DELETE / INSERT establish ownership. A bare UPDATE is the documented
    override pattern — a `[I-xxx]` file layering a fix ON TOP of a row this
    emitter still has to produce (I-254 zeroes a Cata-only spell_visual on 66911
    / 66985, I-256 repoints 67682). Treating those as foreign would delete the
    very rows they patch and leave the overrides updating nothing.
    """
    cached = getattr(ctx.col, "_spellscope_foreign", None)
    if cached is not None:
        return cached
    import glob
    import re
    craft = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.dirname(os.path.abspath(__file__)))))
    ours = os.path.join("zep-goblin-start", "dbc", "[AUTO,F-011]_spell.sql")
    single = re.compile(r"DELETE\s+FROM\s+spell\s+WHERE\s+id\s*=\s*(\d+)", re.I)
    inlist = re.compile(r"DELETE\s+FROM\s+spell\s+WHERE\s+id\s+IN\s*\(([\d,\s]+)\)", re.I)
    between = re.compile(r"DELETE\s+FROM\s+spell\s+WHERE\s+id\s+BETWEEN\s+(\d+)\s+AND\s+(\d+)", re.I)
    insert = re.compile(r"INSERT\s+INTO\s+spell\s+SET\s+id\s*=\s*(\d+)", re.I)
    ids = set()
    for path in glob.glob(os.path.join(craft, "zpaks", "*", "dbc", "*.sql")):
        if path.endswith(ours):
            continue
        try:
            body = open(path, encoding="utf-8", errors="replace").read()
        except OSError:
            continue
        body = body.replace("`", "")
        # keep `spell` from matching spellicon / spellvisual / spellmissile
        body = re.sub(r"\bspell(?=[a-z_])", "spell_OTHER_", body, flags=re.I)
        for m in single.findall(body):
            ids.add(int(m))
        for m in insert.findall(body):
            ids.add(int(m))
        for grp in inlist.findall(body):
            ids.update(int(x) for x in re.findall(r"\d+", grp))
        for a, b in between.findall(body):
            a, b = int(a), int(b)
            if 0 < a <= b and b - a <= 100000:
                ids.update(range(a, b + 1))
    ctx.col._spellscope_foreign = ids
    return ids


def required(ctx):
    """{spell_id: set(reasons)} — every spell the port references that 3.3.5a lacks.

    Transitively closed over effect_trigger_spell: a ported spell whose trigger
    target is itself unported fires into nothing, so the target is required too.
    """
    return _memo(ctx, "required", _build_required)


def _build_required(ctx):
    return _close(ctx, _spell_refs(ctx))


def presweep_required(ctx):
    """`required()` computed over presweep_scope() instead of the collected scope.

    For the domains that must know the port's summon closure BEFORE any template
    is collected (I-285). Same walk, wider scope, so it is a superset of
    `required()` — never a substitute for it in spells.py / smartai.py, which must
    stay keyed to what the port actually owns.
    """
    cached = getattr(ctx.col, "_spellscope_presweep_required", None)
    if cached is None:
        cached = ctx.col._spellscope_presweep_required = _close(
            ctx, _spell_refs(ctx, presweep_scope(ctx)))
    return cached


def _close(ctx, refs):
    stock = stock_spell_ids(ctx) | foreign_spell_ids(ctx)
    _have, eff = whitemane_spells(ctx)
    # transitive closure over effect_trigger_spell
    pending = [s for s in refs if s not in stock]
    while pending:
        sid = pending.pop()
        for e in eff.get(sid, {}).values():
            t = e[E_TRIGGER]
            if t and t not in stock and t not in refs:
                refs.setdefault(t, set()).add("triggered by %d" % sid)
                pending.append(t)
    return {s: r for s, r in refs.items() if s not in stock}


def _problems(ctx, sid, stock_radius, dests):
    """Per-effect representability problems for one spell.

    Returns (usable_effect_indices, {effect_index: [reason]}, [spell_level reason]).
    """
    have, eff = whitemane_spells(ctx)
    if sid not in have:
        return set(), {}, ["absent from the 4.3.4 client Spell.dbc"]
    effects = eff.get(sid, {})
    if not effects:
        return set(), {}, []          # effect-less spell (pure aura carrier) — fine
    usable, bad = set(), {}
    for idx, e in effects.items():
        why = []
        # I-275: TARGET_DEST_DB reads its destination from `spell_target_position`.
        # Shipping the effect without one gives a spell that fires the caster
        # nowhere — a silent no-op, exactly what this walk exists to prevent.
        if TARGET_DEST_DB in (e[E_TARGET_A], e[E_TARGET_B]) and idx not in dests.get(sid, {}):
            why.append("TARGET_DEST_DB but no spell_target_position row for effect "
                       "%d in any held source" % (idx + 1))
        if e[E_EFFECT] >= TOTAL_SPELL_EFFECTS:
            why.append("Effect %d >= %d" % (e[E_EFFECT], TOTAL_SPELL_EFFECTS))
        if e[E_AURA] >= TOTAL_AURAS:
            why.append("ApplyAuraName %d >= %d" % (e[E_AURA], TOTAL_AURAS))
        if e[E_TARGET_A] >= TOTAL_SPELL_TARGETS:
            why.append("TargetA %d >= %d" % (e[E_TARGET_A], TOTAL_SPELL_TARGETS))
        if e[E_TARGET_B] >= TOTAL_SPELL_TARGETS:
            why.append("TargetB %d >= %d" % (e[E_TARGET_B], TOTAL_SPELL_TARGETS))
        ri = radius_index(e)
        if ri and ri not in stock_radius:
            why.append("radiusIndex %d absent from stock spellradius" % ri)
        if why:
            bad[idx] = why
        else:
            usable.add(idx)
    return usable, bad, []


def _stock_radius(ctx):
    cached = getattr(ctx.col, "_spellscope_radius", None)
    if cached is None:
        cached = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spellradius")}
        ctx.col._spellscope_radius = cached
    return cached


def analyse(ctx):
    """(ported, dropped_effects, rejected) for the whole derived requirement.

    ported          : {spell_id: usable_effect_indices}
    dropped_effects : {spell_id: {effect_index: [reason]}} — spell ships without them
    rejected        : {spell_id: [reason]} — nothing usable, spell not ported
    """
    return _memo(ctx, "analysis", _build_analysis)


def _build_analysis(ctx):
    stock_radius = _stock_radius(ctx)
    dests = dest_positions(ctx)
    ported, dropped, rejected = {}, {}, {}
    for sid in sorted(required(ctx)):
        usable, bad, fatal = _problems(ctx, sid, stock_radius, dests)
        if fatal:
            rejected[sid] = fatal
            continue
        if bad and not usable:
            rejected[sid] = sorted({w for ws in bad.values() for w in ws})
            continue
        ported[sid] = usable
        if bad:
            dropped[sid] = bad
    return (ported, dropped, rejected)


def ported(ctx):
    """Set of spell ids spells.py will emit — what the other domains may rely on."""
    return set(analyse(ctx)[0])


def rejects(ctx):
    """{spell_id: [reason]} for spells the port needs but 3.3.5a cannot represent."""
    return analyse(ctx)[2]


def uncovered(ctx):
    """Reference sites this helper does not walk yet, for honest reporting.

    Currently: creature ability spells. Counting them keeps the remaining gap
    visible instead of letting 'not walked' read as 'nothing there'.
    """
    cre, _go = sai_scope(ctx)
    if not cre:
        return {}
    ids = ",".join(str(e) for e in cre)
    stock = stock_spell_ids(ctx) | foreign_spell_ids(ctx) | set(analyse(ctx)[0])
    have, _eff = whitemane_spells(ctx)
    out = {}
    try:
        rows = ctx.q("SELECT CreatureID, Spell FROM creature_template_spell "
                     "WHERE CreatureID IN (%s)" % ids)
    except Exception:
        return {}
    for r in rows:
        s = _num(r["Spell"])
        if s and s not in stock and s in have:
            out.setdefault(s, set()).add(_num(r["CreatureID"]))
    return out
