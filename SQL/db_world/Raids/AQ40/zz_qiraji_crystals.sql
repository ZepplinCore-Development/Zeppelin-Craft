-- Qiraji Crystals no longer drop from AQ40, instead Crystal fragments are found.
-- A new NPC Anachronos has been added to the dragon Cohort after Prophet Skeram.
-- Crystal fragments can be turned in for the mount crystals with Anachronos via a quest.
-- Crystal fragment quests are repeatable for reputation with Brood of Nozdormu.


SET @BLUE_CRYSTAL = 21218,
    @BLUE_CRYSTAL_FRAGMENT = 58305,
    @BLUE_CRYSTAL_QUEST_1 = 441233,
    @BLUE_CRYSTAL_QUEST_N = 441234,

    @GREEN_CRYSTAL = 21323,
    @GREEN_CRYSTAL_FRAGMENT = 58306,
    @GREEN_CRYSTAL_QUEST_1 = 441235,
    @GREEN_CRYSTAL_QUEST_N = 441236,

    @YELLOW_CRYSTAL = 21324,
    @YELLOW_CRYSTAL_FRAGMENT = 58307,
    @YELLOW_CRYSTAL_QUEST_1 = 441237,
    @YELLOW_CRYSTAL_QUEST_N = 441238,

    @RED_CRYSTAL = 21321,
    @RED_CRYSTAL_FRAGMENT = 58308,
    @RED_CRYSTAL_QUEST_1 = 441239,
    @RED_CRYSTAL_QUEST_N = 441240,

    @FRAGMENT_QUANTITY = 10,
    @ANACHRONOS = 9102599,
    @BROOD_OF_NOZDORMU = 910,
    @CENARION_CIRCLE = 609,
    @MORTAL_CHAMPIONS_1 = 8579,
    @MORTAL_CHAMPIONS_N = 8595,
    @FRAGMENT_REFERENCE_LOOT = 901000;


