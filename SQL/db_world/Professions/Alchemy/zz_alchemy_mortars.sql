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
    `description` = 'Reduces alchemy crafting time by 15% and increases potion effectiveness by 10%.';

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
    `description` = 'Reduces alchemy crafting time by 30% and increases potion effectiveness by 15%.';

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
    `description` = 'Reduces alchemy crafting time by 45% and increases potion effectiveness by 20%.';

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
    `description` = 'Reduces alchemy crafting time by 60% and increases potion effectiveness by 25%.';



-- Spell Group 1122: Alchemy Mortars (anti-stacking)
-- Priority now handled via spell_group_stack_rules (special_flag column removed from spell_group)
DELETE FROM spell_group WHERE id = 1122;

INSERT INTO `spell_group` SET
    `id` = 1122,
    `spell_id` = 91200;

INSERT INTO `spell_group` SET
    `id` = 1122,
    `spell_id` = 91201;

INSERT INTO `spell_group` SET
    `id` = 1122,
    `spell_id` = 91202;

INSERT INTO `spell_group` SET
    `id` = 1122,
    `spell_id` = 91203;



DELETE FROM spell_group_stack_rules WHERE group_id = 1122;

INSERT INTO `spell_group_stack_rules` SET
    `group_id` = 1122,
    `stack_rule` = 8,
    `description` = 'Group of Alchemy Mortars - never stack';


