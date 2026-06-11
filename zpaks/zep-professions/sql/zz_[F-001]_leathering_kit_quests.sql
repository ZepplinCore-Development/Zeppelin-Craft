-- =====================================================
-- LEATHERING KIT QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90065-90072) [ExclusiveGroup 90065]
-- Expert: 8 city quests (90073-90080) [ExclusiveGroup 90073]
-- Artisan: 8 city quests (90081-90088) [ExclusiveGroup 90081]
-- Master: 3 Outland quests (90089-90110) [ExclusiveGroup 90089]
-- Grand Master: 1 Dalaran quest (90090)
-- Total: 28 quests
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
    `QuestDescription` = '$GBrother:Sister;, I see you work without proper tools. The Earth Mother teaches that right tools create harmony with one''s craft. I have a Journeyman Leathering Kit - bring me 5 Cured Light Hides and 5 Light Armor Kits for my work, and I will trade it to you. Your hands will move swifter, your craft more true.$B$BRequired:$B- 5 Cured Light Hides$B- 5 Light Armor Kits',
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
-- EXPERT LEATHERING KIT QUESTS (150+ Leatherworking)
-- 5 Cured Medium Hide + 5 Medium Armor Kit
-- Reward: Expert Leathering Kit (57613)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90073: Stormwind (Simon Tanner - 5564)
-- -----------------------------------------------------
SET @quest := 90073;
SET @npc := 5564;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are growing, but that Journeyman kit is starting to slow you down. I''ve got an Expert Leathering Kit here. Trade in your old Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits for my client''s order, and the Expert kit is yours. You''ll cut your crafting time even further.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Simon Tanner in Stormwind',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect. My client will be pleased with these. Here''s your Expert kit - should serve you well into artisan levels.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Medium Hides and 5 Medium Armor Kits?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90074: Ironforge (Fimble Finespindle - 5127)
-- -----------------------------------------------------
SET @quest := 90074;
SET @npc := 5127;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Yer outgrowing that Journeyman kit, I see! Time fer an upgrade, aye? Trade in yer old kit and fetch me 5 Cured Medium Hides and 5 Medium Armor Kits fer me orders, and this Expert Kit is yers. Ye''ll be working twice as fast again.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality work! I''ll take that old Journeyman kit off yer hands. Here''s yer Expert kit - finely crafted, if I do say so meself!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those cured hides and armor kits and yer old Journeyman kit? 5 Cured Medium Hides, 5 Medium Armor Kits, and the old kit, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90075: Darnassus (Telonis - 4212)
-- -----------------------------------------------------
SET @quest := 90075;
SET @npc := 4212;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman tools have served their purpose, but you now need finer instruments. I have an Expert Leathering Kit available. Trade in your old Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits for my work, and the Expert kit is yours. Your hands will move swifter still.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Telonis in Darnassus',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These hides speak of your growing skill. I will accept your old Journeyman kit. May Elune guide your hands as this Expert kit serves you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cured hides and armor kits and your old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90076: Exodar (Akham - 16728)
-- -----------------------------------------------------
SET @quest := 90076;
SET @npc := 16728;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'I see your mastery grows. That Journeyman kit served its purpose, but you require expert-grade tools now. I have such a kit available. Trade in your old Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits to replenish my workshop, and I will trade it to you. Your efficiency will increase notably.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Akham in The Exodar',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines upon this exchange. I will accept your old Journeyman kit. These materials are well-selected. This Expert kit will aid your continued growth.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cured hides and armor kits and your old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90077: Orgrimmar (Karolek - 3365)
-- -----------------------------------------------------
SET @quest := 90077;
SET @npc := 3365;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Journeyman kit too slow now. You need Expert kit. Trade in old kit. 5 Cured Medium Hides, 5 Medium Armor Kits. Bring. Get better tools. Work faster.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Karolek in Orgrimmar',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good hides. Strong. Give old kit. Take Expert kit. Much better. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have cured hides and armor kits and old kit? 5 Cured Medium Hides, 5 Medium Armor Kits, old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90078: Thunder Bluff (Una - 3007)
-- -----------------------------------------------------
SET @quest := 90078;
SET @npc := 3007;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman tools have guided you well, but your growth calls for better instruments. I have an Expert Leathering Kit for you. Trade in your old Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits, and we shall trade. Your craft will flow more freely.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Una in Thunder Bluff',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this trade. Your old Journeyman kit has served its purpose well. You walk the path of the expert now. May this Expert kit serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and your old Journeyman kit, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90079: Undercity (Arthur Moore - 4588)
-- -----------------------------------------------------
SET @quest := 90079;
SET @npc := 4588;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Ah, still struggling with that Journeyman kit? How... limiting. I have an Expert Leathering Kit that requires a new home. Trade in that inadequate Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits, and your... sluggish... crafting pace will improve considerably.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Arthur Moore in Undercity',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate. I''ll dispose of that pitiful Journeyman kit for you. Here is your Expert kit - do try not to waste so much time with your work now.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and that old Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90080: Silvermoon (Lynalis - 16688)
-- -----------------------------------------------------
SET @quest := 90080;
SET @npc := 16688;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -182, -- Leatherworking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4233, -- Cured Medium Hide
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 2313, -- Medium Armor Kit
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect cured hides and armor kits to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'That Journeyman kit is beneath your growing skill level. How can you expect to produce expert-quality work with journeyman tools? I have an Expert Leathering Kit available. Relinquish that inferior Journeyman kit and bring me 5 Cured Medium Hides and 5 Medium Armor Kits - quality materials, please - and we shall trade. Your efficiency will improve markedly.$B$BRequired:$B- 5 Cured Medium Hides$B- 5 Medium Armor Kits',
    `QuestCompletionLog` = 'Return to Lynalis in Silvermoon City',
    `RewardItem1` = 57613,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90065, -- Requires Journeyman tier
    `ExclusiveGroup` = 90073;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality. I''ll take that inferior Journeyman kit off your hands. Here is your Expert kit - now perhaps your work will meet proper standards.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the cured hides and armor kits and that inferior Journeyman kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your Expert kit has served you well, but artisan-level work demands precision tools. I have an Artisan Leathering Kit available - trade in your old Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits for my current contracts, and the Artisan kit is yours. The quality difference will be immediately noticeable in your crafting speed.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Simon Tanner in Stormwind',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These rugged hides are top quality. I''ll take that Expert kit - it''s served its purpose. Here''s your Artisan kit - it should serve you all the way to master level.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 5 Cured Heavy Hides, 5 Thick Armor Kits, and your old Expert kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Time fer a proper upgrade, eh? Yer Expert kit''s served ye well, but artisan work needs artisan tools! Trade in yer old Expert kit and fetch me 5 Cured Heavy Hides and 5 Thick Armor Kits, and this Artisan Kit is yers. Ye''ll be working faster than ever! Dwarven craftsmanship at its finest.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Fimble Finespindle in Ironforge',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, these are proper rugged hides! I''ll take that Expert kit off yer hands. Here''s yer Artisan kit - finest tools this side o'' Ironforge!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those cured hides and armor kits and yer old Expert kit? 5 Cured Heavy Hides, 5 Thick Armor Kits, and the old kit, aye?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your mastery deepens, like roots growing ever deeper. The Expert tools have guided you well, but artisan-level work requires instruments of greater refinement. I have an Artisan Leathering Kit available. Trade in your old Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and the Artisan kit is yours. Your hands will move with the grace of wind through branches.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Telonis in Darnassus',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These hides speak of battles with formidable beasts. I will accept your old Expert kit. May Elune''s blessing flow through this Artisan kit as it serves you on your artisan''s path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the cured hides and armor kits and your old Expert kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your progression continues admirably. The Expert tools served their purpose, but you now approach artisan mastery. I have an Artisan Leathering Kit prepared. Trade in your old Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and I will trade it to you. The Light will guide your hands to even greater speed and precision.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Akham in The Exodar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light illuminates this exchange. I will accept your old Expert kit. These materials demonstrate your growing mastery. This Artisan kit will serve you well on your continued path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the cured hides and armor kits and your old Expert kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Need better tools. Artisan kit here. Trade in old Expert kit. 5 Cured Heavy Hides, 5 Thick Armor Kits. Bring. Get Artisan kit. Work much faster.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Karolek in Orgrimmar',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Tough hides. Strong beasts. Give old Expert kit. Take Artisan kit. Best tools. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have cured hides and armor kits and old Expert kit? 5 Cured Heavy Hides, 5 Thick Armor Kits, old kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your path winds ever upward, friend. The Expert tools served their time, but artisan mastery requires instruments blessed by greater wisdom. I have an Artisan Leathering Kit for you. Trade in your old Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits. In trade, your craft will flow like the wind across the plains.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Una in Thunder Bluff',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles upon this trade. Your old Expert kit has served its purpose well. These hides tell tales of worthy hunts. This Artisan kit will carry you far on your journey.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and your old Expert kit, friend?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still plodding along with Expert-grade tools? How... quaint. I suppose your work takes forever at that pace. I have an Artisan Leathering Kit available - trade in that inadequate Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits, and it''s yours. Your painfully slow crafting speed will become... somewhat less painful.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Arthur Moore in Undercity',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Passable quality, I suppose. I''ll dispose of that inferior Expert kit for you. Here''s your Artisan kit - do try to work with a bit more... urgency... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the cured hides and armor kits and that old Expert kit?';

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
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect cured hides and armor kits to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still using Expert-grade tools for artisan-level work? How do you expect to maintain proper standards with such inferior equipment? I have an Artisan Leathering Kit available. Relinquish that inferior Expert kit and bring me 5 Cured Heavy Hides and 5 Thick Armor Kits - quality materials, please - and we shall trade. Your efficiency will improve to something approaching acceptable.$B$BRequired:$B- 5 Cured Heavy Hides$B- 5 Thick Armor Kits',
    `QuestCompletionLog` = 'Return to Lynalis in Silvermoon City',
    `RewardItem1` = 57614,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 165, -- Leatherworking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90073, -- Requires Expert tier
    `ExclusiveGroup` = 90081;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate, I suppose. I''ll take that inferior Expert kit off your hands. Here is your Artisan kit - now do try to produce work that reflects some measure of skill.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the cured hides and armor kits and that inferior Expert kit?';

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
    `LogDescription` = 'Bring 5 Cured Rugged Hides, 5 Heavy Knothide Armor Kits and your Artisan Leathering Kit to Darmari in Shattrath''s Lower City.',
    `QuestDescription` = 'Everything the Lower City owns was carried here on someone''s back and mended ten times over - we know leatherwork. Outland hide is thick and ill-tempered, and a slow kit means cold shoulders come nightfall. Bring me cured hides and armor kits for the refugees, trade in your Artisan kit, and take a Master kit that works as fast as need demands.$B$BRequired:$B- 5 Cured Rugged Hide$B- 5 Heavy Knothide Armor Kit$B- Artisan Leathering Kit',
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
-- Quest 90109: Honor Hold Alliance (Brumman - 18771)
-- [I-195] NPC IDs were swapped: 18754 is Barim Spilthoof (Thrallmar), 18771 is Brumman (Honor Hold)
-- -----------------------------------------------------
SET @quest := 90109;
SET @npc := 18771;

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
    `LogDescription` = 'Bring 5 Cured Rugged Hides, 5 Heavy Knothide Armor Kits and your Artisan Leathering Kit to Brumman at Honor Hold in Hellfire Peninsula.',
    `QuestDescription` = 'Half the armor in this keep came oot o'' my workshop, and the other half''s waitin'' on repairs. Knothide''s thick as boot soles - a dull kit''ll have ye sawin'' till sundown. Bring me cured hides and armor kits fer the garrison, hand over yer Artisan kit, and I''ll give ye a Master kit that cuts clean the first time, every time.$B$BRequired:$B- 5 Cured Rugged Hide$B- 5 Heavy Knothide Armor Kit$B- Artisan Leathering Kit',
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
-- Quest 90110: Thrallmar Horde (Barim Spilthoof - 18754)
-- -----------------------------------------------------
SET @quest := 90110;
SET @npc := 18754;

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
    `LogDescription` = 'Bring 5 Cured Rugged Hides, 5 Heavy Knothide Armor Kits and your Artisan Leathering Kit to Barim Spilthoof at Thrallmar in Hellfire Peninsula.',
    `QuestDescription` = 'The beasts of this land give heavy hides, $Gbrother:sister;, and heavy hides deserve a worthy hand. A craftsman who fights his own tools honors no one. Bring me cured hides and armor kits for Thrallmar''s warriors, and trade me your Artisan kit. The Master kit will let your hands work as fast as your heart.$B$BRequired:$B- 5 Cured Rugged Hide$B- 5 Heavy Knothide Armor Kit$B- Artisan Leathering Kit',
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
    `LogDescription` = 'Bring 5 Heavy Borean Leather, 5 Heavy Borean Armor Kits and your Master Leathering Kit to Diane Cannings in Dalaran.',
    `QuestDescription` = 'Borean leather doesn''t forgive. It''s dense, it''s cold-cured, and a kit that hesitates leaves scars across the grain. Mine don''t hesitate. Bring me Borean leather and armor kits so I know your work, trade in the Master kit, and I''ll hand you a Grand Master kit - the same one Dalaran''s armorers swear by.$B$BRequired:$B- 5 Heavy Borean Leather$B- 5 Heavy Borean Armor Kit$B- Master Leathering Kit',
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
    WHERE `ID` BETWEEN 90073 AND 90090 OR `ID` IN (90109, 90110);

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

