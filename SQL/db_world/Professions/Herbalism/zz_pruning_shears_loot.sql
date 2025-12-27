-- =====================================================
-- PRUNING SHEARS - EXTRA YIELD SYSTEM
-- =====================================================
-- Implementation: Reference loot tables with conditional bonus herbs
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- Bonus: 1-3 additional herbs per gather
-- =====================================================

-- ===================
-- CLEANUP
-- ===================
DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 91200 AND 91799;
DELETE FROM `gameobject_loot_template` WHERE `Reference` BETWEEN 91200 AND 91799;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 91200 AND 91799;

-- ===================
-- REFERENCE LOOT TABLES
-- ===================
-- Format: 91[Tier][HerbIndex]
-- Tier: 2=Journeyman(10%), 3=Artisan(20%), 4=Master(30%), 5=Grand Master(40%)
-- HerbIndex: 00-26 for different herbs

-- Tier 1: Journeyman Shears (10% chance, aura 91140)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91200, 2447, 100, 1, 3, 'Journeyman Shears - Peacebloom bonus'),
(91201, 765, 100, 1, 3, 'Journeyman Shears - Silverleaf bonus'),
(91202, 2449, 100, 1, 3, 'Journeyman Shears - Earthroot bonus'),
(91203, 785, 100, 1, 3, 'Journeyman Shears - Mageroyal bonus'),
(91204, 2450, 100, 1, 3, 'Journeyman Shears - Briarthorn bonus'),
(91205, 2453, 100, 1, 3, 'Journeyman Shears - Bruiseweed bonus'),
(91206, 3820, 100, 1, 3, 'Journeyman Shears - Stranglekelp bonus'),
(91207, 3356, 100, 1, 3, 'Journeyman Shears - Kingsblood bonus'),
(91208, 3357, 100, 1, 3, 'Journeyman Shears - Liferoot bonus'),
(91209, 3818, 100, 1, 3, 'Journeyman Shears - Fadeleaf bonus'),
(91210, 3821, 100, 1, 3, 'Journeyman Shears - Goldthorn bonus'),
(91211, 3358, 100, 1, 3, 'Journeyman Shears - Khadgar''s Whisker bonus'),
(91212, 3819, 100, 1, 3, 'Journeyman Shears - Wintersbite bonus'),
(91213, 4625, 100, 1, 3, 'Journeyman Shears - Firebloom bonus'),
(91214, 8831, 100, 1, 3, 'Journeyman Shears - Purple Lotus bonus'),
(91215, 8836, 100, 1, 3, 'Journeyman Shears - Arthas'' Tears bonus'),
(91216, 8838, 100, 1, 3, 'Journeyman Shears - Sungrass bonus'),
(91217, 8839, 100, 1, 3, 'Journeyman Shears - Blindweed bonus'),
(91218, 8845, 100, 1, 3, 'Journeyman Shears - Ghost Mushroom bonus'),
(91219, 8846, 100, 1, 3, 'Journeyman Shears - Gromsblood bonus'),
(91220, 13464, 100, 1, 3, 'Journeyman Shears - Golden Sansam bonus'),
(91221, 13463, 100, 1, 3, 'Journeyman Shears - Dreamfoil bonus'),
(91222, 13465, 100, 1, 3, 'Journeyman Shears - Mountain Silversage bonus'),
(91223, 13466, 100, 1, 3, 'Journeyman Shears - Plaguebloom bonus'),
(91224, 13467, 100, 1, 3, 'Journeyman Shears - Icecap bonus'),
(91225, 13468, 100, 1, 3, 'Journeyman Shears - Black Lotus bonus'),
(91226, 2452, 100, 1, 3, 'Journeyman Shears - Swiftthistle bonus');

-- Tier 2: Artisan Shears (20% chance, aura 91141)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91300, 2447, 100, 1, 3, 'Artisan Shears - Peacebloom bonus'),
(91301, 765, 100, 1, 3, 'Artisan Shears - Silverleaf bonus'),
(91302, 2449, 100, 1, 3, 'Artisan Shears - Earthroot bonus'),
(91303, 785, 100, 1, 3, 'Artisan Shears - Mageroyal bonus'),
(91304, 2450, 100, 1, 3, 'Artisan Shears - Briarthorn bonus'),
(91305, 2453, 100, 1, 3, 'Artisan Shears - Bruiseweed bonus'),
(91306, 3820, 100, 1, 3, 'Artisan Shears - Stranglekelp bonus'),
(91307, 3356, 100, 1, 3, 'Artisan Shears - Kingsblood bonus'),
(91308, 3357, 100, 1, 3, 'Artisan Shears - Liferoot bonus'),
(91309, 3818, 100, 1, 3, 'Artisan Shears - Fadeleaf bonus'),
(91310, 3821, 100, 1, 3, 'Artisan Shears - Goldthorn bonus'),
(91311, 3358, 100, 1, 3, 'Artisan Shears - Khadgar''s Whisker bonus'),
(91312, 3819, 100, 1, 3, 'Artisan Shears - Wintersbite bonus'),
(91313, 4625, 100, 1, 3, 'Artisan Shears - Firebloom bonus'),
(91314, 8831, 100, 1, 3, 'Artisan Shears - Purple Lotus bonus'),
(91315, 8836, 100, 1, 3, 'Artisan Shears - Arthas'' Tears bonus'),
(91316, 8838, 100, 1, 3, 'Artisan Shears - Sungrass bonus'),
(91317, 8839, 100, 1, 3, 'Artisan Shears - Blindweed bonus'),
(91318, 8845, 100, 1, 3, 'Artisan Shears - Ghost Mushroom bonus'),
(91319, 8846, 100, 1, 3, 'Artisan Shears - Gromsblood bonus'),
(91320, 13464, 100, 1, 3, 'Artisan Shears - Golden Sansam bonus'),
(91321, 13463, 100, 1, 3, 'Artisan Shears - Dreamfoil bonus'),
(91322, 13465, 100, 1, 3, 'Artisan Shears - Mountain Silversage bonus'),
(91323, 13466, 100, 1, 3, 'Artisan Shears - Plaguebloom bonus'),
(91324, 13467, 100, 1, 3, 'Artisan Shears - Icecap bonus'),
(91325, 13468, 100, 1, 3, 'Artisan Shears - Black Lotus bonus'),
(91326, 2452, 100, 1, 3, 'Artisan Shears - Swiftthistle bonus');

-- Tier 3: Master Shears (30% chance, aura 91142)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91400, 2447, 100, 1, 3, 'Master Shears - Peacebloom bonus'),
(91401, 765, 100, 1, 3, 'Master Shears - Silverleaf bonus'),
(91402, 2449, 100, 1, 3, 'Master Shears - Earthroot bonus'),
(91403, 785, 100, 1, 3, 'Master Shears - Mageroyal bonus'),
(91404, 2450, 100, 1, 3, 'Master Shears - Briarthorn bonus'),
(91405, 2453, 100, 1, 3, 'Master Shears - Bruiseweed bonus'),
(91406, 3820, 100, 1, 3, 'Master Shears - Stranglekelp bonus'),
(91407, 3356, 100, 1, 3, 'Master Shears - Kingsblood bonus'),
(91408, 3357, 100, 1, 3, 'Master Shears - Liferoot bonus'),
(91409, 3818, 100, 1, 3, 'Master Shears - Fadeleaf bonus'),
(91410, 3821, 100, 1, 3, 'Master Shears - Goldthorn bonus'),
(91411, 3358, 100, 1, 3, 'Master Shears - Khadgar''s Whisker bonus'),
(91412, 3819, 100, 1, 3, 'Master Shears - Wintersbite bonus'),
(91413, 4625, 100, 1, 3, 'Master Shears - Firebloom bonus'),
(91414, 8831, 100, 1, 3, 'Master Shears - Purple Lotus bonus'),
(91415, 8836, 100, 1, 3, 'Master Shears - Arthas'' Tears bonus'),
(91416, 8838, 100, 1, 3, 'Master Shears - Sungrass bonus'),
(91417, 8839, 100, 1, 3, 'Master Shears - Blindweed bonus'),
(91418, 8845, 100, 1, 3, 'Master Shears - Ghost Mushroom bonus'),
(91419, 8846, 100, 1, 3, 'Master Shears - Gromsblood bonus'),
(91420, 13464, 100, 1, 3, 'Master Shears - Golden Sansam bonus'),
(91421, 13463, 100, 1, 3, 'Master Shears - Dreamfoil bonus'),
(91422, 13465, 100, 1, 3, 'Master Shears - Mountain Silversage bonus'),
(91423, 13466, 100, 1, 3, 'Master Shears - Plaguebloom bonus'),
(91424, 13467, 100, 1, 3, 'Master Shears - Icecap bonus'),
(91425, 13468, 100, 1, 3, 'Master Shears - Black Lotus bonus'),
(91426, 2452, 100, 1, 3, 'Master Shears - Swiftthistle bonus');

