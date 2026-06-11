-- =====================================================
-- COOKING POT QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90155-90162) [ExclusiveGroup 90155]
-- Expert: 8 city quests (90163-90170) [ExclusiveGroup 90163]
-- Artisan: 8 city quests (90171-90178) [ExclusiveGroup 90171]
-- Master: 3 Outland quests (90179-90181) [ExclusiveGroup 90179]
-- Grand Master: 1 Dalaran quest (90182)
-- Total: 28 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - City-specific food turn-ins at Journeyman, uniform at Expert+
-- - Turn-in: 10 Food A + 10 Food B per tier (+ old pot for Expert+)
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90155 AND 90182;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90155 AND 90182;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90155 AND 90182;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90155 AND 90182;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90155 AND 90182;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90155 AND 90182;

-- ===================
-- ADD QUESTGIVER + GOSSIP FLAGS TO COOKING TRAINERS
-- ===================
-- Ensure all cooking trainers have GOSSIP (1) + QUESTGIVER (2) for training + quest access
UPDATE `creature_template` SET `npcflag` = `npcflag` | 3 WHERE `entry` IN (
    5482,  -- Stephen Ryback (Stormwind) 81→83
    34785, -- Alnar Whitebough (Exodar) 81→83
    16277, -- Quarelestra (Silvermoon) 81→83
    3026,  -- Aska Mistrunner (Thunder Bluff) 82→83
    19185  -- Jack Trapper (Honor Hold) 81→83
) AND (`npcflag` & 3) != 3; -- Only if missing GOSSIP or QUESTGIVER

-- Aska Mistrunner has no gossip menu - assign standard cooking trainer menu
UPDATE `creature_template` SET `gossip_menu_id` = 5854 WHERE `entry` = 3026 AND `gossip_menu_id` = 0;

-- =====================================================
-- JOURNEYMAN COOKING POT QUESTS (75+ Cooking)
-- City-specific food turn-ins (10x each)
-- Reward: Journeyman Cooking Pot (57900)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90155: Stormwind (Stephen Ryback - 5482)
-- -----------------------------------------------------
SET @quest := 90155;
SET @npc := 5482;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 733, -- Westfall Stew
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 724, -- Goretusk Liver Pie
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'I''m always looking for skilled cooks to fill orders. You want a proper Journeyman Cooking Pot? Bring me 10 Westfall Stew and 10 Goretusk Liver Pie - my kitchen can always use more stock. In return, you''ll get a pot that''ll cut your cooking time in half.$B$BRequired:$B- 10 Westfall Stew$B- 10 Goretusk Liver Pie',
    `QuestCompletionLog` = 'Return to Stephen Ryback in Stormwind',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent dishes. Here''s your Journeyman Cooking Pot - it''ll serve you well as your skills develop.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Westfall Stew and 10 Goretusk Liver Pie?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90156: Ironforge (Daryl Riknussun - 5159)
-- -----------------------------------------------------
SET @quest := 90156;
SET @npc := 5159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2888, -- Beer Basted Boar Ribs
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 6316, -- Loch Frenzy Delight
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'Ach, still cookin'' in that tiny pan? Ye need a proper Journeyman Pot, lad! Tell ye what - bring me 10 Beer Basted Boar Ribs and 10 Loch Frenzy Delight fer me customers, and I''ll set ye up with a real cookin'' pot. Ye''ll be crankin'' out meals twice as fast!$B$BRequired:$B- 10 Beer Basted Boar Ribs$B- 10 Loch Frenzy Delight',
    `QuestCompletionLog` = 'Return to Daryl Riknussun in Ironforge',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Now that''s proper cookin''! Here''s yer pot - treat it well and it''ll serve ye fer a good long while!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those 10 Beer Basted Boar Ribs and 10 Loch Frenzy Delight, have ye?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90157: Darnassus (Alegorn - 4210)
-- -----------------------------------------------------
SET @quest := 90157;
SET @npc := 4210;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 5472, -- Kaldorei Spider Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 3729, -- Soothing Turtle Bisque
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'Your culinary skills grow, but your tools limit your potential. I have a Journeyman Cooking Pot available - crafted from the finest materials. Bring me 10 Kaldorei Spider Kabob and 10 Soothing Turtle Bisque to replenish my stores, and the pot is yours. It will allow your cooking to flow more naturally.$B$BRequired:$B- 10 Kaldorei Spider Kabob$B- 10 Soothing Turtle Bisque',
    `QuestCompletionLog` = 'Return to Alegorn in Darnassus',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These dishes honor the creatures who provided them. May this pot serve you well on your culinary journey.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the dishes I require?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90158: Exodar (Alnar Whitebough - 34785)
-- -----------------------------------------------------
SET @quest := 90158;
SET @npc := 34785;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 2683, -- Crab Cake
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 3665, -- Curiously Tasty Omelet
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'I observe your cooking skills developing well. To progress further, you will need better equipment. I have a Journeyman Cooking Pot prepared for trade. Bring me 10 Crab Cake and 10 Curiously Tasty Omelet for my provisions, and the pot shall be yours. It will greatly improve your cooking efficiency.$B$BRequired:$B- 10 Crab Cake$B- 10 Curiously Tasty Omelet',
    `QuestCompletionLog` = 'Return to Alnar Whitebough in The Exodar',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Well prepared. The Light shines upon your efforts. May this pot aid you in your continued growth as a cook.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the dishes I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90159: Orgrimmar (Zamja - 3399)
