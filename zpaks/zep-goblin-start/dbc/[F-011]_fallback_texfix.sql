-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 fallback creature texture_variation (monster-skin) fix

UPDATE creaturedisplayinfo SET texture_variation_1='GOBLIN' WHERE id=31782;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='YoggSaronBodySkinTentacleBlue' WHERE id=34202;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='YoggSaronBodySkinTentacleVine' WHERE id=30165;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='Raptor_OutlandYellow' WHERE id=30306;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='Raptor_OutlandBlack' WHERE id=30303;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='InfernalSkin' WHERE id=31296;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='GOBLIN' WHERE id=31781;  -- shipped=True
