-- Giant Murloc Creature Entry
DELETE FROM `creature_template` WHERE (`entry` = 9102597);
INSERT INTO `creature_template` 
SET `entry` = 9102597,
    `modelid1` = 39097,
    `name` = 'Giant Murloc',
    `faction` = 35, -- Friendly
    `type` = 1, -- Beast
    `unit_class` = 1, -- Warrior
    `unit_flags2` = 2048, -- Regen power

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

