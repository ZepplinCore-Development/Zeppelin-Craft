-- F-027: Remove spell_script_names for potions now handled purely by DBC
-- spell_item_alchemists_stone (17619) and spell_item_fel_mana_potion (38929)
-- C++ handlers removed via azerothcore patch; DB registrations are now stale.

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_item_alchemists_stone', 'spell_item_fel_mana_potion');
