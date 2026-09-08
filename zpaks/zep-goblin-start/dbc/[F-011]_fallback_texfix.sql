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

-- Creature\GoblinShredderMount\GoblinShredderMount.m2 — SUPERSEDED by I-364.
--
-- I-361 set displays 31484 (and by extension the shredder set) to the HD pack's
-- ShredderMountRed1-3, because the HD replacement mesh had THREE monster-skin slots
-- (texture types 11/12/13) and the ported row left slot 3 blank, so that material
-- rendered untextured.
--
-- I-364 then showed that HD mesh is the thing that HANGS the client whenever a combat
-- animation plays: its Attack1H sequences are ALIASES (flag 0x40) into an external
-- .anim, where stock and retail both carry the attack embedded. It has been replaced
-- by a fresh MultiConverter retroport of the retail Cata model.
--
-- The retail mesh has only TWO monster-skin slots (types 11 and 12), exactly like
-- stock — so slot 3 does not exist to fill, and the originally ported values were
-- right all along. The red set was authored for the HD mesh's UVs and does not belong
-- on this one. Reverted to the retail/stock skin names, which ship in this zpak.
UPDATE creaturedisplayinfo SET
  texture_variation_1 = 'GoblinShredderMountSkin1_01',
  texture_variation_2 = 'GoblinShredderMountSkin1_02',
  texture_variation_3 = ''
WHERE id IN (31484, 26612, 26559);  -- 39592/39598 uniform, shredder mount, Buccaneer
