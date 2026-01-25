import mysql.connector
import numbers
import os
import subprocess
import shutil
import re
import json
import hashlib
import stat
import argparse
from datetime import datetime
from dotenv import load_dotenv

# Set umask for file permissions (makes files readable/writable for all users)
os.umask(0o000)

# Load environment variables from .env file
load_dotenv()

# Security validation functions
def validate_identifier(identifier, identifier_type="identifier"):
    """
    Validate database identifiers (table names, column names, database names)
    to prevent SQL injection through identifier names.
    
    Args:
        identifier: The identifier to validate
        identifier_type: Type of identifier for error messages
        
    Returns:
        True if valid, raises ValueError if invalid
    """
    if not identifier:
        raise ValueError(f"Empty {identifier_type} not allowed")
    
    # MySQL identifier rules: alphanumeric, underscore, max 64 chars
    # Allow letters, numbers, underscores, and some special chars common in DBC tables
    if not re.match(r'^[a-zA-Z0-9_$]+$', identifier):
        raise ValueError(f"Invalid {identifier_type}: '{identifier}'. Only alphanumeric characters, underscores, and $ allowed")
    
    if len(identifier) > 64:
        raise ValueError(f"{identifier_type} too long: '{identifier}'. Maximum 64 characters allowed")
    
    return True

def is_reserved_word(identifier):
    """Check if an identifier is a MySQL reserved word"""
    reserved_words = {
        'select', 'insert', 'update', 'delete', 'drop', 'create', 'alter', 
        'table', 'database', 'index', 'view', 'trigger', 'procedure', 'function',
        'union', 'where', 'order', 'group', 'having', 'limit', 'into', 'values'
    }
    return identifier.lower() in reserved_words

def escape_identifier(identifier):
    """
    Escape a MySQL identifier with backticks after validation.
    Reserved words are automatically escaped with backticks.
    
    Args:
        identifier: The identifier to escape
        
    Returns:
        Escaped identifier safe for SQL queries
    """
    validate_identifier(identifier)
    # Always use backticks for reserved words, optional for others but safer to always use
    return f"`{identifier}`"

def validate_numeric_threshold(threshold):
    """
    Validate that threshold is a safe integer.
    
    Args:
        threshold: The numeric threshold to validate
        
    Returns:
        Validated integer or raises ValueError
    """
    try:
        value = int(threshold)
        if value < 0 or value > 999999999:  # Reasonable bounds for item IDs
            raise ValueError(f"Threshold out of safe range: {value}")
        return value
    except (ValueError, TypeError) as e:
        raise ValueError(f"Invalid numeric threshold: {threshold}") from e


# Database connection details from environment variables
db_config = {
    "host": os.getenv("DB_HOST", "localhost"),
    "user": os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASSWORD", ""),
}

backup_dbc = os.getenv("BACKUP_DBC_NAME", "original_dbc")
live_dbc = os.getenv("LIVE_DBC_NAME", "dbc")
world_db = os.getenv("WORLD_DB_NAME", "acore_world")

# Validate database names at startup
try:
    validate_identifier(backup_dbc, "backup database name")
    validate_identifier(live_dbc, "live DBC database name")
    validate_identifier(world_db, "world database name")
except ValueError as e:
    print(f"Configuration error: {e}")
    exit(1)


# Custom item threshold from environment - validate it
try:
    custom_item_threshold = validate_numeric_threshold(os.getenv("CUSTOM_ITEM_THRESHOLD", "56899"))
except ValueError as e:
    print(f"Configuration error in CUSTOM_ITEM_THRESHOLD: {e}")
    exit(1)

