-- [I-225] Give Kradu Grimblade (20124) and Zula Slagfury (20125) general Master
-- Blacksmithing training (375 cap, stock trainer 58 list) IN ADDITION to their existing
-- Weaponsmith/Armorsmith specialization lists (stock trainers 123/124).
--
-- creature_default_trainer is keyed by CreatureId (one trainer per NPC), and trainers
-- 123/124 are shared by ~10 other spec trainers each, so we cannot append to them.
-- Instead we build two combined custom trainers (6500/6501 = 58 + spec) and repoint
-- only these two NPCs. There is no SpellId overlap between list 58 and 123/124, so the
-- union INSERT is collision-free. ReqAbility/ReqLevel gating is carried over verbatim,
-- so the specialization plans still require the matching Weaponsmith/Armorsmith spec.

DELETE FROM `trainer_spell` WHERE `TrainerId` IN (6500, 6501);
DELETE FROM `trainer` WHERE `Id` IN (6500, 6501);

INSERT INTO `trainer` (`Id`, `Type`, `Requirement`, `Greeting`) VALUES
(6500, 2, 0, 'Care to learn how to turn the ore that you find into weapons and metal armor?'),
(6501, 2, 0, 'Care to learn how to turn the ore that you find into weapons and metal armor?');

-- Kradu Grimblade (Weaponsmith) = Master BS general (58) + Weaponsmithing spec (123)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
SELECT 6500, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`
FROM `trainer_spell` WHERE `TrainerId` IN (58, 123);

-- Zula Slagfury (Armorsmith) = Master BS general (58) + Armorsmithing spec (124)
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
SELECT 6501, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`
FROM `trainer_spell` WHERE `TrainerId` IN (58, 124);

UPDATE `creature_default_trainer` SET `TrainerId` = 6500 WHERE `CreatureId` = 20124;
UPDATE `creature_default_trainer` SET `TrainerId` = 6501 WHERE `CreatureId` = 20125;
