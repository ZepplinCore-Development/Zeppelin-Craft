"""
Vendor Query Module for AtlasLoot Generator
Handles database queries for faction reputation vendor items.
"""

import logging
import pymysql
import os
from pathlib import Path
from typing import List, Dict, Optional

from dotenv import load_dotenv

logger = logging.getLogger('atlasloot_generator')

# Load CLI .env
_cli_dir = Path(__file__).parent.parent.parent  # cli/lib/atlasloot -> cli/
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)


# DB reputation rank -> AtlasLoot rep code
# DB: 0=Hated, 1=Hostile, 2=Unfriendly, 3=Neutral, 4=Friendly, 5=Honored, 6=Revered, 7=Exalted
# AL: #r1#=Neutral, #r2#=Friendly, #r3#=Honored, #r4#=Revered, #r5#=Exalted
REP_RANK_CODES = {
    3: '#r1#',  # Neutral
    4: '#r2#',  # Friendly
    5: '#r3#',  # Honored
    6: '#r4#',  # Revered
    7: '#r5#',  # Exalted
}

REP_RANK_NAMES = {
    3: 'Neutral',
    4: 'Friendly',
    5: 'Honored',
    6: 'Revered',
    7: 'Exalted',
}


class VendorDatabase:
    """Database connection handler for faction vendor queries."""

    def __init__(self, host=None, port=None, user=None, password=None, database=None):
        self.connection_params = {
            'host': host or os.getenv('DB_HOST', '192.168.0.55'),
            'port': port or int(os.getenv('DB_PORT', '3306')),
            'user': user or os.getenv('DB_USER', 'acore'),
            'passwd': password or os.getenv('DB_PASS', 'acore'),
            'db': database or 'acore_world',
        }
        self.connection = None

    def connect(self):
        """Establish database connection."""
        try:
            self.connection = pymysql.connect(**self.connection_params)
            return True
        except pymysql.Error as err:
            logger.error(f"Database connection error: {err}")
            return False

    def disconnect(self):
        """Close database connection."""
        if self.connection and self.connection.open:
            self.connection.close()

    def get_faction_vendor_items(self, faction_id: int,
                                 primary_vendor_id: Optional[int] = None) -> Dict[int, List[Dict]]:
        """
        Get all reputation vendor items for a faction, grouped by rep rank.

        Queries items where RequiredReputationFaction matches, sold by a specific
        vendor (if provided) or any vendor. Deduplicates by item ID.

        Args:
            faction_id: WoW faction ID (e.g., 942 for Cenarion Expedition)
            primary_vendor_id: Optional specific vendor creature entry to query.
                              If None, queries all vendors selling items for this faction.

        Returns:
            Dict mapping rep rank (4-8) to list of item dicts, sorted by quality desc.
        """
        if not self.connection:
            return {}

        if primary_vendor_id:
            query = """
                SELECT DISTINCT
                    it.entry AS item_id,
                    it.name AS item_name,
                    it.Quality AS quality,
                    it.class AS item_class,
                    it.subclass AS item_subclass,
                    it.InventoryType AS inventory_type,
                    it.RequiredReputationRank AS rep_rank,
                    it.RequiredLevel AS required_level
                FROM npc_vendor nv
                JOIN item_template it ON it.entry = nv.item
                WHERE nv.entry = %s
                  AND it.RequiredReputationFaction = %s
                  AND it.RequiredReputationRank >= 3
                  AND NOT (it.class = 0 AND it.subclass IN (0, 5))
                ORDER BY it.RequiredReputationRank, it.Quality DESC, it.name ASC
            """
            params = (primary_vendor_id, faction_id)
        else:
            query = """
                SELECT DISTINCT
                    it.entry AS item_id,
                    it.name AS item_name,
                    it.Quality AS quality,
                    it.class AS item_class,
                    it.subclass AS item_subclass,
                    it.InventoryType AS inventory_type,
                    it.RequiredReputationRank AS rep_rank,
                    it.RequiredLevel AS required_level
                FROM npc_vendor nv
                JOIN item_template it ON it.entry = nv.item
                WHERE it.RequiredReputationFaction = %s
                  AND it.RequiredReputationRank >= 3
                  AND NOT (it.class = 0 AND it.subclass IN (0, 5))
                ORDER BY it.RequiredReputationRank, it.Quality DESC, it.name ASC
            """
            params = (faction_id,)

        try:
            cursor = self.connection.cursor(pymysql.cursors.DictCursor)
            cursor.execute(query, params)
            rows = cursor.fetchall()
            cursor.close()
        except pymysql.Error as err:
            logger.error(f"Query error for faction {faction_id}: {err}")
            return {}

        # Group by rep rank, dedup by item_id
        items_by_rank = {}
        seen_items = set()

        for row in rows:
            item_id = row['item_id']
            if item_id in seen_items:
                continue
            seen_items.add(item_id)

            rank = row['rep_rank']
            if rank not in items_by_rank:
                items_by_rank[rank] = []

            items_by_rank[rank].append({
                'item_id': item_id,
                'item_name': row['item_name'],
                'quality': row['quality'],
                'item_class': row['item_class'],
                'item_subclass': row['item_subclass'],
                'inventory_type': row['inventory_type'],
                'rep_rank': rank,
                'required_level': row['required_level'],
            })

        total = sum(len(items) for items in items_by_rank.values())
        ranks_str = ', '.join(f"{REP_RANK_NAMES.get(r, r)}: {len(items)}"
                              for r, items in sorted(items_by_rank.items()))
        logger.info(f"Faction {faction_id}: {total} items ({ranks_str})")

        return items_by_rank