-- Updated Crystals

    -- Blue Crystal

        DELETE FROM `item_template` WHERE (`entry` = @BLUE_CRYSTAL);
        INSERT INTO `item_template` SET
            `entry` = @BLUE_CRYSTAL,
            `class` = 15,
            `subclass` = 5,
            `name` = 'Blue Qiraji Resonating Crystal',
            `displayid` = 33969,
            `Quality` = 3,
            `BuyPrice` = 1000000,
            `ItemLevel` = 40,
            `RequiredLevel` = 60,
            `RequiredSkill` = 762,
            `RequiredSkillRank` = 75,
            `StatsCount` = 0,
            `delay` = 0,
            `spellid_1` = 55884,
            `spellcharges_1` = -1,
            `spellcategory_1` = 330,
            `spellcategorycooldown_1` = 3000,
            `spellid_2` = 25953,
            `spelltrigger_2` = 6,
            `spellcooldown_2` = 0,
            `spellcategorycooldown_2` = 0,
            `bonding` = 1,
            `description` = 'Teaches you how to summon a Blue Silithid Tank.',
            `Material` = -1,
            `DisenchantID` = 31,
            `VerifiedBuild` = 12340;

    -- Green Crystal
        DELETE FROM `item_template` WHERE (`entry` = @GREEN_CRYSTAL);
        INSERT INTO `item_template` SET
            `entry` = @GREEN_CRYSTAL,
            `class` = 15,
            `subclass` = 5,
            `name` = 'Green Qiraji Resonating Crystal',
            `displayid` = 33970,
            `Quality` = 3,
            `BuyPrice` = 1000000,
            `ItemLevel` = 40,
            `RequiredLevel` = 60,
            `RequiredSkill` = 762,
            `RequiredSkillRank` = 75,
            `StatsCount` = 0,
            `delay` = 0,
            `spellid_1` = 55884,
            `spellcharges_1` = -1,
            `spellcategory_1` = 330,
            `spellcategorycooldown_1` = 3000,
            `spellid_2` = 26056,
            `spelltrigger_2` = 6,
            `spellcooldown_2` = 0,
            `spellcategorycooldown_2` = 0,
            `bonding` = 1,
            `description` = 'Teaches you how to summon a Green Silithid Tank.',
            `Material` = -1,
            `DisenchantID` = 31,
            `VerifiedBuild` = '12340';

    -- Yellow Crystal

        DELETE FROM `item_template` WHERE (`entry` = @YELLOW_CRYSTAL);
        INSERT INTO `item_template` SET
            `entry` = @YELLOW_CRYSTAL,
            `class` = 15,
            `subclass` = 5,
            `name` = 'Yellow Qiraji Resonating Crystal',
            `displayid` = 33972,
            `Quality` = 3,
            `BuyPrice` = 1000000,
            `ItemLevel` = 40,
            `RequiredLevel` = 60,
            `RequiredSkill` = 762,
            `RequiredSkillRank` = 75,
            `StatsCount` = 0,
            `delay` = 0,
            `spellid_1` = 55884,
            `spellcharges_1` = -1,
            `spellcategory_1` = 330,
            `spellcategorycooldown_1` = 3000,
            `spellid_2` = 26055,
            `spelltrigger_2` = 6,
            `spellcooldown_2` = 0,
            `spellcategorycooldown_2` = 0,
            `bonding` = 1,
            `description` = 'Teaches you how to summon a Yellow Silithid Tank.',
            `Material` = -1,
            `DisenchantID` = 31,
            `VerifiedBuild` = 12340;

    -- Red Crystal

        DELETE FROM `item_template` WHERE (`entry` = @RED_CRYSTAL);
        INSERT INTO `item_template` SET
            `entry` = @RED_CRYSTAL,
            `class` = 15,
            `subclass` = 5,
            `name` = 'Red Qiraji Resonating Crystal',
            `displayid` = 33971,
            `Quality` = 3,
            `BuyPrice` = 1000000,
            `ItemLevel` = 40,
            `RequiredLevel` = 60,
            `RequiredSkill` = 762,
            `RequiredSkillRank` = 75,
            `StatsCount` = 0,
            `delay` = 0,
            `spellid_1` = 55884,
            `spellcharges_1` = -1,
            `spellcategory_1` = 330,
            `spellcategorycooldown_1` = 3000,
            `spellid_2` = 26054,
            `spelltrigger_2` = 6,
            `spellcooldown_2` = 0,
            `spellcategorycooldown_2` = 0,
            `bonding` = 1,
            `description` = 'Teaches you how to summon a Red Silithid Tank.',
            `Material` = -1,
            `DisenchantID` = 31,
            `VerifiedBuild` = 12340;

-- New Crystal Fragment Items

    -- Blue Qiraji Crystal Fragment
        DELETE FROM `item_template` WHERE `entry` = @BLUE_CRYSTAL_FRAGMENT;
        INSERT INTO `item_template` SET
            `entry` = @BLUE_CRYSTAL_FRAGMENT,
            `class` = 7,
            `subclass` = 11,
            `name` = 'Blue Qiraji Crystal Fragment',
            `displayid` = 54319,
            `Quality` = 2,
            `FlagsExtra` = 16,
            `ItemLevel` = 69,
            `stackable` = 100,
            `StatsCount` = 0,
            `description` = 'A fragment that might be of use to somebody.',
            `BagFamily` = 512,
            `VerifiedBuild` = '0';

    -- Green Qiraji Crystal Fragment
        DELETE FROM `item_template` WHERE `entry` = @GREEN_CRYSTAL_FRAGMENT;
        INSERT INTO `item_template` SET
            `entry` = @GREEN_CRYSTAL_FRAGMENT,
            `class` = 7,
            `subclass` = 11,
            `name` = 'Green Qiraji Crystal Fragment',
            `displayid` = 54322,
            `Quality` = 2,
            `FlagsExtra` = 16,
            `ItemLevel` = 69,
            `stackable` = 100,
            `StatsCount` = 0,
            `description` = 'A fragment that might be of use to somebody.',
            `BagFamily` = 512,
            `VerifiedBuild` = '0';

    -- Yellow Qiraji Crystal Fragment
        DELETE FROM `item_template` WHERE `entry` = @YELLOW_CRYSTAL_FRAGMENT;
        INSERT INTO `item_template` SET
            `entry` = @YELLOW_CRYSTAL_FRAGMENT,
            `class` = 7,
            `subclass` = 11,
            `name` = 'Yellow Qiraji Crystal Fragment',
            `displayid` = 54317,
            `Quality` = 2,
            `FlagsExtra` = 16,
            `ItemLevel` = 69,
            `stackable` = 100,
            `StatsCount` = 0,
            `description` = 'A fragment that might be of use to somebody.',
            `BagFamily` = 512,
            `VerifiedBuild` = '0';

    -- Red Qiraji Crystal Fragment
        DELETE FROM `item_template` WHERE `entry` = @RED_CRYSTAL_FRAGMENT;
        INSERT INTO `item_template` SET
            `entry` = @RED_CRYSTAL_FRAGMENT,
            `class` = 7,
            `subclass` = 11,
            `name` = 'Red Qiraji Crystal Fragment',
            `displayid` = 54315,
            `Quality` = 2,
            `FlagsExtra` = 16,
            `ItemLevel` = 69,
            `stackable` = 100,
            `StatsCount` = 0,
            `description` = 'A fragment that might be of use to somebody.',
            `BagFamily` = 512,
            `VerifiedBuild` = '0';

