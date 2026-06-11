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
    `ID` = 90136, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 72, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Catarina Stanford in Stormwind.',
    `QuestDescription` = 'Ledgers, contracts, glyphs - Stormwind runs on ink, and a wobbling table ruins all three. A proper writing table will speed your inscription work more than any quill. Bring me vellums and Midnight Ink to fill my standing orders, and the Journeyman table is yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Catarina Stanford in Stormwind.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90136, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90136, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90136, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30713, 90136);
INSERT INTO `creature_questender` VALUES (30713, 90136);

-- 90137: Elise Brightletter (30717) - Ironforge
INSERT INTO `quest_template` SET
    `ID` = 90137, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 47, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Elise Brightletter in Ironforge.',
    `QuestDescription` = 'Ye cannae rune a straight line on a crooked board! A scribe''s table wants mass - good Ironforge stone and iron joinery. Fill an order fer me - vellums and Midnight Ink - and I''ll set ye up with a Journeyman table solid as the mountain.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Elise Brightletter in Ironforge.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90137, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90137, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90137, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30717, 90137);
INSERT INTO `creature_questender` VALUES (30717, 90137);

-- 90138: Feyden Darkin (30715) - Darnassus
INSERT INTO `quest_template` SET
    `ID` = 90138, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 69, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Feyden Darkin in Darnassus.',
    `QuestDescription` = 'The glyph flows as the hand flows, and the hand flows only when the surface beneath it is still. My tables are shaped from windswept timber, patient and true. Bring vellums and Midnight Ink for the temple''s needs, and a Journeyman table will steady your craft.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Feyden Darkin in Darnassus.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90138, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90138, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90138, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30715, 90138);
INSERT INTO `creature_questender` VALUES (30715, 90138);

-- 90139: Thoth (30716) - Exodar
INSERT INTO `quest_template` SET
    `ID` = 90139, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 930, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Thoth in the Exodar.',
    `QuestDescription` = 'Observe: an unsteady surface introduces error into every stroke. Unacceptable for glyphwork. My tables are calibrated to exacting standards. Provide vellums and Midnight Ink for our records, and I will furnish you a Journeyman writing table. The Light favors precise work.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Thoth in the Exodar.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90139, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90139, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90139, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30716, 90139);
INSERT INTO `creature_questender` VALUES (30716, 90139);

-- 90140: Jo'mah (30706) - Orgrimmar
INSERT INTO `quest_template` SET
    `ID` = 90140, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 76, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Jo''mah in Orgrimmar.',
    `QuestDescription` = 'A glyph drawn on a shield rim is a glyph wasted. You want speed? Get a true table under your vellum. Bring vellums and Midnight Ink for the war effort, and the Journeyman table is yours. Write fast. Write once.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Jo''mah in Orgrimmar.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90140, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90140, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90140, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30706, 90140);
INSERT INTO `creature_questender` VALUES (30706, 90140);

-- 90141: Poshken Hardbinder (30709) - Thunder Bluff
INSERT INTO `quest_template` SET
    `ID` = 90141, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 81, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Poshken Hardbinder in Thunder Bluff.',
    `QuestDescription` = 'A story poorly written is a story lost, and crooked tools make crooked words. The Earth Mother gave us steady hands; give them a steady table. Bring vellums and Midnight Ink for the elders'' records, and the Journeyman table is yours.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Poshken Hardbinder in Thunder Bluff.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90141, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90141, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90141, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30709, 90141);
INSERT INTO `creature_questender` VALUES (30709, 90141);

-- 90142: Zantasia (30710) - Silvermoon
INSERT INTO `quest_template` SET
    `ID` = 90142, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 911, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Zantasia in Silvermoon City.',
    `QuestDescription` = 'Your penmanship is... adequate. Your table, I suspect, is an embarrassment. Sin''dorei calligraphy is not produced on tavern furniture. Bring me vellums and Midnight Ink - acceptable quality, please - and I shall provide a Journeyman table worthy of practice.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
    `QuestCompletionLog` = 'Return to Zantasia in Silvermoon City.',
    `RewardItem1` = 57486, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90142, `RequiredSkillID` = 773, `RequiredSkillPoints` = 75, `ExclusiveGroup` = 90136;
