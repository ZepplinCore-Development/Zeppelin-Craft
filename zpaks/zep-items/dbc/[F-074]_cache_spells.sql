-- F-074 Cache opening spells (clam pattern — SPELL_EFFECT_CREATE_RANDOM_ITEM)
--
-- Transitions cache opening from ITEM_FLAG_HAS_LOOT to spell-based loot
-- generation. The HAS_LOOT path destroyed the entire source slot on first
-- open — opening a stack of 2 caches consumed both but only awarded one
-- loot pool. Spell-based opening via Player::CastItemUseSpell correctly
-- decrements the stack by 1 each cast.
--
-- Effect 59 = SPELL_EFFECT_CREATE_RANDOM_ITEM: calls
--   player->AutoStoreLoot(spell.Id, LootTemplates_Spell)
-- which reads `spell_loot_template` keyed by spell ID. Each cache spell
-- has a mirror of the existing item_loot_template (class-conditional refs
-- 9100401-9100418 unchanged — they work the same from either path).
--
-- Spell IDs (custom 900xxx range, free per audit 2026-05-30):
--   900600 Open Azeroth Heroic Armor Cache  → on item 66200
--   900601 Open Azeroth Heroic Weapon Cache → on item 66201
--   900602 Open Azeroth Mythic Armor Cache  → on item 66202
--   900603 Open Azeroth Mythic Weapon Cache → on item 66203
--
-- Attributes mirror stock clam (58172): self-target, instant cast,
-- works on any equipped item class.

DELETE FROM `spell` WHERE `id` = 900600;
INSERT INTO `spell` SET
    `id` = 900600,
    `attributes` = 150994944,
    `attributes_ex_1` = 1056,
    `attributes_ex_2` = 16384,
    `attributes_ex_6` = 4096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 59,
    `effect_implicit_target_a_1` = 1,
    `effect_die_sides_1` = 1,
    `spell_icon_id` = 349,
    `spell_name_enus` = 'Open Azeroth Heroic Armor Cache',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Open the cache!',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

DELETE FROM `spell` WHERE `id` = 900601;
INSERT INTO `spell` SET
    `id` = 900601,
    `attributes` = 150994944,
    `attributes_ex_1` = 1056,
    `attributes_ex_2` = 16384,
    `attributes_ex_6` = 4096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 59,
    `effect_implicit_target_a_1` = 1,
    `effect_die_sides_1` = 1,
    `spell_icon_id` = 349,
    `spell_name_enus` = 'Open Azeroth Heroic Weapon Cache',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Open the cache!',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

DELETE FROM `spell` WHERE `id` = 900602;
INSERT INTO `spell` SET
    `id` = 900602,
    `attributes` = 150994944,
    `attributes_ex_1` = 1056,
    `attributes_ex_2` = 16384,
    `attributes_ex_6` = 4096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 59,
    `effect_implicit_target_a_1` = 1,
    `effect_die_sides_1` = 1,
    `spell_icon_id` = 349,
    `spell_name_enus` = 'Open Azeroth Mythic Armor Cache',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Open the cache!',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;

DELETE FROM `spell` WHERE `id` = 900603;
INSERT INTO `spell` SET
    `id` = 900603,
    `attributes` = 150994944,
    `attributes_ex_1` = 1056,
    `attributes_ex_2` = 16384,
    `attributes_ex_6` = 4096,
    `cast_time_index` = 1,
    `range_index` = 1,
    `equipped_item_class` = -1,
    `effect_1` = 59,
    `effect_implicit_target_a_1` = 1,
    `effect_die_sides_1` = 1,
    `spell_icon_id` = 349,
    `spell_name_enus` = 'Open Azeroth Mythic Weapon Cache',
    `spell_name_flags` = 16712190,
    `spell_subtext_flags` = 16712188,
    `spell_desc_enus` = 'Open the cache!',
    `spell_desc_flags` = 16712190,
    `spell_tooltip_flags` = 16712188,
    `effect_damage_multiplier_1` = 1.0,
    `effect_bonus_multiplier_1` = 1.0,
    `effect_bonus_multiplier_2` = 1.0,
    `effect_bonus_multiplier_3` = 1.0;
