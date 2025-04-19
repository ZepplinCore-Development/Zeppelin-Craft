-- Plagued Champion reduced health to 7 (was 11) and damage to 15 (was 26)
UPDATE `creature_template` SET `HealthModifier` = 7 WHERE (`entry` = 351086);
UPDATE `creature_template` SET `DamageModifier` = 15 WHERE (`entry` = 351086);

-- Plagued Warrior reduced health to 7 (was 10) and damage to 15 (was 22)
UPDATE `creature_template` SET `HealthModifier` = 7 WHERE (`entry` = 351087);
UPDATE `creature_template` SET `DamageModifier` = 15 WHERE (`entry` = 351087);