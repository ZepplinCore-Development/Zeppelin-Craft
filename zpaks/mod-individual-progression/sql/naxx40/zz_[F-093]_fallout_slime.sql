-- Reduced damage of Fallout Slime to 12 (was 46) and health to 4 (was 16).
-- Autobalance is not correctly detecting it.
-- These are spawned during the Grobbulus fight, from his Slime Spray ability.
UPDATE `creature_template` SET `DamageModifier` = 12, `HealthModifier` = 4 WHERE (`entry` = 351067);