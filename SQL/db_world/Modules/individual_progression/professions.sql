-- Lhara in Darkmmon Faire - TBC Items
DELETE FROM `npc_vendor` WHERE (`entry` = 14846) AND (`item` IN (21887, 22572, 22573, 22574, 22575, 22576, 22577, 22578, 22787, 22789, 22790, 22791, 22792, 22793, 22794, 23436, 23437, 23438, 23439, 23440, 23441, 23793, 25707, 25708));

-- Lhara WotLK Items
DELETE FROM `npc_vendor` WHERE (`entry` = 14846) AND (`item` IN (33568, 36901, 36903, 36904, 36905, 36906, 36907, 36908, 37700, 37701, 37702, 37703, 37704, 37705, 37921, 38425, 44128, 46812));

-- Enchant formulas dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (20008, 20012, 20013, 20014, 20016, 20023, 20028, 32667);

-- Blacksmithing Plans dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (16642, 16643, 16644, 16652, 16653, 16662, 16969, 16971);

-- Alchemy recipes dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (2795, 17552, 17553, 17555, 17556, 17557, 17572, 17573);

-- Engineering Schematics dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (12615, 19790, 19791, 19792, 19794, 19795, 19800, 19825, 23071);

-- Tailoring Recipes dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (18450, 18453, 18444, 18406, 18409, 18417, 18423);

-- First Aid Recipes dropped as items
DELETE FROM npc_trainer WHERE SpellID IN (7929, 10840, 27032, 27033);

-- First Aid Skills should be from books or quests
DELETE FROM npc_trainer WHERE SpellID IN (54254, 10847, 54255);
UPDATE quest_template SET RewardItem3 = 16085, RewardAmount3 = 1 WHERE ID IN (6624, 6622);

-- Cooking Skills learned from Books and Quests, not trainers
DELETE FROM npc_trainer WHERE SpellID IN (18261, 19886, 54257, 54256);
UPDATE quest_template SET RewardItem1=16073, RewardAmount1=1 WHERE id = 6610;
UPDATE item_template SET spellid_1 = 19887 WHERE entry = 16073;

-- Make Spice Bread learnable for completion's sake, but only after reaching a level when it will no longer allow skipping early cooking
UPDATE npc_trainer SET ReqSkillRank = 200 WHERE SpellID = 37836;

-- Fishing needs to be learned from Quests and Books, remove from trainers
DELETE FROM npc_trainer WHERE SpellID IN (18249, 54083, 54084);
UPDATE quest_template SET RewardItem2 = 16082, RewardAmount2 = 1 WHERE ID = 6607;

-- Leatherworking Recipes
DELETE
FROM npc_trainer
WHERE SpellID IN
      (19052, 19055, 19065, 19071, 19072, 19083, 19091, 19092, 19098, 19102, 19103, 18403, 18407, 18410, 18411, 18413,
       18414, 18415, 18416, 18420, 18421, 18424, 18437, 18438, 18441, 18442, 18446, 18449, 18451, 19082, 32455);


-- Black Sack of Gems was added in late TBC to make it easy to get gems
DELETE FROM `creature_loot_template` WHERE `Entry`=17257 AND `Item`=34846 AND `Reference`=0 AND `GroupId`=0;

-- Restore Vendor Formulas
DELETE FROM npc_vendor WHERE entry = 11188 AND item = 13480;
DELETE FROM npc_vendor WHERE entry = 11189 AND item = 14481;
DELETE FROM npc_vendor WHERE entry = 4610 AND item = 13477;
DELETE FROM npc_vendor WHERE entry = 4226 AND item = 13477;
DELETE FROM npc_vendor WHERE entry = 12941 AND item = 15756;
DELETE FROM npc_vendor WHERE entry = 7940 AND item = 14488;

DELETE FROM npc_vendor WHERE entry = 18991 AND item = 21992;
DELETE FROM npc_vendor WHERE entry = 18990 AND item = 21992;
DELETE FROM npc_vendor WHERE entry = 18991 AND item = 21993;
DELETE FROM npc_vendor WHERE entry = 18990 AND item = 21993;

DELETE FROM npc_vendor WHERE entry = 3413 AND item = 16041;
DELETE FROM npc_vendor WHERE entry = 5175 AND item = 16041;
DELETE FROM npc_vendor WHERE entry = 3413 AND item = 16042;
DELETE FROM npc_vendor WHERE entry = 5175 AND item = 16042;
DELETE FROM npc_vendor WHERE entry = 11185 AND item = 16047;
DELETE FROM npc_vendor WHERE entry = 2685 AND item = 18651;


