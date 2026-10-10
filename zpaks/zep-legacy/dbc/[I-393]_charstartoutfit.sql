-- I-393 Night Elf Hunter Starting Outfit
-- Rows 43/44 (race 4 night elf, class 3 hunter, male/female) carried the dwarf ranged kit: Small Ammo
-- Pouch 2102 + Old Blunderbuss 2508. Night elf hunters have no Guns skill (F-022: Dagger, Two-Handed
-- Axes, Bows, Unarmed), so they started with no usable weapon. Restore the stock NE hunter weapons
-- (Worn Battleaxe 12282, Worn Shortbow 2504, Light Quiver 2101, Rough Arrow 2512; display ids from
-- original_dbc) in real-item slots only. F-022's tier-preview display slots are untouched.
UPDATE `charstartoutfit` SET
  `item_7` = 2101,  `inventory_type_7` = 18,  `display_item_7` = 21328,
  `item_8` = 2504,  `inventory_type_8` = 15,  `display_item_8` = 8106,
  `item_10` = 12282, `inventory_type_10` = 17, `display_item_10` = 22291,
  `item_14` = 2512, `inventory_type_14` = 24, `display_item_14` = 5996
WHERE `id` = 43;

UPDATE `charstartoutfit` SET
  `item_7` = 2101,  `inventory_type_7` = 18,  `display_item_7` = 21328,
  `item_8` = 2504,  `inventory_type_8` = 15,  `display_item_8` = 8106,
  `item_10` = 12282, `inventory_type_10` = 17, `display_item_10` = 22291,
  `item_14` = 2512, `inventory_type_14` = 24, `display_item_14` = 5996
WHERE `id` = 44;
