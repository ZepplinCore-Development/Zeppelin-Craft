-- F-011 movement: give idle hostile mobs (npcflag=0, MovementType=0) a random wander radius.
-- Static NPCs (gossip/questgiver/trainer/vendor) stay put. Waypoint-flattened mobs also get wander.
UPDATE creature cr JOIN creature_template ct ON cr.id = ct.entry
SET cr.MovementType = 1, cr.wander_distance = 5
WHERE cr.guid BETWEEN 11000000 AND 11003689
  AND ct.npcflag = 0
  AND cr.MovementType = 0
  AND cr.wander_distance = 0;
