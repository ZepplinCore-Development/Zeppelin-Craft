-- Swap spell on Libram of fervor back to WOTLK version
UPDATE `item_template` SET `spellid_1` = 60804 WHERE (`entry` = 23203);