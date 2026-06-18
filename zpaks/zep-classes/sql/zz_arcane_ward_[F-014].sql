-- Arcane Ward items (mage Conjure Arcane Ward spell creates these)
-- Compliance migration (I-186, May 2026): renumbered 902100-902108 → 58400-58408 (Arcane Wards reservation row 58400-58499).
-- Idempotent cleanup of stale rows — NO-OP after first apply.
-- NOTE: the 9 mage spells (91058-91066) that create these items via SPELL_EFFECT_CREATE_ITEM
-- have their effect_item_type_1 fields updated separately in zep-legacy/dbc/[F-014]_spell.sql.
DELETE FROM `item_template` WHERE `entry` BETWEEN 902100 AND 902108;

-- Arcane Ward 1
    DELETE FROM `item_template` WHERE (`entry` = 58400);
    INSERT INTO `item_template`
    SET `entry` = 58400,
        `name` = 'Arcane Ward I',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 1,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;    

-- Arcane Ward 2
    DELETE FROM `item_template` WHERE (`entry` = 58401);
    INSERT INTO `item_template`
    SET `entry` = 58401,
        `name` = 'Arcane Ward II',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 10,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;    

-- Arcane Ward 3
    DELETE FROM `item_template` WHERE (`entry` = 58402);
    INSERT INTO `item_template`
    SET `entry` = 58402,
        `name` = 'Arcane Ward III',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 20,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1; 

-- Arcane Ward 4
    DELETE FROM `item_template` WHERE (`entry` = 58403);
    INSERT INTO `item_template`
    SET `entry` = 58403,
        `name` = 'Arcane Ward IV',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 30,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1; 

-- Arcane Ward 5
    DELETE FROM `item_template` WHERE (`entry` = 58404);
    INSERT INTO `item_template`
    SET `entry` = 58404,
        `name` = 'Arcane Ward V',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 40,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;

-- Arcane Ward 6
    DELETE FROM `item_template` WHERE (`entry` = 58405);
    INSERT INTO `item_template`
    SET `entry` = 58405,
        `name` = 'Arcane Ward VI',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 50,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;

-- Arcane Ward 7
    DELETE FROM `item_template` WHERE (`entry` = 58406);
    INSERT INTO `item_template`
    SET `entry` = 58406,
        `name` = 'Arcane Ward VII',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 60,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;

-- Arcane Ward 8
    DELETE FROM `item_template` WHERE (`entry` = 58407);
    INSERT INTO `item_template`
    SET `entry` = 58407,
        `name` = 'Arcane Ward VIII',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 70,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;

-- Arcane Ward 9
    DELETE FROM `item_template` WHERE (`entry` = 58408);
    INSERT INTO `item_template`
    SET `entry` = 58408,
        `name` = 'Arcane Ward IX',
        `displayid` = 54063,
        `Quality` = 5,
        `bonding` = 1,
        `ItemLevel` = 80,
        `InventoryType` = 23,
        `maxcount` = 1,
        `AllowableClass` = 128,
        `ItemLimitCategory` = 86,
        `spellid_1` = 91054,
        `spelltrigger_1` = 1;
