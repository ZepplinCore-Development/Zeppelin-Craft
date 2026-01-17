# Starting Weapons Script Configuration

## Database Configuration

Database credentials are stored in `.env` file (not committed to git).

### Database Connections

**Three databases are used:**

1. **original_dbc** - Stock WOTLK reference (read-only)
   - Used for comparing custom design against vanilla
   - Used for stock weapon preference logic

2. **dbc** - Current/modified DBC database
   - Contains custom weapon skills and starting weapons
   - Used as validation target in default mode

3. **acore_world** - AzerothCore world database
   - Used for item_template lookups

### .env Configuration

```bash
# MySQL Connection
DB_HOST=192.168.0.55
DB_PORT=3306

# Original DBC (Stock WOTLK)
ORIGINAL_DBC_USER=spell-editor
ORIGINAL_DBC_PASS=HW8Y%L6&f0ePJO
ORIGINAL_DBC_NAME=original_dbc

# Current DBC (Modified)
DBC_USER=spell-editor
DBC_PASS=HW8Y%L6&f0ePJO
DBC_NAME=dbc

# AzerothCore World
ACORE_USER=acore
ACORE_PASS=acore
ACORE_NAME=acore_world

# Weapon Addition Configuration
ADD_DK_MELEE_WEAPONS=true

# Ranged Weapon Configuration
RANGED_ALLOWED_CLASSES=3,4
RANGED_ALLOWED_COMBOS=8:1
```

---

## Weapon Addition Configuration

### Death Knight Melee Weapons

**Setting:** `ADD_DK_MELEE_WEAPONS`

**Values:**
- `true` (default) - Add starting melee weapons to Death Knights
- `false` - Skip adding melee weapons to Death Knights (matches stock WOTLK)

**Stock WOTLK Behavior:**
Death Knights start with NO weapons in charstartoutfit. They receive their first weapon through the DK starting zone questline (specifically the "Runeforging" quest where they craft their first runeblade).

**Custom Behavior (ADD_DK_MELEE_WEAPONS=true):**
Death Knights start with a One-Handed Sword (Worn Shortsword, item 25) immediately, skipping the need to wait for the starting zone quest.

**Why this option exists:**
- Players may want immediate weapons for DKs (QoL improvement)
- Or may prefer authentic stock WOTLK behavior (no starting weapons)
- Toggle allows easy switching between behaviors

### Example Usage

**Match stock WOTLK exactly:**
```bash
# In .env file
ADD_DK_MELEE_WEAPONS=false
```

Run comparison:
```bash
python3 fix_starting_weapons.py --compare-to-stock
# Result: 0 differences from stock WOTLK
```

**Add DK starting weapons (custom):**
```bash
# In .env file
ADD_DK_MELEE_WEAPONS=true
```

Run comparison:
```bash
python3 fix_starting_weapons.py --compare-to-stock
# Result: 20 differences (10 DK races × 2 genders)
```

---

## Ranged Weapon Configuration

Ranged weapons are only added to specific classes/combinations.

**Configured in .env file:**

```bash
# Comma-separated list of class IDs
RANGED_ALLOWED_CLASSES=3,4  # Hunter (3), Rogue (4)

# Special race:class combinations (format: race:class,race:class)
RANGED_ALLOWED_COMBOS=8:1  # Troll (8) Warrior (1)
```

**Behavior:**
- Hunters: Always get ranged weapons (Bows/Guns/Crossbows based on race)
- Rogues: Always get Thrown weapons
- Troll Warriors: Get Thrown weapons (special case, matches stock WOTLK)
- All other classes: NO starting ranged weapons

**Stock WOTLK Alignment:**
- ✅ Hunters have ranged weapons
- ✅ Rogues have Thrown weapons
- ✅ Troll Warriors have Thrown weapons
- ✅ Other classes do NOT have starting ranged

**Default configuration matches stock WOTLK exactly.**

### Customizing Ranged Classes

Want all Warriors to have ranged weapons? Edit .env:

```bash
RANGED_ALLOWED_CLASSES=1,3,4  # Add Warrior (1)
```

Want to add another race/class combo:

```bash
RANGED_ALLOWED_COMBOS=8:1,5:2  # Troll Warrior + Undead Paladin
```

---

## Stock Weapon Preference

**Always enabled** (no toggle needed).

The validator prefers stock WOTLK weapons when:
1. Character has the skill in CSV
2. Stock WOTLK provides a weapon for that skill

**Example:**
- Stock WOTLK: Troll Warrior has Two-Handed Sword + Thrown
- CSV: Troll Warrior has Two-Handed Sword + Thrown skills
- Result: Keep BOTH stock weapons (no changes needed)

**Why this matters:**
- Minimizes changes from stock WOTLK
- Keeps character creation screen familiar
- Only changes weapons when CSV requires different skills

---

## Script Modes

### 1. Default Mode (Fix Current Database)

```bash
python3 fix_starting_weapons.py
```

- Validates current `dbc` database against CSV
- Generates `starting_weapons.sql` with fixes
- Applies stock weapon preference
- Respects ADD_DK_MELEE_WEAPONS configuration

### 2. Validation Only

```bash
python3 fix_starting_weapons.py --validate-only
```

- Shows issues without generating files
- Useful for checking if database matches CSV

### 3. Stock WOTLK Comparison

```bash
python3 fix_starting_weapons.py --compare-to-stock
```

- Compares CSV design against stock WOTLK
- Generates `csv_vs_stock_wotlk.log` (documentation only)
- Shows intentional custom design differences
- With `ADD_DK_MELEE_WEAPONS=false`: Shows 0 differences

---

## Testing Configuration Changes

**Test DK melee weapon toggle:**

```bash
# Enable DK weapons
echo "ADD_DK_MELEE_WEAPONS=true" >> .env
python3 fix_starting_weapons.py --compare-to-stock
# Expected: 20 differences (DKs get weapons)

# Disable DK weapons (match stock)
echo "ADD_DK_MELEE_WEAPONS=false" >> .env
python3 fix_starting_weapons.py --compare-to-stock
# Expected: 0 differences (perfect match to stock WOTLK)
```

---

## Summary

**Current Configuration Status:**
- ✅ Database credentials in .env (secure)
- ✅ Death Knight melee weapon toggle available
- ✅ Ranged weapon classes hardcoded (matches stock WOTLK)
- ✅ Stock weapon preference always enabled
- ✅ All configurations tested and working

**Default Behavior:**
- ADD_DK_MELEE_WEAPONS=true (custom QoL improvement)
- With this setting: 20 differences from stock WOTLK (DK starting weapons)
- Set to false for 100% stock WOTLK accuracy (0 differences)
