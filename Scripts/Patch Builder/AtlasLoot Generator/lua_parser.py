"""
Lua Parser Module for AtlasLoot Files
Extracts boss names and identifies sections in AtlasLoot Lua files
"""

import re
from typing import List, Tuple, Optional


class AtlasLootParser:
    """Parser for AtlasLoot Lua addon files."""

    def __init__(self, lua_file_path: str):
        """
        Initialize parser with Lua file path.

        Args:
            lua_file_path: Full path to AtlasLoot Lua file
        """
        self.lua_file_path = lua_file_path
        self.content = []
        self.load_file()

    def load_file(self):
        """Load Lua file content into memory."""
        try:
            with open(self.lua_file_path, 'r', encoding='utf-8') as f:
                self.content = f.readlines()
        except FileNotFoundError:
            print(f"Error: File not found: {self.lua_file_path}")
            self.content = []
        except Exception as e:
            print(f"Error reading file: {e}")
            self.content = []

    def find_section_bounds(self, section_name: str) -> Optional[Tuple[int, int]]:
        """
        Find start and end line numbers for an AtlasLoot section.

        Args:
            section_name: Section name (e.g., "TheStockade")

        Returns:
            Tuple of (start_line, end_line) or None if not found
            Line numbers are 0-indexed
        """
        if not self.content:
            return None

        # Look for: AtlasLoot_Data["SectionName"] = {
        section_pattern = rf'AtlasLoot_Data\["{section_name}"\]\s*=\s*{{'
        start_line = None
        end_line = None

        for i, line in enumerate(self.content):
            if re.search(section_pattern, line):
                start_line = i
                # Find matching closing brace
                for j in range(i + 1, len(self.content)):
                    # Look for "};" at the end of the table
                    if re.match(r'\s*};\s*$', self.content[j]):
                        end_line = j
                        break
                break

        if start_line is not None and end_line is not None:
            return (start_line, end_line)
        else:
            print(f"Warning: Section '{section_name}' not found in Lua file")
            return None

    def extract_boss_names(self, section_name: str) -> List[str]:
        """
        Extract all boss names from BabbleBoss entries in a section.

        Args:
            section_name: Section name (e.g., "TheStockade")

        Returns:
            List of boss names in order they appear
        """
        bounds = self.find_section_bounds(section_name)
        if not bounds:
            return []

        start_line, end_line = bounds
        boss_names = []

        # Pattern to match: BabbleBoss["Boss Name"]
        boss_pattern = r'BabbleBoss\["([^"]+)"\]'

        for i in range(start_line, end_line + 1):
            match = re.search(boss_pattern, self.content[i])
            if match:
                boss_name = match.group(1)
                # Exclude special entries like #n11# (loot drops from trash)
                if not boss_name.startswith('#'):
                    boss_names.append(boss_name)

        return boss_names

    def get_section_content(self, section_name: str) -> str:
        """
        Get the complete content of a section.

        Args:
            section_name: Section name (e.g., "TheStockade")

        Returns:
            String containing the section content
        """
        bounds = self.find_section_bounds(section_name)
        if not bounds:
            return ""

        start_line, end_line = bounds
        return ''.join(self.content[start_line:end_line + 1])

    def replace_section(self, section_name: str, new_content: str) -> bool:
        """
        Replace a section's content with new Lua code.

        Args:
            section_name: Section name (e.g., "TheStockade")
            new_content: New Lua code for the section (including header and footer)

        Returns:
            True if replacement was successful, False otherwise
        """
        bounds = self.find_section_bounds(section_name)
        if not bounds:
            return False

        start_line, end_line = bounds

        # Ensure new_content ends with newline
        if not new_content.endswith('\n'):
            new_content += '\n'

        # Replace the section
        self.content[start_line:end_line + 1] = [new_content]

        return True

    def save_file(self, backup=True) -> bool:
        """
        Save modified content back to the Lua file.

        Args:
            backup: If True, create a .bak backup before saving

        Returns:
            True if save was successful, False otherwise
        """
        if not self.content:
            print("Error: No content to save")
            return False

        try:
            # Create backup if requested (disabled by default - use git for versioning)
            if backup:
                backup_path = self.lua_file_path + '.bak'
                with open(self.lua_file_path, 'r', encoding='utf-8') as f:
                    backup_content = f.read()
                with open(backup_path, 'w', encoding='utf-8') as f:
                    f.write(backup_content)

            # Write modified content (silently - caller handles success message)
            with open(self.lua_file_path, 'w', encoding='utf-8') as f:
                f.writelines(self.content)
            return True

        except Exception as e:
            print(f"Error saving file: {e}")
            return False

    def get_all_sections(self) -> List[str]:
        """
        Get list of all AtlasLoot_Data section names in the file.

        Returns:
            List of section names
        """
        if not self.content:
            return []

        section_pattern = r'AtlasLoot_Data\["([^"]+)"\]\s*=\s*{'
        sections = []

        for line in self.content:
            match = re.search(section_pattern, line)
            if match:
                sections.append(match.group(1))

        return sections

    def insert_section_after(self, reference_section: str, new_section_name: str,
                             new_content: str) -> bool:
        """
        Insert a new section after an existing reference section.

        Args:
            reference_section: Name of existing section to insert after
            new_section_name: Name for the new section
            new_content: Lua code for the new section (content only, header/footer added)

        Returns:
            True if insertion was successful, False otherwise
        """
        bounds = self.find_section_bounds(reference_section)
        if not bounds:
            print(f"Error: Reference section '{reference_section}' not found")
            return False

        _, end_line = bounds

        # Build the new section with proper formatting
        section_code = f'AtlasLoot_Data["{new_section_name}"] = {{\n'
        section_code += new_content
        if not section_code.endswith('\n'):
            section_code += '\n'
        section_code += '};\n\n'

        # Insert after the reference section (after end_line + 1 to preserve blank lines)
        insert_pos = end_line + 1

        # Skip any blank lines after the section
        while insert_pos < len(self.content) and self.content[insert_pos].strip() == '':
            insert_pos += 1

        self.content.insert(insert_pos, section_code)
        print(f"[OK] Created new section '{new_section_name}' after '{reference_section}'")
        return True

    def section_exists(self, section_name: str) -> bool:
        """
        Check if a section exists in the Lua file.

        Args:
            section_name: Section name to check

        Returns:
            True if section exists, False otherwise
        """
        return self.find_section_bounds(section_name) is not None


