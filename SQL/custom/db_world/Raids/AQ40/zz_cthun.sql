-- Reduced Cthun health from 400 -> 300 fight was very long.
    UPDATE `creature_template` SET `HealthModifier` = 300 WHERE (`entry` = 15589);

-- Updated summon groups?
    DELETE FROM `creature_summon_groups` WHERE (`entry` = 15589);

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8603.78,
        `position_y` = 1974.71,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8605.35,
        `position_y` = 1994.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8589.45,
        `position_y` = 2012.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8563.07,
        `position_y` = 2010.91,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8550.45,
        `position_y` = 1992.4,
        `position_z` = 100.172,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8554.34,
        `position_y` = 1972.1,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8565.43,
        `position_y` = 1961.39,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `entry` = 15726,
        `position_x` = -8588.68,
        `position_y` = 1957.96,
        `position_z` = 100.498,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8604.79,
        `position_y` = 1977.72,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8604.77,
        `position_y` = 1997.84,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8586.7,
        `position_y` = 2014.36,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8560.73,
        `position_y` = 2009.24,
        `position_z` = 100.312,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8549.13,
        `position_y` = 1989.69,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8555.0,
        `position_y` = 1969.07,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8567.55,
        `position_y` = 1959.6,
        `position_z` = 100.341,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 1,
        `entry` = 15726,
        `position_x` = -8591.76,
        `position_y` = 1960.18,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8584.18,
        `position_y` = 2015.21,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8558.46,
        `position_y` = 2007.34,
        `position_z` = 100.5,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8557.41,
        `position_y` = 1967.25,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8570.91,
        `position_y` = 1958.95,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8594.71,
        `position_y` = 1962.33,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8605.22,
        `position_y` = 1981.86,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 2,
        `entry` = 15726,
        `position_x` = -8602.66,
        `position_y` = 2000.3,
        `position_z` = 100.3,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8574.7,
        `position_y` = 1958.38,
        `position_z` = 100.22,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8597.28,
        `position_y` = 1964.75,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8605.61,
        `position_y` = 1984.79,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8601.55,
        `position_y` = 2002.83,
        `position_z` = 100.412,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8580.92,
        `position_y` = 2015.31,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8556.54,
        `position_y` = 2004.97,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8549.05,
        `position_y` = 1984.37,
        `position_z` = 100.22,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 3,
        `entry` = 15726,
        `position_x` = -8559.1,
        `position_y` = 1965.34,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8606.48,
        `position_y` = 1987.26,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8598.74,
        `position_y` = 2005.75,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8577.38,
        `position_y` = 2015.37,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8554.27,
        `position_y` = 2001.83,
        `position_z` = 100.167,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8550.04,
        `position_y` = 1980.84,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8560.64,
        `position_y` = 1963.64,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8578.72,
        `position_y` = 1957.53,
        `position_z` = 100.404,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 4,
        `entry` = 15726,
        `position_x` = -8599.99,
        `position_y` = 1968.16,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8562.93,
        `position_y` = 1962.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8583.31,
        `position_y` = 1956.97,
        `position_z` = 100.499,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8601.91,
        `position_y` = 1970.63,
        `position_z` = 100.263,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8606.08,
        `position_y` = 1990.23,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8595.29,
        `position_y` = 2009.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8573.63,
        `position_y` = 2014.62,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8552.32,
        `position_y` = 1998.95,
        `position_z` = 100.131,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 5,
        `entry` = 15726,
        `position_x` = -8550.86,
        `position_y` = 1978.12,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 6,
        `entry` = 15726,
        `position_x` = -8589.45,
        `position_y` = 2012.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 6,
        `entry` = 15726,
        `position_x` = -8554.34,
        `position_y` = 1972.1,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 7,
        `entry` = 15726,
        `position_x` = -8604.79,
        `position_y` = 1977.72,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 7,
        `entry` = 15726,
        `position_x` = -8555.0,
        `position_y` = 1969.07,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 8,
        `entry` = 15726,
        `position_x` = -8558.46,
        `position_y` = 2007.34,
        `position_z` = 100.5,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 8,
        `entry` = 15726,
        `position_x` = -8605.22,
        `position_y` = 1981.86,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 9,
        `entry` = 15726,
        `position_x` = -8580.92,
        `position_y` = 2015.31,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 9,
        `entry` = 15726,
        `position_x` = -8559.1,
        `position_y` = 1965.34,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 10,
        `entry` = 15726,
        `position_x` = -8577.38,
        `position_y` = 2015.37,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 10,
        `entry` = 15726,
        `position_x` = -8606.48,
        `position_y` = 1987.26,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 11,
        `entry` = 15726,
        `position_x` = -8595.29,
        `position_y` = 2009.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 11,
        `entry` = 15726,
        `position_x` = -8562.93,
        `position_y` = 1962.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 12,
        `entry` = 15726,
        `position_x` = -8589.45,
        `position_y` = 2012.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 12,
        `entry` = 15726,
        `position_x` = -8554.34,
        `position_y` = 1972.1,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 12,
        `entry` = 15726,
        `position_x` = -8603.78,
        `position_y` = 1974.71,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 12,
        `entry` = 15726,
        `position_x` = -8605.35,
        `position_y` = 1994.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 13,
        `entry` = 15726,
        `position_x` = -8567.55,
        `position_y` = 1959.6,
        `position_z` = 100.341,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 13,
        `entry` = 15726,
        `position_x` = -8549.13,
        `position_y` = 1989.69,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 13,
        `entry` = 15726,
        `position_x` = -8591.76,
        `position_y` = 1960.18,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 13,
        `entry` = 15726,
        `position_x` = -8586.7,
        `position_y` = 2014.36,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 14,
        `entry` = 15726,
        `position_x` = -8584.18,
        `position_y` = 2015.21,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 14,
        `entry` = 15726,
        `position_x` = -8570.91,
        `position_y` = 1958.95,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 14,
        `entry` = 15726,
        `position_x` = -8602.66,
        `position_y` = 2000.3,
        `position_z` = 100.3,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 14,
        `entry` = 15726,
        `position_x` = -8594.71,
        `position_y` = 1962.33,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 15,
        `entry` = 15726,
        `position_x` = -8574.7,
        `position_y` = 1958.38,
        `position_z` = 100.22,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 15,
        `entry` = 15726,
        `position_x` = -8597.28,
        `position_y` = 1964.75,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 15,
        `entry` = 15726,
        `position_x` = -8559.1,
        `position_y` = 1965.34,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 15,
        `entry` = 15726,
        `position_x` = -8580.92,
        `position_y` = 2015.31,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 16,
        `entry` = 15726,
        `position_x` = -8599.99,
        `position_y` = 1968.16,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 16,
        `entry` = 15726,
        `position_x` = -8550.04,
        `position_y` = 1980.84,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 16,
        `entry` = 15726,
        `position_x` = -8606.48,
        `position_y` = 1987.26,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 16,
        `entry` = 15726,
        `position_x` = -8577.38,
        `position_y` = 2015.37,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 17,
        `entry` = 15726,
        `position_x` = -8552.32,
        `position_y` = 1998.95,
        `position_z` = 100.131,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 17,
        `entry` = 15726,
        `position_x` = -8562.93,
        `position_y` = 1962.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 17,
        `entry` = 15726,
        `position_x` = -8595.29,
        `position_y` = 2009.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 17,
        `entry` = 15726,
        `position_x` = -8606.08,
        `position_y` = 1990.23,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8589.45,
        `position_y` = 2012.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8554.34,
        `position_y` = 1972.1,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8603.78,
        `position_y` = 1974.71,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8605.35,
        `position_y` = 1994.27,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8565.43,
        `position_y` = 1961.39,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 18,
        `entry` = 15726,
        `position_x` = -8550.45,
        `position_y` = 1992.4,
        `position_z` = 100.172,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8549.13,
        `position_y` = 1989.69,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8591.76,
        `position_y` = 1960.18,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8586.7,
        `position_y` = 2014.36,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;


    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8604.79,
        `position_y` = 1977.72,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8555.0,
        `position_y` = 1969.07,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 19,
        `entry` = 15726,
        `position_x` = -8604.77,
        `position_y` = 1997.84,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8602.66,
        `position_y` = 2000.3,
        `position_z` = 100.3,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8570.91,
        `position_y` = 1958.95,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8584.18,
        `position_y` = 2015.21,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8548.82,
        `position_y` = 1987.05,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8605.22,
        `position_y` = 1981.86,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 20,
        `entry` = 15726,
        `position_x` = -8557.41,
        `position_y` = 1967.25,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8580.92,
        `position_y` = 2015.31,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8574.7,
        `position_y` = 1958.38,
        `position_z` = 100.22,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8556.54,
        `position_y` = 2004.97,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8559.1,
        `position_y` = 1965.34,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8601.55,
        `position_y` = 2002.83,
        `position_z` = 100.412,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 21,
        `entry` = 15726,
        `position_x` = -8605.61,
        `position_y` = 1984.79,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8599.99,
        `position_y` = 1968.16,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8606.48,
        `position_y` = 1987.26,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8560.64,
        `position_y` = 1963.64,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8550.04,
        `position_y` = 1980.84,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8554.27,
        `position_y` = 2001.83,
        `position_z` = 100.167,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 22,
        `entry` = 15726,
        `position_x` = -8577.38,
        `position_y` = 2015.37,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8550.86,
        `position_y` = 1978.12,
        `position_z` = 100.219,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8583.31,
        `position_y` = 1956.97,
        `position_z` = 100.499,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8601.91,
        `position_y` = 1970.63,
        `position_z` = 100.263,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8606.08,
        `position_y` = 1990.23,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8595.29,
        `position_y` = 2009.54,
        `position_z` = 100.221,
        `summonType` = 6,
        `summonTime` = 500;

    INSERT INTO `creature_summon_groups` SET
        `summonerId` = 15589,
        `groupId` = 23,
        `entry` = 15726,
        `position_x` = -8552.32,
        `position_y` = 1998.95,
        `position_z` = 100.131,
        `summonType` = 6,
        `summonTime` = 500;