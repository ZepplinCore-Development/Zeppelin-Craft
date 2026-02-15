-- =====================================================
-- SKINNING KNIFE QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90116-90123) [ExclusiveGroup 90116]
-- Artisan: 8 city quests (90124-90131) [ExclusiveGroup 90124]
-- Master: 3 Outland quests (90132-90134) [ExclusiveGroup 90132]
-- Grand Master: 1 Dalaran quest (90135)
-- Total: 20 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive leather requirements matching skill tiers
-- - Skinning-specific benefits: increased leather yield per skin
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90116 AND 90135;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90116 AND 90135;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90116 AND 90135;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90116 AND 90135;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90116 AND 90135;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90116 AND 90135;

-- =====================================================
-- JOURNEYMAN SKINNING KNIFE QUESTS (75+ Skinning)
-- 20 Light Leather + 5 Light Hide
-- Reward: Journeyman Skinning Knife (57802)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90116: Stormwind (Maris Granger - 1292)
-- -----------------------------------------------------
SET @quest := 90116;
SET @npc := 1292;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with a basic knife? You''re ruining half the hide with every cut. I have proper blades available - bring me **20 Light Leather and 5 Light Hide** to replenish my stock, and I''ll trade you one. You''ll get cleaner cuts and more usable leather from every beast.',
    `QuestCompletionLog` = 'Return the leather to Maris Granger in Stormwind',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good quality leather. Here''s your knife - you''ll notice the difference with your very next skinning.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Light Leather and 5 Light Hide?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90117: Ironforge (Balthus Stoneflayer - 6291)
-- -----------------------------------------------------
SET @quest := 90117;
SET @npc := 6291;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Bah! Still usin'' a basic knife, are ye? No wonder yer tearin'' through half the hide! I''ve got proper skinning blades here - fetch me **20 Light Leather and 5 Light Hide** fer me stock, and I''ll trade ye fer one. Ye''ll pull clean leather from every beast, I guarantee it!',
    `QuestCompletionLog` = 'Return the leather to Balthus Stoneflayer in Ironforge',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality leather this! Here ye go - this blade''ll make skinning a pleasure, mark me words!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that leather? 20 Light Leather and 5 Light Hide, aye?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90118: Darnassus (Eladriel - 6292)
-- -----------------------------------------------------
SET @quest := 90118;
SET @npc := 6292;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'I see you harvest the wild without proper tools. The creatures of the forest give their hides more willingly when honored with a clean cut. I have blades available. If you bring me **20 Light Leather and 5 Light Hide** for my work, I will trade one to you. You will find each skinning yields more generously.',
    `QuestCompletionLog` = 'Return the leather to Eladriel in Darnassus',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Elune''s blessings upon you. This leather is well-prepared. May this blade help you harvest with greater harmony and respect.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the leather I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90119: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90119;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'I observe you skin without refined instruments. Your technique is sound, but proper tools would preserve more of each hide. I have blades available - if you bring me **20 Light Leather and 5 Light Hide** to replenish my supplies, I will trade one to you. The Light will guide your hands to cleaner cuts.',
    `QuestCompletionLog` = 'Return the leather to Mathreyn in the Exodar',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light be with you. These materials are well-chosen. May this blade aid you in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90120: Orgrimmar (Mooranta - 7089)
-- -----------------------------------------------------
SET @quest := 90120;
SET @npc := 7089;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Basic knife? Wasteful. Tear hide. Ruin leather. Need better blade. I have blades. **20 Light Leather, 5 Light Hide**. Bring. Trade for knife. Get more leather from each beast. Simple.',
    `QuestCompletionLog` = 'Return the leather to Mooranta in Orgrimmar',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Clean leather. Take knife. Skin better now. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have leather? 20 Light Leather and 5 Light Hide?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90121: Thunder Bluff (Thuwd - 7088)
-- -----------------------------------------------------
SET @quest := 90121;
SET @npc := 7088;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Brother/Sister, I see you work the hides without proper tools. The Earth Mother teaches that we honor the beasts by wasting nothing - a clean cut preserves the hide and respects the sacrifice. I have blades here - bring me **20 Light Leather and 5 Light Hide** for my needs, and I will trade one to you. You will find each skinning yields more generously.',
    `QuestCompletionLog` = 'Return the leather to Thuwd in Thunder Bluff',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this exchange. This leather is well-prepared. May this blade help you harvest with wisdom and respect.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the leather, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90122: Undercity (Killian Hagey - 7087)
-- -----------------------------------------------------
SET @quest := 90122;
SET @npc := 7087;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with that dull thing? How... inefficient. You''re shredding half the hide with every cut. I have proper blades available - bring me **20 Light Leather and 5 Light Hide** to replenish my stock, and I''ll part with one. Your yields will become considerably less... wasteful.',
    `QuestCompletionLog` = 'Return the leather to Killian Hagey in Undercity',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality. Here''s your blade - do try not to butcher so many hides from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the leather I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90123: Silvermoon (Tyn - 16692)
