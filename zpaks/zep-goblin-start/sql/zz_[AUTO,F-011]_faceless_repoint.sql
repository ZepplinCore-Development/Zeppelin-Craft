-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 Faceless of the Deep model_info + repoint off ghoul fallback 646

DELETE FROM creature_model_info WHERE DisplayID=31674;
INSERT INTO creature_model_info (DisplayID,BoundingRadius,CombatReach,Gender,DisplayID_Other_Gender,VerifiedBuild) VALUES (31674,1.0,3.0,2,0,0);

UPDATE creature_template_model SET CreatureDisplayID=31674 WHERE CreatureID=38448;
