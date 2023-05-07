DELETE FROM `creature` WHERE (`id` = 21630); -- Forge
DELETE FROM `gameobject` WHERE (`id` = 183878); -- Anvil
INSERT INTO `gameobject` (`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`VerifiedBuild`) VALUES
	 (21630,1,0,0,1,1,9895.98,2455.06,1316.82,3.29231,-0.0,-0.0,-0.997162,0.0752882,300,0,1,'',NULL),
	 (183878,1,0,0,1,1,9896.97,2457.72,1316.68,2.98601,-0.0,-0.0,-0.996976,-0.0777129,300,0,1,'',NULL);