-- Tier 4: Grand Master Shears (40% chance, aura 91143)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91500, 2447, 100, 1, 3, 'Grand Master Shears - Peacebloom bonus'),
(91501, 765, 100, 1, 3, 'Grand Master Shears - Silverleaf bonus'),
(91502, 2449, 100, 1, 3, 'Grand Master Shears - Earthroot bonus'),
(91503, 785, 100, 1, 3, 'Grand Master Shears - Mageroyal bonus'),
(91504, 2450, 100, 1, 3, 'Grand Master Shears - Briarthorn bonus'),
(91505, 2453, 100, 1, 3, 'Grand Master Shears - Bruiseweed bonus'),
(91506, 3820, 100, 1, 3, 'Grand Master Shears - Stranglekelp bonus'),
(91507, 3356, 100, 1, 3, 'Grand Master Shears - Kingsblood bonus'),
(91508, 3357, 100, 1, 3, 'Grand Master Shears - Liferoot bonus'),
(91509, 3818, 100, 1, 3, 'Grand Master Shears - Fadeleaf bonus'),
(91510, 3821, 100, 1, 3, 'Grand Master Shears - Goldthorn bonus'),
(91511, 3358, 100, 1, 3, 'Grand Master Shears - Khadgar''s Whisker bonus'),
(91512, 3819, 100, 1, 3, 'Grand Master Shears - Wintersbite bonus'),
(91513, 4625, 100, 1, 3, 'Grand Master Shears - Firebloom bonus'),
(91514, 8831, 100, 1, 3, 'Grand Master Shears - Purple Lotus bonus'),
(91515, 8836, 100, 1, 3, 'Grand Master Shears - Arthas'' Tears bonus'),
(91516, 8838, 100, 1, 3, 'Grand Master Shears - Sungrass bonus'),
(91517, 8839, 100, 1, 3, 'Grand Master Shears - Blindweed bonus'),
(91518, 8845, 100, 1, 3, 'Grand Master Shears - Ghost Mushroom bonus'),
(91519, 8846, 100, 1, 3, 'Grand Master Shears - Gromsblood bonus'),
(91520, 13464, 100, 1, 3, 'Grand Master Shears - Golden Sansam bonus'),
(91521, 13463, 100, 1, 3, 'Grand Master Shears - Dreamfoil bonus'),
(91522, 13465, 100, 1, 3, 'Grand Master Shears - Mountain Silversage bonus'),
(91523, 13466, 100, 1, 3, 'Grand Master Shears - Plaguebloom bonus'),
(91524, 13467, 100, 1, 3, 'Grand Master Shears - Icecap bonus'),
(91525, 13468, 100, 1, 3, 'Grand Master Shears - Black Lotus bonus'),
(91526, 2452, 100, 1, 3, 'Grand Master Shears - Swiftthistle bonus'),

-- TBC HERBS (Entries 91227-91235 per tier, offset +100 per tier)
-- Tier 1: Journeyman (91227-91235)
(91227, 22710, 100, 1, 3, 'Journeyman Shears - Bloodthistle bonus'),
(91228, 22785, 100, 1, 3, 'Journeyman Shears - Felweed bonus'),
(91229, 22786, 100, 1, 3, 'Journeyman Shears - Dreaming Glory bonus'),
(91230, 22787, 100, 1, 3, 'Journeyman Shears - Ragveil bonus'),
(91231, 22789, 100, 1, 3, 'Journeyman Shears - Terocone bonus'),
(91232, 22790, 100, 1, 3, 'Journeyman Shears - Ancient Lichen bonus'),
(91233, 22791, 100, 1, 3, 'Journeyman Shears - Netherbloom bonus'),
(91234, 22792, 100, 1, 3, 'Journeyman Shears - Nightmare Vine bonus'),
(91235, 22793, 100, 1, 3, 'Journeyman Shears - Mana Thistle bonus');

-- Tier 2: Artisan (91327-91335)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91327, 22710, 100, 1, 3, 'Artisan Shears - Bloodthistle bonus'),
(91328, 22785, 100, 1, 3, 'Artisan Shears - Felweed bonus'),
(91329, 22786, 100, 1, 3, 'Artisan Shears - Dreaming Glory bonus'),
(91330, 22787, 100, 1, 3, 'Artisan Shears - Ragveil bonus'),
(91331, 22789, 100, 1, 3, 'Artisan Shears - Terocone bonus'),
(91332, 22790, 100, 1, 3, 'Artisan Shears - Ancient Lichen bonus'),
(91333, 22791, 100, 1, 3, 'Artisan Shears - Netherbloom bonus'),
(91334, 22792, 100, 1, 3, 'Artisan Shears - Nightmare Vine bonus'),
(91335, 22793, 100, 1, 3, 'Artisan Shears - Mana Thistle bonus');

-- Tier 3: Master (91427-91435)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91427, 22710, 100, 1, 3, 'Master Shears - Bloodthistle bonus'),
(91428, 22785, 100, 1, 3, 'Master Shears - Felweed bonus'),
(91429, 22786, 100, 1, 3, 'Master Shears - Dreaming Glory bonus'),
(91430, 22787, 100, 1, 3, 'Master Shears - Ragveil bonus'),
(91431, 22789, 100, 1, 3, 'Master Shears - Terocone bonus'),
(91432, 22790, 100, 1, 3, 'Master Shears - Ancient Lichen bonus'),
(91433, 22791, 100, 1, 3, 'Master Shears - Netherbloom bonus'),
(91434, 22792, 100, 1, 3, 'Master Shears - Nightmare Vine bonus'),
(91435, 22793, 100, 1, 3, 'Master Shears - Mana Thistle bonus');

-- Tier 4: Grand Master (91527-91535)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91527, 22710, 100, 1, 3, 'Grand Master Shears - Bloodthistle bonus'),
(91528, 22785, 100, 1, 3, 'Grand Master Shears - Felweed bonus'),
(91529, 22786, 100, 1, 3, 'Grand Master Shears - Dreaming Glory bonus'),
(91530, 22787, 100, 1, 3, 'Grand Master Shears - Ragveil bonus'),
(91531, 22789, 100, 1, 3, 'Grand Master Shears - Terocone bonus'),
(91532, 22790, 100, 1, 3, 'Grand Master Shears - Ancient Lichen bonus'),
(91533, 22791, 100, 1, 3, 'Grand Master Shears - Netherbloom bonus'),
(91534, 22792, 100, 1, 3, 'Grand Master Shears - Nightmare Vine bonus'),
(91535, 22793, 100, 1, 3, 'Grand Master Shears - Mana Thistle bonus');

-- WOTLK HERBS (Entries 91236-91241 per tier, offset +100 per tier)
-- Tier 1: Journeyman (91236-91241)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91236, 36901, 100, 1, 3, 'Journeyman Shears - Goldclover bonus'),
(91237, 36903, 100, 1, 3, 'Journeyman Shears - Adder''s Tongue bonus'),
(91238, 36904, 100, 1, 3, 'Journeyman Shears - Tiger Lily bonus'),
(91239, 36905, 100, 1, 3, 'Journeyman Shears - Lichbloom bonus'),
(91240, 36906, 100, 1, 3, 'Journeyman Shears - Icethorn bonus'),
(91241, 36907, 100, 1, 3, 'Journeyman Shears - Talandra''s Rose bonus');

-- Tier 2: Artisan (91336-91341)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91336, 36901, 100, 1, 3, 'Artisan Shears - Goldclover bonus'),
(91337, 36903, 100, 1, 3, 'Artisan Shears - Adder''s Tongue bonus'),
(91338, 36904, 100, 1, 3, 'Artisan Shears - Tiger Lily bonus'),
(91339, 36905, 100, 1, 3, 'Artisan Shears - Lichbloom bonus'),
(91340, 36906, 100, 1, 3, 'Artisan Shears - Icethorn bonus'),
(91341, 36907, 100, 1, 3, 'Artisan Shears - Talandra''s Rose bonus');

-- Tier 3: Master (91436-91441)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91436, 36901, 100, 1, 3, 'Master Shears - Goldclover bonus'),
(91437, 36903, 100, 1, 3, 'Master Shears - Adder''s Tongue bonus'),
(91438, 36904, 100, 1, 3, 'Master Shears - Tiger Lily bonus'),
(91439, 36905, 100, 1, 3, 'Master Shears - Lichbloom bonus'),
(91440, 36906, 100, 1, 3, 'Master Shears - Icethorn bonus'),
(91441, 36907, 100, 1, 3, 'Master Shears - Talandra''s Rose bonus');

-- Tier 4: Grand Master (91536-91541)
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `MinCount`, `MaxCount`, `Comment`) VALUES
(91536, 36901, 100, 1, 3, 'Grand Master Shears - Goldclover bonus'),
(91537, 36903, 100, 1, 3, 'Grand Master Shears - Adder''s Tongue bonus'),
(91538, 36904, 100, 1, 3, 'Grand Master Shears - Tiger Lily bonus'),
(91539, 36905, 100, 1, 3, 'Grand Master Shears - Lichbloom bonus'),
(91540, 36906, 100, 1, 3, 'Grand Master Shears - Icethorn bonus'),
(91541, 36907, 100, 1, 3, 'Grand Master Shears - Talandra''s Rose bonus');

