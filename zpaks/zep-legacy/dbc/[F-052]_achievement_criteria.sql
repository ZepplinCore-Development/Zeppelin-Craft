-- [F-052] zep-legacy: achievement_criteria
-- Classic instance achievement criteria fixes (Ragefire Chasm, Wailing Caverns)

-- achievement_criteria: 2 updates
UPDATE `achievement_criteria` SET `req_asset_id` = 11518, `desc_enus` = 'Jergosh the Invoker' WHERE `id` = 525;
UPDATE `achievement_criteria` SET `req_asset_id` = 5775, `desc_enus` = 'Verdan the Everliving' WHERE `id` = 526;