def test_parser():
    """Test the parser on the AtlasLoot originalwow.lua file."""
    lua_file = "/workspace/project/Zeppelin-Craft/MPQ Staging/Patch-Z/Interface/AddOns/AtlasLoot_OriginalWoW/originalwow.lua"

    parser = AtlasLootParser(lua_file)

    print("Testing AtlasLoot Parser\n")

    # Test 1: Find TheStockade section
    bounds = parser.find_section_bounds("TheStockade")
    if bounds:
        print(f"[OK] Found TheStockade section: lines {bounds[0]}-{bounds[1]}")
    else:
        print("[ERROR] TheStockade section not found")

    # Test 2: Extract boss names
    boss_names = parser.extract_boss_names("TheStockade")
    print(f"\n[OK] Found {len(boss_names)} bosses in TheStockade:")
    for boss in boss_names:
        print(f"  - {boss}")

    # Test 3: Get section content preview
    content = parser.get_section_content("TheStockade")
    if content:
        print(f"\n[OK] Section content length: {len(content)} characters")
        print(f"First line: {content.split(chr(10))[0]}")

    # Test 4: List all sections
    all_sections = parser.get_all_sections()
    print(f"\n[OK] Total sections in file: {len(all_sections)}")
    print(f"First 10 sections: {', '.join(all_sections[:10])}")


if __name__ == "__main__":
    test_parser()
