    SET @CLASSIC_HEROIC_SATCHEL = 58300,
        @CLASSIC_MYTHIC_SATCHEL = 58301,
        @OUTLAND_HEROIC_SATCHEL = 58302,
        @OUTLAND_MYTHIC_SATCHEL = 58303,    
        @NORTHREND_HEROIC_SATCHEL = 58304,
        @NORTHREND_MYTHIC_SATCHEL = 58305;
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

        -- Outland Random 65-70 (1st)
            UPDATE `quest_template` SET 
            `LogTitle` = 'Outland Random 65-70 (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,
            `RewardItem3` = @BADGE_OF_JUSTICE, 
            `RewardAmount3` = 1           
            WHERE `ID` = 24888;

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
            `LogTitle` = 'Outland Random Heroic (1st)', 
            `RewardXPDifficulty` = 8, 
            `RewardItem1` = @OUTLAND_HEROIC_SATCHEL, 
            `RewardAmount1` = 1,            
            `RewardItem2` = @AZERITE_SHARD, 
            `RewardAmount2` = 3,        
            WHERE `ID` = 24923;

    -- Mythic Outland Quests

-- LFG Rewards
    DELETE FROM `lfg_dungeon_rewards` WHERE `dungeonId` IN (401, 406);

    -- Heroic Classic
        INSERT INTO `lfg_dungeon_rewards` SET
            `dungeonId` = 401,
            `maxLevel` = 60,
            `firstQuestId` = 90003,
            `otherQuestId` = 90004;

    -- Mythic Classic
        INSERT INTO `lfg_dungeon_rewards` SET
            `dungeonId` = 406,
            `maxLevel` = 60,
            `firstQuestId` = 90005,
            `otherQuestId` = 90006;