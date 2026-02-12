-- Creatures that should be skinnable but aren't in stock AC

-- Tamed Battleboar (Razorfen Kraul) - other RFK boars are skinnable, this one wasn't
UPDATE `creature_template` SET `skinloot` = 100001 WHERE (`entry` = 4535);
