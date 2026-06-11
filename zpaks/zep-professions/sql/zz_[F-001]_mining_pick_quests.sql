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
-- Reward: Journeyman Mining Pick (57700)
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
    `RewardItem1` = 57700,
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
-- Reward: Artisan Mining Pick (57701)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90035: Stormwind (Gelman Stonehand - 5513)
-- -----------------------------------------------------
SET @quest := 90035;
SET @npc := 5513;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Your skills are growing, but that Journeyman pick is chipping on harder veins - you''re missing extra ore from each deposit. I have Artisan picks here. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore for my stock, and the Artisan pick is yours. Your yield will increase considerably.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Gelman Stonehand in Stormwind',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Yer outgrowin'' that Journeyman pick, I see! It''s chippin'' on the harder veins - yer missin'' ore ye could be gettin''! Time fer an upgrade, aye? Trade in yer old pick and fetch me 20 Mithril Ore and 20 Thorium Ore fer me forge, and this Artisan pick is yers. Ye''ll be pullin'' twice as much from each vein.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Geofram Bouldertoe in Ironforge',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Your craft deepens, friend. The Journeyman pick has served well, but I see it struggling with harder stone now - you lose precious ore from each vein. I have Artisan picks available. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore for my work, and the Artisan pick is yours. The veins will yield more generously to sharper tools.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Borin Irondelve in Darnassus',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'I see your mastery grows. That Journeyman pick served its purpose, but it struggles with tougher veins now - you lose valuable material with each extraction. I have Artisan picks available. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore to replenish my workshop, and I will trade one to you. The Light will guide your hands to greater yields.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Muaat in the Exodar',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Journeyman pick too weak now. Harder veins. Losing ore. Need better pick. Trade in old Journeyman pick. 20 Mithril Ore, 20 Thorium Ore. Bring. Get Artisan pick. Get more ore from each vein.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Makaru in Orgrimmar',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Friend, your journey continues. The Journeyman pick has guided you well, but I see it chipping on stronger stone - precious ore is lost with each extraction. The Earth Mother teaches that better tools bring harmony with the land. I have Artisan picks for you. Trade in your old Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore from deeper veins, and we shall trade. Your yields will flow more freely.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Brek Stonehoof in Thunder Bluff',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Ah, still struggling with that Journeyman pick? How... wasteful. I see it failing on harder veins - you''re losing valuable ore with each pathetic extraction. I have Artisan picks available. Trade in that inadequate Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore, and your... pitiful... yields will improve considerably.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Brom Killian in Undercity',
    `RewardItem1` = 57701,
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
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -377, -- Mining
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3858, -- Mithril Ore
    `RequiredItemCount1` = 20,
    `RequiredItemId2` = 10620, -- Thorium Ore
    `RequiredItemCount2` = 20,
    `RequiredItemId3` = 57700, -- Journeyman Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Mining Pick',
    `LogDescription` = 'Trade in your Journeyman pick and collect ore to exchange for an Artisan Pick',
    `QuestDescription` = 'Still using Journeyman equipment for artisan-level veins? How do you expect to maximize yields with such inferior tools? I see that dull pick wasting precious material. I have Artisan picks available. Relinquish that inferior Journeyman pick and bring me 20 Mithril Ore and 20 Thorium Ore - quality specimens, please - and we shall trade. Your mining efficiency will improve markedly.$B$BRequired:$B- 20 Mithril Ore$B- 20 Thorium Ore',
    `QuestCompletionLog` = 'Return the ore to Belil in Silvermoon City',
    `RewardItem1` = 57701,
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
-- Reward: Master Mining Pick (57702)
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
    `RequiredItemId3` = 57701, -- Artisan Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Pick',
    `LogDescription` = 'Bring 20 Fel Iron Ore, 20 Adamantite Ore and your Artisan Mining Pick to Hurnak Grimmord at Honor Hold in Hellfire Peninsula.',
    `QuestDescription` = 'Hah! Swingin'' an Azeroth pick at fel iron? Ye''ll chip it tae bits, and good ore with it. I''ve got Master picks forged fer Outland rock. Trade in yer Artisan pick with a haul of local ore, and one''s yers.$B$BRequired:$B- 20 Fel Iron Ore$B- 20 Adamantite Ore$B- Artisan Mining Pick',
    `QuestCompletionLog` = 'Return the ore to Hurnak Grimmord at Honor Hold',
    `RewardItem1` = 57702,
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
    `RequiredItemId3` = 57701, -- Artisan Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master Mining Pick',
    `LogDescription` = 'Bring 20 Fel Iron Ore, 20 Adamantite Ore and your Artisan Mining Pick to Krugosh at Thrallmar in Hellfire Peninsula.',
    `QuestDescription` = 'The stone speaks differently here, $Gbrother:sister;. Outland veins shatter Azeroth picks and swallow the ore. Trade in your Artisan pick with proof you can work these rocks, and a Master pick is yours.$B$BRequired:$B- 20 Fel Iron Ore$B- 20 Adamantite Ore$B- Artisan Mining Pick',
    `QuestCompletionLog` = 'Return the ore to Krugosh at Thrallmar',
    `RewardItem1` = 57702,
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
-- Reward: Grand Master Mining Pick (57703)
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
    `RequiredItemId3` = 57702, -- Master Mining Pick (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master Mining Pick',
    `LogDescription` = 'Bring 20 Cobalt Ore, 20 Saronite Ore and your Master Mining Pick to Jedidiah Handers in Dalaran.',
    `QuestDescription` = 'Northrend ore, friend - cobalt that blunts steel and saronite that fights back. Your Master pick won''t last a season. Trade it in with a sample of northern ore, and I''ll set you up with a Grand Master pick, enchanted to hold its edge.$B$BRequired:$B- 20 Cobalt Ore$B- 20 Saronite Ore$B- Master Mining Pick',
    `QuestCompletionLog` = 'Return the ore to Jedidiah Handers in Dalaran',
    `RewardItem1` = 57703,
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

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Replace with reference conditions so
-- completing ANY city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90035 AND 90045;

-- Reference condition -90027: completed ANY Journeyman pick quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90027;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90027, 0, 0, 0, 0, 8, 0, 90027, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Stormwind)'),
(-90027, 0, 0, 0, 1, 8, 0, 90028, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Ironforge)'),
(-90027, 0, 0, 0, 2, 8, 0, 90029, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Darnassus)'),
(-90027, 0, 0, 0, 3, 8, 0, 90030, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Exodar)'),
(-90027, 0, 0, 0, 4, 8, 0, 90031, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Orgrimmar)'),
(-90027, 0, 0, 0, 5, 8, 0, 90032, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Thunder Bluff)'),
(-90027, 0, 0, 0, 6, 8, 0, 90033, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Undercity)'),
(-90027, 0, 0, 0, 7, 8, 0, 90034, 0, 0, 0, 0, 0, '', 'JM pick rewarded (Silvermoon)');

