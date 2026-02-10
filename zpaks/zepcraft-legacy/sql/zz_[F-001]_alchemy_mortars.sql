-- F-027: Alchemy Mortar Items
-- Item IDs: 56900-56903 (Alchemy range)
-- spelltrigger_1 = 5 (ON_NO_DELAY_USE - triggers when in inventory)

DELETE FROM item_template WHERE entry BETWEEN 56900 AND 56903;


INSERT INTO `item_template` SET
    `entry` = 56900,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Journeyman Alchemy Mortar',
    `displayid` = 134392,
    `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91200,
    `spelltrigger_1` = 5,
    `description` = '';

INSERT INTO `item_template` SET
    `entry` = 56901,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Artisan Alchemy Mortar',
    `displayid` = 138688,
    `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91201,
    `spelltrigger_1` = 5,
    `description` = '';

INSERT INTO `item_template` SET
    `entry` = 56902,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Master Alchemy Mortar',
    `displayid` = 138689,
    `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91202,
    `spelltrigger_1` = 5,
    `description` = '';

INSERT INTO `item_template` SET
    `entry` = 56903,
    `class` = 5,
    `subclass` = 1,
    `name` = 'Grand Master Alchemy Mortar',
    `displayid` = 138690,
    `Quality` = 6,
    `bonding` = 1,
    `spellid_1` = 91203,
    `spelltrigger_1` = 5,
    `description` = '';



-- Spell Group 1122: Alchemy Mortars (EXCLUSIVE + rank-aware patch)
-- EXCLUSIVE (1) prevents stacking. Core patch uses spell_ranks to allow
-- higher-rank spells to replace lower-rank ones via IsHighRankOf check.
DELETE FROM spell_group WHERE id = 1122;
DELETE FROM spell_group_stack_rules WHERE group_id = 1122;
DELETE FROM spell_ranks WHERE first_spell_id = 91200;

INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1122, 91200),
(1122, 91201),
(1122, 91202),
(1122, 91203);

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1122, 1, 'Alchemy Mortars - exclusive with rank priority');

INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
(91200, 91200, 1),
(91200, 91201, 2),
(91200, 91202, 3),
(91200, 91203, 4);


