-- =============================================================================
-- AQ20 Qiraji Weapon Cache System (F-025 Phase 7b)
-- =============================================================================
-- Consolidates Qiraji Spiked/Ornate Hilt drops into class-appropriate cache
-- Melee classes get Spiked Hilt, Caster classes get Ornate Hilt
-- =============================================================================

-- =============================================================================
-- ITEM TEMPLATE: Qiraji Weapon Cache (59337)
-- =============================================================================
DELETE FROM `item_template` WHERE `entry` = 59337;

INSERT INTO `item_template` SET
    `entry` = 59337,
    `class` = 15,
    `name` = 'Qiraji Weapon Cache',
    `displayid` = 20758,
    `Quality` = 4,
    `Flags` = 4,
    `ItemLevel` = 60,
    `RequiredLevel` = 60,
    `bonding` = 1,
    `maxcount` = 1,
    `stackable` = 1,
    `SellPrice` = 10000,
    `description` = 'Contains a Qiraji hilt suited to your class.';

-- =============================================================================
-- ITEM LOOT TEMPLATE: Class-specific hilt references
-- =============================================================================
-- Each class gets its own reference table (matching GroupId pattern from tier satchels)
DELETE FROM `item_loot_template` WHERE `Entry` = 59337;

INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59337, 1, 59580, 100, 0, 1, 1, 1, 1, 'Warrior ref'),
(59337, 2, 59581, 100, 0, 1, 2, 1, 1, 'Paladin ref'),
(59337, 3, 59582, 100, 0, 1, 3, 1, 1, 'Hunter ref'),
(59337, 4, 59583, 100, 0, 1, 4, 1, 1, 'Rogue ref'),
(59337, 5, 59584, 100, 0, 1, 5, 1, 1, 'Priest ref'),
(59337, 6, 59585, 100, 0, 1, 6, 1, 1, 'Death Knight ref'),
(59337, 7, 59586, 100, 0, 1, 7, 1, 1, 'Shaman ref'),
(59337, 8, 59587, 100, 0, 1, 8, 1, 1, 'Mage ref'),
(59337, 9, 59588, 100, 0, 1, 9, 1, 1, 'Warlock ref'),
(59337, 10, 59589, 100, 0, 1, 10, 1, 1, 'Druid ref');

-- =============================================================================
-- REFERENCE LOOT TEMPLATE: Hilt items per class
-- =============================================================================
-- GroupId MUST match parent GroupId from item_loot_template
DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59580 AND 59589;

-- Melee classes get Spiked Hilt (20886)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59580, 20886, 0, 100, 0, 1, 1, 1, 1, 'Warrior - Qiraji Spiked Hilt'),
(59582, 20886, 0, 100, 0, 1, 3, 1, 1, 'Hunter - Qiraji Spiked Hilt'),
(59583, 20886, 0, 100, 0, 1, 4, 1, 1, 'Rogue - Qiraji Spiked Hilt'),
(59585, 20886, 0, 100, 0, 1, 6, 1, 1, 'Death Knight - Qiraji Spiked Hilt');

-- Caster/Healer classes get Ornate Hilt (20890)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59581, 20890, 0, 100, 0, 1, 2, 1, 1, 'Paladin - Qiraji Ornate Hilt'),
(59584, 20890, 0, 100, 0, 1, 5, 1, 1, 'Priest - Qiraji Ornate Hilt'),
(59586, 20890, 0, 100, 0, 1, 7, 1, 1, 'Shaman - Qiraji Ornate Hilt'),
(59587, 20890, 0, 100, 0, 1, 8, 1, 1, 'Mage - Qiraji Ornate Hilt'),
(59588, 20890, 0, 100, 0, 1, 9, 1, 1, 'Warlock - Qiraji Ornate Hilt'),
(59589, 20890, 0, 100, 0, 1, 10, 1, 1, 'Druid - Qiraji Ornate Hilt');

-- =============================================================================
-- CONDITIONS: Class restrictions
-- =============================================================================
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59580 AND 59589;

-- Class conditions (SourceType 10 = Reference Loot, ConditionType 15 = Class)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(10, 59580, 20886, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'Warrior - Spiked Hilt'),
(10, 59581, 20890, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'Paladin - Ornate Hilt'),
(10, 59582, 20886, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'Hunter - Spiked Hilt'),
(10, 59583, 20886, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'Rogue - Spiked Hilt'),
(10, 59584, 20890, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'Priest - Ornate Hilt'),
(10, 59585, 20886, 0, 0, 15, 0, 32, 0, 0, 0, 0, 0, '', 'Death Knight - Spiked Hilt'),
(10, 59586, 20890, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'Shaman - Ornate Hilt'),
(10, 59587, 20890, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'Mage - Ornate Hilt'),
(10, 59588, 20890, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'Warlock - Ornate Hilt'),
(10, 59589, 20890, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'Druid - Ornate Hilt');

-- =============================================================================
-- BOSS LOOT UPDATES: Replace hilt references with cache
-- =============================================================================
-- Remove old hilt references from AQ20 bosses
DELETE FROM `creature_loot_template` WHERE `Entry` IN (15339, 15340, 15369, 15370) AND `Reference` IN (30425, 30428, 30434);

-- Add Qiraji Weapon Cache to AQ20 bosses
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15339, 59337, 0, 100, 0, 1, 0, 1, 1, 'Ossirian - Qiraji Weapon Cache'),
(15340, 59337, 0, 100, 0, 1, 0, 1, 1, 'Moam - Qiraji Weapon Cache'),
(15369, 59337, 0, 100, 0, 1, 0, 1, 1, 'Ayamiss - Qiraji Weapon Cache'),
(15370, 59337, 0, 100, 0, 1, 0, 1, 1, 'Buru - Qiraji Weapon Cache');