-- ===================
-- GAMEOBJECT LOOT REFERENCES
-- ===================
-- Links reference loot tables to herb node loot tables
-- Item slots: 9100-9199 (Tier 1), 9200-9299 (Tier 2), 9300-9399 (Tier 3), 9400-9499 (Tier 4)

-- Peacebloom (Item 2447, Loot Tables 1415, 2512)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1415, 9100, 91200, 10, 1, 0, 1, 1, 'Journeyman Shears - Peacebloom bonus'),
(2512, 9100, 91200, 10, 1, 0, 1, 1, 'Journeyman Shears - Peacebloom bonus'),
(1415, 9200, 91300, 20, 1, 0, 1, 1, 'Artisan Shears - Peacebloom bonus'),
(2512, 9200, 91300, 20, 1, 0, 1, 1, 'Artisan Shears - Peacebloom bonus'),
(1415, 9300, 91400, 30, 1, 0, 1, 1, 'Master Shears - Peacebloom bonus'),
(2512, 9300, 91400, 30, 1, 0, 1, 1, 'Master Shears - Peacebloom bonus'),
(1415, 9400, 91500, 40, 1, 0, 1, 1, 'Grand Master Shears - Peacebloom bonus'),
(2512, 9400, 91500, 40, 1, 0, 1, 1, 'Grand Master Shears - Peacebloom bonus');

-- Silverleaf (Item 765, Loot Tables 1414, 2511)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1414, 9101, 91201, 10, 1, 0, 1, 1, 'Journeyman Shears - Silverleaf bonus'),
(2511, 9101, 91201, 10, 1, 0, 1, 1, 'Journeyman Shears - Silverleaf bonus'),
(1414, 9201, 91301, 20, 1, 0, 1, 1, 'Artisan Shears - Silverleaf bonus'),
(2511, 9201, 91301, 20, 1, 0, 1, 1, 'Artisan Shears - Silverleaf bonus'),
(1414, 9301, 91401, 30, 1, 0, 1, 1, 'Master Shears - Silverleaf bonus'),
(2511, 9301, 91401, 30, 1, 0, 1, 1, 'Master Shears - Silverleaf bonus'),
(1414, 9401, 91501, 40, 1, 0, 1, 1, 'Grand Master Shears - Silverleaf bonus'),
(2511, 9401, 91501, 40, 1, 0, 1, 1, 'Grand Master Shears - Silverleaf bonus');

-- Earthroot (Item 2449, Loot Tables 1416, 2513)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1416, 9102, 91202, 10, 1, 0, 1, 1, 'Journeyman Shears - Earthroot bonus'),
(2513, 9102, 91202, 10, 1, 0, 1, 1, 'Journeyman Shears - Earthroot bonus'),
(1416, 9202, 91302, 20, 1, 0, 1, 1, 'Artisan Shears - Earthroot bonus'),
(2513, 9202, 91302, 20, 1, 0, 1, 1, 'Artisan Shears - Earthroot bonus'),
(1416, 9302, 91402, 30, 1, 0, 1, 1, 'Master Shears - Earthroot bonus'),
(2513, 9302, 91402, 30, 1, 0, 1, 1, 'Master Shears - Earthroot bonus'),
(1416, 9402, 91502, 40, 1, 0, 1, 1, 'Grand Master Shears - Earthroot bonus'),
(2513, 9402, 91502, 40, 1, 0, 1, 1, 'Grand Master Shears - Earthroot bonus');

-- Mageroyal (Item 785, Loot Tables 1417, 2514)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1417, 9103, 91203, 10, 1, 0, 1, 1, 'Journeyman Shears - Mageroyal bonus'),
(2514, 9103, 91203, 10, 1, 0, 1, 1, 'Journeyman Shears - Mageroyal bonus'),
(1417, 9203, 91303, 20, 1, 0, 1, 1, 'Artisan Shears - Mageroyal bonus'),
(2514, 9203, 91303, 20, 1, 0, 1, 1, 'Artisan Shears - Mageroyal bonus'),
(1417, 9303, 91403, 30, 1, 0, 1, 1, 'Master Shears - Mageroyal bonus'),
(2514, 9303, 91403, 30, 1, 0, 1, 1, 'Master Shears - Mageroyal bonus'),
(1417, 9403, 91503, 40, 1, 0, 1, 1, 'Grand Master Shears - Mageroyal bonus'),
(2514, 9403, 91503, 40, 1, 0, 1, 1, 'Grand Master Shears - Mageroyal bonus');

-- Briarthorn (Item 2450, Loot Tables 1418, 2515)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1418, 9104, 91204, 10, 1, 0, 1, 1, 'Journeyman Shears - Briarthorn bonus'),
(2515, 9104, 91204, 10, 1, 0, 1, 1, 'Journeyman Shears - Briarthorn bonus'),
(1418, 9204, 91304, 20, 1, 0, 1, 1, 'Artisan Shears - Briarthorn bonus'),
(2515, 9204, 91304, 20, 1, 0, 1, 1, 'Artisan Shears - Briarthorn bonus'),
(1418, 9304, 91404, 30, 1, 0, 1, 1, 'Master Shears - Briarthorn bonus'),
(2515, 9304, 91404, 30, 1, 0, 1, 1, 'Master Shears - Briarthorn bonus'),
(1418, 9404, 91504, 40, 1, 0, 1, 1, 'Grand Master Shears - Briarthorn bonus'),
(2515, 9404, 91504, 40, 1, 0, 1, 1, 'Grand Master Shears - Briarthorn bonus');

-- Bruiseweed (Item 2453, Loot Tables 1419, 2516)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1419, 9105, 91205, 10, 1, 0, 1, 1, 'Journeyman Shears - Bruiseweed bonus'),
(2516, 9105, 91205, 10, 1, 0, 1, 1, 'Journeyman Shears - Bruiseweed bonus'),
(1419, 9205, 91305, 20, 1, 0, 1, 1, 'Artisan Shears - Bruiseweed bonus'),
(2516, 9205, 91305, 20, 1, 0, 1, 1, 'Artisan Shears - Bruiseweed bonus'),
(1419, 9305, 91405, 30, 1, 0, 1, 1, 'Master Shears - Bruiseweed bonus'),
(2516, 9305, 91405, 30, 1, 0, 1, 1, 'Master Shears - Bruiseweed bonus'),
(1419, 9405, 91505, 40, 1, 0, 1, 1, 'Grand Master Shears - Bruiseweed bonus'),
(2516, 9405, 91505, 40, 1, 0, 1, 1, 'Grand Master Shears - Bruiseweed bonus');

-- Stranglekelp (Item 3820, Loot Table 1733)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1733, 9106, 91206, 10, 1, 0, 1, 1, 'Journeyman Shears - Stranglekelp bonus'),
(1733, 9206, 91306, 20, 1, 0, 1, 1, 'Artisan Shears - Stranglekelp bonus'),
(1733, 9306, 91406, 30, 1, 0, 1, 1, 'Master Shears - Stranglekelp bonus'),
(1733, 9406, 91506, 40, 1, 0, 1, 1, 'Grand Master Shears - Stranglekelp bonus');

-- Kingsblood (Item 3356, Loot Table 1421)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1421, 9107, 91207, 10, 1, 0, 1, 1, 'Journeyman Shears - Kingsblood bonus'),
(1421, 9207, 91307, 20, 1, 0, 1, 1, 'Artisan Shears - Kingsblood bonus'),
(1421, 9307, 91407, 30, 1, 0, 1, 1, 'Master Shears - Kingsblood bonus'),
(1421, 9407, 91507, 40, 1, 0, 1, 1, 'Grand Master Shears - Kingsblood bonus');

-- Liferoot (Item 3357, Loot Table 1730)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1730, 9108, 91208, 10, 1, 0, 1, 1, 'Journeyman Shears - Liferoot bonus'),
(1730, 9208, 91308, 20, 1, 0, 1, 1, 'Artisan Shears - Liferoot bonus'),
(1730, 9308, 91408, 30, 1, 0, 1, 1, 'Master Shears - Liferoot bonus'),
(1730, 9408, 91508, 40, 1, 0, 1, 1, 'Grand Master Shears - Liferoot bonus');

-- Fadeleaf (Item 3818, Loot Table 1731)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1731, 9109, 91209, 10, 1, 0, 1, 1, 'Journeyman Shears - Fadeleaf bonus'),
(1731, 9209, 91309, 20, 1, 0, 1, 1, 'Artisan Shears - Fadeleaf bonus'),
(1731, 9309, 91409, 30, 1, 0, 1, 1, 'Master Shears - Fadeleaf bonus'),
(1731, 9409, 91509, 40, 1, 0, 1, 1, 'Grand Master Shears - Fadeleaf bonus');

-- Goldthorn (Item 3821, Loot Table 1734)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1734, 9110, 91210, 10, 1, 0, 1, 1, 'Journeyman Shears - Goldthorn bonus'),
(1734, 9210, 91310, 20, 1, 0, 1, 1, 'Artisan Shears - Goldthorn bonus'),
(1734, 9310, 91410, 30, 1, 0, 1, 1, 'Master Shears - Goldthorn bonus'),
(1734, 9410, 91510, 40, 1, 0, 1, 1, 'Grand Master Shears - Goldthorn bonus');

