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

Also translates Cata-native "cast spell N on creature RequiredNpcOrGoN" quest
objectives (quest_template.RequiredSpellCastN — a mechanic 3.3.5a AC dropped)
into "on spellhit -> CALL_KILLEDMONSTER" rows, since without them those
objectives can never complete (I-247: the Kezan class quests).

Emitted as a SINGLE file on the LAST (_K) pass — the derived scope needs both
zones' templates collected first, so a partial --zone run raises instead of
emitting half coverage.
"""
import os
import importlib.util

NAME = "smartai"
TABLES = ["smart_scripts", "creature_template", "gameobject_template"]
TIER = "overlay"   # AIName overlays need the template base rows collected first


def _scope():
    """Load the shared derived-spell-scope helper (single source of truth)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_spellscope.py")
    spec = importlib.util.spec_from_file_location("goblin_gen__spellscope", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


# Scope constants live in _spellscope so this emitter and the spell port cannot
# disagree about which actions carry a spellId or where the 3.3.5a ceilings are
# (I-274 — they disagreed silently before, and quests paid for it).
_SCOPE = _scope()
MAX_EVENT, MAX_ACTION = _SCOPE.MAX_EVENT, _SCOPE.MAX_ACTION
SPELL_ACTION_TYPES = _SCOPE.SPELL_ACTION_TYPES
# Opcode numbering differs between the 4.3.4 source core and AC 3.3.5a — see the
# audit in _spellscope. Rows are imported verbatim apart from these.
ACTION_REMAP = _SCOPE.ACTION_REMAP
ACTION_DIVERGENT = _SCOPE.ACTION_DIVERGENT
EVENT_DIVERGENT = _SCOPE.EVENT_DIVERGENT

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
# Defined in _spellscope so the spell-reference walk follows the same closure.
TAL_CALL, TAL_RANDOM, TAL_RANGE = _SCOPE.TAL_CALL, _SCOPE.TAL_RANDOM, _SCOPE.TAL_RANGE
_tal_refs = _SCOPE.tal_refs


def emit(ctx):
    if not ctx.sfx:
        return "deferred (derived scope needs both zones' templates; emitted on the _K pass)"
    if not getattr(ctx.col, "gossip_menu_remap", None):
        raise RuntimeError("gossip menu remap not collected — smartai needs a full "
                           "--zone both run (gossip emits on the Lost Isles pass)")
    scope = _SCOPE
    excl = ctx.fixture("smartai_exclude")
    excl_cre, excl_go = set(excl.get("cre", [])), set(excl.get("go", []))
    cre_scope, go_scope = scope.sai_scope(ctx)
    # I-274: the spells the port emits count as present. Previously this was the
    # live DBC alone, so every Cata-only spell reached from SmartAI failed the
    # check and its row was dropped — including the head rows of quest credit
    # chains (quest 14125 "447" lost all four objectives this way).
    valid_spells = ctx.dbc_spell_ids() | scope.ported(ctx)
    iremap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    # gossip.py (base tier, same gen run via contributor closure) stashes its
    # source->510xxx menu renumbering here for event 62 params.
    menu_remap = getattr(ctx.col, "gossip_menu_remap", {})

    rows_by_key = {}
    skipped = 0
    spell_skipped = 0
    spell_drops = {}      # spellId -> [(source_type, entryorguid, row id)] (I-274)
    opcode_drops = []     # rows refused for a divergent source opcode (I-274)
    remapped = {}         # source action id -> count rewritten to AC's number

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
                # I-230: unported spell -> NULL SpellInfo crash on fire. This
                # emit-time filter is the ONLY guard now; the hand-authored
                # zz_[I-230]_smartai_strip_missing_cast_spells.sql override was
                # retired in I-274 — it was a frozen snapshot that had started
                # deleting 91 rows whose spells the derived port now ships.
                # I-274: record WHAT was dropped, not just how many. A dropped
                # row is often the head of a quest credit chain, and a bare
                # counter made that invisible for the whole life of the port.
                spell_skipped += 1
                spell_drops.setdefault(int(float(_val(r["action_param1"]))), []).append(
                    (source_type, entry, int(float(_val(r["id"])))))
                continue
            # I-274: opcode numbers are NOT identical across the two cores. An id
            # that means something else in AC must never be trusted through; one
            # that only moved gets rewritten to AC's number.
            if at in ACTION_DIVERGENT or et in EVENT_DIVERGENT:
                opcode_drops.append((source_type, entry, int(float(_val(r["id"]))),
                                     ACTION_DIVERGENT.get(at) or EVENT_DIVERGENT.get(et)))
                skipped += 1
                continue
            remap_refs(r, et, at)
            if at in ACTION_REMAP:
                r["action_type"] = ACTION_REMAP[at]
                remapped[at] = remapped.get(at, 0) + 1
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

    # --- RequiredSpellCast objectives -> spellhit credit rows (I-247) ---------
    # Cata quests carry native "cast spell N on creature RequiredNpcOrGoN"
    # objectives (RequiredSpellCastN); 3.3.5a AC has no such mechanic, so each
    # ported objective must be satisfied by an SAI credit row. Most source dummy
    # rows credit a bunny the quest does not require (all six Kezan class-quest
    # rows credit 44175, but only the mage quest requires it), so coverage is
    # checked per (spell, credit) pair:
    #   * covered — one row does both (mage), or the spellhit calls a timed
    #     actionlist that grants the credit (Cluster Cluck 24671);
    #   * spellhit exists but credits the wrong entry — append a credit row on
    #     each creature already granting credit for that spell (the five broken
    #     Kezan class quests);
    #   * no spellhit anywhere — emit one on the credit creature itself (cast
    #     target == credit entry, the common retail shape).
    def _num(v):
        return int(float(_val(v)))

    direct = set()        # (spell, credit) satisfied by a single imported row
    credit_hosts = {}     # spellId -> entries whose spellhit row grants SOME credit
    spellhit_tal = set()  # spellIds whose spellhit row calls a timed actionlist
    tal_credits = set()   # credits granted inside imported timed actionlists
    for (st, e), rws in rows_by_key.items():
        for r in rws:
            at = _num(r["action_type"])
            if st == 9 and at == 33:
                tal_credits.add(_num(r["action_param1"]))
            if st == 0 and _num(r["event_type"]) == 8:
                sp = _num(r["event_param1"])
                if at == 33:
                    credit_hosts.setdefault(sp, set()).add(e)
                    direct.add((sp, _num(r["action_param1"])))
                elif at in (TAL_CALL, TAL_RANDOM, TAL_RANGE):
                    spellhit_tal.add(sp)

    qids = sorted(set(ctx.fixture("item_scope").get("quests", []))
                  | set(ctx.fixture("item_scope_K").get("quests", [])))
    sc_cols = ", ".join("RequiredNpcOrGo%d, RequiredSpellCast%d" % (n, n) for n in (1, 2, 3, 4))
    sc_quests = ctx.q(
        "SELECT Id, Title, " + sc_cols + " FROM quest_template"
        " WHERE Id IN (%s)" % ",".join(str(int(q)) for q in qids) +
        " AND (RequiredSpellCast1<>0 OR RequiredSpellCast2<>0"
        " OR RequiredSpellCast3<>0 OR RequiredSpellCast4<>0)") if qids else []

    sc_covered, sc_added, sc_warns = 0, 0, []
    for q in sorted(sc_quests, key=lambda r: _num(r["Id"])):
        qid, qtitle = _num(q["Id"]), str(q["Title"] or "").strip()
        for n in (1, 2, 3, 4):
            spell = _num(q["RequiredSpellCast%d" % n])
            if not spell:
                continue
            cred = _num(q["RequiredNpcOrGo%d" % n])
            if cred <= 0:
                sc_warns.append("quest %d '%s': RequiredSpellCast%d=%d without a creature "
                                "credit (RequiredNpcOrGo%d=%d) — not translatable"
                                % (qid, qtitle, n, spell, n, cred))
                continue
            if (spell, cred) in direct or (spell in spellhit_tal and cred in tal_credits):
                sc_covered += 1
                continue
            if spell not in valid_spells:
                sc_warns.append("quest %d '%s': RequiredSpellCast%d spell %d not in the "
                                "3.3.5a DBC — objective stays broken" % (qid, qtitle, n, spell))
                continue
            for host in sorted(credit_hosts.get(spell, set())) or [cred]:
                if (0, host) not in rows_by_key and host not in cre_scope:
                    sc_warns.append("quest %d '%s': credit creature %d not in SAI scope"
                                    % (qid, qtitle, host))
                    continue
                rws = rows_by_key.setdefault((0, host), [])
                row = {c2: 0 for c2 in COLS}
                row.update({
                    "entryorguid": host, "source_type": 0,
                    "id": max((_num(r["id"]) for r in rws), default=-1) + 1,
                    "event_type": 8, "event_chance": 100, "event_param1": spell,
                    "action_type": 33, "action_param1": cred, "target_type": 7,
                    "comment": "F-011 - On Spell Hit %d - Quest %d Credit %d "
                               "(RequiredSpellCast port, I-247)" % (spell, qid, cred),
                })
                rws.append(row)
                direct.add((spell, cred))
                sc_added += 1

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

    # --- dropped-row report (I-274) ------------------------------------------
    # Two failure shapes a bare skip counter used to hide:
    #   * an entry that lost EVERY row -> an inert creature/GO (the three quest
    #     447 goobers);
    #   * a surviving SMART_EVENT_LINK (61) whose head row was dropped -> a
    #     chain that can never start, which is how the Gasbot control panel's
    #     gossip option became a no-op.
    drop_lines = []
    if remapped:
        drop_lines.append("  opcode remap (source -> AC): "
                          + ", ".join("%d->%d x%d" % (a, ACTION_REMAP[a], n)
                                      for a, n in sorted(remapped.items())))
    for (st, e, rid, why) in opcode_drops:
        drop_lines.append("    WARN %s %d row %d refused: divergent opcode — %s"
                          % ("GO" if st == 1 else "creature" if st == 0 else "actionlist",
                             e, rid, why))
    if spell_drops:
        dropped_entries = {}
        for sid, sites in spell_drops.items():
            for (st, e, _rid) in sites:
                dropped_entries.setdefault((st, e), set()).add(sid)
        lost_all = sorted(k for k in dropped_entries if k not in rows_by_key)
        orphan_links = []
        for (st, e), rws in sorted(rows_by_key.items()):
            if (st, e) not in dropped_entries:
                continue
            ids = {int(float(_val(r["id"]))) for r in rws}
            for r in rws:
                if int(float(_val(r["event_type"]))) == 61:
                    # a link row is only reachable if some surviving row links to it
                    rid = int(float(_val(r["id"])))
                    if not any(int(float(_val(o["link"]))) == rid for o in rws):
                        orphan_links.append((st, e, rid))
            del ids
        drop_lines.append("  %d row(s) dropped for %d unportable spell(s): %s"
                          % (spell_skipped, len(spell_drops),
                             ", ".join(str(s) for s in sorted(spell_drops))))
        for (st, e) in lost_all:
            drop_lines.append("    WARN %s %d lost ALL SmartAI (spell%s %s) — inert"
                              % ("GO" if st == 1 else "creature" if st == 0 else "actionlist",
                                 e, "s" if len(dropped_entries[(st, e)]) > 1 else "",
                                 ", ".join(str(s) for s in sorted(dropped_entries[(st, e)]))))
        for (st, e, rid) in orphan_links:
            drop_lines.append("    WARN %s %d row %d is a LINK with no surviving head — "
                              "chain cannot start"
                              % ("GO" if st == 1 else "creature", e, rid))

    return ("scope cre=%d go=%d (excluded cre=%d go=%d) -> blocks=%d rows=%d "
            "[cre=%d go=%d tal=%d] skipped(type)=%d skipped(spell)=%d "
            "spellcast: covered=%d added=%d%s%s" % (
                len(cre_scope), len(go_scope), len(excl_cre), len(excl_go),
                len(rows_by_key), sum(len(v) for v in rows_by_key.values()),
                len(cre), len(go), len(tal), skipped, spell_skipped,
                sc_covered, sc_added,
                "".join("\n" + line for line in drop_lines),
                "".join("\n  WARN " + w for w in sc_warns)))