# Directories for updates (defaults to "Updates" subdirectory relative to script)
update_dir = os.getenv("UPDATE_DIR", "Updates")
# Handle relative paths
if not os.path.isabs(update_dir):
    script_dir = os.path.dirname(os.path.abspath(__file__))
    update_dir = os.path.join(script_dir, update_dir)
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
            # SQL query to create database if not exists - using validated identifier
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {escape_identifier(backup_dbc)};"
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
                try:
                    # Validate and escape table name to prevent SQL injection
                    escaped_table = escape_identifier(table)
                    query = f"SELECT COUNT(*) FROM {escaped_table};"
                    cursor.execute(query)
                except ValueError as e:
                    print(f"Skipping invalid table name '{table}': {e}")
                    continue
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
                    try:
                        # Validate table name
                        validate_identifier(table, "table name")
                        
                        # Check if table exists in DBC_backup - use parameterized query
                        cursor_dbc_backup.execute("SHOW TABLES LIKE %s;", (table,))
                        result = cursor_dbc_backup.fetchone()
                        if not result:
                            # Table does not exist, clone structure and data from DBC
                            # Using escaped identifiers for safe query construction
                            backup_db_escaped = escape_identifier(backup_dbc)
                            live_db_escaped = escape_identifier(live_dbc)
                            table_escaped = escape_identifier(table)
                            
                            create_table_query = f"CREATE TABLE {backup_db_escaped}.{table_escaped} LIKE {live_db_escaped}.{table_escaped};"
                            cursor_dbc_backup.execute(create_table_query)
                            insert_data_query = f"INSERT INTO {backup_db_escaped}.{table_escaped} SELECT * FROM {live_db_escaped}.{table_escaped};"
                            cursor_dbc_backup.execute(insert_data_query)
                            print(f"Created and populated table {table} in {backup_dbc} database.")
                    except ValueError as e:
                        print(f"Skipping invalid table name '{table}': {e}")
                        continue

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
            # Validate and escape table name to prevent SQL injection
            escaped_table = escape_identifier(table_name)
            cursor.execute(f"SELECT * FROM {escaped_table};")
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
            # Validate and escape table name to prevent SQL injection
            escaped_table = escape_identifier(table_name)
            cursor.execute(f"SHOW KEYS FROM {escaped_table} WHERE Key_name = 'PRIMARY';")
            primary_key = cursor.fetchone()
            if primary_key:
                return [primary_key[4]]  # Return list with single column name for uniformity
            else:
                # If no primary key found, assume the first column as pseudo key
                cursor.execute(f"SHOW COLUMNS FROM {escaped_table};")
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
            # Validate and escape table name to prevent SQL injection
            escaped_table = escape_identifier(table_name)
            cursor.execute(f"SHOW COLUMNS FROM {escaped_table};")
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

            # Use escaped identifiers for safe query construction - define once per table
            live_db_escaped = escape_identifier(live_dbc)
            table_escaped = escape_identifier(table)
            
            for row_dbc in rows_dbc:
                key = tuple(row_dbc[col] for col in primary_key_columns)
                backup_row = backup_rows_dict.get(key)

                if backup_row:
                    if row_dbc != backup_row:
                        update_query = f"UPDATE {live_db_escaped}.{table_escaped} SET \n"
                        update_fields = []

                        for key, value in row_dbc.items():
                            if backup_row.get(key) != value:
                                try:
                                    # Validate column name to prevent SQL injection
                                    validate_identifier(key, "column name")
                                    escaped_key = escape_identifier(key)
                                    
                                    if isinstance(value, str):
                                        value = value.replace("\\", "\\\\")
                                        backup_value = backup_row.get(key)
                                        if isinstance(backup_value, str):
                                            backup_value = backup_value.replace("\\", "\\\\")
                                        value = value.replace("'", "''")
                                        update_fields.append(f"    {escaped_key} = '{value}' /* was '{backup_value}' */")
                                    else:
                                        update_fields.append(f"    {escaped_key} = {value} /* was {backup_row.get(key)} */")
                                except ValueError as e:
                                    print(f"Skipping invalid column name '{key}' in table {table}: {e}")
                                    continue

                        if update_fields:
                            update_query += ",\n".join(update_fields)
                            # Validate primary key column names
                            where_conditions = []
                            for col in primary_key_columns:
                                try:
                                    validate_identifier(col, "primary key column")
                                    escaped_col = escape_identifier(col)
                                    if isinstance(row_dbc[col], str):
                                        where_conditions.append(f"{escaped_col} = '{row_dbc[col]}'")
                                    else:
                                        where_conditions.append(f"{escaped_col} = {row_dbc[col]}")
                                except ValueError as e:
                                    print(f"Skipping invalid primary key column '{col}' in table {table}: {e}")
                                    continue
                            where_clause = " AND ".join(where_conditions)
                            update_query += f"\nWHERE {where_clause};\n"
                            update_queries.append(update_query)
                else:
                    insert_query = f"DELETE FROM {live_db_escaped}.{table_escaped} WHERE "
                    # Validate primary key column names for DELETE clause
                    where_conditions = []
                    for col in primary_key_columns:
                        try:
                            validate_identifier(col, "primary key column")
                            escaped_col = escape_identifier(col)
                            if isinstance(row_dbc[col], str):
                                where_conditions.append(f"{escaped_col} = '{row_dbc[col]}'")
                            else:
                                where_conditions.append(f"{escaped_col} = {row_dbc[col]}")
                        except ValueError as e:
                            print(f"Skipping invalid primary key column '{col}' in table {table}: {e}")
                            continue
                    insert_query += " AND ".join(where_conditions)
                    insert_query += f";\nINSERT INTO {live_db_escaped}.{table_escaped} SET \n"
                    insert_fields = []

                    for key, value in row_dbc.items():
                        if value is not None and value != '' and not values_are_equivalent(value, column_defaults.get(key)):
                            try:
                                # Validate column name to prevent SQL injection
                                validate_identifier(key, "column name")
                                escaped_key = escape_identifier(key)
                                
                                if isinstance(value, str):
                                    value = value.replace("\\", "\\\\")
                                    value = value.replace("'", "''")
                                    insert_fields.append(f"    {escaped_key} = '{value}'")
                                else:
                                    insert_fields.append(f"    {escaped_key} = {value}")
                            except ValueError as e:
                                print(f"Skipping invalid column name '{key}' in table {table}: {e}")
                                continue

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

