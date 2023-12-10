import mysql.connector
import random

# --- TO DO ----
# original creature spawn mask should only be updated where the MAP id is equal to the dungeon map in creature table.
# map ID for each dungeon will need to be defined.
# Update creature tiers:
#   -   Boss
#   -   Rare
#   -   Elite
#   -   Normal

# Function to connect to the database and execute queries
def execute_queries(entry_value, start_new_entry, is_boss, is_mythic):
    # Database connection configuration
    db_config = {
        "host": "192.168.0.99",
        "user": "keira",
        "password": "slipknot9",
        "database": "acore_world"
    }

    conn = None  # Initialize conn to None

    try:
        # Connect to the database
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Check if a matching record exists for the given entry_value
        select_query = "SELECT * FROM creature_template WHERE entry = %s;"
        cursor.execute(select_query, (entry_value,))
        result = cursor.fetchone()

        if result is not None:
            # Delete the newly inserted row if it exists
            delete_new_entry_query = f"DELETE FROM `creature_template` WHERE entry = {start_new_entry};"
            cursor.execute(delete_new_entry_query)
            # Fetch the original row from the creature_template table
            original_row = list(result)  # Use the fetched row directly

            # Fetch and update the creature name
            creature_name = original_row[10]  
            if is_mythic:
                creature_name = "Mythic "  + creature_name.replace("'", "")  # Remove apostrophes
            else:
                creature_name = "Heroic "  + creature_name.replace("'", "")  # Remove apostrophes

            original_row[10] = creature_name

            # Fetch and update the subname if it exists
            if original_row[11]:
                subname = original_row[11]
                subname = subname.replace("'", "")  # Remove apostrophes from the subname
                original_row[11] = subname

            # modify difficulty entries for the new entry
            original_row[1] = 0
            original_row[2] = 0

            # Blank the SmartAI
            original_row[50] = ''

            # Blank the NPC Script
            original_row[63] = ''

            # Modify 'minlevel' and 'maxlevel' for boss entries
            if is_boss:
                original_row[14] = 63  # Set 'minlevel' to 63
                original_row[15] = 63  # Set 'maxlevel' to 63
                if is_mythic:
                    # assign loot table 
                    original_row[43] = mythiclootid

                    # Set 'DamageModifier' and 'HealthModifier' to random values
                    original_row[27] = round(random.uniform(6.9, 7.1), 2)  # Set 'DamageModifier'
                    original_row[53] = round(random.uniform(7.8, 8.5), 2)  # Set 'HealthModifier'
                else:  
                    # assign loot table 
                    original_row[43] = lootid

                    # Set 'DamageModifier' and 'HealthModifier' to random values
                    original_row[27] = round(random.uniform(4.9, 5.1), 2)  # Set 'DamageModifier'
                    original_row[53] = round(random.uniform(5.8, 6.5), 2)  # Set 'HealthModifier'

            else:
                # Modify 'minlevel' and 'maxlevel' for trash entries
                original_row[14] = 60  # Set 'minlevel' to 60
                original_row[15] = 60  # Set 'maxlevel' to 60
                if is_mythic:
                    # Set 'DamageModifier' and 'HealthModifier' to random values
                    original_row[27] = round(random.uniform(2.9, 3.1), 2)  # Set 'DamageModifier'
                    original_row[53] = round(random.uniform(3.8, 4.5), 2)  # Set 'HealthModifier'

            # Format original row with single quotes and NULL
            formatted_original_row = [
                f"'{value}'" if value is not None and field != "ScriptName" else "NULL"
                for field, value in zip(original_row, original_row[1:])
            ]

            # Insert a new row with the new entry number
            insert_query = (
                f"INSERT INTO `creature_template` VALUES ({start_new_entry}, "
                f"{', '.join(formatted_original_row)});"
            )

            # Update the original row's difficulty_entry fields
            if is_mythic:
                update_query = f"UPDATE `creature_template` SET `difficulty_entry_2` = {start_new_entry} WHERE (`entry` = {entry_value});"
            else:
                update_query = f"UPDATE `creature_template` SET `difficulty_entry_1` = {start_new_entry} WHERE (`entry` = {entry_value});"

            # Output the SQL queries with the creature name, DELETE (new entry), INSERT, and UPDATE queries
            print(f"-- {creature_name}")
            print(delete_new_entry_query)
            print(insert_query)
            print(update_query)

            # Search the 'creature' table and print the update query for 'spawnMask' field
            search_and_print_update_creature_table(entry_value)

    except Exception as err:
        print(f"Error: {err}")

