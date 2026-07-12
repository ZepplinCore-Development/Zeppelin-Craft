-- [I-234] TEST: minimal CreatureDisplayInfoExtra (cloned from troll 567) to trigger the character-
-- model path for the modern forest-troll display 900103. Tests whether WXL populates geosets/texture
-- from the modern model once the char path is engaged (extended_display_info_id > 0).
DELETE FROM creaturedisplayinfoextra WHERE id=900007;
INSERT INTO creaturedisplayinfoextra SET
  `id` = 900007,
  `race` = 8,
  `gender` = 1,
  `skin_color` = 3,
  `face_type` = 4,
  `hair_style` = 2,
  `hair_color` = 6,
  `facial_hair` = 3,
  `helm_id` = 0,
  `shoulders_id` = 0,
  `shirt_id` = 11476,
  `chest_id` = 10013,
  `belt_id` = 7746,
  `legs_id` = 6197,
  `boots_id` = 13939,
  `wrists_id` = 0,
  `gloves_id` = 7530,
  `tabard_id` = 0,
  `cape_id` = 0,
  `can_equip` = 0,
  `texture` = 'CreatureDisplayExtra-00567_HD.blp';
