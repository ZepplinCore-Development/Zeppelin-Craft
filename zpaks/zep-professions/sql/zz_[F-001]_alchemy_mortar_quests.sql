-- =====================================================
-- ALCHEMY MORTAR QUEST SYSTEM
-- =====================================================
-- Journeyman: 8 city quests (90091-90098) [ExclusiveGroup 90091]
-- Artisan: 8 city quests (90099-90106) [ExclusiveGroup 90099]
-- Master: 3 Outland quests (90107, 90111-90112) [ExclusiveGroup 90107]
-- Grand Master: 1 Dalaran quest (90108)
-- Total: 20 quests
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
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90091 AND 90108 OR `ID` IN (90111, 90112);
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90091 AND 90108 OR `ID` IN (90111, 90112);
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90091 AND 90108 OR `ID` IN (90111, 90112);
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90091 AND 90108 OR `ID` IN (90111, 90112);
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90091 AND 90108 OR `quest` IN (90111, 90112);
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90091 AND 90108 OR `quest` IN (90111, 90112);

-- ===================
-- ADD QUESTGIVER FLAG TO TRAINERS
-- ===================
-- Some trainers missing QUESTGIVER (2) flag
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` IN (
    5499,  -- Lilyssia Nightbreeze (Stormwind)
    5177,  -- Tally Berryfizz (Ironforge)
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
    `QuestDescription` = 'Grinding reagents by hand? You''re wasting both time and potency.$B$BI''ve seen too many apprentices struggle with worn tools. A proper mortar cuts your brewing time in half AND enhances your potions'' effectiveness. The difference is remarkable.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions, and I''ll trade you a journeyman''s mortar. Your brews will be faster and more powerful - you''ll wonder how you ever worked without one.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'Excellent work. This mortar will speed your brewing AND strengthen every potion you create. The smooth stone preserves reagent potency that crude tools simply waste.$B$BNow - back to your cauldron, alchemist. Time to brew something worth drinking.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the potions? 5 of each healing and mana, yes?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90092: Ironforge (Tally Berryfizz - 5177)
-- -----------------------------------------------------
SET @quest := 90092;
SET @npc := 5177;

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
    `QuestDescription` = 'Oh! Still grinding herbs by hand? That''s terribly inefficient - you''re losing at LEAST 40% reagent potency with that technique!$B$BI''ve been tinkering with mortar designs for years. The key is the grinding surface angle - 37 degrees, precisely calibrated. It doesn''t just speed things up, it extracts compounds that crude methods completely miss. Your potions will be SIGNIFICANTLY stronger!$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I''ll trade you a journeyman''s mortar - my own design, gear-assisted grinding mechanism. Cuts your brewing time in half AND boosts potency. You''ll love it.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
    `QuestCompletionLog` = 'Return the potions to Tally Berryfizz in Ironforge',
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
    `RewardText` = 'Perfect! Oh, you''re going to love this. Gear-assisted grinding, self-leveling base, optimized surface texture - it''s one of my better designs, if I do say so myself.$B$BYour potions will brew faster and pack a much bigger punch. Now get back to that cauldron - I want to see what you can do with proper equipment!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got those potions? 5 healing, 5 mana - let''s see them!';

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
    `QuestDescription` = 'I sense you are crushing herbs without proper tools. This troubles me.$B$BNature''s gifts should be honored with precision. A well-crafted mortar does not merely speed the work - it releases the full potency sleeping within each petal and root. Your potions will become what they were meant to be: stronger, purer.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I shall trade you a mortar carved from moonwell stone. It will halve your brewing time and enhance every draught you create.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'The exchange is made. This mortar honors the herbs you work with - it will brew them swiftly and draw forth their deepest essence.$B$BMay Elune guide your craft, $c. Create potions worthy of the gift she has given you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the potions? Five of each, blessed by your craft?';

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
    `QuestDescription` = 'Your technique shows promise, but your tools... they are inefficient.$B$BOn Argus, we refined our alchemical processes over millennia. We discovered that proper equipment does not merely accelerate the work - it amplifies reagent potency by 15-20 percent. The molecular structure of crushed herbs matters greatly.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I will provide you with a mortar incorporating draenei precision engineering. Your brewing speed will double, and your potions will achieve their theoretical maximum effectiveness.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'The exchange is complete. This mortar embodies millennia of draenei knowledge. You will observe immediate improvements in both processing speed and potion efficacy.$B$BUse it wisely, alchemist. Precision in craft honors the Light.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you prepared the requested samples? Five healing, five mana?';

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
    `QuestDescription` = 'Bah! You grind herbs like a peon with rocks. Weak. SLOW.$B$BA warrior needs potions fast and STRONG. You waste time, you waste power. Not good enough for the Horde!$B$BI give you proper mortar - you brew twice as fast, potions hit twice as hard. Simple. Bring me 5 Lesser Healing Potions and 5 Lesser Mana Potions, I make trade. Your brewing becomes worthy of Horde battle. No more pathetic crushing - real alchemy now.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'Good! This mortar carved from Durotar stone - strong, fast. Your potions brew quick, hit HARD. Much better than before.$B$BNow you make potions worthy of Horde warriors. Go! Strength and honor!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You bring potions? 5 healing, 5 mana, yes?';

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
    `QuestDescription` = 'Child, you honor the herbs but dishonor them with crude tools.$B$BThe Earth Mother teaches us: respect the gift, and the gift grows stronger. A sacred mortar does not merely speed your hands - it awakens the sleeping spirit in every root and petal. Your potions will heal more, restore more, because you treated the herbs with reverence.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I will trade you a mortar blessed by our ancestors. Your brewing time will be halved, and your draughts will carry the Earth Mother''s strength.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'Walk gently with this gift, $c. The mortar has been blessed - it will speed your craft and strengthen every potion you create. The herbs will sing their gratitude.$B$BMay the Earth Mother guide your hands. Go in peace, alchemist.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you gathered the potions, child? Five of each, yes?';

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
    `QuestDescription` = '*cough* I observe you grinding reagents with... primitive methods. Inefficient. Wasteful.$B$BIn life, I performed countless experiments. Conclusion: equipment quality directly correlates with potion efficacy. A proper mortar reduces processing time by 50% AND increases active compound extraction by 18-22%. The chemistry is quite clear.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I shall provide you with a mortar incorporating my research. Your brewing speed will double, your potions will become significantly more potent. *wheeze* Science, you see.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'Excellent. *cough* This mortar embodies years of research into optimal grinding surfaces and angles. You''ll notice immediate improvements in both processing velocity and potion strength.$B$BNow then... back to your experiments. Science waits for no one. *wheeze*';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = '*cough* Do you have the samples? Five healing, five mana, yes?';

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
    `QuestDescription` = 'I must confess, I find your current methods rather... pedestrian.$B$BQuel''Thalas perfected alchemical arts over seven millennia. We learned that exquisite tools produce exquisite results. A flawless mortar doesn''t merely expedite the brewing process - it elevates potion potency to heights crude implements can never achieve. Elegance in craft, power in result.$B$BBring me 5 Lesser Healing Potions and 5 Lesser Mana Potions. I shall provide you with a mortar crafted in the high elven tradition. Your brewing time will be halved, and your potions will achieve their true potential.$B$BRequired:$B- 5 Lesser Healing Potions$B- 5 Lesser Mana Potions',
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
    `RewardText` = 'Splendid. This mortar bears the refinement of Silvermoon''s master crafters. It will brew your potions with remarkable speed and enhance their strength considerably.$B$BNow then - create something worthy of our legacy, won''t you? Mediocrity has no place in Quel''Thalas.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the potions? Five of each variety, I trust?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 72, -- Stormwind
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'That journeyman''s mortar served you well, but I can see the wear. Your potions are weaker than they should be - you''re losing 10% potency to degraded grinding surfaces.$B$BYour skill has grown. Your tools must grow with it.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions, along with your old mortar for trade-in. I''ll provide you with an artisan''s mortar - faster brewing, stronger potions. The upgrade is dramatic.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'The exchange is complete. This artisan''s mortar is precision-crafted - the grinding surface perfectly smooth, the weight perfectly balanced. You''ll brew 30% faster than before, and your potions will be considerably more potent.$B$BYour craft advances. Don''t let your tools fall behind again.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Did you bring the superior potions? And your old mortar for trade-in?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90100: Ironforge (Tally Berryfizz - 5177)
-- -----------------------------------------------------
SET @quest := 90100;
SET @npc := 5177;

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 47, -- Ironforge
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Ooh, let me see that mortar... oh dear. The grinding surface is pitted, the calibration is WAY off - no wonder your potions have been losing potency! You''re wasting good reagents with worn-out equipment.$B$BBut your SKILL has improved tremendously! Time for tools to match.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions, and trade in that old mortar. I''ve been working on an artisan model - triple-compound grinding surface, counter-weighted for smoother action. Much faster brewing, MUCH stronger results. It''s a significant upgrade.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
    `QuestCompletionLog` = 'Return the potions to Tally Berryfizz in Ironforge',
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
    `RewardText` = 'Oh, this is EXCITING! Triple-compound surface, counter-weighted base, micro-calibrated grinding angle - this is some of my finest work!$B$BYour brewing will be dramatically faster, and the potency increase should be substantial. Gnomish engineering meets alchemical precision! Now go, go - I can''t wait to hear how it performs!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Got the superior potions? And the old mortar for trade-in?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 69, -- Darnassus
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = '$C, your mortar grows tired. I can feel it - the stone has lost its song. Your potions flow more slowly, heal less deeply. The herbs cry out for better treatment.$B$BYou have walked far in your craft. It is time for your tools to walk with you.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions, and return your weary mortar. I shall give you one blessed by the ancient trees - swifter in grinding, deeper in drawing forth the essence. Your potions will brew faster and restore more life.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'The exchange is blessed. This artisan''s mortar sings with moonwell magic - it will speed your hands and awaken the sleeping strength in every herb you grind.$B$BListen to its song as you work, $c. The herbs will answer with their fullest gifts.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the superior draughts? And your old mortar to trade?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 930, -- Exodar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'Analysis indicates your current mortar has degraded beyond optimal performance thresholds. Surface wear is reducing extraction efficiency by 12-15%. Processing time has increased 8%.$B$BYour skill level now requires corresponding equipment upgrades.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions, along with your journeyman mortar for recycling. I shall provide you with an artisan-grade tool incorporating advanced Argussian compound optimization. Projection: 35% faster brewing, 22% increased potion potency.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'Exchange completed. This artisan mortar features precision-ground surfaces and optimized grinding angles. Immediate benefits: significantly reduced processing time, substantially improved active compound extraction.$B$BYour potions will now perform at expected artisan-level parameters. Most satisfactory.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you prepared the superior-grade samples? And the obsolete equipment?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 76, -- Orgrimmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'HAH! That mortar is WORN. Weak! Your potions are PATHETIC now - slow to make, weak in battle. Not acceptable!$B$BYou grow stronger - your tools must grow stronger too. This is Horde way.$B$BBring 5 Superior Healing Potions and 5 Superior Mana Potions. Bring old mortar too - I smash for you, make new one! Artisan mortar - faster brewing, MUCH stronger potions. Your draughts will hit like Hellscream''s axe! Strong tools, strong potions, strong Horde.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'YES! GOOD! This artisan mortar carved from blackrock - strong like iron, smooth like water. You brew FAST now, potions hit HARD. Much better than weak old tools!$B$BNow GO! Make potions worthy of Horde warriors! Strength and HONOR!';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You bring superior potions? And old mortar for trade? GOOD!';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 81, -- Thunder Bluff
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'I hear it, $c - your mortar no longer sings. The stone has grown tired, the herbs cry softly in pain. Your potions brew slowly now, and their healing touch grows faint.$B$BYou have walked far on your path. The Earth Mother calls you to walk further with proper tools.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions. Return your weary mortar - I shall release its spirit with honor. In exchange, receive a mortar blessed by the ancestors - swifter in craft, deeper in power.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'It is done. This artisan''s mortar carries the Earth Mother''s blessing - your hands will move swiftly, and every herb will surrender its deepest essence. Your potions will heal as they were meant to heal.$B$BWalk in harmony with your craft, child. The spirits smile upon you.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the superior draughts? And your old mortar to return?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 68, -- Undercity
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = '*wheeze* Observation: Your mortar exhibits significant degradation. Surface erosion... 14.7%. Processing efficiency... down 11%. Compound extraction... compromised.$B$B*cough* This is scientifically unacceptable. Your skill has advanced beyond your equipment''s capabilities.$B$BBring 5 Superior Healing Potions and 5 Superior Mana Potions. Also surrender that failing mortar for analysis. I shall provide you with an artisan-grade replacement incorporating my latest research. Projected improvements: 33% faster processing, 24% increased potency. *wheeze* The data is quite clear.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = '*cough* Excellent specimens. The exchange is complete. This artisan mortar incorporates crystalline grinding surfaces - molecular-level smoothness. Results: dramatically reduced processing time, substantially enhanced active compound extraction.$B$BYour potions will now perform at statistically significant higher levels. *wheeze* Science prevails once again.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = '*wheeze* Have you prepared the superior-grade samples? And the degraded equipment?';

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
    `RequiredItemId3` = 56900, -- Journeyman Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 911, -- Silvermoon City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan''s Mortar',
    `LogDescription` = 'Collect potions to exchange for an Artisan Alchemy Mortar',
    `QuestDescription` = 'That mortar is... deteriorating. Most unfortunate.$B$BI can discern the degradation in your work - potions that brew sluggishly, draughts lacking their proper strength. Such decline is beneath someone of your advancing skill. Quel''Thalas demands better.$B$BBring me 5 Superior Healing Potions and 5 Superior Mana Potions, along with that shabby mortar. I shall provide you with artisan-grade equipment befitting a practitioner of your caliber. The improvement will be considerable - faster brewing, stronger potions. Elegance restored.$B$BRequired:$B- 5 Superior Healing Potions$B- 5 Superior Mana Potions',
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
    `RewardText` = 'Ah, much better. This artisan mortar embodies seven thousand years of Quel''Thalas refinement - perfectly balanced, exquisitely ground. Your brewing speed will increase dramatically, and your potions will achieve their intended potency at last.$B$BNow then - create something worthy of our legacy. Mediocrity is so very tiresome.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you brought the superior potions? And that worn mortar for disposal?';

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
    `RequiredItemId3` = 56901, -- Artisan Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1011, -- Lower City
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Master Alchemy Mortar',
    `QuestDescription` = 'Ah, an alchemist from Azeroth. Your artisan mortar served well there, but Outland''s reagents... they are different. Fel-touched. Volatile.$B$BThat worn mortar cannot handle dreamfoil, terocone, felweed - the compounds are too aggressive. Your brewing slows, your potions lose strength. Dangerous, yes?$B$BBring me 5 Major Healing Potions and 5 Major Mana Potions, and trade in your Azerothian mortar. I craft you master''s mortar from netherstorm crystal - handles Outland reagents perfectly. Faster brewing, much stronger potions. You will see.$B$BRequired:$B- 5 Major Healing Potions$B- 5 Major Mana Potions',
    `QuestCompletionLog` = 'Return the potions to Lorokeem in Shattrath City',
    `RewardItem1` = 56902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90099,
    `ExclusiveGroup` = 90107;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good, good! This master mortar infused with nether-essence - it tames Outland''s wild reagents, yes. Your potions brew swiftly now, and their power... much increased. Fel compounds respond to proper treatment.$B$BYou are master alchemist now. Brew well in the shattered world, friend.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You bring major potions? And old mortar for exchange?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90111: Honor Hold Alliance (Apothecary Antonivich - 18987)
-- -----------------------------------------------------
SET @quest := 90111;
SET @npc := 18987;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3703, -- Shattrath City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 1101, -- Alliance
    `RequiredItemId1` = 13446, -- Major Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13444, -- Major Mana Potion
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 56901, -- Artisan Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 946, -- Honor Hold
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Master Alchemy Mortar',
    `QuestDescription` = 'Ah, an alchemist from Azeroth. Your artisan mortar served well there, but Outland''s reagents... they are different. Fel-touched. Volatile.$B$BThat worn mortar cannot handle dreamfoil, terocone, felweed - the compounds are too aggressive. Your brewing slows, your potions lose strength. Dangerous, yes?$B$BBring me 5 Major Healing Potions and 5 Major Mana Potions, and trade in your Azerothian mortar. I craft you master''s mortar from netherstorm crystal - handles Outland reagents perfectly. Faster brewing, much stronger potions. You will see.$B$BRequired:$B- 5 Major Healing Potions$B- 5 Major Mana Potions',
    `QuestCompletionLog` = 'Return the potions to Apothecary Antonivich in Honor Hold',
    `RewardItem1` = 56902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90099,
    `ExclusiveGroup` = 90107;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Good, good! This master mortar infused with nether-essence - it tames Outland''s wild reagents, yes. Your potions brew swiftly now, and their power... much increased. Fel compounds respond to proper treatment.$B$BYou are master alchemist now. Brew well in the shattered world, friend.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'You bring major potions? And old mortar for exchange?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);

-- -----------------------------------------------------
-- Quest 90112: Thrallmar Horde (Apothecary Albreck - 18991)
-- -----------------------------------------------------
SET @quest := 90112;
SET @npc := 18991;

INSERT INTO `quest_template` SET
    `ID` = @quest,
    `QuestLevel` = 70,
    `MinLevel` = 0,
    `QuestSortID` = 3703, -- Shattrath City
    `RewardXPDifficulty` = 5,
    `Flags` = 136,
    `AllowableRaces` = 690, -- Horde
    `RequiredItemId1` = 13446, -- Major Healing Potion
    `RequiredItemCount1` = 5,
    `RequiredItemId2` = 13444, -- Major Mana Potion
    `RequiredItemCount2` = 5,
    `RequiredItemId3` = 56901, -- Artisan Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 947, -- Thrallmar
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Master Alchemy Mortar',
    `QuestDescription` = 'Welcome to Outland, alchemist. Your artisan mortar... adequate for Azeroth, but not here. Outland reagents are fel-tainted, unstable. That mortar cannot properly grind felweed or terocone - your potions will be weak, your brewing slow.$B$BBring me 5 Major Healing Potions and 5 Major Mana Potions. Trade in that Azerothian mortar. I will provide you a master''s mortar infused with fel-resistant compounds. It will handle Outland''s volatile herbs properly. Faster brewing, stronger potions. Essential for survival here.$B$BRequired:$B- 5 Major Healing Potions$B- 5 Major Mana Potions',
    `QuestCompletionLog` = 'Return the potions to Apothecary Albreck in Thrallmar',
    `RewardItem1` = 56902,
    `RewardAmount1` = 1,
    `VerifiedBuild` = '0';

INSERT INTO `quest_template_addon` SET
    `ID` = @quest,
    `RequiredSkillID` = 171, -- Alchemy
    `RequiredSkillPoints` = 300,
    `PrevQuestID` = 90099,
    `ExclusiveGroup` = 90107;

INSERT INTO `quest_offer_reward` SET
    `ID` = @quest,
    `RewardText` = 'Excellent specimens. This master mortar is infused with nether-essence - it neutralizes fel corruption in reagents. Your brewing will be swift, your potions potent. The volatile compounds of Outland will bend to your will.$B$BYou are prepared. Go forth, master alchemist.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Have you prepared the major potions? And your old mortar for exchange?';

UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = @npc;

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
    `RequiredItemId3` = 56902, -- Master Alchemy Mortar (trade-in)
    `RequiredItemCount3` = 1,
    `RewardFactionID1` = 1090, -- Kirin Tor
    `RewardFactionValue1` = 5,
    `LogTitle` = 'Grand Master''s Mortar',
    `LogDescription` = 'Collect potions to exchange for a Grand Master Alchemy Mortar',
    `QuestDescription` = 'Welcome to Northrend, alchemist. You''ve mastered Outland''s reagents, but THIS frozen continent... the herbs here are saturated with ancient magic. Frost lotus, lichbloom, icethorn - they resist your Outland mortar.$B$BI''ve studied it extensively. Your master mortar is degrading 15% faster than normal because it wasn''t designed for arcane-infused reagents. Your brewing is slowing, your potions losing potency.$B$BBring me 5 Runic Healing Potions and 5 Runic Mana Potions, and trade in that Outland mortar. I''ll provide you with a grand master''s mortar enchanted by the Kirin Tor - it will brew Northrend potions swiftly and unlock their full arcane power.$B$BRequired:$B- 5 Runic Healing Potions$B- 5 Runic Mana Potions',
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
    `RewardText` = 'Perfect! This grand master mortar is enchanted with stabilization runes - it harmonizes with Northrend''s arcane-saturated herbs. You''ll notice immediately: brewing time reduced by 40%, potion strength increased by 30%.$B$BYou stand at the pinnacle of alchemical craft now. May your transmutations be legendary, grand master.';

INSERT INTO `quest_request_items` SET
    `ID` = @quest,
    `EmoteOnComplete` = 1,
    `CompletionText` = 'Do you have the runic potions? And your Outland mortar for exchange?';

INSERT INTO `creature_queststarter` VALUES (@npc, @quest);
INSERT INTO `creature_questender` VALUES (@npc, @quest);
