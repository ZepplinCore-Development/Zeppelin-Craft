-- ============================================================================
-- F-025: T2.5 Tier Satchels (AQ40) + Token Consolidation
-- ============================================================================
-- Satchel Items: 59314-59318
-- Artifact Items: 59319-59320
-- Reference IDs: 59459-59503
-- ============================================================================

-- ============================================================================
-- SECTION 1: CREATE SATCHEL ITEMS
-- ============================================================================
-- Class 15 = Container, Subclass 0 = Bag
-- DisplayID 135477 = AO_Chest18 (gold chest icon)

DELETE FROM `item_template` WHERE `entry` IN (59314, 59315, 59316, 59317, 59318, 59319, 59320);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `maxcount`, `stackable`, `ContainerSlots`, `bonding`) VALUES
-- Tier Satchels
(59314, 15, 0, 'Qiraji Armor Cache - Helm', 135477, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 1, 1),
(59315, 15, 0, 'Qiraji Armor Cache - Shoulder', 135477, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 1, 1),
(59316, 15, 0, 'Qiraji Armor Cache - Chest', 135477, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 1, 1),
(59317, 15, 0, 'Qiraji Armor Cache - Legs', 135477, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 1, 1),
(59318, 15, 0, 'Qiraji Armor Cache - Boots', 135477, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 1, 1),
-- Boss Artifacts (Quest Tokens)
(59319, 12, 0, "Viscidus's Crystalline Heart", 134131, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 0, 1),
(59320, 12, 0, "Huhuran's Stinger", 134298, 4, 0, 0, 0, -1, -1, 88, 60, 1, 1, 0, 1);

-- ============================================================================
-- SECTION 2: ITEM LOOT TEMPLATE (Satchel Contents)
-- ============================================================================
-- Each satchel references 9 class-specific loot entries
-- GroupId MUST match in reference_loot_template (critical requirement)

