-- [I-217] Naberius mind control breaks solo play
--
-- Naberius (creature 20483, SmartAI) cast 'Chains of Naberius' spell 36146,
-- whose only effect is TRIGGER_SPELL 36145. 36145 applies aura 177
-- SPELL_AURA_AOE_CHARM (a 10s mind control).
--
-- The catch: 36146 uses AoE implicit targeting (target_a 22 dest=caster +
-- target_b 15 SRC_AREA_ENEMY, radius_index 23), so it triggers the charm on
-- EVERY enemy in range around Naberius regardless of the SmartAI-selected
-- target. Solo, that is the only attacker; Naberius then has no one on threat,
-- evades and resets to full every cycle, making the fight unwinnable solo.
-- (Changing only the SmartAI target_type does NOT help -- the spell's own AoE
-- still catches everyone.)
--
-- Fix: cast the SINGLE-TARGET charm 36145 directly (its implicit target_a is 6
-- = one enemy) at target_type 6 (HOSTILE_RANDOM_NOT_TOP), instead of the AoE
-- wrapper 36146:
--   * Solo  -> no non-top target exists -> the cast is skipped -> no charm.
--   * Group -> charms exactly one random non-tank (the intended "threatlist > 1"
--              mechanic; the old AoE charmed the whole group, tank included).
--
-- Stock row (not defined here): single consolidated UPDATE.

UPDATE `smart_scripts`
SET `action_param1` = 36145,
    `target_type` = 6,
    `comment` = 'Naberius - In Combat - Cast ''Chains of Naberius'' (single non-tank; [I-217] solo-safe)'
WHERE `entryorguid` = 20483
  AND `source_type` = 0
  AND `id` = 0
  AND `action_type` = 11
  AND `action_param1` IN (36146, 36145);