-- -----------------------------------------------------
SET @quest := 90123;
SET @npc := 16692;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with such... primitive instruments? How do you expect to preserve quality hides without proper tools? I have blades available. Bring me **20 Light Leather and 5 Light Hide** - quality specimens, mind you - and I''ll trade one to you. Your leather yield will improve dramatically.',
    `QuestCompletionLog` = 'Return the leather to Tyn in Silvermoon City',
    `RewardItem1` = 57802,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90116;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate specimens, I suppose. Here''s your blade - do try to maintain some standards with your skinning from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the leather I requested?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN SKINNING KNIFE QUESTS (225+ Skinning)
-- 20 Thick Leather + 5 Thick Hide
-- Reward: Artisan Skinning Knife (57803)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90124: Stormwind (Maris Granger - 1292)
-- -----------------------------------------------------
SET @quest := 90124;
SET @npc := 1292;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Your skills are growing, but that Journeyman knife is dulling on tougher hides - you''re losing usable leather from each beast. I have Artisan blades here. Bring me **20 Thick Leather and 5 Thick Hide** for my stock, and the Artisan knife is yours. Your yield will increase considerably.',
    `QuestCompletionLog` = 'Return the leather to Maris Granger in Stormwind',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality leather. Here''s your Artisan knife. You''ll extract far more usable hide from each beast now.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Thick Leather and 5 Thick Hide?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90125: Ironforge (Balthus Stoneflayer - 6291)
-- -----------------------------------------------------
SET @quest := 90125;
SET @npc := 6291;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Yer outgrowin'' that Journeyman blade, I see! It''s tuggin'' on the tougher hides - yer wastin'' good leather ye could be gettin''! Time fer an upgrade, aye? Fetch me **20 Thick Leather and 5 Thick Hide** fer me stock, and this Artisan knife is yers. Ye''ll be pullin'' clean leather from every beast!',
    `QuestCompletionLog` = 'Return the leather to Balthus Stoneflayer in Ironforge',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality leather this! Here''s yer Artisan knife - sharper than a worg''s fang!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that leather? 20 Thick Leather and 5 Thick Hide, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90126: Darnassus (Eladriel - 6292)
-- -----------------------------------------------------
SET @quest := 90126;
SET @npc := 6292;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman blade has served well, but I see it struggling with tougher hides now - you lose precious leather from each beast. I have Artisan blades available. Bring me **20 Thick Leather and 5 Thick Hide** for my work, and the Artisan knife is yours. The wild will yield more generously to sharper tools.',
    `QuestCompletionLog` = 'Return the leather to Eladriel in Darnassus',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This leather speaks of your growing mastery. May Elune guide your hands as this Artisan blade serves you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the leather I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90127: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90127;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'I see your mastery grows. That Journeyman blade served its purpose, but it struggles with tougher hides now - you lose valuable material with each cut. I have Artisan blades available. Bring me **20 Thick Leather and 5 Thick Hide** to replenish my workshop, and I will trade one to you. The Light will guide your hands to cleaner yields.',
    `QuestCompletionLog` = 'Return the leather to Mathreyn in the Exodar',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines upon this exchange. These materials are well-selected. This Artisan blade will aid your continued growth.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90128: Orgrimmar (Mooranta - 7089)
-- -----------------------------------------------------
SET @quest := 90128;
SET @npc := 7089;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Journeyman blade too dull now. Tougher hides. Losing leather. Need better knife. **20 Thick Leather, 5 Thick Hide**. Bring. Get Artisan knife. Get more leather from each beast.',
    `QuestCompletionLog` = 'Return the leather to Mooranta in Orgrimmar',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good leather. Strong. Take Artisan knife. Much better. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have leather? 20 Thick Leather, 5 Thick Hide?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90129: Thunder Bluff (Thuwd - 7088)
-- -----------------------------------------------------
SET @quest := 90129;
SET @npc := 7088;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman blade has guided you well, but I see it struggling on thicker hides - precious leather is lost with each cut. The Earth Mother teaches that better tools honor the sacrifice of the beasts. I have Artisan blades for you. Bring me **20 Thick Leather and 5 Thick Hide** from the wilds, and we shall trade. Your yields will flow more freely.',
    `QuestCompletionLog` = 'Return the leather to Thuwd in Thunder Bluff',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this trade. This Artisan blade will carry you far on your path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the leather, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90130: Undercity (Killian Hagey - 7087)
-- -----------------------------------------------------
SET @quest := 90130;
SET @npc := 7087;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Ah, still hacking away with that Journeyman knife? How... wasteful. I see it failing on thicker hides - you''re shredding valuable leather with each pathetic cut. I have Artisan blades available. Bring me **20 Thick Leather and 5 Thick Hide**, and your... pitiful... yields will improve considerably.',
    `QuestCompletionLog` = 'Return the leather to Killian Hagey in Undercity',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate quality, I suppose. Here''s your Artisan blade - do try to skin with a bit more... finesse... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the leather I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90131: Silvermoon (Tyn - 16692)
