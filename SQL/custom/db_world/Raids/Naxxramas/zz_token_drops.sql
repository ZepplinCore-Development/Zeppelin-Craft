-- Remove T3 token types from reference loot tables to support universal tokens

-- Gluth
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304550) AND (`Item` IN (22354, 22355, 22356, 22358, 22368, 22369, 22370, 22372));

-- Instructor Razuvious / Gothik the Harvester
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304780) AND (`Item` IN (22358, 22372));

-- Noth the Plaguebringer / Heigan the Unclean
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304570) AND (`Item` IN (22356, 22370));

-- Maexxna
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304590) AND (`Item` IN (22357, 22371));

-- Thaddius
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304500) AND (`Item` IN (22353, 22367));

-- Loatheb
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304740) AND (`Item` IN (22352, 22366));

-- Grobbulus / Patchwerk
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304530) AND (`Item` IN (22354, 22368));

-- Four Horsemen Chest
DELETE FROM `reference_loot_template` WHERE (`Entry` = 314800) AND (`Item` IN (22349, 22351));

-- Grand Widow Faerlina / Anub'Rekhan
DELETE FROM `reference_loot_template` WHERE (`Entry` = 304620) AND (`Item` IN (22355, 22369));