-- New AQ40 Bronze Dragonflight NPC Anachronos
    DELETE FROM `creature_template` WHERE (`entry` = @ANACHRONOS);
    INSERT INTO `creature_template` SET
        `entry` = @ANACHRONOS,
        `name` = 'Anachronos',
        `IconName` = NULL,
        `minlevel` = 63,
        `maxlevel` = 63,
        `faction` = 35,
        `npcflag` = 2,
        `DamageModifier` = 5,
        `BaseAttackTime` = 2000,
        `RangeAttackTime` = 2000,
        `unit_class` = 2,
        `unit_flags2` = 2048,
        `type` = 2,
        `skinloot` = 100001,
        `HealthModifier` = 8,
        `mechanic_immune_mask` = 617299803,
        `flags_extra` = 2,
        `VerifiedBuild` = '12340';

    DELETE FROM `creature_template_model` WHERE (`CreatureID` = @ANACHRONOS);
    INSERT INTO `creature_template_model` SET
        `CreatureID` = @ANACHRONOS,
        `CreatureDisplayID` = 15415,
        `Probability` = 1,
        `VerifiedBuild` = 12340;

    DELETE FROM `creature` WHERE (`id1` = @ANACHRONOS);
    INSERT INTO `creature` SET
        `guid` = 5300718,
        `id1` = @ANACHRONOS,
        `map` = 531,
        `position_x` = -8500.73,
        `position_y` = 1941.3,
        `position_z` = 135.732,
        `orientation` = 0.134523,
        `spawntimesecs` = 300,
        `curhealth` = 156,
        `curmana` = 110,
        `VerifiedBuild` = NULL,
        `Comment` = NULL;

-- Mortal Champions Quests Moved to Anachronos
    DELETE FROM `creature_queststarter` WHERE (`quest` = @MORTAL_CHAMPIONS_N);
    INSERT INTO `creature_queststarter` SET
        `id` = @ANACHRONOS,
        `quest` = @MORTAL_CHAMPIONS_N;

    DELETE FROM `creature_questender` WHERE (`quest` = @MORTAL_CHAMPIONS_N);
    INSERT INTO `creature_questender` SET
        `id` = @ANACHRONOS,
        `quest` = @MORTAL_CHAMPIONS_N;

    DELETE FROM `creature_queststarter` WHERE (`quest` = @MORTAL_CHAMPIONS_1);
    INSERT INTO `creature_queststarter` SET
        `id` = @ANACHRONOS,
        `quest` = @MORTAL_CHAMPIONS_1;

    DELETE FROM `creature_questender` WHERE (`quest` = @MORTAL_CHAMPIONS_1);
    INSERT INTO `creature_questender` SET
        `id` = @ANACHRONOS,
        `quest` = @MORTAL_CHAMPIONS_1;

    UPDATE `quest_offer_reward` SET `RewardText` = 'I see that you''re no ordinary mortal, $N. Your chances against the Old God, however infinitely small, are greater than ours at this point. After all, while he expects dragons at his doorstep, he is not prepared for someone like you.$B$BJust as Staghelm and I defeated the Qiraji a thousand years ago through the alliance of mortal and dragon races, we too shall form a pact. Gain the trust of the Bronze Dragonflight. Only then we shall make a true champion out of you.' WHERE (`ID` = @MORTAL_CHAMPIONS_1);

