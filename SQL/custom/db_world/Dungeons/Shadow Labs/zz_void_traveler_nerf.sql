-- Reduced health of void traveler summons as they are not correctly balanced by Autobalance.
UPDATE `creature_template` SET `HealthModifier` = 0.25 WHERE (`entry` = 19226); -- normal
UPDATE `creature_template` SET `HealthModifier` = 0.31 WHERE (`entry` = 20664); -- heroic