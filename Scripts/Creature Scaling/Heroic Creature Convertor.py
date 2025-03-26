import mysql.connector
import random
import os

# Define the actual column names you want to fetch and modify
columns = [
    "difficulty_entry_1", 
    "difficulty_entry_2", 
    "name", 
    "subname", 
    "minlevel", 
    "maxlevel", 
    "DamageModifier", 
    "lootid", 
    "AIName", 
    "HealthModifier", 
    "ScriptName"
]

class heroic:
    boss_health_min = 5.8
    boss_health_max = 6.5
    boss_damage_min = 4.9
    boss_damage_max = 5.1

    rare_health_min = 4.8
    rare_health_max = 5.5
    rare_damage_min = 3.9
    rare_damage_max = 4.1

    elite_health_min = 2.8
    elite_health_max = 3.5
    elite_damage_min = 1.9
    elite_damage_max = 2.1

    normal_health_min = 1.8
    normal_health_max = 2.5
    normal_damage_min = 0.9
    normal_damage_max = 1.1

class mythic:
    boss_health_min = 7.8
    boss_health_max = 8.5
    boss_damage_min = 6.9
    boss_damage_max = 7.1

    rare_health_min = 6.8
    rare_health_max = 7.5
    rare_damage_min = 5.9
    rare_damage_max = 6.1

    elite_health_min = 3.8
    elite_health_max = 4.5
    elite_damage_min = 2.9
    elite_damage_max = 3.1

    normal_health_min = 2.8
    normal_health_max = 3.5
    normal_damage_min = 1.9
    normal_damage_max = 2.1

# Function to connect to the database
def connect_to_database():
    db_config = {
        "host": "192.168.0.99",
        "user": "keira",
        "password": "slipknot9",
        "database": "acore_world"
    }
    return mysql.connector.connect(**db_config)

def fetch_original_row(cursor, entry_value):
    # Construct query string
    column_names = ", ".join(columns)
    query = f"SELECT {column_names} FROM creature_template WHERE entry = %s;"
    
    # Execute query
    cursor.execute(query, (entry_value,))
    result = cursor.fetchone()

    # Return a dictionary with column names as keys
    if result:
        result = dict(zip(columns, result))
        return result
    else:
        return None  # Return None if no result is found

# Function to modify the row based on parameters
def modify_original_row(original_row, challenge, is_mythic):
    # Modify the 'name' field
    creature_name = original_row["name"].replace("'", "''")
    prefix = "Mythic " if is_mythic else "Heroic "
    original_row["name"] = f"{prefix}{creature_name}"
    prefixed_name = original_row["name"]

    # Modify the 'subname' field if it exists
    if original_row["subname"]:
        original_row["subname"] = original_row["subname"].replace("'", "''")

    # Modify specific row fields
    original_row["difficulty_entry_1"] = 0  # Reset Difficulty Entry 1
    original_row["difficulty_entry_2"] = 0  # Reset Difficulty Entry 2
    original_row["AIName"] = ""  # Blank AIName
    original_row["ScriptName"] = ""  # Blank NPC Script
    original_row["minlevel"] = 60  # Set minimum level
    original_row["maxlevel"] = 60  # Set maximum level

    # Base configuration for levels and loot
    level = 63 if challenge == "boss" else 60
    original_row["minlevel"] = level
    original_row["maxlevel"] = level

    # Assign loot table if applicable
    if challenge == "boss" and is_mythic:
        original_row["lootid"] = mythiclootid

    # Apply challenge modifiers
    apply_challenge_modifiers(original_row, challenge, is_mythic)
    modified_row = original_row

    return modified_row, creature_name, prefixed_name

def apply_challenge_modifiers(original_row, challenge, is_mythic):
    # Define challenge tiers with their corresponding attribute names
    challenge_tiers = {
        "boss": ("boss_damage_min", "boss_damage_max", "boss_health_min", "boss_health_max"),
        "elite": ("elite_damage_min", "elite_damage_max", "elite_health_min", "elite_health_max"),
        "rare": ("rare_damage_min", "rare_damage_max", "rare_health_min", "rare_health_max"),
        "normal": ("normal_damage_min", "normal_damage_max", "normal_health_min", "normal_health_max"),
    }

    # Get the appropriate difficulty class
    difficulty = mythic if is_mythic else heroic

    # Apply modifiers if challenge is valid
    if challenge in challenge_tiers:
        damage_min, damage_max, health_min, health_max = challenge_tiers[challenge]
        
        # Set damage modifier
        original_row["DamageModifier"] = round(
            random.uniform(
                getattr(difficulty, damage_min),
                getattr(difficulty, damage_max)
            ), 2
        )
        
        # Set health modifier
        original_row["HealthModifier"] = round(
            random.uniform(
                getattr(difficulty, health_min),
                getattr(difficulty, health_max)
            ), 2
        )

        # Special handling for bosses
        if challenge == "boss":
            original_row["minlevel"] = 63
            original_row["maxlevel"] = 63
            if is_mythic and "lootid" in original_row:
                original_row["lootid"] = mythiclootid

    return original_row