-- Khadgar's Whisker (Item 3358, Loot Table 1423)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1423, 9111, 91211, 10, 1, 0, 1, 1, 'Journeyman Shears - Khadgar''s Whisker bonus'),
(1423, 9211, 91311, 20, 1, 0, 1, 1, 'Artisan Shears - Khadgar''s Whisker bonus'),
(1423, 9311, 91411, 30, 1, 0, 1, 1, 'Master Shears - Khadgar''s Whisker bonus'),
(1423, 9411, 91511, 40, 1, 0, 1, 1, 'Grand Master Shears - Khadgar''s Whisker bonus');

-- Wintersbite (Item 3819, Loot Table 1732)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1732, 9112, 91212, 10, 1, 0, 1, 1, 'Journeyman Shears - Wintersbite bonus'),
(1732, 9212, 91312, 20, 1, 0, 1, 1, 'Artisan Shears - Wintersbite bonus'),
(1732, 9312, 91412, 30, 1, 0, 1, 1, 'Master Shears - Wintersbite bonus'),
(1732, 9412, 91512, 40, 1, 0, 1, 1, 'Grand Master Shears - Wintersbite bonus');

-- Firebloom (Item 4625, Loot Table 2292)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(2292, 9113, 91213, 10, 1, 0, 1, 1, 'Journeyman Shears - Firebloom bonus'),
(2292, 9213, 91313, 20, 1, 0, 1, 1, 'Artisan Shears - Firebloom bonus'),
(2292, 9313, 91413, 30, 1, 0, 1, 1, 'Master Shears - Firebloom bonus'),
(2292, 9413, 91513, 40, 1, 0, 1, 1, 'Grand Master Shears - Firebloom bonus');

-- Purple Lotus (Item 8831, Loot Tables 6142, 17200)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6142, 9114, 91214, 10, 1, 0, 1, 1, 'Journeyman Shears - Purple Lotus bonus'),
(17200, 9114, 91214, 10, 1, 0, 1, 1, 'Journeyman Shears - Purple Lotus bonus'),
(6142, 9214, 91314, 20, 1, 0, 1, 1, 'Artisan Shears - Purple Lotus bonus'),
(17200, 9214, 91314, 20, 1, 0, 1, 1, 'Artisan Shears - Purple Lotus bonus'),
(6142, 9314, 91414, 30, 1, 0, 1, 1, 'Master Shears - Purple Lotus bonus'),
(17200, 9314, 91414, 30, 1, 0, 1, 1, 'Master Shears - Purple Lotus bonus'),
(6142, 9414, 91514, 40, 1, 0, 1, 1, 'Grand Master Shears - Purple Lotus bonus'),
(17200, 9414, 91514, 40, 1, 0, 1, 1, 'Grand Master Shears - Purple Lotus bonus');

-- Arthas' Tears (Item 8836, Loot Tables 6150, 13970)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6150, 9115, 91215, 10, 1, 0, 1, 1, 'Journeyman Shears - Arthas'' Tears bonus'),
(13970, 9115, 91215, 10, 1, 0, 1, 1, 'Journeyman Shears - Arthas'' Tears bonus'),
(6150, 9215, 91315, 20, 1, 0, 1, 1, 'Artisan Shears - Arthas'' Tears bonus'),
(13970, 9215, 91315, 20, 1, 0, 1, 1, 'Artisan Shears - Arthas'' Tears bonus'),
(6150, 9315, 91415, 30, 1, 0, 1, 1, 'Master Shears - Arthas'' Tears bonus'),
(13970, 9315, 91415, 30, 1, 0, 1, 1, 'Master Shears - Arthas'' Tears bonus'),
(6150, 9415, 91515, 40, 1, 0, 1, 1, 'Grand Master Shears - Arthas'' Tears bonus'),
(13970, 9415, 91515, 40, 1, 0, 1, 1, 'Grand Master Shears - Arthas'' Tears bonus');

-- Sungrass (Item 8838, Loot Tables 6151, 13965, 17201)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6151, 9116, 91216, 10, 1, 0, 1, 1, 'Journeyman Shears - Sungrass bonus'),
(13965, 9116, 91216, 10, 1, 0, 1, 1, 'Journeyman Shears - Sungrass bonus'),
(17201, 9116, 91216, 10, 1, 0, 1, 1, 'Journeyman Shears - Sungrass bonus'),
(6151, 9216, 91316, 20, 1, 0, 1, 1, 'Artisan Shears - Sungrass bonus'),
(13965, 9216, 91316, 20, 1, 0, 1, 1, 'Artisan Shears - Sungrass bonus'),
(17201, 9216, 91316, 20, 1, 0, 1, 1, 'Artisan Shears - Sungrass bonus'),
(6151, 9316, 91416, 30, 1, 0, 1, 1, 'Master Shears - Sungrass bonus'),
(13965, 9316, 91416, 30, 1, 0, 1, 1, 'Master Shears - Sungrass bonus'),
(17201, 9316, 91416, 30, 1, 0, 1, 1, 'Master Shears - Sungrass bonus'),
(6151, 9416, 91516, 40, 1, 0, 1, 1, 'Grand Master Shears - Sungrass bonus'),
(13965, 9416, 91516, 40, 1, 0, 1, 1, 'Grand Master Shears - Sungrass bonus'),
(17201, 9416, 91516, 40, 1, 0, 1, 1, 'Grand Master Shears - Sungrass bonus');

-- Blindweed (Item 8839, Loot Tables 6152, 19630)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6152, 9117, 91217, 10, 1, 0, 1, 1, 'Journeyman Shears - Blindweed bonus'),
(19630, 9117, 91217, 10, 1, 0, 1, 1, 'Journeyman Shears - Blindweed bonus'),
(6152, 9217, 91317, 20, 1, 0, 1, 1, 'Artisan Shears - Blindweed bonus'),
(19630, 9217, 91317, 20, 1, 0, 1, 1, 'Artisan Shears - Blindweed bonus'),
(6152, 9317, 91417, 30, 1, 0, 1, 1, 'Master Shears - Blindweed bonus'),
(19630, 9317, 91417, 30, 1, 0, 1, 1, 'Master Shears - Blindweed bonus'),
(6152, 9417, 91517, 40, 1, 0, 1, 1, 'Grand Master Shears - Blindweed bonus'),
(19630, 9417, 91517, 40, 1, 0, 1, 1, 'Grand Master Shears - Blindweed bonus');

-- Ghost Mushroom (Item 8845, Loot Table 6312)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6312, 9118, 91218, 10, 1, 0, 1, 1, 'Journeyman Shears - Ghost Mushroom bonus'),
(6312, 9218, 91318, 20, 1, 0, 1, 1, 'Artisan Shears - Ghost Mushroom bonus'),
(6312, 9318, 91418, 30, 1, 0, 1, 1, 'Master Shears - Ghost Mushroom bonus'),
(6312, 9418, 91518, 40, 1, 0, 1, 1, 'Grand Master Shears - Ghost Mushroom bonus');

-- Gromsblood (Item 8846, Loot Tables 6313, 13966)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(6313, 9119, 91219, 10, 1, 0, 1, 1, 'Journeyman Shears - Gromsblood bonus'),
(13966, 9119, 91219, 10, 1, 0, 1, 1, 'Journeyman Shears - Gromsblood bonus'),
(6313, 9219, 91319, 20, 1, 0, 1, 1, 'Artisan Shears - Gromsblood bonus'),
(13966, 9219, 91319, 20, 1, 0, 1, 1, 'Artisan Shears - Gromsblood bonus'),
(6313, 9319, 91419, 30, 1, 0, 1, 1, 'Master Shears - Gromsblood bonus'),
(13966, 9319, 91419, 30, 1, 0, 1, 1, 'Master Shears - Gromsblood bonus'),
(6313, 9419, 91519, 40, 1, 0, 1, 1, 'Grand Master Shears - Gromsblood bonus'),
(13966, 9419, 91519, 40, 1, 0, 1, 1, 'Grand Master Shears - Gromsblood bonus');

-- Golden Sansam (Item 13464, Loot Tables 13945, 13967, 17202)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13945, 9120, 91220, 10, 1, 0, 1, 1, 'Journeyman Shears - Golden Sansam bonus'),
(13967, 9120, 91220, 10, 1, 0, 1, 1, 'Journeyman Shears - Golden Sansam bonus'),
(17202, 9120, 91220, 10, 1, 0, 1, 1, 'Journeyman Shears - Golden Sansam bonus'),
(13945, 9220, 91320, 20, 1, 0, 1, 1, 'Artisan Shears - Golden Sansam bonus'),
(13967, 9220, 91320, 20, 1, 0, 1, 1, 'Artisan Shears - Golden Sansam bonus'),
(17202, 9220, 91320, 20, 1, 0, 1, 1, 'Artisan Shears - Golden Sansam bonus'),
(13945, 9320, 91420, 30, 1, 0, 1, 1, 'Master Shears - Golden Sansam bonus'),
(13967, 9320, 91420, 30, 1, 0, 1, 1, 'Master Shears - Golden Sansam bonus'),
(17202, 9320, 91420, 30, 1, 0, 1, 1, 'Master Shears - Golden Sansam bonus'),
(13945, 9420, 91520, 40, 1, 0, 1, 1, 'Grand Master Shears - Golden Sansam bonus'),
(13967, 9420, 91520, 40, 1, 0, 1, 1, 'Grand Master Shears - Golden Sansam bonus'),
(17202, 9420, 91520, 40, 1, 0, 1, 1, 'Grand Master Shears - Golden Sansam bonus');

