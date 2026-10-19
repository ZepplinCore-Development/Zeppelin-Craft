SET @map_id = 530;
SET @positionx_min = 4800;
SET @positionx_max = 13866.666;
SET @positiony_min = -9566.661;
SET @positiony_max = -4266.666;
SET @WorldMapAreaId_list = JSON_ARRAY(462, 463, 480, 499);
SET @Points_of_Interest_list = JSON_ARRAY('Silvermoon City, Weapon Master', 'Silvermoon City, Warlock Trainers', 'Silvermoon City, Tailoring',
        'Silvermoon City, Stable Master', 'Silvermoon City, Skinning', 'Silvermoon City, Rogue Trainer',
        'Silvermoon City, Priest Trainer', 'Silvermoon City, Paladin Trainer', 'Silvermoon City, Mining',
        'Silvermoon City, Mana Loom', 'Silvermoon City, Mailbox', 'Silvermoon City, Mage Trainer',
        'Silvermoon City, Leatherworking', 'Silvermoon City, Jewelcrafting', 'Silvermoon City, Inn',
        'Silvermoon City, Hunter Trainer', 'Silvermoon City, Herbalism', 'Silvermoon City, Guild House',
        'Silvermoon City, Flight Master', 'Silvermoon City, Fishing', 'Silvermoon City, First Aid',
        'Silvermoon City, Engineering', 'Silvermoon City, Enchanting', 'Silvermoon City, Druid Trainer',
        'Silvermoon City, Cooking', 'Silvermoon City, Blacksmithing', 'Silvermoon City, Battlemasters',
        'Silvermoon City, Bank', 'Silvermoon City, Auction House', 'Silvermoon City, Alchemy',
        'Silvermoon City Inscription', 'Saltheril''s Haven, Tailor', 'Saltheril''s Haven, Herbalist',
        'Saltheril''s Haven, Enchanter', 'Saltheril''s Haven, Alchemist', 'Farstrider Retreat, Blacksmith',
        'Falconwing Square, Warlock Trainer', 'Falconwing Square, Stable Master', 'Falconwing Square, Rogue Trainer',
        'Falconwing Square, Priest Trainer', 'Falconwing Square, Paladin Trainer', 'Falconwing Square, Mage Trainer',
        'Falconwing Square, Jewelcrafter', 'Falconwing Square, Innkeeper', 'Falconwing Square, Hunter Trainer',
        'Falconwing Square, First Aid Trainer', 'Falconwing Square, Cook', 'Eversong Woods, Skinner',
        'Eversong Woods, Leatherworker');

SET @adtdimensions = 533.33333;
SET @adt_xshift = -4;
SET @adt_yshift = 4;
SET @map_id_new = 0;

-- points_of_interest is stated ABSOLUTELY, by ID -- 52 rows, the complete moved set.
--
-- Every other statement in this file self-disarms: it guards on `map = @map_id` and
-- SETs `map = @map_id_new`, so a re-run matches nothing. points_of_interest has NO map
-- column, leaving only the coordinate BETWEEN window as a guard -- and that guard is
-- only self-disarming when the shift EXCEEDS the window. Azuremyst's does (+9600 vs
-- 7456); Quel'thalas's does not (-2133 vs 9067), so 48 of its rows would shift a second
-- time on every re-run under the F-205 universal cascade.
--
-- Rather than depend on that arithmetic holding -- for either zone, or after any future
-- change to the shift or window -- the final positions are stated outright. Absolute
-- values are idempotent by construction: no guard, no ordering dependency, and the same
-- result on a fresh rebuild as on the thousandth re-run.
--
-- Regenerate by re-running the capture query in the F-036 Joplin note if the move
-- parameters ever change.

UPDATE points_of_interest SET
    positionx = 7514.71,
    positiony = -5002.24
WHERE ID = 349;  -- Silvermoon City, Auction House

UPDATE points_of_interest SET
    positionx = 7549.84,
    positiony = -5385.61
WHERE ID = 350;  -- Silvermoon City, Auction House

UPDATE points_of_interest SET
    positionx = 7391.71,
    positiony = -5082.07