# Parse command-line arguments
parser = argparse.ArgumentParser(description='Patch Builder - Generate DBC diffs and build MPQ patches')
parser.add_argument('--db-diff-only', action='store_true',
                    help='Generate SQL diffs only (skip GUI tools and MPQ building)')
parser.add_argument('--build-patch-o', action='store_true',
                    help='Build PATCH-O.MPQ (runs Resource Parser + builds MPQ)')
parser.add_argument('--build-patch-o-mpq-only', action='store_true',
                    help='Build PATCH-O.MPQ only (skip Resource Parser, use existing exports)')
args = parser.parse_args()

# Determine build mode based on command-line args
build_patch_o = False
run_resource_parser = False

if args.build_patch_o:
    print("\n" + "="*60)
    print("PATCH BUILDER - PATCH-O Only Mode")
    print("="*60)
    print("Running Resource Parser + building PATCH-O.MPQ...")
    print("="*60 + "\n")
    build_patch_z = False
    build_patch_x = False
    build_patch_o = True
    run_resource_parser = True
elif args.build_patch_o_mpq_only:
    print("\n" + "="*60)
    print("PATCH BUILDER - PATCH-O MPQ Only Mode")
    print("="*60)
    print("Building PATCH-O.MPQ from existing exports (skipping Resource Parser)...")
    print("="*60 + "\n")
    build_patch_z = False
    build_patch_x = False
    build_patch_o = True
    run_resource_parser = False
elif args.db_diff_only:
    print("\n" + "="*60)
    print("PATCH BUILDER - DB Diff Only Mode")
    print("="*60)
    print("Generating SQL diffs from DBC database changes...")
    print("Skipping: HeadlessExport.exe and MPQ building")
    print("="*60 + "\n")
    build_patch_z = True
    build_patch_x = False
