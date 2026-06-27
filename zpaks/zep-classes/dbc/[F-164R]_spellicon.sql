-- [F-164R] Rocksteady Family - spellicon
-- Custom icon for Rockwall (900223): the HotS Gul'dan "Healthstone" icon recolored
-- dominant red (icon_hots_guldan_healthstone_1_DOMINANT_RED), to match the bigger
-- swirling volcanic-rock shield visual (spellvisual 90021).
-- BLP ships in patch-custom-icons (PATCH-I) at Interface\Icons\; this row maps the
-- icon id the spell references. Stoneskin (900164) keeps the stock icon 5469.
-- (Previously icon_hots_mei_r2_icewall_BASIC_YELLOW; swapped 2026-06-27.)
DELETE FROM `spellicon` WHERE `id` = 5810;
INSERT INTO `spellicon` (`id`, `name`) VALUES (5810, 'INTERFACE\\ICONS\\icon_hots_guldan_healthstone_1_DOMINANT_RED');
