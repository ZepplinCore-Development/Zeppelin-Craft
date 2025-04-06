-- Awful Experiments (New Quest)
SET @QUESTID := 90001;
SET @GEORGE := 9000002;
SET @ABOM := 10564;

-- QUEST

    -- QUEST TEMPLATE
        DELETE FROM `quest_template` WHERE `ID` = @QUESTID;
        INSERT INTO `quest_template` SET
            `ID` = @QUESTID,
            `QuestLevel` = 14,
            `MinLevel` = 10,
            `QuestSortID` = 153,
            `RewardXPDifficulty` = 5,
            `RewardMoney` = 143,
            `RewardChoiceItemID1` = 31268,
            `RewardChoiceItemQuantity1` = 1,
            `RewardChoiceItemID2` = 31270,
            `RewardChoiceItemQuantity2` = 1,
            `RewardChoiceItemID3` = 31269,
            `RewardChoiceItemQuantity3` = 1,
            `POIx` = 1698,
            `POIy` = 125,
            `RewardFactionID1` = 68,
            `RewardFactionValue1` = 5,
            `AllowableRaces` = 690,
            `LogTitle` = 'Awful Experiments',
            `LogDescription` = 'Eradicate Failed Abominations from the ruins of Lordaeron.',
            `QuestDescription` = 'Deathguard George is seeking skilled adventurers to aid in the eradication of abominations within the Lordaeron ruins. These monstrous creations are the result of failed experiments by the Forsaken and are causing havoc and destruction. They are concentrated on the northern side of the ruins, closest to the entrance to Undercity. George is offering a reward for any abominations killed, and warns that they are highly dangerous and should not be underestimated. Can you help rid the ruins of these grotesque creatures?',
            `QuestCompletionLog` = 'Return to Deathguard George to claim your reward. He is at the Forsaken camp at the south side of Lordaeron ruins.',
            `RequiredNpcOrGo1` = @ABOM,
            `RequiredNpcOrGoCount1` = 10,
            `ObjectiveText1` = 'Failed Abominations',
            `VerifiedBuild` = '0';

    -- Quest Template Addon
        DELETE FROM `quest_template_addon` WHERE `ID` = @QUESTID;
        INSERT INTO `quest_template_addon` SET
            `ID` = @QUESTID;

    -- Quest Offer Reward
        DELETE FROM `quest_offer_reward` WHERE `ID` = @QUESTID;
        INSERT INTO `quest_offer_reward` SET
            `ID` = @QUESTID,
            `RewardText` = 'clearing out the abomination mess within the ruins is just the beginning. Please choose your reward.';

    -- Quest Request Items
        DELETE FROM `quest_request_items` WHERE `ID` = @QUESTID;
        INSERT INTO `quest_request_items` SET
            `ID` = @QUESTID,
            `CompletionText` = 'Return to me once you have dealt with the abominations in the ruins';

    -- Quest Starter
        DELETE FROM `creature_queststarter` WHERE `id` = @GEORGE;
        INSERT INTO `creature_queststarter` SET
            `id` = @GEORGE,
            `quest` = @QUESTID;

    -- Quest Ender
        DELETE FROM `creature_questender` WHERE `id` = @GEORGE;
        INSERT INTO `creature_questender` SET
            `id` = @GEORGE,
            `quest` = @QUESTID;

    -- Quest POI
        DELETE FROM `quest_poi` WHERE `QuestID` = @QUESTID;
        INSERT INTO `quest_poi` SET
            `QuestID` = @QUESTID,
            `WorldMapAreaId` = 3601,
            `Flags` = 1;

    -- Quest POI Points
        DELETE FROM `quest_poi_points` WHERE `QuestID` = @QUESTID;
        INSERT INTO `quest_poi_points` SET
            `QuestID` = @QUESTID,
            `X` = 1698,
            `Y` = 125;