else:
    # Prompt user for which patches to build FIRST before any processing
    print("\n" + "="*60)
    print("PATCH BUILDER - Select patches to build")
    print("="*60)
    print("1) PATCH-Z.MPQ only (DBC + AtlasLoot)")
    print("2) PATCH-X.MPQ only (Custom content)")
    print("3) Both Z and X patches")
    print("4) PATCH-O.MPQ only (Resource Parser + MPQ)")
    print("5) PATCH-O.MPQ only (MPQ only - skip parser)")
    print("6) All patches (Z, X, and O)")
    print("="*60)

    while True:
        choice = input("Enter your choice (1-6): ").strip()
        if choice in ['1', '2', '3', '4', '5', '6']:
            break
        print("Invalid choice. Please enter 1, 2, 3, 4, 5, or 6.")

    build_patch_z = choice in ['1', '3', '6']
    build_patch_x = choice in ['2', '3', '6']
    build_patch_o = choice in ['4', '5', '6']
    run_resource_parser = choice in ['4', '6']  # Skip parser for option 5

    patches_to_build = []
    if build_patch_z:
        patches_to_build.append('PATCH-Z')
    if build_patch_x:
        patches_to_build.append('PATCH-X')
    if build_patch_o:
        patches_to_build.append('PATCH-O')
    print(f"\nBuilding: {', '.join(patches_to_build)}")
    print("="*60 + "\n")

# Function to update ITEM.DBC
def update_item_dbc():
    try:
        acore_world_conn = connect_to_db(world_db)
        acore_world_cursor = acore_world_conn.cursor()

        dbc_conn = connect_to_db(live_dbc)
        dbc_cursor = dbc_conn.cursor()
        
        # Use parameterized queries to prevent SQL injection
        acore_world_cursor.execute("SELECT entry, class, subclass, SoundOverrideSubclass, Material, displayid, InventoryType, sheath FROM item_template WHERE entry >= %s", (custom_item_threshold,))
        item_templates = acore_world_cursor.fetchall()

        delete_query = "DELETE FROM dbc.item WHERE itemID >= %s;"

        # Constructing a single SQL statement for batch insert
        insert_query = f"INSERT INTO dbc.item (itemID, ItemClass, ItemSubClass, sound_override_subclassid, MaterialID, ItemDisplayInfo, inventorySlotID, SheathID) VALUES \n"
        values = []

        for item_template in item_templates:
            values.append("(" + ", ".join(str(value) for value in item_template) + ")")

        insert_query += ",\n".join(values) + ";"

        dbc_cursor.execute(delete_query, (custom_item_threshold,))
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

# Only generate DBC diffs when building Patch-Z
if build_patch_z:
    try:
        update_item_dbc()
        create_dbc_backup()
        create_tables_in_db_backup()
        compare_and_generate_updates()

    except Exception as e:
        print(f"An error occurred during DBC diff generation: {e}")

# Shell script equivalent starts here

# Get paths from environment variables (required - no fallbacks)
def get_required_env(name):
    value = os.getenv(name)
    if not value:
        print(f"ERROR: Required environment variable {name} is not set.")
        print("Please configure your .env file with all required paths.")
        exit(1)
    return value

base_directory = get_required_env("BASE_DIRECTORY")
spell_editor_dir = os.getenv("SPELL_EDITOR_DIR") or os.path.join(base_directory, 'Zeppelin-Tools', 'WoW Spell Editor')
headless_exporter_dir = os.path.join(spell_editor_dir, 'HeadlessExporter')
mpq_editor_dir = os.getenv("MPQ_EDITOR_DIR") or os.path.join(base_directory, 'Zeppelin-Tools', 'MPQ Editor')
destination_dir = os.getenv("SERVER_DATA_DIR") or os.path.join(base_directory, 'data', 'dbc')

# Local patch register is always in the Patch Builder directory (source of truth)
local_patch_register_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'patch_register.json')
# Export/publish location (NGINX) for the launcher to read
export_patch_register_path = get_required_env("PATCH_REGISTER_PATH")


