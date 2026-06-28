-- [F-192] Block Mitigation Rework — crit-block-chance re-tune (stock rows).
--
-- Under percent-block (F-192, Block.PercentMode=1) a critical block is worth 75% DR,
-- so talented crit-block CHANCE is capped at ~30% (was 60%).
--
-- Stock Warrior Critical Block (47294/47295/47296): effect 1 = aura 253
-- (MOD_CRITICAL_BLOCK_CHANCE), die_sides 1, base 19/39/59 (+20/40/60%) -> 9/19/29 (+10/20/30%).
-- Effect 2 (aura 107, Shield Slam crit bonus) is left unchanged.
-- One consolidated UPDATE per stock id (changed column only), per SQL conventions.
--
-- The Earthwarden equivalent (Bulwark 900187/900188/900202) is a row we OWN, so it is
-- re-tuned in its owner file [F-164]_spell.sql (DELETE+INSERT), not here.
--
-- ⚠ APPLY ONLY WHEN ENABLING Block.PercentMode. Until the percent-block mechanic is live,
--   these UPDATEs also nerf current flat-block critical block (x2 value). Deploy together
--   with the worldserver build that enables F-192.

UPDATE `spell` SET `effect_base_points_1` = 9  WHERE `id` = 47294;
UPDATE `spell` SET `effect_base_points_1` = 19 WHERE `id` = 47295;
UPDATE `spell` SET `effect_base_points_1` = 29 WHERE `id` = 47296;
