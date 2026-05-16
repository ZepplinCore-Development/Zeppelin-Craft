-- [I-179] Centaur Longbow (200306) stat rebalance
--
-- The clan-centaur module (upstream araxiaonline/ClanCentaur) ships this
-- bow as iLvl 16 / RequiredLevel 11 / RequiredReputationRank 0 with
-- RequiredReputationFaction = 93 (Magram). That triggers the AC startup
-- warning "min. reputation rank in RequiredReputationRank (0) but
-- RequiredReputationFaction > 0, faction setting is useless", and more
-- importantly leaves a level-11 bow in a Desolace vendor set whose
-- siblings (200307-200309) require level 38 and Honored Magram standing.
--
-- Rebalance to the Seasoned Marshwood Bow (33273) baseline (iLvl 39,
-- 41-78 dmg @ 2.7s, +4 Agility / +2 Stamina, level 0 required) and set
-- the rep gate to Friendly (rank 4) with Magram. That makes it the
-- Friendly-tier reward in the Magram set, matching the progression
-- tier of the L38 items (200307-309 at Honored = rank 5).
--
-- Patched here in the clan-centaur zpak rather than upstream because
-- the module is sourced from an external repo; this file applies AFTER
-- the module's own Items.sql so our values win.

UPDATE `item_template` SET
    `ItemLevel` = 39,
    `RequiredLevel` = 38,
    `dmg_min1` = 41,
    `dmg_max1` = 78,
    `delay` = 2700,
    `stat_type1` = 3,                 -- Agility
    `stat_value1` = 4,
    `stat_type2` = 7,                 -- Stamina
    `stat_value2` = 2,
    `RequiredReputationRank` = 4,     -- Friendly (clears the faction-useless warning)
    `BuyPrice` = 36697,               -- match Marshwood Bow
    `SellPrice` = 7339
WHERE `entry` = 200306;
