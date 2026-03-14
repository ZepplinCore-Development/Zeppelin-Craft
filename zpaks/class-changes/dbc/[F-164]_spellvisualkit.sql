-- [F-164] Custom spellvisualkit entries

-- Kit 90001: Spirit Communion — Ghost_state base effect (717)
-- Ghostly spirit aura appears around the caster
-- anim_id 54 = cast directed (blends with movement like Rejuvenation)
DELETE FROM `spellvisualkit` WHERE `id` = 90001;
INSERT INTO `spellvisualkit` (`id`, `anim_id`, `base_effect`) VALUES (90001, 54, 717);
