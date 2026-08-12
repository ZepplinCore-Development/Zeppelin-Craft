"""F-028 Low-Level Relic Slot Drops — SQL generator.

Reads `data/relic_effects.json` and emits idempotent SQL for:
- 52 custom relic items in `zpaks/zep-items/sql/zz_[F-028]_low_level_relics.sql`
- 52 effect-mod aura spells in `zpaks/zep-items/dbc/[F-028]_spell.sql`
- 1 anchor upgrade for Totem of the Earthen Ring (entry 46978 / spell 900356)

Re-run after editing `relic_effects.json` (assignments, scaling, naming, etc.):
    python3 -m cli.lib.item.relic_generator

Then apply:
    zep dbc edit modify "zpaks/zep-items/dbc/[F-028]_spell.sql"
    zep world sql changed
    zep build patch-mpq -p Z --build

Also exposes `build_relic_for_cell()` as a helper consumed by F-013 Phase 6
(see cli/lib/item/generator.py) so heroic/mythic relic cells in the F-013
matrix can produce effect-aura items via this same authoring methodology
without forking the pipeline.
"""

import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

# Resolve project root from this file's location (cli/lib/item/relic_generator.py)
PROJECT_ROOT = Path(__file__).resolve().parents[3]
DATA = PROJECT_ROOT / "cli" / "lib" / "item" / "data" / "relic_effects.json"
DBC_OUT = PROJECT_ROOT / "zpaks" / "zep-items" / "dbc" / "[F-028]_spell.sql"
ITEM_OUT = PROJECT_ROOT / "zpaks" / "zep-items" / "sql" / "zz_[F-028]_low_level_relics.sql"


# -- Per-class lookups ---------------------------------------------------------

SUBCLASS = {"paladin": 7, "druid": 8, "shaman": 9}  # Libram / Idol / Totem
TOTEM_CATEGORY = {"shaman": 21, "druid": 0, "paladin": 0}
# AllowableClass = -1 (no restriction) — the relic slot itself is class-gated
# by InventoryType=28, so explicit class locks are redundant and would block
# legitimate use by other classes that may gain the slot.
ALLOWABLE_CLASS = -1

# Per-class display pools, sourced from stock relic items in the live DB
# (item_template WHERE InventoryType=28 AND subclass IN (7,8,9), excluding NPC/
# DEPRECATED). Rotated deterministically by per-class item index so each class's
# 17-18 relics get unique-ish art. Larger pool = less repetition.
RELIC_DISPLAY_POOL = {
    "shaman": [
        25246, 34956, 34957, 34958, 39638, 39639, 40043, 42614, 43109, 43198,
        43317, 43430, 46045, 47071, 47072, 50456, 50537, 54871, 55823, 57173,
        57574, 61970, 62300, 64628, 64629,
    ],
    "druid": [
         9659, 34953, 34954, 34955, 39635, 39640, 39645, 39652, 40048, 40160,
        43117, 43316, 43434, 43580, 45315, 45754, 47073, 47088, 51424, 54347,
        54349, 54481, 54483, 54484, 54700, 58200, 64624,
    ],
    "paladin": [
        # Stock libram displays
         1103,  5562,  5563, 34959, 34960, 34961, 36578, 39650, 43318, 54524,
        64625, 64626,
        # Holy/divine/paladin-themed tome and book displays (sourced from items
        # named Libram/Tome/Book/Prayer with holy/light/righteousness flavor —
        # paladin libram aesthetic without being strictly relic-slot items)
         1134,  7697,  8731, 13005, 13006, 24072, 34802, 36265, 36266, 36267,
        36268, 42079, 42092, 43547, 44544, 48895, 52633,
    ],
}


# -- Effect templates ----------------------------------------------------------

