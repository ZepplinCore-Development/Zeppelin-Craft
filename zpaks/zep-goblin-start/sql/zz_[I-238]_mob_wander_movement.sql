-- [I-238] Give idle hostile mobs (npcflag=0, MovementType=0) a random wander radius so they
-- don't stand motionless. Static NPCs (gossip/questgiver/trainer/vendor) stay put.
-- Override for the generated spawn files; loads after them (I > F).
-- PREFERRED long-term fix: set wander for idle hostiles in the spawn generator (migrate_creatures),
-- then retire this override.
UPDATE creature cr JOIN creature_template ct ON cr.id = ct.entry
SET cr.MovementType = 1, cr.wander_distance = 5
WHERE cr.guid BETWEEN 11000000 AND 11003689
  AND ct.npcflag = 0
  AND cr.MovementType = 0
  AND cr.wander_distance = 0;
