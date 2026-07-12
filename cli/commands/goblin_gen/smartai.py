"""gen domain: smartai.

F-011 scoped SmartAI import: bring over the source smart_scripts for quest-relevant
creatures/GOs (questgivers, enders, RequiredNpcOrGo targets) + their linked timed
action-lists (smartai_scope fixture). Sets AIName so the scripts run. Filters to
3.3.5a-valid event/action types, and drops cast/aura actions whose spell is absent
from the 3.3.5a DBC (I-230: NULL SpellInfo deref -> worldserver SIGSEGV on fire).
Creature/spell/quest refs are unchanged by the port so pass through as-is. Ported
from Scripts/Goblin Zone Port/import_smartai.py.

Emitted as a SINGLE non-SFX file (sql/zz_[AUTO,F-011]_smartai.sql) — scope is
zone-independent, matching the source script's single zz_[F-011]_smartai.sql.
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
SPELL_ACTION_TYPES = {11, 28, 75, 85, 118, 134}

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


def emit(ctx):
    if ctx.sfx:
        return "skipped (zone-independent scope; emitted on Lost Isles pass)"
    scope = ctx.fixture("smartai_scope")
    valid_spells = ctx.dbc_spell_ids()

    rows_by_key = {}
    skipped = 0
    spell_skipped = 0

    def fetch(source_type, entry):
        return ctx.q("SELECT * FROM smart_scripts WHERE source_type=%s AND entryorguid=%s ORDER BY id",
                     (source_type, entry))

    def collect(source_type, entry):
        nonlocal skipped, spell_skipped
        out = []
        for r in fetch(source_type, entry):
            et = int(float(_val(r["event_type"]))); at = int(float(_val(r["action_type"])))
            if et > MAX_EVENT or at > MAX_ACTION:
                skipped += 1; continue
            if at in SPELL_ACTION_TYPES and int(float(_val(r["action_param1"]))) not in valid_spells:
                spell_skipped += 1; continue   # I-230: unported spell -> NULL SpellInfo crash on fire
            out.append(r)
        if out:
            rows_by_key[(source_type, entry)] = out

    for e in scope["cre"]:
        collect(0, e)
    for e in scope["go"]:
        collect(1, e)
    for e in scope["tal"]:
        collect(9, e)

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
    return "blocks=%d rows=%d skipped(type)=%d skipped(spell)=%d cre=%d go=%d" % (
        len(rows_by_key), sum(len(v) for v in rows_by_key.values()), skipped, spell_skipped, len(cre), len(go))
