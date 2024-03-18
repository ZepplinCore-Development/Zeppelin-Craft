import mysql.connector
import os

# Define the full path of the output file
output_file_path = "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Item Builder\spell_to_stat.sql"

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

    # Reuse the same database configuration for both databases
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

        # Query to fetch values from item_spell_list table
        cursor_acore_world.execute("SELECT ID, EffectBasePoints_1, Name_Lang_enUS, stat_type FROM item_spell_list")

        # Fetch all rows from the table
        spell_rows = cursor_acore_world.fetchall()

        # Create a dictionary to store used stat slots for each item
        used_stat_slots_dict = {}

        # Loop through each row in item_spell_list table
        for spell_row in spell_rows:
            spell_id_to_search = spell_row[0]
            stat_value = spell_row[1]
            stat_name = spell_row[2]
            new_stat_type = spell_row[3]

            # Output the spell name and value
            output_query = f"\n\n\n-- {stat_name}: +{stat_value}: SPELL ({spell_id_to_search})\n\n\n"
            output_file.write(output_query)

            # Database configuration for item_template table (reuse the same configuration)
            db_config_item_template = db_config_acore_world.copy()

            # Connect to the acore_world database for item_template table
            connection_item_template = mysql.connector.connect(**db_config_item_template)

            # Create a cursor for the item_template database
            cursor_item_template = connection_item_template.cursor()

            # Search for entries where any of the spellid columns is equal to spell_id_to_search
            cursor_item_template.execute(
                "SELECT entry, name, spellid_1, spellid_2, spellid_3, spellid_4, spellid_5, "
                "spelltrigger_1, spelltrigger_2, spelltrigger_3, spelltrigger_4, spelltrigger_5, "
                "stat_type1, stat_type2, stat_type3, stat_type4, stat_type5, "
                "stat_type6, stat_type7, stat_type8, stat_type9, stat_type10, "
                "stat_value1, stat_value2, stat_value3, stat_value4, stat_value5, "
                "stat_value6, stat_value7, stat_value8, stat_value9, stat_value10, StatsCount "
                "FROM item_template WHERE "
                "spellid_1 = %s OR spellid_2 = %s OR spellid_3 = %s OR spellid_4 = %s OR spellid_5 = %s",
                (spell_id_to_search, spell_id_to_search, spell_id_to_search, spell_id_to_search, spell_id_to_search))

            # Fetch and write the relevant values to the output file
            records = cursor_item_template.fetchall()
            for record in records:
                entry = record[0]
                name = record[1]
                spell_ids = record[2:7]  # Get all spellid columns into a list
                spell_triggers = record[7:12]  # Get all spelltrigger columns into a list
                stat_types = record[12:22]  # Get all stat_type columns into a list
                stat_values = record[22:32]  # Get all stat_value columns into a list
                stats_count = record[32]  # Get StatsCount

                # Create a list to track used stat slots for this item
                used_stat_slots = []

                # Check if the item has been processed before
                if entry in used_stat_slots_dict:
                    used_stat_slots = used_stat_slots_dict[entry]

                # Find the index of the first empty stat slot (where stat_type is 0 and not in used_stat_slots)
                empty_stat_index = next((i for i, stat_type in enumerate(stat_types) if stat_type == 0 and (i + 1) not in used_stat_slots), -1)

                # Check if an empty slot was found
                if empty_stat_index != -1:
                    # Convert the tuples to lists to allow modification
                    stat_types = list(stat_types)
                    stat_values = list(stat_values)

                    # Update the stat_type and stat_value in the empty slot
                    stat_types[empty_stat_index] = new_stat_type
                    stat_values[empty_stat_index] = stat_value

                    # Mark the slot as used
                    used_stat_slots.append(empty_stat_index + 1)  # Add 1 to convert to 1-based indexing

                    # Store the updated used_stat_slots list in the dictionary
                    used_stat_slots_dict[entry] = used_stat_slots

                    # Prepare the SET clause for the SQL query
                    set_clause = ", ".join([f"stat_type{empty_stat_index + 1} = {stat_types[empty_stat_index]}",
                                            f"stat_value{empty_stat_index + 1} = {stat_values[empty_stat_index]}"])

                    # Check if the corresponding spelltrigger is 1 for the spell we are targeting
                    if spell_triggers[spell_ids.index(spell_id_to_search)] == 1:
                        # Prepare the SET clause for StatsCount
                        set_stats_count_clause = f"StatsCount = {max(used_stat_slots)}"

                        # Generate and write the update query to the output file
                        output_query = f"-- {name} (Used Stat Slots: {', '.join(map(str, used_stat_slots))})\n"
                        output_query += f"UPDATE item_template SET {set_clause}, "
                        output_query += f"spellid_{spell_ids.index(spell_id_to_search) + 1} = 0, "  # Set spellid_x to 0
                        output_query += f"{set_stats_count_clause} "  # Increment StatsCount
                        output_query += f"WHERE entry = {entry};\n\n"
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
