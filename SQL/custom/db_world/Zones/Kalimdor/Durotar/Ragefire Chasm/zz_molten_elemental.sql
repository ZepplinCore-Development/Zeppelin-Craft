-- Remove fire immunity aura (7942) from Molten Elemental
UPDATE `creature_template_addon` SET `auras` = '' WHERE (`entry` = 11321);