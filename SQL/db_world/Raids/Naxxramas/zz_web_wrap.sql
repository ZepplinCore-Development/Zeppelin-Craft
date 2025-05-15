-- Reduced health of Web Wraps to 1 (was 2)
UPDATE `creature_template` SET `HealthModifier` = 1 WHERE (`entry` = 351079);
