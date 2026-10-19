SET @map_id = 530;
SET @positionx_min = -6930;
SET @positionx_max = 526;
SET @positiony_min = -15200;
SET @positiony_max = -9067;
SET @WorldMapAreaId_list = JSON_ARRAY(464, 471, 476);
SET @Points_of_Interest_list =  JSON_ARRAY('Exodar, Auctioneer','Exodar, bank','Exodar, Hippogryph Master','Exodar, Guild Master',
    'Exodar, Inn','Exodar, Mailbox','Exodar, Stable Master','Exodar, Weapon Master','Exodar, Druid Trainer','Exodar, Hunter Trainers',
    'Exodar, Mage Trainers','Exodar, Paladin Trainers','Exodar, Priest Trainers','Exodar, Shaman Trainer','Exodar, Warrior Trainers',
    'Exodar, Alchemist Trainers','Exodar, Blacksmithing Trainers','Exodar, Enchanters','Exodar, Engineering','Exodar, First Aid Trainer',
    'Exodar, Fishing Trainer','Exodar, Herbalist Trainer','Exodar Inscription','Exodar, Jewelcrafters','Exodar, Leatherworking',
    'Exodar, Mining Trainers','Exodar, Skinning Trainer','Exodar, Tailors','Exodar, Cook','Azure Watch, Innkeeper','Azure Watch, Stable Master',
    'Azure Watch, Hunter Trainer','Azure Watch, Mage Trainer','Azure Watch, Paladin Trainer','Azure Watch, Priest Trainer','Azure Watch, Shaman Trainer',
    'Azure Watch, Warrior Trainer','Azure Watch, Alchemist','Odesyus'' Landing, Blacksmith','Odesyus'' Landing, Cook','Azure Watch, Engineering Trainer',
    'Azure Watch, First Aid Trainer','Ammen Ford, Fisherwoman','Azure Watch, Herbalist','Stillpine Hold, Leatherworker','Azure Watch, Mining Trainer',
    'Stillpine Hold, Skinner','Odesyus'' Landing, Tailor','Exodar, Battlemasters','Arena Battlemaster Exodar');

SET @adtdimensions = 533.33333;
SET @adt_xshift = 18;
SET @adt_yshift = 34;
SET @map_id_new = 1;

-- points_of_interest is stated ABSOLUTELY, by ID -- 50 rows, the complete moved set.
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
    positionx = 5580,
    positiony = 6399.83
WHERE ID = 190;  -- Exodar, Auctioneer

UPDATE points_of_interest SET
    positionx = 5682,
    positiony = 6583.23
WHERE ID = 191;  -- Exodar, bank

UPDATE points_of_interest SET
    positionx = 5547,
    positiony = 6345.63
WHERE ID = 192;  -- Exodar, Hippogryph Master

UPDATE points_of_interest SET
    positionx = 5501,
    positiony = 6503.33
WHERE ID = 193;  -- Exodar, Guild Master

UPDATE points_of_interest SET
    positionx = 5839,
    positiony = 6437.13
WHERE ID = 194;  -- Exodar, Inn

UPDATE points_of_interest SET
    positionx = 5687,
    positiony = 6525.73
WHERE ID = 195;  -- Exodar, Mailbox

UPDATE points_of_interest SET
    positionx = 5808,
    positiony = 6429.63
WHERE ID = 196;  -- Exodar, Stable Master

UPDATE points_of_interest SET
    positionx = 5386,
    positiony = 6503.33
WHERE ID = 197;  -- Exodar, Weapon Master

UPDATE points_of_interest SET
    positionx = 5328,
    positiony = 6637.83
WHERE ID = 198;  -- Exodar, Druid Trainer

UPDATE points_of_interest SET
    positionx = 5361,
    positiony = 6575.13
WHERE ID = 199;  -- Exodar, Hunter Trainers

UPDATE points_of_interest SET
    positionx = 5552,
    positiony = 6573.43
WHERE ID = 200;  -- Exodar, Mage Trainers

UPDATE points_of_interest SET
    positionx = 5422,
    positiony = 6656.33
WHERE ID = 201;  -- Exodar, Paladin Trainers

UPDATE points_of_interest SET
    positionx = 5625,
    positiony = 6647.23
WHERE ID = 202;  -- Exodar, Priest Trainers

UPDATE points_of_interest SET
    positionx = 5752,
    positiony = 6740.63
WHERE ID = 203;  -- Exodar, Shaman Trainer

UPDATE points_of_interest SET
    positionx = 5406,
    positiony = 6484.23
WHERE ID = 204;  -- Exodar, Warrior Trainers

UPDATE points_of_interest SET
    positionx = 5557,
    positiony = 6768.53
WHERE ID = 205;  -- Exodar, Alchemist Trainers

UPDATE points_of_interest SET
    positionx = 5359,
    positiony = 6419.83
WHERE ID = 206;  -- Exodar, Blacksmithing Trainers

UPDATE points_of_interest SET
    positionx = 5713,
    positiony = 6639.63
WHERE ID = 207;  -- Exodar, Enchanters

UPDATE points_of_interest SET
    positionx = 5341,
    positiony = 6489.53
