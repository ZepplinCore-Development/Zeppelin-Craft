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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with a basic knife? You''re ruining half the hide with every cut. I have proper blades available - bring me 20 Light Leather and 5 Light Hide to replenish my stock - that basic knife of yours included - and I''ll trade you one. You''ll get cleaner cuts and more usable leather from every beast.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Did you bring the 20 Light Leather and 5 Light Hide? And your old basic knife - that''s part of the trade.';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Bah! Still usin'' a basic knife, are ye? No wonder yer tearin'' through half the hide! I''ve got proper skinning blades here - fetch me 20 Light Leather and 5 Light Hide fer me stock - and hand over that basic knife while ye''re at it - and I''ll trade ye fer one. Ye''ll pull clean leather from every beast, I guarantee it.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Got that leather? 20 Light Leather and 5 Light Hide, aye? And yer old knife - hand it over, that''s the deal.';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'I see you harvest the wild without proper tools. The creatures of the forest give their hides more willingly when honored with a clean cut. I have blades available. If you bring me 20 Light Leather and 5 Light Hide for my work, and give your old blade in return, I will trade one to you. You will find each skinning yields more generously.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Have you gathered the leather I require? Your old blade as well - the trade must be whole.';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90119: Exodar (Remere - 16763)
-- -----------------------------------------------------
SET @quest := 90119;
SET @npc := 16763;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'I observe you skin without refined instruments. Your technique is sound, but proper tools would preserve more of each hide. I have blades available - if you bring me 20 Light Leather and 5 Light Hide to replenish my supplies - your basic knife included in the exchange - I will trade one to you. The Light will guide your hands to cleaner cuts.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Have you brought the materials I require? The old knife completes the exchange.';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Basic knife? Wasteful. Tear hide. Ruin leather. Need better blade. I have blades. 20 Light Leather, 5 Light Hide. Old knife too. Bring. Trade for new blade. Get more leather from each beast. Simple.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'You have leather? 20 Light Leather, 5 Light Hide? Old knife too?';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = '$GBrother:Sister;, I see you work the hides without proper tools. The Earth Mother teaches that we honor the beasts by wasting nothing - a clean cut preserves the hide and respects the sacrifice. I have blades here - bring me 20 Light Leather and 5 Light Hide for my needs, give me your old blade, and I will trade one to you. You will find each skinning yields more generously.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Do you have the leather, friend? And your old blade for the trade?';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with that dull thing? How... inefficient. You''re shredding half the hide with every cut. I have proper blades available - bring me 20 Light Leather and 5 Light Hide to replenish my stock - along with that dull thing you call a knife - and I''ll part with one. Your yields will become considerably less... wasteful.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Do you have the leather I require? The old knife as well... I have plans for it.';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2318, -- Light Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 783, -- Light Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 7005, -- Basic Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Skinner''s Tools',
    `LogDescription` = 'Collect leather to exchange for a Journeyman Skinning Knife',
    `QuestDescription` = 'Skinning with such... primitive instruments? How do you expect to preserve quality hides without proper tools? I have blades available. Bring me 20 Light Leather and 5 Light Hide - quality specimens, mind you - surrender that primitive blade, and I''ll trade one to you. Your leather yield will improve dramatically.$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide$B- Basic Skinning Knife',
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
    `CompletionText` = 'Have you acquired the leather I requested? And the old blade - do hand it over.';

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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Your skills are growing, but that Journeyman knife is dulling on tougher hides - you''re losing usable leather from each beast. I have Artisan blades here. Trade in your Journeyman knife and bring me 20 Thick Leather and 5 Thick Hide for my stock, and the Artisan knife is yours. Your yield will increase considerably.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Did you bring the 20 Thick Leather and 5 Thick Hide? And the Journeyman knife - that''s part of the trade.';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90125: Ironforge (Balthus Stoneflayer - 6291)
-- -----------------------------------------------------
SET @quest := 90125;
SET @npc := 6291;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Yer outgrowin'' that Journeyman blade, I see! It''s tuggin'' on the tougher hides - yer wastin'' good leather ye could be gettin''! Time fer an upgrade, aye? Fetch me 20 Thick Leather and 5 Thick Hide fer me stock - and trade in that Journeyman blade - and this Artisan knife is yers. Ye''ll be pullin'' clean leather from every beast.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Got that leather? 20 Thick Leather and 5 Thick Hide, aye? And the Journeyman blade - hand it over, that''s the deal.';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90126: Darnassus (Eladriel - 6292)
-- -----------------------------------------------------
SET @quest := 90126;
SET @npc := 6292;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman blade has served well, but I see it struggling with tougher hides now - you lose precious leather from each beast. I have Artisan blades available. Bring me 20 Thick Leather and 5 Thick Hide for my work, return the Journeyman blade to me, and the Artisan knife is yours. The wild will yield more generously to sharper tools.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Have you gathered the leather I require? The Journeyman blade as well - the trade must be whole.';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90127: Exodar (Remere - 16763)
-- -----------------------------------------------------
SET @quest := 90127;
SET @npc := 16763;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'I see your mastery grows. That Journeyman blade served its purpose, but it struggles with tougher hides now - you lose valuable material with each cut. I have Artisan blades available. Bring me 20 Thick Leather and 5 Thick Hide to replenish my workshop - the Journeyman blade returns to me in the exchange - and I will trade one to you. The Light will guide your hands to cleaner yields.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Have you brought the materials I require? The Journeyman blade completes the exchange.';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90128: Orgrimmar (Mooranta - 7089)
-- -----------------------------------------------------
SET @quest := 90128;
SET @npc := 7089;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Journeyman blade too dull now. Tougher hides. Losing leather. Need better knife. 20 Thick Leather, 5 Thick Hide. Old blade too. Bring. Get Artisan knife. Get more leather from each beast.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'You have leather? 20 Thick Leather, 5 Thick Hide? Journeyman blade too?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90129: Thunder Bluff (Thuwd - 7088)
-- -----------------------------------------------------
SET @quest := 90129;
SET @npc := 7088;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman blade has guided you well, but I see it struggling on thicker hides - precious leather is lost with each cut. The Earth Mother teaches that better tools honor the sacrifice of the beasts. I have Artisan blades for you. Bring me 20 Thick Leather and 5 Thick Hide from the wilds, give back the Journeyman blade, and we shall trade. Your yields will flow more freely.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Do you have the leather, friend? And the Journeyman blade for the trade?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90130: Undercity (Killian Hagey - 7087)
-- -----------------------------------------------------
SET @quest := 90130;
SET @npc := 7087;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Ah, still hacking away with that Journeyman knife? How... wasteful. I see it failing on thicker hides - you''re shredding valuable leather with each pathetic cut. I have Artisan blades available. Bring me 20 Thick Leather and 5 Thick Hide - and that Journeyman knife, I''ll be keeping it - and your... pitiful... yields will improve considerably.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Do you have the leather I require? The Journeyman knife as well... I have plans for it.';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90131: Silvermoon (Tyn - 16692)
-- -----------------------------------------------------
SET @quest := 90131;
SET @npc := 16692;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4304, -- Thick Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 8169, -- Thick Hide
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57802, -- Journeyman Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Knife',
    `LogDescription` = 'Collect leather to exchange for an Artisan Skinning Knife',
    `QuestDescription` = 'Still using Journeyman equipment on artisan-grade hides? How do you expect to preserve quality leather with such inferior tools? I see that dull blade wasting precious material. I have Artisan blades available. Bring me 20 Thick Leather and 5 Thick Hide - quality specimens, please - along with that Journeyman blade, and we shall trade. Your skinning efficiency will improve markedly.$B$BRequired:$B- 20 Thick Leather$B- 5 Thick Hide$B- Journeyman Skinning Knife',
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
    `CompletionText` = 'Have you acquired the leather I requested? And the Journeyman blade - do hand it over.';

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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57803, -- Artisan Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Bring 20 Knothide Leather, 5 Heavy Knothide Leather and your Artisan Skinning Knife to Jelena Nightsky at Honor Hold in Hellfire Peninsula.',
    `QuestDescription` = 'See the hounds outside the walls? Their hides turn arrows - and they ruin knives. I''ve watched skinners saw away at fel-touched leather until nothing was left worth keeping. Bring me knothide enough to prove your hand is steady, trade in the Artisan knife, and take a Master blade that peels a hide whole.$B$BRequired:$B- 20 Knothide Leather$B- 5 Heavy Knothide Leather$B- Artisan Skinning Knife',
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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57803, -- Artisan Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Bring 20 Knothide Leather, 5 Heavy Knothide Leather and your Artisan Skinning Knife to Moorutu at Thrallmar in Hellfire Peninsula.',
    `QuestDescription` = 'Even here, $Gbrother:sister;, we waste nothing. The beasts of this land die hard, and a ragged cut dishonors what they gave. Bring knothide taken clean, and give me your Artisan blade. The Master knife I trade you glides through fel-toughened hide, and the beast''s gift is kept whole.$B$BRequired:$B- 20 Knothide Leather$B- 5 Heavy Knothide Leather$B- Artisan Skinning Knife',
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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21887, -- Knothide Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23793, -- Heavy Knothide Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57803, -- Artisan Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Knife',
    `LogDescription` = 'Bring 20 Knothide Leather, 5 Heavy Knothide Leather and your Artisan Skinning Knife to Seymour in Shattrath''s Lower City.',
    `QuestDescription` = 'You skin the beasts of this land? Then you have felt it... the hide resists. Fel does that. It... remembers the blade. I keep knives the Lower City makes, edges that fel-touched leather does not remember. Bring knothide, and your Artisan knife in trade... and the Master blade is yours.$B$BRequired:$B- 20 Knothide Leather$B- 5 Heavy Knothide Leather$B- Artisan Skinning Knife',
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
    `QuestSortID` = -378, -- Skinning
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 33568, -- Borean Leather
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 38425, -- Heavy Borean Leather
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 57804, -- Master Skinning Knife (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Knife',
    `LogDescription` = 'Bring 20 Borean Leather, 5 Heavy Borean Leather and your Master Skinning Knife to Derik Marks in Dalaran.',
    `QuestDescription` = 'A frozen hide is a stubborn thing - fur like wire, fat gone hard as wax. Skin a mammoth with a warm-weather blade and you''ll leave a third of it on the carcass. Bring me Borean leather to show you''ve worked the cold, trade in your Master knife, and I''ll give you a Grand Master blade that stays keen at forty below.$B$BRequired:$B- 20 Borean Leather$B- 5 Heavy Borean Leather$B- Master Skinning Knife',
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

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Negative PrevQuestID means "quest must
-- be active" which is also wrong for prerequisites.
-- Replace with reference conditions so completing ANY
-- city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90124 AND 90135;

-- Reference condition -90116: completed ANY Journeyman knife quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90116;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90116, 0, 0, 0, 0, 8, 0, 90116, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Stormwind)'),
(-90116, 0, 0, 0, 1, 8, 0, 90117, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Ironforge)'),
(-90116, 0, 0, 0, 2, 8, 0, 90118, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Darnassus)'),
(-90116, 0, 0, 0, 3, 8, 0, 90119, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Exodar)'),
(-90116, 0, 0, 0, 4, 8, 0, 90120, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Orgrimmar)'),
(-90116, 0, 0, 0, 5, 8, 0, 90121, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Thunder Bluff)'),
(-90116, 0, 0, 0, 6, 8, 0, 90122, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Undercity)'),
(-90116, 0, 0, 0, 7, 8, 0, 90123, 0, 0, 0, 0, 0, '', 'JM knife rewarded (Silvermoon)');

