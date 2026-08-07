"""gen domain: spells.

Port the Cata spells the F-011 port needs from the extracted Whitemane 4.3.4
DBCs into the 3.3.5a `spell` table. Assembles Spell.dbc (48-field) + SpellEffect
(by SpellID) + sub-tables (by ref ID). Cast/duration/range pass the real Cata
index through when stock 3.3.5a has that row (shared tables), else fall back to
safe defaults; name/desc/effects/school are real. Ported from
Scripts/Goblin Zone Port/build_spells.py.

Rows feed the collector's `spell` table (one file, zone-independent set).

SCOPE IS DERIVED, NOT CURATED (I-274). The set comes from _spellscope.required()
— every spell the port actually references (SmartAI cast/aura actions, spellclick
rows, quest RequiredSpellCast objectives) plus the transitive closure over
effect_trigger_spell — validated against the four ceilings the core ASSERTs on in
SpellMgr::LoadSpellInfoCustomAttributes. The `missing_spells` fixture is now just
an explicit ADDITIONS list folded into that derivation.

The old behaviour was to port only the fixture's hand-listed ids, which meant a
spell reached solely from SmartAI was never ported and smartai.py then silently
dropped the row referencing it — killing quest credit chains with no error
anywhere (I-274). The earlier wide-port attempt (I-230) crashed at boot because
this emitter copied Effect / ApplyAuraName / TargetA / TargetB straight through
unchecked while carefully guarding cast/duration/range; _spellscope now applies
the checks it was missing, per effect, so a Cata-only aura on one effect no
longer costs the whole spell.

Emitted on the LAST (_K) pass: the derived scope needs both zones' templates
collected before the reference walk can see them.
"""
import os
import struct
import importlib.util

NAME = "spells"
TABLES = ["spell", "conditions", "spell_target_position"]
TIER = "base"


