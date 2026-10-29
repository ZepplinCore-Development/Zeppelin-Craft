-- [I-425] Crazed Ancient (3834) will not chase.
-- mod-individual-progression zone_ashenvale.sql / zone_azshara.sql rewrite these SAI rows with
-- castFlags 96 = AURA_NOT_PRESENT (0x20) | COMBAT_MOVE (0x40). A successful COMBAT_MOVE cast calls
-- SetCombatMovement(false); only a later run of the SAME action that finds the target out of range
-- turns chasing back on. These rows are RANGE events (9) capped at 5/10 yd, so once the player
-- steps out they never fire again: the creature stands still until it evades.
-- Drop the 0x40 bit, keep AURA_NOT_PRESENT (Withered Ancient 3919 runs the same curse with 32).
UPDATE `smart_scripts` SET `action_param2` = 32 WHERE `source_type` = 0 AND `entryorguid` = 3834 AND `id` = 0;
-- Haldarr Trickster, Curse of Mending at 0-10 yd: same trap.
UPDATE `smart_scripts` SET `action_param2` = 32 WHERE `source_type` = 0 AND `entryorguid` = 6126 AND `id` = 0;
