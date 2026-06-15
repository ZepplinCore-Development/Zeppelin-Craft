-- I-206: Point the Auchindoun Bone Crawler at the new Jormungar-model display
-- (900007, defined in dbc/[I-206]_creaturedisplayinfo.sql).
--
--   900007 = Jormungar.M2, texture_variation_1='JormungarWhite', scale 1.7
--   (was stock display 20617 — BoneWorm, Boneworm_Bone01 skin)
--
-- Bone Crawler (21849) is a plain roaming worm — it has none of the
-- submerge/emerge mechanics that caused the burster sliding in I-164, so no
-- SmartAI rooting changes are needed here.
--
-- creature_model_info bounds: BoundingRadius/CombatReach=0 lets the Jormungar
-- M2's built-in bounds drive collision, matching the stock Jormungar displays
-- (26817-26819) and the I-164 clones (900001-900003).

DELETE FROM `creature_model_info` WHERE `DisplayID` = 900007;
INSERT INTO `creature_model_info`
  (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
  (900007, 0, 0, 2, 0);

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900007
  WHERE `CreatureID` = 21849 AND `Idx` = 0; -- Bone Crawler (Auchindoun / Bone Wastes)