# Function to generate SQL queries
def generate_sql_queries(modified_row, new_entry, entry_value, is_mythic, map_value, creature_name, prefixed_name):
    """Generate queries to duplicate and update a creature template"""
    queries = []

    # 0. Add creature name as comment header
    queries.append(f"-- Processing: {prefixed_name}")
    queries.append("")
    
    # 1. Clean up existing entry
    queries.append(f"-- Delete Creature Template for {prefixed_name}")
    queries.append(f"DELETE FROM `creature_template` WHERE entry = {new_entry};")
    queries.append("")
    
    # 2. Duplicate the entire original creature with new ID
    queries.append(f"-- Create creature template for {prefixed_name} from a copy of {creature_name}")
    queries.append("CREATE TEMPORARY TABLE `temp_creature` LIKE `creature_template`;")
    queries.append(f"INSERT INTO `temp_creature` SELECT * FROM `creature_template` WHERE `entry` = {entry_value};")
    queries.append(f"UPDATE `temp_creature` SET `entry` = {new_entry};")
    queries.append("INSERT INTO `creature_template` SELECT * FROM `temp_creature`;")
    queries.append(f"DROP TEMPORARY TABLE `temp_creature`;")
    queries.append("")

    # 3. Build UPDATE query using only our modified columns
    update_fields = []
    for col in columns:  # Using your predefined columns list
        value = modified_row[col]  # Direct access since we control these fields
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        elif isinstance(value, str):
            value.replace("'", "''")
            value.replace("'''", "")
            update_fields.append(f"    `{col}` = '{value}'")
        else:
            update_fields.append(f"    `{col}` = {value}")
    queries.append(f"-- Overide the values for {prefixed_name}")
    queries.append("UPDATE `creature_template` SET")
    queries.append(",\n".join(update_fields))
    queries.append(f"WHERE `entry` = {new_entry};")
    queries.append("")
    
    # 4. Update original creature's difficulty entry
    difficulty_field = "difficulty_entry_2" if is_mythic else "difficulty_entry_1"
    queries.append(f"-- Link {creature_name} to {prefixed_name}")
    queries.append(f"UPDATE `creature_template`")
    queries.append(f"SET `{difficulty_field}` = {new_entry}")
    queries.append(f"WHERE `entry` = {entry_value};")
    queries.append("")
    
    # 5. Update spawn masks
    queries.append(f"-- Update {creature_name} spawn masks for the dungeon map")
    queries.append(f"UPDATE `creature`")
    queries.append(f"SET `spawnMask` = 7")
    queries.append(f"WHERE `id1` = {entry_value} AND `map` = {map_value};")
    queries.append("")

    return queries

# Main function to execute queries
def execute_queries(entry_value, new_entry, challenge, is_mythic, map_value):
    """Execute database operations for creating heroic/mythic creature templates.
    
    Args:
        entry_value: Original creature entry ID
        new_entry: New entry ID to use for the heroic/mythic version
        challenge: Creature type ("boss", "elite", "rare", "normal")
        is_mythic: Boolean flag for mythic difficulty
        map_value: Map ID for spawn mask updates
    """
    conn = None
    try:
        # Establish database connection
        conn = connect_to_database()
        cursor = conn.cursor()

        # 1. Fetch original creature data
        original_row = fetch_original_row(cursor, entry_value)
        if not original_row:
            print(f"Warning: No creature found with entry {entry_value}")
            return

        # 2. Prepare modified creature data
        modified_row, creature_name, prefixed_name = modify_original_row(original_row, challenge, is_mythic)

        # 3. Generate and SQL queries
        queries = generate_sql_queries(modified_row, new_entry, entry_value,is_mythic, map_value, creature_name, prefixed_name)

        # 3. Print SQL queries
        print_queries_and_save(queries)

    except mysql.connector.Error as db_err:
        print(f"Database error processing entry {entry_value}: {db_err}")
    except Exception as err:
        print(f"Unexpected error processing entry {entry_value}: {err}")
    finally:
        if conn and conn.is_connected():
            conn.close()

