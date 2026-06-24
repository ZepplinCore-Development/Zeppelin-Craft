"""
F-190 Phase 1 — Tooltip data classifier / generator.

Reads the DBC ``spell`` table, builds the reverse-107/108 spellmod index, and
classifies each spell for the addon-driven tooltip engine (F-190 Layer 2):

  - ``mods``            : spellmods (107/108) that modify this spell, with their op/value
  - ``casterDependent`` : value depends on caster state (spellmod-affected) -> drives
                          the Layer-3 ALE routing (caster != player => round-trip)
  - ``dummyWarning``    : the spell carries a SPELL_AURA_DUMMY effect (Class-C blind
                          spot — behaviour lives in C++, not derivable from DBC)

Phase 1 covers the DBC-derivable classification (spellmods + DUMMY detection). The
SP/AP coefficients (``spell_bonus_data`` in acore_world) and the F-189
``spell_stat_scaling`` table fold into ``casterDependent`` in a later phase; the
hooks are marked with TODO below.

Pure logic — every function takes plain dict rows so it can be unit-tested without
a live DB. See ``cli/commands/build.py`` (``build tooltip-data``) for the wiring.
"""

from __future__ import annotations

from typing import Dict, List, Optional

# Aura type numbers (Zeppelin-Core SpellAuraDefines.h)
AURA_ADD_FLAT_MODIFIER = 107
AURA_ADD_PCT_MODIFIER = 108
AURA_DUMMY = 4

# Weapon-damage SPELL_EFFECT types (effect_N, NOT auras) — all route to
# Spell::EffectWeaponDmg in core. Spells with these scale on the CASTER's weapon,
# which is local player state (UnitDamage), so they are self-computable. They live
# on the spell-tooltip surface only (instant abilities), never as auras -> no ALE.
WEAPON_EFFECTS = {17, 31, 58, 121}
WEAPON_EFFECT_NAMES = {
    17: "WEAPON_NOSCHOOL", 31: "WEAPON_PERCENT", 58: "WEAPON_DAMAGE", 121: "NORMALIZED",
}

# SpellModOp values worth labelling in the report (SpellDefines.h). Not exhaustive.
SPELLMOD_OP_NAMES = {
    0: "DAMAGE", 1: "DURATION", 3: "EFFECT1", 7: "CRIT_CHANCE",
    8: "ALL_EFFECTS", 10: "CASTING_TIME", 11: "COOLDOWN", 12: "EFFECT2",
    14: "COST", 22: "DOT", 23: "EFFECT3",
}

# Columns pulled from the DBC `spell` table.
SPELL_COLUMNS = [
    "ID", "spell_class_set",
    "spell_class_mask_1", "spell_class_mask_2", "spell_class_mask_3",
    "effect_1", "effect_2", "effect_3",
    "effect_apply_aura_name_1", "effect_apply_aura_name_2", "effect_apply_aura_name_3",
    "effect_misc_value_a_1", "effect_misc_value_a_2", "effect_misc_value_a_3",
    "effect_spell_class_mask_a_1", "effect_spell_class_mask_b_1", "effect_spell_class_mask_c_1",
    "effect_spell_class_mask_a_2", "effect_spell_class_mask_b_2", "effect_spell_class_mask_c_2",
    "effect_spell_class_mask_a_3", "effect_spell_class_mask_b_3", "effect_spell_class_mask_c_3",
    "effect_base_points_1", "effect_base_points_2", "effect_base_points_3",
    "effect_die_sides_1", "effect_die_sides_2", "effect_die_sides_3",
    "effect_real_points_per_level_1", "effect_real_points_per_level_2", "effect_real_points_per_level_3",
    "base_level", "max_level", "spell_level",
    "power_cost", "power_cost_percentage", "recovery_time", "category_recovery_time",
    "attributes", "spell_desc_variable_id",
    "spell_name_enus",
]

# A spell-desc-variable id in this range is one of OUR custom tooltips (the roster the
# addon owns); below it are stock Blizzard variables that render natively.
CUSTOM_DESC_VAR_MIN = 181

ATTR_PASSIVE = 0x40  # SPELL_ATTR0_PASSIVE — passive auras aren't sent to the client,
                     # so the engine must detect them via knows-spell, not has-aura.


