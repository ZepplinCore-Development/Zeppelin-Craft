-- 1 - 15 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100020);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100020, 774, 0, 10, 0, 1, 2, 1, 1, 'Malachite'),
(100020, 818, 0, 10, 0, 1, 2, 1, 1, 'Tigerseye'),
(100020, 1210, 0, 10, 0, 1, 2, 1, 1, 'Shadowgem'),
(100020, 2770, 0, 50, 0, 1, 2, 1, 3, 'Copper Ore'),
(100020, 2771, 0, 20, 0, 1, 2, 1, 3, 'Tin Ore'),
(100020, 2835, 0, 50, 0, 1, 1, 1, 3, 'Rough Stone'),
(100020, 2836, 0, 50, 0, 1, 1, 1, 3, 'Coarse Stone');

-- 16 - 25 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100021);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100021, 1206, 0, 10, 0, 1, 2, 1, 1, 'Moss Agate'),
(100021, 1210, 0, 10, 0, 1, 2, 1, 1, 'Shadowgem'),
(100021, 1705, 0, 10, 0, 1, 2, 1, 1, 'Lesser Moonstone'),
(100021, 2770, 0, 40, 0, 1, 2, 1, 3, 'Copper Ore'),
(100021, 2771, 0, 20, 0, 1, 2, 1, 3, 'Tin Ore'),
(100021, 2775, 0, 10, 0, 1, 2, 1, 1, 'Silver Ore'),
(100021, 2836, 0, 70, 0, 1, 1, 1, 3, 'Coarse Stone'),
(100021, 3857, 0, 20, 0, 1, 1, 1, 2, 'Coal'),
(100021, 7067, 0, 10, 0, 1, 1, 1, 2, 'Elemental Earth');

-- 26 - 35 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100022);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100022, 7067, 0, 10, 0, 1, 1, 1, 1, 'Elemental Earth'),
(100022, 2838, 0, 90, 0, 1, 1, 1, 3, 'Heavy Stone'),
(100022, 1705, 0, 10, 0, 1, 2, 1, 1, 'Lesser Moonstone'),
(100022, 1206, 0, 10, 0, 1, 2, 1, 1, 'Moss Agate'),
(100022, 2772, 0, 50, 0, 1, 2, 1, 3, 'Iron Ore'),
(100022, 2776, 0, 20, 0, 1, 2, 1, 3, 'Gold Ore'),
(100022, 1529, 0, 10, 0, 1, 2, 1, 1, 'Jade');

-- 36 - 50 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100023);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100023, 7075, 0, 10, 0, 1, 1, 1, 1, 'Core of Earth'),
(100023, 7912, 0, 90, 0, 1, 1, 1, 3, 'Solid Stone'),
(100023, 7911, 0, 20, 0, 1, 2, 1, 3, 'Truesilver Ore'),
(100023, 7909, 0, 10, 0, 1, 2, 1, 1, 'Aquamarine'),
(100023, 3858, 0, 60, 0, 1, 2, 1, 3, 'Mithril Ore'),
(100023, 3864, 0, 10, 0, 1, 2, 1, 1, 'Citrine');

-- 51 - 60 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100024);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100024, 7076, 0, 10, 0, 1, 1, 1, 1, 'Essence of Earth'),
(100024, 7075, 0, 10, 0, 1, 1, 1, 1, 'Core of Earth'),
(100024, 12365, 0, 80, 0, 1, 1, 1, 3, 'Dense Stone'),
(100024, 11370, 0, 10, 0, 1, 2, 1, 3, 'Dark Iron Ore'),
(100024, 12800, 0, 5, 0, 1, 2, 1, 1, 'Azerothian Diamond'),
(100024, 12364, 0, 5, 0, 1, 2, 1, 1, 'Huge Emerald'),
(100024, 12363, 0, 5, 0, 1, 2, 1, 1, 'Arcane Crystal'),
(100024, 12799, 0, 5, 0, 1, 2, 1, 1, 'Large Opal'),
(100024, 12361, 0, 5, 0, 1, 2, 1, 1, 'Blue Sapphire'),
(100024, 19774, 0, 5, 0, 1, 2, 1, 1, 'Souldarite'),
(100024, 11382, 0, 5, 0, 1, 2, 1, 1, 'Blood of the Mountain'),
(100024, 7910, 0, 5, 0, 1, 2, 1, 1, 'Star Ruby'),
(100024, 10620, 0, 50, 0, 1, 2, 1, 3, 'Thorium Ore');