DELETE FROM `item_loot_template` WHERE `Entry` IN (59314, 59315, 59316, 59317, 59318);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Helm Cache (59314) - refs 59459-59467
(59314, 1, 59459, 100, 0, 1, 1, 1, 1, 'T2.5 Helm - Warrior ref'),
(59314, 2, 59460, 100, 0, 1, 2, 1, 1, 'T2.5 Helm - Paladin ref'),
(59314, 3, 59461, 100, 0, 1, 3, 1, 1, 'T2.5 Helm - Hunter ref'),
(59314, 4, 59462, 100, 0, 1, 4, 1, 1, 'T2.5 Helm - Rogue ref'),
(59314, 5, 59463, 100, 0, 1, 5, 1, 1, 'T2.5 Helm - Priest ref'),
(59314, 6, 59464, 100, 0, 1, 6, 1, 1, 'T2.5 Helm - Shaman ref'),
(59314, 7, 59465, 100, 0, 1, 7, 1, 1, 'T2.5 Helm - Mage ref'),
(59314, 8, 59466, 100, 0, 1, 8, 1, 1, 'T2.5 Helm - Warlock ref'),
(59314, 9, 59467, 100, 0, 1, 9, 1, 1, 'T2.5 Helm - Druid ref'),
-- Shoulder Cache (59315) - refs 59468-59476
(59315, 1, 59468, 100, 0, 1, 1, 1, 1, 'T2.5 Shoulder - Warrior ref'),
(59315, 2, 59469, 100, 0, 1, 2, 1, 1, 'T2.5 Shoulder - Paladin ref'),
(59315, 3, 59470, 100, 0, 1, 3, 1, 1, 'T2.5 Shoulder - Hunter ref'),
(59315, 4, 59471, 100, 0, 1, 4, 1, 1, 'T2.5 Shoulder - Rogue ref'),
(59315, 5, 59472, 100, 0, 1, 5, 1, 1, 'T2.5 Shoulder - Priest ref'),
(59315, 6, 59473, 100, 0, 1, 6, 1, 1, 'T2.5 Shoulder - Shaman ref'),
(59315, 7, 59474, 100, 0, 1, 7, 1, 1, 'T2.5 Shoulder - Mage ref'),
(59315, 8, 59475, 100, 0, 1, 8, 1, 1, 'T2.5 Shoulder - Warlock ref'),
(59315, 9, 59476, 100, 0, 1, 9, 1, 1, 'T2.5 Shoulder - Druid ref'),
-- Chest Cache (59316) - refs 59477-59485
(59316, 1, 59477, 100, 0, 1, 1, 1, 1, 'T2.5 Chest - Warrior ref'),
(59316, 2, 59478, 100, 0, 1, 2, 1, 1, 'T2.5 Chest - Paladin ref'),
(59316, 3, 59479, 100, 0, 1, 3, 1, 1, 'T2.5 Chest - Hunter ref'),
(59316, 4, 59480, 100, 0, 1, 4, 1, 1, 'T2.5 Chest - Rogue ref'),
(59316, 5, 59481, 100, 0, 1, 5, 1, 1, 'T2.5 Chest - Priest ref'),
(59316, 6, 59482, 100, 0, 1, 6, 1, 1, 'T2.5 Chest - Shaman ref'),
(59316, 7, 59483, 100, 0, 1, 7, 1, 1, 'T2.5 Chest - Mage ref'),
(59316, 8, 59484, 100, 0, 1, 8, 1, 1, 'T2.5 Chest - Warlock ref'),
(59316, 9, 59485, 100, 0, 1, 9, 1, 1, 'T2.5 Chest - Druid ref'),
-- Legs Cache (59317) - refs 59486-59494
(59317, 1, 59486, 100, 0, 1, 1, 1, 1, 'T2.5 Legs - Warrior ref'),
(59317, 2, 59487, 100, 0, 1, 2, 1, 1, 'T2.5 Legs - Paladin ref'),
(59317, 3, 59488, 100, 0, 1, 3, 1, 1, 'T2.5 Legs - Hunter ref'),
(59317, 4, 59489, 100, 0, 1, 4, 1, 1, 'T2.5 Legs - Rogue ref'),
(59317, 5, 59490, 100, 0, 1, 5, 1, 1, 'T2.5 Legs - Priest ref'),
(59317, 6, 59491, 100, 0, 1, 6, 1, 1, 'T2.5 Legs - Shaman ref'),
(59317, 7, 59492, 100, 0, 1, 7, 1, 1, 'T2.5 Legs - Mage ref'),
(59317, 8, 59493, 100, 0, 1, 8, 1, 1, 'T2.5 Legs - Warlock ref'),
(59317, 9, 59494, 100, 0, 1, 9, 1, 1, 'T2.5 Legs - Druid ref'),
-- Boots Cache (59318) - refs 59495-59503
(59318, 1, 59495, 100, 0, 1, 1, 1, 1, 'T2.5 Boots - Warrior ref'),
(59318, 2, 59496, 100, 0, 1, 2, 1, 1, 'T2.5 Boots - Paladin ref'),
(59318, 3, 59497, 100, 0, 1, 3, 1, 1, 'T2.5 Boots - Hunter ref'),
(59318, 4, 59498, 100, 0, 1, 4, 1, 1, 'T2.5 Boots - Rogue ref'),
(59318, 5, 59499, 100, 0, 1, 5, 1, 1, 'T2.5 Boots - Priest ref'),
(59318, 6, 59500, 100, 0, 1, 6, 1, 1, 'T2.5 Boots - Shaman ref'),
(59318, 7, 59501, 100, 0, 1, 7, 1, 1, 'T2.5 Boots - Mage ref'),
(59318, 8, 59502, 100, 0, 1, 8, 1, 1, 'T2.5 Boots - Warlock ref'),
(59318, 9, 59503, 100, 0, 1, 9, 1, 1, 'T2.5 Boots - Druid ref');

