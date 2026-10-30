-- F-230 split facial features: legacy facial-hair rows whose geoset the F-230 skin relabels moved
-- (skin.geoset.relabel recipes in zpaks/zep-hd-curated/curate_transforms.json). Same look, new geoset ids:
-- undead male jaw pieces 203 / 205 are now jaw geosets 105 / 106 (group 1, column geoset_1),
-- dwarf female nose ring 305 is now 1602 (group 16, column geoset_4).
-- The rows stay where they are: NPC displays (CreatureDisplayInfoExtra.facial_hair) and existing characters
-- index them. Applies after zep-hd-curated's [F-216] row for 5/0/10-11 (priority 30 < 320).
UPDATE characterfacialhairstyles SET geoset_1 = 5, geoset_3 = 0 WHERE race = 5 AND gender = 0 AND variation_id = 10;
UPDATE characterfacialhairstyles SET geoset_1 = 6, geoset_3 = 0 WHERE race = 5 AND gender = 0 AND variation_id = 11;
UPDATE characterfacialhairstyles SET geoset_2 = 0, geoset_4 = 2 WHERE race = 3 AND gender = 1 AND variation_id = 4;
