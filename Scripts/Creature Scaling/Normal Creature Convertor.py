import mysql.connector
import random

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
named_solo = 0
named_group = 1
normal = 2

# Define constants for locations
Mosh_Ogg_Ogre_Mound = 0
Vile_Reef = 1

# Select the dungeon to process
area = Vile_Reef

# Create a dictionary of dictionaries to store the data
data = {
    Mosh_Ogg_Ogre_Mound: {
        named_solo: [],
        named_group: [],
        normal: [678, 679, 680, 709, 710, 723, 1142, 1144]
    },
    Vile_Reef: {
        named_solo: [],
        named_group: [],
        normal: [871, 873, 875, 877, 879]
    }
}

# Assign the instance variables
named_solo_values = data[area][named_solo]
named_group_values = data[area][named_group]
normal_values = data[area][normal]

# Execute SQL queries for named_solo
for value in named_solo_values:
    execute_queries(value, power=named_solo)

# Execute SQL queries for named_group
for value in named_group_values:
    execute_queries(value, power=named_group)

# Execute SQL queries for normal
for value in normal_values:
    execute_queries(value, power=normal)
