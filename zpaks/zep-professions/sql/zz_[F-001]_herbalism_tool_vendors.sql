-- ========================================
-- F-001: Herbalism Tool Vendor Repurchase
-- ========================================
-- Adds Journeyman/Artisan/Master/Grand Master Pruning Shears
-- to herbalism supply vendors, gated by quest completion.
-- Players who lose their tools can repurchase at approximate
-- material cost of the original quest turn-in.

-- ========================================
-- NPC FLAG UPDATES
-- ========================================
-- Add VENDOR flag (128) to trainers being converted to also sell items.
-- Cemmorhan (16736) Exodar Herbalism Trainer: 82 -> 210
-- Botanist Nathera (16644) Silvermoon Herbalism Trainer: 83 -> 211
-- Ruak Stronghorn (18748) Shattrath Herbalism Trainer: 83 -> 211
UPDATE `creature_template` SET `npcflag` = `npcflag` | 128
WHERE `entry` IN (16736, 16644, 18748)
AND (`npcflag` & 128) = 0;

-- Add "browse goods" option to herbalism trainer gossip menu (7691)
-- Used by Botanist Nathera (16644) and Ruak Stronghorn (18748).
-- Cemmorhan (16736) uses gossip_menu_id 0 which already has vendor option.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 7691 AND `OptionID` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(7691, 1, 1, 'Let me browse your goods.', 3, 128, 0, 0);

-- ========================================
-- ITEM BUYPRICE UPDATES
-- ========================================
UPDATE `item_template` SET `BuyPrice` = 10000  WHERE `entry` = 57300; -- Journeyman (1g)
UPDATE `item_template` SET `BuyPrice` = 50000  WHERE `entry` = 57301; -- Artisan (5g)
UPDATE `item_template` SET `BuyPrice` = 100000 WHERE `entry` = 57302; -- Master (10g)
UPDATE `item_template` SET `BuyPrice` = 200000 WHERE `entry` = 57303; -- Grand Master (20g)

-- ========================================
-- NPC_VENDOR ENTRIES
-- ========================================
-- 10 vendors × 4 items = 40 rows

DELETE FROM `npc_vendor` WHERE `item` IN (57300, 57301, 57302, 57303);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
-- Stormwind - Eldraeith (5503)
(5503, 0, 57300, 0, 0, 0),
(5503, 0, 57301, 0, 0, 0),
(5503, 0, 57302, 0, 0, 0),
(5503, 0, 57303, 0, 0, 0),
-- Ironforge - Gwina Stonebranch (5138)
(5138, 0, 57300, 0, 0, 0),
(5138, 0, 57301, 0, 0, 0),
(5138, 0, 57302, 0, 0, 0),
(5138, 0, 57303, 0, 0, 0),
-- Darnassus - Chardryn (4216)
(4216, 0, 57300, 0, 0, 0),
(4216, 0, 57301, 0, 0, 0),
(4216, 0, 57302, 0, 0, 0),
(4216, 0, 57303, 0, 0, 0),
-- Exodar - Cemmorhan (16736)
(16736, 0, 57300, 0, 0, 0),
(16736, 0, 57301, 0, 0, 0),
(16736, 0, 57302, 0, 0, 0),
(16736, 0, 57303, 0, 0, 0),
-- Orgrimmar - Zeal'aya (3405)
(3405, 0, 57300, 0, 0, 0),
(3405, 0, 57301, 0, 0, 0),
(3405, 0, 57302, 0, 0, 0),
(3405, 0, 57303, 0, 0, 0),
-- Thunder Bluff - Nida Winterhoof (3014)
(3014, 0, 57300, 0, 0, 0),
(3014, 0, 57301, 0, 0, 0),
(3014, 0, 57302, 0, 0, 0),
(3014, 0, 57303, 0, 0, 0),
-- Undercity - Katrina Alliestar (4615)
(4615, 0, 57300, 0, 0, 0),
(4615, 0, 57301, 0, 0, 0),
(4615, 0, 57302, 0, 0, 0),
(4615, 0, 57303, 0, 0, 0),
-- Silvermoon - Botanist Nathera (16644)
(16644, 0, 57300, 0, 0, 0),
(16644, 0, 57301, 0, 0, 0),
(16644, 0, 57302, 0, 0, 0),
(16644, 0, 57303, 0, 0, 0),
-- Shattrath - Ruak Stronghorn (18748)
(18748, 0, 57300, 0, 0, 0),
(18748, 0, 57301, 0, 0, 0),
(18748, 0, 57302, 0, 0, 0),
(18748, 0, 57303, 0, 0, 0),
-- Dalaran - Edward Egan (28727)
(28727, 0, 57300, 0, 0, 0),
(28727, 0, 57301, 0, 0, 0),
(28727, 0, 57302, 0, 0, 0),
(28727, 0, 57303, 0, 0, 0);

