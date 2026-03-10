-- [F-164] Custom spellvisualkit entries

-- Kit 90001: Spirit Communion cast — bow animation (66) + Ghost_state base effect (717)
-- Character bows while a ghostly spirit aura appears around them
DELETE FROM `spellvisualkit` WHERE `id` = 90001;
INSERT INTO `spellvisualkit` (`id`, `anim_id`, `base_effect`) VALUES (90001, 66, 717);