INSERT INTO npc_vendor (entry, slot, item) VALUES 
(2685, 0, 18651), 
(3413, 0, 16041),
(3413, 0, 16042),
(4610, 0, 13477),
(4226, 0, 13477),
(5175, 0, 16041),
(5175, 0, 16042),
(7940, 0, 14488),
(11185, 0, 16047),
(11188, 0, 13480),
(11189, 0, 14481),
(12941, 0, 15756),
(18990, 0, 21992),
(18990, 0, 21993),
(18991, 0, 21992),
(18991, 0, 21993);

-- Riding
DELETE FROM `npc_trainer` WHERE `ID`=450000;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES (450000, 33388, 900000, 762, 0, 40);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES (450000, 33391, 9000000, 762, 75, 60);

-- TBC Recipes moved to trainers in 2.4.0
DELETE FROM `npc_trainer` WHERE `SpellID` IN (28905, 34590, 28903, 28914, 28925, 28910, 28917, 28916, 28950, 28903);
DELETE FROM npc_vendor WHERE item IN (23131, 28596, 23148, 23137, 23144, 23135, 23141, 23140, 23152, 23130);
INSERT INTO npc_vendor (entry, slot, item) VALUES
(18751, 0, 23131),
(18774, 0, 23131),
(18751, 0, 28596),
(18774, 0, 28596),
(18751, 0, 23148),
(18774, 0, 23148),
(18751, 0, 23137),
(18774, 0, 23137),
(18751, 0, 23144),
(18774, 0, 23144),
(18751, 0, 23135),
(18774, 0, 23135),
(18751, 0, 23141),
(18774, 0, 23141),
(18751, 0, 23140),
(18774, 0, 23140),
(18751, 0, 23152),
(18774, 0, 23152),
(18751, 0, 23130),
(18774, 0, 23130);

-- Delete added riding trainers
DELETE FROM creature WHERE `id1` IN (35093, 35100);
DELETE FROM creature_addon WHERE `guid` IN (88165, 88166);

-- Remove TBC Gems from Prospecting Vanilla ore
DELETE FROM `prospecting_loot_template` WHERE `Entry`=10620 AND `Item`=1;


/* Create new pre T4 Leatherworking Trainer */
SET @lw_trainer_pre_t4 := 201050;

DELETE FROM `npc_trainer` WHERE `ID` = @lw_trainer_pre_t4;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES 
(@lw_trainer_pre_t4, 32454, 10000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32456, 15000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32462, 15000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32463, 20000, 165, 310, 0, 0),
(@lw_trainer_pre_t4, 32464, 20000, 165, 320, 0, 0),
(@lw_trainer_pre_t4, 32465, 25000, 165, 335, 0, 0),
(@lw_trainer_pre_t4, 32466, 15000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32467, 20000, 165, 310, 0, 0),
(@lw_trainer_pre_t4, 32468, 20000, 165, 325, 0, 0),
(@lw_trainer_pre_t4, 32469, 25000, 165, 335, 0, 0),
(@lw_trainer_pre_t4, 32470, 15000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32471, 20000, 165, 315, 0, 0),
(@lw_trainer_pre_t4, 32472, 20000, 165, 320, 0, 0),
(@lw_trainer_pre_t4, 32473, 25000, 165, 330, 0, 0),
(@lw_trainer_pre_t4, 32478, 15000, 165, 300, 0, 0),
(@lw_trainer_pre_t4, 32479, 20000, 165, 310, 0, 0),
(@lw_trainer_pre_t4, 32480, 20000, 165, 320, 0, 0),
(@lw_trainer_pre_t4, 32481, 25000, 165, 330, 0, 0),
(@lw_trainer_pre_t4, 32550, 100000, 165, 275, 50, 0),
(@lw_trainer_pre_t4, 35540, 20000, 165, 340, 0, 0),
(@lw_trainer_pre_t4, 44970, 50000, 165, 350, 0, 0);


/* Darmari shouldn't train certain leatherworking recipes until progression tier 10 */
/* to solve this a copy of her is created that only sells recipes that were available before progression tier 10 */
/* the original Darmari will replace her copy at progression tier 10 */
SET @Darmari := 119187;