-- -----------------------------------------------------
SET @quest := 90159;
SET @npc := 3399;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 5473, -- Scorpid Surprise
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 5479, -- Crispy Lizard Tail
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'Hey mon, you got da skill but not da tools! Zamja got a Journeyman Cookin'' Pot for ya. Bring me 10 Scorpid Surprise and 10 Crispy Lizard Tail - da customers be hungry, ya know? Get me dose dishes and da pot be yours. You gonna cook twice as fast, I promise!$B$BRequired:$B- 10 Scorpid Surprise$B- 10 Crispy Lizard Tail',
    `QuestCompletionLog` = 'Return to Zamja in Orgrimmar',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Ha! Dese smell good, mon! Here be ya Journeyman pot. Now go cook somethin'' amazing!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ya got da 10 Scorpid Surprise and 10 Crispy Lizard Tail, mon?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90160: Thunder Bluff (Aska Mistrunner - 3026)
-- -----------------------------------------------------
SET @quest := 90160;
SET @npc := 3026;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 5474, -- Roasted Kodo Meat
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2680, -- Spiced Wolf Meat
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'The Earth Mother teaches that good food nurtures both body and spirit, friend. Your cooking grows, but your tools hold you back. I have a Journeyman Cooking Pot for you. Bring me 10 Roasted Kodo Meat and 10 Spiced Wolf Meat - the tribe always needs more provisions - and the pot is yours.$B$BRequired:$B- 10 Roasted Kodo Meat$B- 10 Spiced Wolf Meat',
    `QuestCompletionLog` = 'Return to Aska Mistrunner in Thunder Bluff',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother blesses this exchange. These dishes carry the warmth of the land. May your new pot serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the dishes, friend? 10 Roasted Kodo Meat and 10 Spiced Wolf Meat?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90161: Undercity (Eunice Burch - 4552)
-- -----------------------------------------------------
SET @quest := 90161;
SET @npc := 4552;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3220, -- Blood Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12224, -- Crispy Bat Wing
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'Still using that pathetic excuse for a cooking pot? No wonder your meals taste like they''re already dead... again. I have a Journeyman Cooking Pot available. Bring me 10 Blood Sausage and 10 Crispy Bat Wing - don''t ask what I need them for - and the pot is yours. Your cooking will be considerably less... tragic.$B$BRequired:$B- 10 Blood Sausage$B- 10 Crispy Bat Wing',
    `QuestCompletionLog` = 'Return to Eunice Burch in Undercity',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Surprisingly edible. Here''s your pot - do try to make something that doesn''t look like it''s already been digested.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have those dishes I require? 10 Blood Sausage and 10 Crispy Bat Wing?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90162: Silvermoon (Quarelestra - 16277)
-- -----------------------------------------------------
SET @quest := 90162;
SET @npc := 16277;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 27635, -- Lynx Steak
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 27636, -- Bat Bites
    `RequiredItemCount2` = 10,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring local dishes to exchange for a Journeyman Cooking Pot',
    `QuestDescription` = 'Cooking with inferior equipment? How do you expect to produce anything worth serving? I have a Journeyman Cooking Pot of proper quality. Bring me 10 Lynx Steak and 10 Bat Bites to fill a catering order, and I''ll trade it to you. Perhaps then your dishes will approach something resembling acceptable.$B$BRequired:$B- 10 Lynx Steak$B- 10 Bat Bites',
    `QuestCompletionLog` = 'Return to Quarelestra in Silvermoon City',
    `RewardItem1` = 57900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90155;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Adequate quality, I suppose. Here is your pot - now please try to produce something worthy of a Sin''dorei palate.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the 10 Lynx Steak and 10 Bat Bites I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- EXPERT COOKING POT QUESTS (150+ Cooking)
