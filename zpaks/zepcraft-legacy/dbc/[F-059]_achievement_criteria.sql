-- [F-059] zepcraft-legacy: achievement_criteria
-- Sunken Temple Lower achievement criteria (kill Atal'alarion)

-- Normal: Sunken Temple Lower (achievement 5123)
DELETE FROM `achievement_criteria` WHERE `id` = 13623;
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES (13623, 5123, 0, 8580, 1, 0, 0, 0, 0, 'Atal''alarion', 16712190, 2, 0, 0, 0, 1);

-- Heroic: Sunken Temple Lower (achievement 5124)
DELETE FROM `achievement_criteria` WHERE `id` = 13624;
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES (13624, 5124, 0, 8580, 1, 0, 0, 0, 0, 'Atal''alarion', 16712190, 2, 0, 0, 0, 1);

-- Mythic: Sunken Temple Lower (achievement 5125)
DELETE FROM `achievement_criteria` WHERE `id` = 13625;
INSERT INTO `achievement_criteria` (`id`, `achievement_id`, `type`, `req_asset_id`, `req_asset_count`, `start_event`, `start_asset_id`, `fail_event`, `fail_asset_id`, `desc_enus`, `desc_flags`, `flags`, `timer_start_event`, `timer_asset_id`, `timer_limit`, `ui_order`) VALUES (13625, 5125, 0, 8580, 1, 0, 0, 0, 0, 'Atal''alarion', 16712190, 2, 0, 0, 0, 1);
