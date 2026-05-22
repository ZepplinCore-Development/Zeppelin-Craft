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
"""

import json
import re
from pathlib import Path

# Resolve project root from this file's location (cli/lib/item/relic_generator.py)
PROJECT_ROOT = Path(__file__).resolve().parents[3]
DATA = PROJECT_ROOT / "cli" / "lib" / "item" / "data" / "relic_effects.json"
DBC_OUT = PROJECT_ROOT / "zpaks" / "zep-items" / "dbc" / "[F-028]_spell.sql"
ITEM_OUT = PROJECT_ROOT / "zpaks" / "zep-items" / "sql" / "zz_[F-028]_low_level_relics.sql"


# -- Per-class lookups ---------------------------------------------------------

ALLOWABLE_CLASS = {"paladin": 2, "shaman": 64, "druid": 1024}
SUBCLASS = {"paladin": 7, "druid": 8, "shaman": 9}  # Libram / Idol / Totem
TOTEM_CATEGORY = {"shaman": 21, "druid": 0, "paladin": 0}

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
}

EFFECT_DESC_TPL = {
    "spell_power_damage":   "Increases spell power of {target} by $s1.",
    "spell_power_heal":     "Increases spell power of {target} by $s1.",
    "mana_cost_reduction":  "Reduces the mana cost of your {target} by $s1.",
    "ability_damage_bonus": "Increases the damage dealt by your {target} by $s1.",
    "cooldown_reduction":   "Reduces the cooldown of your {target} by $/60000;s1 minutes.",
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
    raise ValueError(f"unknown effect: {effect}")


# -- Target mask resolution ----------------------------------------------------

def resolve_target_mask(target_str: str, cls: str, class_spells: dict) -> tuple[int, int, str]:
    """Returns (mask_a_1, mask_a_2, display_target).

    Handles three forms:
      - "Earth Shock + Flame Shock + Frost Shock (mask 2416967680)"  -> explicit mask
      - "Maul + Swipe (Bear)"                                          -> OR of component masks
      - "Holy Light"                                                    -> single-spell lookup
    """
    m = re.search(r"\(mask (\d+)", target_str)
    if m:
        explicit_mask = int(m.group(1))
        display = re.sub(r"\s*\(mask[^)]*\).*", "", target_str).strip()
        return explicit_mask, 0, display

    if " + " in target_str:
        parts = [p.strip() for p in target_str.split(" + ")]
        m1, m2 = 0, 0
        for p in parts:
            sp = class_spells[cls].get(p)
            if sp:
                m1 |= sp["mask_1"]
                m2 |= sp["mask_2"]
        return m1, m2, target_str.replace(" + ", " and ")

    sp = class_spells[cls].get(target_str)
    if not sp:
        raise ValueError(f"Spell '{target_str}' not in {cls} class_spells")
    return sp["mask_1"], sp["mask_2"], target_str


# -- SQL helpers ---------------------------------------------------------------

def sql_escape(s: str) -> str:
    return s.replace("'", "''")


def gen_spell(entry: dict, class_set_dbc: dict, class_spells: dict) -> str:
    cls = entry["class"]
    eff = entry["effect"]
    sid = entry["spell_id"]
    ilvl = entry["ilvl"]
    name = entry["name_hint"]
    mask1, mask2, display_target = resolve_target_mask(entry["target"], cls, class_spells)
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
    allow = ALLOWABLE_CLASS[cls]
    totcat = TOTEM_CATEGORY[cls]
    sell = ilvl * 100
    buy = sell * 5
    # Quality: req_level < 30 → green (2), req_level >= 30 → rare/blue (3)
    quality = 2 if req < 30 else 3
    desc = f"A {cls} relic, dropped in {entry['dungeon']}."

    return f"""DELETE FROM `item_template` WHERE `entry` = {eid};
INSERT INTO `item_template` SET
    `entry` = {eid},
    `class` = 4,
    `subclass` = {sub},
    `SoundOverrideSubclass` = -1,
    `name` = '{sql_escape(name)}',
    `displayid` = {disp},
    `Quality` = {quality},
    `Flags` = 0,
    `FlagsExtra` = 0,
    `BuyCount` = 1,
    `BuyPrice` = {buy},
    `SellPrice` = {sell},
    `InventoryType` = 28,
    `AllowableClass` = {allow},
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
    `description` = '{sql_escape(desc)}',
    `Material` = 2,
    `sheath` = 0,
    `TotemCategory` = {totcat},
    `RequiredDisenchantSkill` = 200;
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
UPDATE `item_template` SET
    `Quality` = 2,
    `spellid_1` = 900356,
    `spelltrigger_1` = 1,
    `spellcharges_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1
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
    n_spells, n_items = build()
    print(f"DBC: {DBC_OUT}  ({n_spells} new spells + 1 anchor)")
    print(f"SQL: {ITEM_OUT} ({n_items} new items + 1 anchor update)")
