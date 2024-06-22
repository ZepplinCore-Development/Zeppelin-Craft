-- Banana Creature Template
DELETE FROM `creature_template` WHERE (`entry` = 9000010);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9000010, 0, 0, 0, 0, 0, 21265, 0, 0, 0, 'Banana', 'Efficiency Enthusiast', '', 0, 80, 80, 2, 1741, 128, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 8, 768, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 12340);

-- Banana Spawns
DELETE FROM `creature` WHERE (`id1` = 9000010);
INSERT INTO `creature` (`id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(9000010,0,0,531,0,0,1,1,0,-8203.28,2002.19,132.381,2.63284,300,0.0,0,10080,8814,0,0,0,0,'',NULL), -- Ahn'Qiraj Temple
(9000010,0,0,469,0,0,1,1,0,-7622.12,-1095.21,407.206,2.15634,300,0.0,0,10080,8814,0,0,0,0,'',NULL), -- Blackwing Lair
(9000010,0,0,409,0,0,1,1,0,1062.93,-491.835,-108.7,0.639821,300,0.0,0,10080,8814,0,0,0,0,'',NULL); -- Molten Core

-- Banana Vendor Items
DELETE FROM `npc_vendor` WHERE (`entry` = 9000010);
REPLACE INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES

-- Consumables
(9000010, 0, 902326, 0, 0, 2998, 0), -- Drums of the Raid Leader
(9000010, 0, 41605, 0, 0, 2998, 0), -- Mystic Resonator
(9000010, 0, 901203, 0, 0, 2998, 0), -- Azerite Shard

-- Mage T1

(9000010, 1, 16795, 0, 0, 2998, 0), -- Arcanist Crown
(9000010, 1, 16796, 0, 0, 2998, 0), -- Arcanist Leggings
(9000010, 1, 16797, 0, 0, 2998, 0), -- Arcanist Mantle
(9000010, 1, 16798, 0, 0, 2998, 0), -- Arcanist Robes

-- Warlock T1

(9000010, 1, 16807, 0, 0, 2998, 0), -- Felheart Shoulder Pads
(9000010, 1, 16808, 0, 0, 2998, 0), -- Felheart Horns
(9000010, 1, 16809, 0, 0, 2998, 0), -- Felheart Robes
(9000010, 1, 16810, 0, 0, 2998, 0), -- Felheart Pants

-- Priest T1

(9000010, 1, 16813, 0, 0, 2998, 0), -- Circlet of Prophecy
(9000010, 1, 16814, 0, 0, 2998, 0), -- Pants of Prophecy
(9000010, 1, 16815, 0, 0, 2998, 0), -- Robes of Prophecy
(9000010, 1, 16816, 0, 0, 2998, 0), -- Mantle of Prophecy

-- Rogue T1

(9000010, 1, 16820, 0, 0, 2998, 0), -- Nightslayer Chestpiece
(9000010, 1, 16821, 0, 0, 2998, 0), -- Nightslayer Cover
(9000010, 1, 16822, 0, 0, 2998, 0), -- Nightslayer Pants
(9000010, 1, 16823, 0, 0, 2998, 0), -- Nightslayer Shoulder Pads

-- Druid T1

(9000010, 1, 16833, 0, 0, 2998, 0), -- Cenarion Vestments
(9000010, 1, 16834, 0, 0, 2998, 0), -- Cenarion Helm
(9000010, 1, 16835, 0, 0, 2998, 0), -- Cenarion Leggings
(9000010, 1, 16836, 0, 0, 2998, 0), -- Cenarion Spaulders

-- Shaman T1

(9000010, 1, 16841, 0, 0, 2998, 0), -- Earthfury Vestments
(9000010, 1, 16842, 0, 0, 2998, 0), -- Earthfury Helmet
(9000010, 1, 16843, 0, 0, 2998, 0), -- Earthfury Legguards
(9000010, 1, 16844, 0, 0, 2998, 0), -- Earthfury Epaulets

-- Hunter T1

(9000010, 1, 16845, 0, 0, 2998, 0), -- Giantstalker's Breastplate
(9000010, 1, 16846, 0, 0, 2998, 0), -- Giantstalker's Helmet
(9000010, 1, 16847, 0, 0, 2998, 0), -- Giantstalker's Leggings
(9000010, 1, 16848, 0, 0, 2998, 0), -- Giantstalker's Epaulets

-- Paladin T1

(9000010, 1, 16853, 0, 0, 2998, 0), -- Lawbringer Chestguard
(9000010, 1, 16854, 0, 0, 2998, 0), -- Lawbringer Helm
(9000010, 1, 16855, 0, 0, 2998, 0), -- Lawbringer Legplates
(9000010, 1, 16856, 0, 0, 2998, 0), -- Lawbringer Spaulders

-- Warrior T1

(9000010, 1, 16865, 0, 0, 2998, 0), -- Breastplate of Might
(9000010, 1, 16866, 0, 0, 2998, 0), -- Helm of Might
(9000010, 1, 16867, 0, 0, 2998, 0), -- Legplates of Might
(9000010, 1, 16868, 0, 0, 2998, 0), -- Pauldrons of Might

-- Druid T2

(9000010, 2, 16897, 0, 0, 3000, 0), -- Stormrage Chestguard
(9000010, 2, 16900, 0, 0, 3000, 0), -- Stormrage Cover
(9000010, 2, 16901, 0, 0, 3000, 0), -- Stormrage Legguards
(9000010, 2, 16902, 0, 0, 3000, 0), -- Stormrage Pauldrons

-- Rogue T2

(9000010, 2, 16832, 0, 0, 3000, 0), -- Bloodfang Spaulders
(9000010, 2, 16905, 0, 0, 3000, 0), -- Bloodfang Chestpiece
(9000010, 2, 16908, 0, 0, 3000, 0), -- Bloodfang Hood
(9000010, 2, 16909, 0, 0, 3000, 0), -- Bloodfang Pants

-- Mage T2

(9000010, 2, 16914, 0, 0, 3000, 0), -- Netherwind Crown
(9000010, 2, 16915, 0, 0, 3000, 0), -- Netherwind Pants
(9000010, 2, 16916, 0, 0, 3000, 0), -- Netherwind Robes
(9000010, 2, 16917, 0, 0, 3000, 0), -- Netherwind Mantle

-- Priest T2

(9000010, 2, 16921, 0, 0, 3000, 0), -- Halo of Transcendence
(9000010, 2, 16922, 0, 0, 3000, 0), -- Leggings of Transcendence
(9000010, 2, 16923, 0, 0, 3000, 0), -- Robes of Transcendence
(9000010, 2, 16924, 0, 0, 3000, 0), -- Pauldrons of Transcendence

-- Warlock T2

(9000010, 2, 16929, 0, 0, 3000, 0), -- Nemesis Skullcap
(9000010, 2, 16930, 0, 0, 3000, 0), -- Nemesis Leggings
(9000010, 2, 16931, 0, 0, 3000, 0), -- Nemesis Robes
(9000010, 2, 16932, 0, 0, 3000, 0), -- Nemesis Spaulders

-- Hunter T2

(9000010, 2, 16937, 0, 0, 3000, 0), -- Dragonstalker's Spaulders
(9000010, 2, 16938, 0, 0, 3000, 0), -- Dragonstalker's Legguards
(9000010, 2, 16939, 0, 0, 3000, 0), -- Dragonstalker's Helm
(9000010, 2, 16942, 0, 0, 3000, 0), -- Dragonstalker's Breastplate

-- Shaman T2

(9000010, 2, 16945, 0, 0, 3000, 0), -- Epaulets of Ten Storms
(9000010, 2, 16946, 0, 0, 3000, 0), -- Legplates of Ten Storms
(9000010, 2, 16947, 0, 0, 3000, 0), -- Helmet of Ten Storms
(9000010, 2, 16950, 0, 0, 3000, 0), -- Breastplate of Ten Storms

-- Paladin T2

(9000010, 2, 16953, 0, 0, 3000, 0), -- Judgement Spaulders
(9000010, 2, 16954, 0, 0, 3000, 0), -- Judgement Legplates
(9000010, 2, 16955, 0, 0, 3000, 0), -- Judgement Crown
(9000010, 2, 16958, 0, 0, 3000, 0), -- Judgement Breastplate

-- Warrior T2

(9000010, 2, 16961, 0, 0, 3000, 0), -- Pauldrons of Wrath
(9000010, 2, 16962, 0, 0, 3000, 0), -- Legplates of Wrath
(9000010, 2, 16963, 0, 0, 3000, 0), -- Helm of Wrath
(9000010, 2, 16966, 0, 0, 3000, 0), -- Breastplate of Wrath

-- Warrior T2.5

-- (9000010, 0, 21329, 0, 0, 3000, 0), -- Conqueror's Crown
-- (9000010, 0, 21330, 0, 0, 3000, 0), -- Conqueror's Spaulders
-- (9000010, 0, 21331, 0, 0, 3000, 0), -- Conqueror's Breastplate
-- (9000010, 0, 21332, 0, 0, 3000, 0), -- Conqueror's Legguards

-- Warlock T2.5

-- (9000010, 0, 21334, 0, 0, 3000, 0), -- Doomcaller's Robes
-- (9000010, 0, 21335, 0, 0, 3000, 0), -- Doomcaller's Mantle
-- (9000010, 0, 21336, 0, 0, 3000, 0), -- Doomcaller's Trousers
-- (9000010, 0, 21337, 0, 0, 3000, 0), -- Doomcaller's Circlet

-- Mage T2.5

-- (9000010, 0, 21343, 0, 0, 3000, 0), -- Enigma Robes
-- (9000010, 0, 21345, 0, 0, 3000, 0), -- Enigma Shoulderpads
-- (9000010, 0, 21346, 0, 0, 3000, 0), -- Enigma Leggings
-- (9000010, 0, 21347, 0, 0, 3000, 0), -- Enigma Circlet

-- Priest T2.5

-- (9000010, 0, 21348, 0, 0, 3000, 0), -- Tiara of the Oracle
-- (9000010, 0, 21350, 0, 0, 3000, 0), -- Mantle of the Oracle
-- (9000010, 0, 21351, 0, 0, 3000, 0), -- Vestments of the Oracle
-- (9000010, 0, 21352, 0, 0, 3000, 0), -- Trousers of the Oracle

-- Druid T2.5

-- (9000010, 0, 21353, 0, 0, 3000, 0), -- Genesis Helm
-- (9000010, 0, 21354, 0, 0, 3000, 0), -- Genesis Shoulderpads
-- (9000010, 0, 21356, 0, 0, 3000, 0), -- Genesis Trousers
-- (9000010, 0, 21357, 0, 0, 3000, 0), -- Genesis Vest

-- Rogue T2.5

-- (9000010, 0, 21360, 0, 0, 3000, 0), -- Deathdealer's Helm
-- (9000010, 0, 21361, 0, 0, 3000, 0), -- Deathdealer's Spaulders
-- (9000010, 0, 21362, 0, 0, 3000, 0), -- Deathdealer's Leggings
-- (9000010, 0, 21364, 0, 0, 3000, 0), -- Deathdealer's Vest

-- Hunter T2.5

-- (9000010, 0, 21366, 0, 0, 3000, 0), -- Striker's Diadem
-- (9000010, 0, 21367, 0, 0, 3000, 0), -- Striker's Pauldrons
-- (9000010, 0, 21368, 0, 0, 3000, 0), -- Striker's Leggings
-- (9000010, 0, 21370, 0, 0, 3000, 0), -- Striker's Hauberk

-- Shaman T2.5

-- (9000010, 0, 21372, 0, 0, 3000, 0), -- Stormcaller's Diadem
-- (9000010, 0, 21374, 0, 0, 3000, 0), -- Stormcaller's Hauberk
-- (9000010, 0, 21375, 0, 0, 3000, 0), -- Stormcaller's Leggings
-- (9000010, 0, 21376, 0, 0, 3000, 0), -- Stormcaller's Pauldrons

-- Paladin T2.5

-- (9000010, 0, 21387, 0, 0, 3000, 0), -- Avenger's Crown
-- (9000010, 0, 21389, 0, 0, 3000, 0), -- Avenger's Breastplate
-- (9000010, 0, 21390, 0, 0, 3000, 0), -- Avenger's Legguards
-- (9000010, 0, 21391, 0, 0, 3000, 0), -- Avenger's Pauldrons

-- Warrior T3

(9000010, 3, 22416, 0, 0, 3002, 0), -- Dreadnaught Breastplate
(9000010, 3, 22417, 0, 0, 3002, 0), -- Dreadnaught Legplates
(9000010, 3, 22418, 0, 0, 3002, 0), -- Dreadnaught Helmet
(9000010, 3, 22419, 0, 0, 3002, 0), -- Dreadnaught Pauldrons


-- Paladin T3

(9000010, 3, 22425, 0, 0, 3002, 0), -- Redemption Tunic
(9000010, 3, 22427, 0, 0, 3002, 0), -- Redemption Legguards
(9000010, 3, 22428, 0, 0, 3002, 0), -- Redemption Headpiece
(9000010, 3, 22429, 0, 0, 3002, 0), -- Redemption Spaulders

-- Hunter T3

(9000010, 3, 22436, 0, 0, 3002, 0), -- Cryptstalker Tunic
(9000010, 3, 22437, 0, 0, 3002, 0), -- Cryptstalker Legguards
(9000010, 3, 22438, 0, 0, 3002, 0), -- Cryptstalker Headpiece
(9000010, 3, 22439, 0, 0, 3002, 0), -- Cryptstalker Spaulders

-- Shaman T3

(9000010, 3, 22464, 0, 0, 3002, 0), -- Earthshatter Tunic
(9000010, 3, 22465, 0, 0, 3002, 0), -- Earthshatter Legguards
(9000010, 3, 22466, 0, 0, 3002, 0), -- Earthshatter Headpiece
(9000010, 3, 22467, 0, 0, 3002, 0), -- Earthshatter Spaulders

-- Rogue T3

(9000010, 3, 22476, 0, 0, 3002, 0), -- Bonescythe Breastplate
(9000010, 3, 22477, 0, 0, 3002, 0), -- Bonescythe Legplates
(9000010, 3, 22478, 0, 0, 3002, 0), -- Bonescythe Helmet
(9000010, 3, 22479, 0, 0, 3002, 0), -- Bonescythe Pauldrons

-- Druid T3

(9000010, 3, 22488, 0, 0, 3002, 0), -- Dreamwalker Tunic
(9000010, 3, 22489, 0, 0, 3002, 0), -- Dreamwalker Legguards
(9000010, 3, 22490, 0, 0, 3002, 0), -- Dreamwalker Headpiece
(9000010, 3, 22491, 0, 0, 3002, 0), -- Dreamwalker Spaulders

-- Mage T3

(9000010, 3, 22496, 0, 0, 3002, 0), -- Frostfire Robe
(9000010, 3, 22497, 0, 0, 3002, 0), -- Frostfire Leggings
(9000010, 3, 22498, 0, 0, 3002, 0), -- Frostfire Circlet
(9000010, 3, 22499, 0, 0, 3002, 0), -- Frostfire Shoulderpads

-- Warlock T3

(9000010, 3, 22504, 0, 0, 3002, 0), -- Plagueheart Robe
(9000010, 3, 22505, 0, 0, 3002, 0), -- Plagueheart Leggings
(9000010, 3, 22506, 0, 0, 3002, 0), -- Plagueheart Circlet
(9000010, 3, 22507, 0, 0, 3002, 0), -- Plagueheart Shoulderpads

-- Priest T3

(9000010, 3, 22512, 0, 0, 3002, 0), -- Robe of Faith
(9000010, 3, 22513, 0, 0, 3002, 0), -- Leggings of Faith
(9000010, 3, 22514, 0, 0, 3002, 0), -- Circlet of Faith
(9000010, 3, 22515, 0, 0, 3002, 0); -- Shoulderpads of Faith






