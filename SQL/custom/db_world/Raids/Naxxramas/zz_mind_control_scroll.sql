-- Understudy Mind Control Item
DELETE FROM `item_template` WHERE (`entry` = 902224);
INSERT INTO `item_template` SET
    `entry` = 902224,
    `subclass` = 4,
    `name` = 'Scroll of Mind Control',
    `displayid` = 3331,
    `Quality` = 2,
    `StatsCount` = 0,
    `spellid_1` = 91051,
    `spellcharges_1` = -1,
    `VerifiedBuild` = '0';

-- Understudy heal
DELETE FROM `creature_template_spell` WHERE (`CreatureID` = 351084 AND `Spell` = 91052);
INSERT INTO `creature_template_spell` SET
    `CreatureID` = '351084',
    `Index` = '2',
    `Spell` = '91052',
    `VerifiedBuild` = '0';
