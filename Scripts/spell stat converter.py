import mysql.connector

# Database configuration
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    "database": "acore_world"
}

# Define the spell_id to search for
spell_id_to_search = 14056

# Define the new values for stat_type10, stat_value10, spell_id1, and StatsCount increment
new_stat_type10 = 38
new_stat_value10 = 50
new_spell_id1 = 0
stats_count_increment = 1  # Adjust this value as needed

try:
    # Connect to the MySQL server
    connection = mysql.connector.connect(**db_config)

    if connection.is_connected():
        print("Connected to MySQL database")

        # Create a cursor object to interact with the database
        cursor = connection.cursor()

        # Search for entries where spellid_1 is equal to spell_id_to_search
        cursor.execute("SELECT entry, stat_type10 FROM item_template WHERE spellid_1 = %s", (spell_id_to_search,))

        # Fetch and print the 'entry' and 'stat_type10' values
        records = cursor.fetchall()
        for record in records:
            entry = record[0]
            stat_type10 = record[1]
            
            if stat_type10 == 0:
                print(f"Formed query for updating entry {entry}:")
                update_query = f"UPDATE item_template SET stat_type10 = {new_stat_type10}, stat_value10 = {new_stat_value10}, spellid_1 = {new_spell_id1}, StatsCount = StatsCount + {stats_count_increment} WHERE entry = {entry};"
                print(update_query)

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed")
