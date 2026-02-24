-- Remove Mosh'Ogg Lord bodyguards flanking Mai'Zoth (entry 818)
-- These two spawns are ~10 yards from Mai'Zoth and cause the fight
-- to be disproportionately difficult after his de-L33TER nerf to normal.

DELETE FROM `creature` WHERE `guid` IN (521, 522);
DELETE FROM `creature_addon` WHERE `guid` IN (521, 522);
