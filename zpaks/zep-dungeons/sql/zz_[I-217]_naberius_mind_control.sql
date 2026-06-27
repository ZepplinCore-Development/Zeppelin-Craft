-- [I-217] Naberius mind control breaks solo play
--
-- Naberius (creature 20483, SmartAI) casts 'Chains of Naberius' (spell 36146 ->
-- triggers 36145), which applies aura 177 SPELL_AURA_AOE_CHARM (a 10s mind
-- control). The smart_script cast this on target_type 2 (VICTIM) -- i.e. the
-- tank. Solo, the player IS the victim, so the charm lands on the only attacker;
-- Naberius then has no one on threat, evades and resets to full every cycle,
-- making the fight unwinnable solo.
--
-- The script comment already reads "(threatlist > 1)" -- the intended target was
-- a NON-TANK player, which only exists with 2+ on the threat list. Re-point the
-- cast to target_type 6 (HOSTILE_RANDOM_NOT_TOP):
--   * Solo  -> no non-top target exists, so the charm is never cast.
--   * Group -> charms a random non-tank, matching the intended mechanic.
--
-- Stock row (not defined here): single consolidated UPDATE.

UPDATE `smart_scripts`
SET `target_type` = 6,
    `comment` = 'Naberius - In Combat - Cast ''Chains of Naberius'' (random non-tank; [I-217] solo-safe)'
WHERE `entryorguid` = 20483
  AND `source_type` = 0
  AND `id` = 0
  AND `action_type` = 11
  AND `action_param1` = 36146;
