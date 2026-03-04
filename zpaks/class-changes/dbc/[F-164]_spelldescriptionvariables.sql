-- [F-164] Shaman Earthwarden - SpellDescriptionVariables
-- Defines description variables for Volcanic Shield and Tectonic Blast
-- so tooltips show actual damage including SP/AP scaling.

-- ============================================================================
-- Variable ID 187: Volcanic Shield (spell 900116)
-- Triggered spell 900122 deals base Nature damage + 30% SP coefficient.
-- $spbonus = spell power contribution (30% of $SP)
-- $total   = base damage + SP bonus (shown in tooltip)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 187;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (187, '$spbonus=${$SP*0.3}
$total=${$900122m1+$<spbonus>}');

-- ============================================================================
-- Variable ID 188: Tectonic Blast (spell 900121)
-- Effect 1 deals base Nature damage + 4/level + 20% AP coefficient.
-- $apbonus = attack power contribution (20% of AP)
-- $total   = base damage + AP bonus (shown in tooltip)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 188;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (188, '$apbonus=${$AP*0.2}
$total=${$m1+$<apbonus>}');

-- ============================================================================
-- Variable ID 189: Rockslam (spell 900119)
-- Effect 1 deals base Physical damage + 8/level + 25% AP coefficient.
-- $apbonus = attack power contribution (25% of AP)
-- $dmg = total damage including AP bonus (shown in tooltip)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 189;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (189, '$apbonus=${$AP*0.25}
$dmg=${$m1+$<apbonus>}');

-- ============================================================================
-- Variables 190-193: Rockbiter Weapon (spells 8017, 8018, 8019, 10399)
-- Each references the corresponding passive aura spell (900138-900141) for
-- base AP, and checks Improved Rockbiter Weapon (900129/900130) for bonus AP
-- and threat generation.
-- $imp1/$imp2 = AP bonus from talent rank 1/2 (only one active at a time)
-- $total      = base AP + talent bonus
-- $thr1/$thr2 = threat % from talent rank 1/2
-- $threat     = total threat % (shown conditionally in desc)
-- ============================================================================

-- Rockbiter Weapon R1 (spell 8017) - references aura 900138
DELETE FROM `spelldescriptionvariables` WHERE `id` = 190;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (190, '$imp1=$?s900129[${$900138m1*$900129m1/100}][${0}]
$imp2=$?s900130[${$900138m1*$900130m1/100}][${0}]
$total=${$900138m1+$<imp1>+$<imp2>}
$thr1=$?s900129[${$900129m2}][${0}]
$thr2=$?s900130[${$900130m2}][${0}]
$threat=${$<thr1>+$<thr2>}');

-- Rockbiter Weapon R2 (spell 8018) - references aura 900139
DELETE FROM `spelldescriptionvariables` WHERE `id` = 191;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (191, '$imp1=$?s900129[${$900139m1*$900129m1/100}][${0}]
$imp2=$?s900130[${$900139m1*$900130m1/100}][${0}]
$total=${$900139m1+$<imp1>+$<imp2>}
$thr1=$?s900129[${$900129m2}][${0}]
$thr2=$?s900130[${$900130m2}][${0}]
$threat=${$<thr1>+$<thr2>}');

-- Rockbiter Weapon R3 (spell 8019) - references aura 900140
DELETE FROM `spelldescriptionvariables` WHERE `id` = 192;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (192, '$imp1=$?s900129[${$900140m1*$900129m1/100}][${0}]
$imp2=$?s900130[${$900140m1*$900130m1/100}][${0}]
$total=${$900140m1+$<imp1>+$<imp2>}
$thr1=$?s900129[${$900129m2}][${0}]
$thr2=$?s900130[${$900130m2}][${0}]
$threat=${$<thr1>+$<thr2>}');

-- Rockbiter Weapon R4 (spell 10399) - references aura 900141
DELETE FROM `spelldescriptionvariables` WHERE `id` = 193;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (193, '$imp1=$?s900129[${$900141m1*$900129m1/100}][${0}]
$imp2=$?s900130[${$900141m1*$900130m1/100}][${0}]
$total=${$900141m1+$<imp1>+$<imp2>}
$thr1=$?s900129[${$900129m2}][${0}]
$thr2=$?s900130[${$900130m2}][${0}]
$threat=${$<thr1>+$<thr2>}');