EFFECT_TPL = {
    "spell_power_damage":   {"aura": 112, "misc": 4554, "school_mask": 1},
    "spell_power_heal":     {"aura": 112, "misc": 3736, "school_mask": 2},
    "mana_cost_reduction":  {"aura": 107, "misc": 14,   "school_mask": 1},
    "ability_damage_bonus": {"aura": 107, "misc": 3,    "school_mask": 1},
    "cooldown_reduction":   {"aura": 107, "misc": 11,   "school_mask": 1},
    # SPELLMOD_EFFECT1 (misc 3) flat-adds to the target's effect-1 value. For an
    # aura whose effect 1 IS the armor amount (Devotion Aura: aura 22
    # MOD_RESISTANCE, misc 1), that is a flat armor bonus. Same mechanism stock
    # Improved Devotion Aura (20138) uses, as a pct rather than a flat add.
    # Unit::ApplyEffectModifiers (Unit.cpp) routes SPELLMOD_EFFECT1 into
    # SpellEffectInfo::CalcValue, so it reaches aura amounts, not just damage.
    "armor_aura_bonus":     {"aura": 107, "misc": 3,    "school_mask": 1},
}

EFFECT_DESC_TPL = {
    "spell_power_damage":   "Increases spell power of {target} by $s1.",
    "spell_power_heal":     "Increases spell power of {target} by $s1.",
    "mana_cost_reduction":  "Reduces the mana cost of your {target} by $s1.",
    "ability_damage_bonus": "Increases the damage dealt by your {target} by $s1.",
    "cooldown_reduction":   "Reduces the cooldown of your {target} by $/60000;s1 minutes.",
    "armor_aura_bonus":     "Increases the armor bonus of your {target} by $s1.",
}

# Effects that require the target spell to cost mana / have a cooldown / deal
# damage. Consumed by validate.py to reject archetype-target pairings that
# cannot fire (e.g. a mana-cost mod on a free spell, or a spell-power mod on a
# totem's SUMMON spell rather than the damage spell the totem actually casts).
EFFECT_REQUIRES = {
    "mana_cost_reduction":  "cost",
    "cooldown_reduction":   "cooldown",
    "spell_power_damage":   "damage",
    "spell_power_heal":     "heal",
    "ability_damage_bonus": "damage",
    "armor_aura_bonus":     "aura_value",
}


# -- Scaling -------------------------------------------------------------------
#
# Calibrated to match stock Totem of the Storm (+33 SP at ilvl 65) at the top
# end. Linear in ilvl; final displayed value = base_points + die_sides (1).

def scale_value(effect: str, ilvl: int) -> int:
    """Returns the final displayed value (positive or negative)."""
    if effect == "spell_power_damage":
        return round(ilvl * 0.5)
    if effect == "spell_power_heal":
        return round(ilvl * 0.65)
    if effect == "mana_cost_reduction":
        return -round(ilvl * 0.2 + 2)
    if effect == "ability_damage_bonus":
        return round(ilvl * 0.4)
    if effect == "cooldown_reduction":
        return -(round(ilvl * 1500))  # ms
    if effect == "armor_aura_bonus":
        # Devotion Aura rank 4 (level 30) grants 390 armor; ilvl 35 * 1.5 = 53,
        # i.e. ~13% — in line with a single point of Improved Devotion Aura
        # (+16%) and still sane at heroic/mythic ilvl (66 -> 99, 76 -> 114
        # against rank 7's 1205 armor).
        return round(ilvl * 1.5)
    raise ValueError(f"unknown effect: {effect}")


# -- Target mask resolution ----------------------------------------------------

def _spell_mask(sp: dict, effect: Optional[str]) -> tuple[int, int, int]:
    """The three mask words for one ladder entry, honouring any per-effect
    override.

    A ladder entry's mask_1/2/3 describe the spell the PLAYER casts. For summon
    spells (totems) that is not the spell that carries the effect being modified
    — Magma Totem's summon deals no damage, the totem's own spell does — so an
    entry may declare `effect_masks: {"<effect>": {"mask_1": N}}` to redirect
    that archetype at the spell that actually carries it.
    """
    override = (sp.get("effect_masks") or {}).get(effect or "", {})
    return (
        override.get("mask_1", sp.get("mask_1", 0)),
        override.get("mask_2", sp.get("mask_2", 0)),
        override.get("mask_3", sp.get("mask_3", 0)),
    )


