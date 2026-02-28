-- =====================================================
-- MINING PICK QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90027-90034) [ExclusiveGroup 90027]
-- Artisan: 8 city quests (90035-90042) [ExclusiveGroup 90035]
-- Master: 2 Outland quests (90043-90044) [ExclusiveGroup 90043]
-- Grand Master: 1 Dalaran quest (90045)
-- Total: 19 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive ore requirements matching skill tiers
-- - Mining-specific benefits: increased ore yield per vein
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90027 AND 90045;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90027 AND 90045;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90027 AND 90045;
-- Cleanup orphaned quest 90114 (removed: no Mining trainer in Shattrath)
DELETE FROM `quest_template` WHERE `ID` = 90114;
DELETE FROM `quest_template_addon` WHERE `ID` = 90114;
DELETE FROM `quest_offer_reward` WHERE `ID` = 90114;
DELETE FROM `quest_request_items` WHERE `ID` = 90114;
DELETE FROM `creature_queststarter` WHERE `quest` = 90114;
DELETE FROM `creature_questender` WHERE `quest` = 90114;

-- =====================================================
-- JOURNEYMAN MINING PICK QUESTS (75+ Mining)
-- 20 Copper Ore + 20 Tin Ore
-- Reward: Journeyman Mining Pick (57400)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90027: Stormwind (Gelman Stonehand - 5513)
-- -----------------------------------------------------
SET @quest := 90027;
SET @npc := 5513;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Mining with basic tools? You''re missing extra ore from every vein you tap. I have proper picks available - bring me 20 Copper Ore and 20 Tin Ore to replenish my stock, and they''re yours. You''ll extract more ore per vein with the right equipment.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Gelman Stonehand in Stormwind',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good quality ore. Here''s your pick - you''ll notice the improved yields right away.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Copper Ore and 20 Tin Ore?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90028: Ironforge (Geofram Bouldertoe - 4254)
-- -----------------------------------------------------
SET @quest := 90028;
SET @npc := 4254;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Bah! Still usin'' basic tools, are ye? No wonder yer only gettin'' a trickle from each vein! I''ve got proper picks here - fetch me 20 Copper Ore and 20 Tin Ore fer me forge, and I''ll trade ye fer one. Ye''ll pull twice the ore from each vein, I guarantee it.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Geofram Bouldertoe in Ironforge',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality ore this! Here ye go - this pick''ll make those veins sing, mark me words!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore? 20 Copper and 20 Tin, aye?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90029: Darnassus (Borin Irondelve - 70)
-- -----------------------------------------------------
SET @quest := 90029;
SET @npc := 70;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'I see you work the stone without proper tools. The earth gives more freely when approached with respect and precision. I have picks available. If you bring me 20 Copper Ore and 20 Tin Ore for my work, I will trade one to you. You will find each vein yields more generously.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Borin Irondelve in Darnassus',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Elune''s blessings upon you. This ore is well-mined. May this pick help you harvest with greater harmony.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the ore I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90030: Exodar (Muaat - 16752)
-- -----------------------------------------------------
SET @quest := 90030;
SET @npc := 16752;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'I observe you mine without refined instruments. Your technique is sound, but proper tools would increase your yield significantly. I have picks available - if you bring me 20 Copper Ore and 20 Tin Ore to replenish my supplies, I will trade one to you. The Light will guide your hands to greater harvests.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Muaat in the Exodar',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light be with you. These materials are well-chosen. May this pick aid you in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90031: Orgrimmar (Makaru - 3357)
-- -----------------------------------------------------
SET @quest := 90031;
SET @npc := 3357;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Basic tools? Wasteful. Get little ore from veins. Need better pick. I have picks. 20 Copper Ore, 20 Tin Ore. Bring. Trade for pick. Get more ore from each vein. Simple.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Makaru in Orgrimmar',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good. Strong ore. Take pick. Get more ore now. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have ore? 20 Copper and 20 Tin?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90032: Thunder Bluff (Brek Stonehoof - 3001)
-- -----------------------------------------------------
SET @quest := 90032;
SET @npc := 3001;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Brother/Sister, I see you work the earth without proper tools. The Earth Mother teaches that respect for the stone brings greater bounty. I have picks here - bring me 20 Copper Ore and 20 Tin Ore for my needs, and I will trade one to you. You will find each vein yields more generously.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Brek Stonehoof in Thunder Bluff',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this exchange. This ore is well-mined. May this pick help you harvest with wisdom.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the ore, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90033: Undercity (Brom Killian - 4598)
-- -----------------------------------------------------
SET @quest := 90033;
SET @npc := 4598;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Mining with basic tools? How... inefficient. You''re wasting valuable ore with each vein you tap. I have proper picks available - bring me 20 Copper Ore and 20 Tin Ore to replenish my stock, and I''ll part with one. Your yields will become considerably less... pitiful.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Brom Killian in Undercity',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality. Here''s your pick - do try not to waste so much ore from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the ore I require?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90034: Silvermoon (Belil - 16663)
-- -----------------------------------------------------
SET @quest := 90034;
SET @npc := 16663;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2770, -- Copper Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 2771, -- Tin Ore
    `RequiredItemCount2` = 20,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'My First Mining Pick',
    `LogDescription` = 'Collect ore to exchange for a Journeyman Mining Pick',
    `QuestDescription` = 'Mining with such... primitive methods? How do you expect to maximize your yield without proper tools? I have picks available. Bring me 20 Copper Ore and 20 Tin Ore - quality specimens, mind you - and I''ll trade one to you. Your yield per vein will improve dramatically.$B$BRequired:$B- 20 Copper Ore$B- 20 Tin Ore',
    `QuestCompletionLog` = 'Return the ore to Belil in Silvermoon City',
    `RewardItem1` = 57400,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90027;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate specimens, I suppose. Here''s your pick - do try to maintain some standards with your mining from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the ore I requested?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN MINING PICK QUESTS (225+ Mining)
