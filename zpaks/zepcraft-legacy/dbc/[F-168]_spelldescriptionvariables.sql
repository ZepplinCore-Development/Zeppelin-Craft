-- F-168: Food and Drink Overhaul - SpellDescriptionVariables (ID 186)
--
-- Follows the additive bonus pattern from F-027 (potion potency, ID 183).
-- Cooking kit buff spells (91271-91275) store:
--   Effect 2 (m2) = Food bonus percentage
--   Effect 3 (m3) = Drink bonus percentage
-- Currently identical values per tier, but tracked separately for correctness.
--
-- Food/drink base_points are stored as "per 5 seconds" in the DBC.
-- The server regen system (Player::RegenerateHealth / Player::Regenerate)
-- already divides by 5000ms. The variable formulas also divide by 5 for
-- correct per-second display in tooltips.
--
-- Variables:
--   $ck1-$ck5     = Food bonus % per kit tier (independent checks)
--   $ckfood       = Combined food % (only one kit active at a time)
--   $dk1-$dk5     = Drink bonus % per kit tier
--   $ckdrink      = Combined drink %
--   $fb1/$fb1x    = Food per-5-sec bonus (min/max) from kit
--   $food1/x      = Food per-5-sec modified value (base + bonus)
--   $foodps       = Food per-second modified value ($<food1>/5)
--   $db2/$db2x    = Drink per-5-sec bonus (min/max) from kit
--   $drink1/x     = Drink per-5-sec modified value (base + bonus)
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
$foodps=${$<food1>/5}
$db2=${$m2*$<ckdrink>/100}
$db2x=${$M2*$<ckdrink>/100}
$drink1=${$m2+$<db2>}
$drink1x=${$M2+$<db2x>}
$drinkps=${$<drink1>/5}');
