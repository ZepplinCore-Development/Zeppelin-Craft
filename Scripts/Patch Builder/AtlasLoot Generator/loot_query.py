"""
Database Query Module for AtlasLoot Generator
Handles all database operations for fetching boss loot data
"""

import mysql.connector
import os
import json
from typing import List, Dict, Optional, Set

# Load whitelist/blacklist from section_mappings.json
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
MAPPINGS_FILE = os.path.join(SCRIPT_DIR, 'section_mappings.json')

def _load_loot_config() -> dict:
    """Load whitelist, blacklist, and thresholds from section_mappings.json."""
    config = {
        'whitelist': set(),
        'blacklist': set(),
        'thresholds': {
            'quest_item_min_chance': 50,
            'rare_min_chance': 3,
            'epic_min_chance': 1,
            'uncommon_min_chance': 10,
            'recipe_min_chance': 5,
            'custom_item_min_id': 900000
        }
    }

    try:
        with open(MAPPINGS_FILE, 'r') as f:
            mappings = json.load(f)

        # Load whitelist
        whitelist_config = mappings.get('item_whitelist', {})
        for item in whitelist_config.get('items', []):
            if isinstance(item, dict) and 'id' in item:
                config['whitelist'].add(item['id'])
            elif isinstance(item, int):
                config['whitelist'].add(item)

        # Load blacklist
        blacklist_config = mappings.get('item_blacklist', {})
        for item in blacklist_config.get('items', []):
            if isinstance(item, dict) and 'id' in item:
                config['blacklist'].add(item['id'])
            elif isinstance(item, int):
                config['blacklist'].add(item)

        # Load thresholds
        thresholds_config = mappings.get('loot_thresholds', {})
        for key in config['thresholds']:
            if key in thresholds_config:
                config['thresholds'][key] = thresholds_config[key]

    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Warning: Could not load loot config from {MAPPINGS_FILE}: {e}")

    return config

LOOT_CONFIG = _load_loot_config()
ITEM_WHITELIST = LOOT_CONFIG['whitelist']
ITEM_BLACKLIST = LOOT_CONFIG['blacklist']
THRESHOLDS = LOOT_CONFIG['thresholds']


