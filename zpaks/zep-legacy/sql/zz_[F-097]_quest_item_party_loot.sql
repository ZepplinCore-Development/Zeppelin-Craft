-- Add ITEM_FLAG_PARTY_LOOT (0x800 = 2048) to all quest items that drop from creatures
-- This ensures every party member who needs the quest can loot the item independently,
-- rather than only one player getting the drop per kill.
UPDATE item_template
SET Flags = Flags | 2048
WHERE class = 12
  AND entry IN (SELECT DISTINCT item FROM creature_loot_template)
  AND (Flags & 2048) = 0;
