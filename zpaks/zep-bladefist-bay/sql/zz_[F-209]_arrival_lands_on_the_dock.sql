-- =============================================================================
-- F-209  Warchief's Emissary lands on the dock again
--
-- Supersedes the teleport half of I-368.
--
-- I-368 moved spell 74029's teleport to a beach at (1345, -4945) because the
-- donor coordinate (1468.8, -5012.29, 11.7693) dropped the player 25 yards
-- under the sea. That diagnosis was right about the symptom and wrong about the
-- cause: the coordinate was never bad. It stands on the Bladefist Bay dock,
-- which Cataclysm built and we did not have.
--
-- We have it now. Parsing ND_ORC_DOCKS.WMO at the placement in
-- `adt_placements.json` puts a horizontal plank surface at **z 11.76**, one
-- yard from that point - 3 centimetres under the donor's stored Z. The retail
-- value is restored, orientation included: 3.23862 faces you up the dock toward
-- the shore, which is the way you then walk to Orgrimmar.
--
-- The BIND (EffectIndex 0) is NOT restored to the donor value and stays on
-- Orgrimmar. Retail bound you to the dock; I-367 makes Orgrimmar the Bilgewater
-- Cartel's home and Overlord Runthak the quest ender, and the spell is named
-- "Bind to Orgrimmar". The donor conflated the two because in Cataclysm the
-- dock IS the goblin arrival point; here the city is.
--
-- The quest POI is left on Runthak, unchanged from I-367.
-- =============================================================================

UPDATE `spell_target_position` SET
  `PositionX` = 1468.8,
  `PositionY` = -5012.29,
  `PositionZ` = 11.7693,
  `Orientation` = 3.23862
WHERE `ID` = 74029 AND `EffectIndex` = 2;