-- 20 Mithril Ore + 20 Thorium Ore
-- Reward: Artisan Mining Pick (57401)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90035: Stormwind (Gelman Stonehand - 5513)
-- -----------------------------------------------------
SET @quest := 90035;
SET @npc := 5513;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Your skills are growing, but that Journeyman pick is chipping on harder veins - you''re missing extra ore from each deposit. I have Artisan picks here. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore for my stock, and the Artisan pick is yours. Your yield will increase considerably.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Gelman Stonehand in Stormwind',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality ore. I''ll take that old pick - here''s your Artisan pick. You''ll extract far more from each vein now.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Mithril Ore, 20 Thorium Ore, and your old Journeyman pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90036: Ironforge (Geofram Bouldertoe - 4254)
-- -----------------------------------------------------
SET @quest := 90036;
SET @npc := 4254;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Yer outgrowin'' that Journeyman pick, I see! It''s chippin'' on the harder veins - yer missin'' ore ye could be gettin''! Time fer an upgrade, aye? Trade in yer old pick and fetch me 20 Mithril Ore and 20 Thorium Ore fer me forge, and this Artisan pick is yers. Ye''ll be pullin'' twice as much from each vein.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Geofram Bouldertoe in Ironforge',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, quality ore this! I''ll take that old pick off yer hands. Here''s yer Artisan pick - sharper than a dragon''s claw!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got that ore and yer old Journeyman pick? 20 Mithril, 20 Thorium, and the old pick, aye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90037: Darnassus (Borin Irondelve - 70)
-- -----------------------------------------------------
SET @quest := 90037;
SET @npc := 70;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman pick has served well, but I see it struggling with harder stone now - you lose precious ore from each vein. I have Artisan picks available. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore for my work, and the Artisan pick is yours. The veins will yield more generously to sharper tools.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Borin Irondelve in Darnassus',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This ore speaks of your growing mastery. I will accept your old Journeyman pick. May Elune guide your hands as this Artisan pick serves you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the ore and your old Journeyman pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90038: Exodar (Muaat - 16752)
-- -----------------------------------------------------
SET @quest := 90038;
SET @npc := 16752;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'I see your mastery grows. That Journeyman pick served its purpose, but it struggles with tougher veins now - you lose valuable material with each extraction. I have Artisan picks available. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore to replenish my workshop, and I will trade one to you. The Light will guide your hands to greater yields.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Muaat in the Exodar',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines upon this exchange. I will accept your old Journeyman pick. These materials are well-selected. This Artisan pick will aid your continued growth.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the materials and your old Journeyman pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90039: Orgrimmar (Makaru - 3357)
-- -----------------------------------------------------
SET @quest := 90039;
SET @npc := 3357;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Journeyman pick too weak now. Harder veins. Losing ore. Need better pick. Trade in old Journeyman pick. 20 Mithril Ore, 20 Thorium Ore. Bring. Get Artisan pick. Get more ore from each vein.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Makaru in Orgrimmar',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good ore. Strong. Give old pick. Take Artisan pick. Much better. Lok''tar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You have ore and old Journeyman pick? 20 Mithril, 20 Thorium, old pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90040: Thunder Bluff (Brek Stonehoof - 3001)
-- -----------------------------------------------------
SET @quest := 90040;
SET @npc := 3001;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman pick has guided you well, but I see it chipping on stronger stone - precious ore is lost with each extraction. The Earth Mother teaches that better tools bring harmony with the land. I have Artisan picks for you. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore from deeper veins, and we shall trade. Your yields will flow more freely.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Brek Stonehoof in Thunder Bluff',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother smiles on this trade. Your old Journeyman pick has served its purpose well. This Artisan pick will carry you far on your path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the ore and your old Journeyman pick, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90041: Undercity (Brom Killian - 4598)
-- -----------------------------------------------------
SET @quest := 90041;
SET @npc := 4598;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Ah, still struggling with that Journeyman pick? How... wasteful. I see it failing on harder veins - you''re losing valuable ore with each pathetic extraction. I have Artisan picks available. Trade in that inadequate Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore, and your... pitiful... yields will improve considerably.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Brom Killian in Undercity',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate quality, I suppose. I''ll dispose of that pitiful Journeyman pick for you. Here''s your Artisan pick - do try to mine with a bit more... efficiency... from now on.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the ore and that old Journeyman pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90042: Silvermoon (Belil - 16663)
-- -----------------------------------------------------
SET @quest := 90042;
SET @npc := 16663;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 60,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57400, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Still using Journeyman equipment for artisan-level veins? How do you expect to maximize yields with such inferior tools? I see that dull pick wasting precious material. I have Artisan picks available. Relinquish that inferior Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore - quality specimens, please - and we shall trade. Your mining efficiency will improve markedly.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Belil in Silvermoon City',
    `RewardItem1` = 57401,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90027, -- Requires Journeyman tier
    `ExclusiveGroup` = 90035;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Acceptable quality, I suppose. I''ll take that inferior Journeyman pick off your hands. Here''s your Artisan pick - now perhaps your extractions will meet proper standards.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the ore and that inferior Journeyman pick?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER MINING PICK QUESTS (300+ Mining)
