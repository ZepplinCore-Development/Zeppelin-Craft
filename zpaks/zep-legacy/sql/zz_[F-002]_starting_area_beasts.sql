-- Starting creature skinning table
DELETE FROM `skinning_loot_template` WHERE (`Entry` = 299) AND `Reference` = 0;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(299, 2934, 0, 100, 0, 1, 0, 1, 3, '');

-- AZUREMYST ISLE -------------------------------------------------------

-- DUN MOROGH -------------------------------------------------------

    -- Ragged Timber Wolf
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 704;

    -- Ragged Young Wolf
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 705;

    -- Small Crag Boar
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 708;

-- TIRISTFALL GLADES -------------------------------------------------------

    -- Young Scavenger
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1508;

    -- Ragged Scavenger
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1509;

    -- Duskbat
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1512;

-- ELWYNN FOREST -------------------------------------------------------

    -- Young Wolf
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 299;

    -- Timber Wolf
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 69;

-- DUROTAR -------------------------------------------------------

    -- Scorpid Worker
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 3124;

    -- Felstalker
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 3102;

-- MULGORE -------------------------------------------------------

    -- Plainstrider
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 2955;

    -- Mountain Cougar
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 2961;

    -- Battleboar
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 2966;

-- TELDRASSIL -------------------------------------------------------

    -- Young Thistle Boar
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1984;

    -- Thistle Boar
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 1985;

    -- Young Nightsaber
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 2031;

    -- Mangy Nightsaber
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 2032;

-- EVERSONG WOODS -------------------------------------------------------

    -- Springpaw Cub
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 15366;

    -- Springpaw Lynx
    UPDATE `creature_template` SET `skinloot` = 299 WHERE `entry` = 15372;