-- Dreamfoil (Item 13463, Loot Tables 13946, 13968, 17203)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13946, 9121, 91221, 10, 1, 0, 1, 1, 'Journeyman Shears - Dreamfoil bonus'),
(13968, 9121, 91221, 10, 1, 0, 1, 1, 'Journeyman Shears - Dreamfoil bonus'),
(17203, 9121, 91221, 10, 1, 0, 1, 1, 'Journeyman Shears - Dreamfoil bonus'),
(13946, 9221, 91321, 20, 1, 0, 1, 1, 'Artisan Shears - Dreamfoil bonus'),
(13968, 9221, 91321, 20, 1, 0, 1, 1, 'Artisan Shears - Dreamfoil bonus'),
(17203, 9221, 91321, 20, 1, 0, 1, 1, 'Artisan Shears - Dreamfoil bonus'),
(13946, 9321, 91421, 30, 1, 0, 1, 1, 'Master Shears - Dreamfoil bonus'),
(13968, 9321, 91421, 30, 1, 0, 1, 1, 'Master Shears - Dreamfoil bonus'),
(17203, 9321, 91421, 30, 1, 0, 1, 1, 'Master Shears - Dreamfoil bonus'),
(13946, 9421, 91521, 40, 1, 0, 1, 1, 'Grand Master Shears - Dreamfoil bonus'),
(13968, 9421, 91521, 40, 1, 0, 1, 1, 'Grand Master Shears - Dreamfoil bonus'),
(17203, 9421, 91521, 40, 1, 0, 1, 1, 'Grand Master Shears - Dreamfoil bonus');

-- Mountain Silversage (Item 13465, Loot Tables 13947, 13969, 17204)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13947, 9122, 91222, 10, 1, 0, 1, 1, 'Journeyman Shears - Mountain Silversage bonus'),
(13969, 9122, 91222, 10, 1, 0, 1, 1, 'Journeyman Shears - Mountain Silversage bonus'),
(17204, 9122, 91222, 10, 1, 0, 1, 1, 'Journeyman Shears - Mountain Silversage bonus'),
(13947, 9222, 91322, 20, 1, 0, 1, 1, 'Artisan Shears - Mountain Silversage bonus'),
(13969, 9222, 91322, 20, 1, 0, 1, 1, 'Artisan Shears - Mountain Silversage bonus'),
(17204, 9222, 91322, 20, 1, 0, 1, 1, 'Artisan Shears - Mountain Silversage bonus'),
(13947, 9322, 91422, 30, 1, 0, 1, 1, 'Master Shears - Mountain Silversage bonus'),
(13969, 9322, 91422, 30, 1, 0, 1, 1, 'Master Shears - Mountain Silversage bonus'),
(17204, 9322, 91422, 30, 1, 0, 1, 1, 'Master Shears - Mountain Silversage bonus'),
(13947, 9422, 91522, 40, 1, 0, 1, 1, 'Grand Master Shears - Mountain Silversage bonus'),
(13969, 9422, 91522, 40, 1, 0, 1, 1, 'Grand Master Shears - Mountain Silversage bonus'),
(17204, 9422, 91522, 40, 1, 0, 1, 1, 'Grand Master Shears - Mountain Silversage bonus');

-- Plaguebloom (Item 13466, Loot Tables 13948, 13971)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13948, 9123, 91223, 10, 1, 0, 1, 1, 'Journeyman Shears - Plaguebloom bonus'),
(13971, 9123, 91223, 10, 1, 0, 1, 1, 'Journeyman Shears - Plaguebloom bonus'),
(13948, 9223, 91323, 20, 1, 0, 1, 1, 'Artisan Shears - Plaguebloom bonus'),
(13971, 9223, 91323, 20, 1, 0, 1, 1, 'Artisan Shears - Plaguebloom bonus'),
(13948, 9323, 91423, 30, 1, 0, 1, 1, 'Master Shears - Plaguebloom bonus'),
(13971, 9323, 91423, 30, 1, 0, 1, 1, 'Master Shears - Plaguebloom bonus'),
(13948, 9423, 91523, 40, 1, 0, 1, 1, 'Grand Master Shears - Plaguebloom bonus'),
(13971, 9423, 91523, 40, 1, 0, 1, 1, 'Grand Master Shears - Plaguebloom bonus');

-- Icecap (Item 13467, Loot Table 13949)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13949, 9124, 91224, 10, 1, 0, 1, 1, 'Journeyman Shears - Icecap bonus'),
(13949, 9224, 91324, 20, 1, 0, 1, 1, 'Artisan Shears - Icecap bonus'),
(13949, 9324, 91424, 30, 1, 0, 1, 1, 'Master Shears - Icecap bonus'),
(13949, 9424, 91524, 40, 1, 0, 1, 1, 'Grand Master Shears - Icecap bonus');

-- Black Lotus (Item 13468, Loot Table 13950)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(13950, 9125, 91225, 10, 1, 0, 1, 1, 'Journeyman Shears - Black Lotus bonus'),
(13950, 9225, 91325, 20, 1, 0, 1, 1, 'Artisan Shears - Black Lotus bonus'),
(13950, 9325, 91425, 30, 1, 0, 1, 1, 'Master Shears - Black Lotus bonus'),
(13950, 9425, 91525, 40, 1, 0, 1, 1, 'Grand Master Shears - Black Lotus bonus');

-- Swiftthistle (Item 2452, Loot Tables 1417, 1418, 2514, 2515 - from Mageroyal and Briarthorn)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(1417, 9126, 91226, 10, 1, 0, 1, 1, 'Journeyman Shears - Swiftthistle bonus'),
(1418, 9126, 91226, 10, 1, 0, 1, 1, 'Journeyman Shears - Swiftthistle bonus'),
(2514, 9126, 91226, 10, 1, 0, 1, 1, 'Journeyman Shears - Swiftthistle bonus'),
(2515, 9126, 91226, 10, 1, 0, 1, 1, 'Journeyman Shears - Swiftthistle bonus'),
(1417, 9226, 91326, 20, 1, 0, 1, 1, 'Artisan Shears - Swiftthistle bonus'),
(1418, 9226, 91326, 20, 1, 0, 1, 1, 'Artisan Shears - Swiftthistle bonus'),
(2514, 9226, 91326, 20, 1, 0, 1, 1, 'Artisan Shears - Swiftthistle bonus'),
(2515, 9226, 91326, 20, 1, 0, 1, 1, 'Artisan Shears - Swiftthistle bonus'),
(1417, 9326, 91426, 30, 1, 0, 1, 1, 'Master Shears - Swiftthistle bonus'),
(1418, 9326, 91426, 30, 1, 0, 1, 1, 'Master Shears - Swiftthistle bonus'),
(2514, 9326, 91426, 30, 1, 0, 1, 1, 'Master Shears - Swiftthistle bonus'),
(2515, 9326, 91426, 30, 1, 0, 1, 1, 'Master Shears - Swiftthistle bonus'),
(1417, 9426, 91526, 40, 1, 0, 1, 1, 'Grand Master Shears - Swiftthistle bonus'),
(1418, 9426, 91526, 40, 1, 0, 1, 1, 'Grand Master Shears - Swiftthistle bonus'),
(2514, 9426, 91526, 40, 1, 0, 1, 1, 'Grand Master Shears - Swiftthistle bonus'),
(2515, 9426, 91526, 40, 1, 0, 1, 1, 'Grand Master Shears - Swiftthistle bonus');

-- ===============================
-- TBC HERBS - GAMEOBJECT REFERENCES
-- ===============================

-- Bloodthistle (Item 22710, Loot Tables 18009, 18379)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18009, 9127, 91227, 10, 1, 0, 1, 1, 'Journeyman Shears - Bloodthistle bonus'),
(18379, 9127, 91227, 10, 1, 0, 1, 1, 'Journeyman Shears - Bloodthistle bonus'),
(18009, 9227, 91327, 20, 1, 0, 1, 1, 'Artisan Shears - Bloodthistle bonus'),
(18379, 9227, 91327, 20, 1, 0, 1, 1, 'Artisan Shears - Bloodthistle bonus'),
(18009, 9327, 91427, 30, 1, 0, 1, 1, 'Master Shears - Bloodthistle bonus'),
(18379, 9327, 91427, 30, 1, 0, 1, 1, 'Master Shears - Bloodthistle bonus'),
(18009, 9427, 91527, 40, 1, 0, 1, 1, 'Grand Master Shears - Bloodthistle bonus'),
(18379, 9427, 91527, 40, 1, 0, 1, 1, 'Grand Master Shears - Bloodthistle bonus');