-- 20 Fel Iron Ore + 20 Adamantite Ore
-- Reward: Master Mining Pick (57402)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90043: Hellfire Peninsula - Alliance (Hurnak Grimmord - 18779)
-- -----------------------------------------------------
SET @quest := 90043;
SET @npc := 18779;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 23424, -- Fel Iron Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23425, -- Adamantite Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57401, -- Artisan Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Pick',
    `LogDescription` = 'Trade in your Artisan pick and collect ore to exchange for a Master Pick',
    `QuestDescription` = 'Welcome to Outland, miner. The veins here are far tougher than anything from Azeroth - your Artisan pick will chip on them, and you''ll miss valuable ore from each deposit. I have Master picks designed for Outland minerals. Trade in your old Artisan pick and bring me 20 Fel Iron Ore and 20 Adamantite Ore from these harsh lands, and the Master pick is yours. You''ll need the increased yield for the challenges ahead.$B$BRequired:$B- 20 Fel Iron Ore$B- 20 Adamantite Ore',
    `QuestCompletionLog` = 'Return the ore to Hurnak Grimmord at Honor Hold',
    `RewardItem1` = 57402,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90035, -- Requires Artisan tier
    `ExclusiveGroup` = 90043;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent quality specimens from this shattered world. I''ll take that Artisan pick - it served its purpose. This Master pick is built for Outland''s harsh minerals - it will serve you well here.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Fel Iron Ore, 20 Adamantite Ore, and your old Artisan pick?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90044: Hellfire Peninsula - Horde (Krugosh - 18747)
