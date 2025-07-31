-- =====================================================
-- Shard Transmutation NPC Trainer Entries
-- Feature F-006: Complete shard transmutation system
-- =====================================================
-- 
-- This file adds all shard transmutation recipes to enchanting trainers
-- and supersedes zz_small_to_large_brilliant.sql (absorbed into this system)
--
-- Trainer ID: 201009 (Expert Enchanting Trainer)
-- Skill Line: 333 (Enchanting)
-- Skill requirements updated to match item_level × 5 formula
-- =====================================================

-- =====================================================
-- GLIMMERING SHARD TRANSMUTATIONS (ItemLevel 25 → 125 skill)
-- =====================================================

-- Small Glimmering Shard → Large Glimmering Shard (3:1 ratio)
-- Reagent: 3x Small Glimmering Shard (10978) → 1x Large Glimmering Shard (11084)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91144;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91144,
    `MoneyCost` = 6250,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 125;

-- Shatter Large Glimmering Shard → Small Glimmering Shards (1:3 ratio) 
-- Reagent: 1x Large Glimmering Shard (11084) → 3x Small Glimmering Shard (10978)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91145;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91145,
    `MoneyCost` = 6250,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 125;

-- =====================================================
-- GLOWING SHARD TRANSMUTATIONS (ItemLevel 35 → 175 skill)
-- =====================================================

-- Large Glimmering Shard → Small Glowing Shard (tier advancement)
-- Reagent: 3x Large Glimmering Shard (11084) → 1x Small Glowing Shard (11138)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91146;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91146,
    `MoneyCost` = 8750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 175;

-- Small Glowing Shard → Large Glowing Shard (3:1 ratio)
-- Reagent: 3x Small Glowing Shard (11138) → 1x Large Glowing Shard (11139)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91147;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91147,
    `MoneyCost` = 8750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 175;

-- Shatter Large Glowing Shard → Small Glowing Shards (1:3 ratio)
-- Reagent: 1x Large Glowing Shard (11139) → 3x Small Glowing Shard (11138)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91148;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91148,
    `MoneyCost` = 8750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 175;

-- =====================================================
-- RADIANT SHARD TRANSMUTATIONS (ItemLevel 45 → 225 skill)
-- =====================================================

-- Large Glowing Shard → Small Radiant Shard (tier advancement)
-- Reagent: 3x Large Glowing Shard (11139) → 1x Small Radiant Shard (11177)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91149;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91149,
    `MoneyCost` = 11250,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 225;

-- Small Radiant Shard → Large Radiant Shard (3:1 ratio)
-- Reagent: 3x Small Radiant Shard (11177) → 1x Large Radiant Shard (11178)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91150;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91150,
    `MoneyCost` = 11250,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 225;

-- Shatter Large Radiant Shard → Small Radiant Shards (1:3 ratio)
-- Reagent: 1x Large Radiant Shard (11178) → 3x Small Radiant Shard (11177)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91151;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91151,
    `MoneyCost` = 11250,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 225;

-- =====================================================
-- BRILLIANT SHARD TRANSMUTATIONS (ItemLevel 55 → 275 skill)
-- =====================================================

-- Large Radiant Shard → Small Brilliant Shard (tier advancement)
-- Reagent: 3x Large Radiant Shard (11178) → 1x Small Brilliant Shard (14343)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91152;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91152,
    `MoneyCost` = 13750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 275;

-- Small Brilliant Shard → Large Brilliant Shard (EXISTING RECIPE - absorbed from zz_small_to_large_brilliant.sql)
-- Reagent: 3x Small Brilliant Shard (14343) → 1x Large Brilliant Shard (14344)
-- NOTE: This replaces the old zz_small_to_large_brilliant.sql file
DELETE FROM `npc_trainer` WHERE (`ID` = 201009 AND `SpellID` = 91117);
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91117,
    `MoneyCost` = 13750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 275;

-- Shatter Large Brilliant Shard → Small Brilliant Shards (1:3 ratio)
-- Reagent: 1x Large Brilliant Shard (14344) → 3x Small Brilliant Shard (14343)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91153;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91153,
    `MoneyCost` = 13750,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 275;

-- =====================================================
-- CROSS-EXPANSION TRANSMUTATIONS
-- =====================================================

-- Shatter Nexus Crystal → Small Prismatic Shards (ItemLevel 60 → 300 skill)
-- Reagent: 1x Nexus Crystal (20725) → 3x Small Prismatic Shard (22448)
-- NOTE: Large Brilliant → Nexus Crystal recipe (91000) already exists
DELETE FROM `npc_trainer` WHERE `SpellID` = 91154;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91154,
    `MoneyCost` = 15000,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 300;

-- Large Prismatic Shard → Void Crystal (ItemLevel 70 → 350 skill)
-- Reagent: 2x Large Prismatic Shard (22449) → 1x Void Crystal (22450)
-- NOTE: Prismatic shard small/large transmutations already exist in TBC
DELETE FROM `npc_trainer` WHERE `SpellID` = 91155;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91155,
    `MoneyCost` = 17500,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 350;

-- Shatter Void Crystal → Small Dream Shards (ItemLevel 80 → 400 skill)
-- Reagent: 1x Void Crystal (22450) → 2x Small Dream Shard (34053)
DELETE FROM `npc_trainer` WHERE `SpellID` = 91156;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91156,
    `MoneyCost` = 20000,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 400;

-- Dream Shard → Abyss Crystal (ItemLevel 80 → 400 skill)
-- Reagent: 2x Dream Shard (34052) → 1x Abyss Crystal (34057)
-- NOTE: Small Dream → Dream Shard transmutation already exists in Wrath
DELETE FROM `npc_trainer` WHERE `SpellID` = 91157;
INSERT INTO `npc_trainer`
SET `ID` = 201009,
    `SpellID` = 91157,
    `MoneyCost` = 20000,
    `ReqSkillLine` = 333,
    `ReqSkillRank` = 400;

-- =====================================================
-- RECIPE SUMMARY
-- =====================================================
-- 
-- Complete shard transmutation system with 15 total recipes:
-- - 14 new transmutation spells (91144-91157)  
-- - 1 existing spell absorbed (91117 from zz_small_to_large_brilliant.sql)
--
-- Trainer: 201009 (Expert Enchanting Trainer)
-- Skill Line: 333 (Enchanting)
-- Skill Requirements: Based on item_level × 5 formula (125-400 skill)
-- Training Costs: Progressive scaling from 6,250 to 20,000 copper
--
-- SUPERSEDES: zz_small_to_large_brilliant.sql (can be deleted)
-- 
-- Players can learn all shard transmutation recipes from expert enchanting 
-- trainers once they meet the progressive skill requirements for each tier.
-- =====================================================