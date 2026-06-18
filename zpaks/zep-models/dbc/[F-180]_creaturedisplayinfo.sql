-- F-180: Phase out CarrionBird Outland model 2286 with ThunderIsleYoungBird.
-- Updates the 13 existing CreatureDisplayInfo rows that referenced model 2286
-- to use the new ThunderIsleYoungBird ModelData (900002, see
-- [F-180]_creaturemodeldata.sql) with per-display youngbird color textures
-- assigned by zone/lore (see F-180 Joplin note).
--
-- texture_variation_1 = base filename of the BLP (no extension, no path).
-- Engine looks up the matching BLP next to the M2 (Creature\ThunderIsleYoungBird\).
-- texture_variation_2/3 cleared because youngbird is a single-texture model
-- (unlike stock CarrionBirdOutland which had separate skin + wing textures).
--
-- Existing creature_model_info rows (DisplayID-keyed) remain valid since we
-- keep the same DisplayIDs - no world SQL needed.

-- Hellfire Peninsula live-spawn creatures
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdred',    texture_variation_2 = '', texture_variation_3 = '' WHERE id = 16880; -- Bonestripper Buzzard
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdbrown',  texture_variation_2 = '', texture_variation_3 = '' WHERE id = 17089; -- Bonestripper Vulture
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdblue',   texture_variation_2 = '', texture_variation_3 = '' WHERE id = 18094; -- Torgos (rare elite)

-- Terokkar Forest / Skettis live-spawn creatures
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdgold',   texture_variation_2 = '', texture_variation_3 = '' WHERE id = 20348; -- Trachela (rare elite)
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdpurple', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 20300; -- Angered Arakkoa Protector

-- Stock placeholder / test templates (0 spawns) - wired to remaining colors so all 7 BLPs are accessible
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdpurple', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 16881; -- Arakkoa Test Summon / Carrion Bird Blue template
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdgreen',  texture_variation_2 = '', texture_variation_3 = '' WHERE id = 16882; -- Carrion Bird Green template
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdsilver', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 16883; -- Carrion Bird White template
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdsilver', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 16884; -- Carrion Bird Yellow template; also Bonelasher (18470), repointed from shared CarrionBird display 1192 (see zz_[F-180]_bonelasher_model.sql)

-- Unassigned (no creature references) - parked on remaining colors for completeness
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdsilver', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 17455;
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdblue',   texture_variation_2 = '', texture_variation_3 = '' WHERE id = 17646;
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdgreen',  texture_variation_2 = '', texture_variation_3 = '' WHERE id = 18089;
UPDATE creaturedisplayinfo SET model_id = 900002, texture_variation_1 = 'thunderisleyoungbirdsilver', texture_variation_2 = '', texture_variation_3 = '' WHERE id = 20347;
