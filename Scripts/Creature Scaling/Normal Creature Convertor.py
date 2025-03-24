import mysql.connector
import random

# The converter script needs some work, there are a couple things I want to change

# 1.
# It references fields by counting them which is now broken from the structural changes. 
# It'd be better to just hunt for specific field names.

# 2.
# It generates queries using the DELETE INSERT format which isn't really needed.
# when all it does is adjust the creature rank, health and damage. Better to use the UPDATE method.

# Function to connect to the database and execute queries
def execute_queries(entry_value, power):
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
            delete_new_entry_query = f"DELETE FROM `creature_template` WHERE entry = {entry_value};"
            # Fetch the original row from the creature_template table
            original_row = list(result)  # Use the fetched row directly

            # Fetch and the creature name
            creature_name = original_row[10]  



            if power == 0: #named_solo
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(2.0, 2.3), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(2.0, 2.5), 2)  # Set 'HealthModifier'
            
                # Update rank
                original_row[25] = 1 #normal

            if power == 1: #named_group
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(1.5, 2.0), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(1.7, 2.0), 2)  # Set 'HealthModifier'
                
                # Update rank
                original_row[25] = 1 #normal

            if power == 2: #normal
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(1.0, 1.25), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(1.1, 1.5), 2)  # Set 'HealthModifier'
                
                # Update rank
                original_row[25] = 0 #normal

            if power == 3: #rare
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(1.5, 2.0), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(1.7, 2.0), 2)  # Set 'HealthModifier'
                
                # Update rank
                original_row[25] = 2 #rare elite

            # Format original row with single quotes and NULL
            formatted_original_row = [
                f"'{value}'" if value is not None and field != "ScriptName" else "NULL"
                for field, value in zip(original_row, original_row[1:])
            ]

            # replace existing row with the new creature settings
            insert_query = (
                f"REPLACE INTO `creature_template` VALUES ({entry_value}, "
                f"{', '.join(formatted_original_row)});"
            )

            # Output the SQL queries with the creature name, DELETE (new entry), INSERT, and UPDATE queries
            print(f"-- {creature_name}")
            print(delete_new_entry_query)
            print(insert_query)

    except Exception as err:
        print(f"Error: {err}")

# Define constants for data attributes
named_solo = 0 # Solo Fight
named_group = 1 # Group Fight
normal = 2
rare = 3

# Define constants for locations
Mosh_Ogg_Ogre_Mound = 0
Vile_Reef = 1
Dun_Modr = 2
Stonewatch_Keep = 3
Dun_Garok = 4
Badlands = 5
Stromgarde = 6
Jintha_Alor = 7
Loch_Modan = 8

# Select the dungeon to process
area = Dun_Modr

# Create a dictionary of dictionaries to store the data
data = {
    Mosh_Ogg_Ogre_Mound: {
        named_solo: [],
        named_group: [],
        normal: [678, 679, 680, 709, 710, 723, 1142, 1144],
        rare: []
    },
    Vile_Reef: {
        named_solo: [],
        named_group: [],
        normal: [871, 873, 875, 877, 879],
        rare: []
    },
    Dun_Modr: {
        named_solo: [],
        named_group: [1364],
        normal: [1052, 6523, 1051, 1054],
        rare: []
    },
    Stonewatch_Keep: {
        named_solo: [],
        named_group: [486, 334],
        normal: [436, 4065, 4064, 4462, 4464],
        rare: []
    },
    Dun_Garok: {
        named_solo: [],
        named_group: [2304],
        normal: [2345, 2346, 2344],
        rare: []
    },
    Badlands: {
        named_solo: [275, 2745, 2759],
        named_group: [],
        normal: [2726, 2892, 6733, 4844, 4846, 4872],
        rare: [2754, 2931, 2749]
    },
    Stromgarde: {
        named_solo: [],
        named_group: [2783, 2597, 2599, 2607],
        normal: [2588, 2591, 2590],
        rare: []
    },
    Jintha_Alor: {
        named_solo: [],
        named_group: [],
        normal: [7995, 8217, 2639, 2640, 2641, 2642, 2643, 2644, 2645, 2646, 2647, 2648, 2681, 4468, 4465],
        rare: []
    },
    Loch_Modan: {
        named_solo: [],
        named_group: [],
        normal: [1225, 2477, 2478, 7170, 1178, 1179, 1180, 1181, 1183],
        rare: []
    },
}

# Assign the instance variables
named_solo_values = data[area][named_solo]
named_group_values = data[area][named_group]
normal_values = data[area][normal]
rare_values = data[area][rare]

# Execute SQL queries for named_solo
for value in named_solo_values:
    execute_queries(value, power=named_solo)

# Execute SQL queries for named_group
for value in named_group_values:
    execute_queries(value, power=named_group)

# Execute SQL queries for normal
for value in normal_values:
    execute_queries(value, power=normal)

# Execute SQL queries for normal
for value in rare_values:
    execute_queries(value, power=rare)