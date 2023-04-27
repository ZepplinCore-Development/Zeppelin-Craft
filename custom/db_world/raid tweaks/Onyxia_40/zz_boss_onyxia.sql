-- Decreased damage from 15.05 -> 10
-- Decreased HP from 330 -> 150

DELETE FROM `creature_template` WHERE (`entry` = 301000);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(301000, 0, 0, 0, 0, 0, 8570, 0, 0, 0, 'Onyxia 60', '', NULL, 0, 63, 63, 0, 103, 0, 1, 1.28571, 1, 1, 20, 1, 3, 0, 10, 2000, 2000, 1, 1, 1, 64, 2048, 0, 0, 0, 0, 0, 0, 2, 108, 301000, 0, 10184, 0, 0, 914892, 1066294, '', 0, 1, 150, 1, 1, 1, 0, 0, 1, 646659963, 0, 1073742337, 'boss_onyxia_40', NULL);



