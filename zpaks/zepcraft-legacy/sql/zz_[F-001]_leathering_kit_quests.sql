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
-- - Progressive leather requirements matching skill tiers
-- - Turn-in: 20 leather + 5 hides per tier
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90065 AND 90110;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90065 AND 90110;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90065 AND 90110;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90065 AND 90110;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90065 AND 90110;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90065 AND 90110;

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
-- 20 Medium Leather + 5 Medium Hide
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
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still working with basic tools? I can see why your leatherwork takes so long. I''ve got a Journeyman Leathering Kit available - bring me **20 Medium Leather and 5 Medium Hides** to fill my current order, and it''s yours. Should speed up your crafting considerably.',
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
    `CompletionText` = 'Did you bring the 20 Medium Leather and 5 Medium Hides?';

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
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Bah! Still using those shabby tools, are ye? No wonder yer work takes all day! I''ve got a proper Journeyman Kit here - fetch me **20 Medium Leather and 5 Medium Hides** for me stock, and I''ll trade ye fer it. Yer crafting''ll be twice as fast, I guarantee it!',
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
    `CompletionText` = 'Got those hides? 20 Medium Leather and 5 Medium Hides, aye?';

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
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'I see you work without proper tools. A skilled artisan deserves better instruments. I have a Journeyman Leathering Kit available for trade. If you can supply me with **20 Medium Leather and 5 Medium Hides** for my current projects, it is yours. Your work will flow much faster, like water through leaves.',
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
    `CompletionText` = 'Have you gathered the leather and hides I require?';

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
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'I observe you work without refined tools. Your skill grows, but proper instruments would serve you better. I have a Journeyman Leathering Kit - if you bring me **20 Medium Leather and 5 Medium Hides** to replenish my supplies, I will trade it to you. Your crafting will become significantly swifter.',
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
    `CompletionText` = 'Have you brought the materials I require?';

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
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Your tools are weak. Your crafting is slow. I have Journeyman Kit here. **20 Medium Leather, 5 Medium Hides**. Bring them, kit is yours. You work faster. Simple trade.',
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
    `CompletionText` = 'You have leather? 20 Medium Leather and 5 Hides?';

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
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Brother/Sister, I see you work without proper tools. The Earth Mother teaches that right tools create harmony with one''s craft. I have a Journeyman Leathering Kit - bring me **20 Medium Leather and 5 Medium Hides** for my work, and I will trade it to you. Your hands will move swifter, your craft more true.',
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
    `CompletionText` = 'Do you have the leather and hides, friend?';

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
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Still slaving away with inadequate tools? How... inefficient. I have a Journeyman Leathering Kit gathering dust here. Bring me **20 Medium Leather and 5 Medium Hides** to replenish my stock, and I''ll part with it. Your tedious crafting will become considerably less... tedious.',
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
    `CompletionText` = 'Do you have the leather I require?';

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
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2319, -- Medium Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4232, -- Medium Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Leatherworker''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Leathering Kit',
    `QuestDescription` = 'Working with such... primitive tools? How do you expect to create anything of quality? I have a Journeyman Leathering Kit available. Bring me **20 Medium Leather and 5 Medium Hides** - proper materials, mind you - and I''ll trade it to you. Your crafting speed will improve dramatically.',
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
    `CompletionText` = 'Have you acquired the leather and hides I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- EXPERT LEATHERING KIT QUESTS (150+ Leatherworking)
