"""
Reputation Vendor Generator for AtlasLoot
Generates faction reputation reward Lua tables from database vendor data.
"""

import logging
from typing import List, Dict, Optional

from .mappings import get_item_codes, QUALITY_CODES, SLOT_CODES, ARMOR_TYPE_CODES, WEAPON_TYPE_CODES
from .vendor_query import REP_RANK_CODES, REP_RANK_NAMES

logger = logging.getLogger('atlasloot_generator')

# AtlasLoot display constants
COLUMN_1_MAX = 15   # Positions 1-15 = Column 1
COLUMN_2_START = 16  # Positions 16-30 = Column 2
MAX_ITEMS = 30       # Maximum items per page


def _build_item_description(item: Dict) -> str:
    """Build the AtlasLoot description string for a vendor item.

    Handles equipment slots, armor types, weapon types, and recipes/patterns.
    Matches the format used in hand-authored faction tables.
    """
    quality_code, type_code = get_item_codes(
        item['item_class'], item['item_subclass'],
        item['inventory_type'], item['quality']
    )

    item_class = item['item_class']
    item_subclass = item['item_subclass']
    inventory_type = item['inventory_type']

    # Recipe items (class 9) — check item name for profession hints
    if item_class == 9:
        return _build_recipe_description(item)

    # Weapons — add hand type + weapon type
    if item_class == 2:
        hand_code = ''
        if inventory_type == 13:    # One-Hand
            hand_code = '#h1#'
        elif inventory_type == 17:  # Two-Hand
            hand_code = '#h2#'
        elif inventory_type == 21:  # Main Hand
            hand_code = '#h3#'
        elif inventory_type == 22:  # Off Hand
            hand_code = '#h4#'

        weapon_code = WEAPON_TYPE_CODES.get(item_subclass, '')

        if hand_code and weapon_code:
            return f"=ds={hand_code}, {weapon_code}"
        elif weapon_code:
            return f"=ds={weapon_code}"
        elif hand_code:
            return f"=ds={hand_code}"
        return '""'

    # Armor — slot + armor type
    if item_class == 4:
        slot_code = SLOT_CODES.get(inventory_type, '')
        armor_code = ARMOR_TYPE_CODES.get(item_subclass, '')

        if slot_code and armor_code:
            return f"=ds={slot_code}, {armor_code}"
        elif slot_code:
            return f"=ds={slot_code}"
        elif armor_code:
            return f"=ds={armor_code}"
        return '""'

    # Everything else — use type_code from mappings
    if type_code:
        return f"=ds={type_code}"

    return '""'


def _build_recipe_description(item: Dict) -> str:
    """Build description for recipe/pattern/plan items.

    Format: "=ds=#p1# (300)" where #p1# is profession code and (300) is skill level.
    """
    name = item['item_name']
    required_level = item.get('required_level', 0)

    # Map recipe name prefixes to profession codes
    profession_map = {
        'Recipe:': '#p1#',           # Alchemy (default for Recipe:)
        'Plans:': '#p2#',            # Blacksmithing
        'Recipe: Savory': '#p3#',    # Cooking
        'Recipe: Stormchops': '#p3#',
        'Recipe: Spicy': '#p3#',
        'Recipe: Broiled': '#p3#',
        'Recipe: Crunchy': '#p3#',
        'Recipe: Grilled': '#p3#',
        'Recipe: Roasted': '#p3#',
        'Recipe: Poached': '#p3#',
        'Recipe: Blackened': '#p3#',
        'Recipe: Charred': '#p3#',
        'Formula:': '#p4#',          # Enchanting
        'Schematic:': '#p5#',        # Engineering
        'Manual:': '#p6#',           # First Aid
        'Pattern:': '#p7#',          # Leatherworking (default for Pattern:)
        'Design:': '#p12#',          # Jewelcrafting
    }

    # Check longer prefixes first (more specific matches)
    prof_code = '#e2#'  # Default recipe icon
    for prefix, code in sorted(profession_map.items(), key=lambda x: -len(x[0])):
        if name.startswith(prefix):
            prof_code = code
            break

    # Pattern: could be Tailoring or Leatherworking
    # Tailoring patterns often mention Bag, Spellthread, Cloth, Robe, etc.
    if name.startswith('Pattern:'):
        tailoring_keywords = ['Bag', 'Spellthread', 'Spellcloth', 'Primal Mooncloth',
                              'Shadowcloth', 'Soulcloth', 'Netherweave', 'Imbued Netherweave',
                              'Battlecast', 'Whitemend', 'Frozen Shadoweave',
                              'Bolt', 'Cloth', 'Robe', 'Vestment']
        for kw in tailoring_keywords:
            if kw.lower() in name.lower():
                prof_code = '#p8#'  # Tailoring
                break

    # Recipe: could be Alchemy or Cooking — check for cooking keywords
    if name.startswith('Recipe:') and prof_code == '#p1#':
        cooking_keywords = ['Savory', 'Stormchops', 'Spicy', 'Broiled', 'Crunchy',
                           'Grilled', 'Roasted', 'Poached', 'Blackened', 'Charred',
                           'Delicious', 'Ravager', 'Buzzard', 'Clam', 'Feltail',
                           'Hot', 'Mok', 'Soup', 'Stew', 'Kabob', 'Pie']
        for kw in cooking_keywords:
            if kw.lower() in name.lower():
                prof_code = '#p3#'  # Cooking
                break

    # Try to extract required skill level from item's RequiredSkill
    # For now, don't include skill level — it's not reliably available
    # from item_template alone. The hand-authored tables include it, but
    # the auto-generator can add it later if needed.
    return f"=ds={prof_code}"