class LootDatabase:
    """Database connection handler for AzerothCore loot queries."""

    def __init__(self, host=None, port=None, user=None, password=None, database=None):
        """
        Initialize database connection.
        Uses environment variables from .env if parameters not provided.

        Args:
            host: Database host address (default: ACORE_DB_HOST or 192.168.0.55)
            port: Database port (default: ACORE_DB_PORT or 3306)
            user: Database username (default: ACORE_DB_USER or acore)
            password: Database password (default: ACORE_DB_PASSWORD or acore)
            database: Database name (default: WORLD_DB_NAME or acore_world)
        """
        self.connection_params = {
            'host': host or os.getenv('ACORE_DB_HOST', '192.168.0.55'),
            'port': port or int(os.getenv('ACORE_DB_PORT', '3306')),
            'user': user or os.getenv('ACORE_DB_USER', 'acore'),
            'password': password or os.getenv('ACORE_DB_PASSWORD', 'acore'),
            'database': database or os.getenv('WORLD_DB_NAME', 'acore_world')
        }
        self.connection = None

    def connect(self):
        """Establish database connection."""
        try:
            self.connection = mysql.connector.connect(**self.connection_params)
            return True
        except mysql.connector.Error as err:
            print(f"Database connection error: {err}")
            return False

    def disconnect(self):
        """Close database connection."""
        if self.connection and self.connection.is_connected():
            self.connection.close()

    def get_creature_id(self, boss_name: str) -> Optional[int]:
        """
        Look up creature ID from boss name.

        Args:
            boss_name: Boss name from AtlasLoot BabbleBoss table

        Returns:
            Creature entry ID or None if not found
        """
        if not self.connection:
            return None

        query = """
            SELECT entry, name
            FROM creature_template
            WHERE name = %s
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, (boss_name,))
            result = cursor.fetchone()
            cursor.close()

            if result:
                return result['entry']
            else:
                print(f"Warning: Boss '{boss_name}' not found in creature_template")
                return None

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return None

    def get_boss_loot(self, creature_id: int, include_references: bool = True) -> List[Dict]:
        """
        Get all loot items for a boss, including resolved reference loot.

        Args:
            creature_id: Creature entry ID
            include_references: If True, resolve reference loot tables with Chance >= 100

        Returns:
            List of loot items with full details
        """
        if not self.connection:
            return []

        results = []

        # Step 1: Get direct loot items
        # Build whitelist condition if we have items
        whitelist_condition = "FALSE"  # Default: no whitelist match
        if ITEM_WHITELIST:
            whitelist_ids = ','.join(str(id) for id in ITEM_WHITELIST)
            whitelist_condition = f"clt.Item IN ({whitelist_ids})"

        direct_query = f"""
            SELECT
                clt.Entry as creature_id,
                clt.Item as item_id,
                it.name as item_name,
                it.Quality as quality,
                it.InventoryType as inventory_type,
                it.class as item_class,
                it.subclass as item_subclass,
                clt.Chance as drop_chance,
                clt.GroupId as group_id
            FROM creature_loot_template clt
            LEFT JOIN item_template it ON clt.Item = it.entry
            WHERE clt.Entry = %s
              AND clt.Reference = 0
              AND clt.Item > 0
              -- Filter to show only meaningful boss loot (keep under 30 items)
              AND (
                  -- Whitelisted items always included
                  {whitelist_condition}
                  -- Show quest items (class 12) with >= {THRESHOLDS['quest_item_min_chance']}% drop rate
                  OR (it.class = 12 AND (clt.Chance >= {THRESHOLDS['quest_item_min_chance']} OR clt.Chance = 0))
                  -- Always show custom items ({THRESHOLDS['custom_item_min_id']}+)
                  OR clt.Item >= {THRESHOLDS['custom_item_min_id']}
                  -- Always show mounts (class 15, subclass 5) regardless of drop rate
                  OR (it.class = 15 AND it.subclass = 5)
                  -- Show rare items (quality 3) with >= {THRESHOLDS['rare_min_chance']}% drop rate
                  OR (it.Quality = 3 AND clt.Chance >= {THRESHOLDS['rare_min_chance']} AND it.class != 12)
                  -- Show epic+ items (quality 4+) with >= {THRESHOLDS['epic_min_chance']}% drop rate
                  OR (it.Quality >= 4 AND clt.Chance >= {THRESHOLDS['epic_min_chance']} AND it.class != 12)
                  -- Show uncommon (green) items with >= {THRESHOLDS['uncommon_min_chance']}% drop rate
                  OR (it.Quality = 2 AND clt.Chance >= {THRESHOLDS['uncommon_min_chance']} AND it.class != 12)
                  -- Show group loot items (Chance=0 with GroupId>0) - these are special boss drops
                  OR (clt.Chance = 0 AND clt.GroupId > 0)
              )
            ORDER BY clt.GroupId, clt.Chance DESC, clt.Item
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(direct_query, (creature_id,))
            results = cursor.fetchall()
            cursor.close()

        except mysql.connector.Error as err:
            print(f"Direct loot query error: {err}")
            return []

        # Step 1b: Calculate drop chances for direct loot groups (Chance=0 with GroupId>0)
        # Same logic as _get_reference_items() - GroupId > 0 means "pick one from group"
        groups = {}
        for item in results:
            gid = item['group_id']
            if gid not in groups:
                groups[gid] = []
            groups[gid].append(item)

        for gid, items in groups.items():
            if gid == 0:
                # GroupId 0: Items drop independently, Chance=0 means 100%
                for item in items:
                    if item['drop_chance'] == 0:
                        item['drop_chance'] = 100.0
            else:
                # GroupId > 0: Only ONE item drops from the group
                # Calculate total explicit chance
                explicit_total = sum(item['drop_chance'] for item in items if item['drop_chance'] > 0)
                zero_chance_items = [item for item in items if item['drop_chance'] == 0]

                if zero_chance_items:
                    # Remaining chance is split equally among Chance=0 items
                    remaining = 100.0 - explicit_total
                    equal_share = remaining / len(zero_chance_items) if remaining > 0 else 0

                    for item in zero_chance_items:
                        item['drop_chance'] = equal_share

        # Step 2: Resolve reference loot tables (if enabled)
        if include_references:
            ref_items = self._resolve_reference_loot(creature_id)
            results.extend(ref_items)

        # Step 3: Deduplicate items (same item may appear in direct + reference loot)
        # Keep the one with higher drop chance
        seen_items = {}
        for item in results:
            item_id = item['item_id']
            if item_id not in seen_items or item['drop_chance'] > seen_items[item_id]['drop_chance']:
                seen_items[item_id] = item
        results = list(seen_items.values())

        # Re-sort after deduplication
        results.sort(key=lambda x: (x.get('group_id', 0), -x['drop_chance'], x['item_id']))

        # Filter out blacklisted items
        if ITEM_BLACKLIST:
            results = [item for item in results if item['item_id'] not in ITEM_BLACKLIST]

        return results

    def _resolve_reference_loot(self, creature_id: int) -> List[Dict]:
        """
        Resolve reference loot tables for a creature.

        Includes references that are:
        - Guaranteed rolls (Chance >= 100)
        - Always included (Chance = 0 with GroupId = 0)
        - Boss loot pools (GroupId > 0 with any Chance > 0)

        Args:
            creature_id: Creature entry ID

        Returns:
            List of resolved loot items from reference tables
        """
        if not self.connection:
            return []

        # Find meaningful references:
        # - Chance >= 100: guaranteed roll
        # - Chance = 0 AND GroupId = 0: always included
        # - GroupId > 0: boss loot pool (one item from group)
        ref_query = """
            SELECT Reference, Chance, GroupId
            FROM creature_loot_template
            WHERE Entry = %s
              AND Reference > 0
              AND (Chance >= 100 OR (Chance = 0 AND GroupId = 0) OR GroupId > 0)
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(ref_query, (creature_id,))
            references = cursor.fetchall()
            cursor.close()

            if not references:
                return []

            # Build a map of reference_id -> highest Chance value
            # Same reference may appear multiple times; use highest Chance for compound calc
            ref_chances = {}
            for ref in references:
                ref_id = ref['Reference']
                chance = ref['Chance']
                if ref_id not in ref_chances or chance > ref_chances[ref_id]:
                    ref_chances[ref_id] = chance

            # Sort for consistent ordering
            unique_ref_ids = sorted(ref_chances.keys())

            # Resolve each unique reference table once
            # Use base offset per reference to preserve internal GroupId structure
            # Each reference gets its own 1000-range (1000, 2000, 3000, etc.)
            all_ref_items = []
            for idx, ref_id in enumerate(unique_ref_ids):
                # Base offset for this reference (1000, 2000, 3000, etc.)
                # Internal GroupIds are added to this base to preserve structure
                base_group_offset = (idx + 1) * 1000
                reference_chance = ref_chances[ref_id]
                ref_items = self._get_reference_items(ref_id, base_group_offset, reference_chance)
                all_ref_items.extend(ref_items)

            return all_ref_items

        except mysql.connector.Error as err:
            print(f"Reference query error: {err}")
            return []

    def _get_reference_items(self, reference_id: int, base_group_offset: int = None,
                             reference_chance: float = 100.0) -> List[Dict]:
        """
        Get all items from a reference loot table with properly calculated drop rates.

        Drop rate calculation follows AzerothCore loot rules:
        - GroupId > 0: Only ONE item from the group drops
        - Chance = 0 in a group: Equal-chanced, shares remaining probability
        - Items with explicit Chance values take priority
        - Final drop_chance is compounded with reference_chance

        Args:
            reference_id: Reference loot table ID
            base_group_offset: If set, add this to each item's internal GroupId to create
                              unique output group_ids. This preserves internal group structure
                              while avoiding collisions between different reference tables.
                              Example: base=1000, internal GroupId=2 -> output group_id=1002
            reference_chance: The chance to roll on this reference table (from creature_loot_template).
                             Used to calculate compound probability. Default 100.0 (guaranteed).

        Returns:
            List of loot items from the reference table with calculated drop_chance
        """
        if not self.connection:
            return []

        # First, get ALL items in the reference to calculate group probabilities
        all_items_query = """
            SELECT
                rlt.Entry as creature_id,
                rlt.Item as item_id,
                it.name as item_name,
                it.Quality as quality,
                it.InventoryType as inventory_type,
                it.class as item_class,
                it.subclass as item_subclass,
                rlt.Chance as drop_chance,
                rlt.GroupId as group_id
            FROM reference_loot_template rlt
            LEFT JOIN item_template it ON rlt.Item = it.entry
            WHERE rlt.Entry = %s
              AND rlt.Item > 0
            ORDER BY rlt.GroupId, rlt.Chance DESC, rlt.Item
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(all_items_query, (reference_id,))
            all_items = cursor.fetchall()
            cursor.close()

            if not all_items:
                return []

            # Calculate proper drop chances per GroupId
            # Group items by GroupId
            groups = {}
            for item in all_items:
                gid = item['group_id']
                if gid not in groups:
                    groups[gid] = []
                groups[gid].append(item)

            # Calculate drop chances for each group
            for gid, items in groups.items():
                if gid == 0:
                    # GroupId 0: Items drop independently (no grouping)
                    # Chance=0 means 100% for independent items
                    for item in items:
                        if item['drop_chance'] == 0:
                            item['drop_chance'] = 100.0
                else:
                    # GroupId > 0: Only ONE item drops from the group
                    # Calculate total explicit chance
                    explicit_total = sum(item['drop_chance'] for item in items if item['drop_chance'] > 0)
                    zero_chance_items = [item for item in items if item['drop_chance'] == 0]

                    if zero_chance_items:
                        # Remaining chance is split equally among Chance=0 items
                        remaining = 100.0 - explicit_total
                        equal_share = remaining / len(zero_chance_items) if remaining > 0 else 0

                        for item in zero_chance_items:
                            item['drop_chance'] = equal_share

            # Apply compound probability: internal_chance * reference_roll_chance
            # Example: 12.5% internal * 40% reference roll = 5% effective drop rate
            if reference_chance < 100.0:
                for item in all_items:
                    item['drop_chance'] = item['drop_chance'] * (reference_chance / 100.0)

            # Filter to meaningful items only (after calculating chances)
            # For reference loot (boss gear pools), only show rare+ quality
            # This excludes green items like gem sacks that clutter raid displays
            filtered_items = []
            for item in all_items:
                chance = item['drop_chance']
                quality = item['quality']

                # Quality-based thresholds for reference loot (stricter than direct loot)
                # Only rare (Q3) or better from reference tables
                is_quest_item = (item['item_class'] == 12)
                is_recipe_item = (item['item_class'] == 9)
                is_quest_with_good_chance = (is_quest_item and (chance == 0 or chance >= 50))
                is_rare_with_good_chance = (quality == 3 and (chance == 0 or chance >= 3) and not is_quest_item)
                is_epic_with_good_chance = (quality >= 4 and (chance == 0 or chance >= 1) and not is_quest_item and not is_recipe_item)
                is_recipe_with_good_chance = (is_recipe_item and (chance == 0 or chance >= 5))  # Recipes need >= 5% (filters world drops)
                # NOTE: Uncommon (green) items excluded from reference loot to reduce clutter
                # NOTE: Recipe items require >= 5% drop rate to filter world drop style recipes (~1-2%)

                if (is_quest_with_good_chance or          # Quest items with >= 50%
                    item['item_id'] >= 900000 or          # Custom items
                    is_rare_with_good_chance or           # Rare with >= 3% drop (not quest items)
                    is_epic_with_good_chance or           # Epic+ with >= 1% drop (not quest/recipe items)
                    is_recipe_with_good_chance):          # Recipes with >= 5% drop (filters world drops)
                    filtered_items.append(item)

            # Apply base offset to group_ids (preserves internal group structure)
            # This keeps items from the same internal GroupId together while
            # preventing collisions between different reference tables
            if base_group_offset is not None:
                for item in filtered_items:
                    # Add base offset to internal GroupId
                    # GroupId=0 stays as 0 (independent drops, no pooling)
                    # GroupId=2 with base=1000 becomes 1002
                    # GroupId=3 with base=1000 becomes 1003
                    if item['group_id'] > 0:
                        item['group_id'] = base_group_offset + item['group_id']

            return filtered_items

        except mysql.connector.Error as err:
            print(f"Reference items query error: {err}")
            return []

    def get_all_bosses_loot(self, creature_ids: List[int]) -> Dict[int, List[Dict]]:
        """
        Get loot for multiple bosses at once.

        Args:
            creature_ids: List of creature entry IDs

        Returns:
            Dictionary mapping creature_id -> loot items list
        """
        if not self.connection or not creature_ids:
            return {}

        # Build query with multiple IDs
        placeholders = ','.join(['%s'] * len(creature_ids))
        query = f"""
            SELECT
                clt.Entry as creature_id,
                clt.Item as item_id,
                it.name as item_name,
                it.Quality as quality,
                it.InventoryType as inventory_type,
                it.class as item_class,
                it.subclass as item_subclass,
                clt.Chance as drop_chance,
                clt.GroupId as group_id
            FROM creature_loot_template clt
            LEFT JOIN item_template it ON clt.Item = it.entry
            WHERE clt.Entry IN ({placeholders})
              AND clt.Reference = 0
              AND clt.Item > 0
              -- Filter to show only meaningful boss loot (keep under 30 items)
              AND (
                  -- Show quest items (class 12) with >= 50% drop rate (filters world-drop quest items like Ace cards)
                  (it.class = 12 AND (clt.Chance >= 50 OR clt.Chance = 0))
                  -- Always show custom items (900000+)
                  OR clt.Item >= 900000
                  -- Always show mounts (class 15, subclass 5) regardless of drop rate
                  OR (it.class = 15 AND it.subclass = 5)
                  -- Show rare items (quality 3) with >= 3% drop rate (excludes class 12 quest items)
                  OR (it.Quality = 3 AND clt.Chance >= 3 AND it.class != 12)
                  -- Show epic+ items (quality 4+) with >= 1% drop rate (excludes class 12 quest items)
                  OR (it.Quality >= 4 AND clt.Chance >= 1 AND it.class != 12)
                  -- Show uncommon (green) items with decent drop rates (excludes class 12 quest items)
                  OR (it.Quality = 2 AND clt.Chance >= 10 AND it.class != 12)
                  -- Show group loot items (Chance=0 with GroupId>0) - these are special boss drops
                  OR (clt.Chance = 0 AND clt.GroupId > 0)
              )
            ORDER BY clt.Entry, clt.GroupId, clt.Chance DESC, clt.Item
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, tuple(creature_ids))
            results = cursor.fetchall()
            cursor.close()

            # Group results by creature_id
            loot_by_boss = {}
            for row in results:
                creature_id = row['creature_id']
                if creature_id not in loot_by_boss:
                    loot_by_boss[creature_id] = []
                loot_by_boss[creature_id].append(row)

            # Deduplicate quest items (class 12) per boss - keep only highest drop chance
            # This prevents quest items from appearing multiple times with different drop rates
            for creature_id in loot_by_boss:
                quest_items = {}
                other_items = []

                for row in loot_by_boss[creature_id]:
                    if row['item_class'] == 12:  # Quest item
                        item_id = row['item_id']
                        if item_id not in quest_items or row['drop_chance'] > quest_items[item_id]['drop_chance']:
                            quest_items[item_id] = row
                    else:
                        other_items.append(row)

                # Combine deduplicated quest items with other items
                deduplicated = other_items + list(quest_items.values())
                deduplicated.sort(key=lambda x: (x['group_id'], -x['drop_chance'], x['item_id']))
                loot_by_boss[creature_id] = deduplicated

            return loot_by_boss

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return {}

    def get_heroic_creature_id(self, creature_id: int) -> Optional[int]:
        """
        Get heroic version creature ID from normal creature ID.

        In AzerothCore, heroic versions of bosses are stored in difficulty_entry_1.

        Args:
            creature_id: Normal creature entry ID

        Returns:
            Heroic creature entry ID or None if not found
        """
        if not self.connection:
            return None

        query = """
            SELECT difficulty_entry_1
            FROM creature_template
            WHERE entry = %s
              AND difficulty_entry_1 > 0
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, (creature_id,))
            result = cursor.fetchone()
            cursor.close()

            if result and result['difficulty_entry_1']:
                return result['difficulty_entry_1']
            return None

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return None

    def get_boss_name(self, creature_id: int) -> Optional[str]:
        """
        Get boss name from creature ID.

        Args:
            creature_id: Creature entry ID

        Returns:
            Boss name or None if not found
        """
        if not self.connection:
            return None

        query = """
            SELECT name
            FROM creature_template
            WHERE entry = %s
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, (creature_id,))
            result = cursor.fetchone()
            cursor.close()

            if result:
                return result['name']
            else:
                print(f"Warning: Creature ID {creature_id} not found")
                return None

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return None

    def verify_item_exists(self, item_id: int) -> bool:
        """
        Verify that an item exists in the item_template table.

        Args:
            item_id: Item entry ID

        Returns:
            True if item exists, False otherwise
        """
        if not self.connection:
            return False

        query = """
            SELECT entry
            FROM item_template
            WHERE entry = %s
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor()
            cursor.execute(query, (item_id,))
            result = cursor.fetchone()
            cursor.close()
            return result is not None

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return False

    def get_gameobject_name(self, gameobject_entry: int) -> Optional[str]:
        """
        Get gameobject name from entry ID.

        Args:
            gameobject_entry: Gameobject entry ID

        Returns:
            Gameobject name or None if not found
        """
        if not self.connection:
            return None

        query = """
            SELECT name
            FROM gameobject_template
            WHERE entry = %s
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, (gameobject_entry,))
            result = cursor.fetchone()
            cursor.close()

            if result:
                return result['name']
            return None

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return None

    def get_gameobject_loot(self, gameobject_entry: int) -> List[Dict]:
        """
        Get loot items for a gameobject (chest, container, etc).

        Looks up loot template ID from gameobject_template.Data1 (for type=3 chests),
        then queries gameobject_loot_template.

        Args:
            gameobject_entry: Gameobject entry ID

        Returns:
            List of loot items with full details
        """
        if not self.connection:
            return []

        # Step 1: Get loot template ID from gameobject_template
        loot_query = """
            SELECT Data1 as loot_id, name
            FROM gameobject_template
            WHERE entry = %s
              AND type = 3  -- Chest type
            LIMIT 1
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(loot_query, (gameobject_entry,))
            result = cursor.fetchone()
            cursor.close()

            if not result or not result['loot_id']:
                print(f"Warning: No loot template found for gameobject {gameobject_entry}")
                return []

            loot_template_id = result['loot_id']

        except mysql.connector.Error as err:
            print(f"Gameobject query error: {err}")
            return []

        # Step 2: Query gameobject_loot_template
        loot_items_query = """
            SELECT
                glt.Entry as gameobject_id,
                glt.Item as item_id,
                it.name as item_name,
                it.Quality as quality,
                it.InventoryType as inventory_type,
                it.class as item_class,
                it.subclass as item_subclass,
                glt.Chance as drop_chance,
                glt.GroupId as group_id
            FROM gameobject_loot_template glt
            LEFT JOIN item_template it ON glt.Item = it.entry
            WHERE glt.Entry = %s
              AND glt.Reference = 0
              AND glt.Item > 0
              -- Filter to show only meaningful loot
              AND (
                  -- Quest items with >= 50% drop rate (filters world-drop quest items)
                  (it.class = 12 AND (glt.Chance >= 50 OR glt.Chance = 0))
                  OR it.class = 13                       -- Keys (dungeon attunement keys)
                  OR glt.Item >= 900000                  -- Custom items
                  -- Show rare items (quality 3) with >= 3% drop rate (excludes class 12 quest items)
                  OR (it.Quality = 3 AND glt.Chance >= 3 AND it.class != 12)
                  -- Show epic+ items (quality 4+) with >= 1% drop rate (excludes class 12 quest items)
                  OR (it.Quality >= 4 AND glt.Chance >= 1 AND it.class != 12)
                  OR (it.Quality = 2 AND glt.Chance >= 10 AND it.class != 12)
                  OR (glt.Chance = 0 AND glt.GroupId > 0)
              )
            ORDER BY glt.GroupId, glt.Chance DESC, glt.Item
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(loot_items_query, (loot_template_id,))
            results = cursor.fetchall()
            cursor.close()

            # Also resolve reference loot if any
            ref_items = self._resolve_gameobject_reference_loot(loot_template_id)
            results.extend(ref_items)

            return results

        except mysql.connector.Error as err:
            print(f"Gameobject loot query error: {err}")
            return []

    def _resolve_gameobject_reference_loot(self, loot_template_id: int) -> List[Dict]:
        """
        Resolve reference loot tables for a gameobject.

        Args:
            loot_template_id: Gameobject loot template ID

        Returns:
            List of resolved loot items from reference tables
        """
        if not self.connection:
            return []

        # Find references with high drop chance
        ref_query = """
            SELECT Reference, Chance, GroupId
            FROM gameobject_loot_template
            WHERE Entry = %s
              AND Reference > 0
              AND (Chance >= 100 OR (Chance = 0 AND GroupId = 0))
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(ref_query, (loot_template_id,))
            references = cursor.fetchall()
            cursor.close()

            if not references:
                return []

            # Deduplicate reference IDs - same reference table may be referenced
            # multiple times with different GroupIds
            unique_ref_ids = set(ref['Reference'] for ref in references)

            # Resolve each unique reference table once
            all_ref_items = []
            for ref_id in unique_ref_ids:
                ref_items = self._get_reference_items(ref_id)
                all_ref_items.extend(ref_items)

            return all_ref_items

        except mysql.connector.Error as err:
            print(f"Gameobject reference query error: {err}")
            return []


def test_connection():
    """Test database connection and query basic info."""
    db = LootDatabase()
    if db.connect():
        print("[OK] Database connection successful")

        # Test: Get Targorr the Dread's ID
        boss_name = "Targorr the Dread"
        creature_id = db.get_creature_id(boss_name)
        if creature_id:
            print(f"[OK] Found '{boss_name}' with ID: {creature_id}")

            # Test: Get his loot
            loot = db.get_boss_loot(creature_id)
            print(f"[OK] Found {len(loot)} loot items for {boss_name}")

            if loot:
                print("\nSample loot items:")
                for item in loot[:3]:  # Show first 3 items
                    print(f"  - {item['item_name']} (ID: {item['item_id']}, "
                          f"Quality: {item['quality']}, Drop: {item['drop_chance']}%)")

        db.disconnect()
        print("\n[OK] Database test complete")
    else:
        print("[ERROR] Database connection failed")


if __name__ == "__main__":
    test_connection()
