-- Vaelastrasz the Corrupt Scale reduced (was 1.0), modern models make this boy way to big.
UPDATE `creature_template` SET `scale` = 0.5 WHERE (`entry` = 13020);

-- Burning Adrenaline is made of a spell parts.
-- The Aura spell triggers the health reduction spell periodically.
-- The Explosion and Instakill are called by the boss script.
-- The explosion has been edited to remove all damage effects in the DBC
-- The instakill does not exist in the DBC files, only as a server spell.
-- This has been modified to no have no effect

DELETE FROM `spell_dbc` WHERE (`ID` = 23644);
INSERT INTO `spell_dbc` SET
    `ID` = 23644,
    `Attributes` = 536871168,
    `AttributesEx` = 268435456,
    `Name_Lang_enUS` = 'Burning Adrenaline',
    `EffectChainAmplitude_1` = 1,
    `EffectChainAmplitude_2` = 1,
    `EffectChainAmplitude_3` = 1,
    `SchoolMask` = 4;
