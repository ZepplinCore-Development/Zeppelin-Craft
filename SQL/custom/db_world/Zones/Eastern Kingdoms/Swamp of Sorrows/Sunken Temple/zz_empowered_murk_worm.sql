-- Empowered Murk Worm Template
DELETE FROM `creature_template` WHERE (`entry` = 9102594);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9102594, 9101311, 9101356, 0, 0, 0, 7549, 7671, 7672, 0, 'Empowered Murk Worm', NULL, NULL, 0, 47, 48, 0, 14, 0, 1, 1.14286, 1, 1, 20, 1.5, 1, 0, 6, 2000, 2000, 1, 1, 1, 64, 2048, 0, 42, 0, 0, 0, 0, 1, 65537, 9102594, 0, 5226, 0, 0, 0, 0, 'SmartAI', 1, 1, 12, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 12340);

-- Remove the original Murk Worm Spawns
DELETE FROM `creature` WHERE (`id1` = 5226) AND (`guid` IN (33598, 34173, 34476, 33619, 33620));

-- Add the new Empowered Murk Worm Spawns
DELETE FROM `creature` WHERE (`id1` = 9102594);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(3110553, 9102594, 0, 0, 109, 0, 0, 1, 1, 0, -492.734, 142.199, -148.744, 0.502489, 300, 0, 0, 3253, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110554, 9102594, 0, 0, 109, 0, 0, 1, 1, 0, -440.856, 48.5799, -148.743, 4.94, 300, 0, 0, 3253, 0, 0, 0, 0, 0, '', NULL, 0, NULL);

-- Empowered Murk Worm Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9102594) AND (`Item` IN (24025, 35010));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(9102594, 35010, 35010, 1, 0, 1, 1, 1, 1, 'Murk Worm - (ReferenceTable)');
