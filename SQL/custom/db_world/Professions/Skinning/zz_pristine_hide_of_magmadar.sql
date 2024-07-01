-- Pristine Hide of Magmadar
    DELETE FROM `item_template` WHERE (`entry` = 57800);
    INSERT INTO `item_template`
    SET `entry` = 57800,
        `class` = 12, -- Quest
        `name` = 'Pristine Hide of Magmadar',
        `displayid` = 138147,
        `Quality` = 4, -- Epic
        `bonding` = 4; -- Quest

-- Add Pristine Hide of Magmadar to Skinning Loot Table
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 11982 AND `Item` = 57800);
INSERT INTO `skinning_loot_template`
SET `Entry` = 11982,
    `Item` = 57800,
    `Reference` = 0,
    `Chance` = 100,
    `QuestRequired` = 1,
    `LootMode` = 1,
    `GroupId` = 1,
    `MinCount` = 1,
    `MaxCount` = 1,
    `Comment` = 'Magmadar - Pristine Hide of Magmadar';

-- Add Pristine Hide of Magmadar to Quest Items for Magmadar
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 11982 AND `Idx` = 1);
INSERT INTO `creature_questitem`
SET `CreatureEntry` = 11982,
    `Idx` = 1,
    `ItemId` = 57800,
    `VerifiedBuild` = 1337;
