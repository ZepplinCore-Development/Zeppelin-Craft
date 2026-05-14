-- [BASE,F-049] hd-creatures-mounts: spellvisualkitmodelattach
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-049]_spellvisualkitmodelattach.sql with overrides

-- spellvisualkitmodelattach: 3 inserts, 1 updates, 0 deletes
DELETE FROM `spellvisualkitmodelattach` WHERE `id` = 5001;
INSERT INTO `spellvisualkitmodelattach` (`id`, `parent_spell_vis_kit_id`, `spell_vis_effect_name_id`, `attachment_id`, `offset_x`, `offset_y`, `offset_z`, `yaw`, `pitch`, `roll`) VALUES (5001, 20015, 8016, 18, '-0.3700000047683716', '0E-16', '-0.6399999856948853', '0E-16', '-0.2500000000000000', '0E-16');
DELETE FROM `spellvisualkitmodelattach` WHERE `id` = 5002;
INSERT INTO `spellvisualkitmodelattach` (`id`, `parent_spell_vis_kit_id`, `spell_vis_effect_name_id`, `attachment_id`, `offset_x`, `offset_y`, `offset_z`, `yaw`, `pitch`, `roll`) VALUES (5002, 20019, 8021, 12, '-0.0049999998882413', '0E-16', '0.0500000007450581', '0E-16', '0E-16', '0E-16');
DELETE FROM `spellvisualkitmodelattach` WHERE `id` = 5003;
INSERT INTO `spellvisualkitmodelattach` (`id`, `parent_spell_vis_kit_id`, `spell_vis_effect_name_id`, `attachment_id`, `offset_x`, `offset_y`, `offset_z`, `yaw`, `pitch`, `roll`) VALUES (5003, 20020, 8022, 12, '-0.0049999998882413', '0E-16', '0.0500000007450581', '0E-16', '0E-16', '0E-16');
UPDATE `spellvisualkitmodelattach` SET `spell_vis_effect_name_id` = 4884, `attachment_id` = 17, `pitch` = '1.5700000524520874' WHERE `id` = 1061;