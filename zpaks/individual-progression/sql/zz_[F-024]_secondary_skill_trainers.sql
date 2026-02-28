-- ============================================================================
-- Zeppelin Override: Restore secondary skill rank-ups to trainers
-- ============================================================================
-- IPP removes Fishing, Cooking, and First Aid rank-up spells from trainers
-- (gates them behind books/quests for expansion-accurate progression).
-- We want the standard WotLK trainer experience with proper tiering:
--
--   Journeyman  - Starting area trainers (cap 150)
--   Artisan     - Old world city trainers (cap 300)
--   Master      - Outland trainers (cap 375)
--   Grand Master - Northrend trainers (cap 450)
--
-- This matches how zz_ipp_trainer_consolidation.sql tiers main professions.
-- ============================================================================

-- First, clean up the broken old fix that added spells to portal trainers
-- Trainer 20 = Teleport/Portal: Undercity (Lexington Mortaim)
-- Trainer 21 = Portal trainer (Elissa Dumas)
-- Trainer 29 = Portal trainer (Ysuria)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 20 AND `SpellId` IN (18249, 54083, 54084);
DELETE FROM `trainer_spell` WHERE `TrainerId` = 21 AND `SpellId` IN (18261, 19886, 54256, 54257);
DELETE FROM `trainer_spell` WHERE `TrainerId` = 29 AND `SpellId` IN (10847, 54255, 54254);


-- ============================================================================
-- FISHING
-- ============================================================================
-- IPP removes: 54083 (req 125), 18249 (req 200), 54084 (req 275)
-- Spell progression by ReqSkillRank:
--   7733  Apprentice Fishing    (req 0)   - already on all trainers
--   7734  Journeyman Fishing    (req 50)  - already on all trainers
--   54083 Expert Fishing        (req 125) - REMOVED by IPP
--   18249 Artisan Fishing       (req 200) - REMOVED by IPP
--   54084 Master Fishing        (req 275) - REMOVED by IPP
--   51293 Grand Master Fishing  (req 350) - only on trainer 97
--
-- Trainer mapping:
--   647 = Starting area (Journeyman)  - no changes needed
--   98  = Old world (Artisan)         - add 54083, 18249
--   99  = Outland (Master)            - add 54083, 18249, 54084
--   97  = Northrend (Grand Master)    - add 54083, 18249, 54084
-- ============================================================================

-- Artisan tier: Old world trainers (TrainerId 98)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 98 AND `SpellId` IN (18249, 54083);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(98, 54083, 5000, 356, 125, 0),
(98, 18249, 100000, 356, 200, 0);

-- Master tier: Outland trainers (TrainerId 99)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 99 AND `SpellId` IN (18249, 54083, 54084);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(99, 54083, 5000, 356, 125, 0),
(99, 18249, 100000, 356, 200, 0),
(99, 54084, 350000, 356, 275, 0);

-- Grand Master tier: Northrend trainers (TrainerId 97)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 97 AND `SpellId` IN (18249, 54083, 54084);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(97, 54083, 5000, 356, 125, 0),
(97, 18249, 100000, 356, 200, 0),
(97, 54084, 350000, 356, 275, 0);

-- Move Zurjaya (18018) from Old World trainer 98 to Outland trainer 99
-- She is in Zangarmarsh (map 530) but was grouped with old world trainers
UPDATE `creature_default_trainer` SET `TrainerId` = 99 WHERE `CreatureId` = 18018;

-- Move capital city fishing trainers from Journeyman (647) to Artisan (98)
-- These are the only fishing trainers in their cities
-- Arnold Leland (5493) in Stormwind, Lumak (3332) in Orgrimmar, Kah Mistrunner (3028) in Thunder Bluff
UPDATE `creature_default_trainer` SET `TrainerId` = 98 WHERE `CreatureId` IN (5493, 3332, 3028);


-- ============================================================================
-- COOKING
-- ============================================================================
-- IPP removes: 19886 (req 125), 18261 (req 200), 54256 (req 275), 54257 (req 350)
-- Spell progression by ReqSkillRank:
--   2551  Apprentice Cook  (req 0)   - already on trainers
--   3412  Journeyman Cook  (req 50)  - already on trainers
--   19886 Expert Cook      (req 125) - REMOVED by IPP
--   18261 Artisan Cook     (req 200) - REMOVED by IPP
--   54256 Master Cook      (req 275) - REMOVED by IPP
--   54257 Expert Cook      (req 350) - REMOVED by IPP (Grand Master equivalent)
--   51295 Grand Master Cook(req 350) - only on trainer 75
--
-- Trainer mapping:
--   644 = Starting area (Journeyman)  - no changes needed
--   77  = Old world (Artisan)         - add 19886, 18261
--   76  = Outland (Master)            - add 19886, 18261, 54256
--   75  = Northrend (Grand Master)    - add 19886, 18261, 54256
-- ============================================================================

-- Artisan tier: Old world trainers (TrainerId 77)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 77 AND `SpellId` IN (18261, 19886);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(77, 19886, 5000, 185, 125, 0),
(77, 18261, 25000, 185, 200, 0);