-- Vanilla Raid Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100025);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100025, 7076, 0, 10, 0, 1, 1, 1, 1, 'Essence of Earth'),
(100025, 17011, 0, 10, 0, 1, 1, 1, 1, 'Lava Core'),
(100025, 7075, 0, 10, 0, 1, 1, 1, 1, 'Core of Earth'),
(100025, 12365, 0, 60, 0, 1, 1, 1, 3, 'Dense Stone'),
(100025, 11370, 0, 10, 0, 1, 2, 1, 3, 'Dark Iron Ore'),
(100025, 12800, 0, 5, 0, 1, 2, 1, 1, 'Azerothian Diamond'),
(100025, 12364, 0, 5, 0, 1, 2, 1, 1, 'Huge Emerald'),
(100025, 12363, 0, 15, 0, 1, 2, 1, 1, 'Arcane Crystal'),
(100025, 12799, 0, 5, 0, 1, 2, 1, 1, 'Large Opal'),
(100025, 12361, 0, 5, 0, 1, 2, 1, 1, 'Blue Sapphire'),
(100025, 19774, 0, 5, 0, 1, 2, 1, 1, 'Souldarite'),
(100025, 11382, 0, 5, 0, 1, 2, 1, 1, 'Blood of the Mountain'),
(100025, 7910, 0, 5, 0, 1, 2, 1, 1, 'Star Ruby'),
(100025, 10620, 0, 40, 0, 1, 2, 1, 3, 'Thorium Ore');

-- Outlands 60 - 65 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100026);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100026, 22573, 0, 10, 0, 1, 1, 1, 2, 'Mote of Earth'),
(100026, 22574, 0, 20, 0, 1, 1, 1, 2, 'Mote of Fire'),
(100026, 12904, 12904, 5, 0, 1, 1, 1, 1, NULL), -- GREEN GEMS REFERENCE TABLE
(100026, 12902, 12902, 2, 0, 1, 1, 1, 1, NULL), -- BLUE GEMS REFERENCE TABLE
(100026, 23427, 0, 5, 0, 1, 0, 1, 2, 'Eternium Ore'),
(100026, 23424, 0, 95, 0, 1, 0, 1, 2, 'Fel Iron Ore');

-- Outlands 66 - 69 Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 80101); -- Original Template

DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100027);
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100027, 22573, 0, 20, 0, 1, 1, 1, 2, 'Mote of Earth'),
(100027, 22574, 0, 10, 0, 1, 1, 1, 2, 'Mote of Fire'),
(100027, 12904, 12904, 5, 0, 1, 1, 1, 1, NULL), -- GREEN GEMS REFERENCE TABLE
(100027, 12902, 12902, 2, 0, 1, 1, 1, 1, NULL), -- BLUE GEMS REFERENCE TABLE
(100027, 23427, 0, 5, 0, 1, 0, 1, 2, 'Eternium Ore'),
(100027, 23425, 0, 95, 0, 1, 0, 1, 2, 'Adamantite Ore');

-- Outlands 70+ Mining Loot
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 100028); -- Existing template
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(100028, 22573, 0, 20, 0, 1, 1, 1, 2, 'Mote of Earth'),
(100028, 22574, 0, 10, 0, 1, 1, 1, 2, 'Mote of Fire'),
(100028, 12904, 12904, 5, 0, 1, 1, 1, 1, NULL), -- GREEN GEMS REFERENCE TABLE
(100028, 12902, 12902, 2, 0, 1, 1, 1, 1, NULL), -- BLUE GEMS REFERENCE TABLE
(100028, 23427, 0, 5, 0, 1, 0, 1, 2, 'Eternium Ore'),
(100028, 23426, 0, 10, 0, 1, 0, 1, 2, 'Khorium Ore'),
(100028, 23425, 0, 85, 0, 1, 0, 1, 2, 'Adamantite Ore');