INSERT INTO `quest_offer_reward` SET `ID` = 90142, `RewardText` = 'Fine materials. Here''s your writing table - it should speed up your inscription work considerably.';
INSERT INTO `quest_request_items` SET `ID` = 90142, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30710, 90142);
INSERT INTO `creature_questender` VALUES (30710, 90142);

-- 90143: Margaux Parchley (30711) - Undercity
INSERT INTO `quest_template` SET
    `ID` = 90143, `QuestLevel` = 20, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39349, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 38682, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 39774, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 68, `RewardFactionValue1` = 5,
    `LogTitle` = 'Scribe''s Tools',
    `LogDescription` = 'Bring vellums and ink to Margaux Parchley in Undercity.',
    `QuestDescription` = 'Such shaky lettering... is your table dying? Mine never will. Bring me vellums and Midnight Ink - the archives consume them faster than we can... acquire them - and the Journeyman table is yours. Your glyphs will look considerably less... posthumous.$B$BRequired:$B- 5 Weapon Vellum$B- 5 Armor Vellum$B- 10 Midnight Ink',
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
    `ID` = 90144, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 72, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Catarina Stanford in Stormwind.',
    `QuestDescription` = 'Your commissions have grown finer - your table should match. Artisan glyphwork wants a smoother surface and a truer edge than journeyman gear provides. Fill another order of vellums and ink for me, and the Artisan table is yours.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Catarina Stanford in Stormwind.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90144, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90144, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90144, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30713, 90144);
INSERT INTO `creature_questender` VALUES (30713, 90144);

-- 90145: Elise Brightletter (30717) - Ironforge
INSERT INTO `quest_template` SET
    `ID` = 90145, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 47, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Elise Brightletter in Ironforge.',
    `QuestDescription` = 'Back already? Good - yer linework''s improved, but that journeyman board''s holdin'' ye back. Fill another order fer me, vellums and Celestial Ink, and I''ll fit ye with the Artisan table: heavier stone, truer edge.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Elise Brightletter in Ironforge.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90145, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90145, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90145, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30717, 90145);
INSERT INTO `creature_questender` VALUES (30717, 90145);

-- 90146: Feyden Darkin (30715) - Darnassus
INSERT INTO `quest_template` SET
    `ID` = 90146, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 69, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Feyden Darkin in Darnassus.',
    `QuestDescription` = 'Your hand has grown surer, yet the wood beneath it tires. Craft is a partnership between scribe and surface. Bring another offering of vellum and ink, and the Artisan table will keep pace with your skill.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Feyden Darkin in Darnassus.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90146, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90146, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90146, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30715, 90146);
INSERT INTO `creature_questender` VALUES (30715, 90146);

-- 90147: Thoth (30716) - Exodar
INSERT INTO `quest_template` SET
    `ID` = 90147, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 930, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Thoth in the Exodar.',
    `QuestDescription` = 'Your progress is measurable and pleasing. The journeyman surface, however, now limits your stroke precision. Provide the requested vellums and ink, and I will furnish the Artisan model. Improvement should never wait on equipment.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Thoth in the Exodar.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90147, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90147, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90147, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30716, 90147);
INSERT INTO `creature_questender` VALUES (30716, 90147);

-- 90148: Jo'mah (30706) - Orgrimmar
INSERT INTO `quest_template` SET
    `ID` = 90148, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 76, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Jo''mah in Orgrimmar.',
    `QuestDescription` = 'Your glyphs are stronger. Your table is not. Artisan work needs a surface that does not flinch. Bring another order of vellums and ink, and take the Artisan table. Keep writing fast.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Jo''mah in Orgrimmar.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90148, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90148, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90148, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30706, 90148);
INSERT INTO `creature_questender` VALUES (30706, 90148);

-- 90149: Poshken Hardbinder (30709) - Thunder Bluff
INSERT INTO `quest_template` SET
    `ID` = 90149, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 81, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Poshken Hardbinder in Thunder Bluff.',
    `QuestDescription` = 'Your words carry more weight now, and a heavier story needs firmer ground beneath it. Bring vellums and ink once more for the elders'' records, and the Artisan table will bear your craft well.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Poshken Hardbinder in Thunder Bluff.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90149, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90149, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90149, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30709, 90149);
