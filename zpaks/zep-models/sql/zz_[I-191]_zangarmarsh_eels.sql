-- I-191: Zangarmarsh eel model swap — server side.
-- DBC side in dbc/[I-191]_creaturemodeldata.sql / [I-191]_creaturedisplayinfo.sql.
--
-- Umbrafen Eel (18138, display 19286) and Shimmerscale Eel (18750, display
-- 18147) keep their stock display IDs (edited in place in DBC) — no world
-- changes needed; their creature_model_info rows stay valid.
--
-- Lagoon Eel (20290) moves off shared display 19287 (also used by Nether
-- Beast 19731 in Netherstorm) onto new display 900004 (black/purple skin).

-- Repoint Lagoon Eel to the new display
UPDATE creature_template_model SET CreatureDisplayID = 900004
WHERE CreatureID = 20290 AND CreatureDisplayID = 19287;

-- creature_model_info for the new display (values copied from 19287 so
-- bounding radius / combat reach are unchanged). Required — a missing row
-- renders creatures invisible.
DELETE FROM creature_model_info WHERE DisplayID = 900004;
INSERT INTO creature_model_info (DisplayID, BoundingRadius, CombatReach, Gender, DisplayID_Other_Gender) VALUES
  (900004, 1.5, 3, 2, 0);
