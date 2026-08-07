"""gen domain: spellclick.

npc_spellclick_spells + their SourceType-18 conditions (Cata, neltharion) -> AC.
The whole npc_spellclick_spells table and its 414 spellclick conditions were dropped
in the original goblin-zone import (I-234): the "use item ability on an NPC to get
quest credit" mechanic (e.g. Kezan quest 14069 "Good Help is Hard to Find", where
you shock a Defiant Troll 34830 with the Goblin All-In-1-Der Belt, spell 66306) had
its SmartAI ported but no spellclick to trigger it.

Emits, per zone (ctx.sfx), for creatures that spawn in the zone and whose spellclick
spell is present in the live 3.3.5a DBC (spells absent from 3.3.5a are skipped, exactly
like trainers.py — a click that casts a nonexistent spell is broken):

  sql/  spellclick  (npc_spellclick_spells rows + SourceType-18 conditions)

The conditions gate each click on its quest being in the player's log (ConditionType 9
= CONDITION_QUESTTAKEN), so a click is only offered to players actually on the quest.
"""
import os
import importlib.util

NAME = "spellclick"
TABLES = ["npc_spellclick_spells", "conditions"]
TIER = "base"

ZONE = {"": "4720", "_K": "4737"}   # Lost Isles / Kezan (matches creatures.py)


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

_COND_COLS = ("SourceTypeOrReferenceId", "SourceGroup", "SourceEntry", "SourceId",
              "ElseGroup", "ConditionTypeOrReference", "ConditionTarget",
              "ConditionValue1", "ConditionValue2", "ConditionValue3",
              "NegativeCondition", "ErrorType", "ErrorTextId", "ScriptName", "Comment")


NPC_CLICK_CAST_CASTER_CLICKER = 0x01
NPC_CLICK_CAST_TARGET_CLICKER = 0x02


def _fix_clicker_selfcast(ctx, clicks):
    """Stop a click from stamping the creature's own ambient aura onto the player.

    I-318. `cast_flags` is copied verbatim from the donor, and the donor sets
    NPC_CLICK_CAST_CASTER_CLICKER (0x1) on clicks whose spell is the very aura the
    creature already carries from `creature_template_addon`. AC then resolves
    caster=clicker, and since these spells apply their aura to
    TARGET_UNIT_CASTER (1), the aura lands on the PLAYER instead of the creature:

        Unit* caster = (castFlags & NPC_CLICK_CAST_CASTER_CLICKER) ? clicker : this;

    Both known cases are permanent (duration index 21) "Loot FX" sparkles — the
    interactable shimmer — so a player who clicked one wore it forever, saved
    across logout in `character_aura`. Found on Cluster Cluck's Wild Clucker
    (38111 / 66727); the same shape sits on Irresistible Pool Pony
    (38412, 44578-44580 / 83142), which only became visible once spellvisuals.py
    started emitting the visuals these auras carry.

    The test is deliberately narrow and target-agnostic: the creature ALREADY has
    this exact aura at spawn, so the click's cast is redundant no matter who it
    targets, and dropping the caster bit cannot lose behaviour. Clicks whose spell
    the creature does not carry are untouched — that leaves the phase clicks
    (37945/38430 -> 70766 Dream State, aura 261) and stock 24418 Flying Machine
    Controls exactly as the donor has them. Rows that explicitly aim at the player
    (TARGET_CLICKER) are also left alone: there the author meant the clicker.
    """
    addon = getattr(ctx.col, "_spellclick_addon_auras", None)
    if addon is None:
        addon = ctx.col._spellclick_addon_auras = {}
        for r in ctx.q("SELECT entry, auras FROM creature_template_addon"):
            try:
                entry = int(str(r["entry"]).strip())
            except (TypeError, ValueError):
                continue
            ids = set()
            for tok in str(r["auras"] or "").split():
                try:
                    ids.add(int(tok))
                except ValueError:
                    pass
            if ids:
                addon[entry] = ids

    out, fixed = [], []
    for npc, spell, cf, ut in clicks:
        if (cf & NPC_CLICK_CAST_CASTER_CLICKER
                and not cf & NPC_CLICK_CAST_TARGET_CLICKER
                and spell in addon.get(npc, ())):
            cf &= ~NPC_CLICK_CAST_CASTER_CLICKER
            fixed.append((npc, spell))
        out.append((npc, spell, cf, ut))
    return out, fixed


