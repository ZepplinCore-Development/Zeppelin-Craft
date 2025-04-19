-- Reduce Patchwerk health modifier to 600 (was 1200)
UPDATE `creature_template` SET `HealthModifier` = 600 WHERE (`entry` = 351028);