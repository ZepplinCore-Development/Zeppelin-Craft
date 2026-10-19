-- I-379: Felsteed (2346, creature 304) and Dreadsteed (14554, creature 14505)
-- -> spaceslam's NightmareNew models ([I-379]_creaturemodeldata.sql).
-- Applies after patch-hd-everything's model_id = 6023/6024 + 'Glowred' rows
-- (zep-models priority 500 > 30). Skins = spaceslam's DBC values; the BLPs live
-- next to the models in Creature\NightmareNew\.
--
-- TEMPORARY: remove once F-216 (model source blending) picks a source per model.

UPDATE creaturedisplayinfo SET
  model_id = 900006,
  texture_variation_1 = 'slow1HorseSkinEvil',
  texture_variation_2 = 'slow2HorseSkinEvil',
  texture_variation_3 = ''
WHERE id = 2346;

UPDATE creaturedisplayinfo SET
  model_id = 900007,
  texture_variation_1 = 'fast1HorseSkinEvilRed',
  texture_variation_2 = '',
  texture_variation_3 = ''
WHERE id = 14554;
