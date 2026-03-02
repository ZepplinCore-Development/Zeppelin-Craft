-- =============================================================================
-- Cleanup: Remove spell_script_names entries for spells now handled purely by DBC
-- =============================================================================
-- spell_item_alchemists_stone (spell 17619) and spell_item_fel_mana_potion (spell 38929)
-- are registered in spell_script_names but their C++ implementations no longer exist.
-- These spells are now handled entirely through DBC spell effects.
-- =============================================================================

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_item_alchemists_stone', 'spell_item_fel_mana_potion');
