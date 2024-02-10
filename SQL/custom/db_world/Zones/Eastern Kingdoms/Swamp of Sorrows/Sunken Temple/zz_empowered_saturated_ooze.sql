-- Empowered Ooze Template
DELETE FROM `creature_template` WHERE (`entry` = 9102596);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(9102596, 9101316, 9101361, 0, 0, 0, 682, 0, 0, 0, 'Empowered Ooze', NULL, NULL, 0, 47, 48, 0, 14, 0, 1, 1.14286, 1, 1, 20, 1.5, 1, 0, 6, 2000, 2000, 1, 1, 1, 64, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 9102596, 5228, 0, 0, 0, 0, 0, 'SmartAI', 1, 1, 12, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 12340);

-- Remove the original Saturated Ooze Spawns
DELETE FROM `creature` WHERE (`id1` = 5228) AND (`guid` IN (33628, 33629, 34472));

-- Add the new Empowered Ooze Spawns
DELETE FROM `creature` WHERE (`id1` = 9102596);
INSERT INTO `creature` (`guid`, `id1`, `id2`, `id3`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`, `CreateObject`, `Comment`) VALUES
(3110557, 9102596, 0, 0, 109, 0, 0, 1, 1, 0, -521.588, 94.8218, -148.744, 1.09155, 300, 0, 0, 3371, 0, 0, 0, 0, 0, '', NULL, 0, NULL),
(3110558, 9102596, 0, 0, 109, 0, 0, 1, 1, 0, -413.433, 95.8003, -148.743, 6.2202, 300, 0, 0, 3253, 0, 0, 0, 0, 0, '', NULL, 0, NULL);

-- Empowered Ooze loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 9102596) AND (`Item` IN (24025, 35010));
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(9102596, 35010, 35010, 50, 0, 1, 1, 1, 1, 'Saturated Ooze - (ReferenceTable)');
