-- Reduce Dual Talent Specialization cost to 1 gold (from 1000g)
UPDATE `gossip_menu_option` SET `BoxMoney` = 10000 WHERE `OptionType` = 18;
