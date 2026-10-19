-- [F-031] zep-professions: skilllineability
-- Universal Lockpicking + tiered practice lock recipes.

-- Pick Lock (1804) -> skill 633 link open to all classes (stock
-- required_classes=8, rogue-only). Captures a pre-tracking hand-edit that
-- existed only in the live dbc database and would be reverted by a rebuild.
UPDATE `skilllineability` SET `required_classes` = 0 WHERE `id` = 8439;

-- Beginner's Practice Lock (stock recipe 8334): retuned to learn at
-- Engineering 50 (npc_trainer), so craft colours move down with it.
UPDATE `skilllineability` SET
  `skill_yellow_level` = 65,
  `skill_grey_level` = 80
WHERE `id` = 4606;

-- Journeyman's Practice Lock: learned at Engineering 100
DELETE FROM `skilllineability` WHERE `id` = 200117;
INSERT INTO `skilllineability` SET
  `id` = 200117,
  `skill_line` = 202,
  `spell_id` = 900817,
  `min_skill_value` = 1,
  `skill_yellow_level` = 115,
  `skill_grey_level` = 130;

-- Expert's Practice Lock: learned at Engineering 150
DELETE FROM `skilllineability` WHERE `id` = 200118;
INSERT INTO `skilllineability` SET
  `id` = 200118,
  `skill_line` = 202,
  `spell_id` = 900818,
  `min_skill_value` = 1,
  `skill_yellow_level` = 165,
  `skill_grey_level` = 180;

-- Artisan's Practice Lock: learned at Engineering 200
DELETE FROM `skilllineability` WHERE `id` = 200119;
INSERT INTO `skilllineability` SET
  `id` = 200119,
  `skill_line` = 202,
  `spell_id` = 900819,
  `min_skill_value` = 1,
  `skill_yellow_level` = 215,
  `skill_grey_level` = 230;