-- DEATHGUARD GEORGE

    -- DEATHGUARD GEORGE Creature Template
        DELETE FROM `creature_template` WHERE (`entry` = @GEORGE);
        INSERT INTO `creature_template` SET
            `entry` = @GEORGE,
            `name` = 'Deathguard George',
            `minlevel` = 25,
            `maxlevel` = 25,
            `faction` = 118,
            `npcflag` = 2,
            `detection_range` = 1,
            `BaseAttackTime` = 2000,
            `RangeAttackTime` = 2000,
            `unit_class` = 1,
            `type` = 6,
            `VerifiedBuild` = '0';

    -- DEATHGUARD GEORGE Creature Template Model
        DELETE FROM `creature_template_model` WHERE `CreatureID` = @GEORGE;
        INSERT INTO `creature_template_model` SET
            `CreatureID` = @GEORGE,
            `idx` = 1,
            `CreatureDisplayID` = '25426',
            `probability` = 1.0;

    -- DEATHGUARD GEORGE Creature
    DELETE FROM `creature` WHERE `id1` = @GEORGE;
    INSERT INTO `creature` SET
        `id1` = @GEORGE,
        `position_x` = 1394.91,
        `position_y` = 273.723,
        `position_z` = 61.5899,
        `orientation` = 5.69995,
        `spawntimesecs` = 300,
        `curhealth` = 560,
        `VerifiedBuild` = NULL;


-- FAILED ABOMINATIONS

    -- Failed Abominations Creature Template
        DELETE FROM `creature_template` WHERE (`entry` = @ABOM);
        INSERT INTO `creature_template` SET
            `entry` = @ABOM,
            `name` = 'Failed Abomination',
            `minlevel` = 12,
            `maxlevel` = 14,
            `faction` = 16,
            `DamageModifier` = '0.3',
            `BaseAttackTime` = 2000,
            `RangeAttackTime` = 2000,
            `unit_class` = 1,
            `unit_flags2` = 2048,
            `type` = 6,
            `lootid` = 846,
            `mingold` = 17,
            `maxgold` = 29,
            `MovementType` = 1,
            `mechanic_immune_mask` = 8388624,
            `VerifiedBuild` = '0';

    -- Failed Abominations Creature Template Model
        DELETE FROM `creature_template_model` WHERE `CreatureID` = @ABOM;
        INSERT INTO `creature_template_model` SET
            `CreatureID` = @ABOM,
            `idx` = 1,
            `CreatureDisplayID` = '1693',
            `probability` = 1.0;

    -- Failed Abominations Creature 
        DELETE FROM `creature` WHERE `id1` = @ABOM;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1584.77,
            `position_y` = 90.939,
            `position_z` = 60.8592,
            `orientation` = 1.455,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 247,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1584.3,
            `position_y` = 128.86,
            `position_z` = 61.6605,
            `orientation` = 5.96744,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 247,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1635.79,
            `position_y` = 125.086,
            `position_z` = 60.2829,
            `orientation` = 4.92129,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 273,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1725.56,
            `position_y` = 102.697,
            `position_z` = 62.23,
            `orientation` = 1.33909,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 247,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1753.24,
            `position_y` = 120.584,
            `position_z` = 60.25,
            `orientation` = 6.17492,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 247,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1620.35,
            `position_y` = 89.1532,
            `position_z` = 62.3827,
            `orientation` = 0.933036,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 300,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1694.29,
            `position_y` = 153.519,
            `position_z` = 61.0871,
            `orientation` = 4.99197,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 300,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1667.2,
            `position_y` = 118.361,
            `position_z` = 60.7033,
            `orientation` = 4.17359,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 247,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;

        INSERT INTO `creature` SET
            `id1` = @ABOM,
            `position_x` = 1796.18,
            `position_y` = 105.216,
            `position_z` = 61.5189,
            `orientation` = 3.2047,
            `spawntimesecs` = 300,
            `wander_distance` = 10.0,
            `curhealth` = 300,
            `MovementType` = 1,
            `VerifiedBuild` = NULL;