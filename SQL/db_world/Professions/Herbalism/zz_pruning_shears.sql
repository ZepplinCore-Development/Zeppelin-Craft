-- Journeyman Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57300);
    INSERT INTO `item_template`
    SET `entry` = 57300,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 30, -- 30C
        `ItemLevel` = 20,
        `name` = 'Journeyman Pruning Shears',
        `displayid` = 140276, -- AO_Scissors10Cheap
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 198,
        `spellid_1` = 91140,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Artisan Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57301);
    INSERT INTO `item_template`
    SET `entry` = 57301,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 90, -- 90C
        `ItemLevel` = 60,
        `name` = 'Artisan Pruning Shears',
        `displayid` = 140277, -- AO_Scissors20Cheap
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 199,
        `spellid_1` = 91141,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Master Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57302);
    INSERT INTO `item_template`
    SET `entry` = 57302,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 900, -- 9S
        `ItemLevel` = 70,
        `name` = 'Master Pruning Shears',
        `displayid` = 140278, -- AO_Scissors30Cheap
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 200,
        `spellid_1` = 91142,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Grand Master Pruning Shears ITEM TEMPLATE
    DELETE FROM `item_template` WHERE (`entry` = 57303);
    INSERT INTO `item_template`
    SET `entry` = 57303,
        `class` = 5, -- Reagent
        `subclass` = 1, -- Tool 
        `SellPrice` = 9000, -- 90S
        `ItemLevel` = 80,
        `name` = 'Grand Master Pruning Shears',
        `displayid` = 140279, -- AO_Scissors30Expensive
        `Quality` = 6, -- Artifact
        `BagFamily` = 32, -- Herbalism
        `TotemCategory` = 201,
        `spellid_1` = 91143,
        `spelltrigger_1` = 5,
        `bonding` = 1; -- BOP

-- Place all the shear spell auras into the spell group table so they can be made exclusive
    DELETE FROM `spell_group` WHERE `id` = 1116;
    INSERT INTO `spell_group` (`id`,`spell_id`,`special_flag`) VALUES
        (1116,91140,0), -- Journeyman
        (1116,91141,0), -- Artisan
        (1116,91142,0), -- Master
        (1116,91143,0); -- Grand Master

-- Apply the exclusivity flag to the spell group for shears
    DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1116;
    INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
        (1116,1,'Group of Pruning Shears');

-- Jouyneyman Shears Quest

    SET @quest := 90008;

    -- Quest Template
        DELETE FROM `quest_template` WHERE `ID` = @quest;
        INSERT INTO `quest_template` SET
            `ID` = @quest,
            `QuestLevel` = 18,
            `MinLevel` = 10,
            `QuestSortID` = 0,
            `RewardXPDifficulty` = 5,
            `Flags` = 136,
            `RewardFactionID1` = 0,
            `RewardFactionValue1` = 0,
            `AllowableRaces` = 0,
            `RequiredItemId1` = 2447, -- Peacebloom
            `RequiredItemCount1` = 20,
            `RequiredItemId2` = 765, -- Silverleaf
            `RequiredItemCount2` = 20,
            `LogTitle` = 'My First Pruning Shears',
            `LogDescription` = 'Collect herbs to exchange for a pair of Journeyman Shears',
            `QuestDescription` = 'You''ve been collecting herbs this whole time with you bare hands? like some kind of animal. This won''t do. I Tell you what, if you can fill my current herb order I''ll give you a pair of Pruning Shears.',
            `QuestCompletionLog` = 'Return the herbs to exchange for a pair of Journeyman Shears',
            `RewardItem1` = 57300,
            `RewardAmount1` = 1,
            `VerifiedBuild` = '0';

    -- Quest Template Addon
        DELETE FROM `quest_template_addon` WHERE (`ID` = @quest);
        INSERT INTO `quest_template_addon` SET
            `ID` = @quest,
            `RequiredSkillID` = 182, -- Herbalism
            `RequiredSkillPoints` = 75;

    -- Quest Offer Reward
        DELETE FROM `quest_offer_reward` WHERE (`ID` = @quest);
        INSERT INTO `quest_offer_reward` SET
            `ID` = @quest,
            `RewardText` = 'get to work, those herbs won''t gather themselves';

    -- Quest Request Items
        DELETE FROM `quest_request_items` WHERE (`ID` = @quest);
        INSERT INTO `quest_request_items` SET
            `ID` = @quest,
            `EmoteOnComplete` = 1,
            `CompletionText` = 'Thanks for collecting the herb order';

    -- Quest Giver Flag
        UPDATE `creature_template` SET `npcflag` = 211 WHERE (`entry` = 16367); -- Botanist Tyniarrel
        UPDATE `creature_template` SET `npcflag` = 83 WHERE (`entry` = 16644); -- Botanist Nathera 

    -- Creature Quest Starter
        DELETE FROM `creature_queststarter` WHERE (`quest` = @quest);
        INSERT INTO `creature_queststarter` SET
            `id` = 16367, -- Botanist Tyniarrel
            `quest` = @quest;

       INSERT INTO `creature_queststarter` SET
            `id` = 16644, -- Botanist Nathera 
            `quest` = @quest;

    -- Creature Quest Ender
        DELETE FROM `creature_questender` WHERE (`quest` = @quest);
        INSERT INTO `creature_questender` SET
            `id` = 16367,  -- Botanist Tyniarrel
            `quest` = @quest;

        INSERT INTO `creature_questender` SET
            `id` = 16644, -- Botanist Nathera
            `quest` = @quest;