INSERT INTO `creature_questender` VALUES (30709, 90149);

-- 90150: Zantasia (30710) - Silvermoon
INSERT INTO `quest_template` SET
    `ID` = 90150, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 911, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Zantasia in Silvermoon City.',
    `QuestDescription` = 'Hm. You improve. Unexpected. But artisan calligraphy on journeyman furniture? Gauche. Bring me another order - and do mind the ink quality - and I shall release the Artisan table to you.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
    `QuestCompletionLog` = 'Return to Zantasia in Silvermoon City.',
    `RewardItem1` = 57487, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90150, `RequiredSkillID` = 773, `RequiredSkillPoints` = 225, `ExclusiveGroup` = 90144;
INSERT INTO `quest_offer_reward` SET `ID` = 90150, `RewardText` = 'Excellent craftsmanship on these vellums. Your new writing table will serve you well.';
INSERT INTO `quest_request_items` SET `ID` = 90150, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and ink?';
INSERT INTO `creature_queststarter` VALUES (30710, 90150);
INSERT INTO `creature_questender` VALUES (30710, 90150);

-- 90151: Margaux Parchley (30711) - Undercity
INSERT INTO `quest_template` SET
    `ID` = 90151, `QuestLevel` = 50, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 39350, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 37602, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43120, `RequiredItemCount3` = 10,
    `RewardFactionID1` = 68, `RewardFactionValue1` = 5,
    `LogTitle` = 'Artisan Scribe''s Tools',
    `LogDescription` = 'Bring advanced vellums and ink to Margaux Parchley in Undercity.',
    `QuestDescription` = 'Still writing? How... persistent. Your skill has outlived your table, which is more than most can say. Another delivery of vellums and ink, and the Artisan model is yours. The archives appreciate your... longevity.$B$BRequired:$B- 5 Weapon Vellum II$B- 5 Armor Vellum II$B- 10 Celestial Ink',
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
    `ID` = 90152, `AllowableRaces` = 3149, `QuestLevel` = 70, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43124, `RequiredItemCount1` = 10,
    `RequiredItemId2` = 43125, `RequiredItemCount2` = 10,
    `LogTitle` = 'Master Scribe''s Tools',
    `LogDescription` = 'Bring 10 Ethereal Inks and 10 Darkflame Inks to Michael Schwan at Honor Hold in Hellfire Peninsula.',
    `QuestDescription` = 'Dispatches, requisitions, casualty lists - this keep runs on paper, and my table is older than the war. A scribe is only as fast as the surface under the vellum. Bring me Ethereal and Darkflame Inks from your own stores, and I''ll build you a Master Writing Table: level, true, and steady enough for fieldwork.$B$BRequired:$B- 10 Ethereal Ink$B- 10 Darkflame Ink',
    `QuestCompletionLog` = 'Return to Michael Schwan.',
    `RewardItem1` = 57488, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90152, `RequiredSkillID` = 773, `RequiredSkillPoints` = 300, `ExclusiveGroup` = 90152;
INSERT INTO `quest_offer_reward` SET `ID` = 90152, `RewardText` = 'These inks are exquisite. Your Master Writing Table is ready.';
INSERT INTO `quest_request_items` SET `ID` = 90152, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the Ethereal and Darkflame Inks?';
INSERT INTO `creature_queststarter` VALUES (30721, 90152);
INSERT INTO `creature_questender` VALUES (30721, 90152);

