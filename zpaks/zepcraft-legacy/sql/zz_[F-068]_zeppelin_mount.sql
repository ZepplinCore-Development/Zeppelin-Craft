-- Butt Zeppelin Creature Entry
DELETE FROM `creature_template` WHERE (`entry` = 9102598);
INSERT INTO `creature_template` SET
    `entry` = 9102598,
    `name` = 'Butt Zeppelin',
    `faction` = 35, -- Friendly
    `type` = 1, -- Beast
    `unit_class` = 1, -- Warrior
    `unit_flags2` = 2048; -- Regen power

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102598;
INSERT INTO `creature_template_model` SET
    `CreatureID` = '9102598',
    `idx` = 1,
    `CreatureDisplayID` = '39098',
    `probability` = 1.0;

-- Butt Zeppelin Item Entry
DELETE FROM `item_template` WHERE (`entry` = 58101);
INSERT INTO `item_template`
SET `entry` = 58101,
    `class` = 15,
    `name` = 'Butt Zeppelin',
    `description` = 'Teaches you how to summon this mount.',
    `displayid` = 134240,
    `Quality` = 3,
    `Flags` = 32768, -- No Diesenchant
    `bonding` = 1, -- BOP
    `ItemLevel` = 20,
    `RequiredLevel` = 10,
    `spellid_1` = 55884,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellcategory_1` = 330,
    `spellcategorycooldown_1` = 3000,
    `spellid_2` = 91071,
    `spelltrigger_2` = 6;