-- Reference condition -90124: completed ANY Artisan knife quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90124;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90124, 0, 0, 0, 0, 8, 0, 90124, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Stormwind)'),
(-90124, 0, 0, 0, 1, 8, 0, 90125, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Ironforge)'),
(-90124, 0, 0, 0, 2, 8, 0, 90126, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Darnassus)'),
(-90124, 0, 0, 0, 3, 8, 0, 90127, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Exodar)'),
(-90124, 0, 0, 0, 4, 8, 0, 90128, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Orgrimmar)'),
(-90124, 0, 0, 0, 5, 8, 0, 90129, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Thunder Bluff)'),
(-90124, 0, 0, 0, 6, 8, 0, 90130, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Undercity)'),
(-90124, 0, 0, 0, 7, 8, 0, 90131, 0, 0, 0, 0, 0, '', 'Artisan knife rewarded (Silvermoon)');

-- Reference condition -90132: completed ANY Master knife quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90132;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90132, 0, 0, 0, 0, 8, 0, 90132, 0, 0, 0, 0, 0, '', 'Master knife rewarded (Honor Hold)'),
(-90132, 0, 0, 0, 1, 8, 0, 90133, 0, 0, 0, 0, 0, '', 'Master knife rewarded (Thrallmar)'),
(-90132, 0, 0, 0, 2, 8, 0, 90134, 0, 0, 0, 0, 0, '', 'Master knife rewarded (Shattrath)');

