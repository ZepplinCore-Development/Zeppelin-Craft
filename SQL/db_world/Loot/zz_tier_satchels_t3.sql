-- ============================================================================
-- F-025: T3 Tier Satchels (Naxxramas 40) + Quest System Modification
-- ============================================================================
-- Satchel Items: 59321-59328
-- Artifact Items: 59329-59336
-- Reference IDs: 59510-59581
-- ============================================================================

-- ============================================================================
-- SECTION 1: CREATE SATCHEL ITEMS + BOSS ARTIFACTS
-- ============================================================================
-- Class 15 = Container, Subclass 0 = Bag
-- Class 12 = Quest Item
-- DisplayID 135477 = AO_Chest18 (gold chest icon)

DELETE FROM `item_template` WHERE `entry` BETWEEN 59321 AND 59336;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `maxcount`, `stackable`, `ContainerSlots`, `bonding`) VALUES
-- Tier Satchels (8 armor slots)
(59321, 15, 0, 'Naxxramas Armor Cache - Helm', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59322, 15, 0, 'Naxxramas Armor Cache - Shoulder', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59323, 15, 0, 'Naxxramas Armor Cache - Chest', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59324, 15, 0, 'Naxxramas Armor Cache - Legs', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59325, 15, 0, 'Naxxramas Armor Cache - Boots', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59326, 15, 0, 'Naxxramas Armor Cache - Bracers', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59327, 15, 0, 'Naxxramas Armor Cache - Gloves', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
(59328, 15, 0, 'Naxxramas Armor Cache - Belt', 135477, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 1, 1),
-- Boss Artifacts (Quest Tokens for Light's Hope Chapel)
(59329, 12, 0, "Thaddius's Power Core", 135999, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59330, 12, 0, "Grobbulus's Injection Vial", 134437, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59331, 12, 0, "Kel'Thuzad's Phylactery Fragment", 134229, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59332, 12, 0, "Loatheb's Spore Essence", 134206, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59333, 12, 0, "Gothik's Unholy Sigil", 133168, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59334, 12, 0, "Faerlina's Webbing", 132598, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59335, 12, 0, "Maexxna's Fang", 135993, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1),
(59336, 12, 0, "Heigan's Plague Vial", 134799, 4, 0, 0, 0, -1, -1, 92, 60, 1, 1, 0, 1);

-- ============================================================================
-- SECTION 2: ITEM LOOT TEMPLATE (Satchel Contents)
-- ============================================================================
-- Each satchel references 9 class-specific loot entries
-- GroupId MUST match in reference_loot_template (critical requirement)

DELETE FROM `item_loot_template` WHERE `Entry` BETWEEN 59321 AND 59328;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Helm Cache (59321) - refs 59510-59518
(59321, 1, 59510, 100, 0, 1, 1, 1, 1, 'T3 Helm - Warrior ref'),
(59321, 2, 59511, 100, 0, 1, 2, 1, 1, 'T3 Helm - Paladin ref'),
(59321, 3, 59512, 100, 0, 1, 3, 1, 1, 'T3 Helm - Hunter ref'),
(59321, 4, 59513, 100, 0, 1, 4, 1, 1, 'T3 Helm - Rogue ref'),
(59321, 5, 59514, 100, 0, 1, 5, 1, 1, 'T3 Helm - Priest ref'),
(59321, 6, 59515, 100, 0, 1, 6, 1, 1, 'T3 Helm - Shaman ref'),
(59321, 7, 59516, 100, 0, 1, 7, 1, 1, 'T3 Helm - Mage ref'),
(59321, 8, 59517, 100, 0, 1, 8, 1, 1, 'T3 Helm - Warlock ref'),
(59321, 9, 59518, 100, 0, 1, 9, 1, 1, 'T3 Helm - Druid ref'),
-- Shoulder Cache (59322) - refs 59519-59527
(59322, 1, 59519, 100, 0, 1, 1, 1, 1, 'T3 Shoulder - Warrior ref'),
(59322, 2, 59520, 100, 0, 1, 2, 1, 1, 'T3 Shoulder - Paladin ref'),
(59322, 3, 59521, 100, 0, 1, 3, 1, 1, 'T3 Shoulder - Hunter ref'),
(59322, 4, 59522, 100, 0, 1, 4, 1, 1, 'T3 Shoulder - Rogue ref'),
(59322, 5, 59523, 100, 0, 1, 5, 1, 1, 'T3 Shoulder - Priest ref'),
(59322, 6, 59524, 100, 0, 1, 6, 1, 1, 'T3 Shoulder - Shaman ref'),
(59322, 7, 59525, 100, 0, 1, 7, 1, 1, 'T3 Shoulder - Mage ref'),
(59322, 8, 59526, 100, 0, 1, 8, 1, 1, 'T3 Shoulder - Warlock ref'),
(59322, 9, 59527, 100, 0, 1, 9, 1, 1, 'T3 Shoulder - Druid ref'),
-- Chest Cache (59323) - refs 59528-59536
(59323, 1, 59528, 100, 0, 1, 1, 1, 1, 'T3 Chest - Warrior ref'),
(59323, 2, 59529, 100, 0, 1, 2, 1, 1, 'T3 Chest - Paladin ref'),
(59323, 3, 59530, 100, 0, 1, 3, 1, 1, 'T3 Chest - Hunter ref'),
(59323, 4, 59531, 100, 0, 1, 4, 1, 1, 'T3 Chest - Rogue ref'),
(59323, 5, 59532, 100, 0, 1, 5, 1, 1, 'T3 Chest - Priest ref'),
(59323, 6, 59533, 100, 0, 1, 6, 1, 1, 'T3 Chest - Shaman ref'),
(59323, 7, 59534, 100, 0, 1, 7, 1, 1, 'T3 Chest - Mage ref'),
(59323, 8, 59535, 100, 0, 1, 8, 1, 1, 'T3 Chest - Warlock ref'),
(59323, 9, 59536, 100, 0, 1, 9, 1, 1, 'T3 Chest - Druid ref'),
-- Legs Cache (59324) - refs 59537-59545
(59324, 1, 59537, 100, 0, 1, 1, 1, 1, 'T3 Legs - Warrior ref'),
(59324, 2, 59538, 100, 0, 1, 2, 1, 1, 'T3 Legs - Paladin ref'),
(59324, 3, 59539, 100, 0, 1, 3, 1, 1, 'T3 Legs - Hunter ref'),
(59324, 4, 59540, 100, 0, 1, 4, 1, 1, 'T3 Legs - Rogue ref'),
(59324, 5, 59541, 100, 0, 1, 5, 1, 1, 'T3 Legs - Priest ref'),
(59324, 6, 59542, 100, 0, 1, 6, 1, 1, 'T3 Legs - Shaman ref'),
(59324, 7, 59543, 100, 0, 1, 7, 1, 1, 'T3 Legs - Mage ref'),
(59324, 8, 59544, 100, 0, 1, 8, 1, 1, 'T3 Legs - Warlock ref'),
(59324, 9, 59545, 100, 0, 1, 9, 1, 1, 'T3 Legs - Druid ref'),
-- Boots Cache (59325) - refs 59546-59554
(59325, 1, 59546, 100, 0, 1, 1, 1, 1, 'T3 Boots - Warrior ref'),
(59325, 2, 59547, 100, 0, 1, 2, 1, 1, 'T3 Boots - Paladin ref'),
(59325, 3, 59548, 100, 0, 1, 3, 1, 1, 'T3 Boots - Hunter ref'),
(59325, 4, 59549, 100, 0, 1, 4, 1, 1, 'T3 Boots - Rogue ref'),
(59325, 5, 59550, 100, 0, 1, 5, 1, 1, 'T3 Boots - Priest ref'),
(59325, 6, 59551, 100, 0, 1, 6, 1, 1, 'T3 Boots - Shaman ref'),
(59325, 7, 59552, 100, 0, 1, 7, 1, 1, 'T3 Boots - Mage ref'),
(59325, 8, 59553, 100, 0, 1, 8, 1, 1, 'T3 Boots - Warlock ref'),
(59325, 9, 59554, 100, 0, 1, 9, 1, 1, 'T3 Boots - Druid ref'),
-- Bracers Cache (59326) - refs 59555-59563
(59326, 1, 59555, 100, 0, 1, 1, 1, 1, 'T3 Bracers - Warrior ref'),
(59326, 2, 59556, 100, 0, 1, 2, 1, 1, 'T3 Bracers - Paladin ref'),
(59326, 3, 59557, 100, 0, 1, 3, 1, 1, 'T3 Bracers - Hunter ref'),
(59326, 4, 59558, 100, 0, 1, 4, 1, 1, 'T3 Bracers - Rogue ref'),
(59326, 5, 59559, 100, 0, 1, 5, 1, 1, 'T3 Bracers - Priest ref'),
(59326, 6, 59560, 100, 0, 1, 6, 1, 1, 'T3 Bracers - Shaman ref'),
(59326, 7, 59561, 100, 0, 1, 7, 1, 1, 'T3 Bracers - Mage ref'),
(59326, 8, 59562, 100, 0, 1, 8, 1, 1, 'T3 Bracers - Warlock ref'),
(59326, 9, 59563, 100, 0, 1, 9, 1, 1, 'T3 Bracers - Druid ref'),
-- Gloves Cache (59327) - refs 59564-59572
(59327, 1, 59564, 100, 0, 1, 1, 1, 1, 'T3 Gloves - Warrior ref'),
(59327, 2, 59565, 100, 0, 1, 2, 1, 1, 'T3 Gloves - Paladin ref'),
(59327, 3, 59566, 100, 0, 1, 3, 1, 1, 'T3 Gloves - Hunter ref'),
(59327, 4, 59567, 100, 0, 1, 4, 1, 1, 'T3 Gloves - Rogue ref'),
(59327, 5, 59568, 100, 0, 1, 5, 1, 1, 'T3 Gloves - Priest ref'),
(59327, 6, 59569, 100, 0, 1, 6, 1, 1, 'T3 Gloves - Shaman ref'),
(59327, 7, 59570, 100, 0, 1, 7, 1, 1, 'T3 Gloves - Mage ref'),
(59327, 8, 59571, 100, 0, 1, 8, 1, 1, 'T3 Gloves - Warlock ref'),
(59327, 9, 59572, 100, 0, 1, 9, 1, 1, 'T3 Gloves - Druid ref'),
-- Belt Cache (59328) - refs 59573-59581
(59328, 1, 59573, 100, 0, 1, 1, 1, 1, 'T3 Belt - Warrior ref'),
(59328, 2, 59574, 100, 0, 1, 2, 1, 1, 'T3 Belt - Paladin ref'),
(59328, 3, 59575, 100, 0, 1, 3, 1, 1, 'T3 Belt - Hunter ref'),
(59328, 4, 59576, 100, 0, 1, 4, 1, 1, 'T3 Belt - Rogue ref'),
(59328, 5, 59577, 100, 0, 1, 5, 1, 1, 'T3 Belt - Priest ref'),
(59328, 6, 59578, 100, 0, 1, 6, 1, 1, 'T3 Belt - Shaman ref'),
(59328, 7, 59579, 100, 0, 1, 7, 1, 1, 'T3 Belt - Mage ref'),
(59328, 8, 59580, 100, 0, 1, 8, 1, 1, 'T3 Belt - Warlock ref'),
(59328, 9, 59581, 100, 0, 1, 9, 1, 1, 'T3 Belt - Druid ref');

-- ============================================================================
-- SECTION 3: REFERENCE LOOT TEMPLATE (Class-specific items)
-- ============================================================================
-- GroupId MUST match parent GroupId in item_loot_template

DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59510 AND 59581;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- HELM refs (59510-59518)
(59510, 22418, 0, 0, 0, 1, 1, 1, 1, 'T3 Helm - Warrior: Dreadnaught Helmet'),
(59511, 22428, 0, 0, 0, 1, 2, 1, 1, 'T3 Helm - Paladin: Redemption Headpiece'),
(59512, 22438, 0, 0, 0, 1, 3, 1, 1, 'T3 Helm - Hunter: Cryptstalker Headpiece'),
(59513, 22478, 0, 0, 0, 1, 4, 1, 1, 'T3 Helm - Rogue: Bonescythe Helmet'),
(59514, 22514, 0, 0, 0, 1, 5, 1, 1, 'T3 Helm - Priest: Circlet of Faith'),
(59515, 22466, 0, 0, 0, 1, 6, 1, 1, 'T3 Helm - Shaman: Earthshatter Headpiece'),
(59516, 22498, 0, 0, 0, 1, 7, 1, 1, 'T3 Helm - Mage: Frostfire Circlet'),
(59517, 22506, 0, 0, 0, 1, 8, 1, 1, 'T3 Helm - Warlock: Plagueheart Circlet'),
(59518, 22490, 0, 0, 0, 1, 9, 1, 1, 'T3 Helm - Druid: Dreamwalker Headpiece'),
-- SHOULDER refs (59519-59527)
(59519, 22419, 0, 0, 0, 1, 1, 1, 1, 'T3 Shoulder - Warrior: Dreadnaught Pauldrons'),
(59520, 22429, 0, 0, 0, 1, 2, 1, 1, 'T3 Shoulder - Paladin: Redemption Spaulders'),
(59521, 22439, 0, 0, 0, 1, 3, 1, 1, 'T3 Shoulder - Hunter: Cryptstalker Spaulders'),
(59522, 22479, 0, 0, 0, 1, 4, 1, 1, 'T3 Shoulder - Rogue: Bonescythe Pauldrons'),
(59523, 22515, 0, 0, 0, 1, 5, 1, 1, 'T3 Shoulder - Priest: Shoulderpads of Faith'),
(59524, 22467, 0, 0, 0, 1, 6, 1, 1, 'T3 Shoulder - Shaman: Earthshatter Spaulders'),
(59525, 22499, 0, 0, 0, 1, 7, 1, 1, 'T3 Shoulder - Mage: Frostfire Shoulderpads'),
(59526, 22507, 0, 0, 0, 1, 8, 1, 1, 'T3 Shoulder - Warlock: Plagueheart Shoulderpads'),
(59527, 22491, 0, 0, 0, 1, 9, 1, 1, 'T3 Shoulder - Druid: Dreamwalker Spaulders'),
-- CHEST refs (59528-59536)
(59528, 22416, 0, 0, 0, 1, 1, 1, 1, 'T3 Chest - Warrior: Dreadnaught Breastplate'),
(59529, 22425, 0, 0, 0, 1, 2, 1, 1, 'T3 Chest - Paladin: Redemption Tunic'),
(59530, 22436, 0, 0, 0, 1, 3, 1, 1, 'T3 Chest - Hunter: Cryptstalker Tunic'),
(59531, 22476, 0, 0, 0, 1, 4, 1, 1, 'T3 Chest - Rogue: Bonescythe Breastplate'),
(59532, 22512, 0, 0, 0, 1, 5, 1, 1, 'T3 Chest - Priest: Robe of Faith'),
(59533, 22464, 0, 0, 0, 1, 6, 1, 1, 'T3 Chest - Shaman: Earthshatter Tunic'),
(59534, 22496, 0, 0, 0, 1, 7, 1, 1, 'T3 Chest - Mage: Frostfire Robe'),
(59535, 22504, 0, 0, 0, 1, 8, 1, 1, 'T3 Chest - Warlock: Plagueheart Robe'),
(59536, 22488, 0, 0, 0, 1, 9, 1, 1, 'T3 Chest - Druid: Dreamwalker Tunic'),
-- LEGS refs (59537-59545)
(59537, 22417, 0, 0, 0, 1, 1, 1, 1, 'T3 Legs - Warrior: Dreadnaught Legplates'),
(59538, 22427, 0, 0, 0, 1, 2, 1, 1, 'T3 Legs - Paladin: Redemption Legguards'),
(59539, 22437, 0, 0, 0, 1, 3, 1, 1, 'T3 Legs - Hunter: Cryptstalker Legguards'),
(59540, 22477, 0, 0, 0, 1, 4, 1, 1, 'T3 Legs - Rogue: Bonescythe Legplates'),
(59541, 22513, 0, 0, 0, 1, 5, 1, 1, 'T3 Legs - Priest: Leggings of Faith'),
(59542, 22465, 0, 0, 0, 1, 6, 1, 1, 'T3 Legs - Shaman: Earthshatter Legguards'),
(59543, 22497, 0, 0, 0, 1, 7, 1, 1, 'T3 Legs - Mage: Frostfire Leggings'),
(59544, 22505, 0, 0, 0, 1, 8, 1, 1, 'T3 Legs - Warlock: Plagueheart Leggings'),
(59545, 22489, 0, 0, 0, 1, 9, 1, 1, 'T3 Legs - Druid: Dreamwalker Legguards'),
-- BOOTS refs (59546-59554)
(59546, 22420, 0, 0, 0, 1, 1, 1, 1, 'T3 Boots - Warrior: Dreadnaught Sabatons'),
(59547, 22430, 0, 0, 0, 1, 2, 1, 1, 'T3 Boots - Paladin: Redemption Boots'),
(59548, 22440, 0, 0, 0, 1, 3, 1, 1, 'T3 Boots - Hunter: Cryptstalker Boots'),
(59549, 22480, 0, 0, 0, 1, 4, 1, 1, 'T3 Boots - Rogue: Bonescythe Sabatons'),
(59550, 22516, 0, 0, 0, 1, 5, 1, 1, 'T3 Boots - Priest: Sandals of Faith'),
(59551, 22468, 0, 0, 0, 1, 6, 1, 1, 'T3 Boots - Shaman: Earthshatter Boots'),
(59552, 22500, 0, 0, 0, 1, 7, 1, 1, 'T3 Boots - Mage: Frostfire Sandals'),
(59553, 22508, 0, 0, 0, 1, 8, 1, 1, 'T3 Boots - Warlock: Plagueheart Sandals'),
(59554, 22492, 0, 0, 0, 1, 9, 1, 1, 'T3 Boots - Druid: Dreamwalker Boots'),
-- BRACERS refs (59555-59563)
(59555, 22423, 0, 0, 0, 1, 1, 1, 1, 'T3 Bracers - Warrior: Dreadnaught Bracers'),
(59556, 22424, 0, 0, 0, 1, 2, 1, 1, 'T3 Bracers - Paladin: Redemption Wristguards'),
(59557, 22443, 0, 0, 0, 1, 3, 1, 1, 'T3 Bracers - Hunter: Cryptstalker Wristguards'),
(59558, 22483, 0, 0, 0, 1, 4, 1, 1, 'T3 Bracers - Rogue: Bonescythe Bracers'),
(59559, 22519, 0, 0, 0, 1, 5, 1, 1, 'T3 Bracers - Priest: Bindings of Faith'),
(59560, 22471, 0, 0, 0, 1, 6, 1, 1, 'T3 Bracers - Shaman: Earthshatter Wristguards'),
(59561, 22503, 0, 0, 0, 1, 7, 1, 1, 'T3 Bracers - Mage: Frostfire Bindings'),
(59562, 22511, 0, 0, 0, 1, 8, 1, 1, 'T3 Bracers - Warlock: Plagueheart Bindings'),
(59563, 22495, 0, 0, 0, 1, 9, 1, 1, 'T3 Bracers - Druid: Dreamwalker Wristguards'),
-- GLOVES refs (59564-59572)
(59564, 22421, 0, 0, 0, 1, 1, 1, 1, 'T3 Gloves - Warrior: Dreadnaught Gauntlets'),
(59565, 22426, 0, 0, 0, 1, 2, 1, 1, 'T3 Gloves - Paladin: Redemption Handguards'),
(59566, 22441, 0, 0, 0, 1, 3, 1, 1, 'T3 Gloves - Hunter: Cryptstalker Handguards'),
(59567, 22481, 0, 0, 0, 1, 4, 1, 1, 'T3 Gloves - Rogue: Bonescythe Gauntlets'),
(59568, 22517, 0, 0, 0, 1, 5, 1, 1, 'T3 Gloves - Priest: Gloves of Faith'),
(59569, 22469, 0, 0, 0, 1, 6, 1, 1, 'T3 Gloves - Shaman: Earthshatter Handguards'),
(59570, 22501, 0, 0, 0, 1, 7, 1, 1, 'T3 Gloves - Mage: Frostfire Gloves'),
(59571, 22509, 0, 0, 0, 1, 8, 1, 1, 'T3 Gloves - Warlock: Plagueheart Gloves'),
(59572, 22493, 0, 0, 0, 1, 9, 1, 1, 'T3 Gloves - Druid: Dreamwalker Handguards'),
-- BELT refs (59573-59581)
(59573, 22422, 0, 0, 0, 1, 1, 1, 1, 'T3 Belt - Warrior: Dreadnaught Waistguard'),
(59574, 22431, 0, 0, 0, 1, 2, 1, 1, 'T3 Belt - Paladin: Redemption Girdle'),
(59575, 22442, 0, 0, 0, 1, 3, 1, 1, 'T3 Belt - Hunter: Cryptstalker Girdle'),
(59576, 22482, 0, 0, 0, 1, 4, 1, 1, 'T3 Belt - Rogue: Bonescythe Waistguard'),
(59577, 22518, 0, 0, 0, 1, 5, 1, 1, 'T3 Belt - Priest: Belt of Faith'),
(59578, 22470, 0, 0, 0, 1, 6, 1, 1, 'T3 Belt - Shaman: Earthshatter Girdle'),
(59579, 22502, 0, 0, 0, 1, 7, 1, 1, 'T3 Belt - Mage: Frostfire Belt'),
(59580, 22510, 0, 0, 0, 1, 8, 1, 1, 'T3 Belt - Warlock: Plagueheart Belt'),
(59581, 22494, 0, 0, 0, 1, 9, 1, 1, 'T3 Belt - Druid: Dreamwalker Girdle');

-- ============================================================================
-- SECTION 4: CONDITIONS (Class Filtering)
-- ============================================================================
-- SourceType 10 = Reference Loot
-- ConditionType 15 = Class Check
-- Class Masks: War=1, Pal=2, Hun=4, Rog=8, Pri=16, Sha=64, Mag=128, Loc=256, Dru=1024

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59510 AND 59581;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- HELM (59510-59518)
(10, 59510, 22418, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Helm - Warrior'),
(10, 59511, 22428, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Helm - Paladin'),
(10, 59512, 22438, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Helm - Hunter'),
(10, 59513, 22478, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Helm - Rogue'),
(10, 59514, 22514, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Helm - Priest'),
(10, 59515, 22466, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Helm - Shaman'),
(10, 59516, 22498, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Helm - Mage'),
(10, 59517, 22506, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Helm - Warlock'),
(10, 59518, 22490, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Helm - Druid'),
-- SHOULDER (59519-59527)
(10, 59519, 22419, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Shoulder - Warrior'),
(10, 59520, 22429, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Shoulder - Paladin'),
(10, 59521, 22439, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Shoulder - Hunter'),
(10, 59522, 22479, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Shoulder - Rogue'),
(10, 59523, 22515, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Shoulder - Priest'),
(10, 59524, 22467, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Shoulder - Shaman'),
(10, 59525, 22499, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Shoulder - Mage'),
(10, 59526, 22507, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Shoulder - Warlock'),
(10, 59527, 22491, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Shoulder - Druid'),
-- CHEST (59528-59536)
(10, 59528, 22416, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Chest - Warrior'),
(10, 59529, 22425, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Chest - Paladin'),
(10, 59530, 22436, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Chest - Hunter'),
(10, 59531, 22476, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Chest - Rogue'),
(10, 59532, 22512, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Chest - Priest'),
(10, 59533, 22464, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Chest - Shaman'),
(10, 59534, 22496, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Chest - Mage'),
(10, 59535, 22504, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Chest - Warlock'),
(10, 59536, 22488, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Chest - Druid'),
-- LEGS (59537-59545)
(10, 59537, 22417, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Legs - Warrior'),
(10, 59538, 22427, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Legs - Paladin'),
(10, 59539, 22437, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Legs - Hunter'),
(10, 59540, 22477, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Legs - Rogue'),
(10, 59541, 22513, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Legs - Priest'),
(10, 59542, 22465, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Legs - Shaman'),
(10, 59543, 22497, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Legs - Mage'),
(10, 59544, 22505, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Legs - Warlock'),
(10, 59545, 22489, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Legs - Druid'),
-- BOOTS (59546-59554)
(10, 59546, 22420, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Boots - Warrior'),
(10, 59547, 22430, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Boots - Paladin'),
(10, 59548, 22440, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Boots - Hunter'),
(10, 59549, 22480, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Boots - Rogue'),
(10, 59550, 22516, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Boots - Priest'),
(10, 59551, 22468, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Boots - Shaman'),
(10, 59552, 22500, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Boots - Mage'),
(10, 59553, 22508, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Boots - Warlock'),
(10, 59554, 22492, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Boots - Druid'),
-- BRACERS (59555-59563)
(10, 59555, 22423, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Bracers - Warrior'),
(10, 59556, 22424, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Bracers - Paladin'),
(10, 59557, 22443, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Bracers - Hunter'),
(10, 59558, 22483, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Bracers - Rogue'),
(10, 59559, 22519, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Bracers - Priest'),
(10, 59560, 22471, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Bracers - Shaman'),
(10, 59561, 22503, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Bracers - Mage'),
(10, 59562, 22511, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Bracers - Warlock'),
(10, 59563, 22495, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Bracers - Druid'),
-- GLOVES (59564-59572)
(10, 59564, 22421, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Gloves - Warrior'),
(10, 59565, 22426, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Gloves - Paladin'),
(10, 59566, 22441, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Gloves - Hunter'),
(10, 59567, 22481, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Gloves - Rogue'),
(10, 59568, 22517, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Gloves - Priest'),
(10, 59569, 22469, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Gloves - Shaman'),
(10, 59570, 22501, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Gloves - Mage'),
(10, 59571, 22509, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Gloves - Warlock'),
(10, 59572, 22493, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Gloves - Druid'),
-- BELT (59573-59581)
(10, 59573, 22422, 0, 0, 15, 0, 1,    0, 0, 0, 0, 0, '', 'T3 Belt - Warrior'),
(10, 59574, 22431, 0, 0, 15, 0, 2,    0, 0, 0, 0, 0, '', 'T3 Belt - Paladin'),
(10, 59575, 22442, 0, 0, 15, 0, 4,    0, 0, 0, 0, 0, '', 'T3 Belt - Hunter'),
(10, 59576, 22482, 0, 0, 15, 0, 8,    0, 0, 0, 0, 0, '', 'T3 Belt - Rogue'),
(10, 59577, 22518, 0, 0, 15, 0, 16,   0, 0, 0, 0, 0, '', 'T3 Belt - Priest'),
(10, 59578, 22470, 0, 0, 15, 0, 64,   0, 0, 0, 0, 0, '', 'T3 Belt - Shaman'),
(10, 59579, 22502, 0, 0, 15, 0, 128,  0, 0, 0, 0, 0, '', 'T3 Belt - Mage'),
(10, 59580, 22510, 0, 0, 15, 0, 256,  0, 0, 0, 0, 0, '', 'T3 Belt - Warlock'),
(10, 59581, 22494, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', 'T3 Belt - Druid');

-- ============================================================================
-- SECTION 5: BOSS LOOT MODIFICATIONS
-- ============================================================================
-- Replace Desecrated token drops with satchels and boss artifacts
-- Custom Naxx40 boss entries: 351xxx

-- Thaddius (351000) - Helm Cache + Power Core
DELETE FROM `creature_loot_template` WHERE `Entry` = 351000 AND `Item` IN (22360, 59321, 59329);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351000, 59321, 0, 100, 0, 1, 0, 2, 2, 'Thaddius - Naxxramas Armor Cache - Helm (F-025)'),
(351000, 59329, 0, 100, 0, 1, 0, 1, 1, "Thaddius - Thaddius's Power Core (F-025)");

-- Grobbulus (351003) + Patchwerk (351028) - Shoulder Cache + Injection Vial
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351003, 351028) AND `Item` IN (22361, 59322, 59330);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351003, 59322, 0, 100, 0, 1, 0, 1, 1, 'Grobbulus - Naxxramas Armor Cache - Shoulder (F-025)'),
(351003, 59330, 0, 100, 0, 1, 0, 1, 1, "Grobbulus - Grobbulus's Injection Vial (F-025)"),
(351028, 59322, 0, 100, 0, 1, 0, 1, 1, 'Patchwerk - Naxxramas Armor Cache - Shoulder (F-025)');

-- Kel'Thuzad (351019) - Chest Cache + Phylactery Fragment
DELETE FROM `creature_loot_template` WHERE `Entry` = 351019 AND `Item` IN (22350, 59323, 59331);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351019, 59323, 0, 100, 0, 1, 0, 2, 2, "Kel'Thuzad - Naxxramas Armor Cache - Chest (F-025)"),
(351019, 59331, 0, 100, 0, 1, 0, 1, 1, "Kel'Thuzad - Kel'Thuzad's Phylactery Fragment (F-025)");

-- Loatheb (351020) - Legs Cache + Spore Essence
DELETE FROM `creature_loot_template` WHERE `Entry` = 351020 AND `Item` IN (22359, 59324, 59332);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351020, 59324, 0, 100, 0, 1, 0, 2, 2, 'Loatheb - Naxxramas Armor Cache - Legs (F-025)'),
(351020, 59332, 0, 100, 0, 1, 0, 1, 1, "Loatheb - Loatheb's Spore Essence (F-025)");

-- Gothik (351035) + Razuvious (351036) - Boots Cache + Unholy Sigil
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351035, 351036) AND `Item` IN (22365, 59325, 59333);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351035, 59325, 0, 100, 0, 1, 0, 1, 1, 'Gothik the Harvester - Naxxramas Armor Cache - Boots (F-025)'),
(351035, 59333, 0, 100, 0, 1, 0, 1, 1, "Gothik the Harvester - Gothik's Unholy Sigil (F-025)"),
(351036, 59325, 0, 100, 0, 1, 0, 1, 1, 'Instructor Razuvious - Naxxramas Armor Cache - Boots (F-025)');

-- Faerlina (351007) + Anub'Rekhan (351009) - Bracers Cache + Webbing
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351007, 351009) AND `Item` IN (22362, 59326, 59334);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351007, 59326, 0, 100, 0, 1, 0, 1, 1, 'Grand Widow Faerlina - Naxxramas Armor Cache - Bracers (F-025)'),
(351007, 59334, 0, 100, 0, 1, 0, 1, 1, "Grand Widow Faerlina - Faerlina's Webbing (F-025)"),
(351009, 59326, 0, 100, 0, 1, 0, 1, 1, "Anub'Rekhan - Naxxramas Armor Cache - Bracers (F-025)");

-- Maexxna (351006) - Gloves Cache + Fang
DELETE FROM `creature_loot_template` WHERE `Entry` = 351006 AND `Item` IN (22364, 59327, 59335);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351006, 59327, 0, 100, 0, 1, 0, 2, 2, "Maexxna - Naxxramas Armor Cache - Gloves (F-025)"),
(351006, 59335, 0, 100, 0, 1, 0, 1, 1, "Maexxna - Maexxna's Fang (F-025)");

-- Heigan (351005) + Noth (351008) - Belt Cache + Plague Vial
DELETE FROM `creature_loot_template` WHERE `Entry` IN (351005, 351008) AND `Item` IN (22363, 59328, 59336);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(351005, 59328, 0, 100, 0, 1, 0, 1, 1, 'Heigan the Unclean - Naxxramas Armor Cache - Belt (F-025)'),
(351005, 59336, 0, 100, 0, 1, 0, 1, 1, "Heigan the Unclean - Heigan's Plague Vial (F-025)"),
(351008, 59328, 0, 100, 0, 1, 0, 1, 1, 'Noth the Plaguebringer - Naxxramas Armor Cache - Belt (F-025)');

-- ============================================================================
-- SECTION 6: QUEST MODIFICATIONS (Light's Hope Chapel)
-- ============================================================================
-- Replace Desecrated tokens with Boss Artifacts in quest requirements
-- Remove all material requirements (Wartorn Scraps, Arcanite Bars, etc.)
-- Quest rewards changed from tier gear to gold/rep (artifact-only turn-in)

-- Helm Quests (all classes) - Artifact-only: 59329 (Thaddius's Power Core)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59329, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 500000, `RewardItem1` = 0
WHERE `ID` IN (9037, 9045, 9056, 9064, 9075, 9084, 9093, 9104, 9112);

-- Shoulder Quests (all classes) - Artifact-only: 59330 (Grobbulus's Injection Vial)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59330, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0
WHERE `ID` IN (9038, 9046, 9057, 9065, 9076, 9085, 9094, 9105, 9113);

-- Chest Quests (all classes) - Artifact-only: 59331 (Kel'Thuzad's Phylactery Fragment)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59331, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 600000, `RewardItem1` = 0
WHERE `ID` IN (9034, 9043, 9054, 9061, 9072, 9080, 9089, 9100, 9109);

-- Legs Quests (all classes) - Artifact-only: 59332 (Loatheb's Spore Essence)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59332, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 500000, `RewardItem1` = 0
WHERE `ID` IN (9036, 9044, 9055, 9063, 9074, 9083, 9092, 9103, 9111);

-- Boots Quests (all classes) - Artifact-only: 59333 (Gothik's Unholy Sigil)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59333, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0
WHERE `ID` IN (9039, 9047, 9058, 9066, 9077, 9086, 9095, 9106, 9114);

-- Bracers Quests (all classes) - Artifact-only: 59334 (Faerlina's Webbing)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59334, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 300000, `RewardItem1` = 0
WHERE `ID` IN (9042, 9050, 9061, 9069, 9079, 9088, 9097, 9108, 9116);

-- Gloves Quests (all classes) - Artifact-only: 59335 (Maexxna's Fang)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59335, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 400000, `RewardItem1` = 0
WHERE `ID` IN (9040, 9048, 9059, 9067, 9078, 9087, 9096, 9107, 9115);

-- Belt Quests (all classes) - Artifact-only: 59336 (Heigan's Plague Vial)
UPDATE `quest_template` SET
    `RequiredItemId1` = 59336, `RequiredItemCount1` = 1,
    `RequiredItemId2` = 0, `RequiredItemCount2` = 0,
    `RequiredItemId3` = 0, `RequiredItemCount3` = 0,
    `RequiredItemId4` = 0, `RequiredItemCount4` = 0,
    `RewardMoney` = 300000, `RewardItem1` = 0
WHERE `ID` IN (9041, 9049, 9060, 9068, 9078, 9087, 9096, 9107, 9115);
