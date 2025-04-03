-- Reduce Anubisath Warrior health 12 -> 1, it was not scaling with Autobalance
UPDATE `creature_template` SET `HealthModifier` = 1 WHERE (`entry` = 15537);