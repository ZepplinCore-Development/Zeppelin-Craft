import csv
import os

# Print the current working directory before changing
print("Before:", os.getcwd())

# Get the directory of the current script
script_dir = os.path.dirname(os.path.abspath(__file__))

# Change the working directory to the script's directory
try:
    os.chdir(script_dir)
    print("After:", os.getcwd())
except Exception as e:
    print("Error changing directory:", e)

# Path to the CSV file
csv_file_path = 'bags.csv'

# List to store entries to be updated
entries_to_update = []

# Read the CSV file
with open(csv_file_path, mode='r', newline='') as file:
    reader = csv.DictReader(file)
    for row in reader:
        entry = row['entry']
        slots = int(row['new_slots']) if row['new_slots'] else 1
        name = row['name']
        entries_to_update.append((entry, slots, name))

# Construct the SQL query
sql_query = """
UPDATE `item_template`
SET `ContainerSlots` = CASE
"""
for entry, slots, name in entries_to_update:
    sql_query += f"    WHEN `entry` = {entry} THEN {slots} -- {name}\n"
sql_query += """
    ELSE `ContainerSlots`
END;
"""

# Define the output file path
output_file_path = 'zz_update_bag_slots.sql'

# Write the SQL query to the file
with open(output_file_path, mode='w') as file:
    file.write(sql_query)

# Print the absolute path of the generated file
print(f"SQL query has been written to {os.path.abspath(output_file_path)}")