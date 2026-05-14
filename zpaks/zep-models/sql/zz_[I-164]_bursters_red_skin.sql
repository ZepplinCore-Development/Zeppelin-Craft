-- I-164: Point Hellfire Peninsula bursters at the new Jormungar-model display IDs
-- (900001-900003 defined in dbc/[I-164]_burster_jormungar_swap.sql).
--
-- Mapping (all use Jormungar.M2 with texture_variation_1='JormungarRed'):
--   900001 = scale 1.7  (was stock 16395 — SandWorm)
--   900002 = scale 3.0  (was stock 15774 — SandWorm)
--   900003 = scale 1.85 (was stock 16573 — SandWorm)
--
-- creature_model_info bounds: BoundingRadius/CombatReach=0 lets the M2's built-in
-- bounds drive collision, which is the correct default for cloned displays that
-- mirror stock Jormungar entries (which also use 0/0 — see stock displays 26817,
-- 26818, 26819, etc.).

DELETE FROM `creature_model_info` WHERE `DisplayID` IN (900001, 900002, 900003);
INSERT INTO `creature_model_info`
  (`DisplayID`, `BoundingRadius`, `CombatReach`, `Gender`, `DisplayID_Other_Gender`) VALUES
  (900001, 0, 0, 2, 0),
  (900002, 0, 0, 2, 0),
  (900003, 0, 0, 2, 0);

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900001
  WHERE `CreatureID` IN (
    16844, -- Crust Burster
    16857, -- Marauding Crust Burster
    23285  -- Nethermine Burster
  ) AND `Idx` = 0;

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900002
  WHERE `CreatureID` = 21380 AND `Idx` = 0; -- Greater Crust Burster

UPDATE `creature_template_model` SET `CreatureDisplayID` = 900003
  WHERE `CreatureID` = 16968 AND `Idx` = 0; -- Tunneler
