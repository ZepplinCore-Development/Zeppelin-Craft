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
