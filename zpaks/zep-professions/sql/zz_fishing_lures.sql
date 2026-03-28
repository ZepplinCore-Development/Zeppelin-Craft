-- =============================================================================
-- F-157: Fishing Lures - Consumable Buff Conversion
-- =============================================================================
-- Converts lure items from temporary weapon enchants to consumable self-buffs.
-- Right-click lure -> gain timed +fishing skill aura, item consumed.
--
-- Spell group 1135 ensures only the highest lure buff applies (EXCLUSIVE +
-- rank priority via spell_ranks). Lure buffs stack with rod buffs (group 1129)
-- since they are separate groups.
--
-- Lure items keep class/subclass, just swap spellid_1 to the new buff spell.
-- =============================================================================

-- Update lure items: replace enchant spell with direct buff spell
-- spelltrigger_1=0 (ON_USE) and spellcharges_1=-1 (consumed) stay the same

-- Shiny Bauble: +25 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900350 WHERE `entry` = 6529;

-- Nightcrawlers: +50 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900351 WHERE `entry` = 6530;

-- Bright Baubles: +75 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900352 WHERE `entry` = 6532;

-- Aquadynamic Fish Attractor: +100 fishing, 5 min
UPDATE `item_template` SET `spellid_1` = 900353 WHERE `entry` = 6533;

-- Aquadynamic Fish Lens: +50 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900351 WHERE `entry` = 6811;

-- Flesh Eating Worm: +75 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900352 WHERE `entry` = 7307;

-- Sharpened Fish Hook: +100 fishing, 10 min
UPDATE `item_template` SET `spellid_1` = 900354 WHERE `entry` = 34861;

-- Glow Worm: +100 fishing, 60 min
UPDATE `item_template` SET `spellid_1` = 900355 WHERE `entry` = 46006;

-- =============================================================================
-- SPELL GROUP 1135 - Lure buff exclusivity (EXCLUSIVE + rank-aware)
-- =============================================================================

DELETE FROM `spell_group` WHERE `id` = 1135;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1135;
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 900350;

-- Only first rank needed; AC auto-includes higher ranks via spell_ranks
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1135, 900350);

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1135, 1, 'Fishing Lures - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(900350, 900350, 1),  -- +25 fishing (10 min)
(900350, 900351, 2),  -- +50 fishing (10 min)
(900350, 900352, 3),  -- +75 fishing (10 min)
(900350, 900353, 4),  -- +100 fishing (5 min)
(900350, 900354, 5),  -- +100 fishing (10 min)
(900350, 900355, 6);  -- +100 fishing (60 min)
