-- F-014: Register spell_mage_magical_attunement script for Magical Attunement (91056)
-- C++ AuraScript converts a % of healing received into mana via spell 91055.

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_mage_magical_attunement';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (91056, 'spell_mage_magical_attunement');
