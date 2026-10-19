-- [F-031] Tiered practice locks: level lockpicking 1-250 through Engineering.
-- Stock Practice Lock (6712) becomes the Beginner's tier; three new items cover
-- lockpicking 50/100/150 via custom lock entries 2000-2002 (Lock.dbc, PATCH-Z).
-- Each lock is consumed when picked open (no loot, stock behaviour).
-- Recipes taught by all engineering trainers via trainer template 201012.

-- ============================================================
-- Items
-- ============================================================

-- Beginner's Practice Lock: stock item renamed (lock 5, lockpicking 1)
UPDATE `item_template` SET `name` = 'Beginner''s Practice Lock' WHERE `entry` = 6712;

-- Journeyman's Practice Lock: lockpicking 50
DELETE FROM `item_template` WHERE `entry` = 57220;
INSERT INTO `item_template` SET
  `entry` = 57220,
  `class` = 15,       -- Miscellaneous
  `subclass` = 0,
  `name` = 'Journeyman''s Practice Lock',
  `displayid` = 12925,
  `Quality` = 1,
  `ItemLevel` = 50,
  `lockid` = 2000,
  `SellPrice` = 25,
  `BuyPrice` = 100,
  `stackable` = 1,
  `material` = 1,
  `VerifiedBuild` = 1337;

-- Expert's Practice Lock: lockpicking 100
DELETE FROM `item_template` WHERE `entry` = 57221;
INSERT INTO `item_template` SET
  `entry` = 57221,
  `class` = 15,
  `subclass` = 0,
  `name` = 'Expert''s Practice Lock',
  `displayid` = 12925,
  `Quality` = 1,
  `ItemLevel` = 100,
  `lockid` = 2001,
  `SellPrice` = 50,
  `BuyPrice` = 200,
  `stackable` = 1,
  `material` = 1,
  `VerifiedBuild` = 1337;

-- Artisan's Practice Lock: lockpicking 150
DELETE FROM `item_template` WHERE `entry` = 57222;
INSERT INTO `item_template` SET
  `entry` = 57222,
  `class` = 15,
  `subclass` = 0,
  `name` = 'Artisan''s Practice Lock',
  `displayid` = 12925,
  `Quality` = 1,
  `ItemLevel` = 150,
  `lockid` = 2002,
  `SellPrice` = 100,
  `BuyPrice` = 400,
  `stackable` = 1,
  `material` = 1,
  `VerifiedBuild` = 1337;

-- ============================================================
-- Trainer recipes
-- ============================================================
-- This core uses the trainer/trainer_spell/creature_default_trainer system;
-- legacy npc_trainer is NOT loaded. The new recipes are taught by every
-- trainer record that teaches the stock Practice Lock (8334) -- i.e. all
-- engineering trainers.

-- Beginner's (stock 8334): requirement lowered from Engineering 100 to 50
UPDATE `trainer_spell` SET `ReqSkillRank` = 50, `MoneyCost` = 200
WHERE `SpellId` = 8334;

DELETE FROM `trainer_spell` WHERE `SpellId` IN (900817, 900818, 900819);

-- Journeyman's
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`)
SELECT DISTINCT `TrainerId`, 900817, 500, 202, 100, 0 FROM `trainer_spell` WHERE `SpellId` = 8334;

-- Expert's
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`)
SELECT DISTINCT `TrainerId`, 900818, 1000, 202, 150, 0 FROM `trainer_spell` WHERE `SpellId` = 8334;

-- Artisan's
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`)
SELECT DISTINCT `TrainerId`, 900819, 2000, 202, 200, 0 FROM `trainer_spell` WHERE `SpellId` = 8334;
