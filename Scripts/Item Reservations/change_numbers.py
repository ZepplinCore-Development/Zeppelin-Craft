import os
import re

# Function to replace numbers in a text
def replace_numbers(text, replacements):
    # Use regular expressions to find and replace numbers
    for old, new in replacements.items():
        text = re.sub(r'\b{}\b'.format(old), str(new), text)
    return text

# Specify the root directory to start searching from
root_directory = 'C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\SQL\custom\db_world'

# Verify the root directory
if not os.path.exists(root_directory):
    print(f"Error: The directory {root_directory} does not exist.")
else:
    print(f"Starting traversal from root directory: {root_directory}")

# Specify the numbers to replace and their replacements

# Specify the numbers to replace and their replacements
replacements = {
    #Engineering
    '902306': '57200',      # Skill Injector Schematic 
    '902307': '57201',      # Skill Injector
    '902309': '57202',      # Design: Black Diamond Dragonling
    '902310': '57203',      # Black Diamond Dragonling
    '902304': '57204',      # Schematic: Elementium Targeting Matrix
    '902305': '57205',      # Elementium Targeting Matrix   
    #Jewelcrafting
    '902300': '57500',      # Design: Elementium Talisman 
    '902301': '57501',      # Elementium Talisman  
    #aq crystals
    #Currencies
    '901200': '58200',      # Badge of Heroism     
    #satchels
    #stockades
    #vanilla recipes
    #quest items vanilla

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