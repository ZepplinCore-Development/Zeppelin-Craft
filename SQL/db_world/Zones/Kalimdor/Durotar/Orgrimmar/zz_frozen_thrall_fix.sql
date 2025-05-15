-- A weird bug was causing Thrall to be frozen, after deleting and reinserting the creature entry it seems to work again.
DELETE FROM `creature` WHERE `id1` = 4949;
INSERT INTO `creature` SET
    `guid` = 3110629,
    `id1` = 4949,
    `map` = 1,
    `equipment_id` = 1,
    `position_x` = 1919.8,
    `position_y` = -4123.0,
    `position_z` = 44.6,
    `orientation` = 4.77722,
    `spawntimesecs` = 300,
    `curhealth` = 1857300,
    `curmana` = 39300,
    `VerifiedBuild` = NULL,
    `Comment` = NULL;

-- creature addon
DELETE FROM `creature_addon` WHERE `guid` = 3110629;
INSERT INTO `creature_addon` SET
    `guid` = 3110629,
    `bytes1` = 1,
    `auras` = NULL;