-- 90153: Neferatti (30722) - Outland
INSERT INTO `quest_template` SET
    `ID` = 90153, `AllowableRaces` = 946, `QuestLevel` = 70, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43124, `RequiredItemCount1` = 10,
    `RequiredItemId2` = 43125, `RequiredItemCount2` = 10,
    `LogTitle` = 'Master Scribe''s Tools',
    `LogDescription` = 'Bring 10 Ethereal Inks and 10 Darkflame Inks to Neferatti at Thrallmar in Hellfire Peninsula.',
    `QuestDescription` = 'You scribe on THAT? A warped board and a prayer? No wonder your strokes wander. Precision, darling - a glyph is geometry, and geometry demands a true surface. Fetch me Ethereal and Darkflame Inks - the good ones, mind - and I shall fit you a Master Writing Table that puts every stroke exactly where you meant it.$B$BRequired:$B- 10 Ethereal Ink$B- 10 Darkflame Ink',
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
    `ID` = 90154, `QuestLevel` = 80, `MinLevel` = 0, `QuestSortID` = -371, -- Inscription
    `RewardXPDifficulty` = 5, `Flags` = 136,
    `RequiredItemId1` = 43146, `RequiredItemCount1` = 5,
    `RequiredItemId2` = 43145, `RequiredItemCount2` = 5,
    `RequiredItemId3` = 43126, `RequiredItemCount3` = 10,
    `LogTitle` = 'Grand Master Scribe''s Tools',
    `LogDescription` = 'Bring 5 Weapon Vellum III, 5 Armor Vellum III and 10 Inks of the Sea to Professor Pallin in Dalaran.',
    `QuestDescription` = 'A scribe''s hand is only half the craft - the other half is the table beneath it. Mine are built to Kirin Tor archive standard: rune-leveled, so ink never pools and vellum never slips. Bring me third-grade vellums and Ink of the Sea to stock the archive, and I''ll craft you a Grand Master Writing Table. Your glyphwork will thank you.$B$BRequired:$B- 5 Weapon Vellum III$B- 5 Armor Vellum III$B- 10 Ink of the Sea',
    `QuestCompletionLog` = 'Return to Professor Pallin in Dalaran.',
    `RewardItem1` = 57489, `RewardAmount1` = 1, `VerifiedBuild` = 0;
INSERT INTO `quest_template_addon` SET `ID` = 90154, `RequiredSkillID` = 773, `RequiredSkillPoints` = 375, `ExclusiveGroup` = 90154;
INSERT INTO `quest_offer_reward` SET `ID` = 90154, `RewardText` = 'Magnificent work. This Grand Master Writing Table is the pinnacle of scribing equipment.';
INSERT INTO `quest_request_items` SET `ID` = 90154, `EmoteOnComplete` = 1, `CompletionText` = 'Did you bring the vellums and Ink of the Sea?';
INSERT INTO `creature_queststarter` VALUES (28702, 90154);
INSERT INTO `creature_questender` VALUES (28702, 90154);

-- =====================================================
-- CROSS-CITY QUEST CHAIN CONDITIONS
-- RequiredSkillPoints alone doesn't hide ineligible
-- quests from the gossip window. Use reference conditions
-- so completing ANY city's quest unlocks the next tier.
-- =====================================================

-- Reference condition -90136: completed ANY Journeyman writing table quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90136;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90136, 0, 0, 0, 0, 8, 0, 90136, 0, 0, 0, 0, 0, '', 'JM table rewarded (Stormwind)'),
(-90136, 0, 0, 0, 1, 8, 0, 90137, 0, 0, 0, 0, 0, '', 'JM table rewarded (Ironforge)'),
(-90136, 0, 0, 0, 2, 8, 0, 90138, 0, 0, 0, 0, 0, '', 'JM table rewarded (Darnassus)'),
(-90136, 0, 0, 0, 3, 8, 0, 90139, 0, 0, 0, 0, 0, '', 'JM table rewarded (Exodar)'),
(-90136, 0, 0, 0, 4, 8, 0, 90140, 0, 0, 0, 0, 0, '', 'JM table rewarded (Orgrimmar)'),
(-90136, 0, 0, 0, 5, 8, 0, 90141, 0, 0, 0, 0, 0, '', 'JM table rewarded (Thunder Bluff)'),
(-90136, 0, 0, 0, 6, 8, 0, 90142, 0, 0, 0, 0, 0, '', 'JM table rewarded (Silvermoon)'),
(-90136, 0, 0, 0, 7, 8, 0, 90143, 0, 0, 0, 0, 0, '', 'JM table rewarded (Undercity)');