# Function to search 'creature' table and print the update query
def search_and_print_update_creature_table(entry_value):
    try:
        # Update 'spawnMask' field to 3 for entries containing the original creature 'entry'
        update_spawn_mask_query = f"UPDATE `creature` SET `spawnMask` = 7 WHERE (`id1` = {entry_value});"

        # Output the SQL query for updating the 'spawnMask' field
        print(update_spawn_mask_query)

    except Exception as err:
        print(f"Error: {err}")

# Define constants for data attributes
entry = 0
boss = 1
trash = 2
loot = 3
mythicloot = 5

# Define constants for locations
Ragefire_Chasm = 0
Wailing_Caverns = 1
The_Deadmines = 2
Shadowfang_Keep = 3
The_Stockade = 4
Blackfathom_Deeps = 5
Gnomeregan = 6
Razorfen_Kraul = 7
Scarlet_Monastery = 8
Razorfen_Downs = 9
Uldaman = 10
Zul_Farrak = 11
Maraudon = 12
Sunken_Temple = 13
Blackrock_Depths = 14
Blackrock_Spire = 15
Scholomance = 16
Stratholme = 17
Dire_Maul = 18

# Select the dungeon to process
dungeon = Blackrock_Depths

# Create a dictionary of dictionaries to store the data
data = {
    Ragefire_Chasm: {
        entry: 9100000,
        boss: [11519, 11518, 11517, 11520, 17830],
        trash: [11320, 11321, 11834, 11319, 11318, 11322, 11323, 11324, 8996],
        loot: 9100400,
        mythicloot: 9100500
    },
    Wailing_Caverns: {
        entry: 9100100,
        boss: [5912, 3653, 3671, 3669, 3670, 3673, 3654, 3674, 5775],
        trash: [5048, 5053, 5056, 3637, 5055, 5762, 8886, 3636, 5761, 5756, 5755, 3678, 3840, 3640, 3679, 5763],
        loot: 9100400,
        mythicloot: 9100500
    },
    The_Deadmines: {
        entry: 9100200,
        boss: [3586, 639, 647, 645, 1763, 646, 643, 642, 644],
        trash: [636, 1732, 3947, 4417, 4418, 1731, 622, 641, 4416, 2520, 1729, 634, 598, 1725, 3450, 657],
        loot: 9100400,
        mythicloot: 9100500
    },
    Shadowfang_Keep: {
        entry: 9100300,
        boss: [3914, 3886, 3887, 4278, 4279, 3872, 4274, 3927, 4275],
        trash: [4627, 3861, 3868, 3849, 4444, 3864, 3875, 4958, 5097, 3863, 3865, 3855, 3857, 3853, 3859, 3851, 3854, 3862, 2529, 3850, 3873, 3866, 3877, 5058],
        loot: 9100400,
        mythicloot: 9100500
    },
    The_Stockade: {
        entry: 9100400,
        boss: [1696, 1663, 1720, 1666, 1717, 1716],
        trash: [1706, 1707, 1708, 1711, 1715],
        loot: 9100400,
        mythicloot: 9100500
    },
    Blackfathom_Deeps: {
        entry: 9100500,
        boss: [4829, 12876, 6243, 12902, 4830, 4832, 4887, 4831],
        trash: [4787, 6047, 4821, 4815, 4818, 4807, 4812, 4809, 4822, 4798, 4799, 4827, 8996, 6729, 4978, 4825, 4823, 4819, 4820, 4811, 4814, 4810, 4813, 4977, 4824, 4805],
        loot: 9100400,
        mythicloot: 9100500
    },
    Gnomeregan: {
        entry: 9100600,
        boss: [6229, 6228, 6235, 7361, 7800, 7079],
        trash: [7897, 6232, 7998, 7738, 6207, 6206, 6211, 6215, 6219, 6212, 8035, 7266, 6392, 6407, 6391, 6220, 6329, 6218, 7850, 7603, 6223, 6224, 6222, 6234, 6233, 6226, 6227, 6225, 7849, 6230, 9676, 7915],
        loot: 9100400,
        mythicloot: 9100500
    },
    Razorfen_Kraul: {
        entry: 9100700,
        boss: [4422, 4424, 4425, 4421, 4428, 4842, 4420, 6168],
        trash: [4511, 4541, 6021, 4515, 4516, 4517, 4518, 4519, 4625, 4539, 4538, 4623, 4514, 4531, 4532, 4442, 4522, 4525, 4520, 4523, 4530, 4436, 4438, 6035, 4440, 4437, 4435, 4512, 4528, 4535, 4534, 4427, 4526, 4508, 4510],
        loot: 9100400,
        mythicloot: 9100500
    },
    Scarlet_Monastery: {
        entry: 9100800,
        boss: [3983, 6490, 6488, 6489, 3977, 3976, 3975, 4542, 6487, 4543, 3974],
        trash: [6575, 4306, 4293, 4308, 6426, 6427, 6493, 4304, 4287, 4296, 4303, 4302, 4301, 4300, 4298, 4295, 4294, 4289, 4290, 4292, 4297, 4540, 4286, 575, 4299, 4288, 4291],
        loot: 9100400,
        mythicloot: 9100500
    },
    Razorfen_Downs: {
        entry: 9100900,
        boss: [7358, 8567, 14686, 7357, 7356, 7354, 7355],
        trash: [7334, 8516, 7347, 7335, 7337, 7353, 8585, 7352, 8696, 8767, 7341, 8477, 7340, 7342, 7345, 7346, 7343, 7344, 7348, 7349, 7351, 7333, 7329, 7328, 7332, 7327],
        loot: 9100400,
        mythicloot: 9100500
    },
    Uldaman: {
        entry: 9101000,
        boss: [7206, 2748, 6906, 6907, 7291, 4854, 7228, 7023, 6908, 6910, 4857],
        trash: [11073, 7078, 7405, 7309, 7076, 7077, 7011, 7012, 7396, 7397, 4863, 7172, 7209, 6912, 7091, 4849, 4848, 7030, 4847, 7290, 4861, 4860, 7175, 4855, 4850, 7321, 4853, 7320, 4852, 4851, 10120, 7022],
        loot: 9100400,
        mythicloot: 9100500
    },
    Zul_Farrak: {
        entry: 9101100,
        boss: [8127, 7267, 10081, 7273, 7795, 7796, 7797, 10080, 7275, 7272, 7271, 10082],
        trash: [7274, 15578, 7527, 8179, 7608, 7606, 7605, 8876, 5649, 7789, 7788, 7268, 5648, 7246, 7787, 7247, 5650, 8877, 7269, 7604, 8156, 7786, 8120, 8138, 8130, 8095, 7785, 7607, 7276, 7286],
        loot: 9100400,
        mythicloot: 9100500
    },
    Maraudon: {
        entry: 9101200,
        boss: [12225, 12203, 12236, 12237, 13282, 12201, 12258, 13596, 13601],
        trash: [12217, 12216, 11792, 13141, 11790, 13743, 12219, 13142, 11791, 12223, 11793, 12220, 12222, 12218, 13533, 13456, 13696, 11783, 12242, 13599, 12224, 12221, 11794, 12207, 11789, 13323, 11784, 12243, 12206, 13716, 15556, 12238],
        loot: 9100400,
        mythicloot: 9100500
    },
    Sunken_Temple: {
        entry: 9101300,
        boss: [8443, 5721, 5722, 5710, 5719, 5711, 5709, 5720, 5715, 5714, 5717, 5712, 5716, 5713, 8580],
        trash: [5270, 5271, 8317, 5273, 8324, 8318, 5256, 5259, 8384, 15593, 8438, 5291, 8437, 8336, 8658, 8657, 8656, 15362, 5226, 5277, 8497, 5283, 8319, 5280, 8257, 5228, 8440, 8311, 2914, 5708, 5267],
        loot: 9100400,
        mythicloot: 9100500
    },
    Blackrock_Depths: {
        entry: 9101400,
        boss: [9156, 9035, 9031, 9016, 9438, 9442, 9443, 9439, 9437, 9441, 9039, 9040, 9019, 9029, 9056, 9033, 9037, 8983, 9027, 9028, 9034, 9032, 9018, 9319, 9537, 9017, 9025, 9938, 9030, 8923, 9502, 9499, 8929, 9024, 9543, 9038, 16059, 9042, 9036, 9041, 9476],
        trash: [8903, 8892, 8891, 8898, 8894, 8895, 8889, 8901, 8893, 8890, 12473, 8916, 9541, 8910, 8921, 8922, 8932, 9178, 8928, 8933, 9020, 9680, 9445, 8927, 8926, 8900, 8897, 8899, 8925, 9022, 15549, 2675, 8909, 8911, 16095, 9545, 9547, 9554, 10096, 9681, 9021, 16053, 16049, 12944, 16052, 9023, 9500, 8908, 9677, 9503, 8906, 16054, 10043, 16050, 8902, 9956, 8896, 8904, 9678, 10116, 16051, 9436, 9679, 10117, 8914, 8913, 8915, 9398, 8912, 16055, 8996, 16058, 8905, 8920, 8907],
        loot: 9100400,
        mythicloot: 9100500
    },
    Blackrock_Spire: {
        entry: 9101500,
        boss: [10363, 16042, 9816, 10430, 10429, 10339, 10899, 10376, 10584, 10268, 16080, 9568, 10264, 9596, 9718, 9736, 10509, 10220, 9196, 10596, 9237, 9218, 9217, 9236, 9219, 10263],
        trash: [10221, 9416, 10261, 9708, 9045, 10299, 9097, 9098, 9257, 9199, 9201, 10601, 10602, 10375, 9258, 9267, 9239, 9240, 9198, 9200, 9696, 10161, 9261, 9259, 9262, 9241, 9269, 9265, 9266, 10218, 10740, 10442, 9692, 9717, 9716, 9263, 9260, 9264, 9268, 10374, 9197, 9216, 10177, 9701, 10257, 9693, 9583, 9096, 10083, 10258, 10683, 10316, 10742, 9817, 9818, 9819, 10447, 10814, 10680, 10681, 11859, 15560, 16066, 10799, 10762, 10776, 10318, 10317, 10319, 10366, 10372, 10371, 10340, 16073, 10162],
        loot: 9100400,
        mythicloot: 9100500
    },
    Scholomance: {
        entry: 9101600,
        boss: [10506, 10503, 11622, 10433, 10432, 10508, 10505, 11261, 10901, 10507, 10504, 10502, 1853, 16118, 14695],
        trash: [15438, 14516, 11439, 14861, 10486, 11598, 10500, 10488, 14511, 16120, 14521, 14520, 14519, 14518, 14568, 16119, 14514, 10478, 11257, 14513, 14512, 10498, 10499, 10487, 11551, 11263, 10475, 10472, 10477, 11582, 10469, 10491, 10495, 10480, 10481, 10489, 10678, 10482, 11258, 14500, 10470, 10476, 10471, 10485],
        loot: 9100400,
        mythicloot: 9100500
    },
    Stratholme: {
        entry: 9101700,
        boss: [10811, 10813, 10436, 11121, 10997, 11120, 11058, 10558, 16101, 10435, 10438, 11032, 10437, 11143, 10439, 10393, 10809, 16102, 11082, 10516, 10808, 16387, 14684, 10440],
        trash: [17913, 10917, 10697, 10416, 10394, 10383, 17911, 10425, 10419, 10421, 10424, 10418, 10420, 10426, 11043, 10423, 11054, 10422, 10413, 10412, 15607, 10411, 17252, 417, 10407, 10385, 10406, 10812, 15438, 17910, 416, 10382, 11197, 11030, 17912, 10414, 10405, 10461, 10536, 10441, 10381, 11122, 10408, 10409, 10463, 10391, 10390, 8477, 10384, 16103, 16104, 10388, 10955, 10399, 10400, 10398, 11142, 10876, 10387, 10417, 17914, 10464, 10389, 16031],
        loot: 9100400,
        mythicloot: 9100500
    },
    Dire_Maul: {
        entry: 9101800,
        boss: [16097, 14506, 11501, 14325, 11496, 11486, 14324, 11488, 11487, 11489, 11467, 14321, 14326, 14323, 14322, 11492, 13280, 14327, 14354, 11490, 14349],
        trash: [11859, 14502, 14396, 11450, 14308, 14483, 16098, 11446, 14381, 14368, 14382, 14353, 14389, 14690, 14358, 14566, 14370, 14504, 16032, 14122, 16093, 14386, 11480, 14399, 11445, 11448, 11484, 14400, 14385, 14397, 14482, 14369, 14398, 11475, 11469, 11470, 11473, 14351, 11477, 11459, 11483, 14303, 11458, 13036, 14383, 11491, 14500, 13285, 11471, 11472, 11441, 11444, 11461, 11465, 13160, 11476, 14364, 14350, 11457, 11452, 11453, 13197, 13021, 11456, 11460, 13276, 11464, 11454, 11455, 11451, 11466, 13196, 11462, 13022, 14371, 14338],
        loot: 9100400,
        mythicloot: 9100500
    }
}

# Assign the instance variables
lootid = data[dungeon][loot]
start_new_entry = data[dungeon][entry]
trash_entry_values = data[dungeon][trash]
boss_entry_values = data[dungeon][boss]
mythiclootid = data[dungeon][mythicloot]

# Execute SQL queries for Heroic trash_entry_values
for entry_value in trash_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=False, is_mythic=False)
    # Increment the start_new_entry for the next creature (trash)
    start_new_entry += 1

# Execute SQL queries for Heroic boss_entry_values
for entry_value in boss_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=True, is_mythic=False)
    # Increment the start_new_entry for the next creature (boss)
    start_new_entry += 1

# Execute SQL queries for Mythic trash_entry_values
for entry_value in trash_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=False, is_mythic=True)
    # Increment the start_new_entry for the next creature (trash)
    start_new_entry += 1

# Execute SQL queries for Mythic boss_entry_values
for entry_value in boss_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=True, is_mythic=True)
    # Increment the start_new_entry for the next creature (boss)
    start_new_entry += 1