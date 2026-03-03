-- ============================================================================
-- FOOD & DRINK SPELL GROUPS (F-001)
-- ============================================================================
-- Changing SpellFamilyName from GENERIC (0) to 14 for cooking pot modifiers
-- broke the hardcoded C++ food/drink exclusivity in LoadSpellSpecific(), which
-- only fires under case SPELLFAMILY_GENERIC. This caused food and drink regen
-- buffs to stack instead of replacing each other.
--
-- Fix: add all food regen spells to spell_group 1133 (EXCLUSIVE) and all
-- drink regen spells to spell_group 1134 (EXCLUSIVE). Same approach used for
-- scroll exclusivity (F-015, groups 1119/1120).
--
-- Spells sourced from: spell_class_set=14 + mask 4096 (food) / 8192 (drink),
-- plus family-0 spells with NOT_SEATED flag and food/drink aura types.
-- ============================================================================

-- Cleanup
DELETE FROM `spell_group` WHERE `id` IN (1133, 1134);
DELETE FROM `spell_group_stack_rules` WHERE `group_id` IN (1133, 1134);

-- ============================================================================
-- Group 1133: Food Regen (EXCLUSIVE)
-- Spells with SPELL_AURA_MOD_REGEN (84) or SPELL_AURA_OBS_MOD_HEALTH (23)
-- that provide food regeneration while seated.
-- ============================================================================
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
-- Family 14 food spells (spell_class_mask_1 & 4096)
(1133, 433),    -- Food (Rank 1)
(1133, 434),    -- Food
(1133, 435),    -- Food
(1133, 1127),   -- Food (Rank 2)
(1133, 1129),   -- Food (Rank 3)
(1133, 1131),   -- Food (Rank 4)
(1133, 2639),   -- Food
(1133, 5004),   -- Food
(1133, 5005),   -- Food
(1133, 5006),   -- Food
(1133, 5007),   -- Food
(1133, 6410),   -- Food
(1133, 7737),   -- Food
(1133, 10256),  -- Food (Rank 5)
(1133, 10257),  -- Food (Rank 6)
(1133, 18229),  -- Food
(1133, 18230),  -- Food
(1133, 18231),  -- Food
(1133, 18232),  -- Food
(1133, 18233),  -- Food
(1133, 18234),  -- Food
(1133, 22731),  -- Food
(1133, 24800),  -- Food
(1133, 25660),  -- Food
(1133, 25695),  -- Food
(1133, 25700),  -- Food
(1133, 25702),  -- Food
(1133, 25886),  -- Food
(1133, 25888),  -- Food
(1133, 26260),  -- Food
(1133, 26401),  -- Food
(1133, 26472),  -- Food
(1133, 26474),  -- Food
(1133, 27094),  -- Food
(1133, 28616),  -- Food
(1133, 29008),  -- Food
(1133, 29073),  -- Food
(1133, 32112),  -- Food
(1133, 33253),  -- Food
(1133, 33255),  -- Food
(1133, 33258),  -- Food
(1133, 33260),  -- Food
(1133, 33262),  -- Food
(1133, 33264),  -- Food
(1133, 33266),  -- Food
(1133, 33269),  -- Food
(1133, 33725),  -- Food
(1133, 33773),  -- Food
(1133, 35270),  -- Food
(1133, 35271),  -- Food
(1133, 40543),  -- Food
(1133, 40745),  -- Food
(1133, 40768),  -- Food
(1133, 41030),  -- Food
(1133, 42311),  -- Food
(1133, 43180),  -- Food
(1133, 43763),  -- Food
(1133, 45548),  -- Food
(1133, 45618),  -- Food
(1133, 46683),  -- Food
(1133, 46812),  -- Food
(1133, 46898),  -- Food
(1133, 48720),  -- Food
(1133, 53283),  -- Food
(1133, 57649),  -- Food
(1133, 58886),  -- Food
(1133, 61829),  -- Food
(1133, 64056),  -- Food
(1133, 64345),  -- Food
(1133, 64355),  -- Food
(1133, 65418),  -- Food
(1133, 65419),  -- Food
(1133, 65420),  -- Food
(1133, 65421),  -- Food
(1133, 65422),  -- Food
(1133, 66478),  -- Food
-- Family 0 food-aura spells (Refreshment, holiday food, etc.)
(1133, 9177),   -- Tigule and Foror's Strawberry Ice Cream
(1133, 18124),  -- Blessed Sunfruit
(1133, 21149),  -- Egg Nog
(1133, 25697),  -- Old Enriched Manna Biscuit
(1133, 25703),  -- Brain Food
(1133, 25889),  -- Brain Food
(1133, 26030),  -- Windblossom Berries
(1133, 29038),  -- Fizzy Energy Drink
(1133, 29039),  -- Fizzy Energy Drink
(1133, 42207),  -- Enriched Terocone Juice
(1133, 43777),  -- Food
(1133, 44107),  -- Brewfest Drink
(1133, 44109),  -- Brewfest Drink
(1133, 44110),  -- Brewfest Drink
(1133, 44111),  -- Brewfest Drink
(1133, 44112),  -- Brewfest Drink
(1133, 44113),  -- Brewfest Drink
(1133, 44114),  -- Brewfest Drink
(1133, 44115),  -- Brewfest Drink
(1133, 44116),  -- Brewfest Drink
(1133, 45019),  -- Holiday Drink
(1133, 45020),  -- Holiday Drink
(1133, 53373),  -- Thunderbrew's Hard Ale
(1133, 57069),  -- Copy of Food
(1133, 57084),  -- Copy of Food
(1133, 57085),  -- Refreshment
(1133, 57096),  -- Refreshment
(1133, 57098),  -- Refreshment
(1133, 57101),  -- Refreshment
(1133, 57106),  -- Refreshment
(1133, 57110),  -- Refreshment
(1133, 57138),  -- Refreshment
(1133, 57285),  -- Refreshment
(1133, 57287),  -- Refreshment
(1133, 57289),  -- Refreshment
(1133, 57292),  -- Refreshment
(1133, 57324),  -- Refreshment
(1133, 57326),  -- Refreshment
(1133, 57328),  -- Refreshment
(1133, 57331),  -- Refreshment
(1133, 57333),  -- Refreshment
(1133, 57335),  -- Refreshment
(1133, 57338),  -- Refreshment
(1133, 57341),  -- Refreshment
(1133, 57343),  -- Refreshment
(1133, 57344),  -- Refreshment
(1133, 57354),  -- Refreshment
(1133, 57355),  -- Refreshment
(1133, 57357),  -- Refreshment
(1133, 57359),  -- Refreshment
(1133, 57362),  -- Refreshment
(1133, 57364),  -- Refreshment
(1133, 57366),  -- Refreshment
(1133, 57370),  -- Refreshment
(1133, 57372),  -- Refreshment
(1133, 57398),  -- Refreshment
(1133, 58067),  -- Refreshment
(1133, 58467),  -- Refreshment
(1133, 58477),  -- Refreshment
(1133, 58503),  -- Refreshment
(1133, 59227),  -- Refreshment
(1133, 62351),  -- Refreshment
(1133, 65363),  -- Brewfest Drink
(1133, 66622),  -- Refreshment
(1133, 69560),  -- Brewfest Drink
(1133, 69561);  -- Brewfest Drink

