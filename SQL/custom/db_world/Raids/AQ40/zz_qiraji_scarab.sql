-- when respawning auto balance skips these adds and they are too strong for duo teams
UPDATE `creature_template` SET `HealthModifier` = '0.25', `mechanic_immune_mask` = 0 WHERE (`entry` = 15316 OR `entry` = 15317)
