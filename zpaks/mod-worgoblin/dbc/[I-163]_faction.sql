-- I-163: Fix missing races in Aldor/Scryer reputation_race_mask
-- Worgoblin BASE import flattened multi-slot masks but dropped Dwarf, NightElf, Tauren, Goblin, BloodElf, Draenei
-- Set all 12 races (4095) in slot 1, clear unused slots 2-3

UPDATE `faction` SET
  `reputation_race_mask_1` = 4095,
  `reputation_race_mask_2` = 0,
  `reputation_race_mask_3` = 0,
  `reputation_flags_1` = 16,
  `reputation_flags_2` = 0,
  `reputation_flags_3` = 0
WHERE `id` IN (932, 934);
