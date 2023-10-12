import mysql.connector
import random

# To Do 
# Define a variable for the boss lootid
# Stop assigning difficulty_entry_1 of the heroic creature.
# Add heroic prefix to the creature name

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
            creature_name = original_row[10]  # Assuming 'name' is at index 10 (adjust if needed)
            creature_name = "Heroic " + creature_name
            original_row[10] = creature_name

            # modify difficulty entries for the new entry
            original_row[1] = 0
            original_row[2] = 0

        # Modify 'minlevel' and 'maxlevel' for boss entries
        if is_boss:
            original_row[14] = 63  # Set 'minlevel' to 63
            original_row[15] = 63  # Set 'maxlevel' to 63
             # Set 'DamageModifier' and 'HealthModifier' to random values between 3.9 and 4.1
            original_row[27] = round(random.uniform(3.9, 4.1), 2)  # Set 'DamageModifier'
            original_row[53] = round(random.uniform(3.8, 4.5), 2)  # Set 'HealthModifier'
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

# Define 'start_new_entry' values here
Ragefire_Chasm = 9100000
Wailing_Caverns = 9100100
The_Deadmines = 9100200
Shadowfang_Keep = 9100300
The_Stockade = 9100400
Blackfathom_Deeps = 9100500
Gnomeregan = 9100600
Razorfen_Kraul = 9100700
Scarlet_Monastery = 9100800
Razorfen_Downs = 9100900
Uldaman = 9101000
Zul_Farrak = 9101100
Maraudon = 9101200
Sunken_Temple = 9101300
Blackrock_Depths = 9101400
Blackrock_Spire = 9101500
Scholomance = 9101600
Stratholme = 9101700
Dire_Maul = 9101800

# Define Loot IDs
Ragefire_Chasm_loot = 9100000
Wailing_Caverns_loot = 9100100
The_Deadmines_loot = 9100200
Shadowfang_Keep_loot = 9100300
The_Stockade_loot = 9100400
Blackfathom_Deeps_loot = 9100500
Gnomeregan_loot = 9100600
Razorfen_Kraul_loot = 9100700
Scarlet_Monastery_loot = 9100800
Razorfen_Downs_loot = 9100900
Uldaman_loot = 9101000
Zul_Farrak_loot = 9101100
Maraudon_loot = 9101200
Sunken_Temple_loot = 9101300
Blackrock_Depths_loot = 9101400
Blackrock_Spire_loot = 9101500
Scholomance_loot = 9101600
Stratholme_loot = 9101700
Dire_Maul_loot = 9101800

# Assign the instance variables
lootid = The_Stockade_loot
start_new_entry = The_Stockade

# Define the 'trash_entry_values' and 'boss_entry_values'
trash_entry_values = [1706, 1707, 1708, 1711, 1715]
boss_entry_values = [1696, 1663, 1720, 1666, 1717, 1716]

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