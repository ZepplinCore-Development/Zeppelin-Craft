-- F-231: Gnomeregan slimes wear the retail Junker Slime model.
-- Displays 900600 (green, Irradiated Slime) and 900601 (black oil, Corrosive Lurker, twice the
-- size) are defined in dbc/[F-231]_creaturedisplayinfo.sql. Displays 358 / 11137 are shared
-- with oozes world-wide, so only these creatures are repointed. Heroic and Mythic clones have
-- their own creature_template_model rows and are repointed with their normal entry.
-- creature_model_info copied from the old displays (358: 0.599 / 1.25, 11137: 1.198 / 2.5).
-- creature_template_model is read at startup only: needs a worldserver restart.

DELETE FROM `creature_model_info` WHERE `DisplayID` IN (900600, 900601);
INSERT INTO `creature_model_info`
  (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
  (900600, 0.599, 1.25, 2, 0),
  (900601, 1.198, 2.5, 2, 0);

-- Irradiated Slime 6218, Heroic 9100612, Mythic 9100650 (was display 358)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 900600
  WHERE `CreatureID` IN (6218, 9100612, 9100650) AND `Idx` = 0;
-- Corrosive Lurker 6219, Heroic 9100605, Mythic 9100643 (was display 11137)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 900601
  WHERE `CreatureID` IN (6219, 9100605, 9100643) AND `Idx` = 0;
