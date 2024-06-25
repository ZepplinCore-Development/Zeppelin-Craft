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

            if power == 0: #boss
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(5.0, 7.0), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(8.0, 10.0), 2)  # Set 'HealthModifier'
            
            if power == 1: #rare
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(4.0, 6.0), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(5.0, 7.0), 2)  # Set 'HealthModifier'

            if power == 2: #trash
                # Set 'DamageModifier' and 'HealthModifier' to random values
                original_row[27] = round(random.uniform(3.0, 4.0), 2)  # Set 'DamageModifier'
                original_row[53] = round(random.uniform(3.0, 4.0), 2)  # Set 'HealthModifier'

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
boss = 0
rare = 1
trash = 2

# Define constants for locations
Blackrock_Spire = 0


# Select the dungeon to process
area = Blackrock_Spire

# Create a dictionary of dictionaries to store the data
data = {
    Blackrock_Spire: {
        boss: [10363, 16042, 9816, 10430, 10429, 10339, 10899, 10376, 10584, 10268, 16080, 9568, 10264, 9596, 9718, 9736, 10509, 10220, 9196, 10596, 9237, 9218, 9217, 9236, 9219, 10263],
        rare: [],
        trash: [10221, 9416, 10261, 9708, 9045, 10299, 9097, 9098, 9257, 9199, 9201, 10601, 10602, 10375, 9258, 9267, 9239, 9240, 9198, 9200, 9696, 10161, 9261, 9259, 9262, 9241, 9269, 9265, 9266, 10218, 10740, 10442, 9692, 9717, 9716, 9263, 9260, 9264, 9268, 10374, 9197, 9216, 10177, 9701, 10257, 9693, 9583, 9096, 10083, 10258, 10683, 10316, 10742, 9817, 9818, 9819, 10447, 10814, 10680, 10681, 11859, 15560, 16066, 10799, 10762, 10776, 10318, 10317, 10319, 10366, 10372, 10371, 10340, 16073, 10162]
    }
}

# Assign the instance variables
bosses = data[area][boss]
rares = data[area][rare]
trashes = data[area][trash]

# Execute SQL queries for bosses
for value in bosses:
    execute_queries(value, power=boss)

# Execute SQL queries for rares
for value in rares:
    execute_queries(value, power=rare)

# Execute SQL queries for trashes
for value in trashes:
    execute_queries(value, power=trash)
