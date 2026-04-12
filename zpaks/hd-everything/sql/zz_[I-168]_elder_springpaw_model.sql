-- I-168: Springpaw Elder/Matriarch use wrong model (DruidCat_Legacy instead of arathilynx)
-- Elder Springpaw: Point to 15507 (arathilynx_gold) to keep yellow/gold colour
-- Springpaw Matriarch: Point to 15506 (arathilynx_red) to keep red colour
DELETE FROM creature_template_model WHERE CreatureID IN (15652, 15653) AND Idx = 0;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability) VALUES
(15652, 0, 15507, 1, 1),
(15653, 0, 15506, 1, 1);
