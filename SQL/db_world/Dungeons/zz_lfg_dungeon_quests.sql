SET @CLASSIC_HEROIC_SATCHEL = 58300,
    @CLASSIC_MYTHIC_SATCHEL = 58301,
    @OUTLAND_HEROIC_SATCHEL = 58304,
    @OUTLAND_MYTHIC_SATCHEL = 58305,    
    @NORTHREND_HEROIC_SATCHEL = 58306,
    @NORTHREND_MYTHIC_SATCHEL = 58307,
    @BADGE_OF_HEROISM = 58200,
    @BADGE_OF_JUSTICE = 29434,
    @AZERITE_SHARD = 58302;

-- Classic Quests

    -- Normal Classic Quests

        -- Classic Random 5-15 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 5-15 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1            
            WHERE `ID` = 24881;

        -- Classic Random 15-25 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 15-25 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1            
            WHERE `ID` = 24882;

        -- Classic Random 24-34 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 24-34 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1            
            WHERE `ID` = 24883;

        -- Classic Random 35-45 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 35-45 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1            
            WHERE `ID` = 24884;

        -- Classic Random 46-55 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 46-55 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1         
            WHERE `ID` = 24885;

        -- Classic Random 56-60 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Classic Random 56-60 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_HEROISM, 
            `RewardAmount3` = 1            
            WHERE `ID` = 24886;

    -- Heroic Classic Quests

        -- First Heroic Classic  Quest

            -- First Heroic Classic Quest Template
                DELETE FROM `quest_template` WHERE `ID` = 90003;
                INSERT INTO `quest_template` SET
                    `ID` = 90003,
                    `QuestLevel` = 60,
                    `MinLevel` = 55,
                    `RewardXPDifficulty` = 7,
                    `RewardMoney` = 18000,
                    `Flags` = 136,
                    `RewardItem1` = @CLASSIC_HEROIC_SATCHEL,
                    `RewardAmount1` = 1,
                    `RewardItem2` = @BADGE_OF_HEROISM,
                    `RewardAmount2` = 2,
                    `RewardItem3` = @AZERITE_SHARD,
                    `RewardAmount3` = 5,
                    `LogTitle` = 'Azeroth Heroic Random (1st)',
                    `VerifiedBuild` = '1337';

            -- First Heroic Classic Quest Template Addon
                DELETE FROM `quest_template_addon` WHERE (`ID` = 90003);
                INSERT INTO `quest_template_addon` SET
                    `ID` = 90003,
                    `SpecialFlags` = 9;

        -- Nth Heroic Classic Quest

            -- Nth Heroic Classic Quest Template
                DELETE FROM `quest_template` WHERE `ID` = 90004;
                INSERT INTO `quest_template` SET
                `ID` = 90004,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 5,
                `RewardMoney` = 9000,
                `Flags` = 136,
                `RewardItem1` = @CLASSIC_HEROIC_SATCHEL,
                `RewardAmount1` = 1,
                `RewardItem2` = @AZERITE_SHARD,
                `RewardAmount2` = 3,
                `LogTitle` = 'Azeroth Heroic Random (Nth)',
                `VerifiedBuild` = '1337';

            -- Nth Heroic Classic Quest Template Addon
                DELETE FROM `quest_template_addon` WHERE (`ID` = 90004);
                INSERT INTO `quest_template_addon` SET
                `ID` = 90004,
                `SpecialFlags` = 9;

    -- Mythic Classic Quests

        -- First Mythic Classic Quest

            -- First Mythic Classic Quest Template
                DELETE FROM `quest_template` WHERE `ID` = 90005;
                INSERT INTO `quest_template` SET
                `ID` = 90005,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 7,
                `RewardMoney` = 18000,
                `Flags` = 136,
                `RewardItem1` = @CLASSIC_MYTHIC_SATCHEL,
                `RewardAmount1` = 1,
                `RewardItem2` = @BADGE_OF_HEROISM,
                `RewardAmount2` = 3,
                `RewardItem3` = @AZERITE_SHARD,
                `RewardAmount3` = 8,
                `LogTitle` = 'Azeroth Mythic Random (1st)',
                `VerifiedBuild` = '1337';

            -- First Mythic Classic Quest Template Addon
                DELETE FROM `quest_template_addon` WHERE (`ID` = 90005);
                INSERT INTO `quest_template_addon` SET
                `ID` = 90005,
                `SpecialFlags` = 9;

        -- Nth Mythic Classic Quest

            -- Nth Mythic Classic Quest Template
                DELETE FROM `quest_template` WHERE `ID` = 90006;
                INSERT INTO `quest_template` SET
                `ID` = 90006,
                `QuestLevel` = 60,
                `MinLevel` = 55,
                `RewardXPDifficulty` = 5,
                `RewardMoney` = 9000,
                `Flags` = 136,
                `RewardItem1` = @CLASSIC_MYTHIC_SATCHEL,
                `RewardAmount1` = 1,
                `RewardItem2` = @AZERITE_SHARD,
                `RewardAmount2` = 5,
                `LogTitle` = 'Azeroth Mythic Random (Nth)',
                `VerifiedBuild` = '1337';

            -- Nth Mythic Classic Quest Template Addon
                DELETE FROM `quest_template_addon` WHERE (`ID` = 90006);
                INSERT INTO `quest_template_addon` SET
                `ID` = 90006,
                `SpecialFlags` = 9;

