-- [F-164] Custom spellvisual for Volcanic Shield AOE proc
-- Visual 90001: Fire Nova area kit (2064), no cast_kit
-- Uses instant_area_kit, impact_area_kit, and caster_impact_kit for triggered spell compatibility
DELETE FROM `spellvisual` WHERE `id` = 90001;
INSERT INTO `spellvisual` (`id`, `instant_area_kit`, `impact_area_kit`, `caster_impact_kit`) VALUES (90001, 2064, 2064, 2064);

-- Visual 90002: Spirit Communion — ghost/spirit effect + heal glow
-- cast_kit 90001 = custom kit (Ghost_state + cast directed anim, blends with movement)
-- caster_impact_kit 232 = Heal_Low_Base (subtle heal glow on self)
DELETE FROM `spellvisual` WHERE `id` = 90002;
INSERT INTO `spellvisual` (`id`, `cast_kit`, `caster_impact_kit`) VALUES (90002, 90001, 232);
