-- =============================================================================
-- Shard Transmutation Trainer Spell Entries
-- Feature F-006: Complete shard transmutation system
-- =============================================================================
-- Tiered trainer support for Enchanting progression:
--   621 = Apprentice (0-70)
--   622 = Journeyman (0-150)
--   623 = Expert (0-225)
--   96  = Artisan (0-300)
--   95  = Master (0-350, TBC)
--   94  = Grand Master (0-450, WotLK)
-- =============================================================================
--
-- This file adds all shard transmutation recipes to enchanting trainers
-- and supersedes zz_small_to_large_brilliant.sql (absorbed into this system)
--
-- Skill Line: 333 (Enchanting)
-- Skill requirements updated to match item_level x 5 formula
-- =============================================================================

-- =============================================================================
-- GLIMMERING SHARD TRANSMUTATIONS (ItemLevel 25 -> 125 skill)
-- Available from: Journeyman, Expert, Artisan, Master, Grand Master
-- =============================================================================

-- Small Glimmering Shard -> Large Glimmering Shard (3:1 ratio)
-- Reagent: 3x Small Glimmering Shard (10978) -> 1x Large Glimmering Shard (11084)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91144;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(622, 91144, 6250, 333, 125, 0, 0, 0, 0),
(623, 91144, 6250, 333, 125, 0, 0, 0, 0),
(96,  91144, 6250, 333, 125, 0, 0, 0, 0),
(95,  91144, 6250, 333, 125, 0, 0, 0, 0),
(94,  91144, 6250, 333, 125, 0, 0, 0, 0);

-- Shatter Large Glimmering Shard -> Small Glimmering Shards (1:3 ratio)
-- Reagent: 1x Large Glimmering Shard (11084) -> 3x Small Glimmering Shard (10978)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91145;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(622, 91145, 6250, 333, 125, 0, 0, 0, 0),
(623, 91145, 6250, 333, 125, 0, 0, 0, 0),
(96,  91145, 6250, 333, 125, 0, 0, 0, 0),
(95,  91145, 6250, 333, 125, 0, 0, 0, 0),
(94,  91145, 6250, 333, 125, 0, 0, 0, 0);

-- =============================================================================
-- GLOWING SHARD TRANSMUTATIONS (ItemLevel 35 -> 175 skill)
-- Available from: Expert, Artisan, Master, Grand Master
-- =============================================================================

-- Large Glimmering Shard -> Small Glowing Shard (tier advancement)
-- Reagent: 3x Large Glimmering Shard (11084) -> 1x Small Glowing Shard (11138)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91146;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91146, 8750, 333, 175, 0, 0, 0, 0),
(96,  91146, 8750, 333, 175, 0, 0, 0, 0),
(95,  91146, 8750, 333, 175, 0, 0, 0, 0),
(94,  91146, 8750, 333, 175, 0, 0, 0, 0);

-- Small Glowing Shard -> Large Glowing Shard (3:1 ratio)
-- Reagent: 3x Small Glowing Shard (11138) -> 1x Large Glowing Shard (11139)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91147;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91147, 8750, 333, 175, 0, 0, 0, 0),
(96,  91147, 8750, 333, 175, 0, 0, 0, 0),
(95,  91147, 8750, 333, 175, 0, 0, 0, 0),
(94,  91147, 8750, 333, 175, 0, 0, 0, 0);

-- Shatter Large Glowing Shard -> Small Glowing Shards (1:3 ratio)
-- Reagent: 1x Large Glowing Shard (11139) -> 3x Small Glowing Shard (11138)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91148;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91148, 8750, 333, 175, 0, 0, 0, 0),
(96,  91148, 8750, 333, 175, 0, 0, 0, 0),
(95,  91148, 8750, 333, 175, 0, 0, 0, 0),
(94,  91148, 8750, 333, 175, 0, 0, 0, 0);

-- =============================================================================
-- RADIANT SHARD TRANSMUTATIONS (ItemLevel 45 -> 225 skill)
-- Available from: Expert, Artisan, Master, Grand Master
-- =============================================================================

-- Large Glowing Shard -> Small Radiant Shard (tier advancement)
-- Reagent: 3x Large Glowing Shard (11139) -> 1x Small Radiant Shard (11177)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91149;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91149, 11250, 333, 225, 0, 0, 0, 0),
(96,  91149, 11250, 333, 225, 0, 0, 0, 0),
(95,  91149, 11250, 333, 225, 0, 0, 0, 0),
(94,  91149, 11250, 333, 225, 0, 0, 0, 0);

-- Small Radiant Shard -> Large Radiant Shard (3:1 ratio)
-- Reagent: 3x Small Radiant Shard (11177) -> 1x Large Radiant Shard (11178)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91150;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91150, 11250, 333, 225, 0, 0, 0, 0),
(96,  91150, 11250, 333, 225, 0, 0, 0, 0),
(95,  91150, 11250, 333, 225, 0, 0, 0, 0),
(94,  91150, 11250, 333, 225, 0, 0, 0, 0);