def _scope():
    """Load the shared derived-spell-scope helper (single source of truth)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_spellscope.py")
    spec = importlib.util.spec_from_file_location("goblin_gen__spellscope", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

# conditions column order (mirrors spellclick.py's type-18 port)
_COND_COLS = ("SourceTypeOrReferenceId", "SourceGroup", "SourceEntry", "SourceId",
              "ElseGroup", "ConditionTypeOrReference", "ConditionTarget",
              "ConditionValue1", "ConditionValue2", "ConditionValue3",
              "NegativeCondition", "ErrorType", "ErrorTextId", "ScriptName", "Comment")

# I-277: source type-13 anchors that point at something not present where the
# spell is actually cast here. These are NOT cosmetic: implicit target 46
# TARGET_DEST_NEARBY_ENTRY picks the effect's destination by searching for the
# nearest object matching this condition (Spell.cpp:1161 SearchNearbyTarget),
# and the condition's ConditionValue1 is what narrows the grid searcher at all
# (ConditionMgr.cpp:712). A wrong anchor is a hard miss -> no destination -> the
# effect does nothing.
# Keyed (SourceEntry, SourceGroup) -> (ConditionValue1, ConditionValue2), where
# ConditionValue1 is a TypeID: 3 = TYPEID_UNIT, 5 = TYPEID_GAMEOBJECT.
COND_TARGET_OVERRIDE = {
    # 66137 "Goblin Escape Pods: Summon Live Goblin Survivor" (GO 195188's
    # goober.spellId, see gameobjects.DATA_OVERRIDE). Neltharion anchors it to
    # their own scaffolding creature 75044 "Wondi's Bunny - Generic Nearby
    # Target 1", which has exactly ONE spawn in the whole DB — in Kezan, ~2000
    # yards from the pod field — so the search finds nothing and the summon
    # never lands. Anchor it to the pod instead: GO 195188 is by definition
    # within range, because casting this spell IS using that GO, and the
    # spell's range_index 7 (10 yd) comfortably covers the ~5.5 yd interaction
    # distance. Also puts the survivor at the pod rather than on the swimming
    # player. Same shape as the port's existing GO anchor 13/1/67682 -> 195489.
    (66137, 1): (5, 195188),
}

# I-277: per-spell overrides of emitted effect columns, applied last.
#
# Background — the port has a SYSTEMATIC off-by-one in every effect value. The
# two DBC generations encode "value" differently:
#   3.3.5a: value = BasePoints + rand(1, DieSides); DieSides is 1 on 29k of 44k
#           stock rows, so "value 1" is stored as BasePoints 0, DieSides 1.
#   4.3.4:  BasePoints already IS the value; DieSides is 0 on ~90% of rows.
# The emit path forces `effect_die_sides = max(e[9], 1)` (line ~212) so the
# client's $s tooltip token renders — but does not decrement BasePoints to
# compensate, so AC's SpellEffectInfo::CalcValue (SpellInfo.cpp:435, `case 1:
# basePoints += 1`) computes value+1 for every ported spell whose source
# DieSides was 0. On a damage effect that is an invisible 1-point drift; here it
# is not. Fixing it globally would move several hundred ported spells at once
# and belongs in its own issue — this table corrects only where it changes
# behaviour.
EFFECT_OVERRIDE = {
    # 66137 summons with SummonProperties 64, and 64 is on AC's multi-summon
    # list (SpellEffects.cpp:2402), so `numSummons = damage`. Source BasePoints
    # 1 / DieSides 0 = one survivor; emitted as 1/1 it calculates to 2, which
    # would pop two Goblin Survivors out of every pod and hand out two quest
    # credits per click — finishing 14474 in 3 pods instead of 6. Store the
    # 3.3.5a encoding of "1": BasePoints 0 with the forced DieSides 1.
    66137: {"effect_base_points_1": 0},

    # 71091 "It's A Town-In-A-Box: Town-In-A-Box Plunger - Effect 2" (I-315).
    # Effect 0 is 140 FORCE_CAST -> 68750 "Quest Phase 05", whose only effect is
    # aura 261 SPELL_AURA_PHASE with MiscValue 2048 and DurationIndex 21 (-1,
    # permanent). Dropped, because phasing here is F-194's job, not a spell's:
    # phase_definitions zone 4720 entry 5 is phaseMask 2048 gated on condition 28
    # QUEST_COMPLETE of 14245, so PhaseMgr flips the player into the finished
    # town the moment the plunger's kill credit lands — 3s BEFORE this aura would
    # even be cast. Keeping it would be strictly harmful: AC's HandlePhase does a
    # raw `player->SetPhaseMask(GetPhaseByAuras(), false)`
    # (SpellAuraEffects.cpp:1946) with no PhaseMgr involvement, so a permanent
    # 2048 aura outlives the quest and re-forces that mask, out of sync with
    # every later quest's phase, on any subsequent aura apply/remove.
    # Effect 1 is the periodic that lands the 70988 parachute — kept, amplitude
    # 5500 -> 4000 so the chute deploys at 68935's 3000ms tick + 4000 = 7.0s,
    # comfortably before the 8.82s unassisted touchdown (EffectKnockBack,
    # SpellEffects.cpp:5052: speedz = damage * 0.1, damage = BasePoints 850 +
    # forced DieSides 1 = 851 -> 85.1 yd/s -> apex 4.41s, flight 2x that).
    #
    # CAUTION — this retiming did NOT fix anything on its own, and the theory
    # behind it was wrong. The chute was dying to a mid-air interrupt, not to a
    # thin margin; moving it earlier gave the player MORE unprotected height and
    # turned survivable damage into a death. The real fix is on 70988 below.
    # 4000 is kept only because, with the strip gone, an earlier deploy slows
    # more of the descent. Do not retime this again to chase a landing bug.
    #
    # Must stay ABOVE half of 71091's own duration (index 32 = 6000ms) or the
    # aura ticks twice and re-casts the chute; 4000 gives exactly one tick.
    71091: {"effect_1": 0, "effect_trigger_spell_1": 0, "effect_implicit_target_a_1": 0,
            "effect_amplitude_2": 4000},

    # 70988 "Parachute" — the chute the above lands (I-315). Two changes, both to
    # stop a MID-AIR strip; neither is a retiming (retiming was the wrong theory
    # and made it worse — see below).
    #
    # `aura_interrupt_flags` 0x02020000 -> 0x00020000: drop
    # AURA_INTERRUPT_FLAG_LANDING (0x02000000), keep MOUNT. The client sends a
    # spurious MSG_MOVE_FALL_LAND about a second after slow-fall engages while
    # still airborne, and `WorldSession::ProcessMovementInfo` strips every
    # LANDING aura on that opcode (MovementHandler.cpp:628, comment: "interrupt
    # parachutes upon falling or landing in water"). The chute died ~1s after
    # deploy, the player free-fell the rest unprotected, and
    # AuraEffect::HandleFeatherFall's removal branch re-baselines m_lastFallZ to
    # the strip altitude — so the damage roll at the REAL landing saw the whole
    # remaining drop.
    #
    # PROOF the strip is deploy-relative, not landing-relative: moving the
    # deploy 1.5s EARLIER (amplitude 5500 -> 4000) made it strictly WORSE —
    # survivable damage became a death. Landing-relative removal would have made
    # an earlier chute safer; deploy-relative (+1s) removal leaves more unspent
    # height every time you deploy sooner. Do not "fix" this by retiming again.
    #
    # With LANDING gone the aura survives to touchdown, and Player::HandleFall's
    # !HasFeatherFallAura() gate (Player.cpp:14079) then zeroes the damage
    # outright. Nothing else can reach it: interrupt flags are the only removal
    # path here, dispel/steal do not apply, and the source duration is infinite.
    #
    # `duration_index` 21 -> 575: 21 is -1 (permanent), which was survivable only
    # because LANDING used to clean it up. Without that it would be a forever
    # aura, so it has to be bounded by duration instead — expiry is now the ONLY
    # thing that ends the chute, which makes this a real tuning parameter.
    #
    # Deliberately timed to expire JUST ABOVE THE GROUND, not to outlast the
    # descent. That is safe because of two things acting together:
    #   - AuraEffect::HandleFeatherFall's removal branch calls SetFallInformation,
    #     re-baselining m_lastFallZ to the altitude at expiry — so the fall that
    #     gets billed is only the drop remaining AFTER the chute ends, never the
    #     whole plunge.
    #   - Player.cpp:14066 MIN_FALL_DMG_DIST = 13.48f is a hard cutoff, not a
    #     taper: under 13.48 yards the entire damage block is skipped (:14078).
    # So expiring a short way up costs literally nothing, and clears the aura
    # before the player is standing around with a parachute on.
    #
    # Sized from measurement, not theory — the client's slow-fall rate is in no
    # data we hold. Tester at 25000ms reported a 7s tail, putting the slowed
    # descent from the 7.0s deploy at ~18s. Remaining height there is ~123yd
    # (apex 187.7yd at 4.41s, less 64.7yd fallen by 7.0s), so slow-fall is
    # ~6.8 yd/s and the 13.48yd threshold is crossed ~2.0s before touchdown.
    # Safe band is therefore ~16000-18000ms; index 575 = 17000ms sits mid-band,
    # expiring ~1s up (~6.8yd, about half the threshold).
    #
    # The old danger is gone but the band is narrow, so if the knockback
    # (68935 BasePoints 850) or the deploy time (71091 amplitude) ever changes,
    # RE-MEASURE the tail and re-derive — do not scale this number. Erring long
    # costs a cosmetic tail; erring short only costs a small damage chip now
    # (~12% at 3s early), no longer a death.
    70988: {"aura_interrupt_flags": 0x00020000, "duration_index": 575},
}

# columns that are `int unsigned` and hold high-bit masks -> convert signed read to unsigned
UMASK = {"attributes", "attributes_ex_1", "attributes_ex_2", "attributes_ex_3", "attributes_ex_4",
         "attributes_ex_5", "attributes_ex_6", "attributes_ex_7", "school_mask", "targets", "stances",
         "aura_interrupt_flags", "channel_interrupt_flags", "interrupt_flags", "proc_flags",
         "effect_spell_class_mask_a_1", "effect_spell_class_mask_a_2", "effect_spell_class_mask_a_3",
         "effect_spell_class_mask_b_1", "effect_spell_class_mask_b_2", "effect_spell_class_mask_b_3",
         "effect_spell_class_mask_c_1", "effect_spell_class_mask_c_2", "effect_spell_class_mask_c_3"}

# Spell.dbc field indices (4.3.4 layout)
F = dict(cast=12, dur=13, power=14, rng=15, speed=16, vis=17, icon=19, active=20,
         name=21, desc=23, school=25, categories=35, classopt=36, cooldowns=37,
         equipped=39, interrupts=40, levels=41, targetres=45, auraopt=32)


def _rd(path):
    """Open a WDBC and return (bytes, field_count, record_size, str_reader, row_iter).

    row_iter yields (signed int32 field list, record byte offset) — signed to match
    the original build_spells.py reader (UMASK reconverts masks to unsigned at write).
    """
    d = open(path, "rb").read()
    rc, fc, rs, ss = struct.unpack("<4I", d[4:20])
    sb = 20 + rc * rs

    def s(o):
        e = d.index(b"\0", sb + o)
        return d[sb + o:e].decode("latin1")

    def rows():
        for i in range(rc):
            b = 20 + i * rs
            yield [struct.unpack_from("<i", d, b + f2 * 4)[0] for f2 in range(fc)], b

    return d, fc, rs, s, rows


def emit(ctx):
    if not ctx.sfx:
        return "deferred (derived scope needs both zones' templates; emitted on the _K pass)"
    scope = _scope()
    port_map, dropped_effects, rejected = scope.analyse(ctx)
    missing = set(port_map)

    # Cast/duration/range index tables are shared WotLK<->Cata; pass the REAL Cata
    # index through whenever stock 3.3.5a has that row, so e.g. a ride-vehicle aura
    # keeps its permanent duration (index 21) instead of expiring instantly under
    # the old blanket duration_index=0 default (I-242). Unknown indexes still fall
    # back to the safe defaults (cast 1 / duration 0 / range 13).
    stock_cast = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spellcasttimes")}
    stock_dur = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spellduration")}
    stock_rng = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spellrange")}

    # Cata item id -> custom AC item id (for CREATE_ITEM EffectItemType, I-261)
    iremap = {int(k): v for k, v in ctx.fixture("item_remap").items()}

    # Spell.dbc (48 fields) index by ID -> row + string reader
    ds, fcs, rss, ss, rowss = _rd(ctx.whitemane_dbc("Spell.dbc"))
    spell = {}
    for row, b in rowss():
        if row[0] in missing:
            spell[row[0]] = (row, b)

    # SpellEffect grouped by SpellID (@24), EffectIndex (@25)
    _, _, _, _, rowse = _rd(ctx.whitemane_dbc("SpellEffect.dbc"))
    effects = {}
    for row, b in rowse():
        sid = row[24]
        if sid in missing:
            effects.setdefault(sid, {})[row[25]] = row

    def load_by_id(fn):
        _, _, _, _, rw = _rd(ctx.whitemane_dbc(fn))
        m = {}
        for row, b in rw():
            m[row[0]] = row
        return m

    cooldowns = load_by_id("SpellCooldowns.dbc")
    categories = load_by_id("SpellCategories.dbc")
    classopt = load_by_id("SpellClassOptions.dbc")
    equipped = load_by_id("SpellEquippedItems.dbc")
    interrupts = load_by_id("SpellInterrupts.dbc")
    targetres = load_by_id("SpellTargetRestrictions.dbc")
    levels = load_by_id("SpellLevels.dbc")

    sql_rows = []
    for sid in sorted(spell):
        row, b = spell[sid]
        name = ss(struct.unpack_from("<I", ds, b + F['name'] * 4)[0])
        desc = ss(struct.unpack_from("<I", ds, b + F['desc'] * 4)[0])
        c = {"id": sid,
             "attributes": row[1], "attributes_ex_1": row[2], "attributes_ex_2": row[3],
             "attributes_ex_3": row[4], "attributes_ex_4": row[5], "attributes_ex_5": row[6],
             "attributes_ex_6": row[7], "attributes_ex_7": row[8],
             "cast_time_index": row[F['cast']] if row[F['cast']] in stock_cast else 1,
             "duration_index": row[F['dur']] if row[F['dur']] in stock_dur else 0,
             "range_index": row[F['rng']] if row[F['rng']] in stock_rng else 13,
             "power_type": row[F['power']], "speed": struct.unpack_from("<f", ds, b + F['speed'] * 4)[0],
             "spell_visual_1": row[F['vis']], "spell_icon_id": row[F['icon']], "active_icon_id": row[F['active']],
             "school_mask": row[F['school']],
             "spell_name_enus": name, "spell_desc_enus": desc,
             "spell_level": 0, "base_level": 0, "max_level": 0,
             "proc_chance": 101, "equipped_item_class": -1, "damage_class": 1}
        cat = categories.get(row[F['categories']])
        if cat:
            c["category"] = cat[1]; c["damage_class"] = cat[2]; c["dispel"] = cat[3]; c["mechanic"] = cat[4]; c["prevention_type"] = cat[5]
        cd = cooldowns.get(row[F['cooldowns']])
        if cd:
            c["category_recovery_time"] = cd[1]; c["recovery_time"] = cd[2]; c["start_recovery_time"] = cd[3]
        co = classopt.get(row[F['classopt']])
        if co:
            c["spell_class_set"] = co[5]; c["spell_class_mask_1"] = co[2]; c["spell_class_mask_2"] = co[3]; c["spell_class_mask_3"] = co[4]
        eq = equipped.get(row[F['equipped']])
        if eq:
            c["equipped_item_class"] = eq[1]; c["equipped_item_inventorytype_mask"] = eq[2]; c["equipped_item_subclass_mask"] = eq[3]
        # SpellInterrupts: AuraInterruptFlags@1-2, ChannelInterruptFlags@3-4,
        # InterruptFlags@5. 4.3.4 widened the aura/channel masks to TWO dwords;
        # 3.3.5a has one, so only the low dword ports and the Cata-only high
        # dword (@2/@4) is dropped. Verified against stock 3.3.5a on the 15,055
        # spells present in both builds: @1 matches aura_interrupt_flags on
        # 95.8%, @3 matches channel on 99.9%, @5 matches interrupt on 99.6% —
        # the remainder are real Blizzard changes between the two builds.
        #
        # I-315: this table was loaded and then never read, so every ported
        # spell shipped with all three masks at the column default 0 — i.e. an
        # aura that should break on movement/landing/mount never broke at all.
        # Found via 70988 "Parachute" (SpellInterrupts 16090 = 0x02020000,
        # LANDING|MOUNT, both bits identical in 3.3.5a): DurationIndex 21 makes
        # it permanent and LANDING is the ONLY thing that ends it, so the
        # town-in-a-box plunger would have left the player in feather fall for
        # the rest of the session. 57 of the 282 currently ported spells carry
        # an interrupts row; 35 gain aura, 12 channel, 22 interrupt flags.
        it = interrupts.get(row[F['interrupts']])
        if it:
            c["aura_interrupt_flags"] = it[1]; c["channel_interrupt_flags"] = it[3]; c["interrupt_flags"] = it[5]
        tr = targetres.get(row[F['targetres']])
        if tr:
            c["max_affected_targets"] = tr[2]; c["maximum_target_level"] = tr[3]; c["target_creature_type"] = tr[4]; c["targets"] = tr[5]
        lv = levels.get(row[F['levels']])
        if lv:
            c["base_level"] = lv[1]; c["max_level"] = lv[2]; c["spell_level"] = lv[3]
        # effects (up to 3) — SpellEffect: Effect@1, EffectAura@3, AuraPeriod@4, BasePoints@5,
        #   DieSides@9, ItemType@10, Mechanic@11, MiscA@12, MiscB@13, RadiusIndex@15,
        #   RealPointsPerLevel(float)@17, ClassMask@18-20, Trigger@21, TargetA@22, TargetB@23
        #   (I-246: trigger/classmask were read one field early — @17-19/@20 — silently
        #   zeroing every ported trigger spell)
        for idx in range(3):
            e = effects.get(sid, {}).get(idx)
            n = idx + 1
            # I-274: emit only effects 3.3.5a can represent. An effect carrying a
            # Cata-only aura/target/effect id would trip the SpellInfo load ASSERT
            # and take the worldserver down at boot, so it is left zeroed rather
            # than costing us the whole spell.
            if e and idx in port_map.get(sid, set()):
                c["effect_%d" % n] = e[1]; c["effect_apply_aura_name_%d" % n] = e[3]; c["effect_amplitude_%d" % n] = e[4]
                c["effect_base_points_%d" % n] = e[5]; c["effect_die_sides_%d" % n] = max(e[9], 1)
                # EffectItemType was never ported (I-261: 67492 'Vault Cracked!'
                # created nothing); CREATE_ITEM item ids are Cata ids -> remap.
                c["effect_item_type_%d" % n] = iremap.get(e[10], e[10]) if e[10] else 0
                c["effect_mechanic_%d" % n] = e[11]; c["effect_misc_value_a_%d" % n] = e[12]; c["effect_misc_value_b_%d" % n] = e[13]
                # 4.3.4 splits the radius into min+max index and often leaves the MIN
                # one 0; 3.3.5a has a single index, and 0 = no SpellRadius row = a
                # 0-yard area search that silently hits nothing (I-287).
                c["effect_radius_index_%d" % n] = scope.radius_index(e)
                c["effect_trigger_spell_%d" % n] = e[21]
                c["effect_implicit_target_a_%d" % n] = e[22]; c["effect_implicit_target_b_%d" % n] = e[23]
                c["effect_real_points_per_level_%d" % n] = struct.unpack("<f", struct.pack("<I", e[17] & 0xFFFFFFFF))[0]
                c["effect_spell_class_mask_a_%d" % n] = e[18]; c["effect_spell_class_mask_b_%d" % n] = e[19]; c["effect_spell_class_mask_c_%d" % n] = e[20]
        sql_rows.append((sid, name, c))

    for sid, name, c in sql_rows:
        c = {k: (v & 0xFFFFFFFF if (k in UMASK and isinstance(v, int) and v < 0) else v) for k, v in c.items()}
        c.update(EFFECT_OVERRIDE.get(sid, {}))
        ctx.col.put("spell", sid, c, tier="base", owner="spells", note="%d %s" % (sid, name))

    # world-side: SourceType-13 (SPELL_IMPLICIT_TARGET) conditions of the ported spells.
    # A TARGET_UNIT_*_AREA_ENTRY effect selects NOTHING without its entry condition —
    # e.g. 69993 footbomb impact needs 13/1/69993 -> creature 37114 Steamwheedle Shark
    # or the throw never hits (I-246).
    sin = ",".join(str(s) for s in sorted(missing))
    crows = ctx.q("SELECT * FROM conditions WHERE SourceTypeOrReferenceId=13 "
                  "AND SourceEntry IN (%s) ORDER BY SourceEntry,SourceGroup,ElseGroup" % sin)
    ctx.col.delete("conditions", "SourceTypeOrReferenceId=13 AND SourceEntry IN (%s)" % sin)
    for r in crows:
        row = {}
        for col in _COND_COLS:
            v = r[col]
            if col in ("ScriptName", "Comment"):
                row[col] = (v or "").strip()     # source stores ' ' -> ''
            else:
                row[col] = int(v or 0)
        ov = COND_TARGET_OVERRIDE.get((row["SourceEntry"], row["SourceGroup"]))
        if ov:
            row["ConditionValue1"], row["ConditionValue2"] = ov
        ctx.col.add("conditions", row)

    # world-side: TARGET_DEST_DB destinations (I-275). Effects using implicit target
    # 17 read where to put the caster from `spell_target_position`; without the row
    # the spell fires him nowhere. _spellscope rejects any spell whose only usable
    # effects need a destination it cannot resolve, so every id reaching here has one.
    dests = scope.dest_positions(ctx)
    dest_rows = []
    for sid in sorted(port_map):
        for idx in sorted(port_map[sid]):
            e = effects.get(sid, {}).get(idx)
            if not e or scope.TARGET_DEST_DB not in (e[22], e[23]):
                continue
            d = dests.get(sid, {}).get(idx)
            if d:
                dest_rows.append(dict(ID=sid, EffectIndex=idx, **d))
    if dest_rows:
        ctx.col.delete("spell_target_position",
                       "ID IN (%s)" % ",".join(str(s) for s in sorted({r["ID"] for r in dest_rows})))
        for r in dest_rows:
            ctx.col.add("spell_target_position", r, sort_key=(r["ID"], r["EffectIndex"]))

    # --- report (I-274) -------------------------------------------------------
    # A spell the port needs but cannot have is a broken quest waiting to be
    # found. Print every refusal with its reason and the reference site that
    # wanted it — never a bare counter.
    reasons = scope.required(ctx)
    out = ["spells=%d target_conditions=%d dest_positions=%d"
           % (len(sql_rows), len(crows), len(dest_rows))]
    if dropped_effects:
        out.append("  %d spell(s) ship with an effect omitted (unrepresentable in 3.3.5a):"
                   % len(dropped_effects))
        for sid in sorted(dropped_effects):
            for idx in sorted(dropped_effects[sid]):
                out.append("    spell %d effect %d: %s"
                           % (sid, idx + 1, "; ".join(dropped_effects[sid][idx])))
    if rejected:
        out.append("  %d spell(s) REJECTED — anything referencing these stays broken:"
                   % len(rejected))
        for sid in sorted(rejected):
            why = "; ".join(rejected[sid])
            wanted = ", ".join(sorted(reasons.get(sid, ()))[:3]) or "unknown"
            out.append("    spell %d: %s  [wanted by: %s]" % (sid, why, wanted))
    unc = scope.uncovered(ctx)
    if unc:
        out.append("  note: %d creature ability spell(s) referenced by "
                   "creature_template_spell are not walked by the reference derivation "
                   "yet (see _spellscope.uncovered)." % len(unc))
    return "\n".join(out)