def _i(row: Dict, key: str) -> int:
    """Read an int column, treating NULL as 0."""
    v = row.get(key)
    return int(v) if v is not None else 0


def _f(row: Dict, key: str) -> float:
    """Read a float column, treating NULL as 0.0."""
    v = row.get(key)
    return float(v) if v is not None else 0.0


class Modifier:
    """A single 107/108 spellmod effect (one effect index of one modifier spell)."""

    __slots__ = ("src_id", "src_name", "family", "op", "kind",
                 "mask", "base", "die", "eff_index", "via")

    def __init__(self, src_id, src_name, family, op, kind, mask, base, die, eff_index, via):
        self.src_id = src_id
        self.src_name = src_name
        self.family = family          # spell_class_set of the modifier
        self.op = op                  # SpellModOp (effect_misc_value_a)
        self.kind = kind              # 107 flat | 108 pct
        self.mask = mask              # (a, b, c) class-mask tuple selecting target spells
        self.base = base              # effect_base_points
        self.die = die                # effect_die_sides — applied value = base + die (die=1 -> +1)
        self.eff_index = eff_index    # 1..3
        self.via = via                # "known" (passive talent) | "aura" (equip/buff) — hint
                                      # only; the engine checks knows OR hasAura to be safe

    def matches(self, family: int, flags: tuple) -> bool:
        """True if this modifier targets a spell of `family` with SpellFamilyFlags `flags`."""
        if self.family != family:
            return False
        return any(self.mask[i] & flags[i] for i in range(3))

    def to_dict(self) -> Dict:
        return {
            "src": self.src_id,
            "src_name": self.src_name,
            "kind": "flat" if self.kind == AURA_ADD_FLAT_MODIFIER else "pct",
            "op": self.op,
            "op_name": SPELLMOD_OP_NAMES.get(self.op, str(self.op)),
            "base": self.base,
            "die": self.die,
            "eff": self.eff_index,
            "via": self.via,
        }


def build_modifier_index(spells: Dict[int, Dict]) -> List[Modifier]:
    """Reverse-107/108 index: every spellmod effect across all spells."""
    mods: List[Modifier] = []
    for sid, row in spells.items():
        family = _i(row, "spell_class_set")
        for i in (1, 2, 3):
            aura = _i(row, f"effect_apply_aura_name_{i}")
            if aura not in (AURA_ADD_FLAT_MODIFIER, AURA_ADD_PCT_MODIFIER):
                continue
            # EffectSpellClassMask convention (see Joplin "SpellFamilies and Masks"):
            # the LETTER selects the modifier's effect index (a=eff1, b=eff2, c=eff3),
            # the NUMBER selects the TARGET word (1=mask_1/flags[0], 2=mask_2, 3=mask_3).
            # So effect i's 96-bit mask = ({letter}_1, {letter}_2, {letter}_3).
            letter = {1: "a", 2: "b", 3: "c"}[i]
            mask = (
                _i(row, f"effect_spell_class_mask_{letter}_1"),
                _i(row, f"effect_spell_class_mask_{letter}_2"),
                _i(row, f"effect_spell_class_mask_{letter}_3"),
            )
            if not any(mask):
                continue  # no class mask -> targets nothing by family flags
            via = "known" if (_i(row, "attributes") & ATTR_PASSIVE) else "aura"
            mods.append(Modifier(
                src_id=sid,
                src_name=row.get("spell_name_enus") or "",
                family=family,
                op=_i(row, f"effect_misc_value_a_{i}"),
                kind=aura,
                mask=mask,
                base=_i(row, f"effect_base_points_{i}"),
                die=_i(row, f"effect_die_sides_{i}"),
                eff_index=i,
                via=via,
            ))
    return mods


def spell_flags(row: Dict) -> tuple:
    return (
        _i(row, "spell_class_mask_1"),
        _i(row, "spell_class_mask_2"),
        _i(row, "spell_class_mask_3"),
    )


def has_dummy(row: Dict) -> bool:
    return any(_i(row, f"effect_apply_aura_name_{i}") == AURA_DUMMY for i in (1, 2, 3))


