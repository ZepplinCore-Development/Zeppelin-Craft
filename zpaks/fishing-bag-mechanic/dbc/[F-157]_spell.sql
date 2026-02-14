-- [F-157] fishing-bag-mechanic: spell
-- Update fishing spells to require TotemCategory 221 (Fishing Pole) instead of equipped weapon
-- Spells: Fishing (7620), Fishing (7731), Fishing (7732), Fishing (18248), Fishing (33095), Fishing (51294)

-- spell: 6 updates
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 7620;
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 7731;
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 7732;
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 18248;
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 33095;
UPDATE `spell` SET `totem_category_1` = 221, `equipped_item_class` = -1, `equipped_item_subclass_mask` = 0 WHERE `id` = 51294;
