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

# Prepare the SQL query template for individual values
value_template = "({}, '{}')"

# Prepare a list to collect groups of values
grouped_queries = []

# Collect the values in groups of 1
for i in range(0, len(blp_files), 1):
    group = blp_files[i:i + 1]
    values = ", ".join([value_template.format(starting_id + j, group[j]) for j in range(len(group))])
    grouped_queries.append(f"INSERT INTO itemdisplayinfo (ID, InventoryIcon1) VALUES {values};")

# Join the grouped queries into a single string with new lines
final_sql_query = "\n".join(grouped_queries)

# Output the final SQL query
print(f"SAVED QUERY")

# Save the final SQL query to a file
with open('extra_icons.sql', 'w') as output_file:
    output_file.write(final_sql_query)
