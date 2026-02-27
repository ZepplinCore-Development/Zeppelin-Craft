-- =============================================================================
-- Enchanting Rods - Cast Time Reduction Buffs
-- =============================================================================
-- Upgrades 10 existing Enchanting Rods to Artifact quality with passive
-- cast time reduction buffs for Enchanting recipes and Disenchant.
-- 15-60% reduction in 5% increments (Copper through Titanium).
-- =============================================================================

-- Runed Copper Rod (15% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91222,
    `spelltrigger_1` = 5
WHERE (`entry` = 6218);

-- Runed Silver Rod (20% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91223,
    `spelltrigger_1` = 5
WHERE (`entry` = 6339);

-- Runed Golden Rod (25% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91224,
    `spelltrigger_1` = 5
WHERE (`entry` = 11130);

-- Runed Truesilver Rod (30% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91225,
    `spelltrigger_1` = 5
WHERE (`entry` = 11145);

-- Runed Arcanite Rod (35% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91226,
    `spelltrigger_1` = 5
WHERE (`entry` = 16207);

-- Runed Fel Iron Rod (40% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91227,
    `spelltrigger_1` = 5
WHERE (`entry` = 22461);

-- Runed Adamantite Rod (45% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91228,
    `spelltrigger_1` = 5
WHERE (`entry` = 22462);

-- Runed Eternium Rod (50% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91229,
    `spelltrigger_1` = 5
WHERE (`entry` = 22463);

-- Runed Cobalt Rod (55% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91230,
    `spelltrigger_1` = 5
WHERE (`entry` = 44451);

-- Runed Titanium Rod (60% reduction)
UPDATE `item_template`
SET `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91231,
    `spelltrigger_1` = 5
WHERE (`entry` = 44452);

-- =============================================================================
-- SPELL GROUP - Enchanting Rod exclusivity (EXCLUSIVE + rank-aware)
-- =============================================================================
DELETE FROM `spell_group` WHERE `id` = 1127;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1127;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 91222;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1127, 91222); -- Runed Copper Rod (first rank)

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1127, 1, 'Enchanting Rods - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91222, 91222, 1),
(91222, 91223, 2),
(91222, 91224, 3),
(91222, 91225, 4),
(91222, 91226, 5),
(91222, 91227, 6),
(91222, 91228, 7),
(91222, 91229, 8),
(91222, 91230, 9),
(91222, 91231, 10);