-- Reference condition -90035: completed ANY Artisan pick quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90035;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90035, 0, 0, 0, 0, 8, 0, 90035, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Stormwind)'),
(-90035, 0, 0, 0, 1, 8, 0, 90036, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Ironforge)'),
(-90035, 0, 0, 0, 2, 8, 0, 90037, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Darnassus)'),
(-90035, 0, 0, 0, 3, 8, 0, 90038, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Exodar)'),
(-90035, 0, 0, 0, 4, 8, 0, 90039, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Orgrimmar)'),
(-90035, 0, 0, 0, 5, 8, 0, 90040, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Thunder Bluff)'),
(-90035, 0, 0, 0, 6, 8, 0, 90041, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Undercity)'),
(-90035, 0, 0, 0, 7, 8, 0, 90042, 0, 0, 0, 0, 0, '', 'Artisan pick rewarded (Silvermoon)');

-- Reference condition -90043: completed ANY Master pick quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90043;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90043, 0, 0, 0, 0, 8, 0, 90043, 0, 0, 0, 0, 0, '', 'Master pick rewarded (HH Alliance)'),
(-90043, 0, 0, 0, 1, 8, 0, 90044, 0, 0, 0, 0, 0, '', 'Master pick rewarded (HH Horde)');

-- Artisan quests: require any Journeyman pick
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90035 AND 90042;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90035, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (SW) - any JM pick'),
(19, 0, 90036, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (IF) - any JM pick'),
(19, 0, 90037, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (Darn) - any JM pick'),
(19, 0, 90038, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (Exo) - any JM pick'),
(19, 0, 90039, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (Org) - any JM pick'),
(19, 0, 90040, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (TB) - any JM pick'),
(19, 0, 90041, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (UC) - any JM pick'),
(19, 0, 90042, 0, 0, -90027, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pick (SM) - any JM pick');

-- Master quests: require any Artisan pick
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90043, 90044);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90043, 0, 0, -90035, 0, 0, 0, 0, 0, 0, 0, '', 'Master Pick (HH Alli) - any Artisan pick'),
(19, 0, 90044, 0, 0, -90035, 0, 0, 0, 0, 0, 0, 0, '', 'Master Pick (HH Horde) - any Artisan pick');

-- Grand Master quest: require any Master pick
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90045;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90045, 0, 0, -90043, 0, 0, 0, 0, 0, 0, 0, '', 'GM Pick (Dalaran) - any Master pick');

-- =====================================================
-- QUEST POIs - turn-in map markers [I-195]
-- One blob per quest at the quest ender (trainer) spawn
-- =====================================================
DELETE FROM `quest_poi` WHERE `QuestID` BETWEEN 90027 AND 90045;
DELETE FROM `quest_poi_points` WHERE `QuestID` BETWEEN 90027 AND 90045;

INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
(90027, 0, -1, 0, 301, 0, 0, 1, 0),
(90028, 0, -1, 0, 341, 0, 0, 1, 0),
(90029, 0, -1, 1, 381, 0, 0, 1, 0),
(90030, 0, -1, 1, 471, 0, 0, 1, 0),
(90031, 0, -1, 1, 321, 0, 0, 1, 0),
(90032, 0, -1, 1, 362, 0, 0, 1, 0),
(90033, 0, -1, 0, 382, 0, 0, 1, 0),
(90034, 0, -1, 0, 480, 0, 0, 1, 0),
(90035, 0, -1, 0, 301, 0, 0, 1, 0),
(90036, 0, -1, 0, 341, 0, 0, 1, 0),
(90037, 0, -1, 1, 381, 0, 0, 1, 0),
(90038, 0, -1, 1, 471, 0, 0, 1, 0),
(90039, 0, -1, 1, 321, 0, 0, 1, 0),
(90040, 0, -1, 1, 362, 0, 0, 1, 0),
(90041, 0, -1, 0, 382, 0, 0, 1, 0),
(90042, 0, -1, 0, 480, 0, 0, 1, 0),
(90043, 0, -1, 530, 465, 0, 0, 1, 0),
(90044, 0, -1, 530, 465, 0, 0, 1, 0),
(90045, 0, -1, 571, 510, 0, 0, 1, 0),
(90045, 1, -1, 571, 504, 1, 0, 3, 0);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(90027, 0, 0, -8454, 673, 0),
(90027, 0, 1, -8454, 713, 0),
(90027, 0, 2, -8414, 713, 0),
(90027, 0, 3, -8414, 673, 0),
(90028, 0, 0, -4728, -1129, 0),
(90028, 0, 1, -4728, -1089, 0),
(90028, 0, 2, -4688, -1089, 0),
(90028, 0, 3, -4688, -1129, 0),
(90029, 0, 0, 9904, 2292, 0),
(90029, 0, 1, 9904, 2332, 0),
(90029, 0, 2, 9944, 2332, 0),
(90029, 0, 3, 9944, 2292, 0),
(90030, 0, 0, 5352, 6416, 0),
(90030, 0, 1, 5352, 6456, 0),
(90030, 0, 2, 5392, 6456, 0),
(90030, 0, 3, 5392, 6416, 0),
(90031, 0, 0, 2010, -4726, 0),
(90031, 0, 1, 2010, -4686, 0),
(90031, 0, 2, 2050, -4686, 0),
(90031, 0, 3, 2050, -4726, 0),
(90032, 0, 0, -1273, 138, 0),
(90032, 0, 1, -1273, 178, 0),
(90032, 0, 2, -1233, 178, 0),
(90032, 0, 3, -1233, 138, 0),
(90033, 0, 0, 1618, 316, 0),
(90033, 0, 1, 1618, 356, 0),
(90033, 0, 2, 1658, 356, 0),
(90033, 0, 3, 1658, 316, 0),
(90034, 0, 0, 7652, -5243, 0),
(90034, 0, 1, 7652, -5203, 0),
(90034, 0, 2, 7692, -5203, 0),
(90034, 0, 3, 7692, -5243, 0),
(90035, 0, 0, -8454, 673, 0),
(90035, 0, 1, -8454, 713, 0),
(90035, 0, 2, -8414, 713, 0),
(90035, 0, 3, -8414, 673, 0),
(90036, 0, 0, -4728, -1129, 0),
(90036, 0, 1, -4728, -1089, 0),
(90036, 0, 2, -4688, -1089, 0),
(90036, 0, 3, -4688, -1129, 0),
(90037, 0, 0, 9904, 2292, 0),
(90037, 0, 1, 9904, 2332, 0),
(90037, 0, 2, 9944, 2332, 0),
(90037, 0, 3, 9944, 2292, 0),
(90038, 0, 0, 5352, 6416, 0),
(90038, 0, 1, 5352, 6456, 0),
(90038, 0, 2, 5392, 6456, 0),
(90038, 0, 3, 5392, 6416, 0),
(90039, 0, 0, 2010, -4726, 0),
(90039, 0, 1, 2010, -4686, 0),
(90039, 0, 2, 2050, -4686, 0),
(90039, 0, 3, 2050, -4726, 0),
(90040, 0, 0, -1273, 138, 0),
(90040, 0, 1, -1273, 178, 0),
(90040, 0, 2, -1233, 178, 0),
(90040, 0, 3, -1233, 138, 0),
(90041, 0, 0, 1618, 316, 0),
(90041, 0, 1, 1618, 356, 0),
(90041, 0, 2, 1658, 356, 0),
(90041, 0, 3, 1658, 316, 0),
(90042, 0, 0, 7652, -5243, 0),
(90042, 0, 1, 7652, -5203, 0),
(90042, 0, 2, 7692, -5203, 0),
(90042, 0, 3, 7692, -5243, 0),
(90043, 0, 0, -738, 2592, 0),
(90043, 0, 1, -738, 2632, 0),
(90043, 0, 2, -698, 2632, 0),
(90043, 0, 3, -698, 2592, 0),
(90044, 0, 0, 167, 2656, 0),
(90044, 0, 1, 167, 2696, 0),
(90044, 0, 2, 207, 2696, 0),
(90044, 0, 3, 207, 2656, 0),
(90045, 0, 0, 5905, 688, 0),
(90045, 0, 1, 5905, 728, 0),
(90045, 0, 2, 5945, 728, 0),
(90045, 0, 3, 5945, 688, 0),
(90045, 1, 0, 5905, 688, 0),
(90045, 1, 1, 5905, 728, 0),
(90045, 1, 2, 5945, 728, 0),
(90045, 1, 3, 5945, 688, 0);
