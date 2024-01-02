import mysql.connector

# Database connection configuration
acore_world_db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    "database": "acore_world"
}

try:
    acore_world_conn = mysql.connector.connect(**acore_world_db_config)
    acore_world_cursor = acore_world_conn.cursor()

    acore_world_cursor.execute("SELECT entry, class, subclass, SoundOverrideSubclass, Material, displayid, InventoryType, sheath FROM item_template WHERE entry >= 91000")
    item_templates = acore_world_cursor.fetchall()

    delete_query = "DELETE FROM dbc.item WHERE itemID >= 91000;"
    print(delete_query)

    # Constructing a single SQL statement for batch insert
    insert_query = "INSERT INTO dbc.item (itemID, ItemClass, ItemSubClass, sound_override_subclassid, MaterialID, ItemDisplayInfo, inventorySlotID, SheathID) VALUES \n"
    values = []

    for item_template in item_templates:
        values.append("(" + ", ".join(str(value) for value in item_template) + ")")

    insert_query += ",\n".join(values) + ";"
    print(insert_query)

    acore_world_cursor.close()
    acore_world_conn.close()

except mysql.connector.Error as err:
    print(f"Error: {err}")
