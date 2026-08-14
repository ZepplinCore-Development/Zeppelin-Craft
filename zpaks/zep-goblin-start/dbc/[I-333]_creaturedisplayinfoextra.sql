-- [I-333] Wrong face on the F-011 naga NPCs (Vashj'elan Warrior 38359, Naga Hatchling
-- 38412/44578/44588/44589) -- same class as [I-231] / [I-255], which swept races 1-8 only.
--
-- patch-hd-everything (PATCH-Q) replaces CHARACTER\NAGA_\MALE\NAGA_MALE.M2 in place with a
-- re-UV'd HD mesh: submesh 1 (3063 of 5431 verts, head included) binds M2 texture type 8
-- (SKIN_EXTRA), and the pack's FaceLower/FaceUpper/NakedTorso/NakedPelvis BLPs are all the
-- same empty file. The Cata bakes we ship on PATCH-Z (CreatureDisplayExtra-20692..20695,
-- 256x256) are stock-layout composites with the face in the FaceUpper/FaceLower rectangle,
-- so on the HD mesh that face art lands on 642 verts spread from tail to crest.
--
-- The HD pack re-baked the naga NPC composites for its own atlas -- CreatureDisplayExtra-
-- 15590..15593.blp ship at 512x512 with the HD layout. Repoint to that quartet, matched on
-- skin_color; it is Darkspine Myrmidon (25060, displays 22874-22877), the only race-13 donor
-- set with identical gear across all four skin colours, so the warrior's variants stay
-- consistent. `texture` only -- the bake supplies the whole composite, so the item component
-- columns are not read on that path.
--
-- Loads after [AUTO,F-011]_creaturedisplayinfoextra.sql (I > A in filename sort).
-- Requires: dbc db apply --changed + PATCH-Z rebuild to reach the client.

-- Vashj'elan Warrior (38359), displays 31061-31064 -- skin_color 1 / 0 / 3 / 4
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15591.blp' WHERE id = 20692;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15590.blp' WHERE id = 20693;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15592.blp' WHERE id = 20694;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15593.blp' WHERE id = 20695;

-- Vashj'elan Siren (38360), displays 31065-31068 -- race 13 gender 1, same defect on the HD
-- naga_female.m2 (textures type 1 + type 8 'Gesicht'; the face is on the type-8 SKIN_EXTRA).
-- Donor is the Darkspine Siren (25073, extras 15586-15589): the only race-13 female donor set
-- with uniform gear (chest 44395 / belt 43189 / gloves 44399, Robe_DungeonMage_B_01Blue), and
-- the closest match to our chest 37869 Robe_Blood_B_01Blue. Its skin colours are 1/2/3/4 while
-- ours are 0/1/2/3, and no uniform-gear donor set covers skin 0 at all -- so three rows map
-- exactly and only 20696 shifts, to the one donor colour left over (4). skin_color must move
-- with the bake: it also selects the type-8 Extra texture, so leaving it at 0 would put a
-- skin-0 face on a skin-4 body.
UPDATE creaturedisplayinfoextra SET skin_color = 4, texture = 'CreatureDisplayExtra-15589.blp' WHERE id = 20696;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15586.blp' WHERE id = 20697;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15587.blp' WHERE id = 20698;
UPDATE creaturedisplayinfoextra SET texture = 'CreatureDisplayExtra-15588.blp' WHERE id = 20699;

-- Naga Hatchling (38412/44578/44588/44589), displays 31084/31086 -- no item components at all,
-- so drop the bake entirely and let the client runtime-composite from CharSections, which
-- resolves to the HD base skin plus the pack's blank overlay sections. 22 stock rows already
-- ship with an empty bake name.
UPDATE creaturedisplayinfoextra SET texture = '' WHERE id = 20708;
UPDATE creaturedisplayinfoextra SET texture = '' WHERE id = 20709;