WHERE ID = 351;  -- Silvermoon City, Bank

UPDATE points_of_interest SET
    positionx = 7659.35,
    positiony = -5354.73
WHERE ID = 352;  -- Silvermoon City, Bank

UPDATE points_of_interest SET
    positionx = 7246.13,
    positiony = -5032.67
WHERE ID = 353;  -- Silvermoon City, Flight Master

UPDATE points_of_interest SET
    positionx = 7351.4,
    positiony = -5211.77
WHERE ID = 354;  -- Silvermoon City, Guild House

UPDATE points_of_interest SET
    positionx = 7539.82,
    positiony = -5236.97
WHERE ID = 355;  -- Silvermoon City, Inn

UPDATE points_of_interest SET
    positionx = 7427.79,
    positiony = -5083.27
WHERE ID = 356;  -- Silvermoon City, Inn

UPDATE points_of_interest SET
    positionx = 7610.26,
    positiony = -5333.06
WHERE ID = 357;  -- Silvermoon City, Mailbox

UPDATE points_of_interest SET
    positionx = 7770.47,
    positiony = -5270.83
WHERE ID = 358;  -- Silvermoon City, Stable Master

UPDATE points_of_interest SET
    positionx = 7706.65,
    positiony = -5372.5
WHERE ID = 359;  -- Silvermoon City, Weapon Master

UPDATE points_of_interest SET
    positionx = 7717.34,
    positiony = -5431.96
WHERE ID = 360;  -- Silvermoon City, Battlemasters

UPDATE points_of_interest SET
    positionx = 7567.05,
    positiony = -5132.19
WHERE ID = 361;  -- Silvermoon City, Druid Trainer

UPDATE points_of_interest SET
    positionx = 7800.89,
    positiony = -5278.38
WHERE ID = 362;  -- Silvermoon City, Hunter Trainer

UPDATE points_of_interest SET
    positionx = 7865.01,
    positiony = -4973.25
WHERE ID = 363;  -- Silvermoon City, Mage Trainer

UPDATE points_of_interest SET
    positionx = 7717.56,
    positiony = -5379.3
WHERE ID = 364;  -- Silvermoon City, Paladin Trainer

UPDATE points_of_interest SET
    positionx = 7803.65,
    positiony = -4925.08
WHERE ID = 365;  -- Silvermoon City, Priest Trainer

UPDATE points_of_interest SET
    positionx = 7607.26,
    positiony = -5237.52
WHERE ID = 366;  -- Silvermoon City, Rogue Trainer

UPDATE points_of_interest SET
    positionx = 7668.43,
    positiony = -5189.45
WHERE ID = 367;  -- Silvermoon City, Warlock Trainers

UPDATE points_of_interest SET
    positionx = 7874.27,
    positiony = -5079.9
WHERE ID = 368;  -- Silvermoon City, Alchemy

UPDATE points_of_interest SET
    positionx = 7707.89,
    positiony = -5234.25
WHERE ID = 369;  -- Silvermoon City, Blacksmithing

UPDATE points_of_interest SET
    positionx = 7444.6,
    positiony = -5107.39
WHERE ID = 370;  -- Silvermoon City, Cooking

UPDATE points_of_interest SET
    positionx = 7822.84,
    positiony = -5111.42
WHERE ID = 371;  -- Silvermoon City, Enchanting

UPDATE points_of_interest SET
    positionx = 7693.59,
    positiony = -5189.97
WHERE ID = 372;  -- Silvermoon City, Engineering

UPDATE points_of_interest SET
    positionx = 7458.82,
    positiony = -5209.74
WHERE ID = 373;  -- Silvermoon City, First Aid

UPDATE points_of_interest SET
    positionx = 7471.67,
    positiony = -5195.11
WHERE ID = 374;  -- Silvermoon City, Fishing

UPDATE points_of_interest SET
    positionx = 7867.07,
    positiony = -5075.7
WHERE ID = 375;  -- Silvermoon City, Herbalism

UPDATE points_of_interest SET
    positionx = 7822.96,
    positiony = -5105.02
