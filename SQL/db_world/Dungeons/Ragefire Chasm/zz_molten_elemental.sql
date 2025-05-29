-- Remove Fire immunity aura (7942) from Molten Elemental
UPDATE `creature_template_addon` SET `auras` = '' WHERE (`entry` = 11321);

-- Remove Nature immune mask from Molten Elemental
UPDATE `creature_template` SET `spell_school_immune_mask` = 0 WHERE (`entry` = 11321);