/* Add copy of Darmari to creature_template with script npc_ipp_tbc_pre_t4 */
DELETE FROM `creature_template` WHERE `entry` = @Darmari;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) 
VALUES (@Darmari, 0, 0, 0, 0, 0, 'Darmari', 'Master Leatherworking Trainer', NULL, 7816, 63, 63, 0, 1818, 81, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 33024, 2048, 0, 0, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 1.05, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_ipp_tbc_pre_t4', 12340);

/* Add copy of Darmari to creature_template_addon */
DELETE FROM `creature_template_addon` WHERE `entry` = @Darmari;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (@Darmari, 0, 0, 0, 1, 0, 0, NULL);

/* Add copy of Darmari to creature_locale */
DELETE FROM `creature_template_locale` WHERE `entry` = @Darmari;
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES
(@Darmari, 'deDE', 'Darmari', 'Lederverarbeitungslehrerin', 18019),
(@Darmari, 'esES', 'Darmari', 'Instructora de peletería', 18019),
(@Darmari, 'esMX', 'Darmari', 'Instructora de peletería', 18019),
(@Darmari, 'frFR', 'Darmari', 'Maître des travailleurs du cuir', 18019),
(@Darmari, 'koKR', '다마리', '전문 가죽세공인', 18019),
(@Darmari, 'ruRU', 'Дармари', 'Учитель кожевничества', 18019),
(@Darmari, 'zhCN', '达尔玛里', '制皮训练师', 18019),
(@Darmari, 'zhTW', '達瑪莉', '製皮訓練師', 18019);

/* Add copy of Darmari to creature_template_model */
DELETE FROM `creature_template_model` WHERE `CreatureID` = @Darmari;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES (@Darmari, 0, 18630, 1, 1, 12340);

/* Add copy of Darmari to creature */
DELETE FROM `creature` WHERE `id1` = @Darmari;
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) 
VALUES (619187, @Darmari, 0, 0, 530, 0, 0, 1, 1, 1, -2060.92, 5256.68, -38.3819, 0.767945, 300, 0, 0, 3498, 0, 0, 0, 0, 0, '', 0, 0, NULL);

/* Add copy of Darmari to creature_equip_template */
DELETE FROM `creature_equip_template` WHERE `CreatureID` = @Darmari;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (@Darmari, 1, 2184, 0, 0, 18019);

/* Add correct leatherworking recipes to copy of Darmari */
DELETE FROM `npc_trainer` WHERE `ID` = @Darmari;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES (@Darmari, -201050, 0, 0, 0, 0, 0);


/* Barim Spilthoof shouldn't train certain leatherworking recipes until progression tier 10 */
/* to solve this a copy of him is created that only sells recipes that were available before progression tier 10 */
/* the original Barim Spilthoof will replace his copy at progression tier 10 */
SET @Barim := 118754;

/* Add copy of Barim to creature_template with script npc_ipp_tbc_pre_t4 */
DELETE FROM `creature_template` WHERE `entry` = @Barim;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) 
VALUES (@Barim, 0, 0, 0, 0, 0, 'Barim Spilthoof', 'Master Leatherworking Trainer', NULL, 7816, 60, 60, 0, 29, 209, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 512, 2048, 0, 0, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 1.02, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_ipp_tbc_pre_t4', 12340);

/* Add copy of Barim to creature_template_addon */
DELETE FROM `creature_template_addon` WHERE `entry` = @Barim;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (@Barim, 0, 0, 0, 1, 0, 0, NULL);

/* Add copy of Barim to creature_template_locale */
DELETE FROM `creature_template_locale` WHERE `entry` = @Barim;
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES
(@Barim, 'deDE', 'Barim Spalthuf', 'Lederverarbeitungslehrer', 18019),
(@Barim, 'esES', 'Barim Pezuña Partida', 'Instructor de peletería', 18019),
(@Barim, 'esMX', 'Barim Pezuña Partida', 'Instructor de peletería', 18019),
(@Barim, 'frFR', 'Barim Sabot-Fendu', 'Maître des travailleurs du cuir', 18019),
(@Barim, 'koKR', '바림 스필트후프', '전문 가죽세공인', 18019),
(@Barim, 'ruRU', 'Барим Треснувшее Копыто', 'Учитель кожевничества', 18019),
(@Barim, 'zhCN', '巴里姆·裂蹄', '制皮训练师', 18019),
(@Barim, 'zhTW', '巴瑞姆·裂蹄', '製皮訓練師', 18019);

/* Add copy of Barim to creature_template_model */
DELETE FROM `creature_template_model` WHERE `CreatureID` = @Barim;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES (@Barim, 0, 18176, 1, 1, 12340);

/* Add copy of Barim to creature */
DELETE FROM `creature` WHERE `id1` = @Barim;
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) 
VALUES (618754, @Barim, 0, 0, 530, 0, 0, 1, 1, 1, 148.588, 2636.02, 86.018, 1.27409, 300, 0, 0, 3113, 0, 0, 0, 0, 0, '', 0, 0, NULL);

