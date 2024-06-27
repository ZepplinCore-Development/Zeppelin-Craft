import mysql.connector
import os
import shutil
from datetime import datetime

# Database connection details
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
}

backup_dbc = "DBC_backup"
live_dbc = "dbc"

# Directories for updates
update_dir = 'C:\\Games\\ChromieCraft_3.3.5a\\Custom Tools\\Zeppelin-Core\\Scripts\\Patch Builder\\updates'
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

# Function to get tables in a database
def get_tables_in_db(connection):
    tables = []
    try:
        with connection.cursor() as cursor:
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()
            tables = [table[0] for table in tables]  # Extract table names from tuples

    except mysql.connector.Error as err:
        print(f"Error retrieving tables: {err}")

    return tables

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
                tables = get_tables_in_db(conn_dbc)

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
    try:
        with connection.cursor() as cursor:
            cursor.execute(f"SHOW KEYS FROM `{table_name}` WHERE Key_name = 'PRIMARY';")
            primary_key = cursor.fetchone()
            if primary_key:
                return primary_key[4]  # Column name is at index 4
            else:
                # If no primary key found, assume the first column as pseudo key
                cursor.execute(f"SHOW COLUMNS FROM `{table_name}`;")
                columns = cursor.fetchall()
                if columns:
                    return columns[0][0]  # First column name
                else:
                    print(f"No columns found in table {table_name}.")
                    return None

    except mysql.connector.Error as err:
        print(f"Error fetching primary key for {table_name}: {err}")

    return None

# Function to compare data between dbc and DBC_backup tables
def compare_and_generate_updates():
    try:
        # Connect to dbc and DBC_backup databases
        conn_dbc = connect_to_db(live_dbc)
        conn_dbc_backup = connect_to_db(backup_dbc)

        # Get list of tables from live DBC database
        tables = get_tables_in_db(conn_dbc)

        # Iterate through tables and compare data
        for table in tables:
            # Fetch all rows from dbc and DBC_backup tables
            rows_dbc = fetch_all_rows(conn_dbc, table)
            rows_dbc_backup = fetch_all_rows(conn_dbc_backup, table)
            primary_key_column = get_primary_key_column(conn_dbc, table)

            if not rows_dbc or not rows_dbc_backup:
                print(f"No data found in {table} in one of the databases.")
                continue
            else:
                print(f"Checking {table} for differences.")
                print(f"Using {primary_key_column} as Key Column.")

            # Compare each row
            for row_dbc in rows_dbc:
                found_match = False
                for row_dbc_backup in rows_dbc_backup:
                    if row_dbc[primary_key_column] == row_dbc_backup[primary_key_column]:
                        found_match = True
                        if row_dbc != row_dbc_backup:
                            # Generate update query to sync DBC_backup with dbc
                            update_query = f"UPDATE `{backup_dbc}`.`{table}` SET "
                            update_fields = []

                            for key, value in row_dbc.items():
                                if row_dbc_backup.get(key) != value:
                                    update_fields.append(f"`{key}` = '{value}'")

                            if update_fields:
                                update_query += ", ".join(update_fields)
                                update_query += f" WHERE `{primary_key_column}` = '{row_dbc[primary_key_column]}';"

                                # Save the update query to a SQL file
                                sql_file = os.path.join(update_dir, f"update_{table}_{row_dbc[primary_key_column]}.sql")
                                with open(sql_file, 'w') as f:
                                    f.write(update_query + "\n")

                                print(f"Generated update query for {backup_dbc}.{table} for {primary_key_column} = {row_dbc[primary_key_column]}")
                        break
                
                if not found_match:
                    print(f"No match found for {primary_key_column} = {row_dbc[primary_key_column]} in {backup_dbc}.{table}")

    except mysql.connector.Error as err:
        print(f"MySQL Error: {err}")

    finally:
        if conn_dbc:
            conn_dbc.close()
        if conn_dbc_backup:
            conn_dbc_backup.close()

try:
    create_dbc_backup()
    create_tables_in_db_backup()
    compare_and_generate_updates()

except Exception as e:
    print(f"An error occurred: {e}")



# Shell script equivalent starts here

base_directory = r'C:\Games\ChromieCraft_3.3.5a\Custom Tools'
temp_file = os.path.join(base_directory, 'temp.txt')
file_list = r'Z:\binhex-nginx\nginx\MPQ\mandatory\mandatory_file_list.txt'

print(f"Script is running here {base_directory}")

# Headless export
spell_editor_dir = os.path.join(base_directory, 'WoW Spell Editor')
os.chdir(spell_editor_dir)
subprocess.run(['HeadlessExport.exe'], check=True)

# Copy DBC files
export_dir = os.path.join(spell_editor_dir, 'Export')
destination_dir = r'R:\env\dist\bin\dbc'
shutil.copytree(export_dir, destination_dir, dirs_exist_ok=True)

# Update MPQ files
mpq_editor_dir = os.path.join(base_directory, 'MPQ Editor')
os.chdir(mpq_editor_dir)
subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Core', 'Scripts', 'MPQ Scripts', 'MPQZ-DBC.txt')], check=True)
subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Core', 'Scripts', 'MPQ Scripts', 'MPQZ-Creatures.txt')], check=True)

# Copy updated MPQ file
mpq_patch_src = os.path.join(base_directory, 'Zeppelin-Core', 'MPQ Patches', 'PATCH-Z.MPQ')
mpq_patch_dest = r'Z:\binhex-nginx\nginx\MPQ\mandatory'
shutil.copy(mpq_patch_src, mpq_patch_dest)

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
    else:
        new_lines.append(line)

with open(temp_file, 'w') as f:
    f.writelines(new_lines)

shutil.copy(temp_file, file_list)
os.remove(temp_file)

print("Script completed!")
