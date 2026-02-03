-- Remove charge limit of Manual Crowd Pummeler
UPDATE `item_template` SET `spellcharges_1` = 0, `spellcooldown_1` = 300000 WHERE (`entry` = 9449);
