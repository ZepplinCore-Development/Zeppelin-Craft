import mysql.connector

# Define the database connection parameters
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    "database": "acore_world"
}

# Establish a connection to the database
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Define the upper and lower entry range values for the item_template table
lower_range = 900120
upper_range = 900188

# Define loot table
loot_table = 9100400

# Retrieve data from the item_template table based on the specified entry range
query = f"SELECT entry, name FROM item_template WHERE entry BETWEEN {lower_range} AND {upper_range}"
cursor.execute(query)
items = cursor.fetchall()
print(f"DELETE FROM `reference_loot_template` WHERE (`Entry` = {loot_table});")

print(f"INSERT INTO `reference_loot_template` (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES")
# Generate SQL INSERT statements for the reference_loot_template table based on the retrieved data
for item in items:
    entry, name = item[0], item[1]
    insert_query = f"   ({loot_table}, {entry}, 0, 0, 0, 1, 0, 1, 1, '{name}'),"
    print(insert_query)  # Print the SQL INSERT statement

# Commit the changes and close the connection
conn.commit()
conn.close()
