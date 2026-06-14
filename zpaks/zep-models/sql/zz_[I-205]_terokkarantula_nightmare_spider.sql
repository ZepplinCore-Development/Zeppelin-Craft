-- I-205: Terokkarantula (20682) model swap.
-- Was: display 19716 (MineSpider\MineSpiderBoss at 10x scale).
-- Now: new display 900006 -> model 900005 (retroported Nightmare Spider),
-- defined in dbc/[I-205]_creaturedisplayinfo.sql and dbc/[I-205]_creaturemodeldata.sql.
--
-- creature_model_info bounds: BoundingRadius/CombatReach = 0 lets the M2's
-- built-in bounds drive collision (same convention as I-164 / I-193 displays).
-- A creature_model_info row MUST exist for a custom display or the creature
-- renders invisible.
--
-- DisplayScale 3.0 drives the boss-rare size server-side (DBC creature_model_scale
-- stays neutral at 1.0). Tune size here with a world SQL re-apply + .reload
-- creature_template -- no client patch rebuild needed. DisplayScale also scales
-- combat reach / bounding radius server-side (Creature.cpp SetObjectScale).

DELETE FROM `creature_model_info` WHERE `DisplayID` = 900006;
INSERT INTO `creature_model_info`
  (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
  (900006, 0, 0, 2, 0);

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900006, `DisplayScale` = 3.0
  WHERE `CreatureID` = 20682 AND `Idx` = 0; -- Terokkarantula
