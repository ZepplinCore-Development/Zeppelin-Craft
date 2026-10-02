-- I-373: Drop the level requirement on account-bound mounts whose level gate
-- sits above the riding rank they need. These are the only mounts that need
-- the level-up hook to sync; everything else is gated by its riding rank,
-- which is trainable only at or after the mount's level. With required_level
-- = 0 the riding skill alone gates them, so login + riding-rank achievement
-- (891/889/890/892) are the only triggers that matter.
--
--   17229 Winterspring Frostsaber   40 / 75
--   25953 Blue Qiraji Battle Tank   40 / 75
--   26054 Red Qiraji Battle Tank    40 / 75
--   26055 Yellow Qiraji Battle Tank 40 / 75
--   26056 Green Qiraji Battle Tank  40 / 75
--   43688 Amani War Bear            70 / 150
--   64659 Venomhide Ravasaur        40 / 75
--   71342 Big Love Rocket           80 / 150
--
-- Template rows are read into memory at startup (LoadMounts) and SaveMounts
-- copies them into account_bound_mounts, so the saved rows are fixed too.

UPDATE `account_bound_mount_template` SET `required_level` = 0 WHERE `spell_id` IN (17229, 25953, 26054, 26055, 26056, 43688, 64659, 71342);

UPDATE `account_bound_mounts` SET `required_level` = 0 WHERE `spell_id` IN (17229, 25953, 26054, 26055, 26056, 43688, 64659, 71342);
