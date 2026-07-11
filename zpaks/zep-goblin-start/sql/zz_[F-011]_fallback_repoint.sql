-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 fallback repoint: creatures whose real Cata display is already stock in client -> use it

UPDATE creature_template_model SET CreatureDisplayID = 2177 WHERE CreatureID = 7395;
UPDATE creature_template_model SET CreatureDisplayID = 11686 WHERE CreatureID = 31688;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 35904;
UPDATE creature_template_model SET CreatureDisplayID = 22719 WHERE CreatureID = 36127;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 36578;
UPDATE creature_template_model SET CreatureDisplayID = 1126 WHERE CreatureID = 37748;
UPDATE creature_template_model SET CreatureDisplayID = 19732 WHERE CreatureID = 38187;
UPDATE creature_template_model SET CreatureDisplayID = 27101 WHERE CreatureID = 38526;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 39147;
UPDATE creature_template_model SET CreatureDisplayID = 7288 WHERE CreatureID = 39376;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 40064;
UPDATE creature_template_model SET CreatureDisplayID = 3019 WHERE CreatureID = 48304;
UPDATE creature_template_model SET CreatureDisplayID = 11686 WHERE CreatureID = 48323;
UPDATE creature_template_model SET CreatureDisplayID = 29807 WHERE CreatureID = 49150;
