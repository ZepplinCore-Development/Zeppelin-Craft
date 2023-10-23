import mysql.connector
import random

# Function to connect to the database and execute queries
def execute_queries(entry_value, start_new_entry, is_boss):
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
            creature_name = "Heroic " + creature_name
            original_row[10] = creature_name

            # modify difficulty entries for the new entry
            original_row[1] = 0
            original_row[2] = 0

            # Blank the SmartAI
            original_row[50] = ''

            # Modify 'minlevel' and 'maxlevel' for boss entries
            if is_boss:
                original_row[14] = 63  # Set 'minlevel' to 63
                original_row[15] = 63  # Set 'maxlevel' to 63
                # Set 'DamageModifier' and 'HealthModifier' to random values between 3.9 and 4.1
                original_row[27] = round(random.uniform(4.9, 5.1), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(5.8, 6.5), 2)  # Set 'HealthModifier'
                # assign loot table
                original_row[43] = lootid

            else:
                # Modify 'minlevel' and 'maxlevel' for trash entries
                original_row[14] = 60  # Set 'minlevel' to 60
                original_row[15] = 60  # Set 'maxlevel' to 60

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

            # Update the original row's difficulty_entry_1 field
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
        update_spawn_mask_query = f"UPDATE `creature` SET `spawnMask` = 3 WHERE (`id1` = {entry_value});"

        # Output the SQL query for updating the 'spawnMask' field
        print(update_spawn_mask_query)

    except Exception as err:
        print(f"Error: {err}")

# Define constants for data attributes
entry = 0
boss = 1
trash = 2
loot = 3

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
dungeon = Razorfen_Downs

# Create a dictionary of dictionaries to store the data
data = {
    Ragefire_Chasm: {
        entry: 9100000,
        boss: [11519, 11518, 11517, 11520, 17830],
        trash: [11320, 11321, 11834, 11319, 11318, 11322, 11323, 11324, 8996],
        loot: 9100400
    },
    Wailing_Caverns: {
        entry: 9100100,
        boss: [5912, 3653, 3671, 3669, 3670, 3673, 3654, 3674, 5775],
        trash: [5048, 5053, 5056, 3637, 5055, 5762, 8886, 3636, 5761, 5756, 5755, 3678, 3840, 3640, 3679, 5763],
        loot: 9100400
    },
    The_Deadmines: {
        entry: 9100200,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Shadowfang_Keep: {
        entry: 9100300,
        boss: [3914, 3886, 3887, 4278, 4279, 3872, 4274, 3927, 4275],
        trash: [4627, 3861, 3868, 3849, 4444, 3864, 3875, 4958, 5097, 3863, 3865, 3855, 3857, 3853, 3859, 3851, 3854, 3862, 2529, 3850, 3873, 3866, 3877, 5058],
        loot: 9100400
    },
    The_Stockade: {
        entry: 9100400,
        boss: [1696, 1663, 1720, 1666, 1717, 1716],
        trash: [1706, 1707, 1708, 1711, 1715],
        loot: 9100400
    },
    Blackfathom_Deeps: {
        entry: 9100500,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Gnomeregan: {
        entry: 9100600,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Razorfen_Kraul: {
        entry: 9100700,
        boss: [4422, 4424, 4425, 4421, 4428, 4842, 4420, 6168],
        trash: [4511, 4541, 6021, 4515, 4516, 4517, 4518, 4519, 4625, 4539, 4538, 4623, 4514, 4531, 4532, 4442, 4522, 4525, 4520, 4523, 4530, 4436, 4438, 6035, 4440, 4437, 4435, 4512, 4528, 4535, 4534, 4427, 4526, 4508, 4510],
        loot: 9100400
    },
    Scarlet_Monastery: {
        entry: 9100800,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Razorfen_Downs: {
        entry: 9100900,
        boss: [7358, 8567, 14686, 7357, 7356, 7354, 7355],
        trash: [7334, 8516, 7347, 7335, 7337, 7353, 8585, 7352, 8696, 8767, 7341, 8477, 7340, 7342, 7345, 7346, 7343, 7344, 7348, 7349, 7351, 7333, 7329, 7328, 7332, 7327],
        loot: 9100400
    },
    Uldaman: {
        entry: 9101000,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Zul_Farrak: {
        entry: 9101100,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Maraudon: {
        entry: 9101200,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Sunken_Temple: {
        entry: 9101300,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Blackrock_Depths: {
        entry: 9101400,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Blackrock_Spire: {
        entry: 9101500,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Scholomance: {
        entry: 9101600,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Stratholme: {
        entry: 9101700,
        boss: None,
        trash: None,
        loot: 9100400
    },
    Dire_Maul: {
        entry: 9101800,
        boss: None,
        trash: None,
        loot: 9100400
    }
}

# Assign the instance variables
lootid = data[dungeon][loot]
start_new_entry = data[dungeon][entry]
trash_entry_values = data[dungeon][trash]
boss_entry_values = data[dungeon][boss]

# Execute SQL queries for trash_entry_values
for entry_value in trash_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=False)
    # Increment the start_new_entry for the next creature (trash)
    start_new_entry += 1

# Execute SQL queries for boss_entry_values
for entry_value in boss_entry_values:
    execute_queries(entry_value, start_new_entry, is_boss=True)
    # Increment the start_new_entry for the next creature (boss)
    start_new_entry += 1