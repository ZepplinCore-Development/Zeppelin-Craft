-- =====================================================
-- TAILORING SCISSORS QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90046-90053) [ExclusiveGroup 90046]
-- Artisan: 8 city quests (90054-90061) [ExclusiveGroup 90054]
-- Master: 3 Outland quests (90062-90063, 90115) [ExclusiveGroup 90062]
-- Grand Master: 1 Dalaran quest (90064)
-- Total: 20 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive bolt requirements matching skill tiers
-- - Tailoring-specific benefits: faster crafting speed
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90046 AND 90064 OR `ID` = 90115;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90046 AND 90064 OR `ID` = 90115;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90046 AND 90064 OR `ID` = 90115;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90046 AND 90064 OR `ID` = 90115;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90046 AND 90064 OR `quest` = 90115;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90046 AND 90064 OR `quest` = 90115;

-- =====================================================
-- JOURNEYMAN TAILORING SCISSORS QUESTS (75+ Tailoring)
-- 10 Bolt of Linen Cloth + 10 Bolt of Woolen Cloth
-- Reward: Journeyman Tailoring Scissors (57404)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90046: Stormwind (Georgio Bolero - 1346)
-- -----------------------------------------------------
SET @quest := 90046;
SET @npc := 1346;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Cutting cloth with basic shears? Your stitching is taking twice as long as it should. I have proper scissors available - bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth to replenish my stock, and they''re yours. You''ll cut your weaving time in half with the right tools.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Georgio Bolero in Stormwind',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Quality cloth. Here are your scissors - you''ll notice the speed improvement right away.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90047: Ironforge (Jormund Stonebrow - 1103)
-- -----------------------------------------------------
SET @quest := 90047;
SET @npc := 1103;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Bah! Still usin'' basic shears, are ye? No wonder yer stitchin'' takes all day! I''ve got proper scissors here - fetch me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth fer me shop, and I''ll trade ye fer them. Ye''ll be weavin'' twice as fast, I guarantee it.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Jormund Stonebrow in Ironforge',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, fine cloth this! Here ye go - these scissors''ll make yer work fly, mark me words!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those bolts? 10 Linen and 10 Woolen, aye?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90048: Darnassus (Me'lynn - 4159)
-- -----------------------------------------------------
SET @quest := 90048;
SET @npc := 4159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'I see you weave without proper tools. Your hands work with grace, but precision scissors would quicken your craft considerably. I have scissors available. If you bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth for my work, I will trade them to you. You will find your stitching flows like water.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Me''lynn in Darnassus',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Elune''s blessings upon you. This cloth is well-woven. May these scissors help you craft with greater harmony.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the bolts I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90049: Orgrimmar (Magar - 3363)
-- -----------------------------------------------------
SET @quest := 90049;
SET @npc := 3363;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Basic shears? Slow. Weaving takes too long. Need better scissors. I have scissors. 10 Bolts of Linen Cloth, 10 Bolts of Woolen Cloth. Bring. Trade for scissors. Work faster. Simple.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Magar in Orgrimmar',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Fine cloth. Take scissors. Work faster now. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have bolts? 10 Linen and 10 Woolen?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90050: Thunder Bluff (Tepa - 3004)
-- -----------------------------------------------------
SET @quest := 90050;
SET @npc := 3004;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Brother/Sister, I see you weave without proper tools. The Earth Mother teaches that respect for the craft brings greater speed. I have scissors here - bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth for my needs, and I will trade them to you. You will find your stitching quickens considerably.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Tepa in Thunder Bluff',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this exchange. This cloth is well-crafted. May these scissors help you weave with wisdom.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the bolts, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90051: Undercity (Josef Gregorian - 4576)
-- -----------------------------------------------------
SET @quest := 90051;
SET @npc := 4576;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Weaving with basic tools? How... inefficient. You''re wasting valuable time with each stitch. I have proper scissors available - bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth to replenish my stock, and I''ll part with them. Your crafting speed will become considerably less... pitiful.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Josef Gregorian in Undercity',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality. Here are your scissors - do try not to waste so much time from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the bolts I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90052: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90052;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'I observe you weave without refined instruments. Your technique is sound, but proper tools would increase your speed significantly. I have scissors available - if you bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth to replenish my supplies, I will trade them to you. The Light will guide your hands to swifter crafting.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Mathreyn in The Exodar',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light be with you. These materials are well-chosen. May these scissors aid you in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90053: Silvermoon (Keelen Sheets - 16640)
-- -----------------------------------------------------
SET @quest := 90053;
SET @npc := 16640;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2996, -- Bolt of Linen Cloth
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2997, -- Bolt of Woolen Cloth
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Tailoring Scissors',
    `LogDescription` = 'Collect bolts to exchange for Journeyman Tailoring Scissors',
    `QuestDescription` = 'Weaving with such... primitive methods? How do you expect to maximize your efficiency without proper tools? I have scissors available. Bring me 10 Bolts of Linen Cloth and 10 Bolts of Woolen Cloth - quality specimens, mind you - and I''ll trade them to you. Your stitching speed will improve dramatically.$B$BRequired:$B- 10 Bolt of Linen Cloth$B- 10 Bolt of Woolen Cloth',
    `QuestCompletionLog` = 'Return the bolts to Keelen Sheets in Silvermoon City',
    `RewardItem1` = 57404,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90046;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate specimens, I suppose. Here are your scissors - do try to maintain some standards with your weaving from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the bolts I requested?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN TAILORING SCISSORS QUESTS (225+ Tailoring)