def resolve_target_mask(
    target_str: str,
    cls: str,
    class_spells: dict,
    effect: Optional[str] = None,
) -> tuple[int, int, int, str]:
    """Returns (mask_a_1, mask_a_2, mask_a_3, display_target).

    The three returned words are effect 1's flag96 and are matched against the
    target spell's spell_class_mask_1/2/3 respectively. Note the DBC column
    naming: the LETTER selects which effect on this spell is modifying
    (a = effect 1), the NUMBER selects which of the target's mask words to test.
    So effect 1's second word is `effect_spell_class_mask_a_2`, NOT `..._b_1`.

    Handles three forms:
      - "Earth Shock + Flame Shock + Frost Shock (mask 2416967680)"  -> explicit mask
      - "Rake + Claw"                                                  -> OR of component masks
      - "Holy Light"                                                    -> single-spell lookup

    The explicit "(mask N)" form only sets word 1; a target whose flag lives in
    word 2 or 3 must be expressed as a named ladder entry so all three words
    resolve. Prefer named entries.
    """
    m = re.search(r"\(mask (\d+)", target_str)
    if m:
        explicit_mask = int(m.group(1))
        display = re.sub(r"\s*\(mask[^)]*\).*", "", target_str).strip()
        return explicit_mask, 0, 0, display

    if " + " in target_str:
        parts = [p.strip() for p in target_str.split(" + ")]
        m1, m2, m3 = 0, 0, 0
        for p in parts:
            sp = class_spells[cls].get(p)
            if not sp:
                raise ValueError(f"Spell '{p}' (from '{target_str}') not in {cls} class_spells")
            w1, w2, w3 = _spell_mask(sp, effect)
            m1 |= w1
            m2 |= w2
            m3 |= w3
        return m1, m2, m3, target_str.replace(" + ", " and ")

    sp = class_spells[cls].get(target_str)
    if not sp:
        raise ValueError(f"Spell '{target_str}' not in {cls} class_spells")
    w1, w2, w3 = _spell_mask(sp, effect)
    return w1, w2, w3, target_str


# -- Per-(class, role) defaults for F-013 Phase 6 ------------------------------
#
# Maps a matrix cell's (class, role) to a default (effect_template, target).
# Target strings must resolve via resolve_target_mask (see class_spells in
# relic_effects.json or use the "(mask N)" / "Spell A + Spell B" forms).
# These are the canonical heroic/mythic relics F-013 emits — same per
# (class, role) across all six (tier, difficulty) outputs, just scaled by ilvl.

PHASE6_DEFAULTS = {
    ("paladin", "tank"):   {"effect": "ability_damage_bonus", "target": "Consecration",                          "base_name": "Libram of Consecrated Stone"},
    ("paladin", "melee"):  {"effect": "ability_damage_bonus", "target": "Hammer of Wrath",                       "base_name": "Libram of the Reckoning Hammer"},
    ("paladin", "healer"): {"effect": "spell_power_heal",     "target": "Holy Light + Flash of Light",           "base_name": "Libram of the Mending Sun"},
    ("shaman",  "tank"):   {"effect": "ability_damage_bonus", "target": "Earth Shock",                           "base_name": "Totem of the Trembling Earth"},
    ("shaman",  "melee"):  {"effect": "ability_damage_bonus", "target": "Earth Shock + Flame Shock + Frost Shock", "base_name": "Totem of the Elemental Triad"},
    ("shaman",  "caster"): {"effect": "spell_power_damage",   "target": "Lightning Bolt + Chain Lightning",      "base_name": "Totem of the Crackling Sky"},
    ("shaman",  "healer"): {"effect": "spell_power_heal",     "target": "Healing Wave + Lesser Healing Wave",    "base_name": "Totem of Cresting Tides"},
    ("druid",   "tank"):   {"effect": "ability_damage_bonus", "target": "Maul + Swipe (Bear)",                   "base_name": "Idol of the Iron Maw"},
    ("druid",   "melee"):  {"effect": "ability_damage_bonus", "target": "Rake",                                  "base_name": "Idol of the Bleeding Claw"},
    ("druid",   "caster"): {"effect": "spell_power_damage",   "target": "Wrath + Starfire",                      "base_name": "Idol of the Starlit Bough"},
    ("druid",   "healer"): {"effect": "spell_power_heal",     "target": "Healing Touch + Rejuvenation",          "base_name": "Idol of the Renewing Glade"},
}

