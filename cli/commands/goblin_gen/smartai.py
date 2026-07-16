"""gen domain: smartai.

F-011 SmartAI import with DERIVED scope: every creature/GO template the port
ships (collector owned base rows — the spawn-driven zone sweep + summon closure,
dev/NOISE-filtered by creatures.py/gameobjects.py) gets its source smart_scripts
imported, minus the smartai_exclude fixture (blacklist for entries whose source
AI we deliberately do not want). Timed action-lists (source_type 9) are not
enumerated either: they are derived as the recursive closure of actionlist calls
(actions 80/87/88) in the imported rows. Replaced the old hand-curated
smartai_scope whitelist, whose questgiver-derived heuristic silently missed
gossip-item vendors (I-245) and summon-only creatures (I-242) — a blacklist
fails loud (extra rows you notice), a whitelist fails silent (dead NPCs).

Filters to 3.3.5a-valid event/action types, and drops cast/aura actions whose
spell is absent from the 3.3.5a DBC (I-230: NULL SpellInfo deref -> worldserver
SIGSEGV on fire). Creature/spell/quest refs are unchanged by the port so pass
through as-is; gossip menu ids (event 62) and item ids (actions 56/57) WERE
renumbered by the port, so those params are remapped via gossip.py's menu remap
+ the item_remap fixture (I-245: "The New You" vendor gossip).

Emitted as a SINGLE file on the LAST (_K) pass — the derived scope needs both
zones' templates collected first, so a partial --zone run raises instead of
emitting half coverage.
"""
NAME = "smartai"
TABLES = ["smart_scripts", "creature_template", "gameobject_template"]
TIER = "overlay"   # AIName overlays need the template base rows collected first

# 3.3.5a valid ceilings (AC 3.3.5a): SMART_EVENT ~ up to 74, SMART_ACTION up to ~135
MAX_EVENT, MAX_ACTION = 74, 135

# SMART_ACTION types whose action_param1 is a spellId. A cast/aura action referencing a
# spell absent from Spell.dbc crashes the worldserver (NULL SpellInfo deref) when the
# event fires — see I-230. Drop those actions at import time. Mirrors
# zz_[I-230]_smartai_strip_missing_cast_spells.sql.
SPELL_ACTION_TYPES = {11, 28, 75, 85, 86, 118, 134}   # 86 CROSS_CAST added (I-242: donor 98xxx ride spells)

COLS = ["entryorguid", "source_type", "id", "link", "event_type", "event_phase_mask", "event_chance",
        "event_flags", "event_param1", "event_param2", "event_param3", "event_param4", "action_type",
        "action_param1", "action_param2", "action_param3", "action_param4", "action_param5", "action_param6",
        "target_type", "target_param1", "target_param2", "target_param3", "target_param4",
        "target_x", "target_y", "target_z", "target_o", "comment"]


def _val(v):
    # Neltharion is loaded into MySQL with inferred types, so coordinate columns
    # (target_x/y/z/o) come back as Python floats; the original script read them as
    # dump-literal strings from sqlite. Render integer-valued floats without a
    # trailing ".0" so "0.0" -> "0" etc., matching the source-string form.
    if isinstance(v, float) and v.is_integer():
        v = int(v)
    v = (str(v).strip() if v is not None else "")
    if v == "" or v.lower() == "none":
        return "0"
    return v


def _esc(v):
    v = _val(v)
    try:
        float(v)
        return v if v not in ("",) else "0"
    except ValueError:
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"


# SMART_ACTION types that call timed action-lists; their referenced source_type-9
# blocks are pulled in recursively rather than enumerated in a fixture.
TAL_CALL = 80          # CALL_TIMED_ACTIONLIST: param1 = id
TAL_RANDOM = 87        # CALL_RANDOM_TIMED_ACTIONLIST: params 1-6 = ids (0 = unused)
TAL_RANGE = 88         # CALL_RANDOM_RANGE_TIMED_ACTIONLIST: param1..param2 = id range


def _tal_refs(rows):
    ids = set()
    for r in rows:
        at = int(float(_val(r["action_type"])))
        if at == TAL_CALL:
            ids.add(int(float(_val(r["action_param1"]))))
        elif at == TAL_RANDOM:
            for c in ("action_param1", "action_param2", "action_param3",
                      "action_param4", "action_param5", "action_param6"):
                v = int(float(_val(r[c])))
                if v:
                    ids.add(v)
        elif at == TAL_RANGE:
            a = int(float(_val(r["action_param1"])))
            b = int(float(_val(r["action_param2"])))
            if 0 < a <= b and b - a <= 200:
                ids.update(range(a, b + 1))
    ids.discard(0)
    return ids


