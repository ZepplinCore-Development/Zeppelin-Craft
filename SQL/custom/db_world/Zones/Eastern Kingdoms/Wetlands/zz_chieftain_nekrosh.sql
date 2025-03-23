-- Reduce Chieftain Nek'rosh Health (was 3.0) and damage (was 2.4) far too powerful for an elite.
UPDATE `creature_template` SET `DamageModifier` = 1.4, `HealthModifier` = 1.8 WHERE (`entry` = 2091);