def weapon_effects(row: Dict) -> List[Dict]:
    """Weapon-damage effects (17/31/58/121) on this spell, with their base points.
    `type`: the SPELL_EFFECT id; `eff`: 1..3; `base`: effect_base_points (percent for
    WEAPON_PERCENT(31), a flat add for the others)."""
    out = []
    for i in (1, 2, 3):
        etype = _i(row, f"effect_{i}")
        if etype in WEAPON_EFFECTS:
            out.append({"type": etype, "eff": i, "base": _i(row, f"effect_base_points_{i}")})
    return out


def spell_effects(row: Dict) -> List[Dict]:
    """Per-effect numbers the engine needs: effect type, aura type, base points,
    die_sides, and per-level scaling. Empty effects (type 0 & aura 0) are skipped."""
    out = []
    for i in (1, 2, 3):
        etype = _i(row, f"effect_{i}")
        aura = _i(row, f"effect_apply_aura_name_{i}")
        if etype == 0 and aura == 0:
            continue
        out.append({
            "i": i, "type": etype, "aura": aura,
            "base": _i(row, f"effect_base_points_{i}"),
            "die": _i(row, f"effect_die_sides_{i}"),
            "ppl": _f(row, f"effect_real_points_per_level_{i}"),
        })
    return out


SP_AP_COLUMNS = ("direct_bonus", "dot_bonus", "ap_bonus", "ap_dot_bonus")


def _has_sp_ap(bonus_row: Optional[Dict]) -> bool:
    """True if a spell_bonus_data row carries any nonzero SP/AP coefficient."""
    if not bonus_row:
        return False
    for col in SP_AP_COLUMNS:
        v = bonus_row.get(col)
        if v is not None and abs(float(v)) > 0.0:
            return True
    return False


def classify(spell_id: int, spells: Dict[int, Dict],
             modifier_index: List[Modifier],
             spell_bonus: Optional[Dict[int, Dict]] = None,
             stat_scaling: Optional[Dict[int, List[Dict]]] = None) -> Optional[Dict]:
    """Classify one spell. Returns None if the spell id is unknown.

    casterDependent (the Layer-3 ALE routing flag) is true when the displayed value
    depends on caster state via ANY of:
      - spellmod  : a 107/108 modifier (caster talents/glyphs/equip) targets it
      - sp_ap     : a spell_bonus_data row with a nonzero SP/AP coefficient (HoTs/DoTs/nukes/heals)
      - stat_scaling : an F-189 spell_stat_scaling row (armor/stamina/etc. caster-stat scaling)
    """
    row = spells.get(spell_id)
    if row is None:
        return None
    family = _i(row, "spell_class_set")
    flags = spell_flags(row)
    mods = [m for m in modifier_index if m.matches(family, flags)]

    bonus_row = (spell_bonus or {}).get(spell_id)
    sp_ap = _has_sp_ap(bonus_row)
    stat_rows = (stat_scaling or {}).get(spell_id) or []
    weapon = weapon_effects(row)

    reasons = []
    if mods:
        reasons.append("spellmod")
    if sp_ap:
        reasons.append("sp_ap")
    if stat_rows:
        reasons.append("stat_scaling")
    if weapon:
        reasons.append("weapon")

    desc_var = _i(row, "spell_desc_variable_id")
    custom_var = CUSTOM_DESC_VAR_MIN <= desc_var < 100000

    # "renderable" = the engine would compute a number for it (so it needs the full
    # coefficient + modifier record). Pure caster-dependent buffs with no value get a
    # lean record. Keeps the shipped table bounded.
    renderable = bool(sp_ap or weapon or stat_rows or custom_var)

    return {
        "id": spell_id,
        "name": row.get("spell_name_enus") or "",
        "family": family,
        "casterDependent": bool(reasons),
        "reasons": reasons,
        "dummyWarning": has_dummy(row),
        "renderable": renderable,
        "desc_var": desc_var if custom_var else 0,
        # full per-spell compute picture (engine inputs), all from OUR DBC:
        "levels": {"bl": _i(row, "base_level"), "ml": _i(row, "max_level"),
                   "sl": _i(row, "spell_level")},
        "cost": {"flat": _i(row, "power_cost"), "pct": _i(row, "power_cost_percentage"),
                 "cd": _i(row, "recovery_time"), "cdcat": _i(row, "category_recovery_time")},
        "effects": spell_effects(row),
        "sp_ap": {"d": _f(bonus_row, "direct_bonus"), "o": _f(bonus_row, "dot_bonus"),
                  "ap": _f(bonus_row, "ap_bonus"), "apo": _f(bonus_row, "ap_dot_bonus")}
                 if bonus_row else None,
        "stat_scaling": [{"eff": _i(r, "eff_index"), "stat": r.get("stat_id"),
                          "coeff": float(r["coeff"]) if r.get("coeff") is not None else None}
                         for r in stat_rows] if stat_rows else None,
        "weapon": weapon or None,
        "mods": [m.to_dict() for m in mods],
    }