-- ============================================================================
-- SECTION 3: REFERENCE LOOT TEMPLATE (Class-specific items)
-- ============================================================================
-- GroupId MUST match parent GroupId in item_loot_template

DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59459 AND 59503;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- HELM refs (59459-59467)
(59459, 21329, 0, 0, 0, 1, 1, 1, 1, 'T2.5 Helm - Warrior: Conqueror''s Crown'),
(59460, 21387, 0, 0, 0, 1, 2, 1, 1, 'T2.5 Helm - Paladin: Avenger''s Crown'),
(59461, 21366, 0, 0, 0, 1, 3, 1, 1, 'T2.5 Helm - Hunter: Striker''s Diadem'),
(59462, 21360, 0, 0, 0, 1, 4, 1, 1, 'T2.5 Helm - Rogue: Deathdealer''s Helm'),
(59463, 21348, 0, 0, 0, 1, 5, 1, 1, 'T2.5 Helm - Priest: Tiara of the Oracle'),
(59464, 21372, 0, 0, 0, 1, 6, 1, 1, 'T2.5 Helm - Shaman: Stormcaller''s Diadem'),
(59465, 21347, 0, 0, 0, 1, 7, 1, 1, 'T2.5 Helm - Mage: Enigma Circlet'),
(59466, 21337, 0, 0, 0, 1, 8, 1, 1, 'T2.5 Helm - Warlock: Doomcaller''s Circlet'),
(59467, 21353, 0, 0, 0, 1, 9, 1, 1, 'T2.5 Helm - Druid: Genesis Helm'),
-- SHOULDER refs (59468-59476)
(59468, 21330, 0, 0, 0, 1, 1, 1, 1, 'T2.5 Shoulder - Warrior: Conqueror''s Spaulders'),
(59469, 21391, 0, 0, 0, 1, 2, 1, 1, 'T2.5 Shoulder - Paladin: Avenger''s Pauldrons'),
(59470, 21367, 0, 0, 0, 1, 3, 1, 1, 'T2.5 Shoulder - Hunter: Striker''s Pauldrons'),
(59471, 21361, 0, 0, 0, 1, 4, 1, 1, 'T2.5 Shoulder - Rogue: Deathdealer''s Spaulders'),
(59472, 21350, 0, 0, 0, 1, 5, 1, 1, 'T2.5 Shoulder - Priest: Mantle of the Oracle'),
(59473, 21376, 0, 0, 0, 1, 6, 1, 1, 'T2.5 Shoulder - Shaman: Stormcaller''s Pauldrons'),
(59474, 21345, 0, 0, 0, 1, 7, 1, 1, 'T2.5 Shoulder - Mage: Enigma Shoulderpads'),
(59475, 21335, 0, 0, 0, 1, 8, 1, 1, 'T2.5 Shoulder - Warlock: Doomcaller''s Mantle'),
(59476, 21354, 0, 0, 0, 1, 9, 1, 1, 'T2.5 Shoulder - Druid: Genesis Shoulderpads'),
-- CHEST refs (59477-59485)
(59477, 21331, 0, 0, 0, 1, 1, 1, 1, 'T2.5 Chest - Warrior: Conqueror''s Breastplate'),
(59478, 21389, 0, 0, 0, 1, 2, 1, 1, 'T2.5 Chest - Paladin: Avenger''s Breastplate'),
(59479, 21370, 0, 0, 0, 1, 3, 1, 1, 'T2.5 Chest - Hunter: Striker''s Hauberk'),
(59480, 21364, 0, 0, 0, 1, 4, 1, 1, 'T2.5 Chest - Rogue: Deathdealer''s Vest'),
(59481, 21351, 0, 0, 0, 1, 5, 1, 1, 'T2.5 Chest - Priest: Vestments of the Oracle'),
(59482, 21374, 0, 0, 0, 1, 6, 1, 1, 'T2.5 Chest - Shaman: Stormcaller''s Hauberk'),
(59483, 21343, 0, 0, 0, 1, 7, 1, 1, 'T2.5 Chest - Mage: Enigma Robes'),
(59484, 21334, 0, 0, 0, 1, 8, 1, 1, 'T2.5 Chest - Warlock: Doomcaller''s Robes'),
(59485, 21357, 0, 0, 0, 1, 9, 1, 1, 'T2.5 Chest - Druid: Genesis Vest'),
-- LEGS refs (59486-59494)
(59486, 21332, 0, 0, 0, 1, 1, 1, 1, 'T2.5 Legs - Warrior: Conqueror''s Legguards'),
(59487, 21390, 0, 0, 0, 1, 2, 1, 1, 'T2.5 Legs - Paladin: Avenger''s Legguards'),
(59488, 21368, 0, 0, 0, 1, 3, 1, 1, 'T2.5 Legs - Hunter: Striker''s Leggings'),
(59489, 21362, 0, 0, 0, 1, 4, 1, 1, 'T2.5 Legs - Rogue: Deathdealer''s Leggings'),
(59490, 21352, 0, 0, 0, 1, 5, 1, 1, 'T2.5 Legs - Priest: Trousers of the Oracle'),
(59491, 21375, 0, 0, 0, 1, 6, 1, 1, 'T2.5 Legs - Shaman: Stormcaller''s Leggings'),
(59492, 21346, 0, 0, 0, 1, 7, 1, 1, 'T2.5 Legs - Mage: Enigma Leggings'),
(59493, 21336, 0, 0, 0, 1, 8, 1, 1, 'T2.5 Legs - Warlock: Doomcaller''s Trousers'),
(59494, 21356, 0, 0, 0, 1, 9, 1, 1, 'T2.5 Legs - Druid: Genesis Trousers'),
-- BOOTS refs (59495-59503)
(59495, 21333, 0, 0, 0, 1, 1, 1, 1, 'T2.5 Boots - Warrior: Conqueror''s Greaves'),
(59496, 21388, 0, 0, 0, 1, 2, 1, 1, 'T2.5 Boots - Paladin: Avenger''s Greaves'),
(59497, 21365, 0, 0, 0, 1, 3, 1, 1, 'T2.5 Boots - Hunter: Striker''s Footguards'),
(59498, 21359, 0, 0, 0, 1, 4, 1, 1, 'T2.5 Boots - Rogue: Deathdealer''s Boots'),
(59499, 21349, 0, 0, 0, 1, 5, 1, 1, 'T2.5 Boots - Priest: Footwraps of the Oracle'),
(59500, 21373, 0, 0, 0, 1, 6, 1, 1, 'T2.5 Boots - Shaman: Stormcaller''s Footguards'),
(59501, 21344, 0, 0, 0, 1, 7, 1, 1, 'T2.5 Boots - Mage: Enigma Boots'),
(59502, 21338, 0, 0, 0, 1, 8, 1, 1, 'T2.5 Boots - Warlock: Doomcaller''s Footwraps'),
(59503, 21355, 0, 0, 0, 1, 9, 1, 1, 'T2.5 Boots - Druid: Genesis Boots');