# Tier+difficulty prefix that flavours each base relic into 6 distinct gear pieces.
# Sanctified/Ascendant for Azeroth (light/holy theme), Felforged/Demonbane for Outland
# (Burning Crusade theme), Frostbound/Eternal for Northrend (LK / cosmic theme).
TIER_PREFIXES = {
    ("azeroth",   "heroic"): "Sanctified",
    ("azeroth",   "mythic"): "Ascendant",
    ("outland",   "heroic"): "Felforged",
    ("outland",   "mythic"): "Demonbane",
    ("northrend", "heroic"): "Frostbound",
    ("northrend", "mythic"): "Eternal",
}


@dataclass
class RelicSpec:
    """Per-cell result from build_relic_for_cell: everything F-013 needs to
    emit one heroic/mythic relic item plus its effect-aura spell."""
    # Item fields
    item_id: int
    item_name: str
    item_class: int           # 4 = ARMOR
    item_subclass: int        # 7 libram, 8 idol, 9 totem
    inventory_type: int       # 28 = RANGED_RIGHT / relic
    quality: int              # 4 = Epic
    display_id: int
    item_level: int
    required_level: int
    totem_category: int
    description: str
    # Spell linkage
    spell_id: int             # custom 900xxx in F-013 reserve range
    spell_trigger: int        # 1 = ON_EQUIP
    # Spell row content (for spell.sql emission)
    spell_sql: str            # full DELETE+INSERT block, ready to write


def build_relic_for_cell(
    cls: str,
    role: str,
    ilvl: int,
    required_level: int,
    quality: int,
    spell_id: int,
    item_id: int,
    display_id: int,
    tier: str,
    difficulty: str,
    relic_effects_data: dict,
) -> Optional[RelicSpec]:
    """Build the full RelicSpec for a single F-013 matrix cell.

    Returns None if (cls, role) has no relic preset (e.g. DK currently — its
    sigil hooks are deferred to a future phase that covers Outland/Northrend).
    """
    preset = PHASE6_DEFAULTS.get((cls, role))
    if preset is None:
        return None

    effect = preset["effect"]
    target = preset["target"]
    base_name = preset["base_name"]
    tier_prefix = TIER_PREFIXES.get((tier, difficulty), f"{tier.title()} {difficulty.title()}")

    class_spells = relic_effects_data["class_spells"]
    class_set_dbc = relic_effects_data["_class_set_dbc"]
    mask1, mask2, mask3, display_target = resolve_target_mask(target, cls, class_spells, effect)
    tpl = EFFECT_TPL[effect]
    displayed = scale_value(effect, ilvl)
    base_points = displayed - 1
    desc = EFFECT_DESC_TPL[effect].format(target=display_target)
    cls_set = class_set_dbc[cls]

    item_name = f"{tier_prefix} {base_name}"

    spell_sql = f"""DELETE FROM `spell` WHERE `id` = {spell_id};
INSERT INTO `spell` SET
    `id` = {spell_id},
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = {base_points},
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = {tpl['aura']},
    `effect_item_type_1` = 0,
    `effect_misc_value_a_1` = {tpl['misc']},
    `effect_spell_class_mask_a_1` = {mask1},
    `effect_spell_class_mask_a_2` = {mask2},
    `effect_spell_class_mask_a_3` = {mask3},
    `spell_icon_id` = 13,
    `spell_name_enus` = '{sql_escape(item_name)}',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = '{sql_escape(desc)}',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = {cls_set},
    `spell_class_mask_1` = 0,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = {tpl['school_mask']},
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;
"""

    return RelicSpec(
        item_id=item_id,
        item_name=item_name,
        item_class=4,
        item_subclass=SUBCLASS[cls],
        inventory_type=28,
        quality=quality,
        display_id=display_id,
        item_level=ilvl,
        required_level=required_level,
        totem_category=TOTEM_CATEGORY[cls],
        description="Counts as an Air, Earth, Fire, and Water totem." if cls == "shaman" else "",
        spell_id=spell_id,
        spell_trigger=1,
        spell_sql=spell_sql,
    )