WHERE ID = 376;  -- Silvermoon City Inscription

UPDATE points_of_interest SET
    positionx = 7420.13,
    positiony = -5368.56
WHERE ID = 377;  -- Silvermoon City, Jewelcrafting

UPDATE points_of_interest SET
    positionx = 7356.45,
    positiony = -5297.37
WHERE ID = 378;  -- Silvermoon City, Leatherworking

UPDATE points_of_interest SET
    positionx = 7676.67,
    positiony = -5225.08
WHERE ID = 379;  -- Silvermoon City, Mining

UPDATE points_of_interest SET
    positionx = 7379.18,
    positiony = -5292.66
WHERE ID = 380;  -- Silvermoon City, Skinning

UPDATE points_of_interest SET
    positionx = 7599.13,
    positiony = -4953.28
WHERE ID = 381;  -- Silvermoon City, Tailoring

UPDATE points_of_interest SET
    positionx = 7613.56,
    positiony = -4940.37
WHERE ID = 382;  -- Silvermoon City, Mana Loom

UPDATE points_of_interest SET
    positionx = 7343.5,
    positiony = -4725.83
WHERE ID = 383;  -- Falconwing Square, Innkeeper

UPDATE points_of_interest SET
    positionx = 7354.33,
    positiony = -4697.16
WHERE ID = 384;  -- Falconwing Square, Stable Master

UPDATE points_of_interest SET
    positionx = 7395.86,
    positiony = -4731.18
WHERE ID = 385;  -- Falconwing Square, Hunter Trainer

UPDATE points_of_interest SET
    positionx = 7329.01,
    positiony = -4720.28
WHERE ID = 386;  -- Falconwing Square, Mage Trainer

UPDATE points_of_interest SET
    positionx = 7382.67,
    positiony = -4737.7
WHERE ID = 387;  -- Falconwing Square, Paladin Trainer

UPDATE points_of_interest SET
    positionx = 7333.4,
    positiony = -4711.01
WHERE ID = 388;  -- Falconwing Square, Priest Trainer

UPDATE points_of_interest SET
    positionx = 7400.89,
    positiony = -4742.7
WHERE ID = 389;  -- Falconwing Square, Rogue Trainer

UPDATE points_of_interest SET
    positionx = 7334.29,
    positiony = -4729.49
WHERE ID = 390;  -- Falconwing Square, Warlock Trainer

UPDATE points_of_interest SET
    positionx = 6527.92,
    positiony = -4233.76
WHERE ID = 391;  -- Saltheril's Haven, Alchemist

UPDATE points_of_interest SET
    positionx = 6853.12,
    positiony = -5285.54
WHERE ID = 392;  -- Farstrider Retreat, Blacksmith

UPDATE points_of_interest SET
    positionx = 7361.5,
    positiony = -4746.1
WHERE ID = 393;  -- Falconwing Square, Cook

UPDATE points_of_interest SET
    positionx = 6524.16,
    positiony = -4233.45
WHERE ID = 394;  -- Saltheril's Haven, Enchanter

UPDATE points_of_interest SET
    positionx = 7346.18,
    positiony = -4746.74
WHERE ID = 395;  -- Falconwing Square, First Aid Trainer

UPDATE points_of_interest SET
    positionx = 6545.33,
    positiony = -4196
WHERE ID = 396;  -- Saltheril's Haven, Herbalist

UPDATE points_of_interest SET
    positionx = 7351.47,
    positiony = -4743.49
WHERE ID = 397;  -- Falconwing Square, Jewelcrafter

UPDATE points_of_interest SET
    positionx = 7230.37,
    positiony = -4997.4
WHERE ID = 398;  -- Eversong Woods, Leatherworker

UPDATE points_of_interest SET
    positionx = 7229.49,
    positiony = -5001.28
WHERE ID = 399;  -- Eversong Woods, Skinner

UPDATE points_of_interest SET
    positionx = 6547.37,
    positiony = -4193.72
WHERE ID = 400;  -- Saltheril's Haven, Tailor