-- ============================================================================
-- SECTION 4: CONDITIONS (Class filtering)
-- ============================================================================
-- SourceTypeOrReferenceId=10 (Reference Loot), ConditionTypeOrReference=15 (Class)
-- Class masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59459 AND 59503;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- HELM conditions
(10, 59459, 21329, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Warrior'),
(10, 59460, 21387, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Paladin'),
(10, 59461, 21366, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Hunter'),
(10, 59462, 21360, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Rogue'),
(10, 59463, 21348, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Priest'),
(10, 59464, 21372, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Shaman'),
(10, 59465, 21347, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Mage'),
(10, 59466, 21337, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Warlock'),
(10, 59467, 21353, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2.5 Helm - Druid'),
-- SHOULDER conditions
(10, 59468, 21330, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Warrior'),
(10, 59469, 21391, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Paladin'),
(10, 59470, 21367, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Hunter'),
(10, 59471, 21361, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Rogue'),
(10, 59472, 21350, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Priest'),
(10, 59473, 21376, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Shaman'),
(10, 59474, 21345, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Mage'),
(10, 59475, 21335, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Warlock'),
(10, 59476, 21354, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2.5 Shoulder - Druid'),
-- CHEST conditions
(10, 59477, 21331, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Warrior'),
(10, 59478, 21389, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Paladin'),
(10, 59479, 21370, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Hunter'),
(10, 59480, 21364, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Rogue'),
(10, 59481, 21351, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Priest'),
(10, 59482, 21374, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Shaman'),
(10, 59483, 21343, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Mage'),
(10, 59484, 21334, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Warlock'),
(10, 59485, 21357, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2.5 Chest - Druid'),
-- LEGS conditions
(10, 59486, 21332, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Warrior'),
(10, 59487, 21390, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Paladin'),
(10, 59488, 21368, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Hunter'),
(10, 59489, 21362, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Rogue'),
(10, 59490, 21352, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Priest'),
(10, 59491, 21375, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Shaman'),
(10, 59492, 21346, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Mage'),
(10, 59493, 21336, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Warlock'),
(10, 59494, 21356, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2.5 Legs - Druid'),
-- BOOTS conditions
(10, 59495, 21333, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Warrior'),
(10, 59496, 21388, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Paladin'),
(10, 59497, 21365, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Hunter'),
(10, 59498, 21359, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Rogue'),
(10, 59499, 21349, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Priest'),
(10, 59500, 21373, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Shaman'),
(10, 59501, 21344, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Mage'),
(10, 59502, 21338, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Warlock'),
(10, 59503, 21355, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T2.5 Boots - Druid');

-- ============================================================================
-- SECTION 5: CREATURE LOOT TEMPLATE UPDATES
-- ============================================================================
-- Add satchels, remove duplicate tokens, add artifacts

-- Twin Emperors - Vek'nilash (15275): Keep Circlet, add Helm Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15275 AND `Item` = 20926;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15275, 59314, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Helm'),
(15275, 20926, 0, 100, 0, 1, 0, 1, 1, 'Vek''nilash''s Circlet (consolidated token)');

-- Twin Emperors - Vek'lor (15276): Keep Diadem, add Helm Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15276 AND `Item` = 20930;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15276, 59314, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Helm'),
(15276, 20930, 0, 100, 0, 1, 0, 1, 1, 'Vek''lor''s Diadem (consolidated token)');

-- Viscidus (15299): Remove Command+Dominance, add Shoulder Cache + Crystalline Heart
DELETE FROM `creature_loot_template` WHERE `Entry` = 15299 AND `Item` IN (20928, 20932);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15299, 59315, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Shoulder'),
(15299, 59319, 0, 100, 0, 1, 0, 1, 1, 'Viscidus''s Crystalline Heart (shoulder quest token)');

-- Huhuran (15509): Remove Command+Dominance, add Boots Cache + Stinger
DELETE FROM `creature_loot_template` WHERE `Entry` = 15509 AND `Item` IN (20928, 20932);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15509, 59318, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Boots'),
(15509, 59320, 0, 100, 0, 1, 0, 1, 1, 'Huhuran''s Stinger (boots quest token)');

-- C'Thun (15727): Remove Husk, keep Carapace, add Chest Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15727 AND `Item` = 20933;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15727, 59316, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Chest');

-- Ouro (15517): Remove Skin, keep Intact Hide, add Legs Cache
DELETE FROM `creature_loot_template` WHERE `Entry` = 15517 AND `Item` = 20931;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15517, 59317, 0, 100, 0, 1, 0, 1, 1, 'Qiraji Armor Cache - Legs');

-- ============================================================================
-- SECTION 6: QUEST UPDATES
-- ============================================================================
-- Update quest tokens, remove class restrictions, remove tier rewards

-- SHOULDER quests: All now require Viscidus's Crystalline Heart (59319)
-- Originally: Command (20928) or Dominance (20932)
UPDATE `quest_template` SET `RequiredItemId1` = 59319 WHERE `ID` IN (
    8544,  -- Conqueror's Spaulders (Warrior)
    8594,  -- Mantle of the Oracle (Priest)
    8641,  -- Deathdealer's Spaulders (Rogue)
    8659,  -- Striker's Pauldrons (Hunter)
    8602,  -- Stormcaller's Pauldrons (Shaman)
    8625,  -- Enigma Shoulderpads (Mage)
    8630,  -- Avenger's Pauldrons (Paladin)
    8664,  -- Doomcaller's Mantle (Warlock)
    8669   -- Genesis Shoulderpads (Druid)
);

-- BOOTS quests: All now require Huhuran's Stinger (59320)
-- Originally: Command (20928) or Dominance (20932)
UPDATE `quest_template` SET `RequiredItemId1` = 59320 WHERE `ID` IN (
    8559,  -- Conqueror's Greaves (Warrior)
    8596,  -- Footwraps of the Oracle (Priest)
    8637,  -- Deathdealer's Boots (Rogue)
    8626,  -- Striker's Footguards (Hunter)
    8621,  -- Stormcaller's Footguards (Shaman)
    8634,  -- Enigma Boots (Mage)
    8655,  -- Avenger's Greaves (Paladin)
    8660,  -- Doomcaller's Footwraps (Warlock)
    8665   -- Genesis Boots (Druid)
);

-- CHEST quests: All now require Carapace of the Old God (20929)
-- Originally: Carapace (20929) or Husk (20933)
UPDATE `quest_template` SET `RequiredItemId1` = 20929 WHERE `ID` IN (
    8603,  -- Vestments of the Oracle (Priest) - was Husk
    8633,  -- Enigma Robes (Mage) - was Husk
    8661,  -- Doomcaller's Robes (Warlock) - was Husk
    8666   -- Genesis Vest (Druid) - was Husk
);

-- LEGS quests: All now require Ouro's Intact Hide (20927)
-- Originally: Intact Hide (20927) or Skin (20931)
UPDATE `quest_template` SET `RequiredItemId1` = 20927 WHERE `ID` IN (
    8624,  -- Stormcaller's Leggings (Shaman) - was Skin
    8629,  -- Avenger's Legguards (Paladin) - was Skin
    8658,  -- Striker's Leggings (Hunter) - was Skin
    8663,  -- Doomcaller's Trousers (Warlock) - was Skin
    8668   -- Genesis Trousers (Druid) - was Skin
);

-- HELM quests: Keep existing tokens (Twin Emperors are separate bosses)
-- Vek'nilash's Circlet (20926): Warrior, Priest, Mage, Warlock - no change needed
-- Vek'lor's Diadem (20930): Shaman, Paladin, Rogue, Hunter, Druid - no change needed

-- Remove class restrictions from all T2.5 quests (satchels provide tier, quests just give gold/rep)
UPDATE `quest_template_addon` SET `AllowableClasses` = 0 WHERE `ID` IN (
    -- Helm quests
    8561, 8592, 8632, 8662,  -- Vek'nilash Circlet quests
    8623, 8628, 8639, 8657, 8667,  -- Vek'lor Diadem quests
    -- Shoulder quests
    8544, 8594, 8641, 8659, 8602, 8625, 8630, 8664, 8669,
    -- Chest quests
    8562, 8622, 8627, 8638, 8656, 8603, 8633, 8661, 8666,
    -- Legs quests
    8560, 8593, 8631, 8640, 8624, 8629, 8658, 8663, 8668,
    -- Boots quests
    8559, 8596, 8637, 8626, 8621, 8634, 8655, 8660, 8665
);
