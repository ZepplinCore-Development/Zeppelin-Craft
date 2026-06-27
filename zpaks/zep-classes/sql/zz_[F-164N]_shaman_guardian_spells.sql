-- [F-164N] Bastion of Earth - world-side support (split from F-164 zz_[F-164]_shaman_guardian_spells.sql).
-- spell_proc: R1-R3 passive block-chance proc (900147-149) + held-buff Lesser-Healing-Wave
-- consume proc (900150-152). The C++ side is data-driven (no SpellScript).
DELETE FROM `spell_proc` WHERE `SpellId` IN (900147, 900148, 900149, 900150, 900151, 900152);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
-- Bastion of Earth passive — chance on block (Chance=0 => uses DBC proc_chance
-- 15/25/35 per rank), no ICD (no stacking)
(900147, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900148, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
(900149, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0),
-- Bastion of Earth buff — consumed when Lesser Healing Wave is cast
-- SpellFamilyName=11 (Shaman), SpellFamilyMask0=128 (Lesser Healing Wave)
-- SpellPhaseMask=1 (CAST), AttributesMask=8 (PROC_ATTR_REQ_SPELLMOD)
-- Same pattern as Maelstrom Weapon buff (53817)
(900150, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900151, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0),
(900152, 0, 11, 128, 0, 0, 0, 0, 1, 0, 8, 0, 0, 0, 0, 0);
