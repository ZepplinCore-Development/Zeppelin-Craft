DELETE FROM `creature_template` WHERE (`entry` = 15263);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(15263, 0, 0, 0, 0, 0, 15345, 0, 0, 0, 'The Prophet Skeram', '', NULL, 0, 63, 63, 0, 16, 0, 2.4, 2.14286, 1, 1, 20, 1, 3, 0, 10.05, 2000, 2000, 1, 1, 2, 64, 2048, 0, 0, 0, 0, 0, 0, 10, 76, 15263, 0, 0, 0, 0, 504000, 609840, '', 0, 1, 175, 150, 1.3, 1, 0, 192, 1, 617299807, 0, 0, 'boss_skeram', 12340);


DELETE FROM `creature_loot_template` WHERE (`Entry` = 15263);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15263, 21128, 0, 10, 0, 1, 1, 1, 1, 'The Prophet Skeram - Staff of the Qiraji Prophets'),
(15263, 21229, 0, 100, 0, 1, 0, 1, 1, 'The Prophet Skeram - Qiraji Lord\'s Insignia'),
(15263, 21698, 0, 0, 0, 1, 1, 1, 1, 'The Prophet Skeram - Leggings of Immersion'),
(15263, 21699, 0, 0, 0, 1, 1, 1, 1, 'The Prophet Skeram - Barrage Shoulders'),
(15263, 21700, 0, 0, 0, 1, 1, 1, 1, 'The Prophet Skeram - Pendant of the Qiraji Guardian'),
(15263, 21701, 0, 0, 0, 1, 1, 1, 1, 'The Prophet Skeram - Cloak of Concentrated Hatred'),
(15263, 21702, 0, 0, 0, 1, 1, 1, 1, 'The Prophet Skeram - Amulet of Foul Warding'),
(15263, 21703, 0, 10, 0, 1, 2, 1, 1, 'The Prophet Skeram - Hammer of Ji\'zhi'),
(15263, 21704, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram -  Boots of the Redeemed Prophecy'),
(15263, 21705, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram - Boots of the Fallen Prophet'),
(15263, 21706, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram - Boots of the Unwavering Will'),
(15263, 21707, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram - Ring of Swarming Thought'),
(15263, 21708, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram - Beetle Scaled Wristguards'),
(15263, 21814, 0, 0, 0, 1, 2, 1, 1, 'The Prophet Skeram - Breastplate of Annihilation'),
(15263, 22222, 0, 15, 0, 1, 0, 1, 1, 'The Prophet Skeram - Plans: Thick Obsidian Breastplate'),
(15263, 34045, 34045, 7, 0, 1, 0, 1, 1, 'The Prophet Skeram - Reference Table'),
(15263, 966, 0, 100, 0, 1, 0, 1, 1, 'Pattern: Drums of the Raid Leader'),
(15263, 0, 0, 100, 0, 1, 0, 1, 1, '');