/* Add copy of Barim to creature_equip_template */
DELETE FROM `creature_equip_template` WHERE `CreatureID` = @Barim;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (@Barim, 1, 10616, 0, 0, 18019);

/* Add correct leatherworking recipes to copy of Barim */
DELETE FROM `npc_trainer` WHERE `ID` = @Barim;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES (@Barim, -201050, 0, 0, 0, 0, 0);

/* Add vendor items to copy of Barim */
DELETE FROM `npc_vendor` WHERE `entry` = @Barim;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES 
(@Barim, 0, 2320, 0, 0, 0, 0), (@Barim, 0, 2321, 0, 0, 0, 0), (@Barim, 0, 2325, 0, 0, 0, 0), (@Barim, 0, 2604, 0, 0, 0, 0), (@Barim, 0, 2605, 0, 0, 0, 0), 
(@Barim, 0, 4289, 0, 0, 0, 0), (@Barim, 0, 4291, 0, 0, 0, 0), (@Barim, 0, 4340, 0, 0, 0, 0), (@Barim, 0, 4341, 0, 0, 0, 0), (@Barim, 0, 4342, 0, 0, 0, 0),
(@Barim, 0, 6260, 0, 0, 0, 0), (@Barim, 0, 6261, 0, 0, 0, 0), (@Barim, 0, 7005, 0, 0, 0, 0), (@Barim, 0, 8343, 0, 0, 0, 0), (@Barim, 0, 10290, 0, 0, 0, 0),
(@Barim, 0, 14341, 0, 0, 0, 0), (@Barim, 0, 38426, 0, 0, 0, 0);


/* Brumman shouldn't train certain leatherworking recipes until progression tier 10 */
/* to solve this a copy of him is created that only sells recipes that were available before progression tier 10 */
/* the original Brumman will replace his copy at progression tier 10 */
SET @Brumman := 118771;

/* Add copy of Brumman to creature_template with script npc_ipp_tbc_pre_t4 */
DELETE FROM `creature_template` WHERE `entry` = @Brumman;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) 
VALUES (@Brumman, 0, 0, 0, 0, 0, 'Brumman', 'Master Leatherworking Trainer', NULL, 0, 60, 60, 0, 1737, 209, 1, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 512, 2048, 0, 0, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 1.02, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_ipp_tbc_pre_t4', 12340);

/* Add copy of Brumman to creature_template_addon */
DELETE FROM `creature_template_addon` WHERE `entry` = @Brumman;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (@Brumman, 0, 0, 1, 1, 0, 0, NULL);

/* Add copy of Brumman to creature_template_locale */
DELETE FROM `creature_template_locale` WHERE `entry` = @Brumman;
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES
(@Brumman, 'deDE', 'Brumman', 'Lederverarbeitungslehrer', 18019),
(@Brumman, 'esES', 'Brumman', 'Instructor de peletería', 18019),
(@Brumman, 'esMX', 'Brumman', 'Instructor de peletería', 18019),
(@Brumman, 'frFR', 'Brumman', 'Maître des travailleurs du cuir', 18019),
(@Brumman, 'koKR', '브룸만', '전문 가죽세공인', 18019),
(@Brumman, 'ruRU', 'Брумман', 'Учитель кожевничества', 18019),
(@Brumman, 'zhCN', '布鲁曼', '制皮训练师', 18019),
(@Brumman, 'zhTW', '布魯曼恩', '製皮訓練師', 18019);

/* Add copy of Brumman to creature_template_model */
DELETE FROM `creature_template_model` WHERE `CreatureID` = @Brumman;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES (@Brumman, 0, 18177, 1, 1, 12340);

/* Add copy of Brumman to creature */
DELETE FROM `creature` WHERE `id1` = @Brumman;
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) 
VALUES (618771, @Brumman, 0, 0, 530, 0, 0, 1, 1, 1, -721.657, 2745.26, 94.0548, 3.45575, 300, 0, 0, 3113, 0, 0, 0, 0, 0, '', 0, 0, NULL);