-- Shatter Large Radiant Shard -> Small Radiant Shards (1:3 ratio)
-- Reagent: 1x Large Radiant Shard (11178) -> 3x Small Radiant Shard (11177)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91151;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(623, 91151, 11250, 333, 225, 0, 0, 0, 0),
(96,  91151, 11250, 333, 225, 0, 0, 0, 0),
(95,  91151, 11250, 333, 225, 0, 0, 0, 0),
(94,  91151, 11250, 333, 225, 0, 0, 0, 0);

-- =============================================================================
-- BRILLIANT SHARD TRANSMUTATIONS (ItemLevel 55 -> 275 skill)
-- Available from: Master, Grand Master
-- =============================================================================

-- Large Radiant Shard -> Small Brilliant Shard (tier advancement)
-- Reagent: 3x Large Radiant Shard (11178) -> 1x Small Brilliant Shard (14343)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91152;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(95, 91152, 13750, 333, 275, 0, 0, 0, 0),
(94, 91152, 13750, 333, 275, 0, 0, 0, 0);

-- Small Brilliant Shard -> Large Brilliant Shard (EXISTING RECIPE - absorbed from zz_small_to_large_brilliant.sql)
-- Reagent: 3x Small Brilliant Shard (14343) -> 1x Large Brilliant Shard (14344)
-- NOTE: This replaces the old zz_small_to_large_brilliant.sql file
DELETE FROM `trainer_spell` WHERE `SpellId` = 91117;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(95, 91117, 13750, 333, 275, 0, 0, 0, 0),
(94, 91117, 13750, 333, 275, 0, 0, 0, 0);

-- Shatter Large Brilliant Shard -> Small Brilliant Shards (1:3 ratio)
-- Reagent: 1x Large Brilliant Shard (14344) -> 3x Small Brilliant Shard (14343)
DELETE FROM `trainer_spell` WHERE `SpellId` = 91153;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(95, 91153, 13750, 333, 275, 0, 0, 0, 0),
(94, 91153, 13750, 333, 275, 0, 0, 0, 0);

-- =============================================================================
-- CROSS-EXPANSION TRANSMUTATIONS
-- =============================================================================

-- Shatter Nexus Crystal -> Small Prismatic Shards (ItemLevel 60 -> 300 skill)
-- Reagent: 1x Nexus Crystal (20725) -> 3x Small Prismatic Shard (22448)
-- NOTE: Large Brilliant -> Nexus Crystal recipe (91000) already exists
-- Available from: Master, Grand Master
DELETE FROM `trainer_spell` WHERE `SpellId` = 91154;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(95, 91154, 15000, 333, 300, 0, 0, 0, 0),
(94, 91154, 15000, 333, 300, 0, 0, 0, 0);

-- Large Prismatic Shard -> Void Crystal (ItemLevel 70 -> 350 skill)
-- Reagent: 2x Large Prismatic Shard (22449) -> 1x Void Crystal (22450)
-- NOTE: Prismatic shard small/large transmutations already exist in TBC
-- Available from: Master, Grand Master
DELETE FROM `trainer_spell` WHERE `SpellId` = 91155;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(95, 91155, 17500, 333, 350, 0, 0, 0, 0),
(94, 91155, 17500, 333, 350, 0, 0, 0, 0);

-- Shatter Void Crystal -> Small Dream Shards (ItemLevel 80 -> 400 skill)
-- Reagent: 1x Void Crystal (22450) -> 2x Small Dream Shard (34053)
-- Available from: Grand Master only
DELETE FROM `trainer_spell` WHERE `SpellId` = 91156;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(94, 91156, 20000, 333, 400, 0, 0, 0, 0);

-- Dream Shard -> Abyss Crystal (ItemLevel 80 -> 400 skill)
-- Reagent: 2x Dream Shard (34052) -> 1x Abyss Crystal (34057)
-- NOTE: Small Dream -> Dream Shard transmutation already exists in Wrath
-- Available from: Grand Master only
DELETE FROM `trainer_spell` WHERE `SpellId` = 91157;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(94, 91157, 20000, 333, 400, 0, 0, 0, 0);

-- =============================================================================
-- RECIPE SUMMARY
-- =============================================================================
--
-- Complete shard transmutation system with 15 total recipes:
-- - 14 new transmutation spells (91144-91157)
-- - 1 existing spell absorbed (91117 from zz_small_to_large_brilliant.sql)
--
-- Enchanting Trainer Tiers:
--   621 = Apprentice (0-70)
--   622 = Journeyman (0-150)
--   623 = Expert (0-225)
--   96  = Artisan (0-300)
--   95  = Master (0-350, TBC)
--   94  = Grand Master (0-450, WotLK)
--
-- Skill Line: 333 (Enchanting)
-- Skill Requirements: Based on item_level x 5 formula (125-400 skill)
-- Training Costs: Progressive scaling from 6,250 to 20,000 copper
--
-- SUPERSEDES: zz_small_to_large_brilliant.sql (can be deleted)
--
-- Players can learn all shard transmutation recipes from enchanting trainers
-- once they meet the progressive skill requirements for each tier.
-- =============================================================================
