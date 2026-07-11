#!/usr/bin/env python3
"""
Port 31 Cata-new quest-item spells from Whitemane 4.3.4 DBCs -> 3.3.5a spell table.
Assembles Spell.dbc (48-field) + SpellEffect (by SpellID) + sub-tables (by ref ID).
Cast/duration/range use safe 3.3.5a defaults. Emits spell DBC INSERTs + item wiring.
"""
import struct, json, os
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
CS = os.path.join(SCRATCH, "cata_spell")

def rd(f):
    d = open(os.path.join(CS, f), "rb").read()
    rc, fc, rs, ss = struct.unpack("<4I", d[4:20]); sb = 20 + rc * rs
    def s(o):
        e = d.index(b"\0", sb + o); return d[sb + o:e].decode("latin1")
    def rows():
        for i in range(rc):
            b = 20 + i * rs
            yield [struct.unpack_from("<i", d, b + f2*4)[0] for f2 in range(fc)], b
    return d, fc, rs, s, rows

missing = set(json.load(open(os.path.join(SCRATCH, "missing_spells.json"))))

# Spell.dbc (48 fields) index by ID -> row + string reader
ds, fcs, rss, ss, rowss = rd("Spell.dbc")
spell = {}
for row, b in rowss():
    if row[0] in missing: spell[row[0]] = (row, b)

# SpellEffect grouped by SpellID (@24), EffectIndex (@25)
_, _, _, _, rowse = rd("SpellEffect.dbc")
effects = {}
for row, b in rowse():
    sid = row[24]
    if sid in missing:
        effects.setdefault(sid, {})[row[25]] = row

def load_by_id(fn):
    _, _, _, _, rw = rd(fn); m = {}
    for row, b in rw(): m[row[0]] = row
    return m
cooldowns = load_by_id("SpellCooldowns.dbc")     # ID, CatRecovery, Recovery, StartRecovery
categories = load_by_id("SpellCategories.dbc")   # ID, Category, DefenseType, DispelType, Mechanic, PreventionType, StartRecCat
classopt = load_by_id("SpellClassOptions.dbc")   # ID, ModalNext, Mask1, Mask2, Mask3, ClassSet, SpellID
equipped = load_by_id("SpellEquippedItems.dbc")  # ID, EquipClass, EquipInvTypes, EquipSubclass
interrupts = load_by_id("SpellInterrupts.dbc")   # ID, InterruptFlags, AuraInterrupt..., Channel...
targetres = load_by_id("SpellTargetRestrictions.dbc")  # ID, ConeAngle, MaxTargets, MaxTargetLevel, TargetCreatureType, Targets
levels = load_by_id("SpellLevels.dbc")           # ID, BaseLevel, MaxLevel, SpellLevel

# columns that are `int unsigned` and hold high-bit masks -> convert signed read to unsigned
UMASK = {"attributes","attributes_ex_1","attributes_ex_2","attributes_ex_3","attributes_ex_4",
         "attributes_ex_5","attributes_ex_6","attributes_ex_7","school_mask","targets","stances",
         "aura_interrupt_flags","channel_interrupt_flags","interrupt_flags","proc_flags",
         "effect_spell_class_mask_a_1","effect_spell_class_mask_a_2","effect_spell_class_mask_a_3",
         "effect_spell_class_mask_b_1","effect_spell_class_mask_b_2","effect_spell_class_mask_b_3",
         "effect_spell_class_mask_c_1","effect_spell_class_mask_c_2","effect_spell_class_mask_c_3"}

def esc(v):
    if isinstance(v, str): return "'" + v.replace("\\","\\\\").replace("'","''") + "'"
    return str(v)

# Spell.dbc field indices (4.3.4 layout)
ATTR = 1  # Attributes..ExJ = fields 1..11
F = dict(cast=12, dur=13, power=14, rng=15, speed=16, vis=17, icon=19, active=20,
         name=21, desc=23, school=25, categories=35, classopt=36, cooldowns=37,
         equipped=39, interrupts=40, levels=41, targetres=45, auraopt=32)

