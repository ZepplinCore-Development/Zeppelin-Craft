-- [F-164H] Spirit Communion - Shaman trainer wiring (split from F-164 zz_[F-164]_shaman_tuning_trainer.sql).
-- The active (900185) is taught by the Shaman trainer (TrainerId 14) at level 12.
-- The on-kill passive (900183) is auto-taught via spell_linked_spell (zz_[F-164H]_shaman_guardian_spells.sql).
DELETE FROM `trainer_spell` WHERE `SpellId` = 900185;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (14, 900185, 200, 0, 0, 0, 0, 0, 12);