def load_relic_effects_data() -> dict:
    """Convenience loader used by F-013's relic branch."""
    return json.loads(DATA.read_text())


def pick_display_for_class(cls: str, index: int) -> int:
    """Pick a deterministic display_id from the class pool by index."""
    pool = RELIC_DISPLAY_POOL[cls]
    return pool[index % len(pool)]


# -- SQL helpers ---------------------------------------------------------------

def sql_escape(s: str) -> str:
    return s.replace("'", "''")


def gen_spell(entry: dict, class_set_dbc: dict, class_spells: dict) -> str:
    cls = entry["class"]
    eff = entry["effect"]
    sid = entry["spell_id"]
    ilvl = entry["ilvl"]
    name = entry["name_hint"]
    mask1, mask2, mask3, display_target = resolve_target_mask(entry["target"], cls, class_spells, eff)
    tpl = EFFECT_TPL[eff]
    displayed = scale_value(eff, ilvl)
    base_points = displayed - 1
    desc = EFFECT_DESC_TPL[eff].format(target=display_target)
    cls_set = class_set_dbc[cls]

    return f"""DELETE FROM `spell` WHERE `id` = {sid};
INSERT INTO `spell` SET
    `id` = {sid},
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = {base_points},
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = {tpl['aura']},
    `effect_item_type_1` = 0,
    `effect_misc_value_a_1` = {tpl['misc']},
    `effect_spell_class_mask_a_1` = {mask1},
    `effect_spell_class_mask_a_2` = {mask2},
    `effect_spell_class_mask_a_3` = {mask3},
    `spell_icon_id` = 13,
    `spell_name_enus` = '{sql_escape(name)}',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = '{sql_escape(desc)}',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = {cls_set},
    `spell_class_mask_1` = 0,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = {tpl['school_mask']},
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;
"""


# Disenchant pool lookup — uses the standard AC armor disenchant brackets
# (item_disenchant_loot rows) keyed by Quality + ItemLevel. Relics had no
# DisenchantID before, so the client refused to disenchant them despite
# RequiredDisenchantSkill being set. Brackets verified against live DB
# (SELECT class=4 subclass IN (1-4) DisenchantID > 0 GROUP BY Quality).
_DE_GREEN = [   # quality=2 (uncommon)
    ((5,  15),  1,   1),
    ((16, 20),  2,   1),
    ((21, 25),  3,  25),
    ((26, 30),  4,  50),
    ((31, 35),  5,  75),
    ((36, 40),  6, 100),
    ((41, 45),  7, 125),
    ((46, 50),  8, 150),
    ((51, 55),  9, 175),
    ((56, 60), 10, 200),
    ((61, 65), 11, 225),
]
_DE_BLUE = [    # quality=3 (rare)
    ((26, 30), 42,  50),
    ((31, 35), 43,  75),
    ((36, 40), 44, 100),
    ((41, 45), 45, 125),
    ((46, 50), 46, 150),
    ((51, 55), 47, 175),
    ((56, 65), 48, 225),
]


