-- F-005: Riding Overhaul - SpellDescriptionVariables
-- Defines variable ID 182 used by mount spell tooltips to show crop-boosted speed.
--
-- Crop tiers are mutually exclusive (anti-stack), so we check each
-- independently and add — only one will ever be non-zero.
-- Avoids variable cascade through FALSE branches which doesn't resolve.
--
-- LEVEL-CAP NOTE: the client tooltip engine scales $mN per-level WITHOUT the
-- spell's max_level clamp, so level-scaled speed (base_level 20, max_level 60,
-- +2%/level) over-reports above level 60. Scaled sub-vars use the $lvc operand
-- (player level clamped to 60, F-183) to cap the level term: $groundspeed/
-- $groundspeed2 (all standard ground mounts + Goblin/Worgen racials + turtle
-- land + vanilla tooltips), $swimspeed (turtle 30174), $speed2 (vanilla
-- 580/25953/26656), $travelspeed/$travelspeed2 (Travel Form 783 via 5419).
-- Tooltip sub-vars hardcode the base (20) since the client $mN can't be capped;
-- desc sub-vars keep $mN (base only in desc context) and use $lvc for the level
-- term. The four genuinely fixed-speed mounts (Video Mount 33631, Borrowed Broom
-- 61289, Argent ponies 68768/68769) use $groundspeedfixed/$groundspeedfixed2
-- (= $m2, no scaling) so their flat speed shows correctly at every level; they
-- are repointed onto those vars in [F-005]_spell.sql section 6.
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
$c6=$?a100015[${$100015m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>+$<c6>}
$groundspeed=${20+($lvc-20)*2+$<crop>}
$groundspeed2=${$m2+($lvc-20)*2+$<crop>}
$groundspeedfixed=${$m2+$<crop>}
$groundspeedfixed2=${$m2+$<crop>}
$flyingspeed=${$m2+$<crop>}
$flyingspeed2=${$m2+$<crop>}
$swimspeed=${20+($lvc-20)*2+$<crop>}
$swimspeed2=${$m3+($lvc-20)*2+$<crop>}
$speed=${$m2+$<crop>}
$speed2=${$m2+($lvc-20)*2+$<crop>}
$travelspeed=${20+($lvc-20)*2+$<crop>}
$travelspeed2=${20+($lvc-20)*2+$<crop>}
$flightspeed=${$33948m2+$<crop>}
$swiftflightspeed=${$40121m2+$<crop>}');

-- ============================================================================
-- Variable ID 185: Ghost Wolf (spell 2645) tooltip
-- Speed = base 20% + per-level scaling (+2%/level, base_level 20, max_level 60).
-- The aura is server-capped at 100% (level clamped to max_level 60 in CalcValue),
-- but the CLIENT tooltip engine evaluates $m2's per-level scaling WITHOUT the
-- max_level clamp, so above level 60 it over-reported (e.g. 116% base at L68).
-- Fix: hardcode the base (20) and use the $lvc operand (player level clamped to
-- 60, F-183 exe extension) for the level term, so the tooltip matches the
-- server-applied value at all levels: 20 + ($lvc-20)*2, capped at 100%.
-- Includes crop bonus and Ghost Wolf Speed set bonuses (22801, 47017).
--
-- Variables:
--   $c1-$c5      = Riding crop speed bonus per tier (same as 182)
--   $crop        = Combined crop bonus (only one non-zero due to anti-stack)
--   $gw1         = Ghost Wolf Speed PvP set bonus (22801, +15%)
--   $gw2         = Ghost Wolf Speed buff (47017, +11%)
--   $igw1/$igw2  = Improved Ghost Wolf talent speed bonus (16262 +5% / 16287 +10%, F-164)
--                  Checked with $?s (KNOWS spell), NOT $?a (has aura): IGW is a
--                  PASSIVE talent (attr 0x40), so its aura is never sent to the
--                  client and $?a would always be false. The crop/$gw set bonuses
--                  are non-passive equip auras, so they correctly use $?a.
--                  AC unlearns the lower rank on training the next, so only one
--                  rank is ever known — the independent add can't double-count.
--   $igw         = Combined IGW bonus (only one rank active at a time)
--   $wolfspeed   = Ghost Wolf speed for tooltip (capped base + crop + set bonuses + IGW)
--   $wolfspeed2  = Ghost Wolf speed for description (capped base + crop + set bonuses + IGW)
--   $lvc         = player level clamped to 60 (F-183 exe operand id 0xF2); caps
--                  the +2%/level term at level 60 to mirror the server's aura cap
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 185;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (185, '$c1=$?a100010[${$100010m1}][${0}]
$c2=$?a100011[${$100011m1}][${0}]
$c3=$?a100012[${$100012m1}][${0}]
$c4=$?a100013[${$100013m1}][${0}]
$c5=$?a100014[${$100014m1}][${0}]
$c6=$?a100015[${$100015m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>+$<c6>}
$gw1=$?a22801[${$22801m1}][${0}]
$gw2=$?a47017[${$47017m1}][${0}]
$igw1=$?s16262[${$16262m2}][${0}]
$igw2=$?s16287[${$16287m2}][${0}]
$igw=${$<igw1>+$<igw2>}
$wolfspeed=${20+($lvc-20)*2+$<crop>+$<gw1>+$<gw2>+$<igw>}
$wolfspeed2=${20+($lvc-20)*2+$<crop>+$<gw1>+$<gw2>+$<igw>}');

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
$c6=$?a100015[${$100015m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>+$<c6>}
$glyph=$?a57856[${$57856m1}][${0}]
$swimspeed=${20+($lvc-20)*2+$<crop>+$<glyph>}
$swimspeed2=${$m2+($lvc-20)*2+$<crop>+$<glyph>}');

-- ============================================================================
-- Variable ID 199: Aquatic Form cast spell (1066) tooltip
-- Spell 1066 is a shapeshift cast — its own effects have no speed data.
-- Uses cross-spell reference $5421m2 for tooltip (resolves with per-level
-- scaling from the active buff) and hardcoded base 20 for description
-- (avoids cross-spell double-counting, matches mount $groundspeed2 pattern).
-- Includes crop bonus and Glyph of Aquatic Form conditional.
--
-- Variables:
--   $c1-$c6     = Riding crop speed bonus per tier (same as 182/184)
--   $crop       = Combined crop bonus (only one non-zero due to anti-stack)
--   $glyph      = Glyph of Aquatic Form bonus (50% when active, 0 otherwise)
--   $swimspeed  = Swim speed for tooltip (5421 buff value + crop + glyph)
--   $swimspeed2 = Swim speed for description (base 20 + level scaling + crop + glyph)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 199;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (199, '$c1=$?a100010[${$100010m1}][${0}]
$c2=$?a100011[${$100011m1}][${0}]
$c3=$?a100012[${$100012m1}][${0}]
$c4=$?a100013[${$100013m1}][${0}]
$c5=$?a100014[${$100014m1}][${0}]
$c6=$?a100015[${$100015m1}][${0}]
$crop=${$<c1>+$<c2>+$<c3>+$<c4>+$<c5>+$<c6>}
$glyph=$?a57856[${$57856m1}][${0}]
$swimspeed=${20+($lvc-20)*2+$<crop>+$<glyph>}
$swimspeed2=${20+($lvc-20)*2+$<crop>+$<glyph>}');
