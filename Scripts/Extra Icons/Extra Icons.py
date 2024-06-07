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

# Open the text file and read its contents
with open('tmp.txt', 'r') as file:
    lines = file.readlines()

# Strip newline characters from each line
blp_files = [line.strip() for line in lines]

# Starting ID
starting_id = 134241

# Prepare the SQL query template
sql_template = "REPLACE INTO itemdisplayinfo (ID, InventoryIcon1) VALUES ({}, '{}');"

# Generate the SQL queries
sql_queries = [sql_template.format(starting_id + i, blp_files[i]) for i in range(len(blp_files))]

# Join the queries into a single string with new lines
final_sql_query = "\n".join(sql_queries)

# Output the final SQL query
print(f"SAVED QUERY")

# Save the final SQL query to a file
with open('extra_icons.sql', 'w') as output_file:
    output_file.write(final_sql_query)
