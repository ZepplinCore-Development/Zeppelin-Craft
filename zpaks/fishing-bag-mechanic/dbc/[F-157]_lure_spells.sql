-- =============================================================================
-- F-157: Lure Buff Spells
-- =============================================================================
-- Timed fishing skill buffs for lure consumables. Modelled on existing rod buff
-- spells (e.g. 7823 "Fishing Skill +5") but with finite durations.
-- Spell group 1131 ensures only the highest lure buff applies at any time.
-- These stack with rod buffs (spell group 1129) since they are separate groups.
--
-- Tier 1 (+25, 10 min): Shiny Bauble (6529)
-- Tier 2 (+50, 10 min): Nightcrawlers (6530), Aquadynamic Fish Lens (6811)
-- Tier 3 (+75, 10 min): Bright Baubles (6532), Flesh Eating Worm (7307)
-- Tier 4 (+100, 5 min): Aquadynamic Fish Attractor (6533)
-- Tier 5 (+100, 10 min): Sharpened Fish Hook (34861)
-- Tier 6 (+100, 60 min): Glow Worm (46006)
-- =============================================================================

-- Template reference (consumable buff pattern, e.g. 17538 "Elixir of the Mongoose"):
--   effect_1=6 (APPLY_AURA), effect_apply_aura_name_1=30 (MOD_SKILL),
--   effect_die_sides_1=1, effect_misc_value_a_1=356 (Fishing),
--   effect_implicit_target_a_1=1 (SELF), attributes=671088640 (castable consumable),
--   spell_icon_id=287, cast_time_index=1, range_index=1
--
-- Duration indices: 5=300000ms (5 min), 6=600000ms (10 min), 42=3600000ms (60 min)

DELETE FROM spell WHERE id BETWEEN 900350 AND 900355;

-- Lure Buff +25 Fishing (10 min)
INSERT INTO spell SET
  id = 900350,
  spell_name_enus = 'Lure Buff +25',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 24,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 6,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;

-- Lure Buff +50 Fishing (10 min)
INSERT INTO spell SET
  id = 900351,
  spell_name_enus = 'Lure Buff +50',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 49,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 6,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;

-- Lure Buff +75 Fishing (10 min)
INSERT INTO spell SET
  id = 900352,
  spell_name_enus = 'Lure Buff +75',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 74,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 6,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;

-- Lure Buff +100 Fishing (5 min)
INSERT INTO spell SET
  id = 900353,
  spell_name_enus = 'Lure Buff +100',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 99,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 5,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;

-- Lure Buff +100 Fishing (10 min)
INSERT INTO spell SET
  id = 900354,
  spell_name_enus = 'Lure Buff +100',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 99,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 6,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;

-- Lure Buff +100 Fishing (60 min)
INSERT INTO spell SET
  id = 900355,
  spell_name_enus = 'Lure Buff +100',
  spell_desc_enus = 'Fishing skill increased by $s1.',
  effect_1 = 6,
  effect_apply_aura_name_1 = 30,
  effect_base_points_1 = 99,
  effect_die_sides_1 = 1,
  effect_misc_value_a_1 = 356,
  effect_implicit_target_a_1 = 1,
  equipped_item_class = -1,
  duration_index = 42,
  attributes = 671088640,
  spell_icon_id = 287,
  category = 0,
  cast_time_index = 1,
  range_index = 1;