-- 10 Bolt of Mageweave + 10 Bolt of Runecloth
-- Reward: Artisan Tailoring Scissors (57405)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90054: Stormwind (Georgio Bolero - 1346)
-- -----------------------------------------------------
SET @quest := 90054;
SET @npc := 1346;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Your skills are growing, but those Journeyman scissors are getting dull on finer cloth - your stitching is slowing down. I have Artisan scissors here. Trade in your old Journeyman scissors and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth for my stock, and the Artisan scissors are yours. Your crafting speed will increase considerably.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Georgio Bolero in Stormwind',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality cloth. I''ll take those old scissors - here are your Artisan scissors. You''ll weave far faster with each piece now.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Bolts of Mageweave, 10 Bolts of Runecloth, and your old Journeyman scissors?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90055: Ironforge (Jormund Stonebrow - 1103)
-- -----------------------------------------------------
SET @quest := 90055;
SET @npc := 1103;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Yer outgrowin'' those Journeyman scissors, I see! They''re dullin'' on the finer cloth - yer stitchin''s slowin'' down! Time fer an upgrade, aye? Trade in yer old scissors and fetch me 10 Bolts of Mageweave and 10 Bolts of Runecloth fer me shop, and these Artisan scissors are yers. Ye''ll be weavin'' twice as fast.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Jormund Stonebrow in Ironforge',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, fine cloth this! I''ll take that old pair off yer hands. Here''s yer Artisan scissors - sharper than a razor!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those bolts and yer old Journeyman scissors? 10 Mageweave, 10 Runecloth, and the old scissors, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90056: Darnassus (Me'lynn - 4159)
-- -----------------------------------------------------
SET @quest := 90056;
SET @npc := 4159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman scissors have served well, but I see them struggling with finer cloth now - your stitching flows less smoothly. I have Artisan scissors available. Trade in your old Journeyman scissors and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth for my work, and the Artisan scissors are yours. Your weaving will flow like water with sharper tools.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Me''lynn in Darnassus',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This cloth speaks of your growing mastery. I will accept your old Journeyman scissors. May Elune guide your hands as these Artisan scissors serve you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the bolts and your old Journeyman scissors?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90057: Orgrimmar (Magar - 3363)
-- -----------------------------------------------------
SET @quest := 90057;
SET @npc := 3363;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Journeyman scissors too dull now. Finer cloth. Stitching slower. Need better scissors. Trade in old Journeyman scissors. 10 Bolts of Mageweave, 10 Bolts of Runecloth. Bring. Get Artisan scissors. Work faster with each piece.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Magar in Orgrimmar',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good cloth. Fine. Give old scissors. Take Artisan scissors. Much better. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have bolts and old Journeyman scissors? 10 Mageweave, 10 Runecloth, old scissors?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90058: Thunder Bluff (Tepa - 3004)
-- -----------------------------------------------------
SET @quest := 90058;
SET @npc := 3004;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman scissors have guided you well, but I see them dulling on finer cloth - your stitching slows. The Earth Mother teaches that better tools bring harmony with the craft. I have Artisan scissors for you. Trade in your old Journeyman scissors and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth from richer weaves, and we shall trade. Your work will flow more freely.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Tepa in Thunder Bluff',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this trade. Your old Journeyman scissors have served their purpose well. These Artisan scissors will carry you far on your path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the bolts and your old Journeyman scissors, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90059: Undercity (Josef Gregorian - 4576)
-- -----------------------------------------------------
SET @quest := 90059;
SET @npc := 4576;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Ah, still struggling with those Journeyman scissors? How... wasteful. I see them failing on finer cloth - you''re wasting valuable time with each pathetic stitch. I have Artisan scissors available. Trade in that inadequate Journeyman pair and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth, and your... pitiful... crafting speed will improve considerably.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Josef Gregorian in Undercity',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate quality, I suppose. I''ll dispose of those pitiful Journeyman scissors for you. Here are your Artisan scissors - do try to weave with a bit more... efficiency... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the bolts and that old Journeyman pair?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90060: Exodar (Mathreyn - 16273)
-- -----------------------------------------------------
SET @quest := 90060;
SET @npc := 16273;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'I see your mastery grows. Those Journeyman scissors served their purpose, but they struggle with finer cloth now - you lose valuable time with each weave. I have Artisan scissors available. Trade in your old Journeyman scissors and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth to replenish my workshop, and I will trade them to you. The Light will guide your hands to swifter crafting.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Mathreyn in The Exodar',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines upon this exchange. I will accept your old Journeyman scissors. These materials are well-selected. This Artisan pair will aid your continued growth.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials and your old Journeyman scissors?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90061: Silvermoon (Keelen Sheets - 16640)
-- -----------------------------------------------------
SET @quest := 90061;
SET @npc := 16640;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 4339, -- Bolt of Mageweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 14048, -- Bolt of Runecloth
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57404, -- Journeyman Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Tailoring Scissors',
    `LogDescription` = 'Trade in your Journeyman scissors and collect bolts to exchange for Artisan Scissors',
    `QuestDescription` = 'Still using Journeyman scissors for artisan-level cloth? How do you expect to maximize efficiency with such inferior equipment? I see those dull blades wasting precious time. I have Artisan scissors available. Relinquish that inferior Journeyman pair and bring me 10 Bolts of Mageweave and 10 Bolts of Runecloth - quality specimens, please - and we shall trade. Your crafting efficiency will improve markedly.$B$BRequired:$B- 10 Bolt of Mageweave$B- 10 Bolt of Runecloth',
    `QuestCompletionLog` = 'Return the bolts to Keelen Sheets in Silvermoon City',
    `RewardItem1` = 57405,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90046, -- Requires Journeyman tier
    `ExclusiveGroup` = 90054;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality, I suppose. I''ll take that inferior Journeyman pair off your hands. Here are your Artisan scissors - now perhaps your weaving will meet proper standards.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the bolts and that inferior Journeyman pair?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER TAILORING SCISSORS QUESTS (300+ Tailoring)
