-- [F-220] Retired rider displays (see dbc/[F-220]_retired_displays.sql): their creature_model_info rows.

DELETE FROM creature_model_info WHERE DisplayID = 900500;
DELETE FROM creature_model_info WHERE DisplayID = 900502;
DELETE FROM creature_model_info WHERE DisplayID = 900504;
DELETE FROM creature_model_info WHERE DisplayID = 900506;
DELETE FROM creature_model_info WHERE DisplayID = 900508;
DELETE FROM creature_model_info WHERE DisplayID = 900510;
DELETE FROM creature_model_info WHERE DisplayID = 900512;
DELETE FROM creature_model_info WHERE DisplayID = 900514;
DELETE FROM creature_model_info WHERE DisplayID = 900516;
DELETE FROM creature_model_info WHERE DisplayID = 900518;
DELETE FROM creature_model_info WHERE DisplayID = 900520;
DELETE FROM creature_model_info WHERE DisplayID = 900522;
DELETE FROM creature_model_info WHERE DisplayID = 900524;
DELETE FROM creature_model_info WHERE DisplayID = 900526;
DELETE FROM creature_model_info WHERE DisplayID = 900528;
DELETE FROM creature_model_info WHERE DisplayID = 900530;

-- the death knight riders (kept fused, 2026-10-17)
DELETE FROM creature_model_info WHERE DisplayID = 900515;
DELETE FROM creature_model_info WHERE DisplayID = 900517;
DELETE FROM creature_model_info WHERE DisplayID = 900519;
DELETE FROM creature_model_info WHERE DisplayID = 900521;
DELETE FROM creature_model_info WHERE DisplayID = 900523;
DELETE FROM creature_model_info WHERE DisplayID = 900525;

-- 900531 (Rend exists as display 16664)
DELETE FROM creature_model_info WHERE DisplayID = 900531;

-- 900527 (demon knight, kept fused)
DELETE FROM creature_model_info WHERE DisplayID = 900527;
