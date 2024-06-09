import csv
import os
import random

# Print the current working directory before changing
print("Before:", os.getcwd())

# Get the directory of the current script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Change the working directory to the script's directory
try:
    os.chdir(script_dir)
    print("After:", os.getcwd())
except Exception as e:
    print("Error changing directory:", e)

orb_icons = [141021, 141022, 141023, 141024, 141025, 141026]

# Function to generate SQL queries
def generate_sql_queries(teleports_csv_file_path):
    queries = []  # List to store generated queries

    with open(teleports_csv_file_path, 'r') as teleports_file:
        teleport_reader = csv.reader(teleports_file)
        next(teleport_reader)  # Skip the header row 
        for row in teleport_reader:

            # Extracting values from the CSV columns by index
            dungeon = row[0]
            orb_id = row[1]
            orb_spell = row[2]
            map = row[3]
            x_loc = row[4]
            y_loc = row[5]
            z_loc = row[6]
            orientation = row[7]

            if map:

                display_id = random.choice(orb_icons)

                # Generating the SQL queries with exact format
                spell_position_query = f"""-- {dungeon} - Teleport Location
                DELETE FROM `spell_target_position` WHERE (`ID` = {orb_spell});
                INSERT INTO `spell_target_position`
                SET `ID` = {orb_spell},
                    `EffectIndex` = '0',
                    `MapID` = {map},
                    `PositionX` = {x_loc},
                    `PositionY` = {y_loc},
                    `PositionZ` = {z_loc},
                    `Orientation` = {orientation},
                    `VerifiedBuild` = '0';
                    
                """
                
                orb_item_query = f"""-- {dungeon} - Teleport Orb
                DELETE FROM `item_template` WHERE (`entry` = {orb_id});
                INSERT INTO `item_template`
                SET `entry` = {orb_id},
                    `name` = 'Orb of Teleport {dungeon}',
                    `class` = 12,
                    `displayid` = '{display_id}',
                    `Quality` = '2',
                    `bonding` = '2',
                    `spellid_1` = {orb_spell},
                    `spellcharges_1` = '-1';
                    
                """
                
                # Combine all queries for this dungeon into one string
                dungeon_queries = spell_position_query + orb_item_query
                queries.append(dungeon_queries)

    return queries

# CSV file path
teleports_csv_file_path = 'Dungeon Daily Teleports.csv'

# Generate SQL queries
sql_queries = generate_sql_queries(teleports_csv_file_path)

# Save SQL queries to a file
with open('zz_daily_dungeon_teleports.sql', 'w') as sql_file:
    for query in sql_queries:
        sql_file.write(query + '\n')

print("DUNGEON TELEPORT SQL FILE GENERATED")