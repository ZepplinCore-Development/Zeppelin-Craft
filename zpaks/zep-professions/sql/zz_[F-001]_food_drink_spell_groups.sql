-- ============================================================================
-- FOOD & DRINK SPELL GROUPS (F-001)
-- ============================================================================
-- Changing SpellFamilyName from GENERIC (0) to 14 for cooking pot modifiers
-- broke the hardcoded C++ food/drink exclusivity in LoadSpellSpecific(), which
-- only fires under case SPELLFAMILY_GENERIC. This caused food and drink regen
-- buffs to stack instead of replacing each other.
--
-- Fix: add all food regen spells to spell_group 2033 (EXCLUSIVE) and all
-- drink regen spells to spell_group 2034 (EXCLUSIVE). Same approach used for
-- scroll exclusivity (F-015, groups 1119/1120).
--
-- Spells sourced from: spell_class_set=14 + mask 4096 (food) / 8192 (drink),
-- plus family-0 spells with NOT_SEATED flag and food/drink aura types.
-- ============================================================================

-- Cleanup
DELETE FROM `spell_group` WHERE `id` IN (2033, 2034);
DELETE FROM `spell_group_stack_rules` WHERE `group_id` IN (2033, 2034);

-- ============================================================================
-- Group 2033: Food Regen (EXCLUSIVE)
-- Spells with SPELL_AURA_MOD_REGEN (84) or SPELL_AURA_OBS_MOD_HEALTH (23)
-- that provide food regeneration while seated.
-- ============================================================================
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
-- Family 14 food spells (spell_class_mask_1 & 4096)
(2033, 433),    -- Food (Rank 1)
(2033, 434),    -- Food
(2033, 435),    -- Food
(2033, 1127),   -- Food (Rank 2)
(2033, 1129),   -- Food (Rank 3)
(2033, 1131),   -- Food (Rank 4)
(2033, 2639),   -- Food
(2033, 5004),   -- Food
(2033, 5005),   -- Food
(2033, 5006),   -- Food
(2033, 5007),   -- Food
(2033, 6410),   -- Food
(2033, 7737),   -- Food
(2033, 10256),  -- Food (Rank 5)
(2033, 10257),  -- Food (Rank 6)
(2033, 18229),  -- Food
(2033, 18230),  -- Food
(2033, 18231),  -- Food
(2033, 18232),  -- Food
(2033, 18233),  -- Food
(2033, 18234),  -- Food
(2033, 22731),  -- Food
(2033, 24800),  -- Food
(2033, 25660),  -- Food
(2033, 25695),  -- Food
(2033, 25700),  -- Food
(2033, 25702),  -- Food
(2033, 25886),  -- Food
(2033, 25888),  -- Food
(2033, 26260),  -- Food
(2033, 26401),  -- Food
(2033, 26472),  -- Food
(2033, 26474),  -- Food
(2033, 27094),  -- Food
(2033, 28616),  -- Food
(2033, 29008),  -- Food
(2033, 29073),  -- Food
(2033, 32112),  -- Food
(2033, 33253),  -- Food
(2033, 33255),  -- Food
(2033, 33258),  -- Food
(2033, 33260),  -- Food
(2033, 33262),  -- Food
(2033, 33264),  -- Food
(2033, 33266),  -- Food
(2033, 33269),  -- Food
(2033, 33725),  -- Food
(2033, 33773),  -- Food
(2033, 35270),  -- Food
(2033, 35271),  -- Food
(2033, 40543),  -- Food
(2033, 40745),  -- Food
(2033, 40768),  -- Food
(2033, 41030),  -- Food
(2033, 42311),  -- Food
(2033, 43180),  -- Food
(2033, 43763),  -- Food
(2033, 45548),  -- Food
(2033, 45618),  -- Food
(2033, 46683),  -- Food
(2033, 46812),  -- Food
(2033, 46898),  -- Food
(2033, 48720),  -- Food
(2033, 53283),  -- Food
(2033, 57649),  -- Food
(2033, 58886),  -- Food
(2033, 61829),  -- Food
(2033, 64056),  -- Food
(2033, 64345),  -- Food
(2033, 64355),  -- Food
(2033, 65418),  -- Food
(2033, 65419),  -- Food
(2033, 65420),  -- Food
(2033, 65421),  -- Food
(2033, 65422),  -- Food
(2033, 66478),  -- Food
-- Family 0 food-aura spells (Refreshment, holiday food, etc.)
(2033, 9177),   -- Tigule and Foror's Strawberry Ice Cream
(2033, 18124),  -- Blessed Sunfruit
(2033, 21149),  -- Egg Nog
(2033, 25697),  -- Old Enriched Manna Biscuit
(2033, 25703),  -- Brain Food
(2033, 25889),  -- Brain Food
(2033, 26030),  -- Windblossom Berries
(2033, 29038),  -- Fizzy Energy Drink
(2033, 29039),  -- Fizzy Energy Drink
(2033, 42207),  -- Enriched Terocone Juice
(2033, 43777),  -- Food
(2033, 44107),  -- Brewfest Drink
(2033, 44109),  -- Brewfest Drink
(2033, 44110),  -- Brewfest Drink
(2033, 44111),  -- Brewfest Drink
(2033, 44112),  -- Brewfest Drink
(2033, 44113),  -- Brewfest Drink
(2033, 44114),  -- Brewfest Drink
(2033, 44115),  -- Brewfest Drink
(2033, 44116),  -- Brewfest Drink
(2033, 45019),  -- Holiday Drink
(2033, 45020),  -- Holiday Drink
(2033, 53373),  -- Thunderbrew's Hard Ale
(2033, 57069),  -- Copy of Food
(2033, 57084),  -- Copy of Food
(2033, 57085),  -- Refreshment
(2033, 57096),  -- Refreshment
(2033, 57098),  -- Refreshment
(2033, 57101),  -- Refreshment
(2033, 57106),  -- Refreshment
(2033, 57110),  -- Refreshment
(2033, 57138),  -- Refreshment
(2033, 57285),  -- Refreshment
(2033, 57287),  -- Refreshment
(2033, 57289),  -- Refreshment
(2033, 57292),  -- Refreshment
(2033, 57324),  -- Refreshment
(2033, 57326),  -- Refreshment
(2033, 57328),  -- Refreshment
(2033, 57331),  -- Refreshment
(2033, 57333),  -- Refreshment
(2033, 57335),  -- Refreshment
(2033, 57338),  -- Refreshment
(2033, 57341),  -- Refreshment
(2033, 57343),  -- Refreshment
(2033, 57344),  -- Refreshment
(2033, 57354),  -- Refreshment
(2033, 57355),  -- Refreshment
(2033, 57357),  -- Refreshment
(2033, 57359),  -- Refreshment
(2033, 57362),  -- Refreshment
(2033, 57364),  -- Refreshment
(2033, 57366),  -- Refreshment
(2033, 57370),  -- Refreshment
(2033, 57372),  -- Refreshment
(2033, 57398),  -- Refreshment
(2033, 58067),  -- Refreshment
(2033, 58467),  -- Refreshment
(2033, 58477),  -- Refreshment
(2033, 58503),  -- Refreshment
(2033, 59227),  -- Refreshment
(2033, 62351),  -- Refreshment
(2033, 65363),  -- Brewfest Drink
(2033, 66622),  -- Refreshment
(2033, 69560),  -- Brewfest Drink
(2033, 69561);  -- Brewfest Drink

