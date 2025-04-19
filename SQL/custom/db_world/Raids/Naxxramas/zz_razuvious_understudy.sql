-- Understudy Mind Control Item
    DELETE FROM `item_template` WHERE (`entry` = 58309);
    INSERT INTO `item_template` SET
        `entry` = 58309,
        `subclass` = 4,
        `name` = 'Scroll of Mind Control',
        `displayid` = 3331,
        `Quality` = 2,
        `StatsCount` = 0,
        `spellid_1` = 91051,
        `spellcharges_1` = -1,
        `VerifiedBuild` = '0';

-- Limit Mind Control Spell to only work on the Understudy...
    DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17;
    INSERT INTO `conditions` SET
        `SourceTypeOrReferenceId` = 17,
        `SourceEntry` = 91051,
        `ConditionTypeOrReference` = 31,
        `ConditionTarget` = 1,
        `ConditionValue1` = 3,
        `ConditionValue2` = 351084,
        `Comment` = 'Target Deathknight Understudy';

-- Understudy heal
    DELETE FROM `creature_template_spell` WHERE (`CreatureID` = 351084 AND `Spell` = 91052);
    INSERT INTO `creature_template_spell` SET
        `CreatureID` = '351084',
        `Index` = '2',
        `Spell` = '91052',
        `VerifiedBuild` = '0';
