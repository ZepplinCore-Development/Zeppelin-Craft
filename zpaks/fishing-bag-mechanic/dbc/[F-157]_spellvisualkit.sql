-- [F-157] fishing-bag-mechanic: spellvisualkit
-- Show fishing pole via right_weapon_effect on both cast and channel phases

-- spellvisualkit: 2 updates
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 829;
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 830;