-- Felweed (Item 22785, Loot Tables 18111, 19628)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18111, 9128, 91228, 10, 1, 0, 1, 1, 'Journeyman Shears - Felweed bonus'),
(19628, 9128, 91228, 10, 1, 0, 1, 1, 'Journeyman Shears - Felweed bonus'),
(18111, 9228, 91328, 20, 1, 0, 1, 1, 'Artisan Shears - Felweed bonus'),
(19628, 9228, 91328, 20, 1, 0, 1, 1, 'Artisan Shears - Felweed bonus'),
(18111, 9328, 91428, 30, 1, 0, 1, 1, 'Master Shears - Felweed bonus'),
(19628, 9328, 91428, 30, 1, 0, 1, 1, 'Master Shears - Felweed bonus'),
(18111, 9428, 91528, 40, 1, 0, 1, 1, 'Grand Master Shears - Felweed bonus'),
(19628, 9428, 91528, 40, 1, 0, 1, 1, 'Grand Master Shears - Felweed bonus');

-- Dreaming Glory (Item 22786, Loot Tables 18112, 19629)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18112, 9129, 91229, 10, 1, 0, 1, 1, 'Journeyman Shears - Dreaming Glory bonus'),
(19629, 9129, 91229, 10, 1, 0, 1, 1, 'Journeyman Shears - Dreaming Glory bonus'),
(18112, 9229, 91329, 20, 1, 0, 1, 1, 'Artisan Shears - Dreaming Glory bonus'),
(19629, 9229, 91329, 20, 1, 0, 1, 1, 'Artisan Shears - Dreaming Glory bonus'),
(18112, 9329, 91429, 30, 1, 0, 1, 1, 'Master Shears - Dreaming Glory bonus'),
(19629, 9329, 91429, 30, 1, 0, 1, 1, 'Master Shears - Dreaming Glory bonus'),
(18112, 9429, 91529, 40, 1, 0, 1, 1, 'Grand Master Shears - Dreaming Glory bonus'),
(19629, 9429, 91529, 40, 1, 0, 1, 1, 'Grand Master Shears - Dreaming Glory bonus');

-- Ragveil (Item 22787, Loot Tables 18113, 19627)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18113, 9130, 91230, 10, 1, 0, 1, 1, 'Journeyman Shears - Ragveil bonus'),
(19627, 9130, 91230, 10, 1, 0, 1, 1, 'Journeyman Shears - Ragveil bonus'),
(18113, 9230, 91330, 20, 1, 0, 1, 1, 'Artisan Shears - Ragveil bonus'),
(19627, 9230, 91330, 20, 1, 0, 1, 1, 'Artisan Shears - Ragveil bonus'),
(18113, 9330, 91430, 30, 1, 0, 1, 1, 'Master Shears - Ragveil bonus'),
(19627, 9330, 91430, 30, 1, 0, 1, 1, 'Master Shears - Ragveil bonus'),
(18113, 9430, 91530, 40, 1, 0, 1, 1, 'Grand Master Shears - Ragveil bonus'),
(19627, 9430, 91530, 40, 1, 0, 1, 1, 'Grand Master Shears - Ragveil bonus');

-- Terocone (Item 22789, Loot Table 18115)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18115, 9131, 91231, 10, 1, 0, 1, 1, 'Journeyman Shears - Terocone bonus'),
(18115, 9231, 91331, 20, 1, 0, 1, 1, 'Artisan Shears - Terocone bonus'),
(18115, 9331, 91431, 30, 1, 0, 1, 1, 'Master Shears - Terocone bonus'),
(18115, 9431, 91531, 40, 1, 0, 1, 1, 'Grand Master Shears - Terocone bonus');

-- Ancient Lichen (Item 22790, Loot Table 18116)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18116, 9132, 91232, 10, 1, 0, 1, 1, 'Journeyman Shears - Ancient Lichen bonus'),
(18116, 9232, 91332, 20, 1, 0, 1, 1, 'Artisan Shears - Ancient Lichen bonus'),
(18116, 9332, 91432, 30, 1, 0, 1, 1, 'Master Shears - Ancient Lichen bonus'),
(18116, 9432, 91532, 40, 1, 0, 1, 1, 'Grand Master Shears - Ancient Lichen bonus');

-- Netherbloom (Item 22791, Loot Table 18117)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18117, 9133, 91233, 10, 1, 0, 1, 1, 'Journeyman Shears - Netherbloom bonus'),
(18117, 9233, 91333, 20, 1, 0, 1, 1, 'Artisan Shears - Netherbloom bonus'),
(18117, 9333, 91433, 30, 1, 0, 1, 1, 'Master Shears - Netherbloom bonus'),
(18117, 9433, 91533, 40, 1, 0, 1, 1, 'Grand Master Shears - Netherbloom bonus');

-- Nightmare Vine (Item 22792, Loot Table 18118)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18118, 9134, 91234, 10, 1, 0, 1, 1, 'Journeyman Shears - Nightmare Vine bonus'),
(18118, 9234, 91334, 20, 1, 0, 1, 1, 'Artisan Shears - Nightmare Vine bonus'),
(18118, 9334, 91434, 30, 1, 0, 1, 1, 'Master Shears - Nightmare Vine bonus'),
(18118, 9434, 91534, 40, 1, 0, 1, 1, 'Grand Master Shears - Nightmare Vine bonus');

-- Mana Thistle (Item 22793, Loot Table 18119)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(18119, 9135, 91235, 10, 1, 0, 1, 1, 'Journeyman Shears - Mana Thistle bonus'),
(18119, 9235, 91335, 20, 1, 0, 1, 1, 'Artisan Shears - Mana Thistle bonus'),
(18119, 9335, 91435, 30, 1, 0, 1, 1, 'Master Shears - Mana Thistle bonus'),
(18119, 9435, 91535, 40, 1, 0, 1, 1, 'Grand Master Shears - Mana Thistle bonus');

-- ===============================
-- WOTLK HERBS - GAMEOBJECT REFERENCES
-- ===============================

-- Goldclover (Item 36901, Loot Tables 24093, 25094, 25095, 25096)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(24093, 9136, 91236, 10, 1, 0, 1, 1, 'Journeyman Shears - Goldclover bonus'),
(25094, 9136, 91236, 10, 1, 0, 1, 1, 'Journeyman Shears - Goldclover bonus'),
(25095, 9136, 91236, 10, 1, 0, 1, 1, 'Journeyman Shears - Goldclover bonus'),
(25096, 9136, 91236, 10, 1, 0, 1, 1, 'Journeyman Shears - Goldclover bonus'),
(24093, 9236, 91336, 20, 1, 0, 1, 1, 'Artisan Shears - Goldclover bonus'),
(25094, 9236, 91336, 20, 1, 0, 1, 1, 'Artisan Shears - Goldclover bonus'),
(25095, 9236, 91336, 20, 1, 0, 1, 1, 'Artisan Shears - Goldclover bonus'),
(25096, 9236, 91336, 20, 1, 0, 1, 1, 'Artisan Shears - Goldclover bonus'),
(24093, 9336, 91436, 30, 1, 0, 1, 1, 'Master Shears - Goldclover bonus'),
(25094, 9336, 91436, 30, 1, 0, 1, 1, 'Master Shears - Goldclover bonus'),
(25095, 9336, 91436, 30, 1, 0, 1, 1, 'Master Shears - Goldclover bonus'),
(25096, 9336, 91436, 30, 1, 0, 1, 1, 'Master Shears - Goldclover bonus'),
(24093, 9436, 91536, 40, 1, 0, 1, 1, 'Grand Master Shears - Goldclover bonus'),
(25094, 9436, 91536, 40, 1, 0, 1, 1, 'Grand Master Shears - Goldclover bonus'),
(25095, 9436, 91536, 40, 1, 0, 1, 1, 'Grand Master Shears - Goldclover bonus'),
(25096, 9436, 91536, 40, 1, 0, 1, 1, 'Grand Master Shears - Goldclover bonus');

-- Adder's Tongue (Item 36903, Loot Table 25093)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(25093, 9137, 91237, 10, 1, 0, 1, 1, 'Journeyman Shears - Adder''s Tongue bonus'),
(25093, 9237, 91337, 20, 1, 0, 1, 1, 'Artisan Shears - Adder''s Tongue bonus'),
(25093, 9337, 91437, 30, 1, 0, 1, 1, 'Master Shears - Adder''s Tongue bonus'),
(25093, 9437, 91537, 40, 1, 0, 1, 1, 'Grand Master Shears - Adder''s Tongue bonus');

