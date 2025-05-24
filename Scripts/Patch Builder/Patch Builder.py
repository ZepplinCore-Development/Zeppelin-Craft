import mysql.connector
import numbers
import os
import subprocess
import shutil

# TO DO
# Search columns for first use of 'name' display name in the generated queries as a note for better readability
# Package this script into an executable if possible.
# 

# Database connection details
db_config = {
    "host": "192.168.0.55",
    "user": "spell-editor",
    "password": "HW8Y%L6&f0ePJO",
}

backup_dbc = "original_dbc"
live_dbc = "dbc"
world_db = "acore_world"

blacklisted_tables = ["itemsubclass"]

# Directories for updates
update_dir = r'Y:\wow-server\Zeppelin-Craft\Scripts\Patch Builder\Updates'
os.makedirs(update_dir, exist_ok=True)

# Function to establish database connection
def connect_to_db(db_name):
    try:
        conn = mysql.connector.connect(
            host=db_config["host"],
            user=db_config["user"],
            password=db_config["password"],
            database=db_name
        )
        return conn
    except mysql.connector.Error as err:
        print(f"Error connecting to database: {err}")
        return None

# Function to create DBC_backup database if not exists
def create_dbc_backup():
    try:
        conn = connect_to_db(live_dbc)
        with conn.cursor() as cursor:
            # SQL query to create database if not exists
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {backup_dbc};"
            cursor.execute(create_db_query)
            print(f"{backup_dbc} database created successfully or already exists.")

    except mysql.connector.Error as err:
        print(f"Error creating {backup_dbc} database: {err}")

    finally:
        if conn:
            conn.close()

# Function to get tables in a database that contain data
def get_tables_with_data(connection):
    tables_with_data = []
    try:
        with connection.cursor() as cursor:
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()
            tables = [table[0] for table in tables]  # Extract table names from tuples

            for table in tables:
                # Use backticks to escape reserved keywords and special characters
                query = f"SELECT COUNT(*) FROM `{table}`;"
                cursor.execute(query)
                row_count = cursor.fetchone()[0]
                if row_count > 0:
                    tables_with_data.append(table)
    
    except mysql.connector.Error as err:
        print(f"Error retrieving tables: {err}")

    return tables_with_data

# Function to create tables in DBC_backup if they don't exist, by cloning structure and data
def create_tables_in_db_backup():
    try:
        # Connect to DBC_backup database
        conn_dbc_backup = connect_to_db(backup_dbc)
        with conn_dbc_backup.cursor() as cursor_dbc_backup:

            # Connect to live DBC database
            conn_dbc = connect_to_db(live_dbc)
            with conn_dbc.cursor() as cursor_dbc:

                # Get list of tables from live DBC database
                tables = get_tables_with_data(conn_dbc)

                # Iterate through tables and create if not exists in DBC_backup
                for table in tables:
                    # Check if table exists in DBC_backup
                    cursor_dbc_backup.execute(f"SHOW TABLES LIKE '{table}';")
                    result = cursor_dbc_backup.fetchone()
                    if not result:
                        # Table does not exist, clone structure and data from DBC
                        create_table_query = f"CREATE TABLE {backup_dbc}.{table} LIKE {live_dbc}.{table};"
                        cursor_dbc_backup.execute(create_table_query)
                        insert_data_query = f"INSERT INTO {backup_dbc}.{table} SELECT * FROM {live_dbc}.{table};"
                        cursor_dbc_backup.execute(insert_data_query)
                        print(f"Created and populated table {table} in {backup_dbc} database.")

                    else:
                        print(f"Table {table} already exists in {backup_dbc} database.")

                conn_dbc_backup.commit()

    except mysql.connector.Error as err:
        print(f"Error creating tables in {backup_dbc} database: {err}")

    finally:
        if conn_dbc_backup:
            conn_dbc_backup.close()
        if conn_dbc:
            conn_dbc.close()

# Function to fetch all rows from a table
def fetch_all_rows(connection, table_name):
    rows = []
    try:
        with connection.cursor(dictionary=True) as cursor:
            cursor.execute(f"SELECT * FROM `{table_name}`;")  # Ensure backticks around table_name
            rows = cursor.fetchall()

    except mysql.connector.Error as err:
        print(f"Error fetching rows from {table_name}: {err}")

    return rows

# Function to get the primary key column for a table
def get_primary_key_column(connection, table_name):
    composite_keys = {
        "itemsubclass": ["Class", "subClass"],
        # Add more tables and their composite key columns if needed
    }

    if table_name in composite_keys:
        return composite_keys[table_name]

    try:
        with connection.cursor() as cursor:
            cursor.execute(f"SHOW KEYS FROM `{table_name}` WHERE Key_name = 'PRIMARY';")
            primary_key = cursor.fetchone()
            if primary_key:
                return [primary_key[4]]  # Return list with single column name for uniformity
            else:
                # If no primary key found, assume the first column as pseudo key
                cursor.execute(f"SHOW COLUMNS FROM `{table_name}`;")
                columns = cursor.fetchall()
                if columns:
                    return [columns[0][0]]  # Return list with first column name
                else:
                    print(f"No columns found in table {table_name}.")
                    return None

    except mysql.connector.Error as err:
        print(f"Error fetching primary key for {table_name}: {err}")

    return None


