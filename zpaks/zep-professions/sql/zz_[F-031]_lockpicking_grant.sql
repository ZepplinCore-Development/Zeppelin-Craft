-- [F-031] Universal Lockpicking: grant Pick Lock (1804) to every character.
-- Applied by the core at character creation AND on every login
-- (PlayerStart.CustomSpells = 1). Moved here from zep-legacy's
-- zz_starting_spells file when F-031 migrated to zep-professions.
-- Skill 633 itself is granted by the core when 1804 is learned, gated by
-- the F-031 skillraceclassinfo/skilllineability DBC edits in this zpak.

REPLACE INTO `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`)
VALUES (0, 0, 1804, 'Lockpicking');
