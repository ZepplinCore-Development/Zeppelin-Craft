-- [F-164D] Volcanic Shield custom spellvisual rows (split from F-164).
-- Visual 90001: eruption (900122) AOE proc — Fire Nova area kit (2064), no cast_kit.
--   instant_area_kit / impact_area_kit / caster_impact_kit for triggered-spell compatibility.
DELETE FROM `spellvisual` WHERE `id` = 90001;
INSERT INTO `spellvisual` (`id`, `instant_area_kit`, `impact_area_kit`, `caster_impact_kit`) VALUES (90001, 2064, 2064, 2064);

-- Visual 90003: Volcanic Shield (900116) persistent buff — orbiting red rocks.
-- state_kit 90010   = custom kit using the recolored Earth Shield state model
-- precast_kit 90011 / cast_kit 90012 = custom red-recolored Lightning hand flourish
-- impact_kit 90013  = custom partial-red LightningShield_Impact_Base (the "lines from the sky").
-- Mirrors stock Earth Shield SpellVisual 7362 (state_kit 6428) + custom red cast anim.
DELETE FROM `spellvisual` WHERE `id` = 90003;
INSERT INTO `spellvisual` (`id`, `precast_kit`, `cast_kit`, `impact_kit`, `state_kit`) VALUES (90003, 90011, 90012, 90013, 90010);