# Function to get the default values for a table's columns
def get_column_defaults(connection, table_name):
    defaults = {}
    try:
        with connection.cursor() as cursor:
            cursor.execute(f"SHOW COLUMNS FROM `{table_name}`;")
            columns = cursor.fetchall()
            for column in columns:
                field = column[0]
                default = column[4]
                defaults[field] = default

    except mysql.connector.Error as err:
        print(f"Error fetching column defaults for {table_name}: {err}")

    return defaults

def convert_to_number(value):
    try:
        return int(value)
    except ValueError:
        try:
            return float(value)
        except ValueError:
            return value  # Return as string if conversion fails
    
# Function to check if two values are equivalent considering numeric types
def values_are_equivalent(value1, value2):

    if isinstance(value1, numbers.Number):
        # Convert value2 to a number if possible
        value2_num = convert_to_number(value2)
        return value1 == value2_num
    else:
        # Convert value1 and value2 to strings for comparison
        str_value1 = str(value1)
        str_value2 = str(value2)
        return str_value1 == str_value2

# Function to compare data between dbc and DBC_backup tables
def compare_and_generate_updates():
    try:
        conn_dbc = connect_to_db(live_dbc)
        conn_dbc_backup = connect_to_db(backup_dbc)

        tables = get_tables_with_data(conn_dbc)

        for table in tables:
            rows_dbc = fetch_all_rows(conn_dbc, table)
            rows_dbc_backup = fetch_all_rows(conn_dbc_backup, table)
            primary_key_columns = get_primary_key_column(conn_dbc, table)

            if not rows_dbc or not rows_dbc_backup:
                print(f"No data found in {table} in one of the databases.")
                continue
            elif not primary_key_columns:
                print(f"Skipping {table} due to no primary key or pseudo key.")
                continue
            else:
                print(f"Checking {table} for differences.")
                print(f"Using {primary_key_columns} as Key Columns.")

            column_defaults = get_column_defaults(conn_dbc, table)

            backup_rows_dict = {}
            for row in rows_dbc_backup:
                key = tuple(row[col] for col in primary_key_columns)
                backup_rows_dict[key] = row

            update_queries = []

            for row_dbc in rows_dbc:
                key = tuple(row_dbc[col] for col in primary_key_columns)
                backup_row = backup_rows_dict.get(key)

                if backup_row:
                    if row_dbc != backup_row:
                        update_query = f"UPDATE `{live_dbc}`.`{table}` SET \n"
                        update_fields = []

                        for key, value in row_dbc.items():
                            if backup_row.get(key) != value:
                                if isinstance(value, str):
                                    value = value.replace("\\", "\\\\")
                                    backup_value = backup_row.get(key)
                                    if isinstance(backup_value, str):
                                        backup_value = backup_value.replace("\\", "\\\\")
                                    value = value.replace("'", "''")
                                    update_fields.append(f"    `{key}` = '{value}' /* was '{backup_value}' */")
                                else:
                                    update_fields.append(f"    `{key}` = {value} /* was {backup_row.get(key)} */")

                        if update_fields:
                            update_query += ",\n".join(update_fields)
                            where_clause = " AND ".join(
                                [f"`{col}` = '{row_dbc[col]}'" if isinstance(row_dbc[col], str) else f"`{col}` = {row_dbc[col]}" for col in primary_key_columns]
                            )
                            update_query += f"\nWHERE {where_clause};\n"
                            update_queries.append(update_query)
                else:
                    insert_query = f"DELETE FROM `{live_dbc}`.`{table}` WHERE "
                    insert_query += " AND ".join(
                        [f"`{col}` = '{row_dbc[col]}'" if isinstance(row_dbc[col], str) else f"`{col}` = {row_dbc[col]}" for col in primary_key_columns]
                    )
                    insert_query += f";\nINSERT INTO `{live_dbc}`.`{table}` SET \n"
                    insert_fields = []

                    for key, value in row_dbc.items():
                        if value is not None and value != '' and not values_are_equivalent(value, column_defaults.get(key)):
                            if isinstance(value, str):
                                value = value.replace("\\", "\\\\")
                                value = value.replace("'", "''")
                                insert_fields.append(f"    `{key}` = '{value}'")
                            else:
                                insert_fields.append(f"    `{key}` = {value}")

                    if insert_fields:
                        insert_query += ",\n".join(insert_fields) + ";\n"
                        update_queries.append(insert_query)

            if update_queries:
                sql_file = os.path.join(update_dir, f"update_{table}.sql")
                with open(sql_file, 'w') as f:
                    f.write("\n".join(update_queries) + "\n")

                print(f"Generated update queries for {backup_dbc}.{table}")

    except mysql.connector.Error as err:
        print(f"MySQL Error: {err}")

    finally:
        if conn_dbc:
            conn_dbc.close()
        if conn_dbc_backup:
            conn_dbc_backup.close()