# Functions for patch register management
def load_patch_register():
    """Load the patch register JSON file from local directory"""
    try:
        with open(local_patch_register_path, 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Warning: Patch register not found at {local_patch_register_path}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error parsing patch register JSON: {e}")
        return None

def save_patch_register(register_data):
    """Save the patch register JSON file to local directory and export to NGINX"""
    success = True

    # Save to local location (source of truth)
    try:
        # Ensure directory exists and is writable
        register_dir = os.path.dirname(local_patch_register_path)
        if not os.path.exists(register_dir):
            os.makedirs(register_dir, exist_ok=True)

        # Try to make file writable if it exists
        if os.path.exists(local_patch_register_path):
            try:
                os.chmod(local_patch_register_path, 0o666)
            except:
                pass  # Continue even if chmod fails

        with open(local_patch_register_path, 'w') as f:
            json.dump(register_data, f, indent=2)

        # Set file permissions to be accessible from host
        try:
            os.chmod(local_patch_register_path, 0o666)
        except:
            pass

        print(f"✓ Patch register saved locally: {local_patch_register_path}")

    except Exception as e:
        print(f"✗ Error saving patch register to local location: {e}")
        success = False
        return success  # Don't export if local save failed

    # Export to NGINX location for launcher consumption
    try:
        # Ensure NGINX directory exists
        export_dir = os.path.dirname(export_patch_register_path)
        if not os.path.exists(export_dir):
            os.makedirs(export_dir, exist_ok=True)

        with open(export_patch_register_path, 'w') as f:
            json.dump(register_data, f, indent=2)
        print(f"✓ Patch register exported to: {export_patch_register_path}")

    except Exception as e:
        print(f"⚠ Warning: Could not export patch register to NGINX: {e}")
        # Don't mark as failure since local save succeeded

    return success

def calculate_file_checksum(file_path):
    """Calculate MD5 checksum of a file"""
    if not os.path.exists(file_path):
        return ""
    
    hash_md5 = hashlib.md5()
    try:
        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()
    except Exception as e:
        print(f"Error calculating checksum for {file_path}: {e}")
        return ""

def get_file_size_mb(file_path):
    """Get file size in MB"""
    if not os.path.exists(file_path):
        return 0
    try:
        size_bytes = os.path.getsize(file_path)
        return round(size_bytes / (1024 * 1024), 1)
    except Exception as e:
        print(f"Error getting file size for {file_path}: {e}")
        return 0

def update_patch_metadata(patch_register, patch_name, nginx_base_path=None):
    """Update metadata for a specific patch after it's been built"""
    if not patch_register or patch_name not in patch_register.get('patches', {}):
        print(f"Patch {patch_name} not found in register")
        return False

    patch_info = patch_register['patches'][patch_name]

    # Validate file_path field exists
    if 'file_path' not in patch_info:
        print(f"Error: {patch_name} missing 'file_path' field in patch register")
        return False

    # Determine file path
    if nginx_base_path:
        file_path = os.path.join(nginx_base_path, patch_info['file_path'])
    else:
        # NGINX path from environment (required)
        nginx_base = get_required_env("NGINX_BASE_PATH")
        file_path = os.path.join(nginx_base, patch_info['file_path'])

    # Update metadata
    patch_info['version'] += 1
    patch_info['last_modified'] = datetime.now().isoformat() + 'Z'
    patch_info['checksum'] = calculate_file_checksum(file_path)
    patch_info['size_mb'] = get_file_size_mb(file_path)

    # Update server metadata
    patch_register['last_updated'] = datetime.now().isoformat() + 'Z'
    patch_register['server_metadata']['last_build_timestamp'] = datetime.now().isoformat() + 'Z'

    print(f"Updated metadata for {patch_name}: v{patch_info['version']}")
    return True

def check_file_permissions():
    """Check if we can write to the local patch register file"""
    try:
        # Test write access to the directory
        test_file = os.path.join(os.path.dirname(local_patch_register_path), 'write_test.tmp')
        with open(test_file, 'w') as f:
            f.write('test')
        os.remove(test_file)

        # Test write access to the patch register file if it exists
        if os.path.exists(local_patch_register_path):
            if not os.access(local_patch_register_path, os.W_OK):
                print(f"Warning: {local_patch_register_path} is not writable")
                return False

        return True
    except Exception as e:
        print(f"Warning: Cannot write to patch register directory: {e}")
        print("Consider running as administrator or checking network permissions")
        return False


print(f"Script is running here {base_directory}")

# Check file permissions before proceeding
check_file_permissions()

# Headless export (only needed for PATCH-Z and when not in db-diff-only mode)
# Uses HeadlessExporter subfolder which has matched pair of HeadlessExport.exe + SpellEditor.exe v2.1.0
if build_patch_z and not args.db_diff_only:
    os.chdir(headless_exporter_dir)
    subprocess.run(['HeadlessExport.exe'], check=True)

# Post-process: Reorder CharSections.dbc by race/gender grouping (only needed for PATCH-Z and not in db-diff-only mode)
# HeadlessExport sorts by ID which breaks client expectations for race/gender grouping
if build_patch_z and not args.db_diff_only:
    export_dir = os.path.join(headless_exporter_dir, 'Export')
    charsections_path = os.path.join(export_dir, 'CharSections.dbc')

    if os.path.exists(charsections_path):
        print("\nReordering CharSections.dbc for proper race/gender grouping...")
        try:
            # Import the reordering module
            import sys
            sys.path.insert(0, os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder'))
            from dbc_reorder import reorder_charsections

            # Reorder in-place (no backup needed - HeadlessExport already has originals)
            if reorder_charsections(charsections_path, backup=False):
                print("✓ CharSections.dbc reordered successfully")
            else:
                print("⚠ Warning: CharSections.dbc reordering failed, using original export")
        except Exception as e:
            print(f"⚠ Warning: Could not reorder CharSections.dbc: {e}")
            print("  Continuing with original export...")

    # Copy DBC files to Server
    shutil.copytree(export_dir, destination_dir, dirs_exist_ok=True)

# Generate AtlasLoot tables from database (AtlasLoot is in PATCH-Z)
if not args.db_diff_only and build_patch_z:
    print("\n" + "="*60)
    print("Generating AtlasLoot tables from database...")
    print("="*60)

    atlasloot_generator = os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder', 'AtlasLoot Generator', 'generate_atlasloot.py')

    if os.path.exists(atlasloot_generator):
        try:
            # Run generator for all content (vanilla dungeons, vanilla raids, TBC)
            result = subprocess.run(
                [sys.executable, atlasloot_generator, '--all'],
                cwd=os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder', 'AtlasLoot Generator'),
                capture_output=True,
                text=True,
                check=False
            )

            if result.returncode == 0:
                print("✓ AtlasLoot tables updated successfully")
                # Show summary and warnings from generator output
                for line in result.stdout.split('\n'):
                    if 'Summary:' in line or '[OK]' in line or '✓' in line:
                        print(f"  {line}")
                    elif '[WARN]' in line:
                        print(f"  {line}")
            else:
                print("⚠ Warning: AtlasLoot generator completed with warnings")
                print(f"  Exit code: {result.returncode}")
                if result.stderr:
                    print(f"  Error output:\n{result.stderr}")
                if result.stdout:
                    # Show last 20 lines of stdout for context
                    stdout_lines = result.stdout.strip().split('\n')
                    print(f"  Last output lines:")
                    for line in stdout_lines[-20:]:
                        print(f"    {line}")
        except Exception as e:
            print(f"⚠ Warning: Could not run AtlasLoot generator: {e}")
            print("  Continuing with existing AtlasLoot data...")
    else:
        print("⚠ Warning: AtlasLoot generator not found, skipping...")

# Update MPQ files (skip in db-diff-only mode)
if not args.db_diff_only:
    os.chdir(mpq_editor_dir)

    if build_patch_z:
        print("\nBuilding PATCH-Z.MPQ...")
        subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder', 'MPQ Scripts', 'MPQZ-DBC.txt')], check=True)
        print("✓ PATCH-Z.MPQ built successfully")

    if build_patch_x:
        print("\nBuilding PATCH-X.MPQ...")
        subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder', 'MPQ Scripts', 'MPQX-Custom-Content.txt')], check=True)
        print("✓ PATCH-X.MPQ built successfully")

    if build_patch_o:
        print("\nBuilding PATCH-O.MPQ...")

        # Step 1: Run Resource Parser for extraction (if requested)
        if run_resource_parser:
            resource_parser_script = os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Resource Parser', 'resource_parser.py')
            if os.path.exists(resource_parser_script):
                print("  Running Resource Parser for asset extraction...")
                try:
                    subprocess.run(
                        ['python', resource_parser_script],
                        cwd=os.path.dirname(resource_parser_script),
                        check=True
                    )
                    print("  ✓ Resource Parser extraction complete")
                except subprocess.CalledProcessError as e:
                    print(f"  ✗ Resource Parser failed with exit code {e.returncode}")
                    build_patch_o = False
            else:
                print(f"  ✗ Resource Parser not found: {resource_parser_script}")
                build_patch_o = False
        else:
            print("  Skipping Resource Parser (using existing exports)")

        # Step 2: Build MPQ from exports
        if build_patch_o:
            # Note: n (new) command handles existing files - "converts to MPQ"
            # No need to delete first
            print("  Building MPQ from exports...")
            subprocess.run(['MPQEditor.exe', '/console', os.path.join(base_directory, 'Zeppelin-Craft', 'Scripts', 'Patch Builder', 'MPQ Scripts', 'MPQO-Open-Azeroth.txt')], check=True)
            print("✓ PATCH-O.MPQ built successfully")


# Update patch register with new versions (skip in db-diff-only mode)
if not args.db_diff_only:
    patch_register = load_patch_register()
    if patch_register:
        print("\nUpdating patch register...")

        # Update metadata only for patches that were built
        if build_patch_z:
            z_success = update_patch_metadata(patch_register, 'PATCH-Z.MPQ')
            if not z_success:
                print("Warning: Failed to update PATCH-Z.MPQ metadata")

        if build_patch_x:
            x_success = update_patch_metadata(patch_register, 'PATCH-X.MPQ')
            if not x_success:
                print("Warning: Failed to update PATCH-X.MPQ metadata")

        if build_patch_o:
            o_success = update_patch_metadata(patch_register, 'PATCH-O.MPQ')
            if not o_success:
                print("Warning: Failed to update PATCH-O.MPQ metadata")

        # Update server build number
        patch_register['server_metadata']['build_number'] += 1

        # Only increment DBC version if PATCH-Z was built
        if build_patch_z:
            patch_register['server_metadata']['dbc_version'] += 1

        # Save updated register to both local and NGINX locations
        if save_patch_register(patch_register):
            print("✓ Patch register updated successfully")
        else:
            print("✗ Failed to save patch register")
    else:
        print("Warning: Could not load patch register, skipping version updates")

print("\n" + "="*60)
if args.db_diff_only:
    print("DB DIFF GENERATION COMPLETE")
    print("="*60)
    print("✓ SQL diffs generated in Updates folder")
elif args.build_patch_o:
    print("PATCH-O BUILD COMPLETE")
    print("="*60)
    if build_patch_o:
        print("✓ PATCH-O.MPQ (Open Azeroth)")
    else:
        print("✗ PATCH-O.MPQ build failed")
else:
    print("PATCH BUILD COMPLETE")
    print("="*60)
    if build_patch_z:
        print("✓ PATCH-Z.MPQ (DBC + AtlasLoot)")
    if build_patch_x:
        print("✓ PATCH-X.MPQ (Custom content)")
    if build_patch_o:
        print("✓ PATCH-O.MPQ (Open Azeroth)")
print("="*60)
