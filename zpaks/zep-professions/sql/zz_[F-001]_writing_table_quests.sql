-- =====================================================
-- WRITING TABLE QUESTS
-- Inscription tool delivery via quest-based system
-- Players turn in inks and vellums at Inscription trainers
-- 4 tiers: Journeyman, Artisan, Master, Grand Master
-- =====================================================

-- Clean up
DELETE FROM `quest_template` WHERE `ID` BETWEEN 90136 AND 90154;
DELETE FROM `quest_template_addon` WHERE `ID` BETWEEN 90136 AND 90154;
DELETE FROM `quest_offer_reward` WHERE `ID` BETWEEN 90136 AND 90154;
DELETE FROM `quest_request_items` WHERE `ID` BETWEEN 90136 AND 90154;
DELETE FROM `creature_queststarter` WHERE `quest` BETWEEN 90136 AND 90154;
DELETE FROM `creature_questender` WHERE `quest` BETWEEN 90136 AND 90154;

-- Add QUESTGIVER npcflag (2) to Inscription trainers
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` IN (30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 28702);

-- =====================================================
-- JOURNEYMAN WRITING TABLE (skill 75) - 8 city quests
-- Turn in: 5 Weapon Vellum (39349) + 5 Armor Vellum (38682) + 10 Midnight Ink (39774)
-- Reward: Journeyman Writing Table (57486)
-- ExclusiveGroup: 90136
-- =====================================================

-- 90136: Catarina Stanford (30713) - Stormwind
INSERT INTO `quest_template` SET
    `ID` = 90136, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1519,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 72, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Catarina Stanford in Stormwind.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Catarina Stanford in Stormwind.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90136, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90136, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90136, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30713, 90136);
INSERT INTO `creature_questender` VALUES (30713, 90136);

-- 90137: Elise Brightletter (30717) - Ironforge
INSERT INTO `quest_template` SET
    `ID` = 90137, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1537,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 47, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Elise Brightletter in Ironforge.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Elise Brightletter in Ironforge.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90137, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90137, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90137, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30717, 90137);
INSERT INTO `creature_questender` VALUES (30717, 90137);

-- 90138: Feyden Darkin (30715) - Darnassus
INSERT INTO `quest_template` SET
    `ID` = 90138, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1657,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 69, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Feyden Darkin in Darnassus.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Feyden Darkin in Darnassus.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90138, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90138, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90138, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30715, 90138);
INSERT INTO `creature_questender` VALUES (30715, 90138);

-- 90139: Thoth (30716) - Exodar
INSERT INTO `quest_template` SET
    `ID` = 90139, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 3557,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 930, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Thoth in the Exodar.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Thoth in the Exodar.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90139, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90139, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90139, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30716, 90139);
INSERT INTO `creature_questender` VALUES (30716, 90139);

-- 90140: Jo'mah (30706) - Orgrimmar
INSERT INTO `quest_template` SET
    `ID` = 90140, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1637,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 76, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Jo''mah in Orgrimmar.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Jo''mah in Orgrimmar.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90140, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90140, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90140, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30706, 90140);
INSERT INTO `creature_questender` VALUES (30706, 90140);

-- 90141: Poshken Hardbinder (30709) - Thunder Bluff
INSERT INTO `quest_template` SET
    `ID` = 90141, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1638,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 81, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Poshken Hardbinder in Thunder Bluff.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Poshken Hardbinder in Thunder Bluff.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90141, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90141, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90141, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30709, 90141);
INSERT INTO `creature_questender` VALUES (30709, 90141);

-- 90142: Zantasia (30710) - Silvermoon
INSERT INTO `quest_template` SET
    `ID` = 90142, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 3487,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 911, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Zantasia in Silvermoon City.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Zantasia in Silvermoon City.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90142, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90142, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90142, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30710, 90142);
INSERT INTO `creature_questender` VALUES (30710, 90142);

-- 90143: Margaux Parchley (30711) - Undercity
INSERT INTO `quest_template` SET
    `ID` = 90143, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = 1497,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 68, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Margaux Parchley in Undercity.',
    `QuestDescription` = 'A proper scribe needs a proper writing table. I have a Journeyman Writing Table available - bring me 5 Weapon Vellums, 5 Armor Vellums, and 10 Midnight Inks to fill my current order, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Margaux Parchley in Undercity.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90143, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90143, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90143, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30711, 90143);
INSERT INTO `creature_questender` VALUES (30711, 90143);

-- =====================================================
-- ARTISAN WRITING TABLE (skill 225) - 8 city quests
-- Turn in: 5 Weapon Vellum II (39350) + 5 Armor Vellum II (37602) + 10 Celestial Ink (43120)
-- Reward: Artisan Writing Table (57487)
-- ExclusiveGroup: 90144
-- =====================================================

-- 90144: Catarina Stanford (30713) - Stormwind
INSERT INTO `quest_template` SET
    `ID` = 90144, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1519,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 72, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Catarina Stanford in Stormwind.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Catarina Stanford in Stormwind.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90144, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90144, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90144, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30713, 90144);
INSERT INTO `creature_questender` VALUES (30713, 90144);

-- 90145: Elise Brightletter (30717) - Ironforge
INSERT INTO `quest_template` SET
    `ID` = 90145, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1537,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 47, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Elise Brightletter in Ironforge.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Elise Brightletter in Ironforge.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90145, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90145, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90145, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30717, 90145);
INSERT INTO `creature_questender` VALUES (30717, 90145);

-- 90146: Feyden Darkin (30715) - Darnassus
INSERT INTO `quest_template` SET
    `ID` = 90146, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1657,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 69, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Feyden Darkin in Darnassus.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Feyden Darkin in Darnassus.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90146, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90146, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90146, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30715, 90146);
INSERT INTO `creature_questender` VALUES (30715, 90146);

-- 90147: Thoth (30716) - Exodar
INSERT INTO `quest_template` SET
    `ID` = 90147, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 3557,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 930, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Thoth in the Exodar.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Thoth in the Exodar.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90147, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90147, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90147, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30716, 90147);
INSERT INTO `creature_questender` VALUES (30716, 90147);

-- 90148: Jo'mah (30706) - Orgrimmar
INSERT INTO `quest_template` SET
    `ID` = 90148, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1637,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 76, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Jo''mah in Orgrimmar.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Jo''mah in Orgrimmar.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90148, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90148, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90148, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30706, 90148);
INSERT INTO `creature_questender` VALUES (30706, 90148);

-- 90149: Poshken Hardbinder (30709) - Thunder Bluff
INSERT INTO `quest_template` SET
    `ID` = 90149, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1638,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 81, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Poshken Hardbinder in Thunder Bluff.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Poshken Hardbinder in Thunder Bluff.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90149, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90149, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90149, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30709, 90149);
INSERT INTO `creature_questender` VALUES (30709, 90149);

-- 90150: Zantasia (30710) - Silvermoon
INSERT INTO `quest_template` SET
    `ID` = 90150, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 3487,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 911, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Zantasia in Silvermoon City.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Zantasia in Silvermoon City.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90150, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90150, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90150, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30710, 90150);
INSERT INTO `creature_questender` VALUES (30710, 90150);

-- 90151: Margaux Parchley (30711) - Undercity
INSERT INTO `quest_template` SET
    `ID` = 90151, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = 1497,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 68, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Margaux Parchley in Undercity.',
    `QuestDescription` = 'Your skills have grown, and so should your tools. I have an Artisan Writing Table - bring me 5 Weapon Vellum IIs, 5 Armor Vellum IIs, and 10 Celestial Inks, and it''s yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Margaux Parchley in Undercity.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90151, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90151, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90151, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30711, 90151);
INSERT INTO `creature_questender` VALUES (30711, 90151);

-- =====================================================
-- MASTER WRITING TABLE (skill 300) - 2 Outland quests
-- Turn in: 10 Ethereal Ink (43124) + 10 Darkflame Ink (43125)
-- Reward: Master Writing Table (57488)
-- ExclusiveGroup: 90152
-- =====================================================

-- 90152: Michael Schwan (30721) - Outland
INSERT INTO `quest_template` SET
    `ID` = 90152, `QuestLevel` = 65, `MinLevel` = 0, `QuestSortID` = 3703,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43124, `RequiredItemCount1` = 10,
    `RequiredItemId2` = 43125, `RequiredItemCount2` = 10,
    `LogTitle` = 'Master Scribe''s Tools',
    `LogDescription` = 'Bring rare inks to Michael Schwan in Outland.',
    `QuestDescription` = 'A Master Writing Table requires special materials - inks distilled from the rarest pigments. Bring me 10 Ethereal Inks and 10 Darkflame Inks, and I''ll craft you a writing table worthy of a master scribe.$B$BRequired:$B- 10 Ethereal Ink$B- 10 Darkflame Ink',
    `QuestCompletionLog` = 'Return to Michael Schwan.',
    `RewardItem1` = 57488, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90152, `RequiredSkillID` = 773, `RequiredSkillPoints` = 300, `ExclusiveGroup` = 90152;
INSERT INTO `quest_offer_reward` SET `ID` = 90152, `RewardText` = 'These inks are exquisite. Your Master Writing Table is ready.';
INSERT INTO `quest_request_items` SET `ID` = 90152, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the Ethereal and Darkflame Inks?';
INSERT INTO `creature_queststarter` VALUES (30721, 90152);
INSERT INTO `creature_questender` VALUES (30721, 90152);

-- 90153: Neferatti (30722) - Outland
INSERT INTO `quest_template` SET
    `ID` = 90153, `QuestLevel` = 65, `MinLevel` = 0, `QuestSortID` = 3703,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43124, `RequiredItemCount1` = 10,
    `RequiredItemId2` = 43125, `RequiredItemCount2` = 10,
    `LogTitle` = 'Master Scribe''s Tools',
    `LogDescription` = 'Bring rare inks to Neferatti in Outland.',
    `QuestDescription` = 'A Master Writing Table requires special materials - inks distilled from the rarest pigments. Bring me 10 Ethereal Inks and 10 Darkflame Inks, and I''ll craft you a writing table worthy of a master scribe.$B$BRequired:$B- 10 Ethereal Ink$B- 10 Darkflame Ink',
    `QuestCompletionLog` = 'Return to Neferatti.',
    `RewardItem1` = 57488, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90153, `RequiredSkillID` = 773, `RequiredSkillPoints` = 300, `ExclusiveGroup` = 90152;
INSERT INTO `quest_offer_reward` SET `ID` = 90153, `RewardText` = 'These inks are exquisite. Your Master Writing Table is ready.';
INSERT INTO `quest_request_items` SET `ID` = 90153, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the Ethereal and Darkflame Inks?';
INSERT INTO `creature_queststarter` VALUES (30722, 90153);
INSERT INTO `creature_questender` VALUES (30722, 90153);

-- =====================================================
-- GRAND MASTER WRITING TABLE (skill 375) - 1 Dalaran quest
-- Turn in: 5 Weapon Vellum III (43146) + 5 Armor Vellum III (43145) + 10 Ink of the Sea (43126)
-- Reward: Grand Master Writing Table (57489)
-- =====================================================

-- 90154: Professor Pallin (28702) - Dalaran
INSERT INTO `quest_template` SET
    `ID` = 90154, `QuestLevel` = 77, `MinLevel` = 0, `QuestSortID` = 4395,
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43146, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 43145, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43126, `RequiredItemCount3` = 10,
    `LogTitle` = 'Grand Master Scribe''s Tools',
    `LogDescription` = 'Bring the finest vellums and ink to Professor Pallin in Dalaran.',
    `QuestDescription` = 'Only the finest materials will do for a Grand Master Writing Table. Bring me 5 Weapon Vellum IIIs, 5 Armor Vellum IIIs, and 10 Inks of the Sea. This table will be a masterwork of scribing craftsmanship.$B$BRequired:$B- 5 Weapon Vellum III$B- 5 Armor Vellum III$B- 10 Ink of the Sea',
    `QuestCompletionLog` = 'Return to Professor Pallin in Dalaran.',
    `RewardItem1` = 57489, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90154, `RequiredSkillID` = 773, `RequiredSkillPoints` = 375, `ExclusiveGroup` = 90154;
INSERT INTO `quest_offer_reward` SET `ID` = 90154, `RewardText` = 'Magnificent work. This Grand Master Writing Table is the pinnacle of scribing equipment.';
INSERT INTO `quest_request_items` SET `ID` = 90154, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and Ink of the Sea?';
INSERT INTO `creature_queststarter` VALUES (28702, 90154);
INSERT INTO `creature_questender` VALUES (28702, 90154);
