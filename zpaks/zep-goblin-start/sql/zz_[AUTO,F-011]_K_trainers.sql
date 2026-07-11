-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 Lost Isles trainers (npc_trainer -> AC trainer/creature_default_trainer/trainer_spell)
-- 7 trainers, 17 spell rows (1 Cata-only spells skipped). TrainerId block 6701+.

DELETE FROM trainer_spell WHERE TrainerId IN (6701,6702,6703,6704,6705,6706,6707);
DELETE FROM creature_default_trainer WHERE TrainerId IN (6701,6702,6703,6704,6705,6706,6707);
DELETE FROM trainer WHERE Id IN (6701,6702,6703,6704,6705,6706,6707);

INSERT INTO trainer (Id,Type,Requirement,Greeting,VerifiedBuild) VALUES
  (6701,0,0,'Ready to learn, ?',0),
  (6702,0,0,'Ready to learn, ?',0),
  (6703,0,0,'Ready to learn, ?',0),
  (6704,0,0,'Ready to learn, ?',0),
  (6705,0,0,'Ready to learn, ?',0),
  (6706,0,0,'Ready to learn, ?',0),
  (6707,0,0,'Ready to learn, ?',0);

INSERT INTO creature_default_trainer (CreatureId,TrainerId) VALUES
  (34673,6701),
  (34689,6702),
  (34692,6703),
  (34693,6704),
  (34695,6705),
  (34696,6706),
  (34697,6707);

INSERT INTO trainer_spell (TrainerId,SpellId,MoneyCost,ReqSkillLine,ReqSkillRank,ReqAbility1,ReqAbility2,ReqAbility3,ReqLevel,VerifiedBuild) VALUES
  (6701,56641,60,0,0,0,0,0,3,0),
  (6701,1494,97,0,0,0,0,0,4,0),
  (6702,5143,60,0,0,0,0,0,3,0),
  (6702,2136,142,0,0,0,0,0,5,0),
  (6703,2061,60,0,0,0,0,0,3,0),
  (6703,17,142,0,0,0,0,0,5,0),
  (6703,589,97,0,0,0,0,0,4,0),
  (6704,2098,60,0,0,0,0,0,3,0),
  (6704,1784,142,0,0,0,0,0,5,0),
  (6705,8042,142,0,0,0,0,0,5,0),
  (6705,8075,97,0,0,0,0,0,4,0),
  (6705,2825,117333,0,0,0,0,0,70,0),
  (6706,172,97,0,0,0,0,0,4,0),
  (6706,348,60,0,0,0,0,0,3,0),
  (6706,1454,142,0,0,0,0,0,5,0),
  (6707,100,60,0,0,0,0,0,3,0),
  (6707,34428,142,0,0,0,0,0,5,0);
