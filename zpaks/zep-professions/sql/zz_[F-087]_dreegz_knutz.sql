-- Dreegz Knutz - Creature Template
    DELETE FROM `creature_template` WHERE (`entry` = 9000004);
    INSERT INTO `creature_template` SET
        `entry` = 9000004,
        `name` = 'Dreegz Knutz',
        `subname` = 'Secretary of Baron Revilgaz',
        `minlevel` = 60,
        `maxlevel` = 60,
        `faction` = 120,
        `npcflag` = 2,
        `detection_range` = 1,
        `BaseVariance` = 0,
        `RangeVariance` = 0,
        `unit_class` = 1,
        `type` = 7,
        `flags_extra` = 2;

-- Dreegz Knutz - Creature Template Model
    DELETE FROM `creature_template_model` WHERE `CreatureID` = 9000004;
    INSERT INTO `creature_template_model` SET
        `CreatureID` = '9000004',
        `idx` = 1,
        `CreatureDisplayID` = '7167',
        `probability` = 1.0;

-- Dreegz Knutz - Creature
    DELETE FROM `creature` WHERE (`id1` = 9000004);
    INSERT INTO `creature` SET
        `id1` = 9000004,
        `map` = 409,
        `position_x` = 1066.5,
        `position_y` = -496.157,
        `position_z` = -108.378,
        `orientation` = 0.843983,
        `spawntimesecs` = 300,
        `curhealth` = 3052;

-- Dreegz Knutz - Core Treasures - Quest Template
    DELETE FROM `quest_template` WHERE (`ID` = 90002);
    INSERT INTO `quest_template`
    SET `ID` = 90002,
        `QuestType` = 2,
        `QuestLevel` = 60,
        `MinLevel` = 60,
        `QuestSortID` = 2717,
        `QuestInfoID` = 62,
        `RewardXPDifficulty` = 7,
        `RewardMoney` = 129120,
        `Flags` = 8,
        `RewardItem1` = 57200,
        `RewardAmount1` = 1,
        `RewardFactionID1` = 21,
        `RewardFactionValue1` = 6,
        `LogTitle` = 'Core Treasures',
        `LogDescription` = 'Collect the treasures from Molten Core for Dreegz Knuts.',
        `QuestDescription` = 'I am Dreegz Knuts, a humble goblin in the employ of Baron Revilgaz. I have a proposition for you that could make us both wealthy beyond our wildest dreams. You see, deep within the treacherous depths of Molten Core, lies coveted treasures. Now, here''s the catch - I am not brave enough to venture further into Molten Core myself. The place gives me the shivers! But I''ve heard tales of your legendary bravery and skills, and I believe you''re the perfect candidate for this task. Your mission, should you choose to accept it, is to enter Molten Core, brave the fiery dangers within, and retrieve the pristine hide of Magmadar. Once you have it in your possession, return to me at the entrance of Molten Core, and I will reward you handsomely. As a token of my appreciation, I will provide you with an exclusive engineering schematic to craft a skill injector. This rare and powerful device can enhance your abilities and make you an even more formidable adventurer.',
        `AreaDescription` = '',
        `QuestCompletionLog` = 'Return the treasures of the core to Dreegz Knuts in Molten Core',
        `RequiredItemId1` = 17012,
        `RequiredItemCount1` = 20,
        `RequiredItemId2` = 17010,
        `RequiredItemCount2` = 10,
        `RequiredItemId3` = 17011,
        `RequiredItemCount3` = 10,
        `RequiredItemId4` = 11370,
        `RequiredItemCount4` = 10,
        `RequiredItemId5` = 57800,
        `RequiredItemCount5` = 1;

-- Dreegz Knutz - Core Treasures - Quest Reward
    DELETE FROM `quest_offer_reward` WHERE (`ID` = 90002);
    INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES
    (90002, 0, 0, 0, 0, 0, 0, 0, 0, 'Excellent work, Baron Revilgaz will be most pleased with my work. Er, I mean our work.', 0);

-- Dreegz Knutz - Core Treasures - Quest Items
    DELETE FROM `quest_request_items` WHERE (`ID` = 90002);
    INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
    (90002, 0, 0, 'Return to me once you have all the treasures I need.', 0);

-- Dreegz Knutz - Core Treasures - Quest Starter
    DELETE FROM `creature_queststarter` WHERE (`quest` = 90002);
    INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
    (9000004, 90002);

-- Dreegz Knutz - Core Treasures - Quest Ender
    DELETE FROM `creature_questender` WHERE (`quest` = 90002);
    INSERT INTO `creature_questender` (`id`, `quest`) VALUES
    (9000004, 90002);

