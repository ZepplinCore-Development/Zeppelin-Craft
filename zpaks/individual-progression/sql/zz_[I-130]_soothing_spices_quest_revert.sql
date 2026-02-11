-- I-130: Revert Soothing Turtle Bisque vanilla quest requirement
-- IPP adds Soothing Spices (3713) as RequiredItemId2 for quests 555 and 7321,
-- but no vendor sells the item in base AzerothCore, making both quests impossible.
-- Revert to WotLK behavior: only Turtle Meat (3712) x10 required.

-- Alliance version (quest 555)
UPDATE quest_template SET RequiredItemId2 = 0, RequiredItemCount2 = 0 WHERE ID = 555;

-- Horde version (quest 7321)
UPDATE quest_template SET RequiredItemId2 = 0, RequiredItemCount2 = 0 WHERE ID = 7321;
