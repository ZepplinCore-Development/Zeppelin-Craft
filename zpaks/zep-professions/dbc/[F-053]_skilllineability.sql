-- F-053 Arrow Crafting skill line abilities
-- Thorium Headed Arrows
DELETE FROM `skilllineability` WHERE `id` = 31560;

INSERT INTO `skilllineability` SET
    `id` = 31560,
    `skill_line` = 202,
    `spell_id` = 91079,
    `min_skill_value` = 1,
    `skill_grey_level` = 305,
    `skill_yellow_level` = 295;

-- Fel Iron Arrows
DELETE FROM `skilllineability` WHERE `id` = 32009;

INSERT INTO `skilllineability` SET
    `id` = 32009,
    `skill_line` = 202,
    `spell_id` = 91087,
    `min_skill_value` = 1,
    `skill_grey_level` = 330,
    `skill_yellow_level` = 310;

