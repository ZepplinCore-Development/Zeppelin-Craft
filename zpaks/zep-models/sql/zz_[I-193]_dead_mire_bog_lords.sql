-- I-193: Dead Mire bog lord visual variation.
-- Withered Giant (18124) -> new red WoD fungal giant display 900005
-- (defined in dbc/[I-193]_creaturedisplayinfo.sql, model 900004).
-- Withered Bog Lord (19402) keeps its stock yellow display 18823, which is
-- scaled down 1.75 -> 1.25 on the DBC side to match.
--
-- creature_model_info bounds: BoundingRadius/CombatReach = 0 lets the M2's
-- built-in bounds drive collision (same convention as the I-164 displays).

DELETE FROM `creature_model_info` WHERE `DisplayID` = 900005;
INSERT INTO `creature_model_info`
  (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
  (900005, 0, 0, 2, 0);

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900005
  WHERE `CreatureID` = 18124 AND `Idx` = 0; -- Withered Giant
