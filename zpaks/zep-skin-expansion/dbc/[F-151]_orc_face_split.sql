-- F-151 Modern Character Creator, Phase 2: the orc face option is face shape only.
-- Eye colour and marking are their own choices ([AUTO,F-151]_charsections_eyes.sql), so the faces that only
-- repeat a shape with another eye or a marking are no longer offered:
--   9-17 = 0-8 with the death knight eyes, 18-24 = a shape + marking, 25-31 = 18-24 with the death knight eyes.
-- Their rows stay (flags 0) so a character not yet moved to shape + eye + marking still draws.
-- Faces 0-8 gain 0x10, which lets a death knight pick them too (the DK eye is an eye colour choice now).
-- Sorts after the [AUTO,*] files, whose rows it overrides.
UPDATE charsections SET flags = flags | 0x10 WHERE race = 2 AND base_section = 1 AND type BETWEEN 0 AND 8 AND (flags & 0x1) = 0x1;
UPDATE charsections SET flags = 0 WHERE race = 2 AND base_section = 1 AND type BETWEEN 9 AND 31;
-- The old death knight skin colours (male 15-17, female 11-13) are ordinary colours of their sub-race now (user rule):
-- skin, underwear and plain faces open to every class (0x4 death knight only -> 0x11 any class).
UPDATE charsections SET flags = (flags & ~0x4) | 0x11 WHERE race = 2 AND base_section IN (0, 4) AND ((gender = 0 AND color_index IN (15, 16, 17)) OR (gender = 1 AND color_index IN (11, 12, 13)));
UPDATE charsections SET flags = (flags & ~0x4) | 0x11 WHERE race = 2 AND base_section = 1 AND type BETWEEN 0 AND 8 AND ((gender = 0 AND color_index IN (15, 16, 17)) OR (gender = 1 AND color_index IN (11, 12, 13)));
