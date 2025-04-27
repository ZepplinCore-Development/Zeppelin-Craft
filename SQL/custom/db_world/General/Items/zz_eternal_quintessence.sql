-- Reduce cooldown of Eternal Quintessence to 1 minute (was 60)
UPDATE `item_template` SET `spellcooldown_1` = 60000,`spellcategorycooldown_1` = 60000 WHERE `entry` = 22754;