-- Outland Quests

    -- Normal Outland Quest

        -- Outland Random 61-64 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random 61-64 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_JUSTICE, 
            `RewardAmount3` = 1           
            WHERE `ID` = 24887;

        -- Outland Random 61-64 (Nth)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random 61-64 (Nth)'        
            WHERE `ID` = 24895;

        -- Outland Random 65-70 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random 65-70 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_JUSTICE, 
            `RewardAmount3` = 1           
            WHERE `ID` = 24888;

        -- Outland Random 65-70 (Nth)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random 65-70 (Nth)'       
            WHERE `ID` = 24896;

    -- Heroic Outland Quests

        -- Outland Random Heroic (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random Heroic (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem1` = @OUTLAND_HEROIC_SATCHEL, 
            `RewardAmount1` = 1,            
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 5,
            `RewardItem3` = @BADGE_OF_JUSTICE, 
            `RewardAmount3` = 2           
            WHERE `ID` = 24922;

        -- Outland Random Heroic (Nth)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random Heroic (Nth)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem1` = @OUTLAND_HEROIC_SATCHEL, 
            `RewardAmount1` = 1,            
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3        
            WHERE `ID` = 24923;

    -- Mythic Outland Quests

-- LFG Rewards

    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` IN (258, 259, 260, 261, 262);    

    -- Classic Random 5-15
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 15,
        `firstQuestId` = 24881,
        `otherQuestId` = 24889;

    -- Classic Random 15-25
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 25,
        `firstQuestId` = 24882,
        `otherQuestId` = 24890;

    -- Classic Random 24-34
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 34,
        `firstQuestId` = 24883,
        `otherQuestId` = 24891;

    -- Classic Random 35 - 45
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 45,
        `firstQuestId` = 24884,
        `otherQuestId` = 24892;

    -- Classic Random 45 - 55
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 55,
        `firstQuestId` = 24885,
        `otherQuestId` = 24893;

    -- Classic Random 55 - 60
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 400;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 400,
        `maxLevel` = 60,
        `firstQuestId` = 24886,
        `otherQuestId` = 24894;

    -- Heroic Classic Random
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 401;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 401,
        `maxLevel` = 60,
        `firstQuestId` = 90003,
        `otherQuestId` = 90004;

    -- Outland Random 61 - 64
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 402;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 402,
        `maxLevel` = 64,
        `firstQuestId` = 24887,
        `otherQuestId` = 24895;

    -- Outland Random 64 - 70 
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 402;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 402,
        `maxLevel` = 70,
        `firstQuestId` = 24888,
        `otherQuestId` = 24896;

    -- Heroic Outland Random 64 - 70
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 403;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 403,
        `maxLevel` = 70,
        `firstQuestId` = 24922,
        `otherQuestId` = 24923;

    -- Northrend Random 70 - 80   
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 404;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 404,
        `maxLevel` = 80,
        `firstQuestId` = 24790,
        `otherQuestId` = 24791;

    -- Heroic Northrend Random
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 405;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 405,
        `maxLevel` = 80,
        `firstQuestId` = 24788,
        `otherQuestId` = 24789;

    -- Mythic Classic Random
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` = 406;
    INSERT INTO `lfg_dungeon_rewards` SET
        `dungeonId` = 406,
        `maxLevel` = 60,
        `firstQuestId` = 90005,
        `otherQuestId` = 90006;

            

            

