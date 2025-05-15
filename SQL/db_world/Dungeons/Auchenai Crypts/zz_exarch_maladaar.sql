-- reduced damage modifier from 14 as this is much higher than any other normal boss, and even higher than heroic maladaar...
UPDATE `creature_template` SET `DamageModifier` = 6 WHERE (`entry` = 18373);
-- reduce attack speed from 1391ms to 2000ms on the Avatar of the martyred. too much damage coming through.
UPDATE `creature_template` SET `BaseAttackTime` = 2000 WHERE (`entry` = 18478);