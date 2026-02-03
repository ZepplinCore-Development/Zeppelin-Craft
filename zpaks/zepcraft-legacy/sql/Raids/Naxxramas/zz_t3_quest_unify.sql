-- Update T3 quests to use only a single token type
    UPDATE `quest_template` SET `RequiredItemId1` = '22365' WHERE `RequiredItemId1` IN ('22372', '22358'); -- boots
    UPDATE `quest_template` SET `RequiredItemId1` = '22363' WHERE `RequiredItemId1` IN ('22370', '22356'); -- belts
    UPDATE `quest_template` SET `RequiredItemId1` = '22364' WHERE `RequiredItemId1` IN ('22371', '22357'); -- gloves
    UPDATE `quest_template` SET `RequiredItemId1` = '22360' WHERE `RequiredItemId1` IN ('22367', '22353'); -- helmet
    UPDATE `quest_template` SET `RequiredItemId1` = '22359' WHERE `RequiredItemId1` IN ('22366', '22352'); -- legs
    UPDATE `quest_template` SET `RequiredItemId1` = '22361' WHERE `RequiredItemId1` IN ('22368', '22354'); -- shoulders
    UPDATE `quest_template` SET `RequiredItemId1` = '22350' WHERE `RequiredItemId1` IN ('22351', '22349'); -- chest
    UPDATE `quest_template` SET `RequiredItemId1` = '22362' WHERE `RequiredItemId1` IN ('22369', '22355'); -- bracers

-- Tokens are no longer class specific
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22365);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22363);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22364);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22360);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22359);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22361);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22350);
    UPDATE `item_template` SET `AllowableClass` = 0 WHERE (`entry` = 22362);

-- Remove obsolete T3 token types from reference loot tables to support universal tokens

    -- Gluth
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304550) AND (`Item` IN (22354, 22355, 22356, 22358, 22368, 22369, 22370, 22372));

    -- Instructor Razuvious / Gothik the Harvester
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304780) AND (`Item` IN (22358, 22372));

    -- Noth the Plaguebringer / Heigan the Unclean
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304570) AND (`Item` IN (22356, 22370));

    -- Maexxna
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304590) AND (`Item` IN (22357, 22371));

    -- Thaddius
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304500) AND (`Item` IN (22353, 22367));

    -- Loatheb
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304740) AND (`Item` IN (22352, 22366));

    -- Grobbulus / Patchwerk
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304530) AND (`Item` IN (22354, 22368));

    -- Four Horsemen Chest
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 314800) AND (`Item` IN (22349, 22351));

    -- Grand Widow Faerlina / Anub'Rekhan
    DELETE FROM `reference_loot_template` WHERE (`Entry` = 304620) AND (`Item` IN (22355, 22369));