-- Reference condition -90144: completed ANY Artisan writing table quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90144;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90144, 0, 0, 0, 0, 8, 0, 90144, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Stormwind)'),
(-90144, 0, 0, 0, 1, 8, 0, 90145, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Ironforge)'),
(-90144, 0, 0, 0, 2, 8, 0, 90146, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Darnassus)'),
(-90144, 0, 0, 0, 3, 8, 0, 90147, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Exodar)'),
(-90144, 0, 0, 0, 4, 8, 0, 90148, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Orgrimmar)'),
(-90144, 0, 0, 0, 5, 8, 0, 90149, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Thunder Bluff)'),
(-90144, 0, 0, 0, 6, 8, 0, 90150, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Silvermoon)'),
(-90144, 0, 0, 0, 7, 8, 0, 90151, 0, 0, 0, 0, 0, '', 'Artisan table rewarded (Undercity)');

-- Reference condition -90152: completed ANY Master writing table quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = -90152;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(-90152, 0, 0, 0, 0, 8, 0, 90152, 0, 0, 0, 0, 0, '', 'Master table rewarded (Michael Schwan)'),
(-90152, 0, 0, 0, 1, 8, 0, 90153, 0, 0, 0, 0, 0, '', 'Master table rewarded (Neferatti)');

