-- [F-030] mod-worgoblin: creaturedisplayinfoextra overrides
-- The worgen M2 now draws its mane from the hair texture (type 6, CharSections hair rows), and the client replaces
-- it for baked NPCs too (SetHairColor -> ReplaceHairTexture runs before the bake early-out), so a worgen NPC's
-- hair_color picks its mane regardless of the bake. Each worgen-model display gets the mane colour closest to the
-- skin _Extra fur it showed before (Scripts/Character Skins/worgen_mane_colour.py colours, Lab distance).
-- The other race-12 extras (134) render the Fel Orc model (CreatureDisplayInfo model FelOrcMale), which has no
-- type-6 texture: hair_color does not reach them and they are left as they are.
-- Extra 20864 (display 33965, skin 0) is owned by zep-goblin-start (priority 370): its hair_color is set in
-- zep-goblin-start/dbc/[I-334]_creaturedisplayinfoextra.sql.

-- display 36445, skin 1 (brown): brown mane (colour 1, Lab distance 2.5)
UPDATE `creaturedisplayinfoextra` SET `hair_color` = 1 WHERE `id` = 24081;