-- 10 Seasoned Wolf Kabob + 10 Succulent Pork Ribs + old pot
-- Reward: Expert Cooking Pot (57901)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90163: Stormwind (Stephen Ryback - 5482)
-- -----------------------------------------------------
SET @quest := 90163;
SET @npc := 5482;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Your Journeyman pot has served you well, but an expert cook needs expert tools. I have an Expert Cooking Pot available - trade in your old Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs for my kitchen stores, and the Expert pot is yours. You''ll notice the difference immediately.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Stephen Ryback in Stormwind',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Quality dishes, well prepared. I''ll take that old Journeyman pot off your hands. Here''s your Expert Cooking Pot - you''ll feel the difference right away.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Seasoned Wolf Kabob, 10 Succulent Pork Ribs, and your old Journeyman pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90164: Ironforge (Daryl Riknussun - 5159)
-- -----------------------------------------------------
SET @quest := 90164;
SET @npc := 5159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Ready fer an upgrade, are ye? That Journeyman pot''s not gonna cut it anymore! I''ve got an Expert Cookin'' Pot here - proper dwarven quality. Trade in yer old Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs fer me stock, and this beauty''s yers!$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Daryl Riknussun in Ironforge',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Aye, proper tasty! I''ll take that old Journeyman pot. Here''s yer Expert pot - finest pot ye''ll find in Ironforge!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those kabobs, ribs, and yer old Journeyman pot? 10 Seasoned Wolf Kabob, 10 Succulent Pork Ribs, and the old pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90165: Darnassus (Alegorn - 4210)
-- -----------------------------------------------------
SET @quest := 90165;
SET @npc := 4210;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Your skills have grown beyond what a Journeyman pot can offer. I have an Expert Cooking Pot, forged with greater care. Return your old Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs for my supplies. The improved pot will allow your culinary art to flourish.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Alegorn in Darnassus',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'These dishes speak of growing mastery. I accept your old Journeyman pot in trade. May this Expert pot guide your culinary journey forward.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the dishes and your old Journeyman pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90166: Exodar (Alnar Whitebough - 34785)
-- -----------------------------------------------------
SET @quest := 90166;
SET @npc := 34785;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Your progress is commendable. The Journeyman pot has served its purpose, but expert-level cooking demands finer tools. I have an Expert Cooking Pot available. Trade in your old Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs, and the Expert pot shall be yours.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Alnar Whitebough in The Exodar',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Well done. I shall take your Journeyman pot. This Expert Cooking Pot will serve you well as your skills continue to develop.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the dishes and your old Journeyman pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90167: Orgrimmar (Zamja - 3399)
-- -----------------------------------------------------
SET @quest := 90167;
SET @npc := 3399;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Ya outgrown dat little pot, mon! Time for somethin'' bigger. Zamja got an Expert Cookin'' Pot right here. Give me dat old Journeyman pot and bring 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs, and da Expert pot be yours. Ya gonna cook like a proper chef now!$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Zamja in Orgrimmar',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Ha, dese be tasty! Give Zamja dat old pot. Here be ya Expert pot - now ya really cookin'', mon!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ya got da 10 Seasoned Wolf Kabob, 10 Succulent Pork Ribs, and ya old pot, mon?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90168: Thunder Bluff (Aska Mistrunner - 3026)
-- -----------------------------------------------------
SET @quest := 90168;
SET @npc := 3026;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Your journey as a cook continues upward, friend. The Journeyman pot has taught you well, but the next step requires an Expert Cooking Pot. Trade in your old pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs for the tribe''s stores. The Expert pot will serve you on the next stage of your path.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Aska Mistrunner in Thunder Bluff',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The spirits approve of this exchange. Your old Journeyman pot served its purpose well. This Expert pot will carry you further on your path.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the dishes and your old Journeyman pot, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90169: Undercity (Eunice Burch - 4552)
-- -----------------------------------------------------
SET @quest := 90169;
SET @npc := 4552;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Oh, you''re still here? I suppose that Journeyman pot hasn''t completely fallen apart yet. How fortunate. I have an Expert Cooking Pot available - give me that worn-out Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs, and I''ll trade. Your cooking might even become... tolerable.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Eunice Burch in Undercity',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Not entirely terrible. I''ll take that worn-out Journeyman pot. Here''s your Expert pot - perhaps now you''ll produce something I''d actually consider eating.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have those dishes and that old Journeyman pot I asked for?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90170: Silvermoon (Quarelestra - 16277)
-- -----------------------------------------------------
SET @quest := 90170;
SET @npc := 16277;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 35,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 1017, -- Seasoned Wolf Kabob
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 2685, -- Succulent Pork Ribs
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57900, -- Journeyman Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Journeyman pot and bring dishes to exchange for an Expert Cooking Pot',
    `QuestDescription` = 'Still using a Journeyman pot for expert-level recipes? No wonder the results are so... pedestrian. I have an Expert Cooking Pot of proper Sin''dorei craftsmanship. Relinquish that inferior Journeyman pot and bring me 10 Seasoned Wolf Kabob and 10 Succulent Pork Ribs, and the Expert pot is yours.$B$BRequired:$B- 10 Seasoned Wolf Kabob$B- 10 Succulent Pork Ribs',
    `QuestCompletionLog` = 'Return to Quarelestra in Silvermoon City',
    `RewardItem1` = 57901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 150,
    `PrevQuestID` = 90155, -- Requires Journeyman tier
    `ExclusiveGroup` = 90163;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Passable, I suppose. Give me that inferior Journeyman pot. Here is your Expert pot - do try to produce dishes worthy of it.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the dishes and that inferior Journeyman pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN COOKING POT QUESTS (225+ Cooking)