-- 20 Heavy Leather + 5 Heavy Hide
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
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your skills are growing, but that Journeyman kit is starting to slow you down. I''ve got an Expert Leathering Kit here. Trade in your old Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides** for my client''s order, and the Expert kit is yours. You''ll cut your crafting time even further.',
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
    `CompletionText` = 'Did you bring the 20 Heavy Leather and 5 Heavy Hides?';

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
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Yer outgrowing that Journeyman kit, I see! Time fer an upgrade, aye? Trade in yer old kit and fetch me **20 Heavy Leather and 5 Heavy Hides** fer me orders, and this Expert Kit is yers. Ye''ll be working twice as fast again!',
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
    `CompletionText` = 'Got that heavy leather and yer old Journeyman kit? 20 leather, 5 hides, and the old kit, aye?';

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
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman tools have served their purpose, but you now need finer instruments. I have an Expert Leathering Kit available. Trade in your old Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides** for my work, and the Expert kit is yours. Your hands will move swifter still.',
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
    `CompletionText` = 'Have you gathered the heavier hides and your old Journeyman kit?';

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
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'I see your mastery grows. That Journeyman kit served its purpose, but you require expert-grade tools now. I have such a kit available. Trade in your old Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides** to replenish my workshop, and I will trade it to you. Your efficiency will increase notably.',
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
    `CompletionText` = 'Have you brought the heavier materials and your old Journeyman kit?';

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
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Journeyman kit too slow now. You need Expert kit. Trade in old kit. **20 Heavy Leather, 5 Heavy Hides**. Bring. Get better tools. Work faster.',
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
    `CompletionText` = 'You have heavy leather and old kit? 20 leather, 5 hides, old Journeyman kit?';

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
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman tools have guided you well, but your growth calls for better instruments. I have an Expert Leathering Kit for you. Trade in your old Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides** from stronger beasts, and we shall trade. Your craft will flow more freely.',
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
    `CompletionText` = 'Do you have the heavier hides and your old Journeyman kit, friend?';

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
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'Ah, still struggling with that Journeyman kit? How... limiting. I have an Expert Leathering Kit that requires a new home. Trade in that inadequate Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides**, and your... sluggish... crafting pace will improve considerably.',
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
    `CompletionText` = 'Do you have the heavier hides and that old Journeyman kit?';

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
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4234, -- Heavy Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 4235, -- Heavy Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57612, -- Journeyman Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Expert''s Tools',
    `LogDescription` = 'Trade in your Journeyman kit and collect leather to exchange for an Expert Leathering Kit',
    `QuestDescription` = 'That Journeyman kit is beneath your growing skill level. How can you expect to produce expert-quality work with journeyman tools? I have an Expert Leathering Kit available. Relinquish that inferior Journeyman kit and bring me **20 Heavy Leather and 5 Heavy Hides** - quality materials, please - and we shall trade. Your efficiency will improve markedly.',
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
    `CompletionText` = 'Have you acquired the heavier hides and that inferior Journeyman kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN LEATHERING KIT QUESTS (225+ Leatherworking)
-- 20 Rugged Leather + 5 Rugged Hide
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
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your Expert kit has served you well, but artisan-level work demands precision tools. I have an Artisan Leathering Kit available - trade in your old Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** for my current contracts, and the Artisan kit is yours. The quality difference will be immediately noticeable in your crafting speed.',
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
    `CompletionText` = 'Did you bring the 20 Rugged Leather, 5 Rugged Hides, and your old Expert kit?';

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
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Time fer a proper upgrade, eh? Yer Expert kit''s served ye well, but artisan work needs artisan tools! Trade in yer old Expert kit and fetch me **20 Rugged Leather and 5 Rugged Hides** from the toughest beasts, and this Artisan Kit is yers. Ye''ll be working faster than ever! Dwarven craftsmanship at its finest!',
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
    `CompletionText` = 'Got those rugged hides and yer old Expert kit? 20 leather, 5 hides, and the old kit, aye?';

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
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your mastery deepens, like roots growing ever deeper. The Expert tools have guided you well, but artisan-level work requires instruments of greater refinement. I have an Artisan Leathering Kit available. Trade in your old Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** from the strongest beasts, and the Artisan kit is yours. Your hands will move with the grace of wind through branches.',
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
    `CompletionText` = 'Have you gathered the rugged hides and your old Expert kit?';

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
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your progression continues admirably. The Expert tools served their purpose, but you now approach artisan mastery. I have an Artisan Leathering Kit prepared. Trade in your old Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** from the most formidable creatures, and I will trade it to you. The Light will guide your hands to even greater speed and precision.',
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
    `CompletionText` = 'Have you brought the rugged materials and your old Expert kit?';

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
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Need better tools. Artisan kit here. Trade in old Expert kit. **20 Rugged Leather, 5 Rugged Hides**. Strongest beasts. Bring. Get Artisan kit. Work much faster.',
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
    `CompletionText` = 'You have rugged leather and old Expert kit? 20 leather, 5 hides, old kit?';

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
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Your path winds ever upward, friend. The Expert tools served their time, but artisan mastery requires instruments blessed by greater wisdom. I have an Artisan Leathering Kit for you. Trade in your old Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** from the mightiest beasts - those who have lived long under the Earth Mother''s watch. In trade, your craft will flow like the wind across the plains.',
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
    `CompletionText` = 'Do you have the rugged hides and your old Expert kit, friend?';

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
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still plodding along with Expert-grade tools? How... quaint. I suppose your work takes forever at that pace. I have an Artisan Leathering Kit available - trade in that inadequate Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** from the toughest creatures you can find, and it''s yours. Your painfully slow crafting speed will become... somewhat less painful.',
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
    `CompletionText` = 'Do you have the rugged hides and that old Expert kit?';

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
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 8170, -- Rugged Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8171, -- Rugged Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57613, -- Expert Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Tools',
    `LogDescription` = 'Trade in your Expert kit and collect leather to exchange for an Artisan Leathering Kit',
    `QuestDescription` = 'Still using Expert-grade tools for artisan-level work? How do you expect to maintain proper standards with such inferior equipment? I have an Artisan Leathering Kit available. Relinquish that inferior Expert kit and bring me **20 Rugged Leather and 5 Rugged Hides** - quality materials from worthy beasts, please - and we shall trade. Your efficiency will improve to something approaching acceptable.',
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
    `CompletionText` = 'Have you acquired the rugged hides and that inferior Expert kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER LEATHERING KIT QUEST (300+ Leatherworking)
