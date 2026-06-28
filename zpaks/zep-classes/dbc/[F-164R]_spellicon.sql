-- [F-164R] Rocksteady Family - spellicon
-- Custom icon for Rockwall (900223): the HotS Garrosh "Groundbreaker" icon
-- (icon_hots_garrosh_groundbreaker), to match the bigger swirling volcanic-rock
-- shield visual (spellvisual 90021). Same texture as stock custom icon 4779;
-- Rockwall keeps its own owned icon id 5810 so the texture can be swapped freely.
-- BLP already ships in patch-custom-icons (PATCH-I) at Interface\Icons\.
-- (Previously icon_hots_mei_r2_icewall_BASIC_YELLOW, then guldan_healthstone red;
--  swapped 2026-06-27.)
DELETE FROM `spellicon` WHERE `id` = 5810;
INSERT INTO `spellicon` (`id`, `name`) VALUES (5810, 'INTERFACE\\ICONS\\icon_hots_garrosh_groundbreaker');
