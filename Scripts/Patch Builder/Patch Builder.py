import mysql.connector
import os

# Database connection details
db_config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',  # Use the remote host address
    'database': 'dbc'
}

# Directory to save the SQL files
backup_dir = 'path_to_backup_directory'

if not os.path.exists(backup_dir):
    os.makedirs(backup_dir)

# Connect to the database
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Get the list of tables
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()

for (table_name,) in tables:
    print(f"Backing up table: {table_name}")
    backup_file = os.path.join(backup_dir, f"{table_name}.sql")

    # Get the column names
    cursor.execute(f"SHOW COLUMNS FROM {table_name}")
    columns = [col[0] for col in cursor.fetchall()]

    # Get the table data
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()

    # Write the backup file
    with open(backup_file, 'w') as file:
        # Write the DELETE statement
        file.write(f"DELETE FROM {table_name};\n")
        
        # Write the INSERT statements
        for row in rows:
            values = ', '.join(f"'{str(value).replace('\'', '\\\'')}'" if value is not None else 'NULL' for value in row)
            file.write(f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({values});\n")

# Clean up
cursor.close()
conn.close()

print("Backup complete!")
import mysql.connector
import os

# Database connection details
db_config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',  # Use the remote host address
    'database': 'dbc'
}

# Directory to save the SQL files
backup_dir = 'path_to_backup_directory'

if not os.path.exists(backup_dir):
    os.makedirs(backup_dir)

# Connect to the database
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Get the list of tables
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()

for (table_name,) in tables:
    print(f"Backing up table: {table_name}")
    backup_file = os.path.join(backup_dir, f"{table_name}.sql")

    # Get the column names
    cursor.execute(f"SHOW COLUMNS FROM {table_name}")
    columns = [col[0] for col in cursor.fetchall()]

    # Get the table data
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()

    # Write the backup file
    with open(backup_file, 'w') as file:
        # Write the DELETE statement
        file.write(f"DELETE FROM {table_name};\n")
        
        # Write the INSERT statements
        for row in rows:
            values = ', '.join(f"'{str(value).replace('\'', '\\\'')}'" if value is not None else 'NULL' for value in row)
            file.write(f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({values});\n")

# Clean up
cursor.close()
conn.close()

print("Backup complete!")
