-- Scroll of Mind Control Item Template
    DELETE FROM `item_template` WHERE (`entry` = 57400);
    INSERT INTO `item_template` SET
        `entry` = 57400,
        `subclass` = 4,
        `name` = 'Scroll of Mind Control',
        `description` = 'Only works on Deathknight Understudy',
        `displayid` = 140306,
        `Quality` = 2,
        `StatsCount` = 0,
        `spellid_1` = 91051,
        `spellcharges_1` = -1,
        `VerifiedBuild` = '0';

-- Technique: Scroll of Mind Control Item Template
    DELETE FROM `item_template` WHERE (`entry` = 57401);
    INSERT INTO `item_template`
    SET `entry` = 57401,
        `name` = 'Technique: Scroll of Mind Control', 
        `displayid` = 1103, 
        `Quality` = 2, 
        `bonding` = 1, 
        `BuyPrice` = 10000, 
        `SellPrice` = 2500, 
        `RequiredSkill` = 773, 
        `RequiredSkillRank` = 25, 
        `spellid_1` = 483, 
        `spellcharges_1` = -1, 
        `spellid_2` = 91139, 
        `spelltrigger_2` = 6;

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