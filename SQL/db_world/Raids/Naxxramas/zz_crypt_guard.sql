-- Reduced health to 30 (was 65) on Crypt Guards in Anub'rekhan fight
UPDATE `creature_template` SET `HealthModifier` = 30 WHERE (`entry` = 351082);