-- Tiger Lily (Item 36904, Loot Tables 24224, 25094, 25095, 25096)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(24224, 9138, 91238, 10, 1, 0, 1, 1, 'Journeyman Shears - Tiger Lily bonus'),
(25094, 9138, 91238, 10, 1, 0, 1, 1, 'Journeyman Shears - Tiger Lily bonus'),
(25095, 9138, 91238, 10, 1, 0, 1, 1, 'Journeyman Shears - Tiger Lily bonus'),
(25096, 9138, 91238, 10, 1, 0, 1, 1, 'Journeyman Shears - Tiger Lily bonus'),
(24224, 9238, 91338, 20, 1, 0, 1, 1, 'Artisan Shears - Tiger Lily bonus'),
(25094, 9238, 91338, 20, 1, 0, 1, 1, 'Artisan Shears - Tiger Lily bonus'),
(25095, 9238, 91338, 20, 1, 0, 1, 1, 'Artisan Shears - Tiger Lily bonus'),
(25096, 9238, 91338, 20, 1, 0, 1, 1, 'Artisan Shears - Tiger Lily bonus'),
(24224, 9338, 91438, 30, 1, 0, 1, 1, 'Master Shears - Tiger Lily bonus'),
(25094, 9338, 91438, 30, 1, 0, 1, 1, 'Master Shears - Tiger Lily bonus'),
(25095, 9338, 91438, 30, 1, 0, 1, 1, 'Master Shears - Tiger Lily bonus'),
(25096, 9338, 91438, 30, 1, 0, 1, 1, 'Master Shears - Tiger Lily bonus'),
(24224, 9438, 91538, 40, 1, 0, 1, 1, 'Grand Master Shears - Tiger Lily bonus'),
(25094, 9438, 91538, 40, 1, 0, 1, 1, 'Grand Master Shears - Tiger Lily bonus'),
(25095, 9438, 91538, 40, 1, 0, 1, 1, 'Grand Master Shears - Tiger Lily bonus'),
(25096, 9438, 91538, 40, 1, 0, 1, 1, 'Grand Master Shears - Tiger Lily bonus');

-- Lichbloom (Item 36905, Loot Table 24226)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(24226, 9139, 91239, 10, 1, 0, 1, 1, 'Journeyman Shears - Lichbloom bonus'),
(24226, 9239, 91339, 20, 1, 0, 1, 1, 'Artisan Shears - Lichbloom bonus'),
(24226, 9339, 91439, 30, 1, 0, 1, 1, 'Master Shears - Lichbloom bonus'),
(24226, 9439, 91539, 40, 1, 0, 1, 1, 'Grand Master Shears - Lichbloom bonus');

-- Icethorn (Item 36906, Loot Table 24227)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(24227, 9140, 91240, 10, 1, 0, 1, 1, 'Journeyman Shears - Icethorn bonus'),
(24227, 9240, 91340, 20, 1, 0, 1, 1, 'Artisan Shears - Icethorn bonus'),
(24227, 9340, 91440, 30, 1, 0, 1, 1, 'Master Shears - Icethorn bonus'),
(24227, 9440, 91540, 40, 1, 0, 1, 1, 'Grand Master Shears - Icethorn bonus');

-- Talandra's Rose (Item 36907, Loot Tables 24225, 25094, 25095, 25096)
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(24225, 9141, 91241, 10, 1, 0, 1, 1, 'Journeyman Shears - Talandra''s Rose bonus'),
(25094, 9141, 91241, 10, 1, 0, 1, 1, 'Journeyman Shears - Talandra''s Rose bonus'),
(25095, 9141, 91241, 10, 1, 0, 1, 1, 'Journeyman Shears - Talandra''s Rose bonus'),
(25096, 9141, 91241, 10, 1, 0, 1, 1, 'Journeyman Shears - Talandra''s Rose bonus'),
(24225, 9241, 91341, 20, 1, 0, 1, 1, 'Artisan Shears - Talandra''s Rose bonus'),
(25094, 9241, 91341, 20, 1, 0, 1, 1, 'Artisan Shears - Talandra''s Rose bonus'),
(25095, 9241, 91341, 20, 1, 0, 1, 1, 'Artisan Shears - Talandra''s Rose bonus'),
(25096, 9241, 91341, 20, 1, 0, 1, 1, 'Artisan Shears - Talandra''s Rose bonus'),
(24225, 9341, 91441, 30, 1, 0, 1, 1, 'Master Shears - Talandra''s Rose bonus'),
(25094, 9341, 91441, 30, 1, 0, 1, 1, 'Master Shears - Talandra''s Rose bonus'),
(25095, 9341, 91441, 30, 1, 0, 1, 1, 'Master Shears - Talandra''s Rose bonus'),
(25096, 9341, 91441, 30, 1, 0, 1, 1, 'Master Shears - Talandra''s Rose bonus'),
(24225, 9441, 91541, 40, 1, 0, 1, 1, 'Grand Master Shears - Talandra''s Rose bonus'),
(25094, 9441, 91541, 40, 1, 0, 1, 1, 'Grand Master Shears - Talandra''s Rose bonus'),
(25095, 9441, 91541, 40, 1, 0, 1, 1, 'Grand Master Shears - Talandra''s Rose bonus'),
(25096, 9441, 91541, 40, 1, 0, 1, 1, 'Grand Master Shears - Talandra''s Rose bonus');

