-- Removed Nature resistance and replaced with Strength
UPDATE `item_template` SET `stat_type2` = 4, `stat_value2` = 6, `nature_res` = 0 WHERE (`entry` = 17739);