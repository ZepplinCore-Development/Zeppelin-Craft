-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 GameObjectDisplayInfo additions (client PATCH-Z; model paths from wago 4.4.2)

DELETE FROM gameobjectdisplayinfo WHERE id = 8936;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (8936, 'world\\kalimdor\\tanaris\\passivedoodads\\goblin\\go_large_bomb_2.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 8969;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (8969, 'world\\kalimdor\\tanaris\\passivedoodads\\goblin\\go_crate_3.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 9135;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9135, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\LOSTISLES\\GOBLIN_POOLELEVATOR.MDX');
DELETE FROM gameobjectdisplayinfo WHERE id = 9191;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9191, 'world\\generic\\goblin\\passivedoodads\\kezan\\items\\goblin_kezan_painting_02.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 9210;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9210, 'world\\generic\\goblin\\passivedoodads\\lostisles\\goblinbattery_02.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 9226;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9226, 'world\\generic\\goblin\\passivedoodads\\kezan\\items\\goblin_can_stack_01.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 9308;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9308, 'world\\generic\\goblin\\passivedoodads\\beds\\goblin_horde_ornatebed_01.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 9869;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9869, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\BEANBAGS\\GOBLIN_BEANBAG_01.MDX');
DELETE FROM gameobjectdisplayinfo WHERE id = 9925;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (9925, 'world\\generic\\goblin\\passivedoodads\\mortar\\goblin_horde_mortar_01.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 10230;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10230, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\KEZAN\\ITEMS\\GOBLIN_KEZAN_WARNING_SIGN_03.MDX');
DELETE FROM gameobjectdisplayinfo WHERE id = 10231;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10231, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\KEZAN\\ITEMS\\GOBLIN_KEZAN_WARNING_SIGN_01.MDX');
DELETE FROM gameobjectdisplayinfo WHERE id = 10233;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10233, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\KEZAN\\ITEMS\\GOBLIN_KEZAN_WARNING_SIGN_02.MDX');
DELETE FROM gameobjectdisplayinfo WHERE id = 10239;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10239, 'world\\generic\\goblin\\passivedoodads\\beanbags\\goblin_beanbag_02.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 10240;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10240, 'world\\generic\\goblin\\passivedoodads\\beanbags\\goblin_beanbag_04.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 10254;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10254, 'world\\generic\\human\\passive doodads\\oilpuddle\\oil_puddle_01.mdx');
DELETE FROM gameobjectdisplayinfo WHERE id = 10376;
INSERT INTO gameobjectdisplayinfo (id, model_name) VALUES (10376, 'WORLD\\GENERIC\\GOBLIN\\PASSIVEDOODADS\\BEANBAGS\\GOBLIN_BEANBAG_03.MDX');