-- 10 Bolt of Netherweave + 3 Bolt of Imbued Netherweave
-- Reward: Master Tailoring Scissors (57406)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90062: Honor Hold (Hama - 18772) [Alliance]
-- -----------------------------------------------------
SET @quest := 90062;
SET @npc := 18772;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 21840, -- Bolt of Netherweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 21842, -- Bolt of Imbued Netherweave
    `RequiredItemCount2` = 3,
    `RequiredItemId3` = 57405, -- Artisan Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Tailoring Scissors',
    `LogDescription` = 'Trade in your Artisan scissors and collect bolts to exchange for Master Scissors',
    `QuestDescription` = 'Welcome to Outland, tailor. The cloth here is far tougher than anything from Azeroth - your Artisan scissors will dull on it, and your stitching will slow down. I have Master scissors designed for Outland fabrics. Trade in your old Artisan scissors and bring me 10 Bolts of Netherweave and 3 Bolts of Imbued Netherweave from these harsh lands, and the Master scissors are yours. You''ll need the increased speed for the challenges ahead.$B$BRequired:$B- 10 Bolt of Netherweave$B- 3 Bolt of Imbued Netherweave',
    `QuestCompletionLog` = 'Return the bolts to Hama at Honor Hold',
    `RewardItem1` = 57406,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90054, -- Requires Artisan tier
    `ExclusiveGroup` = 90062;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality cloth from this shattered world. I''ll take those Artisan scissors - they served their purpose. These Master scissors are built for Outland''s harsh fabrics - they will serve you well here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Bolts of Netherweave, 3 Bolts of Imbued Netherweave, and your old Artisan scissors?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90063: Thrallmar (Dalinna - 18749) [Horde]
