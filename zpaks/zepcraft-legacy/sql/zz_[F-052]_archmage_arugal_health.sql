-- Reduce health multiplier to 8 (was 10)
UPDATE `creature_template` SET `HealthModifier` = 8 WHERE (`entry` = 4275);
