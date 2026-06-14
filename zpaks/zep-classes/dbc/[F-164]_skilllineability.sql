-- [F-164] Earthwarden skilllineability
-- Maps talent-granted active spells to the Earthwarden skillline (9001)
-- so they appear in the Earthwarden tab of the spellbook.
-- Also maps Shield Mastery to Enhancement and Earthen Reprisal to Earthwarden.

-- Base Earthwarden talent abilities (acquire_method=0 so talent reset removes them)
DELETE FROM `skilllineability` WHERE `id` IN (200065, 200066, 200067, 200068, 200069);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200065, 9001, 900116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200066, 9001, 900119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200067, 9001, 900121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200068, 9001, 900123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200069, 9001, 900124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Improved Rockbiter Weapon (900129-900130) on Earthwarden skill line
-- Passive — kept on SLA for skillline membership; the spells themselves have
-- attributes_ex_4 = 0x8000 (NOT_IN_SPELLBOOK) so they don't render in the tab.
DELETE FROM `skilllineability` WHERE `id` IN (200076, 200077);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200076, 9001, 900129, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200077, 9001, 900130, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Shield Mastery (900133-900137) on Earthwarden skill line (9001)
DELETE FROM `skilllineability` WHERE `id` IN (200070, 200071, 200072, 200073, 200074);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200070, 9001, 900133, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200071, 9001, 900134, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200072, 9001, 900135, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200073, 9001, 900136, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(200074, 9001, 900137, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Ancestral Warcry on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200075;
INSERT INTO `skilllineability` (
    `id`, `skill_line`, `spell_id`,
    `required_races`, `required_classes`,
    `excluded_races`, `excluded_classes`,
    `min_skill_value`, `spell_parent_id`, `acquire_method`,
    `skill_grey_level`, `skill_yellow_level`,
    `character_points_1`, `character_points_2`
) VALUES
(200075, 9001, 900153, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Thunderborne Leap on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200078;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200078, 9001, 900173, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Stoneskin on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200079;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200079, 9001, 900164, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Earthen Reprisal on Earthwarden skill line
DELETE FROM `skilllineability` WHERE `id` = 200045;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES (200045, 9001, 900114, 0, 64, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Bastion of Earth (ranks 1-3) on Earthwarden skill line
-- Passive — same pattern as Improved Rockbiter Weapon above (NOT_IN_SPELLBOOK
-- on the spell, SLA preserves skillline membership).
DELETE FROM `skilllineability` WHERE `id` IN (200080, 200081, 200082);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200080, 9001, 900147, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200081, 9001, 900148, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200082, 9001, 900149, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Move Stoneclaw Totem (all ranks) from Elemental Combat (375) to Earthwarden (9001)
UPDATE `skilllineability` SET `skill_line` = 9001
WHERE `id` IN (4456, 4457, 4458, 4459, 5590, 5591, 13298, 20055, 20056, 20057);

-- Move Stoneskin Totem (all ranks) from Enhancement (373) to Earthwarden (9001)
UPDATE `skilllineability` SET `skill_line` = 9001
WHERE `id` IN (8764, 8765, 8766, 8767, 8769, 8770, 13295, 13297, 20070, 20071);

-- Spirit Communion (active 900185) on Restoration skill line (374), trainer-learned at L12
-- Passive (900183) is taught via spell_linked_spell type=2 when active is learned —
-- acquire_method=0 here keeps it off the auto-learn path so low-level shamans don't
-- get the Spirited proc before they have the active to consume it.
-- Only the active (900185) needs an SLA — the passive (900183) is taught via
-- spell_linked_spell type=2 when 900185 is learned, and is hidden from the
-- spellbook via attributes_ex_4 = 0x8000 (NOT_IN_SPELLBOOK) on the spell.
DELETE FROM `skilllineability` WHERE `id` IN (200083, 200084);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200083, 374, 900185, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Wolf's Hunger (900216) on Enhancement skill line (373) - talent-granted active
DELETE FROM `skilllineability` WHERE `id` = 200085;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200085, 373, 900216, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Move Rockbiter Weapon (all 4 player ranks) from Enhancement (373) to Earthwarden (9001)
UPDATE `skilllineability` SET `skill_line` = 9001
WHERE `id` IN (8747, 8748, 8749, 8750);

-- Move Earthbind Totem from Elemental Combat (375) to Earthwarden (9001)
UPDATE `skilllineability` SET `skill_line` = 9001
WHERE `id` = 4481;

-- Move Earth Shock (all 10 player ranks) from Elemental Combat (375) to Earthwarden (9001)
UPDATE `skilllineability` SET `skill_line` = 9001
WHERE `id` IN (4468, 4469, 4470, 4471, 5576, 5577, 5578, 13276, 16962, 16963);

-- Rockbiter Weapon ranks 5-10 (imbues 900230-900235) on Earthwarden skill line (9001),
-- matching the R1-R4 move above. required_classes 64 = Shaman.
DELETE FROM `skilllineability` WHERE `id` IN (200090, 200091, 200092, 200093, 200094, 200095);
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200090, 9001, 900230, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200091, 9001, 900231, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200092, 9001, 900232, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200093, 9001, 900233, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200094, 9001, 900234, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200095, 9001, 900235, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Stonewall (900223) active on the Earthwarden skill line (9001) so it shows in the spellbook tab
DELETE FROM `skilllineability` WHERE `id` = 200096;
INSERT INTO `skilllineability` (`id`, `skill_line`, `spell_id`, `required_races`, `required_classes`, `excluded_races`, `excluded_classes`, `min_skill_value`, `spell_parent_id`, `acquire_method`, `skill_grey_level`, `skill_yellow_level`, `character_points_1`, `character_points_2`) VALUES
(200096, 9001, 900223, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0);
