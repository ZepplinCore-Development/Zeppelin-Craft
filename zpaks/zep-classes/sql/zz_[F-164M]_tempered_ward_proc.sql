-- [F-164M] Tempered Ward proc gate.
-- The Tempered Ward talent (900115/900127/900128) carries an aura 42 (PROC_TRIGGER_SPELL) effect
-- that casts its rank's Tempered Ward buff (900328/900329/900330) on the bearer; see
-- [F-164M]_spell.sql. The spell DBC can't express "only on magic damage taken, max once per 2s",
-- so these spell_proc rows supply that gate.
--   ProcFlags 655360 = TAKEN_SPELL_MAGIC_DMG_CLASS_NEG (0x20000) | TAKEN_PERIODIC (0x80000)
--     -> direct magic hits AND magic damage-over-time ticks.
--   SchoolMask 126 = all magic schools (excludes physical), so physical hits/bleeds never proc it.
--   SpellTypeMask 1 = damage only (heals/HoTs excluded).
--   Cooldown 2000 = 2s internal cooldown; Chance 100. One row per Elemental Ward rank.
DELETE FROM `spell_proc` WHERE `SpellId` IN (900115, 900127, 900128);
INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES
(900115, 126, 0, 0, 0, 0, 655360, 1, 0, 0, 0, 0, 0, 100, 2000, 0),
(900127, 126, 0, 0, 0, 0, 655360, 1, 0, 0, 0, 0, 0, 100, 2000, 0),
(900128, 126, 0, 0, 0, 0, 655360, 1, 0, 0, 0, 0, 0, 100, 2000, 0);