-- -----------------------------------------------------
SET @quest := 90044;
SET @npc := 18747;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 23424, -- Fel Iron Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 23425, -- Adamantite Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57401, -- Artisan Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Pick',
    `LogDescription` = 'Trade in your Artisan pick and collect ore to exchange for a Master Pick',
    `QuestDescription` = 'Brother/Sister, the stone speaks differently in this broken land. The veins here are far harder than those of Azeroth - your Artisan pick struggles with their toughness, and precious ore is lost. I have Master picks for these twisted lands. Trade in your old Artisan pick and bring me 20 Fel Iron Ore and 20 Adamantite Ore from Outland''s harsh veins, and we shall trade. Greater yields will flow from these stronger blades.$B$BRequired:$B- 20 Fel Iron Ore$B- 20 Adamantite Ore',
    `QuestCompletionLog` = 'Return the ore to Krugosh at Thrallmar',
    `RewardItem1` = 57402,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90035, -- Requires Artisan tier
    `ExclusiveGroup` = 90043;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Strength honors this exchange. Your old Artisan pick served well in Azeroth. This Master pick will help you extract Outland''s bounty more fully.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the Outland ore and your old Artisan pick, friend?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- Quest 90114 removed: no Mining trainer exists in Shattrath.
-- Master tier is Alliance (Honor Hold, 90043) + Horde (Thrallmar, 90044) only.

-- =====================================================
-- GRAND MASTER MINING PICK QUEST (375+ Mining)
-- 20 Cobalt Ore + 20 Saronite Ore
-- Reward: Grand Master Mining Pick (57403)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90045: Dalaran (Jedidiah Handers - 28698)
-- -----------------------------------------------------
SET @quest := 90045;
SET @npc := 28698;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 36909, -- Cobalt Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 36912, -- Saronite Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57402, -- Master Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Mining Pick',
    `LogDescription` = 'Trade in your Master pick and collect ore to exchange for a Grand Master Pick',
    `QuestDescription` = 'Northrend presents new challenges for even master miners. The arctic veins here have stone hard as steel and ore frozen solid in ice - your Master pick will feel sluggish, and you''ll miss valuable ore from each deposit. I have Grand Master picks, the finest tools available. Trade in your old Master pick and bring me 20 Cobalt Ore and 20 Saronite Ore from Northrend''s frozen veins, and the Grand Master pick is yours - forged for maximum yields in the harshest conditions.$B$BRequired:$B- 20 Cobalt Ore$B- 20 Saronite Ore',
    `QuestCompletionLog` = 'Return the ore to Jedidiah Handers in Dalaran',
    `RewardItem1` = 57403,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 186, -- Mining
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90043; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Perfect quality specimens from the frozen wastes! I''ll take that Master pick - you''ve outgrown it. This Grand Master pick is masterfully crafted for Northrend''s brutal conditions. You''ll extract far more from each deposit now!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 20 Cobalt Ore, 20 Saronite Ore, and your old Master pick?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
