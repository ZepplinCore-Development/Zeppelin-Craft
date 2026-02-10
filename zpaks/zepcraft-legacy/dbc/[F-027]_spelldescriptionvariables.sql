-- F-027: Dynamic Potion Spell Descriptions - SpellDescriptionVariables (ID 183)
-- Defines variable ID 183 used by potion spell tooltips to show modifier-adjusted values.
--
-- Uses additive bonus pattern (matching F-005 riding crops):
--   Store percentage bonuses, compute absolute bonus per-effect, ADD to base.
--   All multiplication uses only spell value refs + literals inside ${}.
--   Variable references ($<var>) only appear in addition expressions.
--
-- Mortar tiers are mutually exclusive (anti-stack group 1122), so we check
-- each independently and add — only one will ever be non-zero.
-- Avoids variable cascade through FALSE branches which doesn't resolve.
--
-- Variables:
--   $mp1-$mp4      = Mortar bonus % per tier (independent checks, no cascade)
--   $mpct          = Combined mortar % (only one non-zero due to anti-stack)
--   $spct          = Alchemist Stone bonus percentage (aura 17619)
--   $mb1/$sb1      = Mortar/Stone absolute bonus for effect 1
--   $mb1x/$sb1x    = Mortar/Stone absolute bonus for effect 1 max
--   $mb2/$sb2      = Mortar/Stone absolute bonus for effect 2
--   $mb2x/$sb2x    = Mortar/Stone absolute bonus for effect 2 max
--   $potion1/max   = Effect 1 adjusted value (base + bonuses)
--   $potion2/max   = Effect 2 adjusted value (base + bonuses)

DELETE FROM `spelldescriptionvariables` WHERE `id` = 183;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (183, '$mp1=$?a91200[${$91200m2}][${0}]
$mp2=$?a91201[${$91201m2}][${0}]
$mp3=$?a91202[${$91202m2}][${0}]
$mp4=$?a91203[${$91203m2}][${0}]
$mpct=${$<mp1>+$<mp2>+$<mp3>+$<mp4>}
$spct=$?a17619[${$17619m1}][${0}]
$mb1=${$m1*$<mpct>/100}
$sb1=${$m1*$<spct>/100}
$mb1x=${$M1*$<mpct>/100}
$sb1x=${$M1*$<spct>/100}
$mb2=${$m2*$<mpct>/100}
$sb2=${$m2*$<spct>/100}
$mb2x=${$M2*$<mpct>/100}
$sb2x=${$M2*$<spct>/100}
$potion1=${$m1+$<mb1>+$<sb1>}
$potion1max=${$M1+$<mb1x>+$<sb1x>}
$potion2=${$m2+$<mb2>+$<sb2>}
$potion2max=${$M2+$<mb2x>+$<sb2x>}');