-- 10 Spider Sausage + 10 Monster Omelet + old pot
-- Reward: Artisan Cooking Pot (57902)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90171: Stormwind (Stephen Ryback - 5482)
-- -----------------------------------------------------
SET @quest := 90171;
SET @npc := 5482;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Expert-level work, but still using an Expert pot? Time for an upgrade. I''ve acquired an Artisan Cooking Pot - professional grade equipment. Trade in your old Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet for my kitchen, and the Artisan pot is yours. This is what the serious cooks use.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Stephen Ryback in Stormwind',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent work. These are proper artisan-level dishes. I''ll take that Expert pot - here''s your Artisan Cooking Pot. Professional grade equipment for professional-level cooking.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Spider Sausage, 10 Monster Omelet, and your old Expert pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90172: Ironforge (Daryl Riknussun - 5159)
-- -----------------------------------------------------
SET @quest := 90172;
SET @npc := 5159;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Yer cookin''s gettin'' proper good, but that Expert pot''s holdin'' ye back! Got an Artisan Cookin'' Pot here - real heavy-duty craftsmanship. Trade in yer Expert pot and fetch me 10 Spider Sausage and 10 Monster Omelet, and this Artisan pot''s yers. Best pot this side o'' the mountain!$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Daryl Riknussun in Ironforge',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Now that''s what I call cookin''! I''ll take that Expert pot off yer hands. Here''s yer Artisan pot - heavy dwarven iron, built to last a lifetime!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those sausages, omelets, and yer old Expert pot? 10 Spider Sausage, 10 Monster Omelet, and the old pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90173: Darnassus (Alegorn - 4210)
-- -----------------------------------------------------
SET @quest := 90173;
SET @npc := 4210;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Your culinary mastery deepens, like roots reaching for ancient waters. The Expert pot has guided you well, but artisan-level cooking demands a vessel of greater refinement. I have an Artisan Cooking Pot available. Trade in your old Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet, and the Artisan pot is yours.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Alegorn in Darnassus',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Your culinary art has truly blossomed. I accept your Expert pot. This Artisan Cooking Pot was crafted with the patience of the ancients - may it serve you well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the dishes and your old Expert pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90174: Exodar (Alnar Whitebough - 34785)
-- -----------------------------------------------------
SET @quest := 90174;
SET @npc := 34785;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Your culinary skills continue to impress. The Expert pot served well, but artisan mastery requires superior tools. I have an Artisan Cooking Pot prepared. Trade in your old Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet, and the Artisan pot shall be yours. The Light guides your progress.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Alnar Whitebough in The Exodar',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Light shines on your culinary progress. I shall take your Expert pot. This Artisan Cooking Pot represents a significant step forward in your craft.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the dishes and your old Expert pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90175: Orgrimmar (Zamja - 3399)
-- -----------------------------------------------------
SET @quest := 90175;
SET @npc := 3399;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Look at you, cookin'' up a storm! But dat Expert pot not gonna handle da big recipes. Zamja got an Artisan Cookin'' Pot - heavy iron, built to last. Give me da old Expert pot and bring 10 Spider Sausage and 10 Monster Omelet, and dis beast of a pot be yours!$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Zamja in Orgrimmar',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Woo, dat''s some serious cookin''! Give Zamja da Expert pot. Here - dis Artisan pot gonna make ya da best cook in Orgrimmar!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Ya got da 10 Spider Sausage, 10 Monster Omelet, and ya old pot, mon?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90176: Thunder Bluff (Aska Mistrunner - 3026)
-- -----------------------------------------------------
SET @quest := 90176;
SET @npc := 3026;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'The spirits of the land smile upon your cooking, friend. You have outgrown the Expert pot, and the time has come for artisan tools. I have an Artisan Cooking Pot blessed by the Earth Mother herself. Trade in your Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet for the tribe. The Artisan pot will honor your craft.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Aska Mistrunner in Thunder Bluff',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'The Earth Mother surely guided your hands in preparing these dishes. I accept your Expert pot. This Artisan pot was blessed at the Spirit Rise - it will honor your cooking.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the dishes and your old Expert pot, friend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90177: Undercity (Eunice Burch - 4552)
-- -----------------------------------------------------
SET @quest := 90177;
SET @npc := 4552;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'My, my... you''ve actually improved. How unexpected. That Expert pot is looking rather pathetic for your level of work though, isn''t it? I have an Artisan Cooking Pot available. Hand over that tired Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet. The Artisan pot will make your cooking almost... impressive.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Eunice Burch in Undercity',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'I''m actually... somewhat impressed. Don''t let it go to your head. Take your Artisan pot and hand over that Expert one before it falls apart entirely.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have those dishes and that old Expert pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90178: Silvermoon (Quarelestra - 16277)
-- -----------------------------------------------------
SET @quest := 90178;
SET @npc := 16277;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 17222, -- Spider Sausage
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 12218, -- Monster Omelet
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57901, -- Expert Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Trade in your Expert pot and bring dishes to exchange for an Artisan Cooking Pot',
    `QuestDescription` = 'Your cooking has improved beyond my initial expectations, I must admit. That Expert pot is wholly inadequate for artisan-level work, however. I have an Artisan Cooking Pot of exquisite quality. Surrender that inferior Expert pot and bring me 10 Spider Sausage and 10 Monster Omelet, and the Artisan pot is yours.$B$BRequired:$B- 10 Spider Sausage$B- 10 Monster Omelet',
    `QuestCompletionLog` = 'Return to Quarelestra in Silvermoon City',
    `RewardItem1` = 57902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90163, -- Requires Expert tier
    `ExclusiveGroup` = 90171;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Surprisingly refined for someone of your... background. I''ll take that Expert pot. Here is your Artisan Cooking Pot - crafted to Sin''dorei standards of excellence.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you acquired the dishes and that inferior Expert pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER COOKING POT QUESTS (300+ Cooking)
