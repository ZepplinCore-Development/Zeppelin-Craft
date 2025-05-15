-- Darnassus Forge and Anvil

DELETE FROM `gameobject` WHERE (`id` = 21630); -- Forge
INSERT INTO `gameobject` SET
    `id` = 21630,
    `map` = 1,
    `position_x` = 9895.98,
    `position_y` = 2455.06,
    `position_z` = 1316.82,
    `orientation` = 3.29231,
    `rotation2` = -0.997162,
    `rotation3` = 0.0752882,
    `VerifiedBuild` = NULL;

DELETE FROM `gameobject` WHERE (`id` = 183878); -- Anvil
INSERT INTO `gameobject` SET
    `id` = 183878,
    `map` = 1,
    `position_x` = 9896.97,
    `position_y` = 2457.72,
    `position_z` = 1316.68,
    `orientation` = 2.98601,
    `rotation2` = -0.996976,
    `rotation3` = -0.0777129,
    `VerifiedBuild` = NULL;