WHERE ID = 208;  -- Exodar, Engineering

UPDATE points_of_interest SET
    positionx = 5834,
    positiony = 6655.63
WHERE ID = 209;  -- Exodar, First Aid Trainer

UPDATE points_of_interest SET
    positionx = 5874,
    positiony = 6746.23
WHERE ID = 210;  -- Exodar, Fishing Trainer

UPDATE points_of_interest SET
    positionx = 5550,
    positiony = 6773.33
WHERE ID = 211;  -- Exodar, Herbalist Trainer

UPDATE points_of_interest SET
    positionx = 5713,
    positiony = 6648.33
WHERE ID = 212;  -- Exodar Inscription

UPDATE points_of_interest SET
    positionx = 5815,
    positiony = 6589.33
WHERE ID = 213;  -- Exodar, Jewelcrafters

UPDATE points_of_interest SET
    positionx = 5462,
    positiony = 6364.83
WHERE ID = 214;  -- Exodar, Leatherworking

UPDATE points_of_interest SET
    positionx = 5377,
    positiony = 6438.63
WHERE ID = 215;  -- Exodar, Mining Trainers

UPDATE points_of_interest SET
    positionx = 5463,
    positiony = 6371.53
WHERE ID = 216;  -- Exodar, Skinning Trainer

UPDATE points_of_interest SET
    positionx = 5508,
    positiony = 6389.53
WHERE ID = 217;  -- Exodar, Tailors

UPDATE points_of_interest SET
    positionx = 5802,
    positiony = 6478.83
WHERE ID = 218;  -- Exodar, Cook

UPDATE points_of_interest SET
    positionx = 5473,
    positiony = 5665.93
WHERE ID = 219;  -- Azure Watch, Innkeeper

UPDATE points_of_interest SET
    positionx = 5454,
    positiony = 5640.63
WHERE ID = 220;  -- Azure Watch, Stable Master

UPDATE points_of_interest SET
    positionx = 5397,
    positiony = 5606.83
WHERE ID = 221;  -- Azure Watch, Hunter Trainer

UPDATE points_of_interest SET
    positionx = 5451,
    positiony = 5603.33
WHERE ID = 222;  -- Azure Watch, Mage Trainer

UPDATE points_of_interest SET
    positionx = 5462,
    positiony = 5664.83
WHERE ID = 223;  -- Azure Watch, Paladin Trainer

UPDATE points_of_interest SET
    positionx = 5469,
    positiony = 5654.63
WHERE ID = 224;  -- Azure Watch, Priest Trainer

UPDATE points_of_interest SET
    positionx = 5438,
    positiony = 5677.33
WHERE ID = 225;  -- Azure Watch, Shaman Trainer

UPDATE points_of_interest SET
    positionx = 5435,
    positiony = 5596.93
WHERE ID = 226;  -- Azure Watch, Warrior Trainer

UPDATE points_of_interest SET
    positionx = 5409,
    positiony = 5663.73
WHERE ID = 227;  -- Azure Watch, Alchemist

UPDATE points_of_interest SET
    positionx = 4874,
    positiony = 5746.43
WHERE ID = 228;  -- Odesyus' Landing, Blacksmith

UPDATE points_of_interest SET
    positionx = 4892,
    positiony = 5733.23
WHERE ID = 229;  -- Odesyus' Landing, Cook

UPDATE points_of_interest SET
    positionx = 5443,
    positiony = 5662.93
WHERE ID = 230;  -- Azure Watch, Engineering Trainer

UPDATE points_of_interest SET
    positionx = 5401,
    positiony = 5663.43
WHERE ID = 231;  -- Azure Watch, First Aid Trainer

UPDATE points_of_interest SET
    positionx = 5334,
    positiony = 5147.93
WHERE ID = 232;  -- Ammen Ford, Fisherwoman

UPDATE points_of_interest SET
    positionx = 5411,
    positiony = 5673.83
WHERE ID = 233;  -- Azure Watch, Herbalist

UPDATE points_of_interest SET
    positionx = 6158,
    positiony = 5810.93
WHERE ID = 234;  -- Stillpine Hold, Leatherworker

UPDATE points_of_interest SET
    positionx = 5421,
    positiony = 5640.23
WHERE ID = 235;  -- Azure Watch, Mining Trainer

UPDATE points_of_interest SET
    positionx = 6169,
    positiony = 5816.83
WHERE ID = 236;  -- Stillpine Hold, Skinner

UPDATE points_of_interest SET
    positionx = 4889,
    positiony = 5746.63
WHERE ID = 237;  -- Odesyus' Landing, Tailor

UPDATE points_of_interest SET
    positionx = 5599.46,
    positiony = 6761.23
WHERE ID = 263;  -- Exodar, Battlemasters

UPDATE points_of_interest SET
    positionx = 5874.6,
    positiony = 6444.93
WHERE ID = 264;  -- Arena Battlemaster Exodar

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
        SELECT QuestID
        FROM quest_poi
        WHERE JSON_CONTAINS(@WorldMapAreaId_list, CAST(WorldMapAreaId AS JSON))
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
