-- [F-164] Shaman Earthwarden - SpellDescriptionVariables
-- Defines description variables for Volcanic Shield and Tectonic Blast
-- so tooltips show actual damage including SP/AP scaling.

-- ============================================================================
-- Variable ID 187: Volcanic Shield (spell 900116)
-- Triggered spell 900122 deals AOE Fire damage + 20% SP coefficient.
-- $spbonus = spell power contribution (20% of $sp)
-- $total   = base damage + SP bonus (shown in tooltip)
-- ============================================================================
DELETE FROM `spelldescriptionvariables` WHERE `id` = 187;
INSERT INTO `spelldescriptionvariables` (`id`, `var`) VALUES (187, '$spbonus=${$sp*0.2}
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

-- Variables 190-193 removed: Rockbiter Weapon descriptions now inline $XXXXm1
-- references directly (client auto-applies Imp Rockbiter SpellMod to those).
DELETE FROM `spelldescriptionvariables` WHERE `id` IN (190, 191, 192, 193);