-- ============================================================================
-- Group 2034: Drink Regen (EXCLUSIVE)
-- Spells with SPELL_AURA_MOD_POWER_REGEN (85) or SPELL_AURA_OBS_MOD_POWER (21)
-- that provide drink regeneration while seated.
-- ============================================================================
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
-- Family 14 drink spells (spell_class_mask_1 & 8192)
(2034, 430),    -- Drink (Rank 1)
(2034, 431),    -- Drink
(2034, 432),    -- Drink
(2034, 1133),   -- Drink (Rank 2)
(2034, 1135),   -- Drink (Rank 3)
(2034, 1137),   -- Drink (Rank 4)
(2034, 10250),  -- Drink (Rank 5)
(2034, 22734),  -- Drink
(2034, 24355),  -- Drink
(2034, 25696),  -- Drink
(2034, 26261),  -- Drink
(2034, 26402),  -- Drink
(2034, 26473),  -- Drink
(2034, 26475),  -- Drink
(2034, 27089),  -- Drink (Rank 6)
(2034, 29007),  -- Drink
(2034, 30024),  -- Drink
(2034, 34291),  -- Drink (Rank 7)
(2034, 43154),  -- Drink
(2034, 43155),  -- Drink
(2034, 43182),  -- Drink
(2034, 43183),  -- Drink
(2034, 43706),  -- Drink
(2034, 46755),  -- Drink
(2034, 52911),  -- Drink
(2034, 57073),  -- Drink
(2034, 61830),  -- Drink
(2034, 64356),  -- Drink
(2034, 66041),  -- Drink
(2034, 72623),  -- Drink
-- Family 0 drink-aura spells (Brain Food, holiday drinks, etc.)
(2034, 833),    -- Green Tea
(2034, 18140),  -- Blessed Sunfruit Juice
(2034, 23698),  -- Alterac Spring Water
(2034, 24707),  -- Food
(2034, 25697),  -- Old Enriched Manna Biscuit
(2034, 25701),  -- Brain Food
(2034, 25703),  -- Brain Food
(2034, 25887),  -- Brain Food
(2034, 25889),  -- Brain Food
(2034, 25990),  -- Graccu's Mince Meat Fruitcake
(2034, 26263),  -- Dim Sum
(2034, 29039),  -- Fizzy Energy Drink
(2034, 29055),  -- Refreshing Red Apple
(2034, 33774),  -- Underspore Pod
(2034, 42308),  -- Brain Food
(2034, 42312),  -- Brain Food
(2034, 44107),  -- Brewfest Drink
(2034, 44109),  -- Brewfest Drink
(2034, 44110),  -- Brewfest Drink
(2034, 44111),  -- Brewfest Drink
(2034, 44112),  -- Brewfest Drink
(2034, 44113),  -- Brewfest Drink
(2034, 44114),  -- Brewfest Drink
(2034, 44115),  -- Brewfest Drink
(2034, 44116),  -- Brewfest Drink
(2034, 45019),  -- Holiday Drink
(2034, 45020),  -- Holiday Drink
(2034, 49472),  -- Drink Coffee
(2034, 53373),  -- Thunderbrew's Hard Ale
(2034, 56439),  -- TEST FRUITCAKE DO NOT LOCALIZE
(2034, 65363),  -- Brewfest Drink
(2034, 69560),  -- Brewfest Drink
(2034, 69561);  -- Brewfest Drink

-- ============================================================================
-- Stack Rules: EXCLUSIVE (1) - only one food regen and one drink regen at a time
-- ============================================================================
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(2033, 1, 'Food Regen - exclusive'),
(2034, 1, 'Drink Regen - exclusive');
