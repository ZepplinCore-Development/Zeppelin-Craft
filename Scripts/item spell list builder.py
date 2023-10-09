import mysql.connector

# Database configuration
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    "database": "acore_world"
}

# List of name-value mappings to determine the stat_type
name_stat_mapping = {
    "Name1": 1,
    "Name2": 2,
    "Name3": 3,
    # Add more mappings as needed
}

# Establish a database connection
try:
    connection = mysql.connector.connect(**db_config)

    # Create a cursor object to interact with the database
    cursor = connection.cursor()

    # Iterate through the list of name-value mappings and update the database
    for name, stat_type in name_stat_mapping.items():
        # Define the SQL query to update the stat_type column based on the name
        update_query = "UPDATE db_Spell_12340 SET stat_type = %s WHERE Name_Lang_enUS = %s"
        cursor.execute(update_query, (stat_type, name))

    # Commit the changes to the database
    connection.commit()

    print("Stat_type values updated successfully based on the name.")

except mysql.connector.Error as error:
    print(f"Error: {error}")
finally:
    # Close the cursor and database connection
    if cursor:
        cursor.close()
    if connection:
        connection.close()
