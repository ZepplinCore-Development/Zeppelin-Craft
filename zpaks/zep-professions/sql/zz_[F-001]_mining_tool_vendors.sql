-- ========================================
-- F-001: Mining Tool Vendor Repurchase
-- ========================================
-- Adds Journeyman/Artisan/Master/Grand Master Mining Picks
-- to mining supply vendors, gated by quest completion.
-- Players who lose their tools can repurchase at approximate
-- material cost of the original quest turn-in.

-- ========================================
-- NPC FLAG UPDATES
-- ========================================
-- Add VENDOR flag (128) to Borin Irondelve (Darnassus Mining Trainer)
-- so he can also sell items. Currently npcflag = 83 -> 211.
UPDATE `creature_template` SET `npcflag` = `npcflag` | 128
WHERE `entry` = 70
AND (`npcflag` & 128) = 0;

-- Add "browse goods" option to Borin's gossip menu (7690)
-- so players can access the vendor window alongside training.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 7690 AND `OptionID` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`) VALUES
(7690, 1, 1, 'Let me browse your goods.', 3, 128, 0, 0);

-- ========================================
-- ITEM BUYPRICE UPDATES
-- ========================================
UPDATE `item_template` SET `BuyPrice` = 10000  WHERE `entry` = 57400; -- Journeyman (1g)
UPDATE `item_template` SET `BuyPrice` = 50000  WHERE `entry` = 57401; -- Artisan (5g)
UPDATE `item_template` SET `BuyPrice` = 100000 WHERE `entry` = 57402; -- Master (10g)
UPDATE `item_template` SET `BuyPrice` = 200000 WHERE `entry` = 57403; -- Grand Master (20g)

-- ========================================
-- NPC_VENDOR ENTRIES
-- ========================================
-- 9 vendors × 4 items = 36 rows

DELETE FROM `npc_vendor` WHERE `item` IN (57400, 57401, 57402, 57403);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
-- Stormwind - Brooke Stonebraid (5514)
(5514, 0, 57400, 0, 0, 0),
(5514, 0, 57401, 0, 0, 0),
(5514, 0, 57402, 0, 0, 0),
(5514, 0, 57403, 0, 0, 0),
-- Ironforge - Golnir Bouldertoe (4256)
(4256, 0, 57400, 0, 0, 0),
(4256, 0, 57401, 0, 0, 0),
(4256, 0, 57402, 0, 0, 0),
(4256, 0, 57403, 0, 0, 0),
-- Darnassus - Borin Irondelve (70)
(70, 0, 57400, 0, 0, 0),
(70, 0, 57401, 0, 0, 0),
(70, 0, 57402, 0, 0, 0),
(70, 0, 57403, 0, 0, 0),
-- Exodar - Merran (16751)
(16751, 0, 57400, 0, 0, 0),
(16751, 0, 57401, 0, 0, 0),
(16751, 0, 57402, 0, 0, 0),
(16751, 0, 57403, 0, 0, 0),
-- Orgrimmar - Gorina (3358)
(3358, 0, 57400, 0, 0, 0),
(3358, 0, 57401, 0, 0, 0),
(3358, 0, 57402, 0, 0, 0),
(3358, 0, 57403, 0, 0, 0),
-- Thunder Bluff - Kurm Stonehoof (3002)
(3002, 0, 57400, 0, 0, 0),
(3002, 0, 57401, 0, 0, 0),
(3002, 0, 57402, 0, 0, 0),
(3002, 0, 57403, 0, 0, 0),
-- Undercity - Sarah Killian (4599)
(4599, 0, 57400, 0, 0, 0),
(4599, 0, 57401, 0, 0, 0),
(4599, 0, 57402, 0, 0, 0),
(4599, 0, 57403, 0, 0, 0),
-- Silvermoon - Zelan (16664)
(16664, 0, 57400, 0, 0, 0),
(16664, 0, 57401, 0, 0, 0),
(16664, 0, 57402, 0, 0, 0),
(16664, 0, 57403, 0, 0, 0),
-- Dalaran - Dorian Fines (28728)
(28728, 0, 57400, 0, 0, 0),
(28728, 0, 57401, 0, 0, 0),
(28728, 0, 57402, 0, 0, 0),
(28728, 0, 57403, 0, 0, 0);

-- ========================================
-- CONDITIONS (Quest-gated visibility)
-- ========================================
-- SourceTypeOrReferenceId 23 = CONDITION_SOURCE_TYPE_NPC_VENDOR
-- ConditionTypeOrReference 8 = CONDITION_QUESTREWARDED
-- ElseGroup provides OR logic across exclusive quest variants

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23
AND `SourceEntry` IN (57400, 57401, 57402, 57403);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- ----------------------------------------
-- Journeyman Mining Pick (57400)
-- Quests: 90027-90034 (8 race variants)
-- ----------------------------------------
-- Stormwind - Brooke Stonebraid (5514)
(23, 5514, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 5514, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 5514, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 5514, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 5514, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 5514, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 5514, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 5514, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Ironforge - Golnir Bouldertoe (4256)
(23, 4256, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 4256, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 4256, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 4256, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 4256, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 4256, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 4256, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 4256, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Darnassus - Borin Irondelve (70)
(23, 70, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 70, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 70, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 70, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 70, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 70, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 70, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 70, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Exodar - Merran (16751)
(23, 16751, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 16751, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 16751, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 16751, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 16751, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 16751, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 16751, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 16751, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Orgrimmar - Gorina (3358)
(23, 3358, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 3358, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 3358, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 3358, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 3358, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 3358, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 3358, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 3358, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Thunder Bluff - Kurm Stonehoof (3002)
(23, 3002, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 3002, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 3002, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 3002, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 3002, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 3002, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 3002, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 3002, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Undercity - Sarah Killian (4599)
(23, 4599, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 4599, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 4599, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 4599, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 4599, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 4599, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 4599, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 4599, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Silvermoon - Zelan (16664)
(23, 16664, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 16664, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 16664, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 16664, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 16664, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 16664, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 16664, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 16664, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),
-- Dalaran - Dorian Fines (28728)
(23, 28728, 57400, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90027'),
(23, 28728, 57400, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90028'),
(23, 28728, 57400, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90029'),
(23, 28728, 57400, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90030'),
(23, 28728, 57400, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90031'),
(23, 28728, 57400, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90032'),
(23, 28728, 57400, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90033'),
(23, 28728, 57400, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick J - Quest 90034'),

-- ----------------------------------------
-- Artisan Mining Pick (57401)
-- Quests: 90035-90042 (8 race variants)
-- ----------------------------------------
-- Stormwind - Brooke Stonebraid (5514)
(23, 5514, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 5514, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 5514, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 5514, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 5514, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 5514, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 5514, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 5514, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Ironforge - Golnir Bouldertoe (4256)
(23, 4256, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 4256, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 4256, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 4256, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 4256, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 4256, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 4256, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 4256, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Darnassus - Borin Irondelve (70)
(23, 70, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 70, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 70, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 70, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 70, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 70, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 70, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 70, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Exodar - Merran (16751)
(23, 16751, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 16751, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 16751, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 16751, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 16751, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 16751, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 16751, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 16751, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Orgrimmar - Gorina (3358)
(23, 3358, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 3358, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 3358, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 3358, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 3358, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 3358, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 3358, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 3358, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Thunder Bluff - Kurm Stonehoof (3002)
(23, 3002, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 3002, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 3002, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 3002, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 3002, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 3002, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 3002, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 3002, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Undercity - Sarah Killian (4599)
(23, 4599, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 4599, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 4599, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 4599, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 4599, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 4599, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 4599, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 4599, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Silvermoon - Zelan (16664)
(23, 16664, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 16664, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 16664, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 16664, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 16664, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 16664, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 16664, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 16664, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),
-- Dalaran - Dorian Fines (28728)
(23, 28728, 57401, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90035'),
(23, 28728, 57401, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90036'),
(23, 28728, 57401, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90037'),
(23, 28728, 57401, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90038'),
(23, 28728, 57401, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90039'),
(23, 28728, 57401, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90040'),
(23, 28728, 57401, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90041'),
(23, 28728, 57401, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick A - Quest 90042'),

-- ----------------------------------------
-- Master Mining Pick (57402)
-- Quests: 90043-90044 (2 faction variants)
-- ----------------------------------------
-- Stormwind - Brooke Stonebraid (5514)
(23, 5514, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 5514, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Ironforge - Golnir Bouldertoe (4256)
(23, 4256, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 4256, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Darnassus - Borin Irondelve (70)
(23, 70, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 70, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Exodar - Merran (16751)
(23, 16751, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 16751, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Orgrimmar - Gorina (3358)
(23, 3358, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 3358, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Thunder Bluff - Kurm Stonehoof (3002)
(23, 3002, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 3002, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Undercity - Sarah Killian (4599)
(23, 4599, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 4599, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Silvermoon - Zelan (16664)
(23, 16664, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 16664, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),
-- Dalaran - Dorian Fines (28728)
(23, 28728, 57402, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90043'),
(23, 28728, 57402, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick M - Quest 90044'),

-- ----------------------------------------
-- Grand Master Mining Pick (57403)
-- Quest: 90045 (1 quest, both factions)
-- ----------------------------------------
-- Stormwind - Brooke Stonebraid (5514)
(23, 5514, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Ironforge - Golnir Bouldertoe (4256)
(23, 4256, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Darnassus - Borin Irondelve (70)
(23, 70, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Exodar - Merran (16751)
(23, 16751, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Orgrimmar - Gorina (3358)
(23, 3358, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Thunder Bluff - Kurm Stonehoof (3002)
(23, 3002, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Undercity - Sarah Killian (4599)
(23, 4599, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Silvermoon - Zelan (16664)
(23, 16664, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045'),
-- Dalaran - Dorian Fines (28728)
(23, 28728, 57403, 0, 0, 8, 0, 90045, 0, 0, 0, 0, 0, '', 'F-001 Mining Pick GM - Quest 90045');
