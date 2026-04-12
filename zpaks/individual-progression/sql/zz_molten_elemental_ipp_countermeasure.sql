-- Remove Fire immunity aura (7942) from Molten Elemental
UPDATE `creature_template_addon` SET `auras` = '' WHERE (`entry` = 11321);

-- Remove Nature school immunity from Molten Elemental (keep mechanic immunities)
UPDATE `creature_template` SET `CreatureImmunitiesId` = -303 WHERE (`entry` = 11321);