def _disenchant_for(quality: int, ilvl: int):
    """Return (DisenchantID, RequiredDisenchantSkill) for a relic at this
    (quality, ilvl). Falls back to (0, 0) — no disenchant — if outside
    the supported brackets."""
    table = _DE_GREEN if quality == 2 else _DE_BLUE if quality == 3 else []
    for (lo, hi), de_id, skill in table:
        if lo <= ilvl <= hi:
            return de_id, skill
    return 0, 0


def gen_item(entry: dict, per_class_idx: int) -> str:
    cls = entry["class"]
    eff = entry["effect"]
    eid = entry["item_id"]
    sid = entry["spell_id"]
    ilvl = entry["ilvl"]
    req = entry["req_level"]
    name = entry["name_hint"]
    pool = RELIC_DISPLAY_POOL[cls]
    disp = pool[per_class_idx % len(pool)]
    sub = SUBCLASS[cls]
    totcat = TOTEM_CATEGORY[cls]
    sell = ilvl * 100
    buy = sell * 5
    # Quality: req_level < 30 → green (2), req_level >= 30 → rare/blue (3)
    quality = 2 if req < 30 else 3
    de_id, de_skill = _disenchant_for(quality, ilvl)
    # Shaman totems get the stock "Counts as Air/Earth/Fire/Water" flavor text
    # (TotemCategory 21 = Master Totem, mask 15 covers all four elements).
    description = "Counts as an Air, Earth, Fire, and Water totem." if cls == "shaman" else ""

    return f"""DELETE FROM `item_template` WHERE `entry` = {eid};
INSERT INTO `item_template` SET
    `entry` = {eid},
    `class` = 4,
    `subclass` = {sub},
    `SoundOverrideSubclass` = -1,
    `name` = '{sql_escape(name)}',
    `description` = '{sql_escape(description)}',
    `displayid` = {disp},
    `Quality` = {quality},
    `Flags` = 0,
    `FlagsExtra` = 0,
    `BuyCount` = 1,
    `BuyPrice` = {buy},
    `SellPrice` = {sell},
    `InventoryType` = 28,
    `AllowableClass` = {ALLOWABLE_CLASS},
    `AllowableRace` = -1,
    `ItemLevel` = {ilvl},
    `RequiredLevel` = {req},
    `maxcount` = 1,
    `stackable` = 1,
    `spellid_1` = {sid},
    `spelltrigger_1` = 1,
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `bonding` = 1,
    `Material` = 2,
    `sheath` = 0,
    `TotemCategory` = {totcat},
    `DisenchantID` = {de_id},
    `RequiredDisenchantSkill` = {de_skill};
"""


# -- Anchor (preserved verbatim) -----------------------------------------------

ANCHOR_SPELL = """-- Anchor: Earthen Ring's Embrace (level 30 quest reward upgrade for Totem of the Earthen Ring entry 46978)
DELETE FROM `spell` WHERE `id` = 900356;
INSERT INTO `spell` SET
    `id` = 900356,
    `attributes` = 464,
    `cast_time_index` = 1,
    `proc_chance` = 101,
    `duration_index` = 21,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 6,
    `effect_die_sides_1` = 1,
    `effect_base_points_1` = -6,
    `effect_implicit_target_a_1` = 1,
    `effect_apply_aura_name_1` = 107,
    `effect_item_type_1` = 0,
    `effect_misc_value_a_1` = 14,
    `effect_spell_class_mask_a_1` = 2416967680,
    `spell_icon_id` = 13,
    `spell_name_enus` = 'Earthen Ring''s Embrace',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Reduces the mana cost of your Shock spells by $s1.',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `spell_class_set` = 11,
    `spell_class_mask_1` = 0,
    `effect_damage_multiplier_1` = 1.0,
    `school_mask` = 1,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;
"""

