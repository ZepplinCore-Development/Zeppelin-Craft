import mysql.connector
import os

# Define the full path of the output file
output_file_path = "C:/Games/ChromieCraft_3.3.5a/Custom Tools/Zeppelin-Core/SQL/custom/db_world/spell_to_stat.sql"

# Check if the output directory exists and create it if it doesn't
output_dir = os.path.dirname(output_file_path)
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Check if the output file exists and delete it if it does
if os.path.exists(output_file_path):
    os.remove(output_file_path)
    print(f"Deleted existing {output_file_path}")

# Open the output file in write mode
with open(output_file_path, "w") as output_file:

    # Database configuration for acore_world database
    db_config_acore_world = {
        "host": "192.168.0.99",
        "user": "keira",
        "password": "slipknot9",
        "database": "acore_world"
    }

    # Connect to the acore_world database to look up values
    try:
        connection_acore_world = mysql.connector.connect(**db_config_acore_world)

        # Create a cursor for the acore_world database
        cursor_acore_world = connection_acore_world.cursor()

        # Query to fetch values from db_Spell_12340 table
        cursor_acore_world.execute("SELECT ID, EffectBasePoints_1, Name_Lang_enUS, stat_type FROM db_Spell_12340")

        # Fetch all rows from the table
        spell_rows = cursor_acore_world.fetchall()

        # Loop through each row in db_Spell_12340 table
        for spell_row in spell_rows:
            spell_id_to_search = spell_row[0]
            stat_value = spell_row[1]
            stat_name = spell_row[2]
            new_stat_type10 = spell_row[3]

            # output the spell name and value
            output_query = f"-- {stat_name}: +{stat_value}: SPELL ({spell_id_to_search})\n\n\n"
            output_file.write(output_query)

            # Database configuration for item_template table
            db_config_item_template = {
                "host": "192.168.0.99",
                "user": "keira",
                "password": "slipknot9",
                "database": "acore_world"
            }

            # Connect to the acore_world database for item_template table
            connection_item_template = mysql.connector.connect(**db_config_item_template)

            # Create a cursor for the item_template database
            cursor_item_template = connection_item_template.cursor()

            # Search for entries where any of the spellid columns is equal to spell_id_to_search
            cursor_item_template.execute(
                "SELECT entry, name, stat_type10, spellid_1, spellid_2, spellid_3, spellid_4, spellid_5, "
                "spelltrigger_1, spelltrigger_2, spelltrigger_3, spelltrigger_4, spelltrigger_5 FROM item_template WHERE "
                "spellid_1 = %s OR spellid_2 = %s OR spellid_3 = %s OR spellid_4 = %s OR spellid_5 = %s",
                (spell_id_to_search, spell_id_to_search, spell_id_to_search, spell_id_to_search, spell_id_to_search))
            
            # Fetch and write the relevant values to the output file
            records = cursor_item_template.fetchall()
            for record in records:
                entry = record[0]
                name = record[1]
                stat_type10 = record[2]
                spellids = record[3:8]  # Get all spellid columns into a list
                spelltriggers = record[8:13]  # Get all spelltrigger columns into a list

                # Find the index of the targeted spellid in the list of spellids
                spellid_index = spellids.index(spell_id_to_search)

                # Check if stat_type10 is equal to 0 and the associated spelltrigger is equal to 1
                if stat_type10 == 0 and spelltriggers[spellid_index] == 1:
                    output_query = f"--{name}\n"
                    output_query += f"UPDATE item_template SET stat_type10 = {new_stat_type10}, " \
                                    f"stat_value10 = {stat_value}, spellid_{spellid_index + 1} = {spell_id_to_search} " \
                                    f"WHERE entry = {entry};\n\n"
                    # Write the update query to the output file
                    output_file.write(output_query)

            # Close the cursor and connection for item_template database
            cursor_item_template.close()
            connection_item_template.close()

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if connection_acore_world.is_connected():
            cursor_acore_world.close()
            connection_acore_world.close()

print(f"Update queries have been written to {output_file_path}")
