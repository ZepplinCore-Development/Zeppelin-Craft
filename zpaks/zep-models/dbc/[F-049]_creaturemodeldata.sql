-- F-049 boss model swaps: server-side CreatureModelData rows referenced by the
-- new CreatureDisplayInfo entries (36062 -> model 3702 Al'Akir, 38030 -> model
-- 3871 Unbound Fire Elemental Lord). AC's Unit::GetCollisionWidth/Height call
-- AssertEntry on the modelId (Unit.cpp:17114, 17152) and hard-crash when the
-- row is missing -- this fires the moment a creature using those displays
-- enters the grid. Values sourced from archive/DBC/Modern Client/latest/
-- CreatureModelData.dbc. DELETE also covers legacy 4302 (Deepholm Golem).

DELETE FROM `creaturemodeldata` WHERE `id` IN (3702, 3871, 4302);
INSERT INTO `creaturemodeldata` (`id`, `flags`, `model_path`, `size_class`, `model_scale`, `blood_id`, `footprint_texture_id`, `footprint_texture_length`, `footprint_texture_width`, `footprint_particle_scale`, `foley_material_id`, `footstep_shake_size`, `death_thud_shake_size`, `sound_data`, `collision_width`, `collision_height`, `mount_height`, `geo_box_min_x`, `geo_box_min_y`, `geo_box_min_z`, `geo_box_max_x`, `geo_box_max_y`, `geo_box_max_z`, `world_effect_scale`, `attached_effect_scale`, `missile_collision_radius`, `missile_collision_push`, `missile_collision_raise`) VALUES
(3702, 12299, 'Creature\\alakir\\alakir.mdx', 4, '1.0000000000000000', 3, 4, '18.0000000000000000', '12.0000000000000000', '1.0000000000000000', 0, 0, 0, 1508, '0.6111109852790833', '2.0312800407409670', '0.0000000000000000', '-22.2823009490966800', '-43.9379005432128900', '-5.8111701011657715', '28.4295997619628900', '44.2386016845703100', '61.2071990966796900', '0.5699999928474426', '1.0000000000000000', '0E-16', '0E-16', '0E-16'),
(3871, 4096, 'Creature\\boundfireelemental\\unboundfireelementallord.mdx', 0, '1.0000000000000000', 3, 4, '18.0000000000000000', '12.0000000000000000', '1.0000000000000000', 0, 0, 0, 4716, '0.6111109852790833', '2.0312800407409670', '0.0000000000000000', '-0.7349550127983093', '-1.6552400588989258', '0.3276950120925903', '1.4503099918365479', '1.8114299774169922', '4.3897500038146970', '1.0000000000000000', '1.0000000000000000', '0E-16', '0E-16', '0E-16');
