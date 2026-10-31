-- F-236 Worgen Human Form (Two Forms)
-- spell_dbc overrides Spell.dbc on the server: mod-worgoblin's own rows for Two Forms (workflow/spell_dbc.sql) still
-- hold the old transform (aura 56 into creature 20707 / 20708). Same change as zpaks/mod-worgoblin/dbc/[F-236]_spell.sql.
UPDATE `spell_dbc` SET `EffectAura_1` = 302, `EffectMiscValue_1` = 0 WHERE `ID` IN (68995, 68996);

-- Scripts in mod-worgoblin src/Worgoblin.cpp (ported from Medviten's WHE-256-bit, AGPL-3.0, with the author's permission)
DELETE FROM `spell_script_names` WHERE `spell_id` IN (68995, 68996, 87840);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(68995, 'spell_worgen_two_forms'),
(68996, 'spell_worgen_two_forms'),
(87840, 'spell_worgen_running_wild');
