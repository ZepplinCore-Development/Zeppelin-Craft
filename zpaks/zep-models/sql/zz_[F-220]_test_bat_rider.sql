-- F-220 retired: 902201 "F-220 Test Bat Rider" (the Gurubashi Bat Rider prototype on rider display
-- 900401, a copy of Lau'Tiki 4609). Never spawned. The bat rider is now one rider display like every
-- other F-220 rider (900503, zep-npc-wardrobe), previewed by 902205 (zz_[F-220]_rider_previews.sql).

DELETE FROM creature_template WHERE entry = 902201;
DELETE FROM creature_template_model WHERE CreatureID = 902201;
DELETE FROM creature_template_addon WHERE entry = 902201;
DELETE FROM creature_model_info WHERE DisplayID = 900401;