-- Reference condition -90073: completed ANY Expert kit quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90073;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90073, 0, 0, 0, 0, 8, 0, 90073, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Stormwind)'),
(-90073, 0, 0, 0, 1, 8, 0, 90074, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Ironforge)'),
(-90073, 0, 0, 0, 2, 8, 0, 90075, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Darnassus)'),
(-90073, 0, 0, 0, 3, 8, 0, 90076, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Exodar)'),
(-90073, 0, 0, 0, 4, 8, 0, 90077, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Orgrimmar)'),
(-90073, 0, 0, 0, 5, 8, 0, 90078, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Thunder Bluff)'),
(-90073, 0, 0, 0, 6, 8, 0, 90079, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Undercity)'),
(-90073, 0, 0, 0, 7, 8, 0, 90080, 0, 0, 0, 0, 0, '', 'Expert kit rewarded (Silvermoon)');

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

-- Expert quests: require any Journeyman kit
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90073 AND 90080;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90073, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (SW) - any JM kit'),
(19, 0, 90074, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (IF) - any JM kit'),
(19, 0, 90075, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (Darn) - any JM kit'),
(19, 0, 90076, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (Exo) - any JM kit'),
(19, 0, 90077, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (Org) - any JM kit'),
(19, 0, 90078, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (TB) - any JM kit'),
(19, 0, 90079, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (UC) - any JM kit'),
(19, 0, 90080, 0, 0, -90065, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Kit (SM) - any JM kit');

-- Artisan quests: require any Expert kit
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90081 AND 90088;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90081, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (SW) - any Expert kit'),
(19, 0, 90082, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (IF) - any Expert kit'),
(19, 0, 90083, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Darn) - any Expert kit'),
(19, 0, 90084, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Exo) - any Expert kit'),
(19, 0, 90085, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (Org) - any Expert kit'),
(19, 0, 90086, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (TB) - any Expert kit'),
(19, 0, 90087, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (UC) - any Expert kit'),
(19, 0, 90088, 0, 0, -90073, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Kit (SM) - any Expert kit');

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

-- =====================================================
-- QUEST POIs - turn-in map markers [I-195]
-- One blob per quest at the quest ender (trainer) spawn
-- =====================================================
DELETE FROM `quest_poi` WHERE `QuestID` IN (90065,90066,90067,90068,90069,90070,90071,90072,90073,90074,90075,90076,90077,90078,90079,90080,90081,90082,90083,90084,90085,90086,90087,90088,90089,90090,90109,90110);
DELETE FROM `quest_poi_points` WHERE `QuestID` IN (90065,90066,90067,90068,90069,90070,90071,90072,90073,90074,90075,90076,90077,90078,90079,90080,90081,90082,90083,90084,90085,90086,90087,90088,90089,90090,90109,90110);

INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
(90065, 0, -1, 0, 301, 0, 0, 1, 0),
(90066, 0, -1, 0, 341, 0, 0, 1, 0),
(90067, 0, -1, 1, 381, 0, 0, 1, 0),
(90068, 0, -1, 1, 471, 0, 0, 1, 0),
(90069, 0, -1, 1, 321, 0, 0, 1, 0),
(90070, 0, -1, 1, 362, 0, 0, 1, 0),
(90071, 0, -1, 0, 382, 0, 0, 1, 0),
(90072, 0, -1, 0, 480, 0, 0, 1, 0),
(90073, 0, -1, 0, 301, 0, 0, 1, 0),
(90074, 0, -1, 0, 341, 0, 0, 1, 0),
(90075, 0, -1, 1, 381, 0, 0, 1, 0),
(90076, 0, -1, 1, 471, 0, 0, 1, 0),
(90077, 0, -1, 1, 321, 0, 0, 1, 0),
(90078, 0, -1, 1, 362, 0, 0, 1, 0),
(90079, 0, -1, 0, 382, 0, 0, 1, 0),
(90080, 0, -1, 0, 480, 0, 0, 1, 0),
(90081, 0, -1, 0, 301, 0, 0, 1, 0),
(90082, 0, -1, 0, 341, 0, 0, 1, 0),
(90083, 0, -1, 1, 381, 0, 0, 1, 0),
(90084, 0, -1, 1, 471, 0, 0, 1, 0),
(90085, 0, -1, 1, 321, 0, 0, 1, 0),
(90086, 0, -1, 1, 362, 0, 0, 1, 0),
(90087, 0, -1, 0, 382, 0, 0, 1, 0),
(90088, 0, -1, 0, 480, 0, 0, 1, 0),
(90089, 0, -1, 530, 481, 0, 0, 1, 0),
(90090, 0, -1, 571, 510, 0, 0, 1, 0),
(90090, 1, -1, 571, 504, 1, 0, 3, 0),
(90109, 0, -1, 530, 465, 0, 0, 1, 0),
(90110, 0, -1, 530, 465, 0, 0, 1, 0);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(90065, 0, 0, -8746, 457, 0),
(90065, 0, 1, -8746, 497, 0),
(90065, 0, 2, -8706, 497, 0),
(90065, 0, 3, -8706, 457, 0),
(90066, 0, 0, -4767, -1052, 0),
(90066, 0, 1, -4767, -1012, 0),
(90066, 0, 2, -4727, -1012, 0),
(90066, 0, 3, -4727, -1052, 0),
(90067, 0, 0, 10066, 2236, 0),
(90067, 0, 1, 10066, 2276, 0),
(90067, 0, 2, 10106, 2276, 0),
(90067, 0, 3, 10106, 2236, 0),
(90068, 0, 0, 5445, 6334, 0),
(90068, 0, 1, 5445, 6374, 0),
(90068, 0, 2, 5485, 6374, 0),
(90068, 0, 3, 5485, 6334, 0),
(90069, 0, 0, 1841, -4582, 0),
(90069, 0, 1, 1841, -4542, 0),
(90069, 0, 2, 1881, -4542, 0),
(90069, 0, 3, 1881, -4582, 0),
(90070, 0, 0, -1166, 63, 0),
(90070, 0, 1, -1166, 103, 0),
(90070, 0, 2, -1126, 103, 0),
(90070, 0, 3, -1126, 63, 0),
(90071, 0, 0, 1490, 180, 0),
(90071, 0, 1, 1490, 220, 0),
(90071, 0, 2, 1530, 220, 0),
(90071, 0, 3, 1530, 180, 0),
(90072, 0, 0, 7350, -5318, 0),
(90072, 0, 1, 7350, -5278, 0),
(90072, 0, 2, 7390, -5278, 0),
(90072, 0, 3, 7390, -5318, 0),
(90073, 0, 0, -8746, 457, 0),
(90073, 0, 1, -8746, 497, 0),
(90073, 0, 2, -8706, 497, 0),
(90073, 0, 3, -8706, 457, 0),
(90074, 0, 0, -4767, -1052, 0),
(90074, 0, 1, -4767, -1012, 0),
(90074, 0, 2, -4727, -1012, 0),
(90074, 0, 3, -4727, -1052, 0),
(90075, 0, 0, 10066, 2236, 0),
(90075, 0, 1, 10066, 2276, 0),
(90075, 0, 2, 10106, 2276, 0),
(90075, 0, 3, 10106, 2236, 0),
(90076, 0, 0, 5445, 6334, 0),
(90076, 0, 1, 5445, 6374, 0),
(90076, 0, 2, 5485, 6374, 0),
(90076, 0, 3, 5485, 6334, 0),
(90077, 0, 0, 1841, -4582, 0),
(90077, 0, 1, 1841, -4542, 0),
(90077, 0, 2, 1881, -4542, 0),
(90077, 0, 3, 1881, -4582, 0),
(90078, 0, 0, -1166, 63, 0),
(90078, 0, 1, -1166, 103, 0),
(90078, 0, 2, -1126, 103, 0),
(90078, 0, 3, -1126, 63, 0),
(90079, 0, 0, 1490, 180, 0),
(90079, 0, 1, 1490, 220, 0),
(90079, 0, 2, 1530, 220, 0),
(90079, 0, 3, 1530, 180, 0),
(90080, 0, 0, 7350, -5318, 0),
(90080, 0, 1, 7350, -5278, 0),
(90080, 0, 2, 7390, -5278, 0),
(90080, 0, 3, 7390, -5318, 0),
(90081, 0, 0, -8746, 457, 0),
(90081, 0, 1, -8746, 497, 0),
(90081, 0, 2, -8706, 497, 0),
(90081, 0, 3, -8706, 457, 0),
(90082, 0, 0, -4767, -1052, 0),
(90082, 0, 1, -4767, -1012, 0),
(90082, 0, 2, -4727, -1012, 0),
(90082, 0, 3, -4727, -1052, 0),
(90083, 0, 0, 10066, 2236, 0),
(90083, 0, 1, 10066, 2276, 0),
(90083, 0, 2, 10106, 2276, 0),
(90083, 0, 3, 10106, 2236, 0),
(90084, 0, 0, 5445, 6334, 0),
(90084, 0, 1, 5445, 6374, 0),
(90084, 0, 2, 5485, 6374, 0),
(90084, 0, 3, 5485, 6334, 0),
(90085, 0, 0, 1841, -4582, 0),
(90085, 0, 1, 1841, -4542, 0),
(90085, 0, 2, 1881, -4542, 0),
(90085, 0, 3, 1881, -4582, 0),
(90086, 0, 0, -1166, 63, 0),
(90086, 0, 1, -1166, 103, 0),
(90086, 0, 2, -1126, 103, 0),
(90086, 0, 3, -1126, 63, 0),
(90087, 0, 0, 1490, 180, 0),
(90087, 0, 1, 1490, 220, 0),
(90087, 0, 2, 1530, 220, 0),
(90087, 0, 3, 1530, 180, 0),
(90088, 0, 0, 7350, -5318, 0),
(90088, 0, 1, 7350, -5278, 0),
(90088, 0, 2, 7390, -5278, 0),
(90088, 0, 3, 7390, -5318, 0),
(90089, 0, 0, -2081, 5237, 0),
(90089, 0, 1, -2081, 5277, 0),
(90089, 0, 2, -2041, 5277, 0),
(90089, 0, 3, -2041, 5237, 0),
(90090, 0, 0, 5888, 744, 0),
(90090, 0, 1, 5888, 784, 0),
(90090, 0, 2, 5928, 784, 0),
(90090, 0, 3, 5928, 744, 0),
(90090, 1, 0, 5888, 744, 0),
(90090, 1, 1, 5888, 784, 0),
(90090, 1, 2, 5928, 784, 0),
(90090, 1, 3, 5928, 744, 0),
(90109, 0, 0, -742, 2725, 0),
(90109, 0, 1, -742, 2765, 0),
(90109, 0, 2, -702, 2765, 0),
(90109, 0, 3, -702, 2725, 0),
(90110, 0, 0, 129, 2616, 0),
(90110, 0, 1, 129, 2656, 0),
(90110, 0, 2, 169, 2656, 0),
(90110, 0, 3, 169, 2616, 0);