/* Add copy of Brumman to creature_equip_template */
DELETE FROM `creature_equip_template` WHERE `CreatureID` = @Brumman;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES (@Brumman, 1, 10616, 0, 0, 18019);

/* Add correct leatherworking recipes to copy of Brumman */
DELETE FROM `npc_trainer` WHERE `ID` = @Brumman;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES (@Brumman, -201050, 0, 0, 0, 0, 0);

/* Add vendor items to copy of Brumman */
DELETE FROM `npc_vendor` WHERE `entry` = @Brumman;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES 
(@Brumman, 0, 2320, 0, 0, 0, 0), (@Brumman, 0, 2321, 0, 0, 0, 0), (@Brumman, 0, 2325, 0, 0, 0, 0), (@Brumman, 0, 2604, 0, 0, 0, 0), (@Brumman, 0, 2605, 0, 0, 0, 0),
(@Brumman, 0, 4289, 0, 0, 0, 0), (@Brumman, 0, 4291, 0, 0, 0, 0), (@Brumman, 0, 4340, 0, 0, 0, 0), (@Brumman, 0, 4341, 0, 0, 0, 0), (@Brumman, 0, 4342, 0, 0, 0, 0),
(@Brumman, 0, 6260, 0, 0, 0, 0), (@Brumman, 0, 6261, 0, 0, 0, 0), (@Brumman, 0, 7005, 0, 0, 0, 0), (@Brumman, 0, 8343, 0, 0, 0, 0), (@Brumman, 0, 10290, 0, 0, 0, 0),
(@Brumman, 0, 14341, 0, 0, 0, 0), (@Brumman, 0, 38426, 0, 0, 0, 0);


/* Grikka shouldn't train certain leatherworking recipes until progression tier 10 */
/* to solve this a copy of her is created that only sells recipes that were available before progression tier 10 */
/* the original Grikka will replace her copy at progression tier 10 */
SET @Grikka := 121087;

/* Add copy of Grikka to creature_template with script npc_ipp_tbc_pre_t4 */
DELETE FROM `creature_template` WHERE `entry` = @Grikka;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) 
VALUES (@Grikka, 0, 0, 0, 0, 0, 'Grikka', 'Master Leatherworking Trainer', NULL, 0, 60, 60, 0, 1735, 80, 1.125, 1.14286, 1, 1, 20, 1, 0, 0, 1, 2000, 2000, 1, 1, 1, 4608, 2048, 0, 0, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 1, 1.25, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_ipp_tbc_pre_t4', 12340);

/* Add copy of Grikka to creature_template_addon */
DELETE FROM `creature_template_addon` WHERE `entry` = @Grikka;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES (@Grikka, 0, 0, 0, 1, 0, 0, NULL);

/* Add copy of Grikka to creature_template_locale */
DELETE FROM `creature_template_locale` WHERE `entry` = @Grikka;
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES 
(@Grikka, 'deDE', 'Grikka', 'Lederverarbeitungslehrerin', 18019),
(@Grikka, 'esES', 'Grikka', 'Instructora de peletería', 18019),
(@Grikka, 'esMX', 'Grikka', 'Instructora de peletería', 18019),
(@Grikka, 'frFR', 'Grikka', 'Maître des travailleurs du cuir', 18019),
(@Grikka, 'koKR', '그리카', '전문 가죽세공인', 18019),
(@Grikka, 'ruRU', 'Грикка', 'Учитель кожевничества', 18019),
(@Grikka, 'zhCN', '格里卡', '制皮训练师', 18019),
(@Grikka, 'zhTW', '葛利卡', '製皮訓練師', 18019);

/* Add copy of Grikka to creature_template_model */
DELETE FROM `creature_template_model` WHERE `CreatureID` = @Grikka;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES (@Grikka, 0, 20059, 1, 1, 12340);

/* Add copy of Grikka to creature */
DELETE FROM `creature` WHERE `id1` = @Grikka;
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) 
VALUES (621087, @Grikka, 0, 0, 530, 0, 0, 1, 1, 0, 2039.82, 4675.43, 150.074, 0.977384, 300, 0, 0, 3815, 0, 0, 0, 0, 0, '', 0, 0, NULL);

/* Add correct leatherworking recipes to copy of Grikka */
DELETE FROM `npc_trainer` WHERE `ID` = @Grikka;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES (@Grikka, -201050, 0, 0, 0, 0, 0);
