UPDATE achievement SET name_enus = 'Uldaman West' WHERE id = 638;

UPDATE achievement SET name_enus = 'Heroic: Uldaman West' WHERE id = 5014;

UPDATE achievement SET name_enus = 'Mythic: Uldaman West' WHERE id = 5114;

DELETE FROM achievement WHERE id IN (5120, 5121, 5122);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5120, 'Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5121, 'Heroic: Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5122, 'Mythic: Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);

UPDATE achievement SET category = 15063 WHERE category = 14808 AND name_enus LIKE 'Heroic:%';

UPDATE achievement SET category = 15064 WHERE category = 14808 AND name_enus LIKE 'Mythic:%';

UPDATE achievement SET category = 15065 WHERE id IN (685, 686, 687, 688, 689);

UPDATE achievement SET spell_icon = 3656 WHERE id IN (5120, 5121, 5122);

UPDATE achievement SET category = 15066 WHERE category = 14805 AND name_enus LIKE 'Heroic:%';

UPDATE achievement SET category = 15067 WHERE id IN (690, 691, 692, 693, 694, 695, 696, 697, 698);

UPDATE achievement SET faction = -1, min_criteria_demand = 1 WHERE id IN (5120, 5121, 5122);

UPDATE achievement SET order_in_category = 11 WHERE id = 5120;

UPDATE achievement SET order_in_category = 11 WHERE id IN (5121, 5122);
