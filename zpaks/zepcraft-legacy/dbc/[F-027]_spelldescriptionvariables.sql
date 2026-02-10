-- F-027: Dynamic Potion Spell Descriptions - SpellDescriptionVariables
-- Defines variable ID 183 used by potion spell tooltips to show modifier-adjusted values.
--
-- Fix: Replace $s/$S tokens with $m/$M (only $m/$M supported in variable definitions)
--      Unroll nested mortar conditionals into chained variables (matching Blizzard pattern)
--
-- Variables:
--   $mortar1-$mortar  = Alchemy Mortar effectiveness bonus (checks auras 91200-91203)
--   $stone            = Alchemist Stone bonus (checks aura 17619)
--   $m                = Combined multiplier (mortar * stone)
--   $potion1/max      = Effect 1 value/max adjusted by modifiers
--   $potion2/max      = Effect 2 value/max adjusted by modifiers

DELETE FROM `spelldescriptionvariables` WHERE `id` = 183;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (183, '$mortar1=$?a91200[${1+0.01*($91200m2+1)}][${1}]
$mortar2=$?a91201[${1+0.01*($91201m2+1)}][$<mortar1>]
$mortar3=$?a91202[${1+0.01*($91202m2+1)}][$<mortar2>]
$mortar=$?a91203[${1+0.01*($91203m2+1)}][$<mortar3>]
$stone=$?a17619[${1+0.01*($17619m1+1)}][${1}]
$m=${$<mortar>*$<stone>}
$potion1=${$m1*$<m>}
$potion1max=${$M1*$<m>}
$potion2=${$m2*$<m>}
$potion2max=${$M2*$<m>}');
