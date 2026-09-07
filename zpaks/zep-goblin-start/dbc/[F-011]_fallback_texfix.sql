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

-- HD-model skin slots (patch-hd-everything / F-049).
-- Creature\RocketChicken\RocketChicken.m2 is replaced by the HD pack with a model
-- whose skins are texture type 11/12 (monster skin 1/2) -> resolved at runtime from
-- texture_variation_1/_2. F-049 patched the only display on model 2674 that existed
-- then (22903, Rocket Chicken). The 4.3.4 donor rows are legitimately blank (Cata's
-- own model embeds type-0 textures), so the F-011 port carried blanks in -> no skin
-- bound -> untextured. This zpak (priority 100) applies after patch-hd-everything
-- (priority 10), so the repair has to live here.
-- NOTE: display 30997 (Mechachicken 38224) was moved off model 2674 entirely --
-- see [I-323]_creaturedisplayinfo.sql, which owns that row's full final state.
UPDATE creaturedisplayinfo SET texture_variation_1='body', texture_variation_2='rocket' WHERE id=36372;  -- Micro Mechachicken (48519)

-- Creature\GoblinShredderMount\GoblinShredderMount.m2 — same class as the
-- RocketChicken above, one slot further along.
--
-- The HD pack replaces this mesh in place, and the replacement uses THREE monster
-- skin slots, not the stock two. Parsed out of the shipped PATCH-Z copy
-- (sha256 d2496765…, identical in both zpaks) — 11 textures, of which:
--   tex[0]  type 11  monster skin 1  -> texture_variation_1
--   tex[9]  type 12  monster skin 2  -> texture_variation_2
--   tex[6]  type 13  monster skin 3  -> texture_variation_3
-- the other 8 are type 0 with embedded Creature\Shredder\*.blp names.
--
-- Stock 3.3.5 display 26612 supplied only _01/_02 and left slot 3 empty, which was
-- right for the stock 2-slot mesh. F-049 repointed 26612 to Shreddermountred1/2/3
-- for the HD mesh. F-011 then ported display 31484 (creature 39592 Ultimate Footbomb
-- Uniform) carrying the stock pair and a BLANK slot 3 -> type 13 binds nothing and
-- that material renders untextured.
--
-- No third texture exists in the stock set (there is no GoblinShredderMountSkin1_03),
-- so the slot can only be filled from an HD-authored triple. Two ship:
-- ShredderMountRed1-3 (already on 26612, the standard shredder) and
-- ShredderMountGreen1-3, which ships but no display in the DBC uses. Red chosen by
-- Justin 2026-09-07. We hold no Cata DBC for 31484, so the donor's intended colour is
-- unknown either way — what IS certain is that a blank slot 3 is wrong.
UPDATE creaturedisplayinfo SET
  texture_variation_1 = 'ShredderMountRed1',
  texture_variation_2 = 'ShredderMountRed2',
  texture_variation_3 = 'ShredderMountRed3'
WHERE id = 31484;  -- 39592 Ultimate Footbomb Uniform
