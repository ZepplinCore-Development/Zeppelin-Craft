"""
Lua Generator Module
Generates AtlasLoot-formatted Lua code from database loot data
"""

from typing import List, Dict
from atlasloot_mappings import get_lua_item_line, get_boss_header_line


class LuaGenerator:
    """Generates AtlasLoot Lua table entries from loot data."""

    # AtlasLoot display constants
    COLUMN_1_MAX = 15  # Positions 1-15 = Column 1
    COLUMN_2_START = 16  # Positions 16-30 = Column 2
    MAX_ITEMS = 30  # Maximum items per page

    def __init__(self, section_name: str):
        """
        Initialize generator for a specific section.

        Args:
            section_name: AtlasLoot section name (e.g., "TheStockade")
        """
        self.section_name = section_name
        self.lines = []
        self.current_line_num = 1

    def _calculate_boss_section_size(self, loot_items: List[Dict]) -> int:
        """
        Calculate how many line positions a boss section will consume.

        Accounts for boss header, all items, and group spacers.

        Args:
            loot_items: List of loot item dictionaries

        Returns:
            Number of line positions needed
        """
        if not loot_items:
            return 0

        size = 1  # Boss header

        # Count items and group transitions (spacers)
        last_group_id = None
        for item in loot_items:
            current_group_id = item.get('group_id', 0)
            if last_group_id is not None and current_group_id != last_group_id:
                size += 1  # Spacer between groups
            last_group_id = current_group_id
            size += 1  # The item itself

        return size

    # Minimum position in column 1 before considering jump to column 2
    # Only applies when section DOESN'T fit in column 2
    COLUMN_JUMP_THRESHOLD = 12

    def _would_span_columns(self, section_size: int) -> bool:
        """
        Check if adding a section at current position would span columns.

        Args:
            section_size: Number of line positions the section needs

        Returns:
            True if section would start in column 1 and extend into column 2
        """
        if self.current_line_num > self.COLUMN_1_MAX:
            # Already in column 2, can't span
            return False

        # Check if section would extend past column 1
        end_position = self.current_line_num + section_size - 1
        return end_position > self.COLUMN_1_MAX

    def _should_jump_to_column_2(self, section_size: int) -> bool:
        """
        Decide if we should jump to column 2 for a section.

        Logic:
        - If section fits entirely in column 2 AND would span columns, ALWAYS jump
        - If section doesn't fit in column 2, only jump if past threshold
          (to avoid large gaps early in column 1)

        Args:
            section_size: Number of line positions the section needs

        Returns:
            True if should jump to column 2
        """
        if self.current_line_num > self.COLUMN_1_MAX:
            # Already in column 2
            return False

        if not self._would_span_columns(section_size):
            # Section fits in remaining column 1 space
            return False

        # Section would span columns - decide whether to jump
        column_2_capacity = self.MAX_ITEMS - self.COLUMN_2_START + 1  # 15 slots
        fits_in_column_2 = section_size <= column_2_capacity

        if fits_in_column_2:
            # Section fits entirely in column 2 - always jump to keep it together
            return True
        else:
            # Section too big for column 2 - only jump if past threshold
            # (to avoid large gaps when we'll span anyway)
            return self.current_line_num >= self.COLUMN_JUMP_THRESHOLD

    def _get_group_items(self, loot_items: List[Dict], start_idx: int) -> List[Dict]:
        """
        Get all items belonging to the same group starting from start_idx.

        Args:
            loot_items: Full list of loot items
            start_idx: Starting index to look from

        Returns:
            List of items in the same group
        """
        if start_idx >= len(loot_items):
            return []

        group_id = loot_items[start_idx].get('group_id', 0)
        group_items = []

        for i in range(start_idx, len(loot_items)):
            if loot_items[i].get('group_id', 0) == group_id:
                group_items.append(loot_items[i])
            else:
                break

        return group_items

    def add_boss_section(self, boss_name: str, loot_items: List[Dict]):
        """
        Add a complete boss section with header and loot items.

        Implements column-aware layout to prevent boss sections from
        spanning across columns (positions 1-15 = column 1, 16-30 = column 2).

        Args:
            boss_name: Boss name for the header
            loot_items: List of loot item dictionaries from database query
        """
        # Calculate section size and check for column spillover
        section_size = self._calculate_boss_section_size(loot_items)

        # If this section would span columns, advance to column 2
        if self._would_span_columns(section_size):
            self.current_line_num = self.COLUMN_2_START

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
        # Track group changes for visual separation with column-aware layout
        last_group_id = None
        i = 0
        while i < len(loot_items):
            current_group_id = loot_items[i].get('group_id', 0)

            # Check for group transition
            if last_group_id is not None and current_group_id != last_group_id:
                # Get items in this new group
                group_items = self._get_group_items(loot_items, i)
                group_size = len(group_items)

                # Check if this group would span columns
                if self._would_span_columns(group_size + 1):  # +1 for spacer
                    self.current_line_num = self.COLUMN_2_START
                else:
                    self.current_line_num += 1  # Skip a line number for visual gap

            last_group_id = current_group_id

            # Calculate actual drop chance for group loot
            item = loot_items[i]
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
            i += 1

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

    def _add_pool_header(self, header_text: str, subtitle: str = ""):
        """Add a pool/category header line."""
        if subtitle:
            header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6={header_text}", "=q5={subtitle}" }};'
        else:
            header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6={header_text}", "" }};'
        self.lines.append(header_line)
        self.current_line_num += 1

    def _categorize_loot(self, loot_items: List[Dict]) -> dict:
        """
        Categorize loot items into display groups.

        Returns dict with:
        - 'guaranteed': Items with 100% drop, or custom items (900000+) with 0% chance
        - 'variable': Items with <100% drop (independent rolls)
        - 'pools': Dict of GroupId -> items (one of these drops per group)
                   Only includes groups where total chance ≈ 100% (true "pick one" pools)
        """
        guaranteed = []
        variable = []
        pools = {}

        # First pass: collect items by group
        groups = {}
        for item in loot_items:
            group_id = item.get('group_id', 0)
            if group_id not in groups:
                groups[group_id] = []
            groups[group_id].append(item)

        # Calculate total chance per group to determine if it's a true pool
        group_totals = {}
        for group_id, items in groups.items():
            group_totals[group_id] = sum(item['drop_chance'] for item in items)

        # Second pass: categorize based on group behavior
        for item in loot_items:
            group_id = item.get('group_id', 0)
            chance = item['drop_chance']
            item_id = item.get('item_id', 0)

            # Custom items (900000+) with 0% chance are guaranteed drops
            is_custom_guaranteed = (item_id >= 900000 or item_id >= 59000) and chance == 0

            if is_custom_guaranteed:
                guaranteed.append(item)
            elif group_id == 0:
                # GroupId 0 = independent drops
                if chance >= 100:
                    guaranteed.append(item)
                else:
                    variable.append(item)
            else:
                # GroupId > 0: check if it's a true "pick one" pool
                # A pool totals ~100% (allowing some tolerance for rounding)
                group_total = group_totals.get(group_id, 0)
                is_true_pool = 90 <= group_total <= 110  # ~100% with tolerance

                if is_true_pool:
                    # True pool: one of these drops
                    if group_id not in pools:
                        pools[group_id] = []
                    pools[group_id].append(item)
                else:
                    # Not a true pool: treat as independent variable drops
                    if chance >= 100:
                        guaranteed.append(item)
                    else:
                        variable.append(item)

        return {
            'guaranteed': guaranteed,
            'variable': variable,
            'pools': pools
        }

    def _add_items_block(self, items: List[Dict], group_counts: dict = None, force_chance: float = None):
        """Add a block of items with proper formatting.

        Args:
            items: List of item dicts
            group_counts: Dict of group_id -> count for equal-chance calculation
            force_chance: If set, override drop chance display for all items (e.g., 100 for guaranteed)
        """
        for item in items:
            drop_chance = item['drop_chance']

            # Override chance if specified (for guaranteed custom items)
            if force_chance is not None and drop_chance == 0:
                drop_chance = force_chance
            # Calculate actual drop chance for group loot (Chance=0 means equal share)
            elif drop_chance == 0 and item.get('group_id', 0) > 0 and group_counts:
                group_id = item['group_id']
                drop_chance = 100.0 / group_counts.get(group_id, 1)

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

    def generate_single_boss_section(self, loot_items: List[Dict]) -> str:
        """
        Generate AtlasLoot section for a single boss with pool headers.

        Organizes loot into categories:
        - Guaranteed drops (100%)
        - Variable drops (independent rolls, <100%)
        - Pool drops (one of these drops per pool)

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

        # Categorize items
        categories = self._categorize_loot(loot_items)
        guaranteed = categories['guaranteed']
        variable = categories['variable']
        pools = categories['pools']

        # Calculate group counts for equal-chance pool items
        group_counts = {}
        for group_id, items in pools.items():
            for item in items:
                if item['drop_chance'] == 0:
                    group_counts[group_id] = group_counts.get(group_id, 0) + 1

        # Add guaranteed drops with header
        if guaranteed:
            self._add_pool_header("Guaranteed", "Always Drops")
            self._add_items_block(guaranteed, force_chance=100)

        # Add variable drops with header
        if variable:
            # Add spacer if we had guaranteed drops
            if guaranteed:
                self.current_line_num += 1

            # Check column spanning for variable section (header + items)
            section_size = len(variable) + 1  # +1 for header
            if self._should_jump_to_column_2(section_size):
                self.current_line_num = self.COLUMN_2_START

            self._add_pool_header("Variable", "Chance on Drop")
            self._add_items_block(variable)

        # Add pool drops with headers
        for group_id in sorted(pools.keys()):
            pool_items = pools[group_id]

            # Add spacer before pool
            self.current_line_num += 1

            # Check column spanning for this pool (header + items)
            pool_size = len(pool_items) + 1  # +1 for header
            if self._should_jump_to_column_2(pool_size):
                self.current_line_num = self.COLUMN_2_START

            # Add pool header
            self._add_pool_header("One of the following:")

            # Add pool items
            self._add_items_block(pool_items, group_counts)

        # Section footer
        self.lines.append('\t};')

        return '\n'.join(self.lines)

    def generate_multi_source_section(self, sources_with_loot: list) -> str:
        """
        Generate AtlasLoot section for multi-source encounters with headers.

        Used for encounters that combine loot from multiple sources
        (e.g., Vazruden + Nazan + Chest) on a single page.

        Args:
            sources_with_loot: List of dicts with:
                - 'header': BabbleBoss name or custom header text
                - 'header_sub': Subtitle (e.g., "Quest Item", "Loot", or empty)
                - 'is_babble': True to use BabbleBoss[], False for AL[]
                - 'loot_items': List of loot item dictionaries

        Returns:
            Complete Lua code for the section including header and footer
        """
        self.lines = []
        self.current_line_num = 1

        # Section header
        section_header = f'\tAtlasLoot_Data["{self.section_name}"] = {{'
        self.lines.append(section_header)

        for source in sources_with_loot:
            header = source['header']
            header_sub = source.get('header_sub', '')
            is_babble = source.get('is_babble', True)
            loot_items = source.get('loot_items', [])

            # Skip sources with no loot
            if not loot_items:
                continue

            # Calculate total size for this source (header + items)
            source_size = 1 + len(loot_items)

            # Check if source would span columns
            # Only move to column 2 if source fits entirely there (15 slots)
            # Otherwise, let it span columns naturally to avoid overflow
            column_2_capacity = self.MAX_ITEMS - self.COLUMN_2_START + 1  # 15 slots
            if self._would_span_columns(source_size) and self.current_line_num > 1:
                if source_size <= column_2_capacity:
                    self.current_line_num = self.COLUMN_2_START
                # else: source too big for column 2, let it span naturally

            # Add header line
            if is_babble:
                if header_sub:
                    header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6="..BabbleBoss["{header}"], "=q5="..AL["{header_sub}"]}};'
                else:
                    header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6="..BabbleBoss["{header}"], ""}};'
            else:
                # Use AL[] for non-BabbleBoss headers (like chest names)
                if header_sub:
                    header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6="..AL["{header}"], "=q5="..AL["{header_sub}"]}};'
                else:
                    header_line = f'    {{ {self.current_line_num}, 0, "INV_Box_01", "=q6="..AL["{header}"], ""}};'
            self.lines.append(header_line)
            self.current_line_num += 1

            # Calculate group loot drop rates
            group_counts = {}
            for item in loot_items:
                if item['drop_chance'] == 0 and item.get('group_id', 0) > 0:
                    group_id = item['group_id']
                    group_counts[group_id] = group_counts.get(group_id, 0) + 1

            # Process items
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

            # Add gap after source (skip one line number)
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
        print("\n[OK] Section header correct")
    if 'BabbleBoss["Targorr the Dread"]' in lua_code:
        print("[OK] Boss headers correct")
    if '901100' in lua_code:
        print("[OK] Custom item IDs included")
    if lua_code.strip().endswith('};'):
        print("[OK] Section footer correct")


if __name__ == "__main__":
    test_generator()