-- ========================================
-- CONDITIONS (Quest-gated visibility)
-- ========================================
-- SourceTypeOrReferenceId 23 = CONDITION_SOURCE_TYPE_NPC_VENDOR
-- ConditionTypeOrReference 8 = CONDITION_QUESTREWARDED
-- ElseGroup provides OR logic across exclusive quest variants

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23
AND `SourceEntry` IN (57300, 57301, 57302, 57303);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- ----------------------------------------
-- Journeyman Pruning Shears (57300)
-- Quests: 90008-90015 (8 race variants)
-- ----------------------------------------
-- Stormwind - Eldraeith (5503)
(23, 5503, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 5503, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 5503, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 5503, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 5503, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 5503, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 5503, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 5503, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Ironforge - Gwina Stonebranch (5138)
(23, 5138, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 5138, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 5138, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 5138, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 5138, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 5138, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 5138, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 5138, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Darnassus - Chardryn (4216)
(23, 4216, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 4216, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 4216, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 4216, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 4216, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 4216, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 4216, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 4216, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Exodar - Cemmorhan (16736)
(23, 16736, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 16736, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 16736, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 16736, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 16736, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 16736, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 16736, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 16736, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Orgrimmar - Zeal'aya (3405)
(23, 3405, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 3405, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 3405, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 3405, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 3405, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 3405, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 3405, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 3405, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Thunder Bluff - Nida Winterhoof (3014)
(23, 3014, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 3014, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 3014, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 3014, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 3014, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 3014, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 3014, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 3014, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Undercity - Katrina Alliestar (4615)
(23, 4615, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 4615, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 4615, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 4615, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 4615, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 4615, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 4615, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 4615, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Silvermoon - Botanist Nathera (16644)
(23, 16644, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 16644, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 16644, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 16644, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 16644, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 16644, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 16644, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 16644, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Shattrath - Ruak Stronghorn (18748)
(23, 18748, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 18748, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 18748, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 18748, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 18748, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 18748, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 18748, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 18748, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),
-- Dalaran - Edward Egan (28727)
(23, 28727, 57300, 0, 0, 8, 0, 90008, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90008'),
(23, 28727, 57300, 0, 1, 8, 0, 90009, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90009'),
(23, 28727, 57300, 0, 2, 8, 0, 90010, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90010'),
(23, 28727, 57300, 0, 3, 8, 0, 90011, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90011'),
(23, 28727, 57300, 0, 4, 8, 0, 90012, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90012'),
(23, 28727, 57300, 0, 5, 8, 0, 90013, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90013'),
(23, 28727, 57300, 0, 6, 8, 0, 90014, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90014'),
(23, 28727, 57300, 0, 7, 8, 0, 90015, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears J - Quest 90015'),

-- ----------------------------------------
-- Artisan Pruning Shears (57301)
-- Quests: 90016-90023 (8 race variants)
-- ----------------------------------------
-- Stormwind - Eldraeith (5503)
(23, 5503, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 5503, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 5503, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 5503, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 5503, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 5503, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 5503, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 5503, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Ironforge - Gwina Stonebranch (5138)
(23, 5138, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 5138, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 5138, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 5138, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 5138, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 5138, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 5138, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 5138, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Darnassus - Chardryn (4216)
(23, 4216, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 4216, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 4216, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 4216, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 4216, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 4216, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 4216, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 4216, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Exodar - Cemmorhan (16736)
(23, 16736, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 16736, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 16736, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 16736, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 16736, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 16736, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 16736, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 16736, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Orgrimmar - Zeal'aya (3405)
(23, 3405, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 3405, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 3405, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 3405, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 3405, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 3405, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 3405, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 3405, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Thunder Bluff - Nida Winterhoof (3014)
(23, 3014, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 3014, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 3014, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 3014, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 3014, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 3014, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 3014, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 3014, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Undercity - Katrina Alliestar (4615)
(23, 4615, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 4615, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 4615, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 4615, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 4615, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 4615, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 4615, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 4615, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Silvermoon - Botanist Nathera (16644)
(23, 16644, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 16644, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 16644, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 16644, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 16644, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 16644, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 16644, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 16644, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Shattrath - Ruak Stronghorn (18748)
(23, 18748, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 18748, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 18748, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 18748, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 18748, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 18748, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 18748, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 18748, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),
-- Dalaran - Edward Egan (28727)
(23, 28727, 57301, 0, 0, 8, 0, 90016, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90016'),
(23, 28727, 57301, 0, 1, 8, 0, 90017, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90017'),
(23, 28727, 57301, 0, 2, 8, 0, 90018, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90018'),
(23, 28727, 57301, 0, 3, 8, 0, 90019, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90019'),
(23, 28727, 57301, 0, 4, 8, 0, 90020, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90020'),
(23, 28727, 57301, 0, 5, 8, 0, 90021, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90021'),
(23, 28727, 57301, 0, 6, 8, 0, 90022, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90022'),
(23, 28727, 57301, 0, 7, 8, 0, 90023, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears A - Quest 90023'),

-- ----------------------------------------
-- Master Pruning Shears (57302)
-- Quests: 90024-90025 (2 faction variants)
-- ----------------------------------------
-- Stormwind - Eldraeith (5503)
(23, 5503, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 5503, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Ironforge - Gwina Stonebranch (5138)
(23, 5138, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 5138, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Darnassus - Chardryn (4216)
(23, 4216, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 4216, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Exodar - Cemmorhan (16736)
(23, 16736, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 16736, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Orgrimmar - Zeal'aya (3405)
(23, 3405, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 3405, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Thunder Bluff - Nida Winterhoof (3014)
(23, 3014, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 3014, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Undercity - Katrina Alliestar (4615)
(23, 4615, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 4615, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Silvermoon - Botanist Nathera (16644)
(23, 16644, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 16644, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Shattrath - Ruak Stronghorn (18748)
(23, 18748, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 18748, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),
-- Dalaran - Edward Egan (28727)
(23, 28727, 57302, 0, 0, 8, 0, 90024, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90024'),
(23, 28727, 57302, 0, 1, 8, 0, 90025, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears M - Quest 90025'),

-- ----------------------------------------
-- Grand Master Pruning Shears (57303)
-- Quest: 90026 (1 quest, both factions)
-- ----------------------------------------
-- Stormwind - Eldraeith (5503)
(23, 5503, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Ironforge - Gwina Stonebranch (5138)
(23, 5138, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Darnassus - Chardryn (4216)
(23, 4216, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Exodar - Cemmorhan (16736)
(23, 16736, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Orgrimmar - Zeal'aya (3405)
(23, 3405, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Thunder Bluff - Nida Winterhoof (3014)
(23, 3014, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Undercity - Katrina Alliestar (4615)
(23, 4615, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Silvermoon - Botanist Nathera (16644)
(23, 16644, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Shattrath - Ruak Stronghorn (18748)
(23, 18748, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026'),
-- Dalaran - Edward Egan (28727)
(23, 28727, 57303, 0, 0, 8, 0, 90026, 0, 0, 0, 0, 0, '', 'F-001 Pruning Shears GM - Quest 90026');
