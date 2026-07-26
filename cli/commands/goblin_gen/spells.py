"""gen domain: spells.

Port the Cata-new quest-item spells (missing_spells fixture) from the extracted
Whitemane 4.3.4 DBCs into the 3.3.5a `spell` table. Assembles Spell.dbc (48-field)
+ SpellEffect (by SpellID) + sub-tables (by ref ID). Cast/duration/range pass the
real Cata index through when stock 3.3.5a has that row (shared tables), else fall
back to safe defaults; name/desc/effects/school are real. Ported from
Scripts/Goblin Zone Port/build_spells.py.

Rows feed the collector's `spell` table (one file, zone-independent set).

NOTE: an earlier attempt to also port creature *ability* spells was reverted (boot
crash at SpellInfo load, I-230); this emitter only ports the quest-item spells in
the missing_spells fixture, reproducing the current committed base state.
"""
import struct

NAME = "spells"
TABLES = ["spell", "conditions"]
TIER = "base"

# conditions column order (mirrors spellclick.py's type-18 port)
_COND_COLS = ("SourceTypeOrReferenceId", "SourceGroup", "SourceEntry", "SourceId",
              "ElseGroup", "ConditionTypeOrReference", "ConditionTarget",
              "ConditionValue1", "ConditionValue2", "ConditionValue3",
              "NegativeCondition", "ErrorType", "ErrorTextId", "ScriptName", "Comment")

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
    if ctx.sfx:
        return "skipped (zone-independent; emitted on Lost Isles pass)"
    missing = set(ctx.fixture("missing_spells"))

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
            if e:
                c["effect_%d" % n] = e[1]; c["effect_apply_aura_name_%d" % n] = e[3]; c["effect_amplitude_%d" % n] = e[4]
                c["effect_base_points_%d" % n] = e[5]; c["effect_die_sides_%d" % n] = max(e[9], 1)
                # EffectItemType was never ported (I-261: 67492 'Vault Cracked!'
                # created nothing); CREATE_ITEM item ids are Cata ids -> remap.
                c["effect_item_type_%d" % n] = iremap.get(e[10], e[10]) if e[10] else 0
                c["effect_mechanic_%d" % n] = e[11]; c["effect_misc_value_a_%d" % n] = e[12]; c["effect_misc_value_b_%d" % n] = e[13]
                c["effect_radius_index_%d" % n] = e[15]; c["effect_trigger_spell_%d" % n] = e[21]
                c["effect_implicit_target_a_%d" % n] = e[22]; c["effect_implicit_target_b_%d" % n] = e[23]
                c["effect_real_points_per_level_%d" % n] = struct.unpack("<f", struct.pack("<I", e[17] & 0xFFFFFFFF))[0]
                c["effect_spell_class_mask_a_%d" % n] = e[18]; c["effect_spell_class_mask_b_%d" % n] = e[19]; c["effect_spell_class_mask_c_%d" % n] = e[20]
        sql_rows.append((sid, name, c))

    for sid, name, c in sql_rows:
        c = {k: (v & 0xFFFFFFFF if (k in UMASK and isinstance(v, int) and v < 0) else v) for k, v in c.items()}
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
        ctx.col.add("conditions", row)
    return "spells=%d target_conditions=%d" % (len(sql_rows), len(crows))
