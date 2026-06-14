-- [F-164] Rocksteady Totem (900224) - damage-mitigation totem
-- New totem creature 900100, cloned from the Stoneclaw totem creature (31122,
-- type 11). Model is auto-set by slot+race at summon (Totem::InitStats), HP is
-- set to 5% of shaman HP by the spell_sha_stoneguard_totem C++ script, and the
-- totem redirects 20% of the shaman's damage (aura 900222). RegenHealth=0 so
-- the HP buffer only depletes. Trainer-learned by all shamans (TrainerId 14).

DELETE FROM `creature_template` WHERE `entry` = 900100;
INSERT INTO `creature_template`
    (entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction, npcflag, speed_walk, speed_run, speed_swim, speed_flight, detection_range, `rank`, dmgschool, DamageModifier, BaseAttackTime, RangeAttackTime, BaseVariance, RangeVariance, unit_class, unit_flags, unit_flags2, dynamicflags, family, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, HoverHeight, HealthModifier, ManaModifier, ArmorModifier, ExperienceModifier, RacialLeader, movementId, RegenHealth, CreatureImmunitiesId, flags_extra, ScriptName, VerifiedBuild)
SELECT 900100, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3, KillCredit1, KillCredit2, 'Rocksteady Totem', subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction, npcflag, speed_walk, speed_run, speed_swim, speed_flight, detection_range, `rank`, dmgschool, DamageModifier, BaseAttackTime, RangeAttackTime, BaseVariance, RangeVariance, unit_class, unit_flags, unit_flags2, dynamicflags, family, type, type_flags, lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold, AIName, MovementType, HoverHeight, HealthModifier, ManaModifier, ArmorModifier, ExperienceModifier, RacialLeader, movementId, 0, CreatureImmunitiesId, flags_extra, ScriptName, VerifiedBuild
FROM `creature_template` WHERE `entry` = 31122;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 900100;
INSERT INTO `creature_template_model` (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild)
SELECT 900100, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild
FROM `creature_template_model` WHERE `CreatureID` = 31122;

-- Rocksteady Totem on the Shaman trainer (TrainerId 14), level 20
DELETE FROM `trainer_spell` WHERE `SpellId` = 900224;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900224, 500, 0, 0, 0, 0, 0, 20);
