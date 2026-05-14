#!/usr/bin/env python3
"""
Reformat quest text in F-001 profession tool quest SQL files.
Removes **bold** material markers from QuestDescription and appends
a bullet-point list at the end instead.

Before: 'bring me **20 Light Leather and 5 Light Hide** to replenish...'
After:  'bring me some materials to replenish...$B$BRequired:$B- 20 Light Leather$B- 5 Light Hide'
"""

import re
import os
import sys

ZPAK_SQL_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                            '..', '..', 'zpaks', 'zep-legacy', 'sql')

QUEST_FILES = [
    'zz_[F-001]_skinning_knife_quests.sql',
    'zz_[F-001]_leathering_kit_quests.sql',
    'zz_[F-001]_mining_pick_quests.sql',
    'zz_[F-001]_pruning_shears_quests.sql',
    'zz_[F-001]_tailoring_scissors_quests.sql',
    'zz_[F-001]_alchemy_mortar_quests.sql',
]

def parse_material_list(bold_text):
    """Parse '20 Light Leather and 5 Light Hide' into individual items."""
    # Split on ' and ' to get individual items
    # Handle both "X Item and Y Item" and "X Item, Y Item" patterns
    items = re.split(r'\s+and\s+|,\s+', bold_text.strip())
    return [item.strip() for item in items if item.strip()]

def reformat_quest_description(line):
    """Process a QuestDescription line to replace **bold** with bullet list."""
    # Find the **...**  pattern
    match = re.search(r'\*\*([^*]+)\*\*', line)
    if not match:
        return line, False

    bold_content = match.group(1)
    items = parse_material_list(bold_content)

    if not items:
        return line, False

    # Build bullet list
    bullet_list = '$B$BRequired:' + ''.join(f'$B- {item}' for item in items)

    # Remove the **...**  from the text, replacing with generic phrase
    # We need to handle various surrounding contexts
    before = line[:match.start()]
    after = line[match.end():]

    # Clean up: replace ** markers, keep the inline text but simpler
    # Just remove the ** markers from the inline text
    cleaned_line = before + bold_content + after

    # Now find where the QuestDescription value ends (before the closing quote)
    # The bullet list needs to go at the end of the quest description string
    # Find the last ', or just before the closing quote of QuestDescription

    # The line format is: `QuestDescription` = 'text here',
    # We need to insert the bullet list before the final '
    # Find the last occurrence of ', (end of string value)
    # Actually, we need to be more careful. Let's find the position of the
    # closing quote for the QuestDescription value.

    # Strategy: find the `QuestDescription` assignment, then work with the value
    desc_match = re.search(r"(`QuestDescription`\s*=\s*')(.*?)(',)", cleaned_line, re.DOTALL)
    if desc_match:
        prefix = cleaned_line[:desc_match.start(2)]
        desc_text = desc_match.group(2)
        suffix = cleaned_line[desc_match.end(2):]

        # Remove the **content** from desc_text (it was already removed above,
        # but let's also strip any double spaces that might result)
        desc_text = re.sub(r'  +', ' ', desc_text)

        # Remove trailing punctuation, then add period + bullet list
        desc_text = desc_text.rstrip('.!? ')
        new_desc = desc_text + '.' + bullet_list
        return prefix + new_desc + suffix, True

    return cleaned_line, False

def process_file(filepath):
    """Process a single quest SQL file."""
    with open(filepath, 'r') as f:
        content = f.read()

    lines = content.split('\n')
    modified_count = 0
    new_lines = []

    for line in lines:
        if '`QuestDescription`' in line and '**' in line:
            new_line, changed = reformat_quest_description(line)
            if changed:
                modified_count += 1
            new_lines.append(new_line)
        else:
            new_lines.append(line)

    if modified_count > 0:
        with open(filepath, 'w') as f:
            f.write('\n'.join(new_lines))

    return modified_count

def main():
    total = 0
    for filename in QUEST_FILES:
        filepath = os.path.join(ZPAK_SQL_DIR, filename)
        if not os.path.exists(filepath):
            print(f"  SKIP {filename} (not found)")
            continue
        count = process_file(filepath)
        total += count
        print(f"  {filename}: {count} quests reformatted")

    print(f"\nTotal: {total} quest descriptions reformatted")

if __name__ == '__main__':
    main()
