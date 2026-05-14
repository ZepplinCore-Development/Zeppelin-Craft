-- F-072 Peacekeeping Diplomacy: Remove RIVAL flag from Aldor/Scryer factions
-- Stock reputation_flags = 80 (0x50) = FACTION_FLAG_RIVAL (0x40) | FACTION_FLAG_PEACE_FORCED (0x10)
-- New reputation_flags = 16 (0x10) = FACTION_FLAG_PEACE_FORCED only
-- This allows both factions to appear in the reputation panel simultaneously

UPDATE `faction` SET
  `reputation_flags_1` = 16,
  `reputation_flags_2` = 16,
  `reputation_flags_3` = 16
WHERE `id` IN (932, 934);