-- Artisan quests: require any Journeyman table
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` BETWEEN 90144 AND 90151;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90144, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (SW) - any JM table'),
(19, 0, 90145, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (IF) - any JM table'),
(19, 0, 90146, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (Darn) - any JM table'),
(19, 0, 90147, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (Exo) - any JM table'),
(19, 0, 90148, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (Org) - any JM table'),
(19, 0, 90149, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (TB) - any JM table'),
(19, 0, 90150, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (SM) - any JM table'),
(19, 0, 90151, 0, 0, -90136, 0, 0, 0, 0, 0, 0, 0, '', 'Artisan Table (UC) - any JM table');

-- Master quests: require any Artisan table
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (90152, 90153);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90152, 0, 0, -90144, 0, 0, 0, 0, 0, 0, 0, '', 'Master Table (Schwan) - any Artisan table'),
(19, 0, 90153, 0, 0, -90144, 0, 0, 0, 0, 0, 0, 0, '', 'Master Table (Neferatti) - any Artisan table');

-- Grand Master quest: require any Master table
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 90154;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 90154, 0, 0, -90152, 0, 0, 0, 0, 0, 0, 0, '', 'GM Table (Dalaran) - any Master table');

-- =====================================================
-- QUEST POIs - turn-in map markers [I-195]
-- One blob per quest at the quest ender (trainer) spawn
-- =====================================================
DELETE FROM `quest_poi` WHERE `QuestID` IN (90136,90137,90138,90139,90140,90141,90142,90143,90144,90145,90146,90147,90148,90149,90150,90151,90152,90153,90154);
DELETE FROM `quest_poi_points` WHERE `QuestID` IN (90136,90137,90138,90139,90140,90141,90142,90143,90144,90145,90146,90147,90148,90149,90150,90151,90152,90153,90154);

INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`) VALUES
(90136, 0, -1, 0, 301, 0, 0, 1, 0),
(90137, 0, -1, 0, 341, 0, 0, 1, 0),
(90138, 0, -1, 1, 381, 0, 0, 1, 0),
(90139, 0, -1, 1, 471, 0, 0, 1, 0),
(90140, 0, -1, 1, 321, 0, 0, 1, 0),
(90141, 0, -1, 1, 362, 0, 0, 1, 0),
(90142, 0, -1, 0, 480, 0, 0, 1, 0),
(90143, 0, -1, 0, 382, 0, 0, 1, 0),
(90144, 0, -1, 0, 301, 0, 0, 1, 0),
(90145, 0, -1, 0, 341, 0, 0, 1, 0),
(90146, 0, -1, 1, 381, 0, 0, 1, 0),
(90147, 0, -1, 1, 471, 0, 0, 1, 0),
(90148, 0, -1, 1, 321, 0, 0, 1, 0),
(90149, 0, -1, 1, 362, 0, 0, 1, 0),
(90150, 0, -1, 0, 480, 0, 0, 1, 0),
(90151, 0, -1, 0, 382, 0, 0, 1, 0),
(90152, 0, -1, 530, 465, 0, 0, 1, 0),
(90153, 0, -1, 530, 465, 0, 0, 1, 0),
(90154, 0, -1, 571, 510, 0, 0, 1, 0),
(90154, 1, -1, 571, 504, 1, 0, 3, 0);

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(90136, 0, 0, -8882, 837, 0),
(90136, 0, 1, -8882, 877, 0),
(90136, 0, 2, -8842, 877, 0),
(90136, 0, 3, -8842, 837, 0),
(90137, 0, 0, -4827, -1216, 0),
(90137, 0, 1, -4827, -1176, 0),
(90137, 0, 2, -4787, -1176, 0),
(90137, 0, 3, -4787, -1216, 0),
(90138, 0, 0, 10120, 2293, 0),
(90138, 0, 1, 10120, 2333, 0),
(90138, 0, 2, 10160, 2333, 0),
(90138, 0, 3, 10160, 2293, 0),
(90139, 0, 0, 5690, 6619, 0),
(90139, 0, 1, 5690, 6659, 0),
(90139, 0, 2, 5730, 6659, 0),
(90139, 0, 3, 5730, 6619, 0),
(90140, 0, 0, 1819, -4486, 0),
(90140, 0, 1, 1819, -4446, 0),
(90140, 0, 2, 1859, -4446, 0),
(90140, 0, 3, 1859, -4486, 0),
(90141, 0, 0, -1019, 189, 0),
(90141, 0, 1, -1019, 229, 0),
(90141, 0, 2, -979, 229, 0),
(90141, 0, 3, -979, 189, 0),
(90142, 0, 0, 7806, -5137, 0),
(90142, 0, 1, 7806, -5097, 0),
(90142, 0, 2, 7846, -5097, 0),
(90142, 0, 3, 7846, -5137, 0),
(90143, 0, 0, 1488, 264, 0),
(90143, 0, 1, 1488, 304, 0),
(90143, 0, 2, 1528, 304, 0),
(90143, 0, 3, 1528, 264, 0),
(90144, 0, 0, -8882, 837, 0),
(90144, 0, 1, -8882, 877, 0),
(90144, 0, 2, -8842, 877, 0),
(90144, 0, 3, -8842, 837, 0),
(90145, 0, 0, -4827, -1216, 0),
(90145, 0, 1, -4827, -1176, 0),
(90145, 0, 2, -4787, -1176, 0),
(90145, 0, 3, -4787, -1216, 0),
(90146, 0, 0, 10120, 2293, 0),
(90146, 0, 1, 10120, 2333, 0),
(90146, 0, 2, 10160, 2333, 0),
(90146, 0, 3, 10160, 2293, 0),
(90147, 0, 0, 5690, 6619, 0),
(90147, 0, 1, 5690, 6659, 0),
(90147, 0, 2, 5730, 6659, 0),
(90147, 0, 3, 5730, 6619, 0),
(90148, 0, 0, 1819, -4486, 0),
(90148, 0, 1, 1819, -4446, 0),
(90148, 0, 2, 1859, -4446, 0),
(90148, 0, 3, 1859, -4486, 0),
(90149, 0, 0, -1019, 189, 0),
(90149, 0, 1, -1019, 229, 0),
(90149, 0, 2, -979, 229, 0),
(90149, 0, 3, -979, 189, 0),
(90150, 0, 0, 7806, -5137, 0),
(90150, 0, 1, 7806, -5097, 0),
(90150, 0, 2, 7846, -5097, 0),
(90150, 0, 3, 7846, -5137, 0),
(90151, 0, 0, 1488, 264, 0),
(90151, 0, 1, 1488, 304, 0),
(90151, 0, 2, 1528, 304, 0),
(90151, 0, 3, 1528, 264, 0),
(90152, 0, 0, -794, 2731, 0),
(90152, 0, 1, -794, 2771, 0),
(90152, 0, 2, -754, 2771, 0),
(90152, 0, 3, -754, 2731, 0),
(90153, 0, 0, 218, 2821, 0),
(90153, 0, 1, 218, 2861, 0),
(90153, 0, 2, 258, 2861, 0),
(90153, 0, 3, 258, 2821, 0),
(90154, 0, 0, 5841, 687, 0),
(90154, 0, 1, 5841, 727, 0),
(90154, 0, 2, 5881, 727, 0),
(90154, 0, 3, 5881, 687, 0),
(90154, 1, 0, 5841, 687, 0),
(90154, 1, 1, 5841, 727, 0),
(90154, 1, 2, 5881, 727, 0),
(90154, 1, 3, 5881, 687, 0);
