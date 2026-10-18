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

-- 6978 / 6979 (Creature\MechaStrider\GnomeMechaStrider, the pilot fused in; Mechanized Sentry 6233 /
-- Guardian 6234 + their heroic / mythic clones) -> the riderless red mechanostrider (model 751,
-- as stock display 9473). The pilot is the armoured tank pilot (same skin pilotarmor_yellow_01):
-- rider displays 900508 (fake) / 900509 (look). SHIP with those creatures' rider rows.
UPDATE creaturedisplayinfo SET
  model_id = 751,
  texture_variation_1 = 'GnomeMechaStriderSkinRed',
  texture_variation_2 = 'GnomeMechaStriderSkinRed2'
WHERE id IN (6978, 6979);

-- 22351 (Creature\HeadlessHorsemanMount, the Horseman fused on his horse) -> the horse alone (model 2647
-- Creature\HeadlessHorsemanHorse, as stock display 22653). The rider is the Horseman's own HD display 22352.
UPDATE creaturedisplayinfo SET
  model_id = 2647,
  sound_id = 428,
  creature_model_scale = 1,
  blood_id = 3
WHERE id = 22351;

-- Riderless mounts cut from their fused models (zep model strip-rider; models 900221-900227 in
-- [F-220]_creaturemodeldata.sql): each fused display becomes its own mount, the rider is the F-220 rider
-- display (zep-npc-wardrobe) seated via the creature addon mount. SHIP with those creatures' rider rows.
-- 17203: creature/horderider/horderider.m2 -> 900221
UPDATE creaturedisplayinfo SET model_id = 900221 WHERE id = 17203;
-- 18944 / 22409 (Vazruden the Herald, his Image): creature/felorcnetherdrake/felorcnetherdrakemounted.m2 -> 900222
UPDATE creaturedisplayinfo SET model_id = 900222 WHERE id IN (18944, 22409);
-- 21602: creature/tauren_mountedcanoe/tauren_mountedcanoe.m2 -> 900224
UPDATE creaturedisplayinfo SET model_id = 900224 WHERE id = 21602;
-- 2490: creature/gnomerocketcar/gnomerocketcar.m2 -> 900225
UPDATE creaturedisplayinfo SET model_id = 900225 WHERE id = 2490;
-- 17389 / 18088 / 26537 (Alliance, Unyielding, Lordaeron Knight; one skin set): creature/mountedknight/mountedknight.m2 -> 900227
UPDATE creaturedisplayinfo SET model_id = 900227 WHERE id IN (17389, 18088, 26537);

-- 5926 / 22700 (Creature\GnomeSpidertank\GnomeSpiderTank, the pilot fused in) -> the empty Mechano-Tank
-- (model 900229 = stock GnomeSpiderTank02 with its seat placed for the gnome pilot) in the same tank skin.
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinGreen', texture_variation_2 = '' WHERE id = 5926;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlue', texture_variation_2 = '' WHERE id = 22700;
-- the other fused-pilot Mechano-Tanks, same empty tank in their own tank skin: Flamewalker, Frostwalker,
-- Electrocutioner 6000, Crashin' Thrashin' Robot (16970, 21732-21734), and the unused 23363 / 23406
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinRed', texture_variation_2 = '' WHERE id = 6890;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlue', texture_variation_2 = '' WHERE id = 6891;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlack', texture_variation_2 = '' WHERE id = 6915;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinGreen', texture_variation_2 = '' WHERE id = 16970;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlack', texture_variation_2 = '' WHERE id = 21732;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinRed', texture_variation_2 = '' WHERE id = 21733;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlue', texture_variation_2 = '' WHERE id = 21734;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlue', texture_variation_2 = '' WHERE id = 23363;
UPDATE creaturedisplayinfo SET model_id = 900229, texture_variation_1 = 'GnomeSpiderTankSkinBlue', texture_variation_2 = '' WHERE id = 23406;

-- Creature\GnomeSpidertank\GnomePounder (the pilot fused in) -> the empty pounder (model 900230 = stock
-- GnomePounderVehicle with its seat placed for the gnome pilot) in the same tank skin: Mekgineer Thermaplugg
-- (6980), Mekgineer Steamrigger (18638), Shake-n-Quake 5000 (23383), and the unused 23382 / 23405
UPDATE creaturedisplayinfo SET model_id = 900230, texture_variation_1 = 'GnomeSpiderTankSkinRed', texture_variation_2 = '' WHERE id = 6980;
UPDATE creaturedisplayinfo SET model_id = 900230, texture_variation_1 = 'GnomeSpiderTankSkinRed', texture_variation_2 = '' WHERE id = 18638;
UPDATE creaturedisplayinfo SET model_id = 900230, texture_variation_1 = 'GnomeSpiderTankSkinBlack', texture_variation_2 = '' WHERE id = 23382;
UPDATE creaturedisplayinfo SET model_id = 900230, texture_variation_1 = 'GnomeSpiderTankSkinBlack', texture_variation_2 = '' WHERE id = 23383;
UPDATE creaturedisplayinfo SET model_id = 900230, texture_variation_1 = 'GnomeSpiderTankSkinBlack', texture_variation_2 = '' WHERE id = 23405;

-- 9723 (Creature\Drake\OrcDrakeRider, Rend fused on his drake) -> the stock classic drake (model 571
-- Creature\Drake\Drake, unused by any display) in the same DrakeSkin1-3: the riderless chromatic drake,
-- so remasters / pack drakes compete for it in the mount chooser. The rider is Rend's own display 16664.
UPDATE creaturedisplayinfo SET model_id = 571 WHERE id = 9723;

-- 17202 (Creature\AllianceRider2 - stock AllianceRider - the Wildhammer dwarf fused on his gryphon) -> the
-- gryphon cut from the stock AllianceRider (model 900228). The rider is display 900541 (zep-npc-wardrobe).
UPDATE creaturedisplayinfo SET model_id = 900228 WHERE id = 17202;
