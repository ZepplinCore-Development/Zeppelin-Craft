"""
Lua Generator Module
Generates AtlasLoot-formatted Lua code from database loot data
"""

from typing import List, Dict
from atlasloot_mappings import get_lua_item_line, get_boss_header_line


class LuaGenerator:
    """Generates AtlasLoot Lua table entries from loot data."""

    def __init__(self, section_name: str):
        """
        Initialize generator for a specific section.

        Args:
            section_name: AtlasLoot section name (e.g., "TheStockade")
        """
        self.section_name = section_name
        self.lines = []
        self.current_line_num = 1

    def add_boss_section(self, boss_name: str, loot_items: List[Dict]):
        """
        Add a complete boss section with header and loot items.

        Args:
            boss_name: Boss name for the header
            loot_items: List of loot item dictionaries from database query
        """
        # Add boss header
        boss_header = get_boss_header_line(self.current_line_num, boss_name)
        self.lines.append(boss_header)
        self.current_line_num += 1

        # Calculate group loot drop rates (Chance=0 with GroupId>0 means "pick one from group")
        # Count items per group
        group_counts = {}
        for item in loot_items:
            if item['drop_chance'] == 0 and item.get('group_id', 0) > 0:
                group_id = item['group_id']
                group_counts[group_id] = group_counts.get(group_id, 0) + 1

        # Add loot items with calculated drop rates
        for item in loot_items:
            # Calculate actual drop chance for group loot
            drop_chance = item['drop_chance']
            if drop_chance == 0 and item.get('group_id', 0) > 0:
                # Group loot: 100% divided by number of items in group
                group_id = item['group_id']
                drop_chance = 100.0 / group_counts[group_id]

            item_line = get_lua_item_line(
                line_num=self.current_line_num,
                item_id=item['item_id'],
                item_name=item['item_name'],
                quality=item['quality'],
                item_class=item['item_class'],
                item_subclass=item['item_subclass'],
                inventory_type=item['inventory_type'],
                drop_chance=drop_chance
            )
            self.lines.append(item_line)
            self.current_line_num += 1

        # Add spacing after boss section (skip a line number)
        self.current_line_num += 1

    def generate_section(self, boss_loot_data: Dict[str, List[Dict]]) -> str:
        """
        Generate complete AtlasLoot section code.

        Args:
            boss_loot_data: Dictionary mapping boss_name -> list of loot items

        Returns:
            Complete Lua code for the section including header and footer
        """
        self.lines = []
        self.current_line_num = 1

        # Section header
        section_header = f'\tAtlasLoot_Data["{self.section_name}"] = {{'
        self.lines.insert(0, section_header)

        # Add each boss and their loot
        for boss_name, loot_items in boss_loot_data.items():
            if loot_items:  # Only add boss if they have loot
                self.add_boss_section(boss_name, loot_items)

        # Section footer
        self.lines.append('\t};')

        # Join all lines
        return '\n'.join(self.lines)

    def generate_from_database_results(self, boss_names: List[str],
                                      loot_by_creature_id: Dict[int, List[Dict]],
                                      creature_id_map: Dict[str, int]) -> str:
        """
        Generate section from raw database results.

        Args:
            boss_names: List of boss names in display order
            loot_by_creature_id: Dictionary mapping creature_id -> loot items
            creature_id_map: Dictionary mapping boss_name -> creature_id

        Returns:
            Complete Lua code for the section
        """
        # Build boss_loot_data in the correct order
        boss_loot_data = {}
        for boss_name in boss_names:
            creature_id = creature_id_map.get(boss_name)
            if creature_id:
                loot_items = loot_by_creature_id.get(creature_id, [])
                if loot_items:
                    boss_loot_data[boss_name] = loot_items

        return self.generate_section(boss_loot_data)

    def generate_single_boss_section(self, loot_items: List[Dict]) -> str:
        """
        Generate AtlasLoot section for a single boss (no boss headers).

        Used for raid bosses that have their own dedicated sections
        (e.g., BWLFiremaw, MCRagnaros) without BabbleBoss headers.

        Args:
            loot_items: List of loot item dictionaries from database query

        Returns:
            Complete Lua code for the section including header and footer
        """
        self.lines = []
        self.current_line_num = 1

        # Section header
        section_header = f'\tAtlasLoot_Data["{self.section_name}"] = {{'
        self.lines.append(section_header)

        # Calculate group loot drop rates
        group_counts = {}
        for item in loot_items:
            if item['drop_chance'] == 0 and item.get('group_id', 0) > 0:
                group_id = item['group_id']
                group_counts[group_id] = group_counts.get(group_id, 0) + 1

        # Add loot items (no boss header needed)
        for item in loot_items:
            # Calculate actual drop chance for group loot
            drop_chance = item['drop_chance']
            if drop_chance == 0 and item.get('group_id', 0) > 0:
                group_id = item['group_id']
                drop_chance = 100.0 / group_counts[group_id]

            item_line = get_lua_item_line(
                line_num=self.current_line_num,
                item_id=item['item_id'],
                item_name=item['item_name'],
                quality=item['quality'],
                item_class=item['item_class'],
                item_subclass=item['item_subclass'],
                inventory_type=item['inventory_type'],
                drop_chance=drop_chance
            )
            self.lines.append(item_line)
            self.current_line_num += 1

        # Section footer
        self.lines.append('\t};')

        return '\n'.join(self.lines)


def test_generator():
    """Test the Lua generator with sample data."""
    print("Testing Lua Generator\n")

    # Sample data (simulating database results)
    test_boss_loot = {
        "Targorr the Dread": [
            {
                'item_id': 3630,
                'item_name': 'Head of Targorr',
                'quality': 1,
                'item_class': 12,
                'item_subclass': 0,
                'inventory_type': 0,
                'drop_chance': 100.0
            },
            {
                'item_id': 901100,
                'item_name': 'Dread Sword',
                'quality': 4,
                'item_class': 2,
                'item_subclass': 7,
                'inventory_type': 13,
                'drop_chance': 0.0  # Group loot
            },
        ],
        "Kam Deepfury": [
            {
                'item_id': 2280,
                'item_name': "Kam's Walking Stick",
                'quality': 2,
                'item_class': 2,
                'item_subclass': 10,
                'inventory_type': 17,
                'drop_chance': 0.62
            },
            {
                'item_id': 3640,
                'item_name': 'Head of Deepfury',
                'quality': 1,
                'item_class': 12,
                'item_subclass': 0,
                'inventory_type': 0,
                'drop_chance': 100.0
            },
        ]
    }

    # Generate Lua code
    generator = LuaGenerator("TheStockade")
    lua_code = generator.generate_section(test_boss_loot)

    print("Generated Lua code:")
    print("=" * 60)
    print(lua_code)
    print("=" * 60)

    # Verify structure
    if 'AtlasLoot_Data["TheStockade"]' in lua_code:
        print("\n✓ Section header correct")
    if 'BabbleBoss["Targorr the Dread"]' in lua_code:
        print("✓ Boss headers correct")
    if '901100' in lua_code:
        print("✓ Custom item IDs included")
    if lua_code.strip().endswith('};'):
        print("✓ Section footer correct")


if __name__ == "__main__":
    test_generator()
