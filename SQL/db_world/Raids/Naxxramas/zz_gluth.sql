-- Reduced health on Gluth to 400 (was 500)
UPDATE `creature_template` SET `HealthModifier` = 400 WHERE (`entry` = 351004);