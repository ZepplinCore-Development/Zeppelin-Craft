-- F-049 boss model swaps: add server-side CreatureDisplayInfo rows referenced
-- by zz_[F-049]_murmur.sql (36062 = Al'Akir) and zz_[F-049]_lord_incendius.sql
-- (38030 = Unbound Fire Elemental Lord, model 3871). Without these, AC's
-- LoadCreatureModelInfo segfaults on the null lookup at ObjectMgr.cpp:1766.
-- Values sourced from archive/DBC/Modern Client/latest/CreatureDisplayInfo.dbc.
-- DELETE also covers legacy 39094 (Deepholm Golem) from the earlier swap.

DELETE FROM `creaturedisplayinfo` WHERE `id` IN (36062, 38030, 39094);
INSERT INTO `creaturedisplayinfo` (`id`, `model_id`, `sound_id`, `extended_display_info_id`, `creature_model_scale`, `creature_model_alpha`, `texture_variation_1`, `texture_variation_2`, `texture_variation_3`, `portrait_texture_name`, `blood_level`, `blood_id`, `npc_sound_id`, `praticle_color_id`, `creature_geoset_data`, `obj_effect_package_id`) VALUES
(36062, 3702, 3221, 0, 2.0, 255, 'alakirskin', 'alakirarmor', '', '', 0, 0, 0, 0, 0, 0),
(38030, 3871, 0, 0, 3.0, 255, '', '', '', '', 0, 0, 0, 0, 0, 0);