def print_queries_and_save(queries, filename="zz_heroic_and_mythic_creatures.sql", first_call=False):
    """
    Print the generated SQL queries and append them to an SQL file.
    
    Args:
        queries (list): List of SQL query strings
        filename (str): Name of the output SQL file
        first_call (bool): Whether this is the first call (writes header)
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(script_dir, filename)
    
    # Print each query to console
    for query in queries:
        print(query)
    
    # Save queries to file
    try:
        mode = 'w' if first_call else 'a'  # Overwrite on first call, append thereafter
        
        with open(output_path, mode, encoding='utf-8') as f:
            if first_call:
                f.write("-- SQL queries generated automatically\n")
                f.write("-- Created by creature cloning script\n\n")
            
            for query in queries:
                f.write(query + "\n")
                
        if first_call:
            print(f"\n=== Created new SQL file: {output_path} ===")
    except Exception as e:
        print(f"\n!!! Error saving queries to file: {e} !!!")
    
# Function to search 'creature' table and print the update query
def search_and_print_update_creature_table(entry_value, map_value):
    try:
        # Update 'spawnMask' field to 7 for entries containing the original creature 'entry'
        update_spawn_mask_query = f"UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = {entry_value}) AND (`map` = {map_value});"

        # Output the SQL query for updating the 'spawnMask' field
        print(update_spawn_mask_query)

    except Exception as err:
        print(f"Error: {err}")

# Define constants for data attributes
entry = 0
boss = 1
rare = 2
elite = 3
normal = 4
loot = 5
mythicloot = 6
map = 7

# Create a dictionary of dictionaries to store the data
data = {
    "Ragefire_Chasm": {
        entry: 9100000,
        boss: [11519, 11518, 11517, 11520, 17830],
        rare: [],
        elite: [11320, 11321, 11319, 11318, 11322, 11323, 11324],
        normal: [11834, 8996],
        loot: 9100400,
        mythicloot: 9100500,
        map: 389 
    },
    "Wailing_Caverns": {
        entry: 9100100,
        boss: [3653, 3671, 3669, 3670, 3673, 3654, 3674, 5775],
        rare: [5912],
        elite: [5048, 5056, 3637, 5762, 3636, 5761, 5756, 5755, 3678, 3840, 3640, 5763],
        normal: [8886, 5053, 5055, 3679],
        loot: 9100400,
        mythicloot: 9100500,
        map: 43 
    },
    "The_Deadmines": {
        entry: 9100200,
        boss: [639, 647, 645, 1763, 646, 643, 642, 644],
        rare: [3586],
        elite: [636, 1732, 3947, 4417, 4418, 1731, 622, 641, 2520, 1729, 634, 1725, 657],
        normal: [4416, 598, 3450],
        loot: 9100400,
        mythicloot: 9100500,
        map: 36 
    },
    "Shadowfang_Keep": {
        entry: 9100300,
        boss: [3914, 3886, 3887, 4278, 4279, 3872, 4274, 3927, 4275],
        rare: [],
        elite: [3861, 3868, 3849, 3864, 3875, 3863, 3865, 3855, 3857, 3853, 3859, 3851, 3854, 3862, 2529, 3850, 3873, 3866, 3877],
        normal: [4627, 4444, 4958, 5097, 5058],
        loot: 9100400,
        mythicloot: 9100500,
        map: 33 
    },
    "The_Stockade": {
        entry: 9100400,
        boss: [1696, 1663, 1720, 1666, 1717, 1716],
        rare: [],
        elite: [1706, 1707, 1708, 1711, 1715],
        normal: [],
        loot: 9100400,
        mythicloot: 9100500,
        map: 34 
    },
    "Blackfathom_Deeps": {
        entry: 9100500,
        boss: [4829, 12876, 6243, 12902, 4830, 4832, 4887, 4831],
        rare: [],
        elite: [4821, 4815, 4818, 4807, 4812, 4809, 4822, 4798, 4799, 4827, 4978, 4825, 4823, 4819, 4820, 4811, 4814, 4810, 4813, 4824, 4805],
        normal: [6047, 4787, 8996, 4977, 6729],
        loot: 9100400,
        mythicloot: 9100500,
        map: 48 
    },
    "Gnomeregan": {
        entry: 9100600,
        boss: [6229, 6235, 7361, 7800, 7079],
        rare: [6228],
        elite: [6232, 7998, 6206, 6211, 6215, 6219, 6212, 6392, 6407, 6391, 6220, 6329, 6218, 6223, 6234, 6233, 6226, 6227, 6225, 6230],
        normal: [7915, 9676, 7849, 6222, 6224, 7603, 7850, 7266, 8035, 6207, 7738, 7897],
        loot: 9100400,
        mythicloot: 9100500,
        map: 90 
    },
    "Razorfen_Kraul": {
        entry: 9100700,
        boss: [4422, 4424, 4421, 4428, 4420, 6168],
        rare: [4425, 4842],
        elite: [4511, 4541, 6021, 4515, 4516, 4517, 4518, 4519, 4539, 4538, 4623, 4514, 4531, 4532, 4442, 4522, 4525, 4520, 4523, 4530, 4436, 4438, 6035, 4440, 4437, 4435, 4512, 4528, 4535, 4534, 4427, 4526, 4508],
        normal: [4625, 4510],
        loot: 9100400,
        mythicloot: 9100500,
        map: 47 
    },
    "Scarlet_Monastery": {
        entry: 9100800,
        boss: [3983, 3977, 3976, 3975, 4542, 6487, 4543, 3974],
        rare: [6488, 6490, 6489],
        elite: [4306, 4293, 6426, 6427, 6493, 4304, 4287, 4296, 4303, 4302, 4301, 4300, 4298, 4295, 4294, 4289, 4290, 4292, 4297, 4540, 4286, 4299, 4288, 4291],
        normal: [575, 4308, 6575],
        loot: 9100400,
        mythicloot: 9100500,
        map: 189 
    },
    "Razorfen_Downs": {
        entry: 9100900,
        boss: [7358, 8567, 14686, 7357, 7356, 7354, 7355],
        rare: [],
        elite: [7347, 7335, 7337, 7353, 7352, 7341, 7342, 7345, 7344, 7348, 7351, 7329, 7328, 7332, 7327],
        normal: [7334, 8516, 8585, 8696, 8767, 8477, 7340, 7346, 7343, 7349, 7333],
        loot: 9100400,
        mythicloot: 9100500,
        map: 129 
    },
    "Uldaman": {
        entry: 9101000,
        boss: [7206, 2748, 6906, 6907, 7291, 4854, 7228, 7023, 6908, 6910, 4857],
        rare: [],
        elite: [11073, 4863, 7172, 7209, 6912, 7091, 4849, 4848, 7030, 4847, 7290, 4861, 4860, 4855, 4850, 7321, 4853, 7320, 4852, 10120, 7022],
        normal: [7078, 7405, 7309, 7076, 7077, 7011, 7012, 7396, 7397, 4851, 7175],
        loot: 9100400,
        mythicloot: 9100500,
        map: 70 
    },
    "Zul_Farrak": {
        entry: 9101100,
        boss: [8127, 7267, 7273, 7795, 7796, 7797, 7275, 7272, 7271],
        rare: [10080, 10081, 10082],
        elite: [7274, 7608, 7606, 7605, 5649, 7789, 7268, 5648, 7246, 7247, 5650, 7604, 8156, 8120, 8130, 8095, 7607, 7286],
        normal: [15578, 7527, 8179, 8876, 7788, 7787, 8877, 7269, 7786, 8138, 7785, 7276],
        loot: 9100400,
        mythicloot: 9100500,
        map: 209 
    },
    "Maraudon": {
        entry: 9101200,
        boss: [12225, 12203, 12236, 13282, 12201, 12258, 13596, 13601],
        rare: [12237],
        elite: [11792, 13141, 11790, 12219, 13142, 11791, 12223, 11793, 12220, 12222, 13533, 12242, 13599, 12224, 12221, 11794, 12207, 13323, 11784, 12243, 12206, 13716, 12238],
        normal: [11783, 12218, 12216, 13696, 13456, 15556, 11789, 12217, 13743],
        loot: 9100400,
        mythicloot: 9100500,
        map: 349 
    },
    "Sunken_Temple": {
        entry: 9101300,
        boss: [8443, 5721, 5722, 5710, 5719, 5711, 5709, 5720, 5715, 5714, 5717, 5712, 5716, 5713, 8580],
        rare: [],
        elite: [5270, 5271, 8317, 5273, 5256, 5259, 8384, 8438, 5291, 8336, 15362, 5226, 5277, 8497, 5283, 5280, 5228, 8440, 5708, 5267],
        normal: [8324, 8318, 15593, 8437, 8658, 8657, 8656, 8319, 8257, 8311],
        loot: 9100400,
        mythicloot: 9100500,
        map: 109 
    },
    "Blackrock_Depths": {
        entry: 9101400,
        boss: [9156, 9035, 9031, 9016, 9438, 9442, 9443, 9439, 9437, 9441, 9039, 9040, 9019, 9029, 9056, 9033, 9037, 8983, 9027, 9028, 9034, 9032, 9018, 9319, 9537, 9017, 9025, 9938, 9030, 9502, 9499, 8929, 9024, 9543, 9038, 16059, 9042, 9036, 9041, 9476],
        rare: [8923],
        elite: [8903, 8892, 8891, 8898, 8894, 8895, 8889, 8893, 8890, 9541, 8910, 9020, 9680, 9445, 8899, 9022, 8909, 8911, 9547, 9554, 10096, 9681, 9021, 16053, 16049, 16052, 9023, 9500, 8908, 9677, 9503, 8906, 16054, 10043, 16050, 8902, 9956, 8896, 8904, 9678, 10116, 16051, 9436, 9679, 10117, 8914, 8913, 8915, 9398, 8912, 16055, 16058, 8905, 8920, 8907],
        normal: [8996, 8901, 12473, 8916, 8921, 8922, 8932, 9178, 8928, 8933, 12944, 9545, 16095, 2675, 15549, 8925, 8897, 8900, 8926, 8927],
        loot: 9100400,
        mythicloot: 9100500,
        map: 230 
    },
    "Blackrock_Spire": {
        entry: 9101700,
        boss: [10363, 16042, 9816, 10430, 10429, 10339, 10584, 10268, 16080, 9568, 10264, 9736, 10220, 9196, 10596, 9237, 9236],
        rare: [9596, 10263, 10376, 9718, 9218, 9219, 9217, 10509, 10899],
        elite: [9045, 10299, 9097, 9098, 9257, 9199, 9201, 10601, 10602, 10375, 9258, 9267, 9239, 9240, 9198, 9200, 9261, 9259, 9262, 9241, 9269, 9265, 9266, 10218, 10740, 9692, 9717, 9716, 9263, 9260, 9264, 9268, 10374, 9197, 9216, 10257, 9693, 9583, 9096, 10083, 10258, 10683, 10742, 9817, 9818, 9819, 10447, 10814, 10680, 10681, 11859, 10799, 10762, 10776, 10318, 10317, 10319, 10366, 10372, 10371, 10340, 16073, 10162],
        normal: [9701, 10177, 16066, 9416, 10161, 15560, 10442, 9708, 10261, 10221, 9696, 10316, ],
        loot: 9100400,
        mythicloot: 9100500,
        map: 229 
    },
    "Scholomance": {
        entry: 9102000,
        boss: [10506, 10503, 11622, 10433, 10432, 10508, 10505, 11261, 10901, 10507, 10504, 10502, 1853, 16118, 14695],
        rare: [],
        elite: [15438, 14516, 11439, 14861, 10486, 10500, 10488, 14511, 16120, 14521, 14520, 14519, 14518, 10478, 11257, 14513, 14512, 10498, 10499, 10487, 11551, 10475, 10472, 10477, 11582, 10469, 10491, 10495, 10489, 10470, 10476, 10471],
        normal: [14514, 16119, 14568, 11258, 14500, 10678, 10481, 10485, 11598, 10482, 11263, 10480],
        loot: 9100400,
        mythicloot: 9100500,
        map: 289 
    },
    "Stratholme": {
        entry: 9102200,
        boss: [10811, 10813, 10436, 11121, 10997, 11120, 11058, 16101, 10435, 10438, 11032, 10437, 11143, 10439, 16102, 11082, 10516, 10808, 16387, 14684, 10440],
        rare: [10558, 10393, 10809],
        elite: [17913, 10917, 10416, 10394, 17911, 10425, 10419, 10421, 10424, 10418, 10420, 10426, 11043, 10423, 10422, 10413, 10412, 17252, 417, 10407, 10385, 10406, 10812, 15438, 17910, 416, 10382, 17912, 10414, 10405, 10381, 10408, 10409, 10463, 10384, 16103, 16104, 10400, 10398, 11142, 10417, 17914, 10464],
        normal: [10697, 10383, 11054, 15607, 10411, 11197, 11030, 10461, 10536, 10441, 11122, 10391, 10390, 8477, 10388, 10955, 10399, 10876, 10387, 10389, 16031],
        loot: 9100400,
        mythicloot: 9100500,
        map: 329 
    },
    "Dire_Maul": {
        entry: 9102400,
        boss: [16097, 14506, 11501, 14325, 11496, 11486, 14324, 11488, 11487, 11489, 11467, 14321, 14326, 14323, 14322, 11492, 13280, 14327, 14354, 11490, 14349],
        rare: [],
        elite: [11859, 14502, 11450, 14308, 14483, 16098, 11446, 14381, 14368, 14382, 14353, 14389, 14690, 14358, 11480, 14399, 11445, 11448, 11484, 14369, 14398, 11475, 11469, 11470, 11473, 14351, 11477, 11459, 11483, 14303, 11458, 13036, 14383, 11491, 13285, 11471, 11472, 11441, 11444, 11461, 11465, 14364, 11457, 11452, 11453, 13197, 13021, 11456, 11460, 13276, 11464, 11454, 11455, 11451, 11466, 13196, 11462, 13022, 14371],
        normal: [14500, 14396, 14566, 14370, 14504, 16032, 14122, 16093, 14386, 14400, 14385, 14397, 14482, 13160, 11476, 14350, 14338],
        loot: 9100400,
        mythicloot: 9100500,
        map: 429 
    }
}

# First call (creates file with header)
print_queries_and_save([], first_call=True)

for dungeon in data:
    dungeon_name = []
    dungeon_name.append("-- " + dungeon)
    dungeon_name.append("")
    print_queries_and_save(dungeon_name)

    # Assign the instance variables
    lootid = data[dungeon][loot]
    new_entry = data[dungeon][entry]
    elite_entry_values = data[dungeon][elite]
    boss_entry_values = data[dungeon][boss]
    rare_entry_values = data[dungeon][rare]
    normal_entry_values = data[dungeon][normal]
    mythiclootid = data[dungeon][mythicloot]
    map_id = data[dungeon][map]

    # HEROIC

    # Execute SQL queries for Heroic elite_entry_values
    for entry_value in elite_entry_values:
        execute_queries(entry_value, new_entry, challenge="elite", is_mythic=False, map_value=map_id)
        # Increment the new_entry for the next creature (elite)
        new_entry += 1

    # Execute SQL queries for Heroic boss_entry_values
    for entry_value in boss_entry_values:
        execute_queries(entry_value, new_entry, challenge="boss", is_mythic=False, map_value=map_id)
        # Increment the new_entry for the next creature (boss)
        new_entry += 1

    # Execute SQL queries for Heroic rare_entry_values
    for entry_value in rare_entry_values:
        execute_queries(entry_value, new_entry, challenge="rare", is_mythic=False, map_value=map_id)
        # Increment the new_entry for the next creature (rare)
        new_entry += 1

    # Execute SQL queries for Heroic normal_entry_values
    for entry_value in normal_entry_values:
        execute_queries(entry_value, new_entry, challenge="normal", is_mythic=False, map_value=map_id)
        # Increment the new_entry for the next creature (normal)
        new_entry += 1

    # MYTHICS

    # Execute SQL queries for Mythic elite_entry_values
    for entry_value in elite_entry_values:
        execute_queries(entry_value, new_entry, challenge="elite", is_mythic=True, map_value=map_id)
        # Increment the new_entry for the next creature (elite)
        new_entry += 1

    # Execute SQL queries for Mythic boss_entry_values
    for entry_value in boss_entry_values:
        execute_queries(entry_value, new_entry, challenge="boss", is_mythic=True, map_value=map_id)
        # Increment the new_entry for the next creature (boss)
        new_entry += 1

    # Execute SQL queries for Mythic rare_entry_values
    for entry_value in rare_entry_values:
        execute_queries(entry_value, new_entry, challenge="rare", is_mythic=True, map_value=map_id)
        # Increment the new_entry for the next creature (rare)
        new_entry += 1

    # Execute SQL queries for Mythic normal_entry_values
    for entry_value in normal_entry_values:
        execute_queries(entry_value, new_entry, challenge="normal", is_mythic=True, map_value=map_id)
        # Increment the new_entry for the next creature (normal)
        new_entry += 1