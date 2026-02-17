-- F-005: Riding Overhaul - SpellDescriptionVariables
-- Defines variable ID 182 used by mount spell tooltips to show crop-boosted speed.
--
-- Crop tiers are mutually exclusive (anti-stack), so we check each
-- independently and add — only one will ever be non-zero.
-- Avoids variable cascade through FALSE branches which doesn't resolve.
--
-- Variables:
--   $c1-$c5         = Riding crop speed bonus per tier (independent checks)
--   $crop           = Combined crop bonus (only one non-zero due to anti-stack)
--   $groundspeed    = Ground speed for tooltip (base + crop)
--   $groundspeed2   = Ground speed for description (base + level scaling + crop)
--   $flyingspeed    = Flight speed for tooltip (base + crop)
--   $flyingspeed2   = Flight speed for description (base + crop)
--   $swimspeed      = Swim speed for tooltip (base + crop)
--   $swimspeed2     = Swim speed for description (base + level scaling + crop)
--   $speed/$speed2  = Generic speed (used by Vanilla mount descriptions)
--   $travelspeed    = Travel Form speed for tooltip (5419 base + crop)
--   $travelspeed2   = Travel Form speed for description (5419 base + level scaling + crop)
--   $flightspeed    = Flight Form speed (33948 base + crop, no level scaling)
--   $swiftflightspeed = Swift Flight Form speed (40121 base + crop, no level scaling)

DELETE FROM `spelldescriptionvariables` WHERE `id` = 182;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (182, '$c1=$?a100010[${$100010m1}][${0}]
$c2=$?a100011[${$100011m1}][${0}]
$c3=$?a100012[${$100012m1}][${0}]
$c4=$?a100013[${$100013m1}][${0}]
$c5=$?a100014[${$100014m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>}
$groundspeed=${$m2+$<crop>}
$groundspeed2=${$m2+($pl-20)*2+$<crop>}
$flyingspeed=${$m2+$<crop>}
$flyingspeed2=${$m2+$<crop>}
$swimspeed=${$m3+$<crop>}
$swimspeed2=${$m3+($pl-20)*2+$<crop>}
$speed=${$m2+$<crop>}
$speed2=${$m2+($pl-20)*2+$<crop>}
$travelspeed=${$5419m2+$<crop>}
$travelspeed2=${$5419m2+($pl-20)*2+$<crop>}
$flightspeed=${$33948m2+$<crop>}
$swiftflightspeed=${$40121m2+$<crop>}');

-- ============================================================================
-- Variable ID 185: Ghost Wolf (spell 2645) tooltip
-- Speed is in effect 2 ($m2 = base 20%, per-level scaling via formula).
-- Includes crop bonus and Ghost Wolf Speed set bonuses (22801, 47017).
--
-- Variables:
--   $c1-$c5      = Riding crop speed bonus per tier (same as 182)
--   $crop        = Combined crop bonus (only one non-zero due to anti-stack)
--   $gw1         = Ghost Wolf Speed PvP set bonus (22801, +15%)
--   $gw2         = Ghost Wolf Speed buff (47017, +11%)
--   $wolfspeed   = Ghost Wolf speed for tooltip (base + crop + set bonuses)
--   $wolfspeed2  = Ghost Wolf speed for description (base + level scaling + crop + set bonuses)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 185;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (185, '$c1=$?a100010[${$100010m1}][${0}]
$c2=$?a100011[${$100011m1}][${0}]
$c3=$?a100012[${$100012m1}][${0}]
$c4=$?a100013[${$100013m1}][${0}]
$c5=$?a100014[${$100014m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>}
$gw1=$?a22801[${$22801m1}][${0}]
$gw2=$?a47017[${$47017m1}][${0}]
$wolfspeed=${$m2+$<crop>+$<gw1>+$<gw2>}
$wolfspeed2=${$m2+($pl-20)*2+$<crop>+$<gw1>+$<gw2>}');

-- ============================================================================
-- Variable ID 184: Aquatic Form (spell 5421) tooltip
-- Swim speed is in effect 2 after the E1/E2 swap in [F-005]_spell.sql section 10.
-- Includes crop bonus (SPELLMOD_EFFECT2 via 100010-100014) and
-- Glyph of Aquatic Form bonus (57856, SPELLMOD_EFFECT2 flat +50).
--
-- Variables:
--   $c1-$c5     = Riding crop speed bonus per tier (same as 182)
--   $crop       = Combined crop bonus (only one non-zero due to anti-stack)
--   $glyph      = Glyph of Aquatic Form bonus (50% when active, 0 otherwise)
--   $swimspeed  = Swim speed for tooltip (base + crop + glyph)
--   $swimspeed2 = Swim speed for description (base + level scaling + crop + glyph)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 184;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (184, '$c1=$?a100010[${$100010m1}][${0}]
$c2=$?a100011[${$100011m1}][${0}]
$c3=$?a100012[${$100012m1}][${0}]
$c4=$?a100013[${$100013m1}][${0}]
$c5=$?a100014[${$100014m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>}
$glyph=$?a57856[${$57856m1}][${0}]
$swimspeed=${$m2+$<crop>+$<glyph>}
$swimspeed2=${$m2+($pl-20)*2+$<crop>+$<glyph>}');
