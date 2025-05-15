-- Reduce cooldown from 2 seconds to 1 second of Zandalar Honor Token
UPDATE `item_template` SET `spellcooldown_1` = 1000 WHERE (`entry` = 19858);