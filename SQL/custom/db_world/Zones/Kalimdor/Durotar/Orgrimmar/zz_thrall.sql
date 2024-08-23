DELETE FROM `creature` WHERE `id1` = 4949;
INSERT INTO `creature` (guid,id1,id2,id3,`map`,zoneId,areaId,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags,ScriptName,VerifiedBuild,CreateObject,Comment) VALUES
	 (3110629,4949,0,0,1,0,0,1,1,1,1919.8,-4123.0,44.6,4.77722,300,0.0,0,1857300,39300,0,0,0,0,'',NULL,0,NULL);
DELETE FROM `creature_addon` WHERE `guid` = 3110629;
INSERT INTO `creature_addon` (guid,path_id,mount,bytes1,bytes2,emote,visibilityDistanceType,auras) VALUES
	 (3110629,0,0,1,0,0,0,NULL);
