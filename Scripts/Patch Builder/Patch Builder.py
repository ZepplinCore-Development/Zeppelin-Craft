import mysql.connector
import os
import subprocess
import shutil

# Database connection details
db_config = {
    "host": "192.168.0.99",
    "user": "keira",
    "password": "slipknot9",
    'database': 'dbc'
}

# Directory to save the SQL files
backup_dir = 'C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\Scripts\Patch Builder'
batch_size = 1000  # Number of rows per INSERT statement

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
    cursor.execute(f"SHOW COLUMNS FROM `{table_name}`")
    columns = [col[0] for col in cursor.fetchall()]

    # Get the table data
    cursor.execute(f"SELECT * FROM `{table_name}`")
    rows = cursor.fetchall()

    # Write the backup file
    with open(backup_file, 'w') as file:
        # Write the DELETE statement
        file.write(f"DELETE FROM `{table_name}`;\n")
        
        # Write the INSERT statements in batches
        for i in range(0, len(rows), batch_size):
            batch_rows = rows[i:i+batch_size]
            values_list = []
            for row in batch_rows:
                values = ', '.join(f"'{str(value).replace('\'', '\\\'')}'" if value is not None else 'NULL' for value in row)
                values_list.append(f"({values})")
            insert_statement = f"INSERT INTO `{table_name}` ({', '.join(columns)}) VALUES\n  " + ",\n  ".join(values_list) + ";\n"
            file.write(insert_statement)

# Clean up
cursor.close()
conn.close()

print("Backup complete!")

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