import random

# Function to generate a random item name
def generate_item_name():
    prefixes = ["Mighty", "Shiny", "Glowing", "Enchanted", "Ancient"]
    suffixes = ["of Power", "of the Stars", "of Doom", "of the Ancients", "of the Gods"]
    return f"{random.choice(prefixes)} Item {random.choice(suffixes)}"

# Function to generate a random item type
def generate_item_type():
    item_types = ["Sword", "Axe", "Staff", "Bow", "Armor", "Ring", "Amulet"]
    return random.choice(item_types)

# Function to generate a random item level
def generate_item_level():
    return random.randint(1, 100)

# Function to generate a random item stat
def generate_item_stat():
    stat_types = ["Strength", "Agility", "Stamina", "Intellect", "Spirit"]
    return f"{random.choice(stat_types)} {random.randint(1, 10)}"

# Function to generate a random SQL query for item_template
def generate_sql_query(item_id, item_name, item_type, item_level, stats):
    stats_str = ", ".join(stats)
    
    return f"INSERT INTO `item_template` (`entry`, `name`, `class`, `subclass`, `Quality`, `displayid`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, {stats_str}, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`) VALUES ({item_id}, '{item_name}', 2, '{item_type}', 4, 1, 1, 1, 1, 1, '', '', {item_level}, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);"

# Number of random items to generate
num_items = 5

# Generate and print SQL queries for random items
for i in range(1, num_items + 1):
    item_id = i
    item_name = generate_item_name()
    item_type = generate_item_type()
    item_level = generate_item_level()
    
    # Generate 2 random stats for each item
    stats = [generate_item_stat() for _ in range(2)]
    
    sql_query = generate_sql_query(item_id, item_name, item_type, item_level, stats)
    print(sql_query)
