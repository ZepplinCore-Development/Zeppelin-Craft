-- [F-164D] Volcanic Shield custom spellvisualeffectname rows (split from F-164).
-- Effect 90010: red-recolored Earth Shield state model (orbiting rocks).
-- Clone of stock effect 3118 "Earth Shield State"; file_name points to custom M2.
-- Model spells\volcanicshield_state_base.m2 ships in the zep-models zpak (PATCH-Z);
--   it references SPELLS\VOLCANICROCK_RED.BLP for the rocks (dust/glow reuse stock BLPs).
DELETE FROM `spellvisualeffectname` WHERE `id` = 90010;
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`)
VALUES (90010, 'Volcanic Shield State', 'spells\\volcanicshield_state_base.mdx', 1.0, 1.0, 0.01, 100.0);

-- Effect 90011/90012: red-recolored Lightning PreCast/Cast hand models (custom cast flourish).
-- Clones of stock effects 88 (Lightning PreCast Low Hand) and 293 (Lightning Cast Hand);
-- models spells\volcaniccast_precast.m2 / volcaniccast_cast.m2 ship in zep-models (PATCH-Z),
-- retextured to the red VOLCANIC_ZAP1/ZAP1B/BALL/GLOW2 BLPs.
DELETE FROM `spellvisualeffectname` WHERE `id` IN (90011, 90012, 90013);
INSERT INTO `spellvisualeffectname` (`id`, `name`, `file_name`, `area_effect_size`, `scale`, `min_allowed_scale`, `max_allowed_scale`) VALUES
  (90011, 'Volcanic Cast PreHand', 'spells\\volcaniccast_precast.mdx', 1.0, 1.0, 0.01, 100.0),
  (90012, 'Volcanic Cast Hand',    'spells\\volcaniccast_cast.mdx',    0.0, 1.0, 0.01, 100.0),
  -- 90013: partial-red recolor of LightningShield_Impact_Base (the "lines from the sky" impact).
  -- Zap1 + Blue_Glow2 swapped to red (VOLCANIC_ZAP1/GLOW2); lensflare1A + Blue_Star2 left stock blue.
  (90013, 'Volcanic Shield Impact','spells\\volcanicshield_impact.mdx', 1.0, 1.0, 0.01, 100.0);
