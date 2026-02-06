-- I-106: Jelinek Sharpshear (entry 29142) baked texture mismatch
-- PATCH-6 CreatureDisplayInfoExtra changes skin_id/face_id/facial_hair_id for extra 17385
-- but no matching HD baked texture exists (CreatureDisplayExtra-17385_HD.blp was never generated).
-- Stock display 25624 uses extra 17385 with mismatched texture, causing broken NPC appearance.
-- Fix: swap to display 7168 (extra 4862) which has a valid baked texture.
UPDATE `creature_template_model` SET `CreatureDisplayID` = 7168 WHERE `CreatureID` = 29142;
