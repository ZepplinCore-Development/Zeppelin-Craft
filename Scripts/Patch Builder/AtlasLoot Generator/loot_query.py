"""
Database Query Module for AtlasLoot Generator
Handles all database operations for fetching boss loot data
"""

import mysql.connector
from typing import List, Dict, Optional


class LootDatabase:
    """Database connection handler for AzerothCore loot queries."""

    def __init__(self, host="192.168.0.55", port=3306, user="acore",
                 password="acore", database="acore_world"):
        """
        Initialize database connection.

        Args:
            host: Database host address
            port: Database port
            user: Database username
            password: Database password
            database: Database name
        """
        self.connection_params = {
            'host': host,
            'port': port,
            'user': user,
            'password': password,
            'database': database
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
        direct_query = """
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
                  -- Always show quest items (class 12)
                  it.class = 12
                  -- Always show custom items (900000+)
                  OR clt.Item >= 900000
                  -- Always show rare/epic/legendary (quality 3+), exclude low drop-rate recipes
                  OR (it.Quality >= 3 AND NOT (it.class = 9 AND clt.Chance > 0 AND clt.Chance < 5))
                  -- Show uncommon (green) items with decent drop rates
                  OR (it.Quality = 2 AND clt.Chance >= 10)
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

        # Step 2: Resolve reference loot tables (if enabled)
        if include_references:
            ref_items = self._resolve_reference_loot(creature_id)
            results.extend(ref_items)

        return results

    def _resolve_reference_loot(self, creature_id: int) -> List[Dict]:
        """
        Resolve reference loot tables for a creature.

        Only includes references with Chance >= 100 (guaranteed roll) or
        Chance = 0 with GroupId = 0 (always included).

        Args:
            creature_id: Creature entry ID

        Returns:
            List of resolved loot items from reference tables
        """
        if not self.connection:
            return []

        # Find references with high drop chance (meaningful loot tables)
        ref_query = """
            SELECT Reference, Chance, GroupId
            FROM creature_loot_template
            WHERE Entry = %s
              AND Reference > 0
              AND (Chance >= 100 OR (Chance = 0 AND GroupId = 0))
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(ref_query, (creature_id,))
            references = cursor.fetchall()
            cursor.close()

            if not references:
                return []

            # Resolve each reference table
            all_ref_items = []
            for ref in references:
                ref_id = ref['Reference']
                ref_items = self._get_reference_items(ref_id)
                all_ref_items.extend(ref_items)

            return all_ref_items

        except mysql.connector.Error as err:
            print(f"Reference query error: {err}")
            return []

    def _get_reference_items(self, reference_id: int) -> List[Dict]:
        """
        Get all items from a reference loot table with properly calculated drop rates.

        Drop rate calculation follows AzerothCore loot rules:
        - GroupId > 0: Only ONE item from the group drops
        - Chance = 0 in a group: Equal-chanced, shares remaining probability
        - Items with explicit Chance values take priority

        Args:
            reference_id: Reference loot table ID

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

            # Filter to meaningful items only (after calculating chances)
            filtered_items = []
            for item in all_items:
                # Exclude low drop-rate recipes (class 9) from rare+ filter
                is_low_drop_recipe = (item['item_class'] == 9 and
                                      item['drop_chance'] > 0 and
                                      item['drop_chance'] < 5)
                if (item['item_class'] == 12 or           # Quest items
                    item['item_id'] >= 900000 or          # Custom items
                    (item['quality'] >= 3 and not is_low_drop_recipe) or  # Rare+ (excl low drop recipes)
                    (item['quality'] == 2 and item['drop_chance'] >= 10)):
                    filtered_items.append(item)

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
                  -- Always show quest items (class 12)
                  it.class = 12
                  -- Always show custom items (900000+)
                  OR clt.Item >= 900000
                  -- Always show rare/epic/legendary (quality 3+), exclude low drop-rate recipes
                  OR (it.Quality >= 3 AND NOT (it.class = 9 AND clt.Chance > 0 AND clt.Chance < 5))
                  -- Show uncommon (green) items with decent drop rates
                  OR (it.Quality = 2 AND clt.Chance >= 10)
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


def test_connection():
    """Test database connection and query basic info."""
    db = LootDatabase()
    if db.connect():
        print("✓ Database connection successful")

        # Test: Get Targorr the Dread's ID
        boss_name = "Targorr the Dread"
        creature_id = db.get_creature_id(boss_name)
        if creature_id:
            print(f"✓ Found '{boss_name}' with ID: {creature_id}")

            # Test: Get his loot
            loot = db.get_boss_loot(creature_id)
            print(f"✓ Found {len(loot)} loot items for {boss_name}")

            if loot:
                print("\nSample loot items:")
                for item in loot[:3]:  # Show first 3 items
                    print(f"  - {item['item_name']} (ID: {item['item_id']}, "
                          f"Quality: {item['quality']}, Drop: {item['drop_chance']}%)")

        db.disconnect()
        print("\n✓ Database test complete")
    else:
        print("✗ Database connection failed")


if __name__ == "__main__":
    test_connection()
