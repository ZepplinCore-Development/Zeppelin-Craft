-- F-220: fused rider+mount displays become the riderless MOUNT; the rider is its own
-- display (zep-models dbc/[F-220]_creaturedisplayinfo.sql) seated via creature addon mount.
--
-- 15303 (was model 2194 Creature\FelBat\BatRider, rider fused in, no skins) ->
-- the taxi bat (model 331, Creature\FelBat\BatTaxi) in the Bloodseeker Bat brown skin
-- (display 14562). The shipped BatTaxi.m2 (HD) skins body/wings/saddle through slots
-- 11/12/13, has seat attachment 0 and stand/run/attack/wound/death/fly anims. ZG's
-- BatSknn01/02 are the old FelBat UV layout and do not fit it. Saddle = stock Taxi3.
-- SHIP TOGETHER with sql/: every creature still on 15303 as its OWN display
-- (14750 Gurubashi Bat Rider, 15242 Bat Rider Guard) loses its rider otherwise.

UPDATE creaturedisplayinfo SET
  model_id = 331,
  sound_id = 308,
  texture_variation_1 = 'BatSkinBrown01',
  texture_variation_2 = 'BatSkinBrown02',
  texture_variation_3 = 'Taxi3'
WHERE id = 15303;

-- 21263 (Creature\TeronGorefiend_Mounted, Teron fused on his horse) -> the horse alone
-- (model 900220, cut out by cli/lib/strip_rider.py: the rider's skeleton branch dropped from
-- every LOD skin, attachment 0 moved onto the horse as the seat). The rider is Teron's own
-- standalone display 21262 (TeronGorefiend.m2 has the Mount anim).
UPDATE creaturedisplayinfo SET
  model_id = 900220
WHERE id = 21263;
