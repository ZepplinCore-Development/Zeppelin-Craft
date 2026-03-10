-- [F-164] Custom spellvisualkit entries

-- Kit 90001: Spirit Communion cast — Ghost_state base effect (717)
-- Ghostly spirit aura appears around the caster
DELETE FROM `spellvisualkit` WHERE `id` = 90001;
INSERT INTO `spellvisualkit` (`id`, `base_effect`) VALUES (90001, 717);
