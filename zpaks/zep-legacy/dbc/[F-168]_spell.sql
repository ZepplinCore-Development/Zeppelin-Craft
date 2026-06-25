


-- =====================================================
-- SECTION 4: DURATION STANDARDISATION
-- =====================================================
-- Standardise all food/drink durations to 30 seconds.
--
-- NOTE: Food (aura 84 = MOD_REGEN) and Drink (aura 85 = MOD_POWER_REGEN)
-- are NOT periodic auras — the server regen system handles them every 2 seconds
-- in Player::RegenerateHealth() and Player::Regenerate() respectively.
-- The DBC amplitude field is IGNORED for food, and only controls the initial
-- delay for the PERIODIC_DUMMY (aura 226) drink mechanism.
-- Base points are treated as "per 5 seconds" by the engine (divided by 5000ms),
-- so they must NOT be modified — only duration is standardised here.

-- ---------------------------------------------------
-- 4a: Food health regen — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_1` = 84
AND `aura_interrupt_flags` = 262272
AND `id` NOT IN (40543);  -- exclude joke food "does nothing"

-- ---------------------------------------------------
-- 4b: Drink mana regen — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_2` IN (85, 226)
AND `aura_interrupt_flags` = 262272;

-- ---------------------------------------------------
-- 4c: Brain food / Brewfest drinks (effect 1) — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_1` = 85
AND `aura_interrupt_flags` = 262272;