-- New quests for crystal fragments

    -- Blue Qiraji Crystal Fragments 

        -- Initial Blue Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @BLUE_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template` SET
                `ID` = @BLUE_CRYSTAL_QUEST_1,
                `QuestType` = 2,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Blue Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Blue Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The ancient qiraji crystals once wielded immense power, their energy drawn from the heart of Ahn''Qiraj itself. Shattered in the wake of past conflicts, their fragments now lie scattered within the temple. Recover ten Blue Qiraji Crystal Fragments from within the temple of Ahn''Qiraj. With enough pieces, a complete crystal may be reformed—restoring a relic of a forgotten age.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @BLUE_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `RewardItem1` = @BLUE_CRYSTAL,
                `RewardAmount1` = 1,
                `VerifiedBuild` = '12340';

            DELETE FROM `quest_offer_reward` WHERE `ID` = @BLUE_CRYSTAL_QUEST_1;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @BLUE_CRYSTAL_QUEST_1,
                `RewardText` = 'You''ve done well, mortal. The fragments resonate with ancient power—power I have not felt since the fall of the qiraji empire. With these, I can restore a crystal to its original form. Take it. This relic once served the empire''s twisted designs... now, it may serve a nobler purpose in your hands. Use it wisely.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @BLUE_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template_addon` SET
                `ID` = @BLUE_CRYSTAL_QUEST_1;

            DELETE FROM `creature_queststarter` WHERE (`quest` = @BLUE_CRYSTAL_QUEST_1);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @BLUE_CRYSTAL_QUEST_1;

            DELETE FROM `creature_questender` WHERE (`quest` = @BLUE_CRYSTAL_QUEST_1);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @BLUE_CRYSTAL_QUEST_1;

        -- Repeated Blue Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @BLUE_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template` SET
                `ID` = @BLUE_CRYSTAL_QUEST_N,
                `QuestType` = 0,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Blue Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Blue Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The fragments you''ve brought have proven invaluable, but there is still much to uncover. Each crystal holds echoes of ancient power—echoes I must understand fully if we are to learn the truth of the qiraji''s creations. If you can recover more of the Blue Qiraji Crystal Fragments from within the Temple of Ahn''Qiraj, I will continue my research. Every shard brings us closer to unlocking the secrets buried beneath the sands.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @BLUE_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `VerifiedBuild` = '12340';     

            DELETE FROM `quest_offer_reward` WHERE `ID` = @BLUE_CRYSTAL_QUEST_N;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @BLUE_CRYSTAL_QUEST_N,
                `RewardText` = 'Ah, more fragments. Each one strengthens my understanding of the ancient magics that once coursed through these halls. Though you may not see it, your efforts carry great weight. Knowledge, like power, is built shard by shard.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @BLUE_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template_addon` SET
                `ID` = @BLUE_CRYSTAL_QUEST_N,
                `PrevQuestID` = @BLUE_CRYSTAL_QUEST_1,
                `SpecialFlags` = 1;

            DELETE FROM `creature_queststarter` WHERE (`quest` = @BLUE_CRYSTAL_QUEST_N);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @BLUE_CRYSTAL_QUEST_N;

            DELETE FROM `creature_questender` WHERE (`quest` = @BLUE_CRYSTAL_QUEST_N);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @BLUE_CRYSTAL_QUEST_N;

    -- Red Qiraji Crystal Fragments

        -- Initial Red Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @RED_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template` SET
                `ID` = @RED_CRYSTAL_QUEST_1,
                `QuestType` = 2,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Red Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Red Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The ancient qiraji crystals once wielded immense power, their energy drawn from the heart of Ahn''Qiraj itself. Shattered in the wake of past conflicts, their fragments now lie scattered within the temple. Recover ten Red Qiraji Crystal Fragments from within the temple of Ahn''Qiraj. With enough pieces, a complete crystal may be reformed—restoring a relic of a forgotten age.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @RED_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `RewardItem1` = @RED_CRYSTAL,
                `RewardAmount1` = 1,
                `VerifiedBuild` = '12340';

            DELETE FROM `quest_offer_reward` WHERE `ID` = @RED_CRYSTAL_QUEST_1;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @RED_CRYSTAL_QUEST_1,
                `RewardText` = 'You''ve done well, mortal. The fragments resonate with ancient power—power I have not felt since the fall of the qiraji empire. With these, I can restore a crystal to its original form. Take it. This relic once served the empire''s twisted designs... now, it may serve a nobler purpose in your hands. Use it wisely.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @RED_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template_addon` SET
                `ID` = @RED_CRYSTAL_QUEST_1;

            DELETE FROM `creature_queststarter` WHERE (`quest` = @RED_CRYSTAL_QUEST_1);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @RED_CRYSTAL_QUEST_1;

            DELETE FROM `creature_questender` WHERE (`quest` = @RED_CRYSTAL_QUEST_1);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @RED_CRYSTAL_QUEST_1;


        -- Repeated Red Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @RED_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template` SET
                `ID` = @RED_CRYSTAL_QUEST_N,
                `QuestType` = 0,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Blue Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Red Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The fragments you''ve brought have proven invaluable, but there is still much to uncover. Each crystal holds echoes of ancient power—echoes I must understand fully if we are to learn the truth of the qiraji''s creations. If you can recover more of the Red Qiraji Crystal Fragments from within the Temple of Ahn''Qiraj, I will continue my research. Every shard brings us closer to unlocking the secrets buried beneath the sands.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @RED_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `VerifiedBuild` = '12340';     

            DELETE FROM `quest_offer_reward` WHERE `ID` = @RED_CRYSTAL_QUEST_N;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @RED_CRYSTAL_QUEST_N,
                `RewardText` = 'Ah, more fragments. Each one strengthens my understanding of the ancient magics that once coursed through these halls. Though you may not see it, your efforts carry great weight. Knowledge, like power, is built shard by shard.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @RED_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template_addon` SET
                `ID` = @RED_CRYSTAL_QUEST_N,
                `PrevQuestID` = @RED_CRYSTAL_QUEST_1,
                `SpecialFlags` = 1;                

            DELETE FROM `creature_queststarter` WHERE (`quest` = @RED_CRYSTAL_QUEST_N);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @RED_CRYSTAL_QUEST_N;

            DELETE FROM `creature_questender` WHERE (`quest` = @RED_CRYSTAL_QUEST_N);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @RED_CRYSTAL_QUEST_N;

    -- Yellow Qiraji Crystal Fragments

        -- Initial Yellow Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_1,
                `QuestType` = 2,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Yellow Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Yellow Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The ancient qiraji crystals once wielded immense power, their energy drawn from the heart of Ahn''Qiraj itself. Shattered in the wake of past conflicts, their fragments now lie scattered within the temple. Recover ten Yellow Qiraji Crystal Fragments from within the temple of Ahn''Qiraj. With enough pieces, a complete crystal may be reformed—restoring a relic of a forgotten age.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @YELLOW_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `RewardItem1` = @YELLOW_CRYSTAL,
                `RewardAmount1` = 1,
                `VerifiedBuild` = '12340';

            DELETE FROM `quest_offer_reward` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_1;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_1,
                `RewardText` = 'You''ve done well, mortal. The fragments resonate with ancient power—power I have not felt since the fall of the qiraji empire. With these, I can restore a crystal to its original form. Take it. This relic once served the empire''s twisted designs... now, it may serve a nobler purpose in your hands. Use it wisely.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template_addon` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_1;

            DELETE FROM `creature_queststarter` WHERE (`quest` = @YELLOW_CRYSTAL_QUEST_1);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @YELLOW_CRYSTAL_QUEST_1;

            DELETE FROM `creature_questender` WHERE (`quest` = @YELLOW_CRYSTAL_QUEST_1);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @YELLOW_CRYSTAL_QUEST_1;

        -- Repeated Yellow Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_N,
                `QuestType` = 0,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Blue Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Yellow Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The fragments you''ve brought have proven invaluable, but there is still much to uncover. Each crystal holds echoes of ancient power—echoes I must understand fully if we are to learn the truth of the qiraji''s creations. If you can recover more of the Yellow Qiraji Crystal Fragments from within the Temple of Ahn''Qiraj, I will continue my research. Every shard brings us closer to unlocking the secrets buried beneath the sands.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @YELLOW_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `VerifiedBuild` = '12340';     

            DELETE FROM `quest_offer_reward` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_N;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_N,
                `RewardText` = 'Ah, more fragments. Each one strengthens my understanding of the ancient magics that once coursed through these halls. Though you may not see it, your efforts carry great weight. Knowledge, like power, is built shard by shard.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @YELLOW_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template_addon` SET
                `ID` = @YELLOW_CRYSTAL_QUEST_N,
                `PrevQuestID` = @YELLOW_CRYSTAL_QUEST_1,
                `SpecialFlags` = 1;      

            DELETE FROM `creature_queststarter` WHERE (`quest` = @YELLOW_CRYSTAL_QUEST_N);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @YELLOW_CRYSTAL_QUEST_N;

            DELETE FROM `creature_questender` WHERE (`quest` = @YELLOW_CRYSTAL_QUEST_N);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @YELLOW_CRYSTAL_QUEST_N;

    -- Green Qiraji Crystal Fragments

        -- Initial Green Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @GREEN_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template` SET
                `ID` = @GREEN_CRYSTAL_QUEST_1,
                `QuestType` = 2,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Green Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Green Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The ancient qiraji crystals once wielded immense power, their energy drawn from the heart of Ahn''Qiraj itself. Shattered in the wake of past conflicts, their fragments now lie scattered within the temple. Recover ten Green Qiraji Crystal Fragments from within the temple of Ahn''Qiraj. With enough pieces, a complete crystal may be reformed—restoring a relic of a forgotten age.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @GREEN_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `RewardItem1` = @GREEN_CRYSTAL,
                `RewardAmount1` = 1,
                `VerifiedBuild` = '12340';

            DELETE FROM `quest_offer_reward` WHERE `ID` = @GREEN_CRYSTAL_QUEST_1;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @GREEN_CRYSTAL_QUEST_1,
                `RewardText` = 'You''ve done well, mortal. The fragments resonate with ancient power—power I have not felt since the fall of the qiraji empire. With these, I can restore a crystal to its original form. Take it. This relic once served the empire''s twisted designs... now, it may serve a nobler purpose in your hands. Use it wisely.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @GREEN_CRYSTAL_QUEST_1;
            INSERT INTO `quest_template_addon` SET
                `ID` = @GREEN_CRYSTAL_QUEST_1;

            DELETE FROM `creature_queststarter` WHERE (`quest` = @GREEN_CRYSTAL_QUEST_1);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @GREEN_CRYSTAL_QUEST_1;

            DELETE FROM `creature_questender` WHERE (`quest` = @GREEN_CRYSTAL_QUEST_1);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @GREEN_CRYSTAL_QUEST_1;

        -- Repeated Green Qiraji Crystal Fragments 
            DELETE FROM `quest_template` WHERE `ID` = @GREEN_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template` SET
                `ID` = @GREEN_CRYSTAL_QUEST_N,
                `QuestType` = 0,
                `QuestLevel` = 60,
                `MinLevel` = 60,
                `QuestSortID` = 3428,
                `QuestInfoID` = 62,
                `RewardXPDifficulty` = 5,
                `RewardFactionID1` = @BROOD_OF_NOZDORMU,
                `RewardFactionValue1` = 7,
                `RewardFactionID2` = @CENARION_CIRCLE,
                `RewardFactionValue2` = 5,
                `LogTitle` = 'Blue Qiraji Crystal Fragments',
                `LogDescription` = 'Anachronos wants you to collect Green Qiraji Crystal Fragments in Ahn''Qiraj Temple.',
                `QuestDescription` = 'The fragments you''ve brought have proven invaluable, but there is still much to uncover. Each crystal holds echoes of ancient power—echoes I must understand fully if we are to learn the truth of the qiraji''s creations. If you can recover more of the Green Qiraji Crystal Fragments from within the Temple of Ahn''Qiraj, I will continue my research. Every shard brings us closer to unlocking the secrets buried beneath the sands.',
                `QuestCompletionLog` = 'Return to Anachronos in Ahn''Qiraj Temple.',
                `RequiredItemId1` = @GREEN_CRYSTAL_FRAGMENT,
                `RequiredItemCount1` = @FRAGMENT_QUANTITY,
                `VerifiedBuild` = '12340';     

            DELETE FROM `quest_offer_reward` WHERE `ID` = @GREEN_CRYSTAL_QUEST_N;
            INSERT INTO `quest_offer_reward` SET
                `ID` = @GREEN_CRYSTAL_QUEST_N,
                `RewardText` = 'Ah, more fragments. Each one strengthens my understanding of the ancient magics that once coursed through these halls. Though you may not see it, your efforts carry great weight. Knowledge, like power, is built shard by shard.';

            DELETE FROM `quest_template_addon` WHERE `ID` = @GREEN_CRYSTAL_QUEST_N;
            INSERT INTO `quest_template_addon` SET
                `ID` = @GREEN_CRYSTAL_QUEST_N,
                `PrevQuestID` = @GREEN_CRYSTAL_QUEST_1,
                `SpecialFlags` = 1;     

            DELETE FROM `creature_queststarter` WHERE (`quest` = @GREEN_CRYSTAL_QUEST_N);
            INSERT INTO `creature_queststarter` SET
                `id` = @ANACHRONOS,
                `quest` = @GREEN_CRYSTAL_QUEST_N;

            DELETE FROM `creature_questender` WHERE (`quest` = @GREEN_CRYSTAL_QUEST_N);
            INSERT INTO `creature_questender` SET
                `id` = @ANACHRONOS,
                `quest` = @GREEN_CRYSTAL_QUEST_N;                

