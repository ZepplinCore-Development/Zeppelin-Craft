-- Add Technique: Scroll of Mind Control to Noth loot table
    DELETE FROM `creature_loot_template` WHERE (`Entry` = 351008 AND `Item` = 57401);
    INSERT INTO `creature_loot_template` SET
        `Entry` = 351008,
        `Item` = 57401,
        `Chance` = 100,
        `GroupId` = 0,
        `Comment` = 'Noth - Technique: Scroll of Mind Control';