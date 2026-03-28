-- [F-157] fishing-bag-mechanic: spellvisualkit
-- Show fishing pole via right_weapon_effect on cast (829) and channel (830) kits
-- Clean up leftover SpellVisualKitModelAttach entry (ID 4697) from earlier testing — was rendering
-- a second rod at attachment_id 0 (shield/offhand point) on top of the right_weapon_effect rod

-- spellvisualkit: 2 updates
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 829;
UPDATE `spellvisualkit` SET `right_weapon_effect` = 7104 WHERE `id` = 830;

-- spellvisualkitmodelattach: cleanup
DELETE FROM `spellvisualkitmodelattach` WHERE `id` = 4697;