UPDATE playercreateinfo
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE waypoints w
SET
    w.position_x = w.position_x + (@adt_xshift * @adtdimensions),
    w.position_y = w.position_y + (@adt_yshift * @adtdimensions)
WHERE
    w.position_x BETWEEN @positionx_min AND @positionx_max AND
    w.position_y BETWEEN @positiony_min AND @positiony_max AND
    EXISTS (
        SELECT 1
        FROM creature_addon
        INNER JOIN creature_template ct ON w.entry = ct.entry
        INNER JOIN creature cr ON ct.entry = cr.id
        WHERE
          cr.map = @map_id
    );

UPDATE waypoint_data wd
SET
    wd.position_x = wd.position_x + (@adt_xshift * @adtdimensions),
    wd.position_y = wd.position_y + (@adt_yshift * @adtdimensions)
WHERE
    wd.position_x BETWEEN @positionx_min AND @positionx_max AND
    wd.position_y BETWEEN @positiony_min AND @positiony_max AND
    EXISTS (
        SELECT 1
        FROM creature_addon
        INNER JOIN creature ON creature_addon.guid = creature.guid
        INNER JOIN creature_template ON creature.id = creature_template.entry
        WHERE
            creature.map = @map_id
            AND creature_addon.path_id = wd.id
    );

UPDATE spell_target_position
SET
    mapid = @map_id_new,
    positionx = positionx + (@adt_xshift * @adtdimensions),
    positiony = positiony + (@adt_yshift * @adtdimensions)
WHERE
    mapid = @map_id AND
    positionx BETWEEN @positionx_min AND @positionx_max AND
    positiony BETWEEN @positiony_min AND @positiony_max;

UPDATE game_tele
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE game_graveyard
SET
    map = @map_id_new,
    x = x + (@adt_xshift * @adtdimensions),
    y = y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    x BETWEEN @positionx_min AND @positionx_max AND
    y BETWEEN @positiony_min AND @positiony_max;

UPDATE creature
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE quest_poi_points
SET
    X = X + (@adt_xshift * @adtdimensions),
    Y = Y + (@adt_yshift * @adtdimensions)
WHERE
    X BETWEEN @positionx_min AND @positionx_max AND
    Y BETWEEN @positiony_min AND @positiony_max AND
    QuestID IN (
        -- MapID is the replay guard. Quel'thalas shifts x by only -2133 inside a
        -- 9067-wide window, so unlike Azuremyst the coordinate BETWEEN above does
        -- NOT stop a moved row matching again — 1454 rows would shift a second
        -- time. The UPDATE below flips quest_poi.MapID to @map_id_new, so on any
        -- re-run this subquery is empty and the shift cannot repeat.
        SELECT QuestID
        FROM quest_poi
        WHERE MapID = @map_id
          AND JSON_CONTAINS(@WorldMapAreaId_list, CAST(WorldMapAreaId AS JSON))
    );

UPDATE quest_poi
SET
    MAPID = @map_id_new
WHERE
    MAPID = @map_id AND
   	JSON_CONTAINS(@WorldMapAreaId_list, CAST(WorldMapAreaId AS JSON));

UPDATE areatrigger
SET
    map = @map_id_new,
    x = x + (@adt_xshift * @adtdimensions),
    y = y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    x BETWEEN @positionx_min AND @positionx_max AND
    y BETWEEN @positiony_min AND @positiony_max;

UPDATE areatrigger_teleport
SET
    target_map = @map_id_new,
    target_position_x = target_position_x + (@adt_xshift * @adtdimensions),
    target_position_y = target_position_y + (@adt_yshift * @adtdimensions)
WHERE
    target_map = @map_id AND
    target_position_x BETWEEN @positionx_min AND @positionx_max AND
    target_position_y BETWEEN @positiony_min AND @positiony_max;

UPDATE gameobject
SET
    map = @map_id_new,
    position_x = position_x + (@adt_xshift * @adtdimensions),
    position_y = position_y + (@adt_yshift * @adtdimensions)
WHERE
    map = @map_id AND
    position_x BETWEEN @positionx_min AND @positionx_max AND
    position_y BETWEEN @positiony_min AND @positiony_max;
