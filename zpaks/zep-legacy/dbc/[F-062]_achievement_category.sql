UPDATE achievement_category SET ui_order = ui_order + 2 WHERE parent_id = 168 AND ui_order >= 2;

DELETE FROM achievement_category WHERE id IN (15063, 15064); INSERT INTO achievement_category (id, parent_id, name_enus, name_flags, ui_order) VALUES (15063, 168, 'Classic Heroic', 16712190, 2); INSERT INTO achievement_category (id, parent_id, name_enus, name_flags, ui_order) VALUES (15064, 168, 'Classic Mythic', 16712190, 3);

UPDATE achievement_category SET name_enus = 'Azeroth Dungeon' WHERE id = 14808;

UPDATE achievement_category SET name_enus = 'Azeroth Heroic Dungeon' WHERE id = 15063;

UPDATE achievement_category SET name_enus = 'Azeroth Mythic Dungeon' WHERE id = 15064;

UPDATE achievement_category SET ui_order = ui_order + 1 WHERE parent_id = 168 AND ui_order >= 4;

DELETE FROM achievement_category WHERE id = 15065; INSERT INTO achievement_category (id, parent_id, name_enus, name_flags, ui_order) VALUES (15065, 168, 'Azeroth Raid', 16712190, 4);

UPDATE achievement_category SET ui_order = ui_order + 2 WHERE parent_id = 168 AND ui_order >= 5;

UPDATE achievement_category SET name_enus = 'Outland Dungeon' WHERE id = 14805;

DELETE FROM achievement_category WHERE id IN (15066, 15067); INSERT INTO achievement_category (id, parent_id, name_enus, name_flags, ui_order) VALUES (15066, 168, 'Outland Heroic Dungeon', 16712190, 6); INSERT INTO achievement_category (id, parent_id, name_enus, name_flags, ui_order) VALUES (15067, 168, 'Outland Raid', 16712190, 7);

UPDATE achievement_category SET ui_order = 5 WHERE id = 14805;