-- 10 Warp Burger + 10 Talbuk Steak + old pot
-- Reward: Master Cooking Pot (57903)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90179: Shattrath (The Rokk - 24393)
-- -----------------------------------------------------
SET @quest := 90179;
SET @npc := 24393;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 27659, -- Warp Burger
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 27660, -- Talbuk Steak
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57902, -- Artisan Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring 10 Warp Burgers, 10 Talbuk Steaks and your Artisan Cooking Pot to The Rokk in Shattrath.',
    `QuestDescription` = 'Welcome to Outland, cook! The ingredients here are unlike anything from Azeroth - exotic, dangerous, and absolutely delicious! Your Artisan pot will struggle with these new materials. I have a Master Cooking Pot built for Outland''s unique ingredients. Trade in your old Artisan pot and bring me 10 Warp Burger and 10 Talbuk Steak, and the Master pot is yours. Trust me, you''ll need it!$B$BRequired:$B- 10 Warp Burger$B- 10 Talbuk Steak$B- Artisan Cooking Pot',
    `QuestCompletionLog` = 'Return to The Rokk in Shattrath City',
    `RewardItem1` = 57903,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90171, -- Requires Artisan tier
    `ExclusiveGroup` = 90179;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Now THAT''S what I call Outland cooking! These warp burgers are perfect. I''ll take that Artisan pot. Here''s your Master Cooking Pot - with this, you can handle any ingredient Outland throws at you!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Warp Burger, 10 Talbuk Steak, and your old Artisan pot?';

-- The Rokk needs GOSSIP + QUESTGIVER flags for quest access
UPDATE `creature_template` SET `npcflag` = `npcflag` | 3 WHERE `entry` = @npc AND (`npcflag` & 3) != 3;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90180: Honor Hold (Jack Trapper - 19185) Alliance
-- -----------------------------------------------------
SET @quest := 90180;
SET @npc := 19185;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 27659, -- Warp Burger
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 27660, -- Talbuk Steak
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57902, -- Artisan Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring 10 Warp Burgers, 10 Talbuk Steaks and your Artisan Cooking Pot to Jack Trapper in Shattrath''s Lower City.',
    `QuestDescription` = 'A cook from Azeroth? Good - the Lower City''s soup lines never get shorter. Your Artisan pot won''t keep up with crowds like these. I have a Master Cooking Pot that can feed a refugee district without scorching the bottom. Trade in your old pot and bring me Warp Burgers and Talbuk Steaks for the line, and it''s yours.$B$BRequired:$B- 10 Warp Burger$B- 10 Talbuk Steak$B- Artisan Cooking Pot',
    `QuestCompletionLog` = 'Return to Jack Trapper in Honor Hold',
    `RewardItem1` = 57903,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90171, -- Requires Artisan tier
    `ExclusiveGroup` = 90179;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good work, soldier. The mess hall appreciates the contribution. I''ll take that Artisan pot. Here''s your Master pot - built for Outland''s tough ingredients.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got the 10 Warp Burger, 10 Talbuk Steak, and your old Artisan pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90181: Thrallmar (Cookie One-Eye - 16585) Horde
-- -----------------------------------------------------
SET @quest := 90181;
SET @npc := 16585;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 27659, -- Warp Burger
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 27660, -- Talbuk Steak
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57902, -- Artisan Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring 10 Warp Burgers, 10 Talbuk Steaks and your Artisan Cooking Pot to Cookie One-Eye at Thrallmar in Hellfire Peninsula.',
    `QuestDescription` = 'Another cook, eh? Good. Thrallmar''s troops need feeding and your Artisan pot ain''t up to the task out here. I got a Master Cooking Pot - built tough for Outland ingredients. Give me that old Artisan pot and bring 10 Warp Burger and 10 Talbuk Steak for the troops, and the Master pot''s yours. Cook hard or go home.$B$BRequired:$B- 10 Warp Burger$B- 10 Talbuk Steak$B- Artisan Cooking Pot',
    `QuestCompletionLog` = 'Return to Cookie One-Eye in Thrallmar',
    `RewardItem1` = 57903,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90171, -- Requires Artisan tier
    `ExclusiveGroup` = 90179;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Solid cooking. Give me that Artisan pot. Here''s your Master pot - heavy iron, won''t crack under Outland heat. Now get back to cooking for the troops.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those 10 Warp Burger, 10 Talbuk Steak, and your old Artisan pot?';