def emit(ctx):
    if not ctx.sfx:
        return "deferred (derived scope needs both zones' templates; emitted on the _K pass)"
    if not getattr(ctx.col, "gossip_menu_remap", None):
        raise RuntimeError("gossip menu remap not collected — smartai needs a full "
                           "--zone both run (gossip emits on the Lost Isles pass)")
    excl = ctx.fixture("smartai_exclude")
    excl_cre, excl_go = set(excl.get("cre", [])), set(excl.get("go", []))
    cre_scope = sorted(int(e) for e in ctx.col.pks("creature_template", owned=True)
                       if int(e) not in excl_cre)
    go_scope = sorted(int(e) for e in ctx.col.pks("gameobject_template", owned=True)
                      if int(e) not in excl_go)
    valid_spells = ctx.dbc_spell_ids()
    iremap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    # gossip.py (base tier, same gen run via contributor closure) stashes its
    # source->510xxx menu renumbering here for event 62 params.
    menu_remap = getattr(ctx.col, "gossip_menu_remap", {})

    rows_by_key = {}
    skipped = 0
    spell_skipped = 0

    def fetch(source_type, entry):
        return ctx.q("SELECT * FROM smart_scripts WHERE source_type=%s AND entryorguid=%s ORDER BY id",
                     (source_type, entry))

    def remap_refs(r, et, at):
        # I-245: gossip menus + items were renumbered by the port; SmartAI params
        # referencing them must follow ("The New You" vendors: event 62 on the
        # remapped 510xxx menu, action 56 adds the remapped 84xxx quest item).
        if et == 62:   # SMART_EVENT_GOSSIP_SELECT: param1 = gossip menu id
            m = int(float(_val(r["event_param1"])))
            if m in menu_remap:
                r["event_param1"] = menu_remap[m]
        if at in (56, 57):   # ADD_ITEM / REMOVE_ITEM: param1 = item id
            it = int(float(_val(r["action_param1"])))
            if it in iremap:
                r["action_param1"] = iremap[it]

    def collect(source_type, entry):
        nonlocal skipped, spell_skipped
        out = []
        for r in fetch(source_type, entry):
            et = int(float(_val(r["event_type"]))); at = int(float(_val(r["action_type"])))
            if et > MAX_EVENT or at > MAX_ACTION:
                skipped += 1; continue
            if at in SPELL_ACTION_TYPES and int(float(_val(r["action_param1"]))) not in valid_spells:
                spell_skipped += 1; continue   # I-230: unported spell -> NULL SpellInfo crash on fire
            remap_refs(r, et, at)
            out.append(r)
        if out:
            rows_by_key[(source_type, entry)] = out

    for e in cre_scope:
        collect(0, e)
    for e in go_scope:
        collect(1, e)

    # timed action-list closure: follow actionlist calls out of the imported rows
    # (and out of the actionlists themselves) to a fixpoint.
    pending = set()
    for rws in rows_by_key.values():
        pending |= _tal_refs(rws)
    done = set()
    while pending:
        tid = pending.pop()
        if tid in done:
            continue
        done.add(tid)
        collect(9, tid)
        pending |= _tal_refs(rows_by_key.get((9, tid), ())) - done

    cre = sorted(set(e for (st, e) in rows_by_key if st == 0))
    go = sorted(set(e for (st, e) in rows_by_key if st == 1))

    # AIName so the scripts run — overlay onto our template INSERTs; entries we do
    # not own (stock rows) render as a consolidated UPDATE by the collector.
    for e in cre:
        ctx.col.put("creature_template", e, {"AIName": "SmartAI"}, tier="overlay")
    for e in go:
        ctx.col.put("gameobject_template", e, {"AIName": "SmartGameObjectAI"}, tier="overlay")

    for (st, e), rws in sorted(rows_by_key.items()):
        ctx.col.delete("smart_scripts", "source_type=%d AND entryorguid=%d" % (st, e))
        for r in rws:
            # values pass through as source-string literals (Raw) to match the
            # original dump rendering exactly (ints/floats/quoted strings)
            ctx.col.add("smart_scripts",
                        {c2: ctx.col.Raw(_esc(r[c2])) for c2 in COLS})
    tal = sorted(set(e for (st, e) in rows_by_key if st == 9))
    return ("scope cre=%d go=%d (excluded cre=%d go=%d) -> blocks=%d rows=%d "
            "[cre=%d go=%d tal=%d] skipped(type)=%d skipped(spell)=%d" % (
                len(cre_scope), len(go_scope), len(excl_cre), len(excl_go),
                len(rows_by_key), sum(len(v) for v in rows_by_key.values()),
                len(cre), len(go), len(tal), skipped, spell_skipped))
