UPDATE achievement SET name_enus = 'Uldaman West' WHERE id = 638;

UPDATE achievement SET name_enus = 'Heroic: Uldaman West' WHERE id = 5014;

UPDATE achievement SET name_enus = 'Mythic: Uldaman West' WHERE id = 5114;

DELETE FROM achievement WHERE id IN (5120, 5121, 5122);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5120, 'Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5121, 'Heroic: Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);
INSERT INTO achievement (id, name_enus, name_flags, desc_enus, desc_flags, category, points, flags, map) VALUES (5122, 'Mythic: Uldaman East', 16712190, 'Defeat Ironaya.', 16712190, 14808, 10, 0, -1);