-- -----------------------------------------------------
SET @quest := 90063;
SET @npc := 18749;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 21840, -- Bolt of Netherweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 21842, -- Bolt of Imbued Netherweave
    `RequiredItemCount2` = 3,
    `RequiredItemId3` = 57405, -- Artisan Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Tailoring Scissors',
    `LogDescription` = 'Trade in your Artisan scissors and collect bolts to exchange for Master Scissors',
    `QuestDescription` = 'Brother/Sister, the cloth weaves differently in this broken land. The fabrics here are far tougher than those of Azeroth - your Artisan scissors struggle with their thickness, and precious time is lost. I have Master scissors for these twisted lands. Trade in your old Artisan scissors and bring me 10 Bolts of Netherweave and 3 Bolts of Imbued Netherweave from Outland''s harsh weaves, and we shall trade. Greater speed will flow from these sharper blades.$B$BRequired:$B- 10 Bolt of Netherweave$B- 3 Bolt of Imbued Netherweave',
    `QuestCompletionLog` = 'Return the bolts to Dalinna at Thrallmar',
    `RewardItem1` = 57406,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90054, -- Requires Artisan tier
    `ExclusiveGroup` = 90062;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Strength honors this exchange. Your old Artisan scissors served well in Azeroth. These Master scissors will help you weave Outland''s fabrics more swiftly.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the Outland bolts and your old Artisan scissors, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90115: Shattrath Neutral (Eiin - 19213)
-- -----------------------------------------------------
SET @quest := 90115;
SET @npc := 19213;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 21840, -- Bolt of Netherweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 21842, -- Bolt of Imbued Netherweave
    `RequiredItemCount2` = 3,
    `RequiredItemId3` = 57405, -- Artisan Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Tailoring Scissors',
    `LogDescription` = 'Trade in your Artisan scissors and collect bolts to exchange for Master Scissors',
    `QuestDescription` = 'Tailor from Azeroth, welcome to Shattrath. The cloth here is unlike anything from your homeland - netherweave, touched by the Twisting Nether, resistant to ordinary blades. Your Artisan scissors will dull quickly, and your stitching will slow.$B$BI have Master scissors crafted specifically for Outland fabrics. Trade in your old Artisan scissors and bring me 10 Bolts of Netherweave and 3 Bolts of Imbued Netherweave from these harsh lands, and the Master scissors are yours. Reinforced blades, balanced for nether-touched fibers - you''ll cut faster and weave with greater precision.$B$BRequired:$B- 10 Bolt of Netherweave$B- 3 Bolt of Imbued Netherweave',
    `QuestCompletionLog` = 'Return the bolts to Eiin in Shattrath City',
    `RewardItem1` = 57406,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90054, -- Requires Artisan tier
    `ExclusiveGroup` = 90062;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality cloth from the shattered world. I''ll take those Artisan scissors - they served their purpose in Azeroth. These Master scissors are built for Outland''s harsh fabrics - they will cut through netherweave like water and serve you well through your time here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Bolts of Netherweave, 3 Bolts of Imbued Netherweave, and your old Artisan scissors?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER TAILORING SCISSORS QUEST (375+ Tailoring)