def _format_rep_item_line(line_num: int, item: Dict) -> str:
    """Generate a single AtlasLoot Lua line for a vendor item."""
    quality_code = QUALITY_CODES.get(item['quality'], '=q0=')
    desc = _build_item_description(item)

    # Escape quotes in item names
    item_name = item['item_name'].replace('"', '\\"')

    return f'    {{ {line_num}, {item["item_id"]}, "", "{quality_code}{item_name}", "{desc}"}};'


def _format_rep_header_line(line_num: int, icon: str, rank: int) -> str:
    """Generate a rep rank header line."""
    rank_code = REP_RANK_CODES.get(rank, '#r1#')
    return f'    {{ {line_num}, 0, "{icon}", "=q6={rank_code}", ""}};'


def generate_faction_tables(section_base: str, items_by_rank: Dict[int, List[Dict]],
                            icon: str, back_menu: str = "REPMENU",
                            max_pages: int = 4) -> List[Dict]:
    """
    Generate one or more AtlasLoot Lua table sections for a faction.

    Lays out items grouped by rep rank across pages, respecting the
    30-slot per page limit with two-column layout.

    Args:
        section_base: Base section name (e.g., "CExpedition")
        items_by_rank: Dict mapping rep rank (4-8) to list of item dicts
        icon: Icon texture name for rank headers
        back_menu: Back navigation target (e.g., "REPMENU_BURNINGCRUSADE")
        max_pages: Maximum number of pages to generate

    Returns:
        List of dicts with 'section_name' and 'lua_code' keys
    """
    if not items_by_rank:
        logger.warning(f"No items for faction section '{section_base}'")
        return []

    # Collect all rank blocks in order
    rank_blocks = []
    for rank in sorted(items_by_rank.keys()):
        items = items_by_rank[rank]
        if items:
            rank_blocks.append({
                'rank': rank,
                'items': items,
                # Size: 1 header + N items
                'size': 1 + len(items),
            })

    # Paginate with column-aware layout
    # Two columns per page: col1 = positions 1-15, col2 = positions 16-30
    # Small blocks go into col1 or col2. Large blocks use sequential layout
    # (flowing across both columns). We try to combine blocks on the same page
    # whenever the total fits within MAX_ITEMS.
    col_capacity = COLUMN_1_MAX  # 15 slots per column

    def _page_sequential_size(blocks):
        """Calculate total sequential positions needed for a list of blocks."""
        total = 0
        for i, b in enumerate(blocks):
            if i > 0:
                total += 1  # gap between blocks
            total += b['size']
        return total

    pages = []
    current_page_blocks = []
    current_seq_size = 0  # total sequential size of current page

    for block in rank_blocks:
        block_size = block['size']
        gap = 1 if current_page_blocks else 0
        new_seq_size = current_seq_size + gap + block_size

        if new_seq_size <= MAX_ITEMS:
            # Fits on current page (sequential layout)
            block['column'] = 'sequential'
            current_page_blocks.append(block)
            current_seq_size = new_seq_size
        else:
            # Won't fit — start new page
            if current_page_blocks:
                pages.append(current_page_blocks)
            current_page_blocks = [block]
            block['column'] = 'sequential'
            current_seq_size = block_size

    if current_page_blocks:
        pages.append(current_page_blocks)

    # Post-process: assign column layout for pages where all blocks fit in columns
    for page_blocks in pages:
        # Check if we can use column layout instead of sequential
        col1_blocks = []
        col2_blocks = []
        col1_size = 0
        col2_size = 0
        can_use_columns = True

        for block in page_blocks:
            bsize = block['size']
            gap1 = 1 if col1_blocks else 0
            gap2 = 1 if col2_blocks else 0

            if bsize <= col_capacity and (col1_size + gap1 + bsize) <= col_capacity:
                col1_blocks.append(block)
                col1_size += gap1 + bsize
            elif bsize <= col_capacity and (col2_size + gap2 + bsize) <= col_capacity:
                col2_blocks.append(block)
                col2_size += gap2 + bsize
            else:
                can_use_columns = False
                break

        if can_use_columns and col2_blocks:
            # Reassign column numbers
            for b in col1_blocks:
                b['column'] = 1
            for b in col2_blocks:
                b['column'] = 2

    # Generate Lua code for each page
    results = []
    num_pages = len(pages)

    for page_idx, page_blocks in enumerate(pages):
        page_num = page_idx + 1
        # Section naming: CExpedition1, CExpedition2, etc.
        section_name = f"{section_base}{page_num}"

        lines = []
        lines.append(f'\tAtlasLoot_Data["{section_name}"] = {{')

        # Separate blocks by column assignment
        col1_blocks = [b for b in page_blocks if b.get('column') == 1]
        col2_blocks = [b for b in page_blocks if b.get('column') == 2]
        seq_blocks = [b for b in page_blocks if b.get('column') == 'sequential']

        if seq_blocks:
            # Sequential layout — blocks flow across both columns naturally
            line_num = 1
            all_blocks = col1_blocks + seq_blocks + col2_blocks
            for block_idx, block in enumerate(all_blocks):
                rank = block['rank']
                items = block['items']

                if block_idx > 0:
                    line_num += 1

                lines.append(_format_rep_header_line(line_num, icon, rank))
                line_num += 1

                for item in items:
                    lines.append(_format_rep_item_line(line_num, item))
                    line_num += 1
        else:
            # Column-aware layout
            # Render column 1
            line_num = 1
            for block_idx, block in enumerate(col1_blocks):
                rank = block['rank']
                items = block['items']

                if block_idx > 0:
                    line_num += 1

                lines.append(_format_rep_header_line(line_num, icon, rank))
                line_num += 1

                for item in items:
                    lines.append(_format_rep_item_line(line_num, item))
                    line_num += 1

            # Render column 2
            if col2_blocks:
                line_num = COLUMN_2_START
                for block_idx, block in enumerate(col2_blocks):
                    rank = block['rank']
                    items = block['items']

                    if block_idx > 0:
                        line_num += 1

                    lines.append(_format_rep_header_line(line_num, icon, rank))
                    line_num += 1

                    for item in items:
                        lines.append(_format_rep_item_line(line_num, item))
                        line_num += 1

        # Navigation
        if num_pages > 1:
            if page_idx < num_pages - 1:
                lines.append(f'    Next = "{section_base}{page_num + 1}";')
            if page_idx > 0:
                lines.append(f'    Prev = "{section_base}{page_num - 1}";')
        lines.append(f'    Back = "{back_menu}";')
        lines.append('\t};')

        lua_code = '\n'.join(lines)
        results.append({
            'section_name': section_name,
            'lua_code': lua_code,
            'page_num': page_num,
            'item_count': sum(len(b['items']) for b in page_blocks),
        })

        logger.info(f"  Generated {section_name}: {results[-1]['item_count']} items, "
                     f"ranks: {', '.join(REP_RANK_NAMES.get(b['rank'], '?') for b in page_blocks)}")

    return results
