import csv
import os

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

# Function to generate SQL queries
def generate_sql_queries(teleports_csv_file_path):
    queries = []  # List to store generated queries

    with open(teleports_csv_file_path, 'r') as teleports_file:
        teleport_reader = csv.reader(teleports_file)
        next(teleport_reader)  # Skip the header row 
        for row in teleport_reader:

            # Extracting values from the CSV columns by index
            city = row[0]
            scroll_id = row[1]
            scroll_spell = row[2]
            scroll_display = row[3]
            technique_id = row[4]
            technique_spell = row[5]
            incription_level = row[6]
            vendor_id = row[7]
            vendor_name = row[8]

            if city:

                # Generating the SQL queries with exact format
                scroll_template_query = f"""-- Scroll of Teleport {city}
                DELETE FROM `item_template` WHERE (`entry` = {scroll_id});
                INSERT INTO `item_template`
                SET `entry` = {scroll_id},
                    `name` = 'Scroll of Teleport {city}',
                    `displayid` = {scroll_display},
                    `Quality` = 2,
                    `bonding` = 1,
                    `stackable` = 20,
                    `RequiredSkill` = 773,
                    `RequiredSkillRank` = {incription_level},
                    `spellid_1` = {scroll_spell},
                    `spellcharges_1` = -1;

                """
                
                technique_template_query = f"""-- Technique: Scroll of Teleport {city}
                DELETE FROM `item_template` WHERE (`entry` = {technique_id});
                INSERT INTO `item_template`
                SET `entry` = {technique_id},
                    `name` = 'Technique: Scroll of Teleport {city}', 
                    `displayid` = 1103, 
                    `Quality` = 2, 
                    `bonding` = 1, 
                    `BuyPrice` = 10000, 
                    `SellPrice` = 2500, 
                    `RequiredSkill` = 773, 
                    `RequiredSkillRank` = {incription_level}, 
                    `spellid_1` = 483, 
                    `spellcharges_1` = -1, 
                    `spellid_2` = {technique_spell}, 
                    `spelltrigger_2` = 6;

                """

                
                vendor_query = f"""-- {vendor_name} - Scroll of Teleport {city}
                DELETE FROM `npc_vendor` WHERE (`item` = {technique_id});
                INSERT INTO `npc_vendor`
                SET `entry` = {vendor_id},
                    `item` = {technique_id}; 


                """
                
                # Combine all queries for this dungeon into one string
                city_queries = scroll_template_query + technique_template_query + vendor_query
                queries.append(city_queries)

    return queries

# CSV file path
teleports_csv_file_path = 'City Teleports.csv'

# Generate SQL queries
sql_queries = generate_sql_queries(teleports_csv_file_path)

# Save SQL queries to a file
with open('zz_city_teleports.sql', 'w') as sql_file:
    for query in sql_queries:
        sql_file.write(query + '\n')

print("CITY TELEPORT SQL FILE GENERATED")