import mysql.connector

# Database configuration
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    "database": "acore_world"
}

# Define the list of spell IDs to search for
spell_ids_to_search = [9136, 9137, 9138, 9139, 9140, 9141, 9142, 9329, 9330, 9331, 9332, 14027, 9334, 9335, 9336, 15807, 15806, 14089, 15808, 14049, 15809, 15810, 15811, 9333, 14056, 15812, 15813, 15814, 15815, 14052, 15816, 15817, 15818, 15819, 15820, 15821, 15823, 15824, 15825, 15826, 15827, 15828, 15829, 15830, 15831, 15832, 29524, 33485, 28840, 28735, 42107, 36068, 34509, 33782, 40933, 48015, 42039, 39885]  # Replace with your list of spell IDs


# Define the stat_name
stat_name = "attack power"  # Replace with the actual stat name

# Define the initial values and increment for stat_value10
starting_value = 2
value_increment = 2

# Define the new values for stat_type10, stat_value10, spell_id1, spell_id2, and StatsCount increment
new_stat_type10 = 38
new_spell_id = 0
stats_count_increment = 1  # Adjust this value as needed

try:
    # Connect to the MySQL server
    connection = mysql.connector.connect(**db_config)

    if connection.is_connected():
        print("Connected to MySQL database")

        # Create a cursor object to interact with the database
        cursor = connection.cursor()

        # Loop through each spell ID in the list
        for spell_id_to_search in spell_ids_to_search:

            # Print the stat_name along with the current value_increment
            print(f"-- +{starting_value} {stat_name}")

            # Search for entries where spellid_1, spellid_2, or spellid_3 is equal to spell_id_to_search
            cursor.execute("SELECT entry, name, stat_type10, spellid_1, spellid_2, spellid_3 FROM item_template WHERE spellid_1 = %s OR spellid_2 = %s OR spellid_3 = %s", (spell_id_to_search, spell_id_to_search, spell_id_to_search))

            # Fetch and print the 'entry', 'name', 'stat_type10', 'spellid_1', 'spellid_2', and 'spellid_3' values
            records = cursor.fetchall()
            for record in records:
                entry = record[0]
                name = record[1]
                stat_type10 = record[2]
                spellid_1 = record[3]
                spellid_2 = record[4]
                spellid_3 = record[5]
                
                if stat_type10 == 0:
                    print(f"--{name}")
                    if spellid_1 == spell_id_to_search:
                        update_query = f"UPDATE item_template SET stat_type10 = {new_stat_type10}, stat_value10 = {starting_value}, spellid_1 = {new_spell_id}, StatsCount = StatsCount + {stats_count_increment} WHERE entry = {entry};"
                    elif spellid_2 == spell_id_to_search:
                        update_query = f"UPDATE item_template SET stat_type10 = {new_stat_type10}, stat_value10 = {starting_value}, spellid_2 = {new_spell_id}, StatsCount = StatsCount + {stats_count_increment} WHERE entry = {entry};"
                    elif spellid_3 == spell_id_to_search:
                        update_query = f"UPDATE item_template SET stat_type10 = {new_stat_type10}, stat_value10 = {starting_value}, spellid_3 = {new_spell_id}, StatsCount = StatsCount + {stats_count_increment} WHERE entry = {entry};"
                    print(update_query)

            # Increment the starting_value for the next spell
            starting_value += value_increment

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed")