-- Qiraji Crystal Fragment Reference Loot
    DELETE FROM `reference_loot_template` WHERE (`Entry` = @FRAGMENT_REFERENCE_LOOT);

    INSERT INTO `reference_loot_template` SET
        `Entry` = @FRAGMENT_REFERENCE_LOOT,
        `Item` = @BLUE_CRYSTAL_FRAGMENT,
        `Chance` = 18,
        `GroupId` = 1,
        `MaxCount` = 1;

    INSERT INTO `reference_loot_template` SET
        `Entry` = @FRAGMENT_REFERENCE_LOOT,
        `Item` = @GREEN_CRYSTAL_FRAGMENT,
        `Chance` = 18,
        `GroupId` = 1,
        `MaxCount` = 1;

    INSERT INTO `reference_loot_template` SET
        `Entry` = @FRAGMENT_REFERENCE_LOOT,
        `Item` = @YELLOW_CRYSTAL_FRAGMENT,
        `Chance` = 18,
        `GroupId` = 1,
        `MaxCount` = 1;

    INSERT INTO `reference_loot_template` SET
        `Entry` = @FRAGMENT_REFERENCE_LOOT,
        `Item` = @RED_CRYSTAL_FRAGMENT,
        `Chance` = 3,
        `GroupId` = 1,
        `MaxCount` = 1;

-- Creature Loot

    -- Obsidian Eradicator Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15262 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15262,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';


    -- Qiraji Slayer Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15250 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15250,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Qiraji Mindslayer Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15246 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15246,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Qiraji Brainwasher Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15247 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15247,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Qiraji Lasher Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15249 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15249,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Anubisath Sentinel Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15264 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15264,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Obsidian Nullifier Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15312 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15312,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Anubisath Defender Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15277 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15277,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Qiraji Champion Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15252 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15252,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';

    -- Anubisath Warder Loot
        DELETE FROM `creature_loot_template` WHERE (`Entry` = 15311 AND `Item` IN (@FRAGMENT_REFERENCE_LOOT, @BLUE_CRYSTAL, @GREEN_CRYSTAL, @RED_CRYSTAL, @YELLOW_CRYSTAL));
        INSERT INTO `creature_loot_template` SET
            `Entry` = 15311,
            `Item` = @FRAGMENT_REFERENCE_LOOT,
            `Reference` = @FRAGMENT_REFERENCE_LOOT,
            `GroupId` = 1,
            `Comment` = 'Qiraji Crystal Fragment Reference Table';







 

