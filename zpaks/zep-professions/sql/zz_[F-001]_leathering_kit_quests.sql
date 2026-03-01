-- =====================================================
-- LEATHERING KIT QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90065-90072) [ExclusiveGroup 90065]
-- Artisan: 8 city quests (90081-90088) [ExclusiveGroup 90081]
-- Master: 3 Outland quests (90089-90110) [ExclusiveGroup 90089]
-- Grand Master: 1 Dalaran quest (90090)
-- Total: 20 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive cured hide + armor kit requirements matching skill tiers
-- - Turn-in: 5 cured hides + 5 armor kits per tier
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90065 AND 90090 OR `ID` IN (90109, 90110);
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90065 AND 90090 OR `ID` IN (90109, 90110);
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90065 AND 90090 OR `ID` IN (90109, 90110);
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90065 AND 90090 OR `ID` IN (90109, 90110);
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90065 AND 90090 OR `quest` IN (90109, 90110);
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90065 AND 90090 OR `quest` IN (90109, 90110);

-- ===================
-- ADD QUESTGIVER FLAG TO TRAINERS
-- ===================
-- Some Alliance trainers + Outland/Northrend trainers missing QUESTGIVER (2) flag
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` IN (
    5564,  -- Simon Tanner (Stormwind)
    5127,  -- Fimble Finespindle (Ironforge)
    16688, -- Lynalis (Silvermoon)
    16728, -- Akham (Exodar)
    19187, -- Darmari (Shattrath)
    28700  -- Diane Cannings (Dalaran)
) AND (`npcflag` & 2) = 0; -- Only if not already set

-- =====================================================
-- JOURNEYMAN LEATHERING KIT QUESTS (75+ Leatherworking)
-- 5 Cured Light Hide + 5 Light Armor Kit
-- Reward: Journeyman Leathering Kit (57612)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90065: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90065;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools? I can see why your leatherwork takes so long. I''ve got a Journeyman Leathering Kit available - bring me 5 Cured Light Hides and 5 Light Armor Kits to fill my current order, and it''s yours. Should speed up your crafting considerably.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Simon Tanner in Stormwind',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality leather. Here''s your kit - treat it well and it''ll serve you for years.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Light Hides and 5 Light Armor Kits?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90066: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90066;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Bah! Still using those shabby tools, are ye? No wonder yer work takes all day! I''ve got a proper Journeyman Kit here - fetch me 5 Cured Light Hides and 5 Light Armor Kits for me stock, and I''ll trade ye fer it. Yer crafting''ll be twice as fast, I guarantee it.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good, sturdy hides these! Here ye go - this kit''ll last ye till expert level, mark me words!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those cured hides and armor kits? 5 Cured Light Hides and 5 Light Armor Kits, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90067: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90067;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'I see you work without proper tools. A skilled artisan deserves better instruments. I have a Journeyman Leathering Kit available for trade. If you can supply me with 5 Cured Light Hides and 5 Light Armor Kits for my current projects, it is yours. Your work will flow much faster, like water through leaves.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Telonis in Darnassus',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Elune''s blessings upon you. These hides are well-treated. This kit will serve you well on your journey.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cured hides and armor kits I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90068: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90068;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'I observe you work without refined tools. Your skill grows, but proper instruments would serve you better. I have a Journeyman Leathering Kit - if you bring me 5 Cured Light Hides and 5 Light Armor Kits to replenish my supplies, I will trade it to you. Your crafting will become significantly swifter.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Akham in The Exodar',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light be with you. These materials are well-chosen. May this kit aid you in mastering your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cured hides and armor kits I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90069: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90069;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Your tools are weak. Your crafting is slow. I have Journeyman Kit here. 5 Cured Light Hides, 5 Light Armor Kits. Bring them, kit is yours. You work faster. Simple trade.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Karolek in Orgrimmar',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Strong hides. Take kit. Work faster now. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have cured hides? 5 Cured Light Hides and 5 Light Armor Kits?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90070: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90070;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Brother/Sister, I see you work without proper tools. The Earth Mother teaches that right tools create harmony with one''s craft. I have a Journeyman Leathering Kit - bring me 5 Cured Light Hides and 5 Light Armor Kits for my work, and I will trade it to you. Your hands will move swifter, your craft more true.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Una in Thunder Bluff',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother blesses this exchange. You have honored the beasts who gave these hides. May this kit serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90071: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90071;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still slaving away with inadequate tools? How... inefficient. I have a Journeyman Leathering Kit gathering dust here. Bring me 5 Cured Light Hides and 5 Light Armor Kits to replenish my stock, and I''ll part with it. Your tedious crafting will become considerably less... tedious.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Arthur Moore in Undercity',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality. Here''s your kit - may it serve you better than those pitiful tools you''ve been using.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90072: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90072;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4231, -- Cured Light Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2304, -- Light Armor Kit
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect cured hides and armor kits to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Working with such... primitive tools? How do you expect to create anything of quality? I have a Journeyman Leathering Kit available. Bring me 5 Cured Light Hides and 5 Light Armor Kits - proper materials, mind you - and I''ll trade it to you. Your crafting speed will improve dramatically.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
    `QuestCompletionLog` = 'Return to Lynalis in Silvermoon City',
    `RewardItem1` = 57612,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90065;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate materials, I suppose. Here is your kit - do try to maintain some standards with your work from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the cured hides and armor kits I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN LEATHERING KIT QUESTS (225+ Leatherworking)
-- 5 Cured Heavy Hide + 5 Thick Armor Kit
-- Reward: Artisan Leathering Kit (57614)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90081: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90081;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your Journeyman kit has served you well, but artisan-level work demands precision tools. I have an Artisan Leathering Kit available - trade in your old Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits for my current contracts, and the Artisan kit is yours. The quality difference will be immediately noticeable in your crafting speed.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Simon Tanner in Stormwind',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These rugged hides are top quality. I''ll take that Journeyman kit - it''s served its purpose. Here''s your Artisan kit - it should serve you all the way to master level.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Heavy Hides, 5 Thick Armor Kits, and your old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90082: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90082;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Time fer a proper upgrade, eh? Yer Journeyman kit''s served ye well, but artisan work needs artisan tools! Trade in yer old Journeyman kit and fetch me 5 Cured Heavy Hides and 5 Thick Armor Kits, and this Artisan Kit is yers. Ye''ll be working faster than ever! Dwarven craftsmanship at its finest.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, these are proper rugged hides! I''ll take that Journeyman kit off yer hands. Here''s yer Artisan kit - finest tools this side o'' Ironforge!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those cured hides and armor kits and yer old Journeyman kit? 5 Cured Heavy Hides, 5 Thick Armor Kits, and the old kit, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90083: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90083;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your mastery deepens, like roots growing ever deeper. The Journeyman tools have guided you well, but artisan-level work requires instruments of greater refinement. I have an Artisan Leathering Kit available. Trade in your old Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and the Artisan kit is yours. Your hands will move with the grace of wind through branches.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Telonis in Darnassus',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These hides speak of battles with formidable beasts. I will accept your old Journeyman kit. May Elune''s blessing flow through this Artisan kit as it serves you on your artisan''s path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cured hides and armor kits and your old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90084: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90084;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your progression continues admirably. The Journeyman tools served their purpose, but you now approach artisan mastery. I have an Artisan Leathering Kit prepared. Trade in your old Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and I will trade it to you. The Light will guide your hands to even greater speed and precision.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Akham in The Exodar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light illuminates this exchange. I will accept your old Journeyman kit. These materials demonstrate your growing mastery. This Artisan kit will serve you well on your continued path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cured hides and armor kits and your old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90085: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90085;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Need better tools. Artisan kit here. Trade in old Journeyman kit. 5 Cured Heavy Hides, 5 Thick Armor Kits. Bring. Get Artisan kit. Work much faster.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Karolek in Orgrimmar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Tough hides. Strong beasts. Give old Journeyman kit. Take Artisan kit. Best tools. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have cured hides and armor kits and old Journeyman kit? 5 Cured Heavy Hides, 5 Thick Armor Kits, old kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90086: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90086;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your path winds ever upward, friend. The Journeyman tools served their time, but artisan mastery requires instruments blessed by greater wisdom. I have an Artisan Leathering Kit for you. Trade in your old Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits. In trade, your craft will flow like the wind across the plains.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Una in Thunder Bluff',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles upon this trade. Your old Journeyman kit has served its purpose well. These hides tell tales of worthy hunts. This Artisan kit will carry you far on your journey.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and your old Journeyman kit, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90087: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90087;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still plodding along with Journeyman-grade tools? How... quaint. I suppose your work takes forever at that pace. I have an Artisan Leathering Kit available - trade in that inadequate Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and it''s yours. Your painfully slow crafting speed will become... somewhat less painful.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Arthur Moore in Undercity',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Passable quality, I suppose. I''ll dispose of that inferior Journeyman kit for you. Here''s your Artisan kit - do try to work with a bit more... urgency... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and that old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90088: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90088;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4236, -- Cured Heavy Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 8173, -- Thick Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still using Journeyman-grade tools for artisan-level work? How do you expect to maintain proper standards with such inferior equipment? I have an Artisan Leathering Kit available. Relinquish that inferior Journeyman kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits - quality materials, please - and we shall trade. Your efficiency will improve to something approaching acceptable.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Lynalis in Silvermoon City',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate, I suppose. I''ll take that inferior Journeyman kit off your hands. Here is your Artisan kit - now do try to produce work that reflects some measure of skill.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the cured hides and armor kits and that inferior Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER LEATHERING KIT QUEST (300+ Leatherworking)
-- 5 Cured Rugged Hide + 5 Knothide Armor Kit
-- Reward: Master Leathering Kit (57615)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90089: Shattrath (Darmari - 19187)
-- -----------------------------------------------------
SET @quest := 90089;
SET @npc := 19187;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 15407, -- Cured Rugged Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 34330, -- Knothide Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect cured hides and armor kits to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Welcome to Outland, leatherworker. The hides here are tougher than anything from Azeroth - your Artisan kit will struggle with them. I have a Master Leathering Kit designed for Outland materials. Trade in your old Artisan kit and bring me 5 Cured Rugged Hides and 5 Knothide Armor Kits, and the Master kit is yours. You''ll need the speed advantage for the challenges ahead.$B$BRequired:$B- 5 Cured Rugged Hides$B- 5 Knothide Armor Kits',
    `QuestCompletionLog` = 'Return to Darmari in Shattrath City',
    `RewardItem1` = 57615,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90081, -- Requires Artisan tier
    `ExclusiveGroup` = 90089;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality knothide. I''ll take that Artisan kit - it served its purpose. This Master kit is built for Outland''s harsh conditions - it will serve you well through your time here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Rugged Hides, 5 Knothide Armor Kits, and your old Artisan kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90109: Honor Hold Alliance (Brumman - 18754)
-- -----------------------------------------------------
SET @quest := 90109;
SET @npc := 18754;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 15407, -- Cured Rugged Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 34330, -- Knothide Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect cured hides and armor kits to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Welcome to Outland, leatherworker. The hides here are tougher than anything from Azeroth - your Artisan kit will struggle with them. I have a Master Leathering Kit designed for Outland materials. Trade in your old Artisan kit and bring me 5 Cured Rugged Hides and 5 Knothide Armor Kits, and the Master kit is yours. You''ll need the speed advantage - these tough hides require precision cutting, and a sharp blade makes all the difference.$B$BRequired:$B- 5 Cured Rugged Hides$B- 5 Knothide Armor Kits',
    `QuestCompletionLog` = 'Return to Brumman in Honor Hold',
    `RewardItem1` = 57615,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90081, -- Requires Artisan tier
    `ExclusiveGroup` = 90089;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality knothide. I''ll take that Artisan kit - it served its purpose. This Master kit is built for Outland''s harsh conditions - it will serve you well through your time here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Rugged Hides, 5 Knothide Armor Kits, and your old Artisan kit?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90110: Thrallmar Horde (Barim Spilthoof - 18771)
-- -----------------------------------------------------
SET @quest := 90110;
SET @npc := 18771;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 15407, -- Cured Rugged Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 34330, -- Knothide Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect cured hides and armor kits to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Brother/Sister, you''ve arrived in Outland. The beasts here have hides twice as thick as Azeroth''s - your Artisan kit struggles to cut clean. I have Master Leathering Kits forged for these harsh lands. Trade in your old Artisan kit and bring me 5 Cured Rugged Hides and 5 Knothide Armor Kits, and the Master kit is yours. Faster cutting, cleaner work - you''ll need every advantage here.$B$BRequired:$B- 5 Cured Rugged Hides$B- 5 Knothide Armor Kits',
    `QuestCompletionLog` = 'Return to Barim Spilthoof in Thrallmar',
    `RewardItem1` = 57615,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90081, -- Requires Artisan tier
    `ExclusiveGroup` = 90089;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Strong knothide, well-treated. I''ll take that Artisan kit. This Master kit is made for Outland - sharp blades, solid construction. It will cut through these thick hides with ease.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the cured hides and armor kits and your old Artisan kit, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER LEATHERING KIT QUEST (375+ Leatherworking)
-- 5 Heavy Borean Leather + 5 Borean Armor Kit
-- Reward: Grand Master Leathering Kit (57616)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90090: Dalaran (Diane Cannings - 28700)
-- -----------------------------------------------------
SET @quest := 90090;
SET @npc := 28700;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 38425, -- Heavy Borean Leather
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38376, -- Borean Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57615, -- Master Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Tools',
    `LogDescription` = 'Trade in your Master kit and collect cured hides and armor kits to exchange for a Grand Master Leathering Kit',
    `QuestDescription` = 'Northrend presents new challenges for even master leatherworkers. The arctic hides here are thicker and more resistant than Outland materials - your Master kit will feel sluggish. I have a Grand Master Leathering Kit, the finest tools available. Trade in your old Master kit and bring me 5 Heavy Borean Leather and 5 Borean Armor Kits from Northrend''s beasts, and the Grand Master kit is yours. You''ll need every advantage the kit provides for grand master-level work.$B$BRequired:$B- 5 Heavy Borean Leather$B- 5 Borean Armor Kits',
    `QuestCompletionLog` = 'Return to Diane Cannings in Dalaran',
    `RewardItem1` = 57616,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90089; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality borean leather. I''ll take that Master kit - you''ve outgrown it. This Grand Master kit represents the pinnacle of leatherworking tools - there are none finer. Use it well in your grand master endeavors.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Heavy Borean Leather, 5 Borean Armor Kits, and your old Master kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Replace with reference conditions so
-- completing ANY city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90081 AND 90090 OR `ID` IN (90109, 90110);

-- Reference condition -90065: completed ANY Journeyman kit quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90065;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90065, 0, 0, 0, 0, 8, 0, 90065, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Stormwind)'),
(-90065, 0, 0, 0, 1, 8, 0, 90066, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Ironforge)'),
(-90065, 0, 0, 0, 2, 8, 0, 90067, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Darnassus)'),
(-90065, 0, 0, 0, 3, 8, 0, 90068, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Exodar)'),
(-90065, 0, 0, 0, 4, 8, 0, 90069, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Orgrimmar)'),
(-90065, 0, 0, 0, 5, 8, 0, 90070, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Thunder Bluff)'),
(-90065, 0, 0, 0, 6, 8, 0, 90071, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Undercity)'),
(-90065, 0, 0, 0, 7, 8, 0, 90072, 0, 0, 0, 0, 0, '', 'JM kit rewarded (Silvermoon)');

-- Reference condition -90081: completed ANY Artisan kit quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90081;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90081, 0, 0, 0, 0, 8, 0, 90081, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Stormwind)'),
(-90081, 0, 0, 0, 1, 8, 0, 90082, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Ironforge)'),
(-90081, 0, 0, 0, 2, 8, 0, 90083, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Darnassus)'),
(-90081, 0, 0, 0, 3, 8, 0, 90084, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Exodar)'),
(-90081, 0, 0, 0, 4, 8, 0, 90085, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Orgrimmar)'),
(-90081, 0, 0, 0, 5, 8, 0, 90086, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Thunder Bluff)'),
(-90081, 0, 0, 0, 6, 8, 0, 90087, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Undercity)'),
(-90081, 0, 0, 0, 7, 8, 0, 90088, 0, 0, 0, 0, 0, '', 'Artisan kit rewarded (Silvermoon)');

-- Reference condition -90089: completed ANY Master kit quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90089;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90089, 0, 0, 0, 0, 8, 0, 90089, 0, 0, 0, 0, 0, '', 'Master kit rewarded (Shattrath)'),
(-90089, 0, 0, 0, 1, 8, 0, 90109, 0, 0, 0, 0, 0, '', 'Master kit rewarded (Honor Hold)'),
(-90089, 0, 0, 0, 2, 8, 0, 90110, 0, 0, 0, 0, 0, '', 'Master kit rewarded (Thrallmar)');

-- Artisan quests: require any Journeyman kit
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90081 AND 90088;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90081, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (SW) - any JM kit'),
(19, 0, 90082, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (IF) - any JM kit'),
(19, 0, 90083, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Darn) - any JM kit'),
(19, 0, 90084, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Exo) - any JM kit'),
(19, 0, 90085, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Org) - any JM kit'),
(19, 0, 90086, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (TB) - any JM kit'),
(19, 0, 90087, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (UC) - any JM kit'),
(19, 0, 90088, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (SM) - any JM kit');

-- Master quests: require any Artisan kit
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90089, 90109, 90110);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90089, 0, 0, -90081, 0, 0, 0, 0, 0, 0, 0, '', 'Master Kit (Shat) - any Artisan kit'),
(19, 0, 90109, 0, 0, -90081, 0, 0, 0, 0, 0, 0, 0, '', 'Master Kit (HH) - any Artisan kit'),
(19, 0, 90110, 0, 0, -90081, 0, 0, 0, 0, 0, 0, 0, '', 'Master Kit (Thrall) - any Artisan kit');

-- Grand Master quest: require any Master kit
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90090;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90090, 0, 0, -90089, 0, 0, 0, 0, 0, 0, 0, '', 'GM Kit (Dalaran) - any Master kit');
