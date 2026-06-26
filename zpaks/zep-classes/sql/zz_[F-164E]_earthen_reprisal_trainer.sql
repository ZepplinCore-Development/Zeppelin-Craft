-- [F-164E] Earthen Reprisal — split from F-164 Shaman Tuning
-- Shaman trainer wiring for Earthen Reprisal (900114): TrainerId 14, level 6.
-- See [F-164E]_spell.sql (DBC record) and zz_[F-164E]_earthen_reprisal_spell_bonus.sql (scaling).

DELETE FROM `trainer_spell` WHERE `SpellId` = 900114;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900114, 100, 0, 0, 0, 0, 0, 6);
