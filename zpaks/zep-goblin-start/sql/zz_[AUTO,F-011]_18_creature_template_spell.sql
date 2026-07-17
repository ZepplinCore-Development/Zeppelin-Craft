-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 creature_template_spell (one file per table; rows carry final state)

DELETE FROM creature_template_spell WHERE CreatureID IN (34840);
DELETE FROM creature_template_spell WHERE CreatureID IN (35999,37179);

INSERT INTO creature_template_spell (`CreatureID`, `Index`, `Spell`, `VerifiedBuild`) VALUES
  (34840, 0, 66300, 0),
  (34840, 1, 61178, 0),
  (34840, 2, 66298, 0),
  (34840, 3, 66299, 0),
  (35999, 0, 66300, 0),
  (35999, 1, 61178, 0),
  (35999, 2, 66298, 0),
  (35999, 3, 66299, 0),
  (37179, 0, 69992, 0);

