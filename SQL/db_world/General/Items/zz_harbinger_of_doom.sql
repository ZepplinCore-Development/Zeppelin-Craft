-- Harbinger of Doom - Replaced Hit rating with Attack Power and removed Unique-Equipped.
UPDATE `item_template` SET `Flags` = 0, `stat_type4` = 38, `stat_value4` = 20 WHERE (`entry` = 23044);