-- 20 Knothide Leather + 5 Heavy Knothide Leather
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
    `QuestSortID` = 3703, -- Shattrath City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect leather to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Welcome to Outland, leatherworker. The hides here are tougher than anything from Azeroth - your Artisan kit will struggle with them. I have a Master Leathering Kit designed for Outland materials. Trade in your old Artisan kit and bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from the beasts of this shattered world, and the Master kit is yours. You''ll need the speed advantage for the challenges ahead.',
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
    `CompletionText` = 'Did you bring the 20 Knothide Leather, 5 Heavy Knothide Leather, and your old Artisan kit?';

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
    `QuestSortID` = 3483, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect leather to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Welcome to Outland, leatherworker. The hides here are tougher than anything from Azeroth - your Artisan kit will struggle with them. I have a Master Leathering Kit designed for Outland materials. Trade in your old Artisan kit and bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from the beasts of this shattered world, and the Master kit is yours. You''ll need the speed advantage - these tough hides require precision cutting, and a sharp blade makes all the difference.',
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
    `CompletionText` = 'Did you bring the 20 Knothide Leather, 5 Heavy Knothide Leather, and your old Artisan kit?';

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
    `QuestSortID` = 3483, -- Hellfire Peninsula
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57614, -- Artisan Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Tools',
    `LogDescription` = 'Trade in your Artisan kit and collect leather to exchange for a Master Leathering Kit',
    `QuestDescription` = 'Brother/Sister, you''ve arrived in Outland. The beasts here have hides twice as thick as Azeroth''s - your Artisan kit struggles to cut clean. I have Master Leathering Kits forged for these harsh lands. Trade in your old Artisan kit and bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from Outland''s creatures, and the Master kit is yours. Faster cutting, cleaner work - you''ll need every advantage here.',
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
    `CompletionText` = 'Did you bring the knothide leather and your old Artisan kit, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER LEATHERING KIT QUEST (375+ Leatherworking)
-- 20 Borean Leather + 5 Heavy Borean Leather
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
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 33568, -- Borean Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 38425, -- Heavy Borean Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57615, -- Master Leathering Kit (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Tools',
    `LogDescription` = 'Trade in your Master kit and collect leather to exchange for a Grand Master Leathering Kit',
    `QuestDescription` = 'Northrend presents new challenges for even master leatherworkers. The arctic hides here are thicker and more resistant than Outland materials - your Master kit will feel sluggish. I have a Grand Master Leathering Kit, the finest tools available. Trade in your old Master kit and bring me **20 Borean Leather and 5 Heavy Borean Leather** from Northrend''s beasts, and the Grand Master kit is yours. You''ll need every advantage the kit provides for grand master-level work.',
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
    `CompletionText` = 'Did you bring the 20 Borean Leather, 5 Heavy Borean Leather, and your old Master kit?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
