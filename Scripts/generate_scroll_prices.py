"""
Generate SQL to set BuyPrice/SellPrice on Scroll of Enchant items
based on 90% of the vendor SellPrice of crafting reagents, rounded to nearest silver.

Also bumps Quality 1 (white) scrolls to Quality 2 (green).
"""
import subprocess
import json
import math

DB_CMD = ["python3", "-m", "cli.zep"]
CRAFT_DIR = "/workspace/project/Zeppelin-Craft"

def query_world(sql):
    result = subprocess.run(
        DB_CMD + ["world", "sql", "query", sql],
        capture_output=True, text=True, cwd=CRAFT_DIR
    )
    if result.returncode != 0:
        raise Exception(f"World query failed: {result.stderr}")
    rows = []
    lines = result.stdout.strip().split('\n')
    if len(lines) < 2:
        return rows
    headers = lines[0].split('\t')
    for line in lines[1:]:
        vals = line.split('\t')
        rows.append(dict(zip(headers, vals)))
    return rows

def query_dbc(sql):
    result = subprocess.run(
        DB_CMD + ["dbc", "info", "query", sql],
        capture_output=True, text=True, cwd=CRAFT_DIR
    )
    if result.returncode != 0:
        raise Exception(f"DBC query failed: {result.stderr}")
    rows = []
    lines = result.stdout.strip().split('\n')
    # Skip any non-data lines (like "Running query on dbc...")
    data_lines = [l for l in lines if '\t' in l]
    if len(data_lines) < 2:
        return rows
    headers = data_lines[0].split('\t')
    for line in data_lines[1:]:
        vals = line.split('\t')
        if len(vals) == len(headers):
            rows.append(dict(zip(headers, vals)))
    return rows

def round_to_silver(copper):
    """Round to nearest 100 copper (1 silver)."""
    return int(round(copper / 100.0)) * 100