-- -----------------------------------------------------
SET @quest := 90131;
SET @npc := 16692;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Still using Journeyman equipment on artisan-grade hides? How do you expect to preserve quality leather with such inferior tools? I see that dull blade wasting precious material. I have Artisan blades available. Bring me **20 Thick Leather and 5 Thick Hide** - quality specimens, please - and we shall trade. Your skinning efficiency will improve markedly.',
    `QuestCompletionLog` = 'Return the leather to Tyn in Silvermoon City',
    `RewardItem1` = 57803,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = -90116, -- Requires Journeyman tier (any quest from ExclusiveGroup 90116)
    `ExclusiveGroup` = 90124;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality, I suppose. Here''s your Artisan blade - now perhaps your skinning will meet proper standards.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the leather I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER SKINNING KNIFE QUESTS (300+ Skinning)
-- 20 Knothide Leather + 5 Heavy Knothide Leather
-- Reward: Master Skinning Knife (57804)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90132: Honor Hold (Jelena Nightsky - 18777)
-- -----------------------------------------------------
SET @quest := 90132;
SET @npc := 18777;

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
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Collect leather to exchange for a Master Skinning Knife',
    `QuestDescription` = 'Welcome to Outland, skinner. The beasts here have hides far tougher than anything from Azeroth - your Artisan knife will struggle, and you''ll lose usable leather from each skinning. I have Master blades designed for Outland hides. Bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from these harsh lands, and the Master knife is yours. You''ll need the increased yield for the challenges ahead.',
    `QuestCompletionLog` = 'Return the leather to Jelena Nightsky at Honor Hold',
    `RewardItem1` = 57804,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = -90124, -- Requires Artisan tier (any quest from ExclusiveGroup 90124)
    `ExclusiveGroup` = 90132;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality specimens from this shattered world. This Master knife is built for Outland''s tough-skinned beasts - it will serve you well here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Knothide Leather and 5 Heavy Knothide Leather?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90133: Thrallmar (Moorutu - 18755)
-- -----------------------------------------------------
SET @quest := 90133;
SET @npc := 18755;

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
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Collect leather to exchange for a Master Skinning Knife',
    `QuestDescription` = 'Brother/Sister, the beasts speak differently in this broken land. The hides here are far tougher than those of Azeroth - your Artisan blade struggles with their thickness, and precious leather is lost. I have Master blades for these twisted lands. Bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from Outland''s fierce beasts, and we shall trade. Greater yields will come from these sharper blades.',
    `QuestCompletionLog` = 'Return the leather to Moorutu at Thrallmar',
    `RewardItem1` = 57804,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = -90124, -- Requires Artisan tier (any quest from ExclusiveGroup 90124)
    `ExclusiveGroup` = 90132;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Strength honors this exchange. This Master blade will help you harvest Outland''s bounty more fully.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the Outland leather, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90134: Shattrath (Seymour - 19180)
-- -----------------------------------------------------
SET @quest := 90134;
SET @npc := 19180;

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
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Collect leather to exchange for a Master Skinning Knife',
    `QuestDescription` = 'Skinner from Azeroth, welcome. The beasts here... they are not like your home. Fel-twisted hides, demon-touched creatures that blunt lesser blades. Your Artisan knife will dull quickly - you will lose precious leather from every skinning.$B$BI have Master blades forged for Outland''s fierce creatures. Bring me **20 Knothide Leather and 5 Heavy Knothide Leather** from these unforgiving lands, and the Master knife is yours. Honed edge, tempered steel - you''ll harvest more leather and work faster. Essential tools for survival here.',
    `QuestCompletionLog` = 'Return the leather to Seymour in Shattrath City',
    `RewardItem1` = 57804,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = -90124, -- Requires Artisan tier (any quest from ExclusiveGroup 90124)
    `ExclusiveGroup` = 90132;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Quality leather from the shattered world. This Master knife is forged for Outland - hardened steel, tempered for the toughest hides. It will serve you well through your time here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Knothide Leather and 5 Heavy Knothide Leather?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER SKINNING KNIFE QUEST (375+ Skinning)
-- 20 Borean Leather + 5 Heavy Borean Leather
-- Reward: Grand Master Skinning Knife (57805)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90135: Dalaran (Derik Marks - 28696)
-- -----------------------------------------------------
SET @quest := 90135;
SET @npc := 28696;

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
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Knife',
    `LogDescription` = 'Collect leather to exchange for a Grand Master Skinning Knife',
    `QuestDescription` = 'Northrend presents new challenges for even master skinners. The arctic beasts here have hides thick as plate armor and fur frozen solid in ice - your current blade will feel sluggish, and you''ll lose valuable leather from each skinning. I have Grand Master knives, the finest blades available. Bring me **20 Borean Leather and 5 Heavy Borean Leather** from Northrend''s frozen wilds, and the Grand Master knife is yours - forged for maximum yields in the harshest conditions!',
    `QuestCompletionLog` = 'Return the leather to Derik Marks in Dalaran',
    `RewardItem1` = 57805,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 393, -- Skinning
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = -90132; -- Requires Master tier (any quest from ExclusiveGroup 90132)

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality specimens from the frozen wastes! This Grand Master knife is masterfully crafted for Northrend''s thick-skinned beasts. You''ll extract far more from each skinning now!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Borean Leather and 5 Heavy Borean Leather?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
