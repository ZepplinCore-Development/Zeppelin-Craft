-- Giant Murloc Creature Entry
DELETE FROM `creature_template` WHERE (`entry` = 9102597);
INSERT INTO `creature_template` SET
    `entry` = 9102597,
    `name` = 'Giant Murloc',
    `faction` = 35,
    `type` = 1,
    `unit_class` = 1,
    `unit_flags2` = 2048;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 9102597;
INSERT INTO `creature_template_model` SET
    `CreatureID` = 9102597,
    `idx` = 1,
    `CreatureDisplayID` = 39097,
    `probability` = 1.0;

DELETE FROM `creature_model_info` WHERE `DisplayID` = 39097;
INSERT INTO `creature_model_info` SET
    `DisplayID` = 39097,
    `BoundingRadius` = 1.0,
    `CombatReach` = 1.0,
    `Gender` = 2;

-- Giant Murloc Item Entry
DELETE FROM `item_template` WHERE (`entry` = 58100);
INSERT INTO `item_template`
SET `entry` = 58100,
    `class` = 15,
    `name` = 'Giant Murloc',
    `description` = 'Teaches you how to summon this mount.',
    `displayid` = 134239,
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
    `spellid_2` = 91070,
    `spelltrigger_2` = 6;

-- Gelihast (BFD) drop of the Giant Murloc
DELETE FROM `creature_loot_template` WHERE (`Entry` = 6243) AND (`Item` IN (58100));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6243, 58100, 0, 50, 0, 1, 2, 1, 1, 'Gelihast - Giant Murloc');