-- Cookie One-Eye needs GOSSIP + QUESTGIVER flags for quest access
UPDATE `creature_template` SET `npcflag` = `npcflag` | 3 WHERE `entry` = @npc AND (`npcflag` & 3) != 3;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER COOKING POT QUEST (375+ Cooking)
-- 10 Dragonfin Filet + 10 Imperial Manta Steak + old pot
-- Reward: Grand Master Cooking Pot (57904)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90182: Dalaran (Katherine Lee - 28705)
-- -----------------------------------------------------
SET @quest := 90182;
SET @npc := 28705;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = -304, -- Cooking
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 43000, -- Dragonfin Filet
    `RequiredItemCount1` = 10,
    `RequiredItemId2` = 34769, -- Imperial Manta Steak
    `RequiredItemCount2` = 10,
    `RequiredItemId3` = 57903, -- Master Cooking Pot (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Cook''s Pot',
    `LogDescription` = 'Bring 10 Dragonfin Filets, 10 Imperial Manta Steaks and your Master Cooking Pot to Katherine Lee in Dalaran.',
    `QuestDescription` = 'Northrend''s ingredients are among the finest - and most challenging - in all of Azeroth. Your Master pot has served admirably, but grand master-level cooking demands the ultimate in equipment. I have a Grand Master Cooking Pot, the finest available. Trade in your old Master pot and bring me 10 Dragonfin Filet and 10 Imperial Manta Steak - Northrend''s signature dishes - and the Grand Master pot is yours.$B$BRequired:$B- 10 Dragonfin Filet$B- 10 Imperial Manta Steak$B- Master Cooking Pot',
    `QuestCompletionLog` = 'Return to Katherine Lee in Dalaran',
    `RewardItem1` = 57904,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 185, -- Cooking
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90179; -- Requires Master tier

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Magnificent! The dragonfin and manta steak are perfectly prepared. I''ll take that Master pot. This Grand Master Cooking Pot is the finest available - there are none better. Use it well in your grand master endeavors.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the 10 Dragonfin Filet, 10 Imperial Manta Steak, and your old Master pot?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- CROSS-CITY QUEST CHAIN FIX
-- PrevQuestID only checks the exact quest ID, not the
-- ExclusiveGroup. Replace with reference conditions so
-- completing ANY city's quest unlocks the next tier.
-- =====================================================

UPDATE `quest_template_addon` SET `PrevQuestID` = 0
    WHERE `ID` BETWEEN 90163 AND 90182;

-- Reference condition -90155: completed ANY Journeyman cooking pot quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90155;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90155, 0, 0, 0, 0, 8, 0, 90155, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Stormwind)'),
(-90155, 0, 0, 0, 1, 8, 0, 90156, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Ironforge)'),
(-90155, 0, 0, 0, 2, 8, 0, 90157, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Darnassus)'),
(-90155, 0, 0, 0, 3, 8, 0, 90158, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Exodar)'),
(-90155, 0, 0, 0, 4, 8, 0, 90159, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Orgrimmar)'),
(-90155, 0, 0, 0, 5, 8, 0, 90160, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Thunder Bluff)'),
(-90155, 0, 0, 0, 6, 8, 0, 90161, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Undercity)'),
(-90155, 0, 0, 0, 7, 8, 0, 90162, 0, 0, 0, 0, 0, '', 'JM pot rewarded (Silvermoon)');

-- Reference condition -90163: completed ANY Expert cooking pot quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90163;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90163, 0, 0, 0, 0, 8, 0, 90163, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Stormwind)'),
(-90163, 0, 0, 0, 1, 8, 0, 90164, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Ironforge)'),
(-90163, 0, 0, 0, 2, 8, 0, 90165, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Darnassus)'),
(-90163, 0, 0, 0, 3, 8, 0, 90166, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Exodar)'),
(-90163, 0, 0, 0, 4, 8, 0, 90167, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Orgrimmar)'),
(-90163, 0, 0, 0, 5, 8, 0, 90168, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Thunder Bluff)'),
(-90163, 0, 0, 0, 6, 8, 0, 90169, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Undercity)'),
(-90163, 0, 0, 0, 7, 8, 0, 90170, 0, 0, 0, 0, 0, '', 'Expert pot rewarded (Silvermoon)');

-- Reference condition -90171: completed ANY Artisan cooking pot quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90171;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90171, 0, 0, 0, 0, 8, 0, 90171, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Stormwind)'),
(-90171, 0, 0, 0, 1, 8, 0, 90172, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Ironforge)'),
(-90171, 0, 0, 0, 2, 8, 0, 90173, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Darnassus)'),
(-90171, 0, 0, 0, 3, 8, 0, 90174, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Exodar)'),
(-90171, 0, 0, 0, 4, 8, 0, 90175, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Orgrimmar)'),
(-90171, 0, 0, 0, 5, 8, 0, 90176, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Thunder Bluff)'),
(-90171, 0, 0, 0, 6, 8, 0, 90177, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Undercity)'),
(-90171, 0, 0, 0, 7, 8, 0, 90178, 0, 0, 0, 0, 0, '', 'Artisan pot rewarded (Silvermoon)');

-- Reference condition -90179: completed ANY Master cooking pot quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90179;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90179, 0, 0, 0, 0, 8, 0, 90179, 0, 0, 0, 0, 0, '', 'Master pot rewarded (Shattrath)'),
(-90179, 0, 0, 0, 1, 8, 0, 90180, 0, 0, 0, 0, 0, '', 'Master pot rewarded (Honor Hold)'),
(-90179, 0, 0, 0, 2, 8, 0, 90181, 0, 0, 0, 0, 0, '', 'Master pot rewarded (Thrallmar)');