-- Artisan quests: require any Journeyman knife
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90124 AND 90131;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90124, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (SW) - any JM knife'),
(19, 0, 90125, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (IF) - any JM knife'),
(19, 0, 90126, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (Darn) - any JM knife'),
(19, 0, 90127, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (Exo) - any JM knife'),
(19, 0, 90128, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (Org) - any JM knife'),
(19, 0, 90129, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (TB) - any JM knife'),
(19, 0, 90130, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (UC) - any JM knife'),
(19, 0, 90131, 0, 0, -90116, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Knife (SM) - any JM knife');

-- Master quests: require any Artisan knife
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90132 AND 90134;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90132, 0, 0, -90124, 0, 0, 0, 0, 0, 0, 0, '', 'Master Knife (HH) - any Artisan knife'),
(19, 0, 90133, 0, 0, -90124, 0, 0, 0, 0, 0, 0, 0, '', 'Master Knife (Thrall) - any Artisan knife'),
(19, 0, 90134, 0, 0, -90124, 0, 0, 0, 0, 0, 0, 0, '', 'Master Knife (Shat) - any Artisan knife');

-- Grand Master quest: require any Master knife
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90135;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90135, 0, 0, -90132, 0, 0, 0, 0, 0, 0, 0, '', 'GM Knife (Dalaran) - any Master knife');

-- =====================================================
-- QUEST POIs - turn-in map markers [I-195]
-- One blob per quest at the quest ender (trainer) spawn
-- =====================================================
DELETE FROM `quest_poi` WHERE `QuestID` BETWEEN 90116 AND 90135;
DELETE FROM `quest_poi_points` WHERE `QuestID` BETWEEN 90116 AND 90135;

INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
(90116, 0, -1, 0, 301, 0, 0, 1, 0),
(90117, 0, -1, 0, 341, 0, 0, 1, 0),
(90118, 0, -1, 1, 381, 0, 0, 1, 0),
(90119, 0, -1, 1, 471, 0, 0, 1, 0),
(90120, 0, -1, 1, 362, 0, 0, 1, 0),
(90121, 0, -1, 1, 321, 0, 0, 1, 0),
(90122, 0, -1, 0, 382, 0, 0, 1, 0),
(90123, 0, -1, 0, 480, 0, 0, 1, 0),
(90124, 0, -1, 0, 301, 0, 0, 1, 0),
(90125, 0, -1, 0, 341, 0, 0, 1, 0),
(90126, 0, -1, 1, 381, 0, 0, 1, 0),
(90127, 0, -1, 1, 471, 0, 0, 1, 0),
(90128, 0, -1, 1, 362, 0, 0, 1, 0),
(90129, 0, -1, 1, 321, 0, 0, 1, 0),
(90130, 0, -1, 0, 382, 0, 0, 1, 0),
(90131, 0, -1, 0, 480, 0, 0, 1, 0),
(90132, 0, -1, 530, 465, 0, 0, 1, 0),
(90133, 0, -1, 530, 465, 0, 0, 1, 0),
(90134, 0, -1, 530, 481, 0, 0, 1, 0),
(90135, 0, -1, 571, 510, 0, 0, 1, 0),
(90135, 1, -1, 571, 504, 1, 0, 3, 0);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(90116, 0, 0, -8736, 449, 0),
(90116, 0, 1, -8736, 489, 0),
(90116, 0, 2, -8696, 489, 0),
(90116, 0, 3, -8696, 449, 0),
(90117, 0, 0, -4761, -1049, 0),
(90117, 0, 1, -4761, -1009, 0),
(90117, 0, 2, -4721, -1009, 0),
(90117, 0, 3, -4721, -1049, 0),
(90118, 0, 0, 10061, 2240, 0),
(90118, 0, 1, 10061, 2280, 0),
(90118, 0, 2, 10101, 2280, 0),
(90118, 0, 3, 10101, 2240, 0),
(90119, 0, 0, 5445, 6353, 0),
(90119, 0, 1, 5445, 6393, 0),
(90119, 0, 2, 5485, 6393, 0),
(90119, 0, 3, 5485, 6353, 0),
(90120, 0, 0, -1170, 33, 0),
(90120, 0, 1, -1170, 73, 0),
(90120, 0, 2, -1130, 73, 0),
(90120, 0, 3, -1130, 33, 0),
(90121, 0, 0, 1829, -4589, 0),
(90121, 0, 1, 1829, -4549, 0),
(90121, 0, 2, 1869, -4549, 0),
(90121, 0, 3, 1869, -4589, 0),
(90122, 0, 0, 1479, 180, 0),
(90122, 0, 1, 1479, 220, 0),
(90122, 0, 2, 1519, 220, 0),
(90122, 0, 3, 1519, 180, 0),
(90123, 0, 0, 7367, -5320, 0),
(90123, 0, 1, 7367, -5280, 0),
(90123, 0, 2, 7407, -5280, 0),
(90123, 0, 3, 7407, -5320, 0),
(90124, 0, 0, -8736, 449, 0),
(90124, 0, 1, -8736, 489, 0),
(90124, 0, 2, -8696, 489, 0),
(90124, 0, 3, -8696, 449, 0),
(90125, 0, 0, -4761, -1049, 0),
(90125, 0, 1, -4761, -1009, 0),
(90125, 0, 2, -4721, -1009, 0),
(90125, 0, 3, -4721, -1049, 0),
(90126, 0, 0, 10061, 2240, 0),
(90126, 0, 1, 10061, 2280, 0),
(90126, 0, 2, 10101, 2280, 0),
(90126, 0, 3, 10101, 2240, 0),
(90127, 0, 0, 5445, 6353, 0),
(90127, 0, 1, 5445, 6393, 0),
(90127, 0, 2, 5485, 6393, 0),
(90127, 0, 3, 5485, 6353, 0),
(90128, 0, 0, -1170, 33, 0),
(90128, 0, 1, -1170, 73, 0),
(90128, 0, 2, -1130, 73, 0),
(90128, 0, 3, -1130, 33, 0),
(90129, 0, 0, 1829, -4589, 0),
(90129, 0, 1, 1829, -4549, 0),
(90129, 0, 2, 1869, -4549, 0),
(90129, 0, 3, 1869, -4589, 0),
(90130, 0, 0, 1479, 180, 0),
(90130, 0, 1, 1479, 220, 0),
(90130, 0, 2, 1519, 220, 0),
(90130, 0, 3, 1519, 180, 0),
(90131, 0, 0, 7367, -5320, 0),
(90131, 0, 1, 7367, -5280, 0),
(90131, 0, 2, 7407, -5280, 0),
(90131, 0, 3, 7407, -5320, 0),
(90132, 0, 0, -714, 2705, 0),
(90132, 0, 1, -714, 2745, 0),
(90132, 0, 2, -674, 2745, 0),
(90132, 0, 3, -674, 2705, 0),
(90133, 0, 0, 131, 2613, 0),
(90133, 0, 1, 131, 2653, 0),
(90133, 0, 2, 171, 2653, 0),
(90133, 0, 3, 171, 2613, 0),
(90134, 0, 0, -2068, 5280, 0),
(90134, 0, 1, -2068, 5320, 0),
(90134, 0, 2, -2028, 5320, 0),
(90134, 0, 3, -2028, 5280, 0),
(90135, 0, 0, 5891, 744, 0),
(90135, 0, 1, 5891, 784, 0),
(90135, 0, 2, 5931, 784, 0),
(90135, 0, 3, 5931, 744, 0),
(90135, 1, 0, 5891, 744, 0),
(90135, 1, 1, 5891, 784, 0),
(90135, 1, 2, 5931, 784, 0),
(90135, 1, 3, 5931, 744, 0);
