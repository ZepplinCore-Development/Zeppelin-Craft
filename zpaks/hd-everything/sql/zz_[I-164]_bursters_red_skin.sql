-- I-164: Point Hellfire Peninsula bursters at the new red HD sandworm DisplayIDs
-- (900001-900003 defined in dbc/[I-164]_creaturedisplayinfo.sql). The stock
-- blue HD skin is kept for any future non-Hellfire sandworm-model creatures
-- (Ouro in AQ40, Scourged Burrower, etc.).
--
-- Mapping:
--   900001 = SandWorm-Hellfire            (stock 16395 equivalent)
--   900002 = SandWorm-Hellfire-SpecAlpha  (stock 15774 equivalent, scale 3.0)
--   900003 = SandWorm-Hellfire-SpecAlpha  (stock 16573 equivalent, scale 1.85)

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
