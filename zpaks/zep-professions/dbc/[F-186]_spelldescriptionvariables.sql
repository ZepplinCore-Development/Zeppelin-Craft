-- F-186: Improved Lifeblood (Herbalism) — show the ACTUAL heal amount in the tooltip.
--
-- The Core AuraScript spell_gen_lifeblood (Zeppelin-Core spell_generic.cpp) adds,
-- per tick, CalculatePct(maxHealth, 1.5 / GetTotalTicks()) on top of the DBC base
-- heal. Lifeblood is 5 sec / 1 sec ticks = 5 ticks, so that is +0.3% maxHealth
-- per tick = +1.5% maxHealth over the full duration. The stock tokens ($o1 total,
-- $s1 per tick) only show the DBC base and hide the max-health portion.
--
-- Variable 200 reconstructs the real number with the $HEALTH operand (F-183 exe
-- extension = the player's max health):
--   $heal     = total over 5 sec = base*5 + 1.5% maxHealth
--   $healtick = per-tick amount  = base   + 0.3% maxHealth
-- $m1 resolves the per-tick base per rank (die_sides 1 => base_points+1), so one
-- definition serves all six ranks (55428, 55480, 55500-55503).
--
-- Percentages as N/1000 (1.5% = 15/1000, 0.3% = 3/1000) with the multiply BEFORE
-- the divide, so the numerator stays large — avoids the client's
-- integer-divide-to-zero on small operands (see I-050).
--
-- NOTE: the two named definitions are joined with CONCAT(...,'\n',...) on a single
-- statement line (NOT a literal embedded newline). A literal newline inside the
-- VALUES string can be split mid-statement by newline-based apply paths, so the row
-- never inserts — which is exactly why var 200 was missing and the tooltip rendered
-- the literal "$<heal>".
DELETE FROM `spelldescriptionvariables` WHERE `id` = 200;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (200, CONCAT(
    '$heal=${($m1*5)+($HEALTH*15/1000)}', '\n',
    '$healtick=${$m1+($HEALTH*3/1000)}'));