def _num(x) -> str:
    """Compact Lua number: drop trailing .0 on whole floats."""
    if isinstance(x, float) and x.is_integer():
        return str(int(x))
    return repr(x) if isinstance(x, float) else str(x)


def emit_lua(records: List[Dict]) -> str:
    """Render records as the Lua data table the engine consumes.

    Schema per spell:
      cd       = casterDependent (drives ALE routing)
      reasons  = {spellmod|sp_ap|stat_scaling|weapon}
      dv       = custom spell-desc-variable id (0 if none / stock)
      bl,ml,sl = base / max / spell level
      eff      = {{i,t,a,b,d,p}} index,type,aura,base,die,ppl (per-level)
      sp       = {d,o,ap,apo} spell_bonus_data direct/dot/ap/apdot coefficients
      weapon   = {{t,e,b}} type,eff,base
      stat     = {{e,s,c}} eff,stat_id,coeff (F-189)
      mods     = {{src,op,k,b,e,v}} src,SpellModOp,kind,base,eff,via(known|aura)
    Non-renderable caster-dependent spells get a lean {cd,reasons,nmods} record.
    """
    lines = [
        "-- F-190 — generated tooltip compute data. DO NOT EDIT BY HAND.",
        "-- Regenerated by `zep build tooltip-data`. Source of truth = our live DBC.",
        "ZepTooltipData = {",
    ]
    for r in sorted(records, key=lambda r: r["id"]):
        cd = "true" if r["casterDependent"] else "false"
        reasons = "{" + ",".join('"%s"' % x for x in r.get("reasons", [])) + "}"

        if not r.get("renderable"):
            lines.append("  [%d] = {cd=%s, reasons=%s, nmods=%d},  -- %s"
                         % (r["id"], cd, reasons, len(r["mods"]), r["name"]))
            continue

        lv = r["levels"]
        eff = "{" + ",".join(
            "{i=%d,t=%d,a=%d,b=%d,d=%d,p=%s}" % (e["i"], e["type"], e["aura"], e["base"],
                                                 e["die"], _num(e["ppl"]))
            for e in r["effects"]) + "}"
        sp = r["sp_ap"]
        sp_lua = ("{d=%s,o=%s,ap=%s,apo=%s}" % (_num(sp["d"]), _num(sp["o"]),
                                                _num(sp["ap"]), _num(sp["apo"]))) if sp else "nil"
        weapon = "{" + ",".join("{t=%d,e=%d,b=%d}" % (w["type"], w["eff"], w["base"])
                                for w in (r.get("weapon") or [])) + "}"
        stat = "{" + ",".join('{e=%d,s="%s",c=%s}' % (s["eff"], s["stat"], _num(s["coeff"]))
                              for s in (r.get("stat_scaling") or [])) + "}"
        mods = "{" + ",".join(
            '{src=%d,op=%d,k="%s",b=%d,d=%d,e=%d,v="%s"}' % (m["src"], m["op"], m["kind"],
                                                            m["base"], m["die"], m["eff"], m["via"])
            for m in r["mods"]) + "}"
        c = r["cost"]
        cost = "{f=%d,p=%d,cd=%d,cdc=%d}" % (c["flat"], c["pct"], c["cd"], c["cdcat"])
        lines.append(
            "  [%d] = {cd=%s, reasons=%s, dv=%d, bl=%d, ml=%d, sl=%d, eff=%s, sp=%s, "
            "weapon=%s, stat=%s, cost=%s, mods=%s},  -- %s"
            % (r["id"], cd, reasons, r["desc_var"], lv["bl"], lv["ml"], lv["sl"],
               eff, sp_lua, weapon, stat, cost, mods, r["name"])
        )
    lines.append("}")
    lines.append("")
    return "\n".join(lines)