-- 10 Bolt of Frostweave + 3 Bolt of Imbued Frostweave
-- Reward: Grand Master Tailoring Scissors (57407)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90064: Dalaran (Benjamin Clegg - 26914)
-- -----------------------------------------------------
SET @quest := 90064;
SET @npc := 26914;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = -264, -- Tailoring
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 41510, -- Bolt of Frostweave
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 41511, -- Bolt of Imbued Frostweave
    `RequiredItemCount2` = 3,
    `RequiredItemId3` = 57406, -- Master Tailoring Scissors (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Tailoring Scissors',
    `LogDescription` = 'Trade in your Master scissors and collect bolts to exchange for Grand Master Scissors',
    `QuestDescription` = 'Northrend presents new challenges for even master tailors. The arctic cloth here is thick as leather and frozen stiff - your Master scissors will feel sluggish, and your stitching will slow considerably. I have Grand Master scissors, the finest tools available. Trade in your old Master scissors and bring me 10 Bolts of Frostweave and 3 Bolts of Imbued Frostweave from Northrend''s frozen weaves, and the Grand Master scissors are yours - forged for maximum speed in the harshest conditions.$B$BRequired:$B- 10 Bolt of Frostweave$B- 3 Bolt of Imbued Frostweave',
    `QuestCompletionLog` = 'Return the bolts to Benjamin Clegg in Dalaran',
    `RewardItem1` = 57407,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 197, -- Tailoring
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90062; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality cloth from the frozen wastes! I''ll take those Master scissors - you''ve outgrown them. These Grand Master scissors are masterfully crafted for Northrend''s brutal fabrics. You''ll weave far faster with each piece now!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Bolts of Frostweave, 3 Bolts of Imbued Frostweave, and your old Master scissors?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Replace with reference conditions so
-- completing ANY city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90054 AND 90064 OR `ID` = 90115;

-- Reference condition -90046: completed ANY Journeyman scissors quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90046;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90046, 0, 0, 0, 0, 8, 0, 90046, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Stormwind)'),
(-90046, 0, 0, 0, 1, 8, 0, 90047, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Ironforge)'),
(-90046, 0, 0, 0, 2, 8, 0, 90048, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Darnassus)'),
(-90046, 0, 0, 0, 3, 8, 0, 90049, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Orgrimmar)'),
(-90046, 0, 0, 0, 4, 8, 0, 90050, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Thunder Bluff)'),
(-90046, 0, 0, 0, 5, 8, 0, 90051, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Undercity)'),
(-90046, 0, 0, 0, 6, 8, 0, 90052, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Exodar)'),
(-90046, 0, 0, 0, 7, 8, 0, 90053, 0, 0, 0, 0, 0, '', 'JM scissors rewarded (Silvermoon)');

-- Reference condition -90054: completed ANY Artisan scissors quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90054;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90054, 0, 0, 0, 0, 8, 0, 90054, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Stormwind)'),
(-90054, 0, 0, 0, 1, 8, 0, 90055, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Ironforge)'),
(-90054, 0, 0, 0, 2, 8, 0, 90056, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Darnassus)'),
(-90054, 0, 0, 0, 3, 8, 0, 90057, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Orgrimmar)'),
(-90054, 0, 0, 0, 4, 8, 0, 90058, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Thunder Bluff)'),
(-90054, 0, 0, 0, 5, 8, 0, 90059, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Undercity)'),
(-90054, 0, 0, 0, 6, 8, 0, 90060, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Exodar)'),
(-90054, 0, 0, 0, 7, 8, 0, 90061, 0, 0, 0, 0, 0, '', 'Artisan scissors rewarded (Silvermoon)');

-- Reference condition -90062: completed ANY Master scissors quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90062;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90062, 0, 0, 0, 0, 8, 0, 90062, 0, 0, 0, 0, 0, '', 'Master scissors rewarded (Honor Hold)'),
(-90062, 0, 0, 0, 1, 8, 0, 90063, 0, 0, 0, 0, 0, '', 'Master scissors rewarded (Thrallmar)'),
(-90062, 0, 0, 0, 2, 8, 0, 90115, 0, 0, 0, 0, 0, '', 'Master scissors rewarded (Shattrath)');

-- Artisan quests: require any Journeyman scissors
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90054 AND 90061;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90054, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (SW) - any JM scissors'),
(19, 0, 90055, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (IF) - any JM scissors'),
(19, 0, 90056, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (Darn) - any JM scissors'),
(19, 0, 90057, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (Org) - any JM scissors'),
(19, 0, 90058, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (TB) - any JM scissors'),
(19, 0, 90059, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (UC) - any JM scissors'),
(19, 0, 90060, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (Exo) - any JM scissors'),
(19, 0, 90061, 0, 0, -90046, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Scissors (SM) - any JM scissors');

-- Master quests: require any Artisan scissors
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90062, 90063, 90115);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90062, 0, 0, -90054, 0, 0, 0, 0, 0, 0, 0, '', 'Master Scissors (HH) - any Artisan scissors'),
(19, 0, 90063, 0, 0, -90054, 0, 0, 0, 0, 0, 0, 0, '', 'Master Scissors (Thrall) - any Artisan scissors'),
(19, 0, 90115, 0, 0, -90054, 0, 0, 0, 0, 0, 0, 0, '', 'Master Scissors (Shat) - any Artisan scissors');

-- Grand Master quest: require any Master scissors
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90064;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90064, 0, 0, -90062, 0, 0, 0, 0, 0, 0, 0, '', 'GM Scissors (Dalaran) - any Master scissors');