def emit(ctx):
    sfx = ctx.sfx
    zone = ZONE[sfx]
    # live DBC (catches [I-xxx] clones like 66306) UNION the ported Cata spell set
    # — a spell generated this very run isn't applied to live yet, and its click
    # row must not silently drop on a fresh regen (I-242: 34840/66392).
    # I-274: that set is now derived + validated by _spellscope rather than read
    # from the hand-curated missing_spells fixture (which it still folds in), so
    # it can only be a superset of the old behaviour.
    present = ctx.dbc_spell_ids() | _sibling("_spellscope").ported(ctx)

    zone_ids = {int(r["id"]) for r in
                ctx.q("SELECT DISTINCT TRIM(id) AS id FROM creature WHERE TRIM(zone)=%s"
                      " AND CAST(TRIM(id) AS SIGNED) < 1000000", (zone,))}  # no dev/leet NPCs (I-233)
    if not sfx:
        # Summon-only creatures (I-242 Hot Rod 34840) have no spawn row but still
        # carry spellclicks (e.g. 66392 ride-vehicle); once per run, like creatures.py.
        zone_ids |= set(_sibling("_summons").summoned_entries(ctx))
    # Hand-placed spawns (manual_spawns fixture, I-246): fixture creatures join the
    # sweep like spawned ones — the Bilgewater Buccaneer 37179 carries the 70016
    # ride-vehicle spellclick that boards the shredder for quest 24502.
    zone_ids |= _sibling("_manual").manual_entries(ctx)

    clicks, skipped = [], 0
    for r in ctx.q("SELECT npc_entry,spell_id,cast_flags,user_type FROM npc_spellclick_spells"):
        npc, spell = int(r["npc_entry"]), int(r["spell_id"])
        if npc not in zone_ids:
            continue
        if spell not in present:
            skipped += 1                     # spell absent from 3.3.5a DBC -> click would be broken
            continue
        clicks.append((npc, spell, int(r["cast_flags"] or 0), int(r["user_type"] or 0)))
    clicks.sort()
    clicks, selfcast_fixed = _fix_clicker_selfcast(ctx, clicks)
    npcs = sorted({c[0] for c in clicks})

    conds = []
    if npcs:
        ph = ",".join(["%s"] * len(npcs))
        rows = ctx.q("SELECT * FROM conditions WHERE SourceTypeOrReferenceId=18 "
                     "AND SourceGroup IN (%s) ORDER BY SourceGroup,ElseGroup,ConditionValue1" % ph, npcs)
        for r in rows:
            conds.append(tuple(r[c] for c in _COND_COLS))

    nlist = ",".join(str(n) for n in npcs) or "0"
    ctx.col.delete("npc_spellclick_spells", "npc_entry IN (%s)" % nlist)
    for npc, spell, cf, ut in clicks:
        ctx.col.add("npc_spellclick_spells", {
            "npc_entry": npc, "spell_id": spell, "cast_flags": cf, "user_type": ut,
        })
    ctx.col.delete("conditions",
                   "SourceTypeOrReferenceId=18 AND SourceGroup IN (%s)" % nlist)
    for c in conds:
        row = {}
        for col, v in zip(_COND_COLS, c):
            if col in ("ScriptName", "Comment"):
                row[col] = (v or "").strip()     # source stores ' ' -> ''
            else:
                row[col] = int(v or 0)
        ctx.col.add("conditions", row)
    out = "spellclick npcs=%d conditions=%d skipped=%d" % (len(clicks), len(conds), skipped)
    if selfcast_fixed:
        out += "; caster-clicker bit cleared on %d self-cast ambient aura click(s) (I-318): %s" % (
            len(selfcast_fixed),
            ", ".join("%d/%d" % (n, s) for n, s in selfcast_fixed))
    return out
