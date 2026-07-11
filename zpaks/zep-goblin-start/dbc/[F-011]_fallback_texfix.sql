-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 fallback creature texture_variation (monster-skin) fix

UPDATE creaturedisplayinfo SET texture_variation_1='GOBLIN' WHERE id=31782;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='YoggSaronBodySkinTentacleBlue' WHERE id=34202;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='YoggSaronBodySkinTentacleVine' WHERE id=30165;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='Raptor_OutlandYellow' WHERE id=30306;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='Raptor_OutlandBlack' WHERE id=30303;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='InfernalSkin' WHERE id=31296;  -- shipped=True
UPDATE creaturedisplayinfo SET texture_variation_1='GOBLIN' WHERE id=31781;  -- shipped=True
