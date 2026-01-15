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

    def get_boss_loot(self, creature_id: int) -> List[Dict]:
        """
        Get all direct loot items for a boss (excluding reference loot).

        Args:
            creature_id: Creature entry ID

        Returns:
            List of loot items with full details
        """
        if not self.connection:
            return []

        query = """
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
                  -- Always show rare/epic/legendary (quality 3+)
                  OR it.Quality >= 3
                  -- Show uncommon (green) items with decent drop rates
                  OR (it.Quality = 2 AND clt.Chance >= 10)
                  -- Show group loot items (Chance=0 with GroupId>0) - these are special boss drops
                  OR (clt.Chance = 0 AND clt.GroupId > 0)
              )
            ORDER BY clt.GroupId, clt.Item
        """

        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query, (creature_id,))
            results = cursor.fetchall()
            cursor.close()
            return results

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
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
                  -- Always show rare/epic/legendary (quality 3+)
                  OR it.Quality >= 3
                  -- Show uncommon (green) items with decent drop rates
                  OR (it.Quality = 2 AND clt.Chance >= 10)
                  -- Show group loot items (Chance=0 with GroupId>0) - these are special boss drops
                  OR (clt.Chance = 0 AND clt.GroupId > 0)
              )
            ORDER BY clt.Entry, clt.GroupId, clt.Item
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

            return loot_by_boss

        except mysql.connector.Error as err:
            print(f"Query error: {err}")
            return {}

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
