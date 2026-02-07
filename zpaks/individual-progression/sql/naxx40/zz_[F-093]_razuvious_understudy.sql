-- Understudy heal
    DELETE FROM `creature_template_spell` WHERE (`CreatureID` = 351084 AND `Spell` = 91052);
    INSERT INTO `creature_template_spell` SET
        `CreatureID` = '351084',
        `Index` = '2',
        `Spell` = '91052',
        `VerifiedBuild` = '0';
