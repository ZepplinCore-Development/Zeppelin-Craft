-- Increase respawn frequency of the Felwood Furbolgs killed to farm Timbermaw reputation.
UPDATE `creature` SET `spawntimesecs` = 225 where `id1` IN (7156, 9462);