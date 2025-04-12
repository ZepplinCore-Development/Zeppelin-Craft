import os
import re

# Function to replace numbers in a text
def replace_numbers(text, replacements):
    # Use regular expressions to find and replace numbers
    for old, new in replacements.items():
        text = re.sub(r'\b{}\b'.format(old), str(new), text)
    return text

# Specify the root directory to start searching from
root_directory = 'D:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\SQL\custom\db_world'

# Verify the root directory
if not os.path.exists(root_directory):
    print(f"Error: The directory {root_directory} does not exist.")
else:
    print(f"Starting traversal from root directory: {root_directory}")

# Specify the numbers to replace and their replacements

# Specify the numbers to replace and their replacements
replacements = {
    # Blacksmithing
    '902311': '57000',       # Compressed Thermal Anvil
    '902302': '57001',       # Plans: Elementium Aegis
    '902303': '57002',       # Elementium Aegis
    # Engineering
    '902306': '57200',      # Skill Injector Schematic 
    '902307': '57201',      # Skill Injector
    '902304': '57204',      # Schematic: Elementium Targeting Matrix
    '902305': '57205',      # Elementium Targeting Matrix   
    '902308': '57206',      # Schematic: Thorium Headed Arrows   
    '902331': '57207',      # Schematic: Fel Iron Arrows  
    '902332': '57208',      # Fel Iron Arrows  
    # Jewelcrafting
    '902300': '57500',      # Design: Elementium Talisman 
    '902301': '57501',      # Elementium Talisman  
    '57202': '57502',      # Design: Black Diamond Dragonling
    '57203': '57503',      # Black Diamond Dragonling
    # Enchanting
    '902312': '57100',      # Formula: Mystic Resonator
    '902314': '57101',      # Formula: Nexus Shard
    # Leatherworking
    '902315': '57600',      # Pattern: Drums of Forgotten Kings
    '902316': '57601',      # Drums of Forgotten Kings
    '902317': '57602',      # Pattern: Drums of Fortitude
    '902318': '57603',      # Drums of Fortitude
    '902319': '57604',      # Pattern: Drums of Intellect
    '902320': '57605',      # Drums of Intellect
    '902321': '57606',      # Pattern: Drums of the Nights Watch
    '902322': '57607',      # Drums of the Nights Watch
    '902323': '57608',      # Pattern: Drums of the Wild
    '902324': '57609',      # Drums of the Wild
    '902325': '57610',      # Pattern: Drums of the Raid Leader
    '902326': '57611',      # Drums of the Raid Leader
    # Skinning (Generates False Positives, already replaced)
    #'746': '57800',        # Pristine Hide of Magmadar
    #'17967': '57801',      # Pristine Hide of Magmadar
    # Mounts
    '902801': '58100',      # Giant Murloc
    '902800': '58101',      # Butt Zeppelin
    #aq crystals
    #Currencies
    '901200': '58200',      # Badge of Heroism     
    #satchels
    '901205': '58301',      # Azeroth Mythic Satchel
    '901201': '58300',      # Azeroth Heroic Satchel
    #Crystals
    '901203': '58302',      # Azerite Shard  
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