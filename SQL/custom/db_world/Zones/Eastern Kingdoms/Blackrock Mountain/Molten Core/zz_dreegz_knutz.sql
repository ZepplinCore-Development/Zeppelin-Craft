-- Dreegz Knutz - Creature Template

DELETE FROM `creature_template` WHERE (`entry` = 9000004);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9000004, 0, 0, 0, 0, 0, 7167, 0, 0, 0, 'Dreegz Knutz', 'Secretary of Baron Revilgaz', '', 0, 60, 60, 0, 120, 2, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, '', 0);

-- Dreegz Knutz - Creature

DELETE FROM `creature` WHERE (`id1` = 9000004);
INSERT INTO `creature` (`id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
(9000004,0,0,409,0,0,1,1,0,1066.5,-496.157,-108.378,0.843983,300,0.0,0,3052,0,0,0,0,0,'',NULL);

-- Dreegz Knutz - Core Treasures - Quest Template

REPLACE INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardMoneyDifficulty`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES
(90002, 2, 60, 60, 2717, 0, 0, 0, 0, 0, 0, 0, 0, 128600, 0, 0, 0, 0, 0, 0, 0, 0, 902306, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  'Core Treasures',  'Collect the treasures from Molten Core for Dreegz Knuts',  'I am Dreegz Knuts, a humble goblin in the employ of Baron Revilgaz. I have a proposition for you that could make us both wealthy beyond our wildest dreams.You see, deep within the treacherous depths of Molten Core, lies coveted treasures. Now, here''s the catch - I am not brave enough to venture further into Molten Core myself. The place gives me the shivers! But I''ve heard tales of your legendary bravery and skills, and I believe you''re the perfect candidate for this task.Your mission, should you choose to accept it, is to enter Molten Core, brave the fiery dangers within, and retrieve the pristine hide of Magmadar. Once you have it in your possession, return to me at the entrance of Molten Core, and I will reward you handsomely.As a token of my appreciation, I will provide you with an exclusive engineering schematic to craft a skill injector. This rare and powerful device can enhance your abilities and make you an even more formidable adventurer.',  '',  'Return the treasures of the core to Dreegz Knuts', 0, 0, 0, 0, 0, 0, 0, 0, 17012, 17010, 17011, 11370, 746, 0, 20, 10, 10, 10, 1, 0, 0,  '',  '',  '',  '', 0);

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