-- Expert quests: require any Journeyman pot
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90163 AND 90170;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90163, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (SW) - any JM pot'),
(19, 0, 90164, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (IF) - any JM pot'),
(19, 0, 90165, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (Darn) - any JM pot'),
(19, 0, 90166, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (Exo) - any JM pot'),
(19, 0, 90167, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (Org) - any JM pot'),
(19, 0, 90168, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (TB) - any JM pot'),
(19, 0, 90169, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (UC) - any JM pot'),
(19, 0, 90170, 0, 0, -90155, 0, 0, 0, 0, 0, 0, 0, '', 'Expert Pot (SM) - any JM pot');

-- Artisan quests: require any Expert pot
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90171 AND 90178;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90171, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (SW) - any Expert pot'),
(19, 0, 90172, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (IF) - any Expert pot'),
(19, 0, 90173, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (Darn) - any Expert pot'),
(19, 0, 90174, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (Exo) - any Expert pot'),
(19, 0, 90175, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (Org) - any Expert pot'),
(19, 0, 90176, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (TB) - any Expert pot'),
(19, 0, 90177, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (UC) - any Expert pot'),
(19, 0, 90178, 0, 0, -90163, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Pot (SM) - any Expert pot');

-- Master quests: require any Artisan pot
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90179, 90180, 90181);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90179, 0, 0, -90171, 0, 0, 0, 0, 0, 0, 0, '', 'Master Pot (Shat) - any Artisan pot'),
(19, 0, 90180, 0, 0, -90171, 0, 0, 0, 0, 0, 0, 0, '', 'Master Pot (HH) - any Artisan pot'),
(19, 0, 90181, 0, 0, -90171, 0, 0, 0, 0, 0, 0, 0, '', 'Master Pot (Thrall) - any Artisan pot');

-- Grand Master quest: require any Master pot
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90182;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90182, 0, 0, -90179, 0, 0, 0, 0, 0, 0, 0, '', 'GM Pot (Dalaran) - any Master pot');

-- =====================================================
-- QUEST POIs - turn-in map markers [I-195]
-- One blob per quest at the quest ender (trainer) spawn
-- =====================================================
DELETE FROM `quest_poi` WHERE `QuestID` IN (90155,90156,90157,90158,90159,90160,90161,90162,90163,90164,90165,90166,90167,90168,90169,90170,90171,90172,90173,90174,90175,90176,90177,90178,90179,90180,90181,90182);
DELETE FROM `quest_poi_points` WHERE `QuestID` IN (90155,90156,90157,90158,90159,90160,90161,90162,90163,90164,90165,90166,90167,90168,90169,90170,90171,90172,90173,90174,90175,90176,90177,90178,90179,90180,90181,90182);

INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
(90155, 0, -1, 0, 301, 0, 0, 1, 0),
(90156, 0, -1, 0, 341, 0, 0, 1, 0),
(90157, 0, -1, 1, 381, 0, 0, 1, 0),
(90158, 0, -1, 1, 471, 0, 0, 1, 0),
(90159, 0, -1, 1, 321, 0, 0, 1, 0),
(90160, 0, -1, 1, 362, 0, 0, 1, 0),
(90161, 0, -1, 0, 382, 0, 0, 1, 0),
(90162, 0, -1, 0, 480, 0, 0, 1, 0),
(90163, 0, -1, 0, 301, 0, 0, 1, 0),
(90164, 0, -1, 0, 341, 0, 0, 1, 0),
(90165, 0, -1, 1, 381, 0, 0, 1, 0),
(90166, 0, -1, 1, 471, 0, 0, 1, 0),
(90167, 0, -1, 1, 321, 0, 0, 1, 0),
(90168, 0, -1, 1, 362, 0, 0, 1, 0),
(90169, 0, -1, 0, 382, 0, 0, 1, 0),
(90170, 0, -1, 0, 480, 0, 0, 1, 0),
(90171, 0, -1, 0, 301, 0, 0, 1, 0),
(90172, 0, -1, 0, 341, 0, 0, 1, 0),
(90173, 0, -1, 1, 381, 0, 0, 1, 0),
(90174, 0, -1, 1, 471, 0, 0, 1, 0),
(90175, 0, -1, 1, 321, 0, 0, 1, 0),
(90176, 0, -1, 1, 362, 0, 0, 1, 0),
(90177, 0, -1, 0, 382, 0, 0, 1, 0),
(90178, 0, -1, 0, 480, 0, 0, 1, 0),
(90179, 0, -1, 530, 481, 0, 0, 1, 0),
(90180, 0, -1, 530, 481, 0, 0, 1, 0),
(90181, 0, -1, 530, 465, 0, 0, 1, 0),
(90182, 0, -1, 571, 510, 0, 0, 1, 0),
(90182, 1, -1, 571, 504, 1, 0, 3, 0);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(90155, 0, 0, -8631, 345, 0),
(90155, 0, 1, -8631, 385, 0),
(90155, 0, 2, -8591, 385, 0),
(90155, 0, 3, -8591, 345, 0),
(90156, 0, 0, -4781, -1209, 0),
(90156, 0, 1, -4781, -1169, 0),
(90156, 0, 2, -4741, -1169, 0),
(90156, 0, 3, -4741, -1209, 0),
(90157, 0, 0, 10068, 2399, 0),
(90157, 0, 1, 10068, 2439, 0),
(90157, 0, 2, 10108, 2439, 0),
(90157, 0, 3, 10108, 2399, 0),
(90158, 0, 0, 5573, 6273, 0),
(90158, 0, 1, 5573, 6313, 0),
(90158, 0, 2, 5613, 6313, 0),
(90158, 0, 3, 5613, 6273, 0),
(90159, 0, 0, 1749, -4506, 0),
(90159, 0, 1, 1749, -4466, 0),
(90159, 0, 2, 1789, -4466, 0),
(90159, 0, 3, 1789, -4506, 0),
(90160, 0, 0, -1240, -33, 0),
(90160, 0, 1, -1240, 7, 0),
(90160, 0, 2, -1200, 7, 0),
(90160, 0, 3, -1200, -33, 0),
(90161, 0, 0, 1570, 257, 0),
(90161, 0, 1, 1570, 297, 0),
(90161, 0, 2, 1610, 297, 0),
(90161, 0, 3, 1610, 257, 0),
(90162, 0, 0, 7342, -4766, 0),
(90162, 0, 1, 7342, -4726, 0),
(90162, 0, 2, 7382, -4726, 0),
(90162, 0, 3, 7382, -4766, 0),
(90163, 0, 0, -8631, 345, 0),
(90163, 0, 1, -8631, 385, 0),
(90163, 0, 2, -8591, 385, 0),
(90163, 0, 3, -8591, 345, 0),
(90164, 0, 0, -4781, -1209, 0),
(90164, 0, 1, -4781, -1169, 0),
(90164, 0, 2, -4741, -1169, 0),
(90164, 0, 3, -4741, -1209, 0),
(90165, 0, 0, 10068, 2399, 0),
(90165, 0, 1, 10068, 2439, 0),
(90165, 0, 2, 10108, 2439, 0),
(90165, 0, 3, 10108, 2399, 0),
(90166, 0, 0, 5573, 6273, 0),
(90166, 0, 1, 5573, 6313, 0),
(90166, 0, 2, 5613, 6313, 0),
(90166, 0, 3, 5613, 6273, 0),
(90167, 0, 0, 1749, -4506, 0),
(90167, 0, 1, 1749, -4466, 0),
(90167, 0, 2, 1789, -4466, 0),
(90167, 0, 3, 1789, -4506, 0),
(90168, 0, 0, -1240, -33, 0),
(90168, 0, 1, -1240, 7, 0),
(90168, 0, 2, -1200, 7, 0),
(90168, 0, 3, -1200, -33, 0),
(90169, 0, 0, 1570, 257, 0),
(90169, 0, 1, 1570, 297, 0),
(90169, 0, 2, 1610, 297, 0),
(90169, 0, 3, 1610, 257, 0),
(90170, 0, 0, 7342, -4766, 0),
(90170, 0, 1, 7342, -4726, 0),
(90170, 0, 2, 7382, -4726, 0),
(90170, 0, 3, 7382, -4766, 0),
(90171, 0, 0, -8631, 345, 0),
(90171, 0, 1, -8631, 385, 0),
(90171, 0, 2, -8591, 385, 0),
(90171, 0, 3, -8591, 345, 0),
(90172, 0, 0, -4781, -1209, 0),
(90172, 0, 1, -4781, -1169, 0),
(90172, 0, 2, -4741, -1169, 0),
(90172, 0, 3, -4741, -1209, 0),
(90173, 0, 0, 10068, 2399, 0),
(90173, 0, 1, 10068, 2439, 0),
(90173, 0, 2, 10108, 2439, 0),
(90173, 0, 3, 10108, 2399, 0),
(90174, 0, 0, 5573, 6273, 0),
(90174, 0, 1, 5573, 6313, 0),
(90174, 0, 2, 5613, 6313, 0),
(90174, 0, 3, 5613, 6273, 0),
(90175, 0, 0, 1749, -4506, 0),
(90175, 0, 1, 1749, -4466, 0),
(90175, 0, 2, 1789, -4466, 0),
(90175, 0, 3, 1789, -4506, 0),
(90176, 0, 0, -1240, -33, 0),
(90176, 0, 1, -1240, 7, 0),
(90176, 0, 2, -1200, 7, 0),
(90176, 0, 3, -1200, -33, 0),
(90177, 0, 0, 1570, 257, 0),
(90177, 0, 1, 1570, 297, 0),
(90177, 0, 2, 1610, 297, 0),
(90177, 0, 3, 1610, 257, 0),
(90178, 0, 0, 7342, -4766, 0),
(90178, 0, 1, 7342, -4726, 0),
(90178, 0, 2, 7382, -4726, 0),
(90178, 0, 3, 7382, -4766, 0),
(90179, 0, 0, -1629, 5309, 0),
(90179, 0, 1, -1629, 5349, 0),
(90179, 0, 2, -1589, 5349, 0),
(90179, 0, 3, -1589, 5309, 0),
(90180, 0, 0, -2087, 5297, 0),
(90180, 0, 1, -2087, 5337, 0),
(90180, 0, 2, -2047, 5337, 0),
(90180, 0, 3, -2047, 5297, 0),
(90181, 0, 0, 42, 2699, 0),
(90181, 0, 1, 42, 2739, 0),
(90181, 0, 2, 82, 2739, 0),
(90181, 0, 3, 82, 2699, 0),
(90182, 0, 0, 5688, 696, 0),
(90182, 0, 1, 5688, 736, 0),
(90182, 0, 2, 5728, 736, 0),
(90182, 0, 3, 5728, 696, 0),
(90182, 1, 0, 5688, 696, 0),
(90182, 1, 1, 5688, 736, 0),
(90182, 1, 2, 5728, 736, 0),
(90182, 1, 3, 5728, 696, 0);