def main():
    # 1. Get all scroll items
    print("Fetching scroll items...")
    scrolls = query_world(
        "SELECT entry, name, ItemLevel, Quality FROM item_template "
        "WHERE name LIKE 'Scroll of Enchant%' ORDER BY entry"
    )
    print(f"  Found {len(scrolls)} scrolls")

    # 2. Get all enchant spells that produce scroll items
    #    effect_item_type_1/2/3 links spell -> scroll item
    print("Fetching enchant spells from DBC...")
    reagent_cols = ', '.join([f'reagent_{i}' for i in range(1, 9)])
    count_cols = ', '.join([f'reagent_count_{i}' for i in range(1, 9)])
    spells = query_dbc(
        f"SELECT id, spell_name_enus, effect_item_type_1, effect_item_type_2, effect_item_type_3, "
        f"{reagent_cols}, {count_cols} "
        f"FROM spell WHERE spell_name_enus LIKE 'Enchant %' "
        f"AND (effect_item_type_1 > 0 OR effect_item_type_2 > 0 OR effect_item_type_3 > 0)"
    )
    print(f"  Found {len(spells)} enchant spells with item outputs")

    # 3. Build spell -> scroll item mapping
    spell_by_scroll = {}
    for spell in spells:
        for col in ['effect_item_type_1', 'effect_item_type_2', 'effect_item_type_3']:
            item_id = int(spell.get(col, '0'))
            if item_id > 0:
                spell_by_scroll[item_id] = spell

    # 4. Collect all reagent item IDs and fetch their vendor SellPrice
    all_reagent_ids = set()
    for spell in spells:
        for i in range(1, 9):
            rid = int(spell.get(f'reagent_{i}', '0'))
            if rid > 0:
                all_reagent_ids.add(rid)

    print(f"Fetching vendor prices for {len(all_reagent_ids)} reagent items...")
    id_list = ','.join(str(x) for x in sorted(all_reagent_ids))
    reagent_prices = {}
    if id_list:
        rows = query_world(
            f"SELECT entry, name, SellPrice, BuyPrice FROM item_template WHERE entry IN ({id_list})"
        )
        for row in rows:
            reagent_prices[int(row['entry'])] = {
                'name': row['name'],
                'sell': int(row['SellPrice']),
                'buy': int(row['BuyPrice'])
            }

    # Override zero-SellPrice reagents with derived values
    # Greater Planar Essence (22446): 3x Lesser Planar (10000) = 30000
    # Large Prismatic Shard (22449): 2x Small Prismatic (18000) = 36000
    # Greater Cosmic Essence (34055): BuyPrice/4 = 30000
    sell_overrides = {
        22446: 30000,  # Greater Planar Essence
        22449: 36000,  # Large Prismatic Shard
        34055: 30000,  # Greater Cosmic Essence
    }
    for item_id, override in sell_overrides.items():
        if item_id in reagent_prices and reagent_prices[item_id]['sell'] == 0:
            reagent_prices[item_id]['sell'] = override
            print(f"  Override: {reagent_prices[item_id]['name']} SellPrice -> {override}c")

    # 5. Calculate mat cost for each scroll and generate SQL
    output_lines = []
    output_lines.append("-- Auto-generated: Scroll of Enchant pricing based on 90% reagent vendor value")
    output_lines.append("-- Also bumps white (Quality 1) scrolls to green (Quality 2)")
    output_lines.append("")

    no_spell = []
    no_price = []
    zero_cost = []
    priced = []

    for scroll in scrolls:
        entry = int(scroll['entry'])
        name = scroll['name']
        quality = int(scroll['Quality'])

        spell = spell_by_scroll.get(entry)
        if not spell:
            no_spell.append(f"  {entry}: {name}")
            continue

        # Calculate total reagent vendor cost
        total_cost = 0
        reagent_details = []
        has_missing_price = False
        for i in range(1, 9):
            rid = int(spell.get(f'reagent_{i}', '0'))
            count = int(spell.get(f'reagent_count_{i}', '0'))
            if rid > 0 and count > 0:
                rinfo = reagent_prices.get(rid)
                if rinfo and rinfo['sell'] > 0:
                    cost = rinfo['sell'] * count
                    total_cost += cost
                    reagent_details.append(f"{rinfo['name']} x{count} = {cost}c")
                else:
                    rname = rinfo['name'] if rinfo else f'item:{rid}'
                    has_missing_price = True
                    reagent_details.append(f"{rname} x{count} = NO VENDOR PRICE")

        if has_missing_price:
            no_price.append(f"  {entry}: {name} (spell {spell['id']}) — {', '.join(reagent_details)}")

        if total_cost == 0:
            zero_cost.append(f"  {entry}: {name}")
            continue

        # 90% of mat cost, rounded to nearest silver
        sell_price = round_to_silver(total_cost * 0.9)
        buy_price = sell_price * 4
        if sell_price < 100:
            sell_price = 100  # minimum 1 silver
            buy_price = 400

        priced.append({
            'entry': entry,
            'name': name,
            'quality': quality,
            'mat_cost': total_cost,
            'sell_price': sell_price,
            'buy_price': buy_price,
            'details': reagent_details
        })

    # Generate SQL grouped by tier
    for item in sorted(priced, key=lambda x: x['entry']):
        detail_str = ', '.join(item['details'])
        output_lines.append(f"-- {item['name']}: mats={item['mat_cost']}c -> sell={item['sell_price']}c ({detail_str})")
        updates = [f"SellPrice = {item['sell_price']}", f"BuyPrice = {item['buy_price']}"]
        if item['quality'] == 1:
            updates.append("Quality = 2")
        output_lines.append(
            f"UPDATE `item_template` SET {', '.join(updates)} WHERE `entry` = {item['entry']};"
        )
        output_lines.append("")

    # Quality bump for any scrolls we couldn't price but are still white
    for entry_name in zero_cost + no_spell:
        # Extract entry number
        parts = entry_name.strip().split(':')
        eid = int(parts[0])
        matching = [s for s in scrolls if int(s['entry']) == eid and int(s['Quality']) == 1]
        if matching:
            output_lines.append(f"-- {entry_name.strip()} (no mat cost, quality bump only)")
            output_lines.append(f"UPDATE `item_template` SET Quality = 2 WHERE `entry` = {eid};")
            output_lines.append("")

    sql_text = '\n'.join(output_lines)

    # Write output
    outpath = "/workspace/project/Zeppelin-Craft/zpaks/ah-bot/sql/zz_enchant_scroll_prices.sql"
    with open(outpath, 'w') as f:
        f.write(sql_text + '\n')

    print(f"\nResults:")
    print(f"  Priced: {len(priced)} scrolls")
    if no_spell:
        print(f"  No matching spell found: {len(no_spell)}")
        for x in no_spell:
            print(x)
    if no_price:
        print(f"  Reagents with no vendor price: {len(no_price)}")
        for x in no_price:
            print(x)
    if zero_cost:
        print(f"  Zero total mat cost: {len(zero_cost)}")
        for x in zero_cost:
            print(x)

    print(f"\nSQL written to: {outpath}")

if __name__ == '__main__':
    main()