-- ===================
-- CONDITIONS
-- ===================
-- Check for Pruning Shears auras before awarding bonus herbs
-- SourceTypeOrReferenceId = 10 (CONDITION_SOURCE_TYPE_REFERENCE_LOOT_TEMPLATE)
-- ConditionTypeOrReference = 1 (CONDITION_AURA)
-- ConditionValue1 = Spell ID
-- ConditionValue2 = Effect Index (1 = Effect2)

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `NegativeCondition`, `Comment`) VALUES
-- Tier 1: Journeyman Shears (aura 91140, effect index 1)
(10, 91200, 2447, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Peacebloom'),
(10, 91201, 765, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Silverleaf'),
(10, 91202, 2449, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Earthroot'),
(10, 91203, 785, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Mageroyal'),
(10, 91204, 2450, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Briarthorn'),
(10, 91205, 2453, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Bruiseweed'),
(10, 91206, 3820, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Stranglekelp'),
(10, 91207, 3356, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Kingsblood'),
(10, 91208, 3357, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Liferoot'),
(10, 91209, 3818, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Fadeleaf'),
(10, 91210, 3821, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Goldthorn'),
(10, 91211, 3358, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Khadgar''s Whisker'),
(10, 91212, 3819, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Wintersbite'),
(10, 91213, 4625, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Firebloom'),
(10, 91214, 8831, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Purple Lotus'),
(10, 91215, 8836, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Arthas'' Tears'),
(10, 91216, 8838, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Sungrass'),
(10, 91217, 8839, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Blindweed'),
(10, 91218, 8845, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Ghost Mushroom'),
(10, 91219, 8846, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Gromsblood'),
(10, 91220, 13464, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Golden Sansam'),
(10, 91221, 13463, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Dreamfoil'),
(10, 91222, 13465, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Mountain Silversage'),
(10, 91223, 13466, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Plaguebloom'),
(10, 91224, 13467, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Icecap'),
(10, 91225, 13468, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Black Lotus'),
(10, 91226, 2452, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Swiftthistle'),

-- Tier 2: Artisan Shears (aura 91141, effect index 1)
(10, 91300, 2447, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Peacebloom'),
(10, 91301, 765, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Silverleaf'),
(10, 91302, 2449, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Earthroot'),
(10, 91303, 785, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Mageroyal'),
(10, 91304, 2450, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Briarthorn'),
(10, 91305, 2453, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Bruiseweed'),
(10, 91306, 3820, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Stranglekelp'),
(10, 91307, 3356, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Kingsblood'),
(10, 91308, 3357, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Liferoot'),
(10, 91309, 3818, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Fadeleaf'),
(10, 91310, 3821, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Goldthorn'),
(10, 91311, 3358, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Khadgar''s Whisker'),
(10, 91312, 3819, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Wintersbite'),
(10, 91313, 4625, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Firebloom'),
(10, 91314, 8831, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Purple Lotus'),
(10, 91315, 8836, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Arthas'' Tears'),
(10, 91316, 8838, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Sungrass'),
(10, 91317, 8839, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Blindweed'),
(10, 91318, 8845, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Ghost Mushroom'),
(10, 91319, 8846, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Gromsblood'),
(10, 91320, 13464, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Golden Sansam'),
(10, 91321, 13463, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Dreamfoil'),
(10, 91322, 13465, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Mountain Silversage'),
(10, 91323, 13466, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Plaguebloom'),
(10, 91324, 13467, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Icecap'),
(10, 91325, 13468, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Black Lotus'),
(10, 91326, 2452, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Swiftthistle'),

-- Tier 3: Master Shears (aura 91142, effect index 1)
(10, 91400, 2447, 0, 1, 0, 91142, 1, 0, 'Master Shears - Peacebloom'),
(10, 91401, 765, 0, 1, 0, 91142, 1, 0, 'Master Shears - Silverleaf'),
(10, 91402, 2449, 0, 1, 0, 91142, 1, 0, 'Master Shears - Earthroot'),
(10, 91403, 785, 0, 1, 0, 91142, 1, 0, 'Master Shears - Mageroyal'),
(10, 91404, 2450, 0, 1, 0, 91142, 1, 0, 'Master Shears - Briarthorn'),
(10, 91405, 2453, 0, 1, 0, 91142, 1, 0, 'Master Shears - Bruiseweed'),
(10, 91406, 3820, 0, 1, 0, 91142, 1, 0, 'Master Shears - Stranglekelp'),
(10, 91407, 3356, 0, 1, 0, 91142, 1, 0, 'Master Shears - Kingsblood'),
(10, 91408, 3357, 0, 1, 0, 91142, 1, 0, 'Master Shears - Liferoot'),
(10, 91409, 3818, 0, 1, 0, 91142, 1, 0, 'Master Shears - Fadeleaf'),
(10, 91410, 3821, 0, 1, 0, 91142, 1, 0, 'Master Shears - Goldthorn'),
(10, 91411, 3358, 0, 1, 0, 91142, 1, 0, 'Master Shears - Khadgar''s Whisker'),
(10, 91412, 3819, 0, 1, 0, 91142, 1, 0, 'Master Shears - Wintersbite'),
(10, 91413, 4625, 0, 1, 0, 91142, 1, 0, 'Master Shears - Firebloom'),
(10, 91414, 8831, 0, 1, 0, 91142, 1, 0, 'Master Shears - Purple Lotus'),
(10, 91415, 8836, 0, 1, 0, 91142, 1, 0, 'Master Shears - Arthas'' Tears'),
(10, 91416, 8838, 0, 1, 0, 91142, 1, 0, 'Master Shears - Sungrass'),
(10, 91417, 8839, 0, 1, 0, 91142, 1, 0, 'Master Shears - Blindweed'),
(10, 91418, 8845, 0, 1, 0, 91142, 1, 0, 'Master Shears - Ghost Mushroom'),
(10, 91419, 8846, 0, 1, 0, 91142, 1, 0, 'Master Shears - Gromsblood'),
(10, 91420, 13464, 0, 1, 0, 91142, 1, 0, 'Master Shears - Golden Sansam'),
(10, 91421, 13463, 0, 1, 0, 91142, 1, 0, 'Master Shears - Dreamfoil'),
(10, 91422, 13465, 0, 1, 0, 91142, 1, 0, 'Master Shears - Mountain Silversage'),
(10, 91423, 13466, 0, 1, 0, 91142, 1, 0, 'Master Shears - Plaguebloom'),
(10, 91424, 13467, 0, 1, 0, 91142, 1, 0, 'Master Shears - Icecap'),
(10, 91425, 13468, 0, 1, 0, 91142, 1, 0, 'Master Shears - Black Lotus'),
(10, 91426, 2452, 0, 1, 0, 91142, 1, 0, 'Master Shears - Swiftthistle'),

-- Tier 4: Grand Master Shears (aura 91143, effect index 1)
(10, 91500, 2447, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Peacebloom'),
(10, 91501, 765, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Silverleaf'),
(10, 91502, 2449, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Earthroot'),
(10, 91503, 785, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Mageroyal'),
(10, 91504, 2450, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Briarthorn'),
(10, 91505, 2453, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Bruiseweed'),
(10, 91506, 3820, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Stranglekelp'),
(10, 91507, 3356, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Kingsblood'),
(10, 91508, 3357, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Liferoot'),
(10, 91509, 3818, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Fadeleaf'),
(10, 91510, 3821, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Goldthorn'),
(10, 91511, 3358, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Khadgar''s Whisker'),
(10, 91512, 3819, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Wintersbite'),
(10, 91513, 4625, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Firebloom'),
(10, 91514, 8831, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Purple Lotus'),
(10, 91515, 8836, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Arthas'' Tears'),
(10, 91516, 8838, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Sungrass'),
(10, 91517, 8839, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Blindweed'),
(10, 91518, 8845, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Ghost Mushroom'),
(10, 91519, 8846, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Gromsblood'),
(10, 91520, 13464, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Golden Sansam'),
(10, 91521, 13463, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Dreamfoil'),
(10, 91522, 13465, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Mountain Silversage'),
(10, 91523, 13466, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Plaguebloom'),
(10, 91524, 13467, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Icecap'),
(10, 91525, 13468, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Black Lotus'),
(10, 91526, 2452, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Swiftthistle'),

-- TBC HERBS CONDITIONS
-- Tier 1: Journeyman Shears (aura 91140)
(10, 91227, 22710, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Bloodthistle'),
(10, 91228, 22785, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Felweed'),
(10, 91229, 22786, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Dreaming Glory'),
(10, 91230, 22787, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Ragveil'),
(10, 91231, 22789, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Terocone'),
(10, 91232, 22790, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Ancient Lichen'),
(10, 91233, 22791, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Netherbloom'),
(10, 91234, 22792, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Nightmare Vine'),
(10, 91235, 22793, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Mana Thistle'),

-- Tier 2: Artisan Shears (aura 91141)
(10, 91327, 22710, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Bloodthistle'),
(10, 91328, 22785, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Felweed'),
(10, 91329, 22786, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Dreaming Glory'),
(10, 91330, 22787, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Ragveil'),
(10, 91331, 22789, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Terocone'),
(10, 91332, 22790, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Ancient Lichen'),
(10, 91333, 22791, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Netherbloom'),
(10, 91334, 22792, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Nightmare Vine'),
(10, 91335, 22793, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Mana Thistle'),

-- Tier 3: Master Shears (aura 91142)
(10, 91427, 22710, 0, 1, 0, 91142, 1, 0, 'Master Shears - Bloodthistle'),
(10, 91428, 22785, 0, 1, 0, 91142, 1, 0, 'Master Shears - Felweed'),
(10, 91429, 22786, 0, 1, 0, 91142, 1, 0, 'Master Shears - Dreaming Glory'),
(10, 91430, 22787, 0, 1, 0, 91142, 1, 0, 'Master Shears - Ragveil'),
(10, 91431, 22789, 0, 1, 0, 91142, 1, 0, 'Master Shears - Terocone'),
(10, 91432, 22790, 0, 1, 0, 91142, 1, 0, 'Master Shears - Ancient Lichen'),
(10, 91433, 22791, 0, 1, 0, 91142, 1, 0, 'Master Shears - Netherbloom'),
(10, 91434, 22792, 0, 1, 0, 91142, 1, 0, 'Master Shears - Nightmare Vine'),
(10, 91435, 22793, 0, 1, 0, 91142, 1, 0, 'Master Shears - Mana Thistle'),

-- Tier 4: Grand Master Shears (aura 91143)
(10, 91527, 22710, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Bloodthistle'),
(10, 91528, 22785, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Felweed'),
(10, 91529, 22786, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Dreaming Glory'),
(10, 91530, 22787, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Ragveil'),
(10, 91531, 22789, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Terocone'),
(10, 91532, 22790, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Ancient Lichen'),
(10, 91533, 22791, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Netherbloom'),
(10, 91534, 22792, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Nightmare Vine'),
(10, 91535, 22793, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Mana Thistle'),

-- WOTLK HERBS CONDITIONS
-- Tier 1: Journeyman Shears (aura 91140)
(10, 91236, 36901, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Goldclover'),
(10, 91237, 36903, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Adder''s Tongue'),
(10, 91238, 36904, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Tiger Lily'),
(10, 91239, 36905, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Lichbloom'),
(10, 91240, 36906, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Icethorn'),
(10, 91241, 36907, 0, 1, 0, 91140, 1, 0, 'Journeyman Shears - Talandra''s Rose'),

-- Tier 2: Artisan Shears (aura 91141)
(10, 91336, 36901, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Goldclover'),
(10, 91337, 36903, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Adder''s Tongue'),
(10, 91338, 36904, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Tiger Lily'),
(10, 91339, 36905, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Lichbloom'),
(10, 91340, 36906, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Icethorn'),
(10, 91341, 36907, 0, 1, 0, 91141, 1, 0, 'Artisan Shears - Talandra''s Rose'),

-- Tier 3: Master Shears (aura 91142)
(10, 91436, 36901, 0, 1, 0, 91142, 1, 0, 'Master Shears - Goldclover'),
(10, 91437, 36903, 0, 1, 0, 91142, 1, 0, 'Master Shears - Adder''s Tongue'),
(10, 91438, 36904, 0, 1, 0, 91142, 1, 0, 'Master Shears - Tiger Lily'),
(10, 91439, 36905, 0, 1, 0, 91142, 1, 0, 'Master Shears - Lichbloom'),
(10, 91440, 36906, 0, 1, 0, 91142, 1, 0, 'Master Shears - Icethorn'),
(10, 91441, 36907, 0, 1, 0, 91142, 1, 0, 'Master Shears - Talandra''s Rose'),

-- Tier 4: Grand Master Shears (aura 91143)
(10, 91536, 36901, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Goldclover'),
(10, 91537, 36903, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Adder''s Tongue'),
(10, 91538, 36904, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Tiger Lily'),
(10, 91539, 36905, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Lichbloom'),
(10, 91540, 36906, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Icethorn'),
(10, 91541, 36907, 0, 1, 0, 91143, 1, 0, 'Grand Master Shears - Talandra''s Rose');