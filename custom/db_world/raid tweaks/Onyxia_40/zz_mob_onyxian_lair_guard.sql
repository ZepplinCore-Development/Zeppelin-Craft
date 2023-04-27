-- Taken from lvl80 lair guard 36561
-- Level dropped to 60

DELETE FROM `creature_template` WHERE (`entry` = 36571);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(36571, 0, 0, 0, 0, 0, 12891, 0, 0, 0, 'Onyxian Lair Guard 60', '', '', 0, 60, 60, 2, 103, 0, 1, 1.14286, 1, 1, 20, 1, 1, 0, 13, 0, 2000, 1, 1, 1, 0, 2048, 8, 0, 0, 0, 0, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 50, 1, 1, 1, 0, 0, 1, 549521937, 0, 1073741824, '', 1);




