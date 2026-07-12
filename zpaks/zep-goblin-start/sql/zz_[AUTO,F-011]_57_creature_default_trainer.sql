-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_default_trainer (one file per table; rows carry final state)

DELETE FROM creature_default_trainer WHERE TrainerId IN (6601,6602,6603,6604,6605,6606,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6618,6619,6620,6621,6622,6623,6624);
DELETE FROM creature_default_trainer WHERE TrainerId IN (6701,6702,6703,6704,6705,6706,6707);

INSERT INTO creature_default_trainer (`CreatureId`, `TrainerId`) VALUES
  (35758, 6601),
  (35778, 6602),
  (35780, 6603),
  (35786, 6604),
  (35805, 6605),
  (35806, 6606),
  (35807, 6607),
  (36518, 6608),
  (36519, 6609),
  (36520, 6610),
  (36521, 6611),
  (36523, 6612),
  (36524, 6613),
  (36525, 6614),
  (36615, 6615),
  (38122, 6616),
  (38513, 6617),
  (38514, 6618),
  (38515, 6619),
  (38516, 6620),
  (38517, 6621),
  (38518, 6622),
  (45286, 6623),
  (366150, 6624),
  (34673, 6701),
  (34689, 6702),
  (34692, 6703),
  (34693, 6704),
  (34695, 6705),
  (34696, 6706),
  (34697, 6707);

