-- [F-157] fishing-bag-mechanic: spellvisualkit
-- Set right_weapon_effect on fishing cast (829) and channel (830) visual kits
-- to show fishing pole model instead of equipped weapon

-- spellvisualkit: 2 updates
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 829;
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 830;
