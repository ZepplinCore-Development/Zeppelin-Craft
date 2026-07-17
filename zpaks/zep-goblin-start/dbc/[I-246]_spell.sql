-- I-246 "Necessary Roughness" (24502) — Ride Bilgewater Buccaneer (70016) fixes.
--
-- 70016 is the Buccaneer 37179 spellclick: eff1 aura 236 CONTROL_VEHICLE (ride),
-- eff2 aura 23 PERIODIC_TRIGGER (shark waves), eff3 90 KILL_CREDIT ("Bilgewater
-- Buccaneer chosen" objective).
--
--   * eff2: the Cata DBC ships aura 23 period 1000 with trigger 0 / target caster —
--     retail resolves the trigger hotfix-side. Restored as the shark-wave driver:
--     trigger 69971 ("Summon Steamwheedle Shark 000", summons 37114 at the ported
--     lane marker 75042 via TARGET_DEST_NEARBY_ENTRY + its type-13 condition),
--     period 5000 (1s retail flood-gated server-side; 5s ≈ observed retail pace),
--     retargeted 1 -> 25 so the periodic rides the VEHICLE, not the player:
--       - vehicle SmartAI is dead while possessed (I-242), but auras tick fine;
--       - one application with the control aura -> exiting the shredder removes
--         the whole 70016 application and the waves stop with the ride.
--   * eff3 misc: the 4.3.4 client credits bunny 48271 (4.3 revamp), but the
--     Neltharion quest row predates the revamp and requires the Buccaneer entry
--     itself (RequiredNpcOrGo1 = 37179) -> repoint so boarding completes obj 1.
--
-- Stock-row rule: the 70016 INSERT is owned by dbc/[AUTO,F-011]_spell.sql —
-- one consolidated UPDATE per id here.
UPDATE spell SET
  effect_amplitude_2 = 5000,
  effect_trigger_spell_2 = 69971,
  effect_implicit_target_a_2 = 25,
  effect_misc_value_a_3 = 37179
WHERE id = 70016;
