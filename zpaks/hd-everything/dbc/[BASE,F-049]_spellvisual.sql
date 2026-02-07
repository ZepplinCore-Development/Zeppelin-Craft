-- [BASE,F-049] hd-everything: spellvisual
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_spellvisual.sql with overrides

-- spellvisual: 1 inserts, 0 updates, 0 deletes
DELETE FROM `spellvisual` WHERE `id` = 17000;
INSERT INTO `spellvisual` (`id`, `precast_kit`, `cast_kit`, `impact_kit`, `state_kit`, `state_done_kit`, `channel_kit`, `has_missile`, `missile_model`, `missile_path_type`, `missile_dest_attachment`, `missile_sound`, `anim_event_sound_id`, `flags`, `caster_impact_kit`, `target_impact_kid`, `missile_attachment`, `missile_follow_ground_height`, `missile_follow_drop_speed`, `missile_follow_approach`, `missile_follow_ground_flags`, `missile_motion`, `missile_targeting_kit`, `instant_area_kit`, `impact_area_kit`, `persistent_area_kit`, `missile_cast_offset_x`, `missile_cast_offset_y`, `missile_cast_offset_z`, `missile_impact_offset_x`, `missile_impact_offset_y`, `missile_impact_offset_z`) VALUES (17000, 60, 61, 0, 235, 0, 716, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4294967295, 0, 0, 0, 0, 0, 0, 16000, 0, 0, '0E-16', '0E-16', '0E-16', '0E-16', '0E-16', '0E-16');