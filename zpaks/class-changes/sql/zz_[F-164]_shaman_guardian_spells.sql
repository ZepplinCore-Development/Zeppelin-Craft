-- [F-164] Shaman Earthwarden spec - spell_bonus_data, spell_threat, spell_proc
-- Rockslam (900119): 25% AP coefficient on physical damage
-- Volcanic Shield triggered damage (900122): 30% SP coefficient
-- Tectonic Blast (900121): 20% AP coefficient on nature damage

-- ============================================================================
-- spell_bonus_data
-- ============================================================================
DELETE FROM `spell_bonus_data` WHERE `entry` IN (900116, 900117, 900118, 900119, 900122, 900121, 900166);

INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(900119, 0, 0, 0.25, 0, 'Rockslam - 25% AP as bonus physical damage'),
(900122, 0.20, 0, 0, 0, 'Volcanic Shield (triggered) - 20% SP as AOE fire damage on block'),
(900121, 0, 0, 0.20, 0, 'Tectonic Blast - 20% AP as bonus nature damage'),
(900166, 0, 0, 0.10, 0, 'Totemic Impact (triggered) - 10% AP as AOE nature + 3.0x threat on totem summon');

-- ============================================================================
-- spell_threat - Tectonic Blast high threat multiplier
-- ============================================================================
DELETE FROM `spell_threat` WHERE `entry` IN (900121, 900166);

INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES
(900121, 0, 1.5, 0),
(900166, 0, 3.0, 0);

-- ============================================================================
-- spell_proc - Block-only proc filtering (HitMask=64 = PROC_HIT_BLOCK)
-- Matches Felsteel Shield Spike (29455) pattern
-- ============================================================================
DELETE FROM `spell_proc` WHERE `SpellId` IN (900116, 900123, 900124, 900147, 900148, 900149, 900150, 900151, 900152, 900165, 900167, 900168, 900169);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900116, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0),
(900123, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900124, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900147, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0),
(900148, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0),
(900149, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 3500, 0),
-- Totemic Impact — proc only on earth totem summon spells
-- SpellFamilyName=11 (Shaman), Mask2=131072 (bit 17, custom earth totem flag)
(900165, 0, 11, 0, 0, 131072, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
-- Bastion of Earth buff — consume all stacks when Healing Wave is cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=64 (Healing Wave)
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD)
-- Same pattern as Maelstrom Weapon buff (53817)
(900150, 0, 11, 64, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900151, 0, 11, 64, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900152, 0, 11, 64, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
-- Living Guardian — proc on heal received
-- SpellTypeMask=2 (HEAL), SpellPhaseMask=2 (HIT = when heal lands)
(900167, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0),
(900168, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0),
(900169, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0);