cols = {}   # newid... actually spell id stays same
sql_rows = []
for sid in sorted(spell):
    row, b = spell[sid]
    name = ss(struct.unpack_from("<I", ds, b + F['name']*4)[0])
    desc = ss(struct.unpack_from("<I", ds, b + F['desc']*4)[0])
    c = {"id": sid,
         "attributes": row[1], "attributes_ex_1": row[2], "attributes_ex_2": row[3],
         "attributes_ex_3": row[4], "attributes_ex_4": row[5], "attributes_ex_5": row[6],
         "attributes_ex_6": row[7], "attributes_ex_7": row[8],
         "cast_time_index": 1, "duration_index": 0, "range_index": 13,   # safe defaults
         "power_type": row[F['power']], "speed": struct.unpack_from("<f", ds, b + F['speed']*4)[0],
         "spell_visual_1": row[F['vis']], "spell_icon_id": row[F['icon']], "active_icon_id": row[F['active']],
         "school_mask": row[F['school']],
         "spell_name_enus": name, "spell_desc_enus": desc,
         "spell_level": 0, "base_level": 0, "max_level": 0,
         "proc_chance": 101, "equipped_item_class": -1, "damage_class": 1}
    # categories -> damage_class, dispel, mechanic
    cat = categories.get(row[F['categories']])
    if cat:
        c["category"] = cat[1]; c["damage_class"] = cat[2]; c["dispel"] = cat[3]; c["mechanic"] = cat[4]; c["prevention_type"] = cat[5]
    # cooldowns
    cd = cooldowns.get(row[F['cooldowns']])
    if cd:
        c["category_recovery_time"] = cd[1]; c["recovery_time"] = cd[2]; c["start_recovery_time"] = cd[3]
    # class options -> family
    co = classopt.get(row[F['classopt']])
    if co:
        c["spell_class_set"] = co[5]; c["spell_class_mask_1"] = co[2]; c["spell_class_mask_2"] = co[3]; c["spell_class_mask_3"] = co[4]
    # equipped items
    eq = equipped.get(row[F['equipped']])
    if eq:
        c["equipped_item_class"] = eq[1]; c["equipped_item_inventorytype_mask"] = eq[2]; c["equipped_item_subclass_mask"] = eq[3]
    # target restrictions -> targets, creature type
    tr = targetres.get(row[F['targetres']])
    if tr:
        c["max_affected_targets"] = tr[2]; c["maximum_target_level"] = tr[3]; c["target_creature_type"] = tr[4]; c["targets"] = tr[5]
    # levels
    lv = levels.get(row[F['levels']])
    if lv:
        c["base_level"] = lv[1]; c["max_level"] = lv[2]; c["spell_level"] = lv[3]
    # effects (up to 3) — SpellEffect fields: Effect@1, EffectAura@3, AuraPeriod@4, BasePoints@5,
    #   DieSides@9, Mechanic@11, MiscA@12, MiscB@13, RadiusIndex@15, ClassMask@17-19, Trigger@20, TargetA@22, TargetB@23
    for idx in range(3):
        e = effects.get(sid, {}).get(idx)
        n = idx + 1
        if e:
            c["effect_%d"%n] = e[1]; c["effect_apply_aura_name_%d"%n] = e[3]; c["effect_amplitude_%d"%n] = e[4]
            c["effect_base_points_%d"%n] = e[5]; c["effect_die_sides_%d"%n] = max(e[9],1)
            c["effect_mechanic_%d"%n] = e[11]; c["effect_misc_value_a_%d"%n] = e[12]; c["effect_misc_value_b_%d"%n] = e[13]
            c["effect_radius_index_%d"%n] = e[15]; c["effect_trigger_spell_%d"%n] = e[20]
            c["effect_implicit_target_a_%d"%n] = e[22]; c["effect_implicit_target_b_%d"%n] = e[23]
            c["effect_spell_class_mask_a_%d"%n] = e[17]; c["effect_spell_class_mask_b_%d"%n] = e[18]; c["effect_spell_class_mask_c_%d"%n] = e[19]
    sql_rows.append((sid, name, c))

with open(ZPAK + "/dbc/[F-011]_spell.sql", "w") as f:
    f.write("-- F-011 Cata-new quest-item spells ported from Whitemane 4.3.4 (name/desc/effects/school real; cast/range defaulted)\n\n")
    for sid, name, c in sql_rows:
        f.write("-- %d %s\n" % (sid, name))
        f.write("DELETE FROM spell WHERE id=%d;\n" % sid)
        c = {k: (v & 0xFFFFFFFF if (k in UMASK and isinstance(v, int) and v < 0) else v) for k, v in c.items()}
        f.write("INSERT INTO spell SET " + ", ".join("`%s`=%s" % (k, esc(v)) for k, v in c.items()) + ";\n\n")
print("ported spells: %d" % len(sql_rows))
# effect-type summary (which credit natively)
from collections import Counter
et = Counter()
for sid, name, c in sql_rows:
    for n in (1,2,3):
        e = c.get("effect_%d"%n)
        if e: et[e]+=1
print("effect types used:", dict(et))
