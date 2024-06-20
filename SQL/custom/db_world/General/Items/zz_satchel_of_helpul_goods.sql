-- Classic Random 5-15 AND Classic Random 15-25
DELETE FROM `item_loot_template` WHERE (`Entry` = 51999);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(51999, 1, 10036, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(51999, 2, 10037, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(51999, 3, 10038, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(51999, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random 24-34
DELETE FROM `item_loot_template` WHERE (`Entry` = 52000);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(52000, 1, 10039, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52000, 2, 10040, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52000, 3, 10041, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52000, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random 35-45
DELETE FROM `item_loot_template` WHERE (`Entry` = 52001);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(52001, 1, 10042, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52001, 2, 10043, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52001, 3, 10044, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52001, 4, 10045, 100, 0, 1, 4, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52001, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random 46-55
DELETE FROM `item_loot_template` WHERE (`Entry` = 52002);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(52002, 1, 10046, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52002, 2, 10047, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52002, 3, 10048, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52002, 4, 10049, 100, 0, 1, 4, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52002, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random 56-60
DELETE FROM `item_loot_template` WHERE (`Entry` = 52003);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(52003, 1, 10050, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52003, 2, 10051, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52003, 3, 10052, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52003, 4, 10053, 100, 0, 1, 4, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(52003, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random Heroic
DELETE FROM `item_template` WHERE (`entry` = 901201);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(901201, 15, 0, -1, 'Satchel of Helpful Goods', 56915, 3, 4, 0, 1, 0, 0, 0, -1, -1, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 11159);

DELETE FROM `item_loot_template` WHERE (`Entry` = 901201);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(901201, 1, 10050, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901201, 2, 10051, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901201, 3, 10052, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901201, 4, 10053, 100, 0, 1, 4, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901201, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');

-- Classic Random Mythic
DELETE FROM `item_template` WHERE (`entry` = 901205);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(901205, 15, 0, -1, 'Satchel of Helpful Goods', 56915, 3, 4, 0, 1, 0, 0, 0, -1, -1, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 11159);

DELETE FROM `item_loot_template` WHERE (`Entry` = 901205);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(901205, 1, 10050, 100, 0, 1, 1, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901205, 2, 10051, 100, 0, 1, 2, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901205, 3, 10052, 100, 0, 1, 3, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901205, 4, 10053, 100, 0, 1, 4, 1, 1, 'Satchel of Helpful Goods - (ReferenceTable)'),
(901205, 58200, 0, 100, 0, 1, 0, 1, 1, 'Satchel of Helpful Goods - Badge of Heroism');