# Function to update ITEM.DBC
def update_item_dbc():
    try:
        acore_world_conn = connect_to_db(world_db)
        acore_world_cursor = acore_world_conn.cursor()

        dbc_conn = connect_to_db(live_dbc)
        dbc_cursor = dbc_conn.cursor()
        
        acore_world_cursor.execute("SELECT entry, class, subclass, SoundOverrideSubclass, Material, displayid, InventoryType, sheath FROM item_template WHERE entry >= 56899")
        item_templates = acore_world_cursor.fetchall()

        delete_query = f"DELETE FROM dbc.item WHERE itemID >= 56899;"

        # Constructing a single SQL statement for batch insert
        insert_query = f"INSERT INTO dbc.item (itemID, ItemClass, ItemSubClass, sound_override_subclassid, MaterialID, ItemDisplayInfo, inventorySlotID, SheathID) VALUES \n"
        values = []

        for item_template in item_templates:
            values.append("(" + ", ".join(str(value) for value in item_template) + ")")

        insert_query += ",\n".join(values) + ";"

        #print(f"{insert_query}")
        dbc_cursor.execute(delete_query)
        dbc_cursor.execute(insert_query)
        
        # Commit the transaction to persist changes
        dbc_conn.commit()

        acore_world_cursor.close()
        acore_world_conn.close()

        dbc_cursor.close()
        dbc_conn.close()

        print(f"ITEM.DBC Updated")

    except mysql.connector.Error as err:
        print(f"Error: {err}")

try:
    update_item_dbc()
    create_dbc_backup()
    create_tables_in_db_backup()
    compare_and_generate_updates()

except Exception as e:
    print(f"An error occurred: {e}")

# Shell script equivalent starts here

base_directory = r'Y:\wow-server'
temp_file = os.path.join(base_directory, 'temp.txt')
file_list = r'Y:\binhex-nginx\nginx\MPQ\mandatory\mandatory_file_list.txt'

print(f"Script is running here {base_directory}")

# Headless export
spell_editor_dir = r'Y:\wow-server\Zeppelin-Tools\WoW Spell Editor'
os.chdir(spell_editor_dir)
subprocess.run(['HeadlessExport.exe'], check=True)

# Copy DBC files to Server
export_dir = os.path.join(spell_editor_dir, 'Export')
destination_dir = r'Y:\wow-server\data\dbc'
shutil.copytree(export_dir, destination_dir, dirs_exist_ok=True)

# Update MPQ files
mpq_editor_dir = r'Y:\wow-server\Zeppelin-Tools\MPQ Editor'
os.chdir(mpq_editor_dir)
subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'MPQ Scripts', 'MPQZ-DBC.txt')], check=True)
subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'MPQ Scripts', 'MPQX-Creatures.txt')], check=True)

# Copy updated Patch Z MPQ file
# mpqZ_patch_src = os.path.join(base_directory, 'Zeppelin-Core', 'MPQ Patches', 'PATCH-Z.MPQ')
# mpqZ_patch_dest = r'Y:\binhex-nginx\nginx\MPQ\mandatory'
# shutil.copy(mpqZ_patch_src, mpqZ_patch_dest)

# Copy updated Patch X MPQ file
# mpqX_patch_src = os.path.join(base_directory, 'Zeppelin-Core', 'MPQ Patches', 'PATCH-X.MPQ')
# mpqX_patch_dest = r'Y:\binhex-nginx\nginx\MPQ\mandatory'
# shutil.copy(mpqX_patch_src, mpqX_patch_dest)

# Update version file
with open(file_list, 'r') as f:
    lines = f.readlines()

server_version = 0
new_lines = []

for line in lines:
    if 'PATCH-Z.MPQ' in line:
        parts = line.split(':')
        server_version = int(parts[1].strip()) + 1
        new_lines.append(f'PATCH-Z.MPQ:{server_version}\n')
    elif 'PATCH-X.MPQ' in line:
        parts = line.split(':')
        server_version = int(parts[1].strip()) + 1
        new_lines.append(f'PATCH-X.MPQ:{server_version}\n')
    else:
        new_lines.append(line)

with open(temp_file, 'w') as f:
    f.writelines(new_lines)

shutil.copy(temp_file, file_list)
os.remove(temp_file)

print("Script completed!")
