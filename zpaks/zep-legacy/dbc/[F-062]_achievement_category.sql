-- F-062: interleave the custom difficulty categories into the stock
-- "Dungeons & Raids" achievement tree (parent_id 168).
--
-- ui_order is stated ABSOLUTELY, by id, for every row under parent 168.
--
-- This file previously made room by shifting: `SET ui_order = ui_order + 2 WHERE
-- parent_id = 168 AND ui_order >= 2`, three times (+2, +1, +2). That is correct
-- exactly once against stock. On any re-run it shifts the STOCK rows again --
-- the custom rows are immune because their DELETE+INSERT resets them, so only
-- the stock rows drift, silently, by +5 every time.
--
-- It had already drifted 8 times. The Lich King categories were sitting at
-- ui_order 48-57 instead of 8-17, leaving a visible gap in the achievement UI
-- between "Outland Raid" (7) and "Lich King Dungeon" (48). Repaired here.
--
-- Absolute values are idempotent by construction: no read-modify-write, so the
-- thousandth apply lands exactly what the first one did. Do not reintroduce a
-- relative shift -- under the F-205 universal cascade this file re-applies
-- whenever anything upstream of zep-legacy changes.
--
-- Expected end state: parent 168 holds 17 rows at ui_order 1..17, no gaps.

-- === Custom categories (we own these rows: DELETE + INSERT is the final state) ===

DELETE FROM achievement_category WHERE id IN (15063, 15064, 15065, 15066, 15067);

INSERT INTO achievement_category SET
  id = 15063,
  parent_id = 168,
  name_enus = 'Azeroth Heroic Dungeon',
  name_flags = 16712190,
  ui_order = 2;

INSERT INTO achievement_category SET
  id = 15064,
  parent_id = 168,
  name_enus = 'Azeroth Mythic Dungeon',
  name_flags = 16712190,
  ui_order = 3;

INSERT INTO achievement_category SET
  id = 15065,
  parent_id = 168,
  name_enus = 'Azeroth Raid',
  name_flags = 16712190,
  ui_order = 4;

INSERT INTO achievement_category SET
  id = 15066,
  parent_id = 168,
  name_enus = 'Outland Heroic Dungeon',
  name_flags = 16712190,
  ui_order = 6;

INSERT INTO achievement_category SET
  id = 15067,
  parent_id = 168,
  name_enus = 'Outland Raid',
  name_flags = 16712190,
  ui_order = 7;

-- === Stock categories (one consolidated UPDATE per id) ===

UPDATE achievement_category SET
  name_enus = 'Azeroth Dungeon',
  ui_order = 1
WHERE id = 14808;

UPDATE achievement_category SET
  name_enus = 'Outland Dungeon',
  ui_order = 5
WHERE id = 14805;

-- Pushed down by 7 to make room for the Azeroth/Outland difficulty split above.
-- These were the rows the old relative shift kept re-shifting.

UPDATE achievement_category SET ui_order = 8  WHERE id = 14806;  -- Lich King Dungeon
UPDATE achievement_category SET ui_order = 9  WHERE id = 14921;  -- Lich King Heroic
UPDATE achievement_category SET ui_order = 10 WHERE id = 14922;  -- Lich King 10-Player Raid
UPDATE achievement_category SET ui_order = 11 WHERE id = 14923;  -- Lich King 25-Player Raid
UPDATE achievement_category SET ui_order = 12 WHERE id = 14961;  -- Secrets of Ulduar 10-Player Raid
UPDATE achievement_category SET ui_order = 13 WHERE id = 14962;  -- Secrets of Ulduar 25-Player Raid
UPDATE achievement_category SET ui_order = 14 WHERE id = 15001;  -- Call of the Crusade 10-Player Raid
UPDATE achievement_category SET ui_order = 15 WHERE id = 15002;  -- Call of the Crusade 25-Player Raid
UPDATE achievement_category SET ui_order = 16 WHERE id = 15041;  -- Fall of the Lich King 10-Player Raid
UPDATE achievement_category SET ui_order = 17 WHERE id = 15042;  -- Fall of the Lich King 25-Player Raid
