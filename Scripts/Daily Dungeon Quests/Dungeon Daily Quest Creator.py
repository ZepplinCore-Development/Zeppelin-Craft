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

# Function to generate SQL queries
def generate_sql_queries(csv_file):
    queries = []  # List to store generated queries
    processed_bosses = set()

    difficulty_scales = {
    "Vanilla Normal": 1,
    "Outland Normal": 1.5,
    "Heroic": 2,
    "Mythic": 4
    }

    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip the header row
        for row in reader:

            # Extracting values from the CSV columns by index
            quest_id = row[0]
            dungeon = row[1]
            faction = row[2]
            item_id = row[3]
            item_name = row[4]
            item_display_id = row[5]
            quest_desc = row[6]
            sort_id = row[7]
            teleport_orb_id = row[8]
            boss_name = row[9]
            boss_id = row[10]
            boss_idx = row[11]
            boss_level = row[12]
            pool_id = row[13]
            pool_min = row[14]
            pool_max = row[15]
            difficulty = row[16]

            # Check if boss_level is not empty and is a valid integer
            if boss_level and boss_level.isdigit():
                # Calculate difficulty scale based on the difficulty level
                difficulty_scale = difficulty_scales.get(difficulty, 1)

                # Calculate money based on boss_level and difficulty_scale
                money = int(boss_level) * int(boss_level) * 30 * difficulty_scale
            else:
                # Set a default money value if boss_level is invalid or empty
                money = 0  # Or any other default value you prefer

            rep2 = 0
            rep3 = 0

            match difficulty:
                case "Vanilla Normal":
                    reward_1 = 900104
                    reward_2 = 900189

                case "Outland Normal":
                    reward_1 = 29434
                    reward_2 = 900189

            match faction:
                case "Horde":
                    quest_npc_name = "Overlord Runthak"
                    quest_npc_id = "14392"
                    npc_city = "Orgrimmar"
                    rep1 = "67" # Horde reputation
                    reward_text = ""
                    flag = "4104"

                case "Alliance":
                    quest_npc_name = "Travis Coomingham"
                    quest_npc_id = "29093"
                    npc_city = "Stormwind"  
                    rep1 = "469" # Alliance reputation
                    reward_text = "Thanks for thwartin'' them Horde plans, Zuglord Runthak''ll be seethin'' knowing we beat ''em to the punch."
                    flag = "4104"

                case "Thrallmar / Honor Hold":
                    quest_npc_name = "Nether-Stalker Mah''duun"
                    quest_npc_id = "24370"
                    npc_city = "Shattrath"  
                    rep1 = "933" # Consortium reputation
                    rep2 = "946" # Honor Hold reputation
                    rep3 = "947" # Thrallmar reputation
                    reward_text = ""
                    flag = "4232"

            if item_name:

                # Generating the SQL queries with exact format
                pool_query = f"-- {dungeon} - {boss_name} - {faction} - Pool Quest\n\
                DELETE FROM `pool_quest` WHERE (`entry` = {quest_id});\n\
                INSERT INTO `pool_quest`\n\
                SET `entry` = {quest_id},\n\
                    `pool_entry` = {pool_id}, \n\
                    `description` = '{boss_name}';\n\n"

                quest_template_query = f"-- {dungeon} - {boss_name} - {faction} - Quest Template\n\
                DELETE FROM `quest_template` WHERE (`ID` = {quest_id});\n\
                INSERT INTO `quest_template`\n\
                SET `ID` = {quest_id},\n\
                    `QuestType` = 2,\n\
                    `QuestLevel` = {boss_level},\n\
                    `MinLevel` = {pool_min},\n\
                    `QuestSortID` = {sort_id},\n\
                    `QuestInfoID` = 81,\n\
                    `RewardXPDifficulty` = 7,\n\
                    `RewardMoney` = {money},\n\
                    `StartItem` = {teleport_orb_id},\n\
                    `Flags` = {flag},\n\
                    `RewardChoiceItemID1` = {reward_1},\n\
                    `RewardChoiceItemQuantity1` = 1,\n\
                    `RewardChoiceItemID2` = {reward_2},\n\
                    `RewardChoiceItemQuantity2` = 1,\n\
                    `RewardFactionID1` = {rep1},\n\
                    `RewardFactionValue1` = 6,\n\
                    `RewardFactionID2` = {rep2},\n\
                    `RewardFactionValue2` = 6,\n\
                    `RewardFactionID3` = {rep3},\n\
                    `RewardFactionValue3` = 6,\n\
                    `LogTitle` = 'Wanted: {item_name}',\n\
                    `LogDescription` = 'Retrieve the {item_name} from {boss_name} in {dungeon}.',\n\
                    `QuestDescription` = '{quest_desc}',\n\
                    `AreaDescription` = '',\n\
                    `QuestCompletionLog` = 'Return the {item_name} to {quest_npc_name} in {npc_city}.',\n\
                    `RequiredItemId1` = {item_id},\n\
                    `RequiredItemCount1` = 1,\n\
                    `VerifiedBuild` = 12340;\n\n"

                quest_template_addon_query = f"-- {dungeon} - {boss_name} - {faction} - Quest Template Addon\n\
                DELETE FROM `quest_template_addon` WHERE (`ID` = {quest_id});\n\
                INSERT INTO `quest_template_addon`\n\
                SET `ID` = {quest_id},\n\
                    `ProvidedItemCount` = 1,\n\
                    `MaxLevel` = {pool_max}, \n\
                    `SpecialFlags` = 1;\n\n"

                quest_offer_reward_query = f"-- {dungeon} - {boss_name} - {faction} - Quest Offer Reward\n\
                DELETE FROM `quest_offer_reward` WHERE (`ID` = {quest_id});\n\
                INSERT INTO `quest_offer_reward`\n\
                SET `ID` = {quest_id},\n\
                    `Emote1` = 1,\n\
                    `RewardText` = '{reward_text}',\n\
                    `VerifiedBuild` = 12340;\n\n"

                quest_request_items_query = f"-- {dungeon} - {boss_name} - {faction} - Quest Request Items\n\
                DELETE FROM `quest_request_items` WHERE (`ID` = {quest_id});\n\
                INSERT INTO `quest_request_items`\n\
                SET `ID` = {quest_id},\n\
                    `EmoteOnComplete` = 1,\n\
                    `EmoteOnIncomplete` = 1,\n\
                    `CompletionText` = 'The {item_name} please.',\n\
                    `VerifiedBuild` = 12340;\n\n"

                creature_queststarter_query = f"-- {dungeon} - {boss_name} - {faction} - Creature Quest Starter\n\
                DELETE FROM `creature_queststarter` WHERE (`quest` = {quest_id});\n\
                INSERT INTO `creature_queststarter`\n\
                SET`quest` = {quest_id},\n\
                    `id` = {quest_npc_id};\n\n"

                creature_questender_query = f"-- {dungeon} - {boss_name} - {faction} - Creature Quest Ender\n\
                DELETE FROM `creature_questender` WHERE (`quest` = {quest_id});\n\
                INSERT INTO `creature_questender`\n\
                    SET `quest` = {quest_id}, \n\
                    `id` = {quest_npc_id};\n\n"

                item_template_query = f"-- {dungeon} - {boss_name} - {item_name} - Item template\n\
                DELETE FROM `item_template` WHERE (`entry` = {item_id});\n\
                INSERT INTO `item_template`\n\
                SET `entry` = {item_id}, \n\
                    `class` = 12, \n\
                    `subclass` = 0, \n\
                    `name` = '{item_name}', \n\
                    `flags` = '2048', \n\
                    `displayid` = {item_display_id}, \n\
                    `Quality` = 1, \n\
                    `bonding` = 4;\n\n"

                quest_item_query = f"-- {dungeon} - {boss_name} - {item_name} - Quest Item\n\
                DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = {boss_id}) AND (`ItemId` = {item_id});\n\
                INSERT INTO `creature_questitem`\n\
                SET `CreatureEntry` = {boss_id}, \n\
                    `Idx` = {boss_idx}, \n\
                    `ItemId` = {item_id}, \n\
                    `VerifiedBuild` = 0;\n\n"

                loot_template_query = f"-- {dungeon} - {boss_name} - {item_name} - Loot Template\n\
                DELETE FROM `creature_loot_template` WHERE (`Entry` = {boss_id}) AND (`Item` IN ({item_id}));\n\
                INSERT INTO `creature_loot_template`\n\
                SET `Entry` = {boss_id}, \n\
                    `Item` = {item_id}, \n\
                    `Chance` = 100, \n\
                    `QuestRequired` = 1, \n\
                    `LootMode` = 1, \n\
                    `GroupId` = 0, \n\
                    `MinCount` = 1, \n\
                    `MaxCount` = 1, \n\
                    `Comment` = '{item_name}';\n"
                
                # Combine all queries for this boss into one string
                boss_queries = pool_query + quest_template_query + quest_template_addon_query + quest_offer_reward_query + quest_request_items_query + creature_queststarter_query + creature_questender_query
                if boss_id not in processed_bosses:   
                    boss_queries = boss_queries +  item_template_query + quest_item_query + loot_template_query
                    processed_bosses.add(boss_id)
                queries.append(boss_queries)

    return queries

# CSV file path
csv_file_path = 'Dungeon Daily Quests.csv'

# Generate SQL queries
sql_queries = generate_sql_queries(csv_file_path)

# Save SQL queries to a file
with open('zz_daily_dungeon_quests.sql', 'w') as sql_file:
    for query in sql_queries:
        sql_file.write(query + '\n')

print("DUNGEON QUEST SQL FILE GENERATED")