-- [F-220] Retired rider displays: the former "fake" looks, one display each (900500, 900502, ... 900530).
-- Each rider is now ONE display (the odd id); the fake look is an option of it (display_options.json),
-- and its bake ships under the rider's id (CreatureDisplayExtra-<id>_fake.blp). These ids were only
-- ever on unspawned preview creatures (retired in zep-models zz_[F-220]_rider_previews.sql), so
-- they are deleted, not aliased (the [F-211] alias rule is for displays live spawns may hold).

DELETE FROM creaturedisplayinfo WHERE id = 900500;
DELETE FROM creaturedisplayinfoextra WHERE id = 900500;
DELETE FROM creaturedisplayinfo WHERE id = 900502;
DELETE FROM creaturedisplayinfoextra WHERE id = 900502;
DELETE FROM creaturedisplayinfo WHERE id = 900504;
DELETE FROM creaturedisplayinfoextra WHERE id = 900504;
DELETE FROM creaturedisplayinfo WHERE id = 900506;
DELETE FROM creaturedisplayinfoextra WHERE id = 900506;
DELETE FROM creaturedisplayinfo WHERE id = 900508;
DELETE FROM creaturedisplayinfoextra WHERE id = 900508;
DELETE FROM creaturedisplayinfo WHERE id = 900510;
DELETE FROM creaturedisplayinfoextra WHERE id = 900510;
DELETE FROM creaturedisplayinfo WHERE id = 900512;
DELETE FROM creaturedisplayinfoextra WHERE id = 900512;
DELETE FROM creaturedisplayinfo WHERE id = 900514;
DELETE FROM creaturedisplayinfoextra WHERE id = 900514;
DELETE FROM creaturedisplayinfo WHERE id = 900516;
DELETE FROM creaturedisplayinfoextra WHERE id = 900516;
DELETE FROM creaturedisplayinfo WHERE id = 900518;
DELETE FROM creaturedisplayinfoextra WHERE id = 900518;
DELETE FROM creaturedisplayinfo WHERE id = 900520;
DELETE FROM creaturedisplayinfoextra WHERE id = 900520;
DELETE FROM creaturedisplayinfo WHERE id = 900522;
DELETE FROM creaturedisplayinfoextra WHERE id = 900522;
DELETE FROM creaturedisplayinfo WHERE id = 900524;
DELETE FROM creaturedisplayinfoextra WHERE id = 900524;
DELETE FROM creaturedisplayinfo WHERE id = 900526;
DELETE FROM creaturedisplayinfoextra WHERE id = 900526;
DELETE FROM creaturedisplayinfo WHERE id = 900528;
DELETE FROM creaturedisplayinfoextra WHERE id = 900528;
DELETE FROM creaturedisplayinfo WHERE id = 900530;
DELETE FROM creaturedisplayinfoextra WHERE id = 900530;

-- The death knight riders (900515 black, 900517 Lady Blaumeux, 900519 gold-red female, 900521 Highlord
-- Mograine, 900523 Thane Korth'azz, 900525 Sir Zeliek): not split any more - their fused bodies match no
-- character model, so the stock fused model stays (2026-10-17). Only unspawned previews ever used them.
DELETE FROM creaturedisplayinfo WHERE id = 900515;
DELETE FROM creaturedisplayinfoextra WHERE id = 900515;
DELETE FROM creaturedisplayinfo WHERE id = 900517;
DELETE FROM creaturedisplayinfoextra WHERE id = 900517;
DELETE FROM creaturedisplayinfo WHERE id = 900519;
DELETE FROM creaturedisplayinfoextra WHERE id = 900519;
DELETE FROM creaturedisplayinfo WHERE id = 900521;
DELETE FROM creaturedisplayinfoextra WHERE id = 900521;
DELETE FROM creaturedisplayinfo WHERE id = 900523;
DELETE FROM creaturedisplayinfoextra WHERE id = 900523;
DELETE FROM creaturedisplayinfo WHERE id = 900525;
DELETE FROM creaturedisplayinfoextra WHERE id = 900525;
