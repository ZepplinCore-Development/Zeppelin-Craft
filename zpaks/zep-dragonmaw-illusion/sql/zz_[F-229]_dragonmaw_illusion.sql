-- F-229 Gendered Dragonmaw Illusion
-- Stock gives every player 40214 -> 42016, which turns them into creature 23130 (male fel orc).
-- Males keep the stock chain. Females get 900942 -> 40216 (faction) + 900940 -> creature 900962.
-- Spells 900940-900942 live in dbc/[F-229]_spell.sql.

-- Female disguise creature (copy of 23130). Display 21216 = Dragonmaw Wyrmcaller (female orc)
-- is a placeholder until a female fel orc model exists.
DELETE FROM `creature_template` WHERE `entry` = 900962;
INSERT INTO `creature_template` SET
  `entry` = 900962,
  `name` = 'Fel Orc Illusion (Female)',
  `subname` = '',
  `minlevel` = 70,
  `maxlevel` = 70,
  `exp` = 1,
  `faction` = 35,
  `speed_walk` = 1,
  `speed_run` = 1.14286,
  `unit_class` = 1,
  `unit_flags2` = 2048,
  `type` = 7,
  `flags_extra` = 2,
  `VerifiedBuild` = 12340;

DELETE FROM `creature_template_model` WHERE `CreatureID` = 900962;
INSERT INTO `creature_template_model` SET
  `CreatureID` = 900962,
  `Idx` = 0,
  `CreatureDisplayID` = 21216,
  `DisplayScale` = 1,
  `Probability` = 1,
  `VerifiedBuild` = 0;

-- Stock rows: 40214 for any gender (2) -> males only (0).
UPDATE `spell_area` SET `gender` = 0 WHERE `spell` = 40214 AND `area` IN (3759, 3939, 3965, 3966);

-- Female rows: same areas, quest and statuses as the stock 40214 rows.
DELETE FROM `spell_area` WHERE `spell` = 900942;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(900942, 3759, 11013, 0, 0, 0, 1, 1, 74, 11),
(900942, 3939, 11013, 0, 0, 0, 1, 1, 74, 11),
(900942, 3965, 11013, 0, 0, 0, 1, 1, 74, 11),
(900942, 3966, 11013, 0, 0, 0, 1, 1, 74, 11);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 900942;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(900942, 40216, 2, 'Dragonmaw Illusion (Female) - faction'),
(900942, 900940, 2, 'Dragonmaw Illusion (Female) - transform');

-- Overlord Mor'ghor's Illidan scene: stock removed 42016 only, so a female kept her disguise.
-- The invoker now casts 900941, which strips 42016 and 900940.
UPDATE `smart_scripts` SET `action_type` = 134, `action_param1` = 900941, `action_param2` = 2,
  `comment` = 'Overlord Mor''ghor - Action List - Invoker Cast Dragonmaw Illusion Removal'
WHERE `entryorguid` = 2313900 AND `source_type` = 9 AND `id` = 24;
