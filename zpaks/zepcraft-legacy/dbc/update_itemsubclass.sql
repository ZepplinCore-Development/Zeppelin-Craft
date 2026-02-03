DELETE FROM `dbc`.`itemsubclass` WHERE `class` = 5 AND `sub_class` = 1;
INSERT INTO `dbc`.`itemsubclass` SET 
    `class` = 5,
    `sub_class` = 1,
    `prerequisite_proficiency` = 4294967295,
    `postrequisite_proficiency` = 4294967295,
    `display_flags` = 1,
    `weapon_parry_seq` = 3,
    `weapon_ready_seq` = 2,
    `weapon_attack_seq` = 3,
    `display_name_1` = 'Tool',
    `display_name_flag` = 16712190,
    `verbose_name_flag` = 16712188;