ANCHOR_ITEM = """-- Anchor upgrade: Totem of the Earthen Ring (entry 46978) — level 30 quest reward
-- Disenchants as a level-30-band green (ilvl 31-35 armor bracket): stock ItemLevel
-- is 1, so _disenchant_for() can't derive the bracket — values set explicitly.
UPDATE `item_template` SET
    `Quality` = 2,
    `spellid_1` = 900356,
    `spelltrigger_1` = 1,
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `DisenchantID` = 5,
    `RequiredDisenchantSkill` = 75
WHERE `entry` = 46978;
"""


# -- Build ---------------------------------------------------------------------

def build() -> tuple[int, int]:
    d = json.loads(DATA.read_text())
    plan = d["relic_plan"]
    class_spells = d["class_spells"]
    class_set_dbc = d["_class_set_dbc"]

    all_entries = []
    for band in ("level_band_20_30", "level_band_30_40", "level_band_40_50", "level_band_50_60"):
        all_entries.extend(plan[band])

    dbc_blocks = [
        "-- F-028 Low-Level Relic Slot Drops — spell-mod auras",
        "-- 1 anchor (900356) + 52 effect-mod spells (900357-900408)",
        "-- Generated by cli/lib/item/relic_generator.py from data/relic_effects.json",
        "",
        ANCHOR_SPELL,
    ]
    item_blocks = [
        "-- F-028 Low-Level Relic Slot Drops — item_template",
        "-- 1 anchor upgrade (entry 46978) + 52 new dungeon-drop relics (entries 59039-59090)",
        "-- Generated by cli/lib/item/relic_generator.py from data/relic_effects.json",
        "",
        ANCHOR_ITEM,
    ]

    class_counters = {"shaman": 0, "druid": 0, "paladin": 0}
    for e in all_entries:
        cls = e["class"]
        idx = class_counters[cls]
        class_counters[cls] += 1

        header = f"-- {e['name_hint']} ({cls}, req {e['req_level']}, ilvl {e['ilvl']}, {e['effect']} on {e['target']}, {e['dungeon']})"
        dbc_blocks.append(header)
        dbc_blocks.append(gen_spell(e, class_set_dbc, class_spells))
        item_header = f"-- {e['name_hint']} ({cls}, req {e['req_level']}, ilvl {e['ilvl']}, {e['dungeon']})"
        item_blocks.append(item_header)
        item_blocks.append(gen_item(e, idx))

    DBC_OUT.write_text("\n".join(dbc_blocks) + "\n")
    ITEM_OUT.write_text("\n".join(item_blocks) + "\n")
    return len(all_entries), len(all_entries)


if __name__ == "__main__":
    import sys

    # Validate before writing: an effect/target pairing that cannot fire (mana
    # cost mod on a free spell, spell power on a totem's summon rather than its
    # damage, a mask that misses a word) produces no server error at runtime,
    # so the only place to catch it is here. --no-validate skips the DBC round
    # trip; the check self-skips anyway when the DBC is unreachable.
    if "--no-validate" not in sys.argv:
        from .relic_validate import validate

        problems = validate()
        if problems and not problems[0].startswith("SKIPPED:"):
            print(f"Refusing to generate — {len(problems)} problem(s) in relic_effects.json:\n")
            for p in problems:
                print(f"  - {p}")
            print("\nFix the plan, or pass --no-validate to generate anyway.")
            raise SystemExit(1)
        if problems:
            print(problems[0])

    n_spells, n_items = build()
    print(f"DBC: {DBC_OUT}  ({n_spells} new spells + 1 anchor)")
    print(f"SQL: {ITEM_OUT} ({n_items} new items + 1 anchor update)")
