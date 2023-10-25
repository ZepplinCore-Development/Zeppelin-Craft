DELETE FROM `creature_template` WHERE (`entry` = 15339);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(15339, 0, 0, 0, 0, 0, 15432, 0, 0, 0, 'Ossirian the Unscarred', '', NULL, 0, 63, 63, 0, 16, 0, 1, 1.14286, 1, 1, 30, 1, 3, 0, 25, 1800, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 10, 76, 15339, 0, 0, 0, 0, 740454, 963110, '', 0, 1, 150, 50, 1.3, 1, 0, 121, 1, 2093694811, 0, 2147483905, 'boss_ossirian', 12340);

DELETE FROM `creature_loot_template` WHERE (`Entry` = 15339);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(15339, 2602, 0, 100, 0, 1, 0, 1, 1, 'Pattern: Drums of Intellect'),
(15339, 20884, 0, 0, 0, 1, 1, 1, 1, 'Ossirian the Unscarred - Qiraji Magisterial Ring'),
(15339, 20886, 0, 0, 0, 1, 2, 1, 1, 'Ossirian the Unscarred - Qiraji Spiked Hilt'),
(15339, 20888, 0, 0, 0, 1, 1, 1, 1, 'Ossirian the Unscarred - Qiraji Ceremonial Ring'),
(15339, 20890, 0, 0, 0, 1, 2, 1, 1, 'Ossirian the Unscarred - Qiraji Ornate Hilt'),
(15339, 21220, 0, 100, 0, 1, 0, 1, 1, 'Ossirian the Unscarred - Head of Ossirian the Unscarred'),
(15339, 30420, 30420, 100, 0, 1, 0, 1, 1, NULL),
(15339, 30421, 30421, 100, 0, 1, 0, 1, 1, NULL),
(15339, 30424, 30424, 100, 0, 1, 0, 1, 1, NULL),
(15339, 34024, 34024, 100, 0, 1, 3, 1, 2, 'Ossirian the Unscarred - (ReferenceTable)'),
(15339, 34025, 34025, 1.5, 0, 1, 4, 1, 2, 'Ossirian the Unscarred - (ReferenceTable)'),
(15339, 190024, 34024, 1, 0, 1, 1, 1, 1, '');