-- Master tier: Outland trainers (TrainerId 76)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 76 AND `SpellId` IN (18261, 19886, 54256);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(76, 19886, 5000, 185, 125, 0),
(76, 18261, 25000, 185, 200, 0),
(76, 54256, 100000, 185, 275, 0);

-- Grand Master tier: Northrend trainers (TrainerId 75)
-- Already has 51295 (Grand Master Cook), just needs intermediate rank-ups
DELETE FROM `trainer_spell` WHERE `TrainerId` = 75 AND `SpellId` IN (18261, 19886, 54256);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(75, 19886, 5000, 185, 125, 0),
(75, 18261, 25000, 185, 200, 0),
(75, 54256, 100000, 185, 275, 0);

-- Move Outland cooking trainers from Old World trainer 77 to Outland trainer 76
-- Jack Trapper (19185) and Celie Steelwing (19369) are in Outland (map 530)
UPDATE `creature_default_trainer` SET `TrainerId` = 76 WHERE `CreatureId` IN (19185, 19369);

-- Move capital city cooking trainers from Journeyman (644) to Artisan (77)
-- These are the only real cooking trainers in their cities (the 347xx NPCs are Pilgrim's Bounty holiday)
-- Stephen Ryback (5482) in Stormwind, Zamja (3399) in Orgrimmar, Aska Mistrunner (3026) in Thunder Bluff
UPDATE `creature_default_trainer` SET `TrainerId` = 77 WHERE `CreatureId` IN (5482, 3399, 3026);


-- ============================================================================
-- FIRST AID
-- ============================================================================
-- IPP removes: 54254 (req 125), 10847 (req 200), 54255 (req 275)
-- Spell progression by ReqSkillRank:
--   3279  Apprentice First Aid    (req 0)   - already on trainers
--   3280  Journeyman First Aid    (req 50)  - already on trainers
--   54254 Expert First Aid        (req 125) - REMOVED by IPP
--   10847 Artisan First Aid       (req 200) - REMOVED by IPP
--   54255 Master First Aid        (req 275) - REMOVED by IPP
--   50299 Grand Master First Aid  (req 350) - only on trainer 81
--
-- Trainer mapping:
--   645 = Old world (Artisan)         - add 54254, 10847
--   646 = Doctors (Artisan)           - add 54254, 10847
--   82  = Outland (Master)            - add 54254, 10847, 54255
--   83  = Generic (Master)            - add 54254, 10847, 54255
--   81  = Northrend (Grand Master)    - add 54254, 10847, 54255
-- ============================================================================

-- Artisan tier: Old world trainers (TrainerId 645)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 645 AND `SpellId` IN (54254, 10847, 54255);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(645, 54254, 5000, 129, 125, 0),
(645, 10847, 100000, 129, 200, 0);

-- Artisan tier: Doctor trainers (TrainerId 646) — already teach Artisan bandages
DELETE FROM `trainer_spell` WHERE `TrainerId` = 646 AND `SpellId` IN (54254, 10847, 54255);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(646, 54254, 5000, 129, 125, 0),
(646, 10847, 100000, 129, 200, 0);

-- Master tier: Outland trainers (TrainerId 82)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 82 AND `SpellId` IN (54254, 10847, 54255);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(82, 54254, 5000, 129, 125, 0),
(82, 10847, 100000, 129, 200, 0),
(82, 54255, 350000, 129, 275, 0);

-- Master tier: Generic trainer (TrainerId 83)
DELETE FROM `trainer_spell` WHERE `TrainerId` = 83 AND `SpellId` IN (54254, 10847, 54255);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(83, 54254, 5000, 129, 125, 0),
(83, 10847, 100000, 129, 200, 0),
(83, 54255, 350000, 129, 275, 0);

-- Grand Master tier: Northrend trainers (TrainerId 81)
-- Already has 50299 (Grand Master First Aid), just needs intermediate rank-ups
DELETE FROM `trainer_spell` WHERE `TrainerId` = 81 AND `SpellId` IN (54254, 10847, 54255);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(81, 54254, 5000, 129, 125, 0),
(81, 10847, 100000, 129, 200, 0),
(81, 54255, 350000, 129, 275, 0);

-- Move Outland first aid trainers from Old World trainer 645 to Outland trainer 82
-- Mildred Fletcher (19184), Fera Palerunner (19478), Anchorite Ensham (22477) are in Outland
UPDATE `creature_default_trainer` SET `TrainerId` = 82 WHERE `CreatureId` IN (19184, 19478, 22477);


-- ============================================================================
-- FLAVOUR: Restore Expert Fishing book to Old Man Heming
-- ============================================================================
-- Item 16083 (Expert Fishing - The Bass and You) was sold by Old Man Heming
-- in vanilla but removed in WotLK since trainers handle rank-ups. We keep
-- it available for flavour since the book teaches the old spell (19889).
-- ============================================================================

DELETE FROM `npc_vendor` WHERE `entry` = 2626 AND `item` = 16083;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `VerifiedBuild`) VALUES
(2626, 0, 16083, 1, 9000, 0, 0);
