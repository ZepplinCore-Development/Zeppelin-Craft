-- =====================================================
-- ALCHEMY MORTAR QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90091-90098) [ExclusiveGroup 90091]
-- Artisan: 8 city quests (90099-90106) [ExclusiveGroup 90099]
-- Master: 1 Shattrath quest (90107)
-- Grand Master: 1 Dalaran quest (90108)
-- Total: 18 quests
--
-- Features:
-- - ExclusiveGroup prevents multiple completions per tier
-- - Reputation rewards for city factions (+5 rep each)
-- - Progressive potion requirements matching skill tiers
-- - Turn-in: 5 healing potions + 5 mana potions per tier
-- =====================================================

-- ===================
-- CLEANUP OLD QUESTS
-- ===================
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90091 AND 90108;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90091 AND 90108;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90091 AND 90108;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90091 AND 90108;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90091 AND 90108;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90091 AND 90108;

-- ===================
-- ADD QUESTGIVER FLAG TO TRAINERS
-- ===================
-- Some trainers missing QUESTGIVER (2) flag
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` IN (
    5499,  -- Lilyssia Nightbreeze (Stormwind)
    16723, -- Lucc (Exodar)
    3347,  -- Yelmak (Orgrimmar)
    16642  -- Camberon (Silvermoon)
) AND (`npcflag` & 2) = 0; -- Only if not already set

-- =====================================================
-- JOURNEYMAN ALCHEMY MORTAR QUESTS (75+ Alchemy)
-- 5 Lesser Healing Potion (858) + 5 Lesser Mana Potion (3385)
-- Reward: Journeyman Alchemy Mortar (56900)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90091: Stormwind (Lilyssia Nightbreeze - 5499)
-- -----------------------------------------------------
SET @quest := 90091;
SET @npc := 5499;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Lilyssia Nightbreeze in Stormwind',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90092: Ironforge (Ghak Healtouch - 1470)
-- -----------------------------------------------------
SET @quest := 90092;
SET @npc := 1470;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Ghak Healtouch in Ironforge',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90093: Darnassus (Ainethil - 4160)
-- -----------------------------------------------------
SET @quest := 90093;
SET @npc := 4160;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Ainethil in Darnassus',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90094: Exodar (Lucc - 16723)
-- -----------------------------------------------------
SET @quest := 90094;
SET @npc := 16723;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Lucc in the Exodar',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90095: Orgrimmar (Yelmak - 3347)
-- -----------------------------------------------------
SET @quest := 90095;
SET @npc := 3347;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Yelmak in Orgrimmar',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90096: Thunder Bluff (Bena Winterhoof - 3009)
-- -----------------------------------------------------
SET @quest := 90096;
SET @npc := 3009;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Bena Winterhoof in Thunder Bluff',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90097: Undercity (Doctor Herbert Halsey - 4611)
-- -----------------------------------------------------
SET @quest := 90097;
SET @npc := 4611;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Doctor Herbert Halsey in Undercity',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90098: Silvermoon (Camberon - 16642)
-- -----------------------------------------------------
SET @quest := 90098;
SET @npc := 16642;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 20,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 858, -- Lesser Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 3385, -- Lesser Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Alchemist''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Journeyman Alchemy Mortar',
    `QuestDescription` = 'Still grinding reagents with your bare hands? That''s no way to practice alchemy. Bring me some lesser healing and mana potions to prove your skill, and I''ll provide you with a proper mortar that''ll speed up your brewing considerably.',
    `QuestCompletionLog` = 'Return the potions to Camberon in Silvermoon City',
    `RewardItem1` = 56900,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 75,
    `ExclusiveGroup` = 90091;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar will serve you well. Now get back to your cauldron!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- ARTISAN ALCHEMY MORTAR QUESTS (225+ Alchemy)
-- 5 Superior Healing Potion (3928) + 5 Superior Mana Potion (13443)
-- Reward: Artisan Alchemy Mortar (56901)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90099: Stormwind (Lilyssia Nightbreeze - 5499)
-- -----------------------------------------------------
SET @quest := 90099;
SET @npc := 5499;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1519, -- Stormwind City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Lilyssia Nightbreeze in Stormwind',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90100: Ironforge (Ghak Healtouch - 1470)
-- -----------------------------------------------------
SET @quest := 90100;
SET @npc := 1470;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1537, -- Ironforge
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Ghak Healtouch in Ironforge',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90101: Darnassus (Ainethil - 4160)
-- -----------------------------------------------------
SET @quest := 90101;
SET @npc := 4160;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1657, -- Darnassus
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Ainethil in Darnassus',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90102: Exodar (Lucc - 16723)
-- -----------------------------------------------------
SET @quest := 90102;
SET @npc := 16723;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 3557, -- The Exodar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Lucc in the Exodar',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90103: Orgrimmar (Yelmak - 3347)
-- -----------------------------------------------------
SET @quest := 90103;
SET @npc := 3347;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1637, -- Orgrimmar
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Yelmak in Orgrimmar',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90104: Thunder Bluff (Bena Winterhoof - 3009)
-- -----------------------------------------------------
SET @quest := 90104;
SET @npc := 3009;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1638, -- Thunder Bluff
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Bena Winterhoof in Thunder Bluff',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90105: Undercity (Doctor Herbert Halsey - 4611)
-- -----------------------------------------------------
SET @quest := 90105;
SET @npc := 4611;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 1497, -- Undercity
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Doctor Herbert Halsey in Undercity',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90106: Silvermoon (Camberon - 16642)
-- -----------------------------------------------------
SET @quest := 90106;
SET @npc := 16642;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 50,
    `MinLevel` = 0,
    `QuestSortID` = 3487, -- Silvermoon City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 3928, -- Superior Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13443, -- Superior Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Your alchemy has advanced, but that mortar is holding you back. Bring me superior healing and mana potions, and I''ll provide you with tools worthy of an artisan alchemist.',
    `QuestCompletionLog` = 'Return the potions to Camberon in Silvermoon City',
    `RewardItem1` = 56901,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 225,
    `PrevQuestID` = 90091,
    `ExclusiveGroup` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'An artisan''s mortar for an artisan alchemist. May your brews be potent.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the potions I requested?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- MASTER ALCHEMY MORTAR QUEST (300+ Alchemy)
-- 5 Major Healing Potion (13446) + 5 Major Mana Potion (13444)
-- Reward: Master Alchemy Mortar (56902)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90107: Shattrath (Lorokeem - 19052)
-- -----------------------------------------------------
SET @quest := 90107;
SET @npc := 19052;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3703, -- Shattrath City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 13446, -- Major Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13444, -- Major Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Master Alchemy Mortar',
    `QuestDescription` = 'The reagents of Outland demand a mortar of extraordinary quality. Bring me major healing and mana potions to demonstrate your mastery, and I''ll craft you a mortar worthy of a master alchemist.',
    `QuestCompletionLog` = 'Return the potions to Lorokeem in Shattrath City',
    `RewardItem1` = 56902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90099;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'This mortar is crafted for the challenges of Outland. Use it well.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the potions?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- =====================================================
-- GRAND MASTER ALCHEMY MORTAR QUEST (375+ Alchemy)
-- 5 Runic Healing Potion (33447) + 5 Runic Mana Potion (33448)
-- Reward: Grand Master Alchemy Mortar (56903)
-- =====================================================

-- -----------------------------------------------------
-- Quest 90108: Dalaran (Linzy Blackbolt - 28703)
-- -----------------------------------------------------
SET @quest := 90108;
SET @npc := 28703;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 80,
    `MinLevel` = 0,
    `QuestSortID` = 4395, -- Dalaran
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `RequiredItemId1` = 33447, -- Runic Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 33448, -- Runic Mana Potion
    `RequiredItemCount2` = 5,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Grand Master Alchemy Mortar',
    `QuestDescription` = 'You''ve reached the pinnacle of alchemical mastery, but even grand masters need the finest tools. The ingredients of Northrend are unlike anything you''ve worked with before. Bring me runic healing and mana potions, and I''ll provide you with a mortar befitting a grand master of the craft.',
    `QuestCompletionLog` = 'Return the potions to Linzy Blackbolt in Dalaran',
    `RewardItem1` = 56903,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 375,
    `PrevQuestID` = 90107;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Magnificent! This mortar is the finest tool a grand master could wield. May your elixirs and transmutations be legendary.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you gather the potions from Northrend?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
