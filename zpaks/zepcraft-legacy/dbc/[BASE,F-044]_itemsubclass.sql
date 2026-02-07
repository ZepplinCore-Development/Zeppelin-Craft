-- [BASE,F-044] zepcraft-legacy: itemsubclass
-- Imported by zep dbc import-module - DO NOT EDIT
-- To customize, create [F-044]_itemsubclass.sql with overrides

-- itemsubclass: 1 inserts, 0 updates, 0 deletes
DELETE FROM `itemsubclass` WHERE `class` = 5 AND `subclass` = 1;
INSERT INTO `itemsubclass` (`class`, `subclass`, `prereq_proficiency`, `postreq_proficiency`, `flags`, `display_flags`, `wep_parry_seq`, `wep_ready_seq`, `wep_attack_seq`, `wep_swing_size`, `display_name_enus`, `display_name_flags`, `verbose_name_enus`, `verbose_name_flags`) VALUES (5, 1, -1, -1, 0, 1, 3, 2, 3, 0, 'Tool', 16712190, '', 16712188);