-- ============================================================================
-- Group 1134: Drink Regen (EXCLUSIVE)
-- Spells with SPELL_AURA_MOD_POWER_REGEN (85) or SPELL_AURA_OBS_MOD_POWER (21)
-- that provide drink regeneration while seated.
-- ============================================================================
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
-- Family 14 drink spells (spell_class_mask_1 & 8192)
(1134, 430),    -- Drink (Rank 1)
(1134, 431),    -- Drink
(1134, 432),    -- Drink
(1134, 1133),   -- Drink (Rank 2)
(1134, 1135),   -- Drink (Rank 3)
(1134, 1137),   -- Drink (Rank 4)
(1134, 10250),  -- Drink (Rank 5)
(1134, 22734),  -- Drink
(1134, 24355),  -- Drink
(1134, 25696),  -- Drink
(1134, 26261),  -- Drink
(1134, 26402),  -- Drink
(1134, 26473),  -- Drink
(1134, 26475),  -- Drink
(1134, 27089),  -- Drink (Rank 6)
(1134, 29007),  -- Drink
(1134, 30024),  -- Drink
(1134, 34291),  -- Drink (Rank 7)
(1134, 43154),  -- Drink
(1134, 43155),  -- Drink
(1134, 43182),  -- Drink
(1134, 43183),  -- Drink
(1134, 43706),  -- Drink
(1134, 46755),  -- Drink
(1134, 52911),  -- Drink
(1134, 57073),  -- Drink
(1134, 61830),  -- Drink
(1134, 64356),  -- Drink
(1134, 66041),  -- Drink
(1134, 72623),  -- Drink
-- Family 0 drink-aura spells (Brain Food, holiday drinks, etc.)
(1134, 833),    -- Green Tea
(1134, 18140),  -- Blessed Sunfruit Juice
(1134, 23698),  -- Alterac Spring Water
(1134, 24707),  -- Food
(1134, 25697),  -- Old Enriched Manna Biscuit
(1134, 25701),  -- Brain Food
(1134, 25703),  -- Brain Food
(1134, 25887),  -- Brain Food
(1134, 25889),  -- Brain Food
(1134, 25990),  -- Graccu's Mince Meat Fruitcake
(1134, 26263),  -- Dim Sum
(1134, 29039),  -- Fizzy Energy Drink
(1134, 29055),  -- Refreshing Red Apple
(1134, 33774),  -- Underspore Pod
(1134, 42308),  -- Brain Food
(1134, 42312),  -- Brain Food
(1134, 44107),  -- Brewfest Drink
(1134, 44109),  -- Brewfest Drink
(1134, 44110),  -- Brewfest Drink
(1134, 44111),  -- Brewfest Drink
(1134, 44112),  -- Brewfest Drink
(1134, 44113),  -- Brewfest Drink
(1134, 44114),  -- Brewfest Drink
(1134, 44115),  -- Brewfest Drink
(1134, 44116),  -- Brewfest Drink
(1134, 45019),  -- Holiday Drink
(1134, 45020),  -- Holiday Drink
(1134, 49472),  -- Drink Coffee
(1134, 53373),  -- Thunderbrew's Hard Ale
(1134, 56439),  -- TEST FRUITCAKE DO NOT LOCALIZE
(1134, 65363),  -- Brewfest Drink
(1134, 69560),  -- Brewfest Drink
(1134, 69561);  -- Brewfest Drink

-- ============================================================================
-- Stack Rules: EXCLUSIVE (1) - only one food regen and one drink regen at a time
-- ============================================================================
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1133, 1, 'Food Regen - exclusive'),
(1134, 1, 'Drink Regen - exclusive');
