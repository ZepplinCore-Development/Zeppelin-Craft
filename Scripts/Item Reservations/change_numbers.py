import os
import re

# Function to replace numbers in a text
def replace_numbers(text, replacements):
    # Use regular expressions to find and replace numbers
    for old, new in replacements.items():
        text = re.sub(r'\b{}\b'.format(old), str(new), text)
    return text

# Specify the root directory to start searching from
root_directory = 'C:\Zeppelin-Core\SQL'

# Verify the root directory
if not os.path.exists(root_directory):
    print(f"Error: The directory {root_directory} does not exist.")
else:
    print(f"Starting traversal from root directory: {root_directory}")

# Specify the numbers to replace and their replacements

# Specify the numbers to replace and their replacements
replacements = {
    #aq crystals
    '900100': '901000',   
    '900101': '901001',
    '900102': '901002',   
    '900103': '901003',
    #emblems and satchels
    '900104': '901200',
    '900117': '901201',
    '900118': '901202',
    '900189': '901203',
    '900190': '901204',
    '900214': '901205',
    #stockades
    '900106': '901100',
    '900107': '901101',
    '900108': '901102',
    '900109': '901103',
    '900110': '901104',
    '900111': '901105',
    '900112': '901106',
    '900113': '901107',
    '900114': '901108',
    '900115': '901109',
    '900116': '901110',
    #vanilla recipes
    '900105': '902300',
     #quest items vanilla
    '900191': '902200',
    '900219': '902201',
    '900220': '902202',
    '900221': '902203',
    '900222': '902204',
    '900223': '902205',
    '900224': '902206',
    '900225': '902207',
    '900226': '902208',
    '900227': '902209',
    '900228': '902210',
    '900229': '902211',
    '900230': '902212',
    '900231': '902213',
    '900232': '902214',
    '900233': '902215',
    '900234': '902216',
    '900235': "902217",
    '900242': '902218',
    '900243': '902219',
    '900246': '902220',
    '900247': '902221',
    '900248': '902222',
    '900249': '902223',
    '900284': '902224'
}

# Recursively iterate over each file in the directory and its subdirectories
for dirpath, dirnames, filenames in os.walk(root_directory):
    print(f"Searching in directory: {dirpath}")
    for filename in filenames:
        if filename.endswith('.sql'):
            filepath = os.path.join(dirpath, filename)
            print(f"Processing file: {filepath}")
            
            # Read the content of the file
            try:
                with open(filepath, 'r') as file:
                    content = file.read()
                
                # Replace the numbers
                new_content = replace_numbers(content, replacements)
                
                # Write the new content back to the file
                with open(filepath, 'w') as file:
                    file.write(new_content)
                print(f"Updated file: {filepath}")
            except Exception as e:
                print(f"Error processing file {filepath}: {e}")

print("Number replacement complete.")