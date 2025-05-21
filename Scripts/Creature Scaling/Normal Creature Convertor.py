import mysql.connector
import random
import os

# Database configuration
DB_CONFIG = {
    "host": "192.168.0.55",
    "user": "keira",
    "password": "@5$Ekx3Xah2sXw",
    "database": "acore_world"
}

# Define the actual column names you want to fetch and modify
COLUMNS = [
    "name", 
    "DamageModifier", 
    "HealthModifier", 
    "Rank"
]

# Output filename
OUTPUT_FILE = "zz_de-L33TER.sql"

class named_solo_fight:
    health_min = 2.0
    health_max = 2.5
    damage_min = 2.0
    damage_max = 2.3
    rank = 0

class named_group_fight:
    health_min = 1.7
    health_max = 2.0
    damage_min = 1.5
    damage_max = 2.0
    rank = 0

class normal:
    health_min = 1.0
    health_max = 1.2
    damage_min = 1.0
    damage_max = 1.1
    rank = 0

class rare:
    health_min = 1.7
    health_max = 2.0
    damage_min = 1.5
    damage_max = 2.0
    rank = 2

def fetch_original_row(cursor, entry_value):
    # Construct query string
    column_names = ", ".join([f"`{col}`" for col in COLUMNS])
    query = f"SELECT {column_names} FROM `creature_template` WHERE `entry` = %s;"
    
    # Execute query
    cursor.execute(query, (entry_value,))
    result = cursor.fetchone()

    # Return a dictionary with column names as keys
    if result:
        result = dict(zip(COLUMNS, result))
        return result
    else:
        return None  # Return None if no result is found

def modify_original_row(original_row, challenge):
    """Modifies creature stats and removes 'name' from the returned row."""
    # Extract name first (since we'll remove it)
    creature_name = original_row["name"]

    # Apply modifications
    modified_row = {
        "DamageModifier": round(random.uniform(challenge.damage_min, challenge.damage_max), 2),
        "HealthModifier": round(random.uniform(challenge.health_min, challenge.health_max), 2),
        "Rank": challenge.rank
    }

    return modified_row, creature_name  # No 'name' in modified_row

# Function to generate SQL queries
def generate_sql_queries(modified_row, entry_value, creature_name, challenge):
    """Generate queries to duplicate and update a creature template"""
    queries = []

    # 0. Add creature name as comment header
    queries.append(f"-- Processing: {creature_name} as {challenge}")
    queries.append("")
    
    # 3. Build UPDATE query using only our modified columns
    update_fields = []
    for col in modified_row:  # Using your predefined columns list
        value = modified_row[col]  # Direct access since we control these fields
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        else:
            update_fields.append(f"    `{col}` = {value}")
    queries.append("UPDATE `creature_template` SET")
    queries.append(",\n".join(update_fields))
    queries.append(f"WHERE `entry` = {entry_value};")
    queries.append("")
    
    return queries

# Main function to execute queries
def execute_queries(entry_value, challenge):
    """Execute database operations for creating heroic/mythic creature templates.
        Args:
        entry_value: Original creature entry ID
        challenge: Creature type ("boss", "elite", "rare", "normal")
    """
    conn = None
    try:
        # Establish database connection
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # 1. Fetch original creature data
        original_row = fetch_original_row(cursor, entry_value)
        if not original_row:
            print(f"Warning: No creature found with entry {entry_value}")
            return

        # 2. Prepare modified creature data
        modified_row, creature_name, = modify_original_row(original_row, challenge)

        challenge_name = challenge.__class__.__name__

        # 3. Generate and SQL queries
        queries = generate_sql_queries(modified_row, entry_value, creature_name, challenge_name)

        # 3. Print SQL queries
        print_queries_and_save(queries)

    except mysql.connector.Error as db_err:
        print(f"Database error processing entry {entry_value}: {db_err}")
    except Exception as err:
        print(f"Unexpected error processing entry {entry_value}: {err}")
    finally:
        if conn and conn.is_connected():
            conn.close()


def print_queries_and_save(queries, filename=OUTPUT_FILE, first_call=False):
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
                f.write("-- Created by Normal Creature Convertor script\n\n")
            
            for query in queries:
                f.write(query + "\n")
                
        if first_call:
            print(f"\n=== Created new SQL file: {output_path} ===")
    except Exception as e:
        print(f"\n!!! Error saving queries to file: {e} !!!")
    

# Create a dictionary of dictionaries to store the data
area_data = {
    "Mosh_Ogg_Ogre_Mound": {
        named_solo_fight: [],
        named_group_fight: [],
        normal: [678, 679, 680, 709, 710, 723, 1142, 1144],
        rare: []
    },
    "Vile_Reef": {
        named_solo_fight: [],
        named_group_fight: [],
        normal: [871, 873, 875, 877, 879],
        rare: []
    },
    "Dun_Modr": {
        named_solo_fight: [],
        named_group_fight: [1364],
        normal: [1052, 6523, 1051, 1054],
        rare: []
    },
    "Wetlands": {
        named_solo_fight: [2091],
        named_group_fight: [],
        normal: [],
        rare: []
    },
    "Stonewatch_Keep": {
        named_solo_fight: [],
        named_group_fight: [486, 334],
        normal: [436, 4065, 4064, 4462, 4464],
        rare: []
    },
    "Dun_Garok": {
        named_solo_fight: [],
        named_group_fight: [2304],
        normal: [2345, 2346, 2344],
        rare: []
    },
    "Badlands": {
        named_solo_fight: [275, 2745, 2759],
        named_group_fight: [],
        normal: [2726, 2892, 6733, 4844, 4846, 4872],
        rare: [2754, 2931, 2749]
    },
    "Stromgarde": {
        named_solo_fight: [],
        named_group_fight: [2783, 2597, 2599, 2607, 2611],
        normal: [2588, 2591, 2590, 2571, 2569, 2570, 2558],
        rare: []
    },
    "Jintha_Alor": {
        named_solo_fight: [],
        named_group_fight: [],
        normal: [7995, 8217, 2639, 2640, 2641, 2642, 2643, 2644, 2645, 2646, 2647, 2648, 2681, 4468, 4465],
        rare: []
    },
    "Loch_Modan": {
        named_solo_fight: [],
        named_group_fight: [],
        normal: [1225, 2477, 2478, 7170, 1178, 1179, 1180, 1181, 1183],
        rare: []
    },
    "Teldrasil": {
        named_solo_fight: [],
        named_group_fight: [],
        normal: [2166],
        rare: []
    },
}

# First call (creates file with header)
print_queries_and_save([], first_call=True)

for area in area_data:
    area_name = []
    area_name.append("-- " + area)
    area_name.append("")
    print_queries_and_save(area_name)

    # Assign the instance variables
    named_solo_values = area_data[area][named_solo_fight]
    named_group_values = area_data[area][named_group_fight]
    normal_values = area_data[area][normal]
    rare_values = area_data[area][rare]

    # Execute SQL queries for named_solo
    for value in named_solo_values:
        execute_queries(value, challenge=named_solo_fight())

    # Execute SQL queries for named_group
    for value in named_group_values:
        execute_queries(value, challenge=named_group_fight())

    # Execute SQL queries for normal
    for value in normal_values:
        execute_queries(value, challenge=normal())

    # Execute SQL queries for normal
    for value in rare_values:
        execute_queries(value, challenge=rare())
