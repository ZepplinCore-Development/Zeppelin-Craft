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

def get_dungeon_orb(target_dungeon, teleports_csv_file_path):
    with open(teleports_csv_file_path, 'r') as teleports_file:
        teleport_reader = csv.reader(teleports_file)
        next(teleport_reader)  # Skip the header row 
        for row in teleport_reader:
            dungeon = row[0]
            teleport_orb_id = row[1]
            
            if target_dungeon == dungeon:
                return teleport_orb_id

# Function to generate SQL queries
def generate_sql_queries(quests_csv_file_path, teleports_csv_file_path):
    queries = []  # List to store generated queries
    processed_bosses = set()

    difficulty_scales = {
    "Vanilla Normal": 1,
    "Outland Normal": 1.5,
    "Heroic": 2,
    "Mythic": 4
    }

    with open(quests_csv_file_path, 'r') as quest_file:
        quest_reader = csv.reader(quest_file)
        next(quest_reader)  # Skip the header row
        for row in quest_reader:

            # Extracting values from the CSV columns by index
            quest_id = row[0]
            dungeon = row[1]
            faction = row[2]
            item_id = row[3]
            item_name = row[4]
            item_display_id = row[5]
            quest_desc = row[6]
            sort_id = row[7]
            boss_name = row[8]
            boss_id = row[9]
            boss_idx = row[10]
            boss_level = row[11]
            pool_id = row[12]
            pool_min = row[13]
            pool_max = row[14]
            difficulty = row[15]

            target_dungeon = dungeon
            teleport_orb_id = get_dungeon_orb(target_dungeon, teleports_csv_file_path)

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
                    reward_1 = 58200 # Badge of Heroism
                    rewardamount_1 = 1
                    reward_2 = 58302 # Azerite Shard
                    rewardamount_2 = 3

                case "Vanilla Heroic":
                    reward_1 = 58200 # Badge of Heroism
                    rewardamount_1 = 2
                    reward_2 = 58302 # Azerite Shard
                    rewardamount_2 = 4

                case "Vanilla Mythic":
                    reward_1 = 58200 # Badge of Heroism
                    rewardamount_1 = 3
                    reward_2 = 58302 # Azerite Shard
                    rewardamount_2 = 5

                case "Outland Normal":
                    reward_1 = 29434 # Badge of Justice
                    rewardamount_1 = 1
                    reward_2 = 58302 # Azerite Shard
                    rewardamount_2 = 3

            match faction:
                case "Horde":
                    quest_npc_name = "Overlord Runthak"
                    quest_npc_id = "14392"
                    npc_city = "Orgrimmar"
                    rep1 = "67" # Horde reputation
                    reward_text = "Your deeds bring honour to the Horde."
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
                    reward_text = "My buyer will be most pleased."
                    flag = "4232"

                case "Cenarion Expedition":
                    quest_npc_name = "Nether-Stalker Mah''duun"
                    quest_npc_id = "24370"
                    npc_city = "Shattrath"  
                    rep1 = "933" # Consortium reputation
                    rep2 = "942" # Cenarion Expedition
                    reward_text = "My buyer will be most pleased."
                    flag = "4232"               

                case "Consortium":
                    quest_npc_name = "Nether-Stalker Mah''duun"
                    quest_npc_id = "24370"
                    npc_city = "Shattrath"  
                    rep1 = "933" # Consortium reputation
                    reward_text = "My buyer will be most pleased."
                    flag = "4232"    

                case "Sha'tar":
                    quest_npc_name = "Nether-Stalker Mah''duun"
                    quest_npc_id = "24370"
                    npc_city = "Shattrath"  
                    rep1 = "933" # Consortium reputation
                    rep2 = "935" # Sha'tar
                    reward_text = "My buyer will be most pleased."
                    flag = "4232"    

                case "Keepers of Time":
                    quest_npc_name = "Nether-Stalker Mah''duun"
                    quest_npc_id = "24370"
                    npc_city = "Shattrath"  
                    rep1 = "933" # Consortium reputation
                    rep2 = "989" # Keepers of Time
                    reward_text = "My buyer will be most pleased."
                    flag = "4232"                        

            if item_name:

                # Generating the SQL queries with exact format
                pool_query = f"""
                -- *******************************************************

                -- {dungeon} - {boss_name} - {faction} - Pool Quest
                DELETE FROM `pool_quest` WHERE (`entry` = {quest_id});
                INSERT INTO `pool_quest`
                SET `entry` = {quest_id},
                    `pool_entry` = {pool_id},
                    `description` = '{boss_name}';
                
                """

                quest_template_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Quest Template
                DELETE FROM `quest_template` WHERE (`ID` = {quest_id});
                INSERT INTO `quest_template`
                SET `ID` = {quest_id},
                    `QuestType` = 2,
                    `QuestLevel` = {boss_level},
                    `MinLevel` = {pool_min},
                    `QuestSortID` = {sort_id},
                    `QuestInfoID` = 81,
                    `RewardXPDifficulty` = 7,
                    `RewardMoney` = {money},
                    `StartItem` = {teleport_orb_id},
                    `Flags` = {flag},
                    `RewardItem1` = {reward_1},
                    `RewardAmount1` = {rewardamount_1},
                    `RewardItem2` = {reward_2},
                    `RewardAmount2` = {rewardamount_2},
                    `RewardFactionID1` = {rep1},
                    `RewardFactionValue1` = 6,
                    `RewardFactionID2` = {rep2},
                    `RewardFactionValue2` = 6,
                    `RewardFactionID3` = {rep3},
                    `RewardFactionValue3` = 6,
                    `LogTitle` = 'Wanted: {item_name}',
                    `LogDescription` = 'Retrieve the {item_name} from {boss_name} in {dungeon}.',
                    `QuestDescription` = '{quest_desc}',
                    `AreaDescription` = '',
                    `QuestCompletionLog` = 'Return the {item_name} to {quest_npc_name} in {npc_city}.',
                    `RequiredItemId1` = {item_id},
                    `RequiredItemCount1` = 1,
                    `VerifiedBuild` = 12340;
                    
                """

                quest_template_addon_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Quest Template Addon
                DELETE FROM `quest_template_addon` WHERE (`ID` = {quest_id});
                INSERT INTO `quest_template_addon`
                SET `ID` = {quest_id},
                    `ProvidedItemCount` = 1,
                    `MaxLevel` = {pool_max},
                    `SpecialFlags` = 1;
                    
                """

                quest_offer_reward_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Quest Offer Reward
                DELETE FROM `quest_offer_reward` WHERE (`ID` = {quest_id});
                INSERT INTO `quest_offer_reward`
                SET `ID` = {quest_id},
                    `Emote1` = 1,
                    `RewardText` = '{reward_text}';
                    
                """

                quest_request_items_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Quest Request Items
                DELETE FROM `quest_request_items` WHERE (`ID` = {quest_id});
                INSERT INTO `quest_request_items`
                SET `ID` = {quest_id},
                    `EmoteOnComplete` = 1,
                    `EmoteOnIncomplete` = 1,
                    `CompletionText` = 'The {item_name} please.';
                    
                """

                creature_queststarter_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Creature Quest Starter
                DELETE FROM `creature_queststarter` WHERE (`quest` = {quest_id});
                INSERT INTO `creature_queststarter`
                SET`quest` = {quest_id},
                    `id` = {quest_npc_id};
                    
                """

                creature_questender_query = f"""
                -- {dungeon} - {boss_name} - {faction} - Creature Quest Ender
                DELETE FROM `creature_questender` WHERE (`quest` = {quest_id});
                INSERT INTO `creature_questender`
                    SET `quest` = {quest_id},
                    `id` = {quest_npc_id};
                    
                """

                item_template_query = f"""
                -- {dungeon} - {boss_name} - {item_name} - Item template
                DELETE FROM `item_template` WHERE (`entry` = {item_id});
                INSERT INTO `item_template`
                SET `entry` = {item_id},
                    `class` = 12,
                    `subclass` = 0,
                    `name` = '{item_name}',
                    `flags` = '2048',
                    `displayid` = {item_display_id},
                    `Quality` = 1,
                    `bonding` = 4;

                """

                quest_item_query = f"""
                -- {dungeon} - {boss_name} - {item_name} - Quest Item
                DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = {boss_id}) AND (`ItemId` = {item_id});
                INSERT INTO `creature_questitem`
                SET `CreatureEntry` = {boss_id},
                    `Idx` = {boss_idx},
                    `ItemId` = {item_id};
                
                """
                loot_template_query = f"""
                -- {dungeon} - {boss_name} - {item_name} - Loot Template
                DELETE FROM `creature_loot_template` WHERE (`Entry` = {boss_id}) AND (`Item` IN ({item_id}));
                INSERT INTO `creature_loot_template`
                SET `Entry` = {boss_id},
                    `Item` = {item_id},
                    `Chance` = 100, \n\
                    `QuestRequired` = 1,
                    `LootMode` = 1,
                    `GroupId` = 0,
                    `MinCount` = 1,
                    `MaxCount` = 1,
                    `Comment` = '{item_name}';
   
                """
                
                # Combine all queries for this boss into one string
                boss_queries = pool_query + quest_template_query + quest_template_addon_query + quest_offer_reward_query + quest_request_items_query + creature_queststarter_query + creature_questender_query
                if boss_id not in processed_bosses:   
                    boss_queries = boss_queries +  item_template_query + quest_item_query + loot_template_query
                    processed_bosses.add(boss_id)
                queries.append(boss_queries)

    return queries

# CSV file path
quests_csv_file_path = 'Dungeon Daily Quests.csv'
teleports_csv_file_path = 'Dungeon Daily Teleports.csv'

# Generate SQL queries
sql_queries = generate_sql_queries(quests_csv_file_path, teleports_csv_file_path)

# Save SQL queries to a file
with open('zz_daily_dungeon_quests.sql', 'w') as sql_file:
    for query in sql_queries:
        sql_file.write(query + '\n')

print("DUNGEON QUEST SQL FILE GENERATED")