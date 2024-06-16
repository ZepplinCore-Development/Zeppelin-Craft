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

-- Patch 2.3 added easy to get catch-up ammo pouches
-- Allow these to remain available for completionists, but make them require having passed TBC progression
UPDATE `npc_trainer` SET `ReqLevel` = 71 WHERE `SpellID` IN (44343, 44344);

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

INSERT INTO npc_vendor (entry, slot, item) VALUES (11188, 0, 13480);
INSERT INTO npc_vendor (entry, slot, item) VALUES (11189, 0, 14481);
INSERT INTO npc_vendor (entry, slot, item) VALUES (4610, 0, 13477);
INSERT INTO npc_vendor (entry, slot, item) VALUES (4226, 0, 13477);
INSERT INTO npc_vendor (entry, slot, item) VALUES (12941, 0, 15756);
INSERT INTO npc_vendor (entry, slot, item) VALUES (7940, 0, 14488);

INSERT INTO npc_vendor (entry, slot, item) VALUES (18991, 0, 21992);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18990, 0, 21992);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18991, 0, 21993);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18990, 0, 21993);

INSERT INTO npc_vendor (entry, slot, item) VALUES (3413, 0, 16041);
INSERT INTO npc_vendor (entry, slot, item) VALUES (5175, 0, 16041);
INSERT INTO npc_vendor (entry, slot, item) VALUES (3413, 0, 16042);
INSERT INTO npc_vendor (entry, slot, item) VALUES (5175, 0, 16042);
INSERT INTO npc_vendor (entry, slot, item) VALUES (11185, 0, 16047);
INSERT INTO npc_vendor (entry, slot, item) VALUES (2685, 0, 18651);

-- Riding
DELETE FROM `npc_trainer` WHERE `ID`=450000;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES (450000, 33388, 900000, 762, 0, 40);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES (450000, 33391, 9000000, 762, 75, 60);

-- TBC Recipes moved to trainers in 2.4.0
DELETE FROM `npc_trainer` WHERE `SpellID` IN (28905, 34590, 28903, 28914, 28925, 28910, 28917, 28916, 28950, 28903);
DELETE FROM npc_vendor WHERE item IN (23131, 28596, 23148, 23137, 23144, 23135, 23141, 23140, 23152, 23130);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23131);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23131);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 28596);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 28596);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23148);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23148);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23137);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23137);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23144);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23144);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23135);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23135);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23141);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23141);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23140);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23140);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23152);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23152);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18751, 0, 23130);
INSERT INTO npc_vendor (entry, slot, item) VALUES (18774, 0, 23130);

-- Delete added riding trainers
DELETE FROM creature WHERE `id1` IN (35093, 35100);
DELETE FROM creature_addon WHERE `guid` IN (88165, 88166);

-- Remove TBC Gems from Prospecting Vanilla ore
DELETE FROM `prospecting_loot_template` WHERE `Entry`=10620 AND `Item`=1;
