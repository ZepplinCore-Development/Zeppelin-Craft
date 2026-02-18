-- Ancient Stone Keeper bumped to 41 (was 44, then 40)
UPDATE `creature_template` SET `minlevel` = 41, `maxlevel` = 41 WHERE (`entry` = 7206);

-- Lower nearby constructs to match East wing target level (40)
-- Earthen Rocksmasher (42-43 -> 40)
UPDATE `creature_template` SET `minlevel` = 40, `maxlevel` = 40 WHERE (`entry` = 7011);
-- Earthen Sculptor (42-43 -> 40)
UPDATE `creature_template` SET `minlevel` = 40, `maxlevel` = 40 WHERE (`entry` = 7012);
-- Stone Steward (44 -> 40)
UPDATE `creature_template` SET `minlevel` = 40, `maxlevel` = 40 WHERE (`entry` = 4860);
