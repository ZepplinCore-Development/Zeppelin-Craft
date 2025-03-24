-- Spectral Projection not scaled by Autobalance. Reduced Health (was 1.0)
UPDATE  `creature_template` SET `HealthModifier` = 0.33 WHERE (`entry` = 11263);
