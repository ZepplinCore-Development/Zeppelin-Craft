-- F-151 Modern Character Creator: character choices the stock character fields have no room for.
-- customization 1 = eye colour, 2 = marking (the CharSections base_section 5 / 6 variation index; marking 0 = none).
-- Read by the worldserver at login (sent in UNIT_FIELD_PADDING) and with the character list (SMSG_CHAR_ENUM trailer),
-- written at character create. The worldserver's character list query joins this table, so it must exist first.
CREATE TABLE IF NOT EXISTS `character_customizations` (
  `guid` INT UNSIGNED NOT NULL COMMENT 'characters.guid',
  `customization` TINYINT UNSIGNED NOT NULL COMMENT '1 eye colour, 2 marking',
  `choice` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='F-151 character customization choices';
