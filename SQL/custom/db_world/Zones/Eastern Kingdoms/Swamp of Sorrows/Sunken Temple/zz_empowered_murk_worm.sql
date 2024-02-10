-- Empowered Murk Worm Template
DELETE FROM `creature_template` WHERE (`entry` = 9102594);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9102594, 9101311, 9101356, 0, 0, 0, 7549, 7671, 7672, 0, 'Empowered Murk Worm', NULL, NULL, 0, 47, 48, 0, 14, 0, 1, 1.14286, 1, 1, 20, 1.3, 1, 0, 5, 2000, 2000, 1, 1, 1, 64, 2048, 0, 42, 0, 0, 0, 0, 1, 65537, 5226, 0, 5226, 0, 0, 0, 0, 'SmartAI', 1, 1, 6, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 12340);

-- Remove the original Murk Worm Spawns
DELETE FROM `creature` WHERE (`id1` = 5226) AND (`guid` IN (33598, 34173, 34476, 33619, 33620));

-- Add the new Empowered Murk Worm Spawns

