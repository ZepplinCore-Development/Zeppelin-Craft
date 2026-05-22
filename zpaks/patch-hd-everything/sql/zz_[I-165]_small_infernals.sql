-- I-165: HD-replaced Infernal model (DisplayID 10906) renders undersized.
-- Scale up Hellfire Peninsula creatures that share the model to 1.5x.
--
-- Other creatures use DisplayID 10906 but are NOT adjusted here because they
-- haven't been verified in-context (may be intentionally small or never spawn):
--   4676  Lesser Infernal        (Felwood/Winterspring, map 1 — not Hellfire)
--   11437 Minor Infernal         (no spawns — likely warlock-summon visual)
--   34815 Felflame Infernal      (no spawns — likely Ulduar script adds)
--   35262 Felflame Infernal (1)  (no spawns)
--   35263 Felflame Infernal (2)  (no spawns)
--   35264 Felflame Infernal (3)  (no spawns)
--   24707 Buoy                   (ocean decor — leave alone)

UPDATE `creature_template_model` SET `DisplayScale` = 1.5 WHERE `CreatureID` IN (
  19259, -- Infernal Invader    (Thrallmar)
  19261  -- Infernal Warbringer (Honor Hold + Thrallmar)
);
