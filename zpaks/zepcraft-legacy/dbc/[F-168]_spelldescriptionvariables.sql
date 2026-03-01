-- F-168: Dynamic Food & Drink Spell Descriptions - SpellDescriptionVariables (ID 186)
-- POC Round 3: Per-second rate display (no $o1 needed, no conditionals needed).
--
-- Follows the additive bonus pattern from F-027 (potion potency, ID 183).
-- Cooking kit buff spells (91271-91275) store:
--   Effect 2 (m2) = Food bonus percentage
--   Effect 3 (m3) = Drink bonus percentage
-- Currently identical values per tier, but tracked separately for correctness.
--
-- POC Results:
--   Round 1: $<food1>/$<drink1> work (per-tick modified values). $o1/$o2 FAIL in variables.
--   Round 3: Switch to per-second rate display. Values change dynamically with kit —
--            no conditional suffix needed (3750/sec without kit, 6563/sec with GM kit).
--
-- Variables:
--   $ck1-$ck5     = Food bonus % per kit tier (independent checks)
--   $ckfood       = Combined food % (only one kit active at a time)
--   $dk1-$dk5     = Drink bonus % per kit tier
--   $ckdrink      = Combined drink %
--   $fb1/$fb1x    = Food per-tick bonus (min/max) from kit
--   $food1/x      = Food per-second modified value (base + bonus) — amplitude 0 = 1sec ticks
--   $db2/$db2x    = Drink per-tick bonus (min/max) from kit
--   $drink1/x     = Drink per-tick modified value (m2 units, base + bonus)
--   $drinkps      = Drink per-second modified value ($<drink1>/5)

DELETE FROM `spelldescriptionvariables` WHERE `id` = 186;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (186, '$ck1=$?a91271[${$91271m2}][${0}]
$ck2=$?a91272[${$91272m2}][${0}]
$ck3=$?a91273[${$91273m2}][${0}]
$ck4=$?a91274[${$91274m2}][${0}]
$ck5=$?a91275[${$91275m2}][${0}]
$ckfood=${$<ck1>+$<ck2>+$<ck3>+$<ck4>+$<ck5>}
$dk1=$?a91271[${$91271m3}][${0}]
$dk2=$?a91272[${$91272m3}][${0}]
$dk3=$?a91273[${$91273m3}][${0}]
$dk4=$?a91274[${$91274m3}][${0}]
$dk5=$?a91275[${$91275m3}][${0}]
$ckdrink=${$<dk1>+$<dk2>+$<dk3>+$<dk4>+$<dk5>}
$fb1=${$m1*$<ckfood>/100}
$fb1x=${$M1*$<ckfood>/100}
$food1=${$m1+$<fb1>}
$food1x=${$M1+$<fb1x>}
$db2=${$m2*$<ckdrink>/100}
$db2x=${$M2*$<ckdrink>/100}
$drink1=${$m2+$<db2>}
$drink1x=${$M2+$<db2x>}
$drinkps=${$<drink1>/5}');
