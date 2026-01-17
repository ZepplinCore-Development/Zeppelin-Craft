#!/usr/bin/env python3
"""
Open Azeroth Resource Parser
Extracts custom assets needed for Open Azeroth patches by filtering out stock WotLK assets.

Usage:
    python3 resource_parser.py [--config /path/to/config.conf]

Configuration:
    Edit config.conf to set all paths and options
"""

import os
import sys
import shutil
import configparser
from pathlib import Path
from datetime import datetime
from typing import Set, Dict, List, Tuple


class ResourceParser:
    """Main parser orchestrator"""

    def __init__(self, config_path: Path = None):
        # Load configuration
        if config_path is None:
            config_path = Path(__file__).parent / 'config.conf'

        if not config_path.exists():
            raise FileNotFoundError(f"Config file not found: {config_path}")

        self.config = self._load_conf(config_path)

        # Initialize paths with fallback support
        self.paths = self._resolve_paths_with_fallback(self.config['paths'])
        self.options = self.config.get('options', {})

        # Log buffer (must be initialized first)
        self.log_lines = []

        # Initialize tracking
        self.adt_models = {}  # {adt_path: set(models)}
        self.adt_area_ids = {}  # {adt_path: set(area_ids)} - from MCNK chunks
        self.adt_wmos = set()  # WMO files referenced by ADTs (global set for extraction)
        self.adt_wmos_dict = {}  # {adt_path: set(wmos)} - WMOs per ADT for reporting
        self.adt_parsers = {}  # {adt_path: ADTParser} - Keep parsers for duplicate WMO detection
        self.adt_textures = set()  # BLP terrain textures referenced by ADTs (from MTEX chunks)
        self.wmo_doodads = set()  # M2 doodads referenced by WMOs
        self.wmo_textures = set()  # BLP textures referenced by WMOs (from MOTX chunks)
        self.ground_effect_models = set()  # All M2 models from GroundEffectDoodad.dbc
        self.ground_effect_models_needed = set()  # M2 models for VALID ground effects only
        self.adt_ground_effect_ids = set()  # Ground effect IDs from ADT MCLY chunks
        self.ground_effect_to_adts = {}  # {effect_id: [adt_paths]} - Map effect IDs back to ADTs
        self.ground_effect_id_to_models = {}  # {effect_id: [models]} - Map effect IDs to their M2 models
        self.missing_ground_effect_ids = set()  # IDs not in GroundEffectTexture.dbc
        self.bad_ground_effect_ids = set()  # IDs not in modern client either (bad ADT data)
        self.modern_ground_effect_ids = set()  # IDs in modern client but not WotLK (modern content)
        self.all_dependencies = set()
        self.stock_assets = set()
        self.required_custom = set()
        self.already_exported = set()
        self.found_assets = {}  # {normalized_path: source_path}
        self.extracted = []

        # Track cumulative asset counts for final summary
        self.total_m2_required = 0
        self.total_wmo_required = 0
        self.total_texture_required = 0
        self.total_stock_assets = 0  # Cumulative stock assets across all phases
        self.missing_by_area = {}  # {area_name: set(missing_models)}
        self.duplicate_wmos = {}  # {adt_path: [(entry1, entry2, distance, wmo_name)]}
        self.fixed_adts = {}  # {adt_path: fix_result_dict}

        # Area name resolution (for zone-based reporting)
        self.area_table_reader = None  # Will be set by _load_area_names
        self.area_names = self._load_area_names()

        # Parent chain tracking (for debugging missing assets)
        self.asset_parents = {}  # {asset_normalized_path: parent_normalized_path}
        self.parent_types = {}  # {asset_normalized_path: "ADT"|"WMO"|"M2"|"GroundEffect"|"TerrainTexture"|"Area"}
        self.parent_chains = {}  # {asset_normalized_path: [adt, wmo, m2, blp] chain} - cached chains
        self.adt_to_area = {}  # {adt_normalized_path: area_name} - Map ADTs to their area names
        self.exported_to_original = {}  # {export_relative_path: original_required_path} - Map exported files back to original references

        # Folder contents cache (for fast related asset lookups)
        self.folder_cache = {}  # {folder_path: {filename_upper: Path}} - Indexed by folder

    def _load_conf(self, config_path: Path) -> dict:
        """Load configuration from .conf file (INI format)"""
        parser = configparser.ConfigParser()
        parser.read(config_path)

        config = {
            'paths': {},
            'options': {}
        }

        # Load paths section
        if 'paths' in parser:
            config['paths'] = dict(parser['paths'])

        # Load options section with type conversion
        if 'options' in parser:
            for key, value in parser['options'].items():
                # Convert boolean strings
                if value.lower() in ('true', 'yes', '1'):
                    config['options'][key] = True
                elif value.lower() in ('false', 'no', '0'):
                    config['options'][key] = False
                # Convert numeric strings
                elif value.replace('.', '', 1).isdigit():
                    if '.' in value:
                        config['options'][key] = float(value)
                    else:
                        config['options'][key] = int(value)
                else:
                    config['options'][key] = value

        return config

    def _resolve_paths_with_fallback(self, paths_config: dict) -> dict:
        """
        Resolve paths with fallback support.

        For each path key, checks if primary path exists. If not, tries the
        corresponding _secondary path. This allows cross-platform configs.

        Args:
            paths_config: Dictionary of path configurations

        Returns:
            Dictionary mapping path keys to resolved Path objects
        """
        resolved_paths = {}

        # Find all primary path keys (those without _secondary suffix)
        primary_keys = {k for k in paths_config.keys() if not k.endswith('_secondary')}

        for key in primary_keys:
            primary_path = Path(paths_config[key])
            secondary_key = f"{key}_secondary"

            # Try primary first
            if primary_path.exists():
                resolved_paths[key] = primary_path
            # Fall back to secondary if available
            elif secondary_key in paths_config:
                secondary_path = Path(paths_config[secondary_key])
                if secondary_path.exists():
                    resolved_paths[key] = secondary_path
                else:
                    # Neither exists, use primary (will fail later with clear error)
                    resolved_paths[key] = primary_path
            else:
                # No secondary available, use primary
                resolved_paths[key] = primary_path

        return resolved_paths

    @staticmethod
    def normalize_path(path: str) -> str:
        """
        Normalize WoW asset paths for consistent matching.

        - Replaces backslashes with forward slashes
        - Removes consecutive duplicate slashes (// -> /)
        - Preserves path case (WoW is case-insensitive on Windows)

        Args:
            path: Raw path string from ADT/WMO/M2 files

        Returns:
            Normalized path string
        """
        if not path:
            return path

        # Step 1: Replace backslashes with forward slashes
        normalized = path.replace('\\', '/')

        # Step 2: Remove consecutive duplicate slashes
        while '//' in normalized:
            normalized = normalized.replace('//', '/')

        # Step 3: Strip leading/trailing slashes (optional, helps with matching)
        normalized = normalized.strip('/')

        return normalized

    def log(self, message: str):
        """Add message to log buffer and optionally print"""
        self.log_lines.append(message)
        if self.options.get('verbose', True):
            print(message)

    def _load_area_names(self) -> Dict[int, str]:
        """Load area ID to name mapping from AreaTable.dbc"""
        from parsers.dbc_binary_reader import AreaTableReader

        area_id_to_name = {}

        try:
            area_dbc_path = self.paths.get('area_table_dbc')
            if area_dbc_path and Path(area_dbc_path).exists():
                area_table = AreaTableReader(str(area_dbc_path))
            else:
                # Use default path if not specified
                area_table = AreaTableReader()  # Uses default path

            # Store the reader for parent lookups
            self.area_table_reader = area_table

            # Extract area names from the parsed data
            for area_id, info in area_table.areas.items():
                area_id_to_name[area_id] = info['name']

            self.log(f'  Loaded {len(area_id_to_name)} areas from AreaTable.dbc')
            return area_id_to_name
        except Exception as e:
            self.log(f'  Warning: Could not load AreaTable.dbc: {e}')
            self.area_table_reader = None
            return {}

    def _get_area_name(self, adt_filename: str) -> str:
        """
        Extract area name from ADT filename using multiple methods:
        1. MCNK area IDs (from ADT file) → AreaTable.dbc (works for WotLK zones)
        2. Fallback to map name + coordinates

        Note: Modern zones like Lost Isles don't exist in WotLK AreaTable.dbc,
        so they will display as "kalimdor [54,28]" format.
        """
        from parsers.adt_coordinates import adt_to_world_coords

        # Format: MapName_X_Y.adt
        try:
            basename = Path(adt_filename).stem
            parts = basename.split('_')

            if len(parts) >= 3:
                map_name = parts[0]  # e.g., "azeroth", "kalimdor", "northrend"
                x = int(parts[1])
                y = int(parts[2])

                # METHOD 1: Try MCNK area IDs (most accurate if present)
                # Walk up parent chain to get top-level zone
                area_ids = self.adt_area_ids.get(adt_filename, set())
                if area_ids and self.area_table_reader:
                    # Get parent zones for all area IDs found
                    parent_zones = set()

                    for area_id in area_ids:
                        # Walk up parent chain to find top-level zone
                        area = self.area_table_reader.get_area(area_id)

                        if not area:
                            continue

                        # Walk up parent chain until parent = 0
                        while area['parent'] != 0:
                            parent = self.area_table_reader.get_area(area['parent'])
                            if not parent:
                                break
                            area = parent

                        # area now contains the top-level zone
                        if area and area['name']:
                            parent_zones.add(area['name'])

                    if parent_zones:
                        # Filter out low-priority areas (oceans, seas)
                        low_priority_areas = {
                            'The Great Sea', 'Veiled Sea', 'The Forbidding Sea',
                            'The North Sea', 'Frozen Sea', 'The Veiled Sea',
                            'UNUSED', 'REUSE', 'Test', 'QA', 'PVP'
                        }

                        # Filter parent zones
                        high_priority = [z for z in parent_zones if z not in low_priority_areas]

                        if high_priority:
                            # Use longest high-priority name (most specific)
                            area_name = sorted(high_priority, key=len, reverse=True)[0]
                        else:
                            # Only low-priority zones available, use longest
                            area_name = sorted(parent_zones, key=len, reverse=True)[0]

                        return area_name

                # METHOD 2: Fallback to map name + coordinates
                return f"{map_name} [{x},{y}]"

            return basename
        except Exception as e:
            return f"{adt_filename} (Error: {e})"

    def get_parent_chain(self, asset: str) -> list:
        """
        Build full parent chain from asset back to root ADT.

        Walks up the parent hierarchy to build a chain from root to asset.
        Chains are cached for performance.

        Args:
            asset: Normalized asset path

        Returns:
            List from root to asset: [adt_path, wmo_path, m2_path, blp_path]
            If asset has no parents, returns [asset]
        """
        # Return cached chain if available
        if asset in self.parent_chains:
            return self.parent_chains[asset]

        # Build chain by walking up parents
        chain = []
        current = asset
        visited = set()  # Prevent infinite loops

        # Walk up parent chain
        while current in self.asset_parents and current not in visited:
            chain.append(current)
            visited.add(current)
            current = self.asset_parents[current]

        # Add root (ADT, GroundEffect, or orphan asset)
        chain.append(current)

        # Reverse to get root → asset order
        chain = list(reversed(chain))

        # Cache result
        self.parent_chains[asset] = chain

        return chain

    def format_parent_chain(self, asset: str) -> str:
        """
        Format parent chain as human-readable string.

        Args:
            asset: Normalized asset path

        Returns:
            Formatted string like: "Area: Lost Isles → ADT: lostisles_28_36.adt → M2: goblin.m2"
        """
        chain = self.get_parent_chain(asset)

        formatted_parts = []
        for item in chain:
            # Get parent type for this item
            parent_type = self.parent_types.get(item, "Unknown")

            # Format filename only (not full path) for readability
            item_filename = item.split('/')[-1] if '/' in item else item

            # Special handling for Area_XXX format
            if item.startswith("Area_"):
                area_name = item.replace("Area_", "")
                formatted_parts.append(f"Area: {area_name}")
            # Special handling for GroundEffect_XXX format
            elif item.startswith("GroundEffect_"):
                effect_id = item.replace("GroundEffect_", "")
                formatted_parts.append(f"GroundEffect: ID_{effect_id}")
            else:
                formatted_parts.append(f"{parent_type}: {item_filename}")

        return " → ".join(formatted_parts)

    def parse_adts(self):
        """Parse ADT files for model dependencies, ground effect IDs, and terrain textures"""
        from parsers.adt_parser import ADTParser
        from parsers.adt_texture_parser import ADTTextureParser

        self.log('\n' + '='*80)
        self.log('STEP 1: Parsing ADT files for model, texture, and ground effect dependencies')
        self.log('='*80)

        adt_dir = self.paths['adt']
        self.log(f'\nADT Directory: {adt_dir}')

        adt_files = list(adt_dir.rglob("*.adt"))
        self.log(f'Found {len(adt_files)} ADT files to parse...')

        total_models = set()

        for adt_file in adt_files:
            parser = ADTParser(adt_file)
            models = parser.parse()

            # Store models per ADT
            self.adt_models[str(adt_file)] = models
            total_models.update(models)

            # Track parent relationships: Area → ADT → Assets
            adt_normalized = self.normalize_path(str(adt_file))

            # Store area IDs per ADT BEFORE calling _get_area_name (from MCNK chunk headers)
            # Use adt_normalized as key for consistency with ground_effect_to_adts
            if parser.area_ids:
                self.adt_area_ids[adt_normalized] = parser.area_ids

            # Get area name for this ADT
            area_name = self._get_area_name(adt_normalized)

            # Create area parent key and link ADT to Area
            area_parent_key = f"Area_{area_name}"
            self.asset_parents[adt_normalized] = area_parent_key
            self.parent_types[adt_normalized] = "ADT"
            self.parent_types[area_parent_key] = "Area"
            self.adt_to_area[adt_normalized] = area_name

            # Track M2 models → ADT
            for model in models:
                model_normalized = self.normalize_path(model).upper()
                self.asset_parents[model_normalized] = adt_normalized
                self.parent_types[model_normalized] = "M2"

            # Store parser for duplicate WMO detection (if enabled)
            if self.options.get('detect_duplicate_wmos', False):
                self.adt_parsers[str(adt_file)] = parser

            # Collect WMO references from ADTs
            # Track parent relationships: WMO files → ADT
            if parser.wmos:
                self.adt_wmos.update(parser.wmos)
                self.adt_wmos_dict[str(adt_file)] = parser.wmos
                for wmo in parser.wmos:
                    wmo_normalized = self.normalize_path(wmo).upper()
                    self.asset_parents[wmo_normalized] = adt_normalized
                    self.parent_types[wmo_normalized] = "WMO"

            # Parse terrain textures from ADT (MTEX chunks)
            # Track parent relationships: BLP textures → ADT (terrain)
            texture_parser = ADTTextureParser(adt_file)
            terrain_textures = texture_parser.parse()
            if terrain_textures:
                self.adt_textures.update(terrain_textures)
                for texture in terrain_textures:
                    texture_normalized = self.normalize_path(texture).upper()
                    self.asset_parents[texture_normalized] = adt_normalized
                    self.parent_types[texture_normalized] = "TerrainTexture"

            # Single-line logging
            if parser.ground_effect_ids:
                self.adt_ground_effect_ids.update(parser.ground_effect_ids)
                # Track which ADTs use which ground effect IDs
                for effect_id in parser.ground_effect_ids:
                    if effect_id not in self.ground_effect_to_adts:
                        self.ground_effect_to_adts[effect_id] = []
                    self.ground_effect_to_adts[effect_id].append(adt_normalized)
                self.log(f'  {adt_file.name} -> {area_name} -> {len(models)} models, {len(parser.wmos)} WMOs, {len(terrain_textures)} textures, {len(parser.ground_effect_ids)} ground effects')
            elif models or parser.wmos or terrain_textures:
                self.log(f'  {adt_file.name} -> {area_name} -> {len(models)} models, {len(parser.wmos)} WMOs, {len(terrain_textures)} textures')

        # Store for later reference in Step 7 summary
        self.adt_m2_models = total_models

        self.log(f'\n  ADT files parsed: {len(self.adt_models)}')
        self.log(f'  Unique M2 models from ADTs: {len(total_models):,}')
        self.log(f'  Unique WMO files from ADTs: {len(self.adt_wmos):,}')
        self.log(f'  Unique terrain textures from ADTs: {len(self.adt_textures):,}')
        self.log(f'  Ground effect IDs from ADTs: {len(self.adt_ground_effect_ids)}')

    def detect_duplicate_wmos(self):
        """Detect duplicate WMO placements in ADT files"""
        if not self.options.get('detect_duplicate_wmos', False):
            return

        self.log('\n' + '='*80)
        self.log('DUPLICATE WMO DETECTION')
        self.log('='*80)

        threshold = self.options.get('duplicate_wmo_threshold', 1.0)
        self.log(f'\nDetecting duplicate WMO placements (threshold: {threshold} game units)...')

        total_duplicates = 0
        affected_adts = 0

        for adt_path, parser in self.adt_parsers.items():
            if not parser.wmo_placements:
                continue

            duplicates = parser.find_duplicate_wmos(threshold)

            if duplicates:
                # Augment with WMO filenames
                duplicates_with_names = []
                for entry1, entry2, distance in duplicates:
                    wmo_name = "Unknown"
                    if entry1.wmo_id < len(parser.wmo_list):
                        wmo_name = parser.wmo_list[entry1.wmo_id]
                    duplicates_with_names.append((entry1, entry2, distance, wmo_name))

                self.duplicate_wmos[adt_path] = duplicates_with_names
                total_duplicates += len(duplicates)
                affected_adts += 1

                adt_name = Path(adt_path).name
                self.log(f'  [{len(duplicates)} duplicates] {adt_name}')

        if total_duplicates > 0:
            self.log(f'\n  ⚠️  FOUND {total_duplicates} duplicate WMO placement pairs across {affected_adts} ADT files')
            self.log(f'  These duplicates may cause glitching, collision issues, or rendering problems.')

            # Check if fixing is enabled
            if self.options.get('fix_duplicate_wmos', False):
                self.log(f'\n  🔧 Fixing enabled - will export deduplicated ADTs to export directory')
                self.fix_duplicate_wmos()
            else:
                self.log(f'  See duplicate_wmos_TIMESTAMP.txt in log output for details.')
                self.log(f'  Enable "fix_duplicate_wmos" in config to automatically fix and export.')
        else:
            self.log(f'\n  ✓ No duplicate WMO placements detected')

    def fix_duplicate_wmos(self):
        """Fix detected duplicate WMOs and export corrected ADTs"""
        from parsers.adt_modf_editor import fix_adt_duplicates

        if not self.duplicate_wmos:
            return

        self.log('\n' + '='*80)
        self.log('FIXING DUPLICATE WMO PLACEMENTS')
        self.log('='*80)

        export_base = self.paths['export'] / 'WORLD' / 'maps'
        total_fixed = 0
        total_removed = 0

        for adt_path, duplicates in self.duplicate_wmos.items():
            adt_file = Path(adt_path)
            adt_name = adt_file.name

            # Get parser for WMO list
            parser = self.adt_parsers.get(adt_path)
            if not parser:
                self.log(f'  ⚠️  Skipping {adt_name} - no parser available')
                continue

            # Determine export path (preserve map subdirectory structure)
            # e.g., /maps/kalimdor/file.adt -> export/WORLD/maps/kalimdor/file.adt
            try:
                # Find "maps" in path and preserve structure after it
                path_parts = adt_file.parts
                maps_idx = path_parts.index('maps')
                relative_parts = path_parts[maps_idx+1:]  # Everything after 'maps/'
                export_path = export_base.joinpath(*relative_parts)
            except (ValueError, IndexError):
                # Fallback: just use filename
                export_path = export_base / adt_name

            self.log(f'\n  Fixing: {adt_name}')
            self.log(f'    Duplicates: {len(duplicates)} pairs')

            # Fix and export
            result = fix_adt_duplicates(
                adt_path=adt_file,
                export_path=export_path,
                duplicates=duplicates,
                wmo_list=parser.wmo_list
            )

            if result['success']:
                self.fixed_adts[adt_path] = result
                total_fixed += 1
                total_removed += result['removed_count']

                self.log(f'    Original WMO placements: {result["original_count"]}')
                self.log(f'    Duplicates removed: {result["removed_count"]}')
                self.log(f'    Final WMO placements: {result["deduplicated_count"]}')
                self.log(f'    ✓ Exported to: {export_path.relative_to(self.paths["export"])}')
            else:
                self.log(f'    ✗ Failed: {result["message"]}')

        self.log('\n  ' + '='*80)
        self.log('  FIXING COMPLETE')
        self.log('  ' + '='*80)
        self.log(f'  ADTs fixed: {total_fixed}')
        self.log(f'  Total WMO duplicates removed: {total_removed}')
        self.log(f'  Export location: {export_base}')
        self.log(f'\n  ✓ Fixed ADTs ready to package into custom patch MPQ')

    def _load_modern_ground_effect_ids(self) -> set:
        """Load ground effect IDs from modern client CSV (modern expansion content)"""
        modern_csv = self.paths.get('modern_groundeffect_csv')

        if not modern_csv or not Path(modern_csv).exists():
            # Try default location
            default_path = Path('/workspace/project/Zeppelin-Tools/Open Azeroth/GroundEffectTexture.12.0.1.64914.csv')
            if default_path.exists():
                modern_csv = default_path
            else:
                return set()

        modern_ids = set()
        try:
            with open(modern_csv, 'r') as f:
                next(f)  # Skip header
                for line in f:
                    if line.strip():
                        parts = line.split(',')
                        if parts and parts[0].isdigit():
                            modern_ids.add(int(parts[0]))

            self.log(f'  Loaded {len(modern_ids)} ground effect IDs from modern client (for validation)')
            return modern_ids
        except Exception as e:
            self.log(f'  Warning: Could not load modern client ground effect CSV: {e}')
            return set()

    def parse_ground_effects(self):
        """Parse GroundEffectDoodad.dbc and validate against ADT ground effect IDs"""
        from parsers.groundeffect_parser import GroundEffectTextureReader, GroundEffectDoodadReader

        self.log('\n' + '='*80)
        self.log('STEP 6: Parsing GroundEffect DBCs and validating ADT references')
        self.log('='*80)

        # Use DBC paths from config if available
        doodad_dbc = self.paths.get('groundeffect_doodad_dbc')
        texture_dbc = self.paths.get('groundeffect_texture_dbc')

        # Parse ground effect DBCs
        texture_reader = GroundEffectTextureReader(
            str(texture_dbc) if texture_dbc else None
        )
        doodad_reader = GroundEffectDoodadReader(
            str(doodad_dbc) if doodad_dbc else None
        )

        self.ground_effect_models = doodad_reader.get_all_models()

        # Build mapping: effect_id → models
        # We need to get the models for each texture ID that was found in ADTs
        for effect_id in self.adt_ground_effect_ids:
            if effect_id in texture_reader.textures:
                texture_info = texture_reader.textures[effect_id]
                doodad_ids = texture_info['doodads']
                models_for_this_effect = []

                for doodad_id in doodad_ids:
                    if doodad_id in doodad_reader.doodads:
                        doodad_info = doodad_reader.doodads[doodad_id]
                        if doodad_info and 'filename' in doodad_info:
                            model = doodad_info['filename']
                            if model:
                                models_for_this_effect.append(model)

                if models_for_this_effect:
                    self.ground_effect_id_to_models[effect_id] = models_for_this_effect

        # Track parent relationships: Ground effect models → effect_id → ADT
        # For each effect ID used by ADTs
        for effect_id, adt_list in self.ground_effect_to_adts.items():
            # Get models for this effect ID
            if effect_id in self.ground_effect_id_to_models:
                models = self.ground_effect_id_to_models[effect_id]

                # Create a virtual parent for this effect ID
                effect_parent_key = f"GroundEffect_{effect_id}"

                # Link effect to its ADTs (use first ADT if multiple)
                if adt_list:
                    self.asset_parents[effect_parent_key] = adt_list[0]
                    self.parent_types[effect_parent_key] = "GroundEffect"

                # Link models to this effect
                for model in models:
                    model_normalized = self.normalize_path(model).upper()
                    # Only set parent if not already set by ADT direct reference
                    if model_normalized not in self.asset_parents:
                        self.asset_parents[model_normalized] = effect_parent_key
                        self.parent_types[model_normalized] = "M2"

        # Load modern client IDs for comparison
        modern_ids = self._load_modern_ground_effect_ids()

        # Validate ADT ground effect IDs against DBC
        if self.adt_ground_effect_ids:
            self.log(f'\n  ADT files reference {len(self.adt_ground_effect_ids)} ground effect IDs')
            self.log(f'  Validating against GroundEffectTexture.dbc...')

            valid_ids = []
            junk_ids = set()  # IDs not in WotLK DBC or modern client (legacy Blizzard ADT data)
            modern_only_ids = set()  # IDs in modern client but not WotLK (genuinely new content)

            for effect_id in sorted(self.adt_ground_effect_ids):
                if effect_id not in texture_reader.textures:
                    self.missing_ground_effect_ids.add(effect_id)

                    # Categorize missing IDs (only if modern reference available)
                    if modern_ids:
                        if effect_id not in modern_ids:
                            # Not in WotLK or modern → junk data from original Blizzard ADTs
                            junk_ids.add(effect_id)
                            self.bad_ground_effect_ids.add(effect_id)
                        else:
                            # In modern but not WotLK → genuinely modern content
                            modern_only_ids.add(effect_id)
                            self.modern_ground_effect_ids.add(effect_id)
                else:
                    valid_ids.append(effect_id)

            # Report valid vs invalid IDs
            if valid_ids:
                self.log(f'\n  ✅ {len(valid_ids)} ground effect IDs are VALID (exist in DBC)')

            # Report junk IDs once (legacy ADT data, can be ignored)
            if junk_ids:
                self.log(f'\n  ℹ️  {len(junk_ids)} junk ground effect IDs found (legacy Blizzard ADT data)')
                self.log(f'      These IDs don\'t exist in WotLK or modern clients - safe to ignore')
                sample_junk = sorted(junk_ids)[:10]
                self.log(f'      Example IDs: {sample_junk}{"..." if len(junk_ids) > 10 else ""}')

            # Report genuinely missing modern content (if any)
            if modern_only_ids:
                self.log(f'\n  ⚠️  {len(modern_only_ids)} ground effect IDs are modern content (missing from WotLK DBC)')
                self.log(f'      These exist in modern client but not in our WotLK GroundEffectTexture.dbc')
                sample_modern = sorted(modern_only_ids)[:10]
                self.log(f'      Example IDs: {sample_modern}{"..." if len(modern_only_ids) > 10 else ""}')
                self.log(f'      ⚠️  These WILL show as blue cube placeholders in-game!')

            # Calculate models for VALID ground effects only (the ones we actually need)
            models_for_valid_effects = set()
            for effect_id in valid_ids:
                if effect_id in self.ground_effect_id_to_models:
                    models_for_valid_effects.update(self.ground_effect_id_to_models[effect_id])

            # Store for later reference in Step 7 summary
            self.ground_effect_models_needed = models_for_valid_effects

            if valid_ids and models_for_valid_effects:
                self.log(f'\n  Models needed for {len(valid_ids)} valid ground effects: {len(models_for_valid_effects)} unique M2 files')

            # Show DBC entry counts after validation
            self.log(f'\n  DBC Reference Info:')
            self.log(f'    GroundEffectTexture.dbc: {len(texture_reader.textures):,} entries')
            self.log(f'    GroundEffectDoodad.dbc: {len(doodad_reader.doodads):,} entries, {len(self.ground_effect_models):,} unique models')
            if modern_ids:
                self.log(f'    Modern Reference: {len(modern_ids):,} entries')

    def parse_exported_wmos(self):
        """Parse exported WMO files for M2 doodad, texture, and nested WMO dependencies (Phase 2)"""
        from parsers.wmo_parser import WMOParser

        self.log('\n' + '='*80)
        self.log('STEP 7: Parsing exported WMO files for M2 doodad, texture, and nested WMO dependencies')
        self.log('='*80)

        export_dir = self.paths['export']
        self.log(f'\nExport Directory: {export_dir}')

        if not export_dir.exists():
            self.log('  Export directory does not exist - skipping WMO parsing')
            return

        # Track Phase 2 dependencies separately
        phase2_doodads = set()
        phase2_textures = set()
        newly_discovered_wmos = set()

        # Recursively parse WMOs until no new WMO references are found
        iteration = 1
        max_iterations = 10  # Safety limit to prevent infinite loops

        while iteration <= max_iterations:
            # Find all WMO files in export directory (root files only, not groups)
            all_wmo_files = list(export_dir.rglob("*.wmo")) + list(export_dir.rglob("*.WMO"))
            # Filter to root WMO files only (exclude group files ending with _###)
            import re
            wmo_files = [f for f in all_wmo_files if not re.search(r'_\d{3}$', f.stem)]
            group_wmo_files = [f for f in all_wmo_files if re.search(r'_\d{3}$', f.stem)]

            if iteration == 1:
                self.log(f'Found {len(all_wmo_files)} total WMO files in export directory')
                self.log(f'  - {len(wmo_files)} root WMO files (contain doodad/texture references)')
                self.log(f'  - {len(group_wmo_files)} group WMO files (geometry only, skipped)')
                self.log(f'\nParsing root WMO files for dependencies...')

            if not wmo_files:
                self.log('  No WMO files to parse')
                return

            # Track newly discovered WMOs in this iteration
            iteration_new_wmos = set()

            for wmo_file in wmo_files:
                parser = WMOParser(wmo_file)
                doodads, textures = parser.parse_all()
                wmo_refs = parser.wmo_refs  # Get nested WMO references

                # Get normalized WMO path (relative to export directory)
                wmo_rel_path = wmo_file.relative_to(export_dir)
                wmo_normalized = self.normalize_path(str(wmo_rel_path)).upper()

                # Track M2 doodads → WMO
                if doodads:
                    for doodad in doodads:
                        doodad_normalized = self.normalize_path(doodad).upper()
                        if doodad_normalized not in self.asset_parents:
                            self.asset_parents[doodad_normalized] = wmo_normalized
                            self.parent_types[doodad_normalized] = "M2"
                    phase2_doodads.update(doodads)

                # Track BLP textures → WMO
                if textures:
                    for texture in textures:
                        texture_normalized = self.normalize_path(texture).upper()
                        if texture_normalized not in self.asset_parents:
                            self.asset_parents[texture_normalized] = wmo_normalized
                            self.parent_types[texture_normalized] = "BLP"
                    phase2_textures.update(textures)

                # Track nested WMO references → parent WMO
                if wmo_refs:
                    for nested_wmo in wmo_refs:
                        nested_normalized = self.normalize_path(nested_wmo).upper()
                        # Check if this WMO is new (not in ADT references, not already extracted)
                        if nested_normalized not in self.adt_wmos and nested_normalized not in self.found_assets:
                            iteration_new_wmos.add(nested_normalized)
                            # Track parent relationship
                            if nested_normalized not in self.asset_parents:
                                self.asset_parents[nested_normalized] = wmo_normalized
                                self.parent_types[nested_normalized] = "WMO"

                if iteration == 1:
                    nested_count = len(wmo_refs) if wmo_refs else 0
                    self.log(f'  Parsed: {wmo_file.name} -> {len(doodads)} doodads, {len(textures)} textures, {nested_count} nested WMOs')

            # If we found new WMOs, extract them and repeat
            if iteration_new_wmos:
                self.log(f'\n  🔄 Iteration {iteration}: Discovered {len(iteration_new_wmos)} new nested WMO references')
                newly_discovered_wmos.update(iteration_new_wmos)

                # Add to adt_wmos so they'll be processed
                self.adt_wmos.update(iteration_new_wmos)

                # Extract the newly discovered WMOs
                self.all_dependencies.clear()
                self.all_dependencies.update(iteration_new_wmos)
                self.required_custom.clear()
                self.filter_stock_assets(step_number=f'7.{iteration}', asset_type="nested WMO files")

                if self.required_custom:
                    self.find_assets(step_number=f'7.{iteration}', asset_type="nested WMO files")
                    self.extract_assets(step_number=f'7.{iteration}', asset_type="nested WMO files")

                iteration += 1
            else:
                # No new WMOs found, we're done
                break

        # Store WMO doodads and textures (will be added to all_dependencies in appropriate phases)
        self.wmo_doodads.update(phase2_doodads)
        self.wmo_textures.update(phase2_textures)

        self.log(f'\n  WMO files parsed: {len(wmo_files)}')
        if newly_discovered_wmos:
            self.log(f'  Nested WMOs discovered: {len(newly_discovered_wmos):,}')
        self.log(f'  M2 doodads found in WMOs: {len(phase2_doodads):,}')
        self.log(f'  BLP textures found in WMOs: {len(phase2_textures):,}')

        # Summary of all M2 sources discovered so far
        self.log(f'\n  ━━━ M2 Model Sources Summary ━━━')
        self.log(f'  From ADT direct references: {len(self.adt_m2_models):,} models')
        self.log(f'  From Ground Effects: {len(self.ground_effect_models_needed):,} models')
        self.log(f'  From WMO doodads: {len(phase2_doodads):,} models')

        # Calculate total unique M2s
        total_m2s = len(self.adt_m2_models | self.ground_effect_models_needed | phase2_doodads)
        self.log(f'  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━')
        self.log(f'  Total unique M2 models: {total_m2s:,}')

    def parse_exported_m2s(self):
        """Parse exported M2 models for BLP texture dependencies (Phase 3)"""
        from parsers.m2_texture_parser import parse_m2_textures

        self.log('\n' + '='*80)
        self.log('STEP 11: Parsing exported M2 models for texture dependencies')
        self.log('='*80)

        export_dir = self.paths['export']
        self.log(f'\nExport Directory: {export_dir}')

        if not export_dir.exists():
            self.log('  Export directory does not exist - skipping M2 parsing')
            return

        # Find all M2 files in export directory
        m2_files = []
        for ext in ['*.m2', '*.M2', '*.mdx', '*.MDX']:
            m2_files.extend(export_dir.rglob(ext))

        self.log(f'Found {len(m2_files)} M2/MDX files in export directory')

        if not m2_files:
            self.log('  No M2 files to parse')
            return

        # Track Phase 3 texture dependencies
        phase3_m2_textures = set()
        parsed_count = 0
        processed = 0

        for m2_file in m2_files:
            processed += 1
            # Log progress every 250 files
            if processed % 250 == 0:
                self.log(f'  Progress: {processed}/{len(m2_files)} M2 files parsed...')

            textures = parse_m2_textures(m2_file)
            if textures:
                # Track parent relationships: BLP textures → M2
                # Get normalized M2 path (relative to export directory)
                m2_rel_path = m2_file.relative_to(export_dir)
                m2_normalized = self.normalize_path(str(m2_rel_path)).upper()

                for texture in textures:
                    texture_normalized = self.normalize_path(texture).upper()
                    # Only set parent if not already set (ADT terrain textures have higher priority)
                    if texture_normalized not in self.asset_parents:
                        self.asset_parents[texture_normalized] = m2_normalized
                        self.parent_types[texture_normalized] = "BLP"

                phase3_m2_textures.update(textures)
                parsed_count += 1

        # Clear and set Phase 3 dependencies (textures from M2s + WMOs + ADTs)
        self.all_dependencies.clear()
        self.all_dependencies.update(phase3_m2_textures)
        self.all_dependencies.update(self.wmo_textures)
        self.all_dependencies.update(self.adt_textures)

        self.log(f'\n  M2 files parsed: {len(m2_files)}')
        self.log(f'  M2 files with textures: {parsed_count}')
        self.log(f'  Unique textures from M2s: {len(phase3_m2_textures)}')
        self.log(f'  Unique textures from WMOs: {len(self.wmo_textures)}')
        self.log(f'  Unique textures from ADTs: {len(self.adt_textures)}')
        self.log(f'  Total texture dependencies: {len(self.all_dependencies):,}')

    def load_stock_assets(self):
        """Load merged stock WotLK 3.3.5a asset list"""
        self.log('\n' + '='*80)
        self.log('STEP 2: Loading stock WotLK asset list')
        self.log('='*80)

        listfile = self.paths['wotlk_base_assets']
        self.log(f'\nListfile: {listfile}')

        with open(listfile, 'r', encoding='latin-1', errors='ignore') as f:
            for line in f:
                line = line.strip()
                if line:
                    # Normalize: uppercase, forward slashes
                    normalized = line.upper().replace('\\', '/')
                    self.stock_assets.add(normalized)

        self.log(f'  Loaded: {len(self.stock_assets):,} stock assets')

    def filter_stock_assets(self, step_number: int, asset_type: str):
        """Filter out assets already in stock WotLK client"""
        self.log('\n' + '='*80)
        self.log(f'STEP {step_number}: Filtering stock {asset_type}')
        self.log('='*80)

        total_dependencies = len(self.all_dependencies)
        stock_count = 0

        self.log(f'\nTotal unique {asset_type} found from parsing: {total_dependencies:,}')
        self.log(f'  Checking against stock WotLK asset registry...')

        # Filter stock WotLK assets
        for asset in self.all_dependencies:
            normalized = asset.upper().replace('\\', '/')

            # Check exact match
            is_stock = normalized in self.stock_assets

            # Check MDX -> M2 conversion
            if not is_stock and normalized.endswith('.MDX'):
                m2_version = normalized.replace('.MDX', '.M2')
                is_stock = m2_version in self.stock_assets

            if is_stock:
                stock_count += 1
            else:
                # CRITICAL: Add normalized path to match asset_parents keys
                self.required_custom.add(normalized)

        # Track cumulative stock assets across all phases
        self.total_stock_assets += stock_count

        self.log(f'\nFiltering results:')
        self.log(f'  ✅ Stock WotLK {asset_type} (already in base client): {stock_count:,}')
        self.log(f'  ⚠️  Custom/modern {asset_type} (need to extract): {len(self.required_custom):,}')

    def find_assets(self, step_number: int, asset_type: str):
        """Search for required assets in source directory"""
        self.log('\n' + '='*80)
        self.log(f'STEP {step_number}: Searching Asset Library for required {asset_type}')
        self.log('='*80)

        assets_dir = self.paths['assets_source']
        self.log(f'\nAssets Source: {assets_dir}')

        # Build asset lookup map (include .anim files now)
        asset_map = {}
        for root, dirs, files in os.walk(assets_dir):
            for file in files:
                if file.lower().endswith(('.m2', '.mdx', '.wmo', '.skin', '.blp', '.anim')):
                    full_path = Path(root) / file
                    rel_path = full_path.relative_to(assets_dir)
                    normalized = str(rel_path).upper().replace('\\', '/')
                    asset_map[normalized] = full_path

        self.log(f'  Scanned: {len(asset_map):,} available assets')

        # Match required assets (with debug logging for first few misses)
        not_found_sample = []
        wmo_groups_found = 0
        m2_skins_found = 0
        m2_anims_found = 0
        specular_textures_found = 0
        folder_discovered_assets = 0  # New: track assets found by folder scanning
        fuzzy_matched_assets = []  # Track fuzzy matches for reporting

        for asset in self.required_custom:
            normalized = asset.upper().replace('\\', '/')

            # Check for exact match first
            found_key = None
            if normalized in asset_map:
                found_key = normalized
            # If not found and it's an M2/MDX file, try the alternate extension
            elif normalized.endswith('.M2') or normalized.endswith('.MDX'):
                # Try swapping M2 ↔ MDX (they're the same format, different naming conventions)
                if normalized.endswith('.M2'):
                    alternate = normalized[:-3] + '.MDX'
                else:  # ends with .MDX
                    alternate = normalized[:-4] + '.M2'

                if alternate in asset_map:
                    found_key = alternate

            if found_key:
                # IMPORTANT: Store using the FULL PATH (found_key), not just requested filename
                # For ground effect M2s where normalized is just a filename (e.g., "6ARPEBBLE02.MDX"),
                # we need to use the full path to preserve directory structure during extraction
                # Use found_key as the dictionary key to ensure proper export path structure
                self.found_assets[found_key] = asset_map[found_key]

                # Also store under original key for backward compatibility with parent tracking
                if normalized != found_key:
                    self.exported_to_original[found_key] = normalized

                # For WMO files, also find and add all group files (_000.wmo, _001.wmo, etc.)
                if found_key.endswith('.WMO') and asset_type == "WMO files":
                    # Get the base name without extension (use found_key for actual file access)
                    base_normalized = found_key[:-4]  # Remove .WMO
                    source_path = asset_map[found_key]
                    base_path = source_path.parent / source_path.stem

                    # Search for group files (building_000.wmo, building_001.wmo, etc.)
                    # WMO groups can go from _000 to _511 theoretically, but typically much fewer
                    for i in range(512):
                        group_filename = f"{source_path.stem}_{i:03d}{source_path.suffix}"
                        group_full_path = source_path.parent / group_filename

                        if group_full_path.exists():
                            # Add to found assets
                            group_rel_path = group_full_path.relative_to(assets_dir)
                            group_normalized = str(group_rel_path).upper().replace('\\', '/')
                            self.found_assets[group_normalized] = group_full_path
                            wmo_groups_found += 1
                        else:
                            # Stop searching when we hit the first missing group number
                            break

                    # NEW: Folder-based discovery for WMO-related assets (stoneharry method)
                    # Finds textures, additional files with similar names in same folder
                    related_assets = self.find_related_assets_by_folder(source_path, assets_dir)
                    for rel_normalized, rel_path in related_assets.items():
                        if rel_normalized not in self.found_assets:
                            self.found_assets[rel_normalized] = rel_path
                            folder_discovered_assets += 1

                            # Track parent relationship: folder-scanned asset → parent WMO
                            if rel_normalized not in self.asset_parents:
                                self.asset_parents[rel_normalized] = normalized
                                # Determine type based on extension
                                if rel_normalized.endswith('.BLP'):
                                    self.parent_types[rel_normalized] = "BLP"
                                elif rel_normalized.endswith('.M2') or rel_normalized.endswith('.MDX'):
                                    self.parent_types[rel_normalized] = "M2"

                # For M2 files, also find and add skin files and animation files
                elif (found_key.endswith('.M2') or found_key.endswith('.MDX')) and asset_type == "M2 models":
                    source_path = asset_map[found_key]
                    base_path_no_ext = source_path.parent / source_path.stem

                    # Search for skin files (correct naming: model00.skin, model01.skin, etc.)
                    # NOT model.skin00 - the number comes BEFORE the .skin extension
                    # Examples: goblin_wire_0100.skin, VineyardWired00.skin, BloodElfFemale00.skin
                    for skin_num in ['00', '01', '02', '03']:
                        skin_full_path = Path(str(base_path_no_ext) + skin_num + '.skin')
                        if skin_full_path.exists():
                            skin_rel_path = skin_full_path.relative_to(assets_dir)
                            skin_normalized = str(skin_rel_path).upper().replace('\\', '/')
                            self.found_assets[skin_normalized] = skin_full_path
                            m2_skins_found += 1

                    # Search for animation files (.anim)
                    # Animation files use pattern: model0000-00.anim, model0001-00.anim, etc.
                    # NOT model-0000-00.anim - the number is part of the base name
                    # Example: BloodElfFemale0060-00.anim, BloodElfFemale0061-00.anim
                    # Use glob to find all matching animation files
                    anim_pattern = f"{source_path.stem}*.anim"
                    for anim_file in source_path.parent.glob(anim_pattern):
                        if anim_file.exists():
                            anim_rel_path = anim_file.relative_to(assets_dir)
                            anim_normalized = str(anim_rel_path).upper().replace('\\', '/')
                            self.found_assets[anim_normalized] = anim_file
                            m2_anims_found += 1

                    # NEW: Folder-based discovery for M2-related assets (stoneharry method)
                    # Finds textures, additional files with similar names in same folder
                    related_assets = self.find_related_assets_by_folder(source_path, assets_dir)
                    for rel_normalized, rel_path in related_assets.items():
                        if rel_normalized not in self.found_assets:
                            self.found_assets[rel_normalized] = rel_path
                            folder_discovered_assets += 1

                # For BLP textures, also find and add specular variants (_S.blp)
                elif found_key.endswith('.BLP') and asset_type == "textures":
                    source_path = asset_map[found_key]
                    # Check if this is already a specular texture (ends with _S.blp)
                    if not source_path.stem.upper().endswith('_S'):
                        # Look for specular variant
                        specular_name = f"{source_path.stem}_s{source_path.suffix}"
                        specular_full_path = source_path.parent / specular_name

                        if specular_full_path.exists():
                            specular_rel_path = specular_full_path.relative_to(assets_dir)
                            specular_normalized = str(specular_rel_path).upper().replace('\\', '/')
                            self.found_assets[specular_normalized] = specular_full_path
                            specular_textures_found += 1

            else:
                # Exact match not found - try fuzzy matching
                # This handles path corruption (e.g., "D/KALIMDOR..." instead of "WORLD/KALIMDOR...")
                # and path prefix variations
                filename = normalized.split('/')[-1]  # Get just the filename

                # Find all assets with matching filename
                matches = [k for k in asset_map.keys() if k.split('/')[-1] == filename]

                # If no matches and it's M2/MDX, try the alternate extension
                if not matches and (filename.endswith('.M2') or filename.endswith('.MDX')):
                    if filename.endswith('.M2'):
                        alternate_filename = filename[:-3] + '.MDX'
                    else:  # ends with .MDX
                        alternate_filename = filename[:-4] + '.M2'
                    matches = [k for k in asset_map.keys() if k.split('/')[-1] == alternate_filename]

                if matches:
                    # Found fuzzy match(es) - use the best one
                    # Prefer paths starting with standard prefixes
                    best_match = matches[0]
                    for match in matches:
                        match_lower = match.lower()
                        if match_lower.startswith(('world/', 'character/', 'creature/', 'item/', 'dungeons/')):
                            best_match = match
                            break

                    # Track fuzzy match for reporting
                    fuzzy_matched_assets.append((normalized, best_match))

                    # IMPORTANT: Store using the FULL PATH (best_match), not just filename
                    # For ground effect M2s where normalized is just a filename (e.g., "6ARPEBBLE02.MDX"),
                    # we need to use the full path to preserve directory structure during extraction
                    # Use best_match as key to ensure proper export path structure
                    self.found_assets[best_match] = asset_map[best_match]

                    # Also store under original key for backward compatibility with parent tracking
                    if normalized != best_match:
                        self.exported_to_original[best_match] = normalized

                    # Apply the same variant detection logic
                    # (WMO groups, M2 skins/anims, BLP speculars)
                    if best_match.endswith('.WMO') and asset_type == "WMO files":
                        source_path = asset_map[best_match]
                        for i in range(512):
                            group_filename = f"{source_path.stem}_{i:03d}{source_path.suffix}"
                            group_full_path = source_path.parent / group_filename
                            if group_full_path.exists():
                                group_rel_path = group_full_path.relative_to(assets_dir)
                                group_normalized = str(group_rel_path).upper().replace('\\', '/')
                                self.found_assets[group_normalized] = group_full_path
                                wmo_groups_found += 1
                            else:
                                break

                        # NEW: Folder-based discovery for WMO-related assets (fuzzy match case)
                        related_assets = self.find_related_assets_by_folder(source_path, assets_dir)
                        for rel_normalized, rel_path in related_assets.items():
                            if rel_normalized not in self.found_assets:
                                self.found_assets[rel_normalized] = rel_path
                                folder_discovered_assets += 1

                                # Track parent relationship: folder-scanned asset → parent WMO
                                if rel_normalized not in self.asset_parents:
                                    self.asset_parents[rel_normalized] = normalized
                                    # Determine type based on extension
                                    if rel_normalized.endswith('.BLP'):
                                        self.parent_types[rel_normalized] = "BLP"
                                    elif rel_normalized.endswith('.M2') or rel_normalized.endswith('.MDX'):
                                        self.parent_types[rel_normalized] = "M2"

                    elif (best_match.endswith('.M2') or best_match.endswith('.MDX')) and asset_type == "M2 models":
                        source_path = asset_map[best_match]
                        base_path_no_ext = source_path.parent / source_path.stem

                        # Skin files
                        for skin_num in ['00', '01', '02', '03']:
                            skin_full_path = Path(str(base_path_no_ext) + skin_num + '.skin')
                            if skin_full_path.exists():
                                skin_rel_path = skin_full_path.relative_to(assets_dir)
                                skin_normalized = str(skin_rel_path).upper().replace('\\', '/')
                                self.found_assets[skin_normalized] = skin_full_path
                                m2_skins_found += 1

                        # Animation files
                        anim_pattern = f"{source_path.stem}*.anim"
                        for anim_file in source_path.parent.glob(anim_pattern):
                            if anim_file.exists():
                                anim_rel_path = anim_file.relative_to(assets_dir)
                                anim_normalized = str(anim_rel_path).upper().replace('\\', '/')
                                self.found_assets[anim_normalized] = anim_file
                                m2_anims_found += 1

                        # NEW: Folder-based discovery for M2-related assets (fuzzy match case)
                        related_assets = self.find_related_assets_by_folder(source_path, assets_dir)
                        for rel_normalized, rel_path in related_assets.items():
                            if rel_normalized not in self.found_assets:
                                self.found_assets[rel_normalized] = rel_path
                                folder_discovered_assets += 1

                                # Track parent relationship: folder-scanned asset → parent M2
                                # The parent M2 already has its own parent chain (ADT → Area)
                                # So this asset will inherit the full chain
                                if rel_normalized not in self.asset_parents:
                                    self.asset_parents[rel_normalized] = normalized
                                    # Determine type based on extension
                                    if rel_normalized.endswith('.BLP'):
                                        self.parent_types[rel_normalized] = "BLP"
                                    elif rel_normalized.endswith('.M2') or rel_normalized.endswith('.MDX'):
                                        self.parent_types[rel_normalized] = "M2"

                    elif best_match.endswith('.BLP') and asset_type == "textures":
                        source_path = asset_map[best_match]
                        if not source_path.stem.upper().endswith('_S'):
                            specular_name = f"{source_path.stem}_s{source_path.suffix}"
                            specular_full_path = source_path.parent / specular_name
                            if specular_full_path.exists():
                                specular_rel_path = specular_full_path.relative_to(assets_dir)
                                specular_normalized = str(specular_rel_path).upper().replace('\\', '/')
                                self.found_assets[specular_normalized] = specular_full_path
                                specular_textures_found += 1

                                # Track parent relationship: specular texture → base texture
                                # Base texture already has parent chain (M2/WMO → ADT → Area)
                                if specular_normalized not in self.asset_parents:
                                    self.asset_parents[specular_normalized] = normalized
                                    self.parent_types[specular_normalized] = "BLP"

                elif len(not_found_sample) < 5:
                    # Still not found even with fuzzy matching - collect for debugging
                    not_found_sample.append((asset, normalized))

        # Count what was actually found by classifying files in found_assets
        # This matches the classification used in extract_assets() for consistency
        # IMPORTANT: Only count files added in THIS phase by checking required_custom
        import re
        actual_wmo_root_count = 0
        actual_wmo_group_count = 0
        actual_m2_root_count = 0
        actual_m2_skin_count = 0
        actual_m2_anim_count = 0
        actual_texture_base_count = 0
        actual_texture_specular_count = 0
        actual_other_count = 0

        # Build set of normalized required assets for this phase
        required_normalized = {asset.upper().replace('\\', '/') for asset in self.required_custom}

        # Only count assets that match the current phase's asset type
        for asset_key in self.found_assets.keys():
            # Skip assets already extracted in previous phases
            if asset_key in self.extracted:
                continue

            # Skip assets from previous phases
            is_current_phase = False

            if asset_type == "WMO files" and asset_key.endswith('.WMO'):
                is_current_phase = True
            elif asset_type == "M2 models" and (asset_key.endswith('.M2') or asset_key.endswith('.MDX')):
                is_current_phase = True
            elif asset_type == "textures" and asset_key.endswith('.BLP'):
                is_current_phase = True

            # Only count assets from current phase + their auto-detected dependencies
            if not is_current_phase and asset_key not in required_normalized:
                # Check if it's a dependency of a current phase asset
                if asset_type == "WMO files" and not asset_key.endswith('.WMO'):
                    continue  # Skip non-WMO files in WMO phase
                elif asset_type == "M2 models" and not (asset_key.endswith('.M2') or asset_key.endswith('.MDX') or '.SKIN' in asset_key.upper() or asset_key.endswith('.ANIM')):
                    continue  # Skip non-M2 files in M2 phase
                elif asset_type == "textures" and not asset_key.endswith('.BLP'):
                    continue  # Skip non-texture files in texture phase

            # Classify the asset
            if asset_key.endswith('.WMO'):
                filename = asset_key.split('/')[-1]
                basename = filename.split('.')[0]
                if re.search(r'_\d{3}$', basename):
                    actual_wmo_group_count += 1
                else:
                    actual_wmo_root_count += 1
            elif asset_key.endswith('.M2') or asset_key.endswith('.MDX'):
                actual_m2_root_count += 1
            elif '.SKIN' in asset_key.upper():
                actual_m2_skin_count += 1
            elif asset_key.endswith('.ANIM'):
                actual_m2_anim_count += 1
            elif asset_key.endswith('.BLP'):
                filename = asset_key.split('/')[-1]
                if filename.split('.')[0].endswith('_S'):
                    actual_texture_specular_count += 1
                else:
                    actual_texture_base_count += 1
            else:
                actual_other_count += 1

        # Determine root count based on asset type
        if asset_type == "WMO files":
            root_assets_found = actual_wmo_root_count
        elif asset_type == "M2 models":
            root_assets_found = actual_m2_root_count
        elif asset_type == "textures":
            root_assets_found = actual_texture_base_count
        else:
            root_assets_found = 0

        # Report findings in clear format
        self.log(f'\nRequired {asset_type}: {len(self.required_custom):,}')

        # Check if all required assets were found (including fuzzy matches)
        actually_missing_set = set()
        fuzzy_match_count = 0
        for asset in self.required_custom:
            if asset not in self.found_assets:
                actually_missing_set.add(asset)
            elif asset not in asset_map:  # In found_assets but not exact match = fuzzy
                fuzzy_match_count += 1

        if not actually_missing_set:
            if fuzzy_match_count > 0:
                self.log(f'  ✅ Found all {len(self.required_custom):,} requested {asset_type} ({fuzzy_match_count:,} via fuzzy matching)')
            else:
                self.log(f'  ✅ Found all {len(self.required_custom):,} requested {asset_type}')
        else:
            self.log(f'  ⚠️  Found {root_assets_found:,} of {len(self.required_custom):,} requested {asset_type}')
            self.log(f'  ⚠️  Missing: {len(actually_missing_set):,} {asset_type}')

        # Store missing count for later use
        missing_count = len(actually_missing_set)

        # Show extra assets found via folder scanning
        extra_count = root_assets_found - len(self.required_custom)
        if extra_count > 0:
            self.log(f'  + Found {extra_count:,} additional {asset_type} variants via folder scanning')

        self.log(f'  = {root_assets_found:,} total root {asset_type} found')

        # Show automatically detected dependencies
        has_dependencies = (actual_wmo_group_count > 0 or actual_m2_skin_count > 0 or
                           actual_m2_anim_count > 0 or actual_texture_specular_count > 0 or
                           actual_other_count > 0)

        if has_dependencies:
            self.log(f'\nAutomatically detected dependencies:')
            if actual_wmo_group_count > 0:
                self.log(f'  + {actual_wmo_group_count:,} WMO group files (sub-components of the WMO files)')
            if actual_m2_skin_count > 0:
                self.log(f'  + {actual_m2_skin_count:,} M2 skin files')
            if actual_m2_anim_count > 0:
                self.log(f'  + {actual_m2_anim_count:,} M2 animation files')
            if actual_texture_specular_count > 0:
                self.log(f'  + {actual_texture_specular_count:,} specular texture variants')
            if actual_other_count > 0:
                self.log(f'  + {actual_other_count:,} related assets (textures, additional files in same folders)')

        # Calculate total for THIS phase only
        phase_total = (root_assets_found + actual_wmo_group_count + actual_m2_skin_count +
                      actual_m2_anim_count + actual_texture_specular_count + actual_other_count)

        # Show total
        self.log(f'\nTotal files found: {phase_total:,}')
        if has_dependencies or extra_count > 0:
            breakdown = f'  ({root_assets_found:,} root {asset_type}'
            if actual_wmo_group_count > 0:
                breakdown += f' + {actual_wmo_group_count:,} group files'
            if actual_m2_skin_count > 0:
                breakdown += f' + {actual_m2_skin_count:,} skins'
            if actual_m2_anim_count > 0:
                breakdown += f' + {actual_m2_anim_count:,} anims'
            if actual_texture_specular_count > 0:
                breakdown += f' + {actual_texture_specular_count:,} speculars'
            if actual_other_count > 0:
                breakdown += f' + {actual_other_count:,} other assets'
            breakdown += ')'
            self.log(breakdown)

        # List the files if verbose and WMO phase (for debugging)
        if self.options.get('verbose', True) and asset_type == "WMO files" and (actual_wmo_root_count > 0 or actual_wmo_group_count > 0):
            # Collect root and group WMOs
            root_wmos = []
            group_wmos = []
            for asset_key in self.found_assets.keys():
                if asset_key in self.extracted:
                    continue
                if asset_key.endswith('.WMO'):
                    filename = asset_key.split('/')[-1]
                    basename = filename.split('.')[0]
                    if re.search(r'_\d{3}$', basename):
                        group_wmos.append(filename)
                    else:
                        root_wmos.append(filename)

            if root_wmos:
                self.log(f'\n  Root WMO files ({len(root_wmos)}):')
                for wmo in sorted(root_wmos):
                    self.log(f'    - {wmo}')

            if group_wmos:
                self.log(f'\n  Group WMO files ({len(group_wmos)}):')
                for wmo in sorted(group_wmos)[:10]:  # Show first 10
                    self.log(f'    - {wmo}')
                if len(group_wmos) > 10:
                    self.log(f'    ... and {len(group_wmos) - 10} more group files')

        # Show ALL missing assets with parent chains (no truncation)
        if missing_count > 0:
            still_missing = set()
            for asset in self.required_custom:
                # Asset is already normalized from filter_stock_assets()
                if asset not in self.found_assets:
                    still_missing.add(asset)

            if still_missing:
                self.log(f'\n  ⚠️  MISSING {asset_type.upper()} - {len(still_missing):,} FILES')
                self.log(f'  {"="*78}')
                for asset in sorted(still_missing):
                    parent_chain = self.format_parent_chain(asset)
                    self.log(f'    {asset}')
                    self.log(f'      ↳ Chain: {parent_chain}')
            else:
                # All required assets found, but show fuzzy matches if root count is low
                if fuzzy_matched_assets and root_assets_found < len(self.required_custom):
                    self.log(f'\n  ℹ️  NOTE: {len(fuzzy_matched_assets)} {asset_type} found via fuzzy matching (path corrections)')
                    self.log(f'  {"─"*78}')
                    for original_path, matched_path in fuzzy_matched_assets[:10]:  # Show first 10
                        self.log(f'    ADT Reference: {original_path}')
                        self.log(f'    Found As:      {matched_path}')
                    if len(fuzzy_matched_assets) > 10:
                        self.log(f'    ... and {len(fuzzy_matched_assets) - 10} more fuzzy matches')

    def build_folder_cache(self, assets_dir: Path):
        """
        Build a complete index of all files in the assets directory.
        This is done once at startup to avoid repeated filesystem scans.

        Organizes files by folder for fast lookups during related asset discovery.
        """
        self.log('\n' + '='*80)
        self.log('STEP 0: Building assets directory cache...')
        self.log('='*80)

        file_count = 0
        folder_count = 0
        last_logged = 0

        try:
            # Walk the entire assets directory tree
            for root, dirs, files in os.walk(assets_dir):
                if files:  # Only process folders with files
                    folder_path = Path(root)
                    folder_count += 1

                    # Create cache entry for this folder
                    self.folder_cache[folder_path] = {}

                    for filename in files:
                        file_path = folder_path / filename
                        # Store with uppercase filename as key for case-insensitive lookups
                        self.folder_cache[folder_path][filename.upper()] = file_path
                        file_count += 1

                # Progress indicator every 1000 folders (avoid duplicate logs)
                if folder_count % 1000 == 0 and folder_count != last_logged:
                    self.log(f'  Indexed {folder_count:,} folders, {file_count:,} files so far...')
                    last_logged = folder_count

        except Exception as e:
            self.log(f'  Warning: Error building folder cache: {e}')

        self.log(f'  ✅ Indexed {folder_count:,} folders with {file_count:,} total files')

    def find_related_assets_by_folder(self, asset_path: Path, assets_dir: Path) -> Dict[str, Path]:
        """
        Scan folder for related assets by filename matching (stoneharry method).

        For a given M2/WMO file, finds all related files in the same folder that share
        the same base filename (e.g., for 'building.wmo', finds 'building_diffuse.blp',
        'building_normal.blp', etc.)

        This catches textures loaded by filename convention rather than explicit references.

        Args:
            asset_path: Path to the base asset (M2 or WMO file)
            assets_dir: Root assets directory (for calculating relative paths)

        Returns:
            Dict mapping normalized paths to full Paths for discovered related assets
        """
        related_assets = {}

        asset_folder = asset_path.parent
        asset_stem_upper = asset_path.stem.upper()  # e.g., "BUILDING" from "building.wmo"

        # Use cached folder contents if available, otherwise fall back to iterdir()
        if asset_folder in self.folder_cache:
            folder_contents = self.folder_cache[asset_folder]

            for file_upper, file_path in folder_contents.items():
                file_ext_lower = file_path.suffix.lower()

                # Check if filename contains the base asset name
                # AND has a relevant extension
                if asset_stem_upper in file_upper:
                    if file_ext_lower in ['.blp', '.skin', '.anim', '.wmo', '.m2', '.mdx']:
                        # Skip the original asset itself (we already have it)
                        if file_path == asset_path:
                            continue

                        # Calculate normalized path
                        rel_path = file_path.relative_to(assets_dir)
                        normalized = str(rel_path).upper().replace('\\', '/')

                        related_assets[normalized] = file_path
        else:
            # Fallback: scan folder directly (shouldn't happen if cache built properly)
            try:
                for file_path in asset_folder.iterdir():
                    if not file_path.is_file():
                        continue

                    file_upper = file_path.name.upper()
                    file_ext_lower = file_path.suffix.lower()

                    # Check if filename contains the base asset name
                    # AND has a relevant extension
                    if asset_stem_upper in file_upper:
                        if file_ext_lower in ['.blp', '.skin', '.anim', '.wmo', '.m2', '.mdx']:
                            # Skip the original asset itself (we already have it)
                            if file_path == asset_path:
                                continue

                            # Calculate normalized path
                            rel_path = file_path.relative_to(assets_dir)
                            normalized = str(rel_path).upper().replace('\\', '/')

                            related_assets[normalized] = file_path
            except Exception as e:
                # Silently handle permission errors, missing folders, etc.
                pass

        return related_assets

    def extract_assets(self, step_number: int, asset_type: str):
        """Copy found assets to export directory"""
        self.log('\n' + '='*80)
        self.log(f'STEP {step_number}: Extracting {asset_type} to export directory')
        self.log('='*80)

        export_dir = self.paths['export']
        export_dir.mkdir(parents=True, exist_ok=True)

        self.log(f'\nExtracting to: {export_dir}')

        # Track what was extracted in THIS phase only
        extracted_this_phase = []

        # Track variants separately for reporting
        wmo_root_count = 0
        wmo_group_count = 0
        m2_root_count = 0
        m2_skin_count = 0
        m2_anim_count = 0
        texture_base_count = 0
        texture_specular_count = 0

        for normalized, source_path in self.found_assets.items():
            # Skip files already extracted in previous phases
            if normalized in self.extracted:
                continue
            # Reconstruct proper path
            dest_path = export_dir / normalized.replace('/', os.sep)
            dest_path.parent.mkdir(parents=True, exist_ok=True)

            try:
                shutil.copy2(source_path, dest_path)
            except FileNotFoundError as e:
                print(f"\nERROR copying file:")
                print(f"  Normalized: {normalized}")
                print(f"  Source: {source_path}")
                print(f"  Source exists: {Path(source_path).exists()}")
                print(f"  Dest: {dest_path}")
                print(f"  Dest parent exists: {dest_path.parent.exists()}")
                raise
            self.extracted.append(normalized)
            extracted_this_phase.append(normalized)

            # Track WMO variants
            if asset_type == "WMO files" and normalized.endswith('.WMO'):
                filename = normalized.split('/')[-1]
                basename = filename.split('.')[0]
                # Group files end with _### (underscore + 3 digits)
                import re
                if re.search(r'_\d{3}$', basename):
                    # Group file (ends with _###)
                    wmo_group_count += 1
                else:
                    # Root file
                    wmo_root_count += 1

            # Track M2 variants
            elif asset_type == "M2 models":
                if normalized.endswith('.M2') or normalized.endswith('.MDX'):
                    m2_root_count += 1
                elif '.SKIN' in normalized.upper():
                    m2_skin_count += 1
                elif normalized.endswith('.ANIM'):
                    m2_anim_count += 1

            # Track texture variants
            elif asset_type == "textures" and normalized.endswith('.BLP'):
                filename = normalized.split('/')[-1]
                if filename.split('.')[0].endswith('_S'):
                    texture_specular_count += 1
                else:
                    texture_base_count += 1

        # Report extraction results
        if asset_type == "WMO files" and wmo_group_count > 0:
            self.log(f'\n  Extracted: {wmo_root_count:,} root WMO files')
            self.log(f'  Extracted: {wmo_group_count:,} WMO group files')
            self.log(f'  Total: {len(extracted_this_phase):,} {asset_type}')
        elif asset_type == "M2 models" and (m2_skin_count > 0 or m2_anim_count > 0):
            self.log(f'\n  Extracted: {m2_root_count:,} M2 model files')
            if m2_skin_count > 0:
                self.log(f'  Extracted: {m2_skin_count:,} M2 skin files')
            if m2_anim_count > 0:
                self.log(f'  Extracted: {m2_anim_count:,} M2 animation files')
            self.log(f'  Total: {len(extracted_this_phase):,} files')
        elif asset_type == "textures" and texture_specular_count > 0:
            self.log(f'\n  Extracted: {texture_base_count:,} base textures')
            self.log(f'  Extracted: {texture_specular_count:,} specular variants')
            self.log(f'  Total: {len(extracted_this_phase):,} {asset_type}')
        else:
            self.log(f'\n  Extracted: {len(extracted_this_phase):,} {asset_type}')

    def report_missing_assets(self, asset_type: str):
        """Report what assets are still missing after extraction attempt with full parent chains"""
        # Calculate what's still missing
        still_missing = self.required_custom - set(self.found_assets.keys())

        if not still_missing:
            self.log(f'\n  ✅ All required {asset_type} found and extracted!')
            return

        self.log(f'\n  ⚠️  MISSING {asset_type.upper()} - {len(still_missing):,} FILES')
        self.log(f'  {"="*78}')

        # Show ALL missing assets with full paths and parent chains (no truncation)
        for asset in sorted(still_missing):
            # Get parent chain for this asset
            parent_chain = self.format_parent_chain(asset)

            self.log(f'    {asset}')
            self.log(f'      ↳ Chain: {parent_chain}')

    def analyze_missing_by_area(self):
        """Analyze missing assets by map area using parent chain tracking"""
        self.log('\n' + '='*80)
        self.log('STEP 15: Analyzing missing assets by area')
        self.log('='*80)

        # Find what's still missing
        still_missing = self.required_custom - set(self.found_assets.keys())

        # Group missing assets by area using parent chain tracking
        self.missing_by_area = {}  # Reset dictionary

        for asset in still_missing:
            # Get parent chain for this asset
            chain = self.get_parent_chain(asset)

            # Extract area from chain (should be first element if it starts with Area_)
            area_name = None
            for item in chain:
                if item.startswith("Area_"):
                    area_name = item.replace("Area_", "")
                    break

            # If we found an area, group this asset under it
            if area_name:
                if area_name not in self.missing_by_area:
                    self.missing_by_area[area_name] = set()
                self.missing_by_area[area_name].add(asset)
            else:
                # Asset has no area parent (shouldn't happen, but handle gracefully)
                orphan_area = "Unknown Area"
                if orphan_area not in self.missing_by_area:
                    self.missing_by_area[orphan_area] = set()
                self.missing_by_area[orphan_area].add(asset)

        self.log(f'\n  Areas affected by missing assets: {len(self.missing_by_area)}')
        self.log(f'  Total unique missing assets: {sum(len(models) for models in self.missing_by_area.values())}')

        # Build comprehensive area analysis including ground effects
        area_analysis = {}  # {area_name: {adt_path: {asset_type: [assets]}}}

        # Add regular missing assets by area
        for asset in still_missing:
            chain = self.get_parent_chain(asset)
            area_name = None
            adt_path = None

            # Extract area and ADT from chain
            for item in chain:
                if item.startswith("Area_"):
                    area_name = item.replace("Area_", "")
                elif item.upper().endswith('.ADT'):
                    adt_path = item

            if area_name and adt_path:
                if area_name not in area_analysis:
                    area_analysis[area_name] = {}
                if adt_path not in area_analysis[area_name]:
                    area_analysis[area_name][adt_path] = {'M2': [], 'WMO': [], 'BLP': [], 'Ground Effects': []}

                # Categorize by asset type
                if asset.upper().endswith(('.M2', '.MDX')):
                    area_analysis[area_name][adt_path]['M2'].append(asset)
                elif asset.upper().endswith('.WMO'):
                    area_analysis[area_name][adt_path]['WMO'].append(asset)
                elif asset.upper().endswith('.BLP'):
                    area_analysis[area_name][adt_path]['BLP'].append(asset)

        # Add missing ground effect IDs by ADT (exclude junk legacy IDs)
        genuinely_missing_ground_effects = self.missing_ground_effect_ids - self.bad_ground_effect_ids
        if genuinely_missing_ground_effects:
            for effect_id in genuinely_missing_ground_effects:
                if effect_id in self.ground_effect_to_adts:
                    for adt_path in self.ground_effect_to_adts[effect_id]:
                        area_name = self._get_area_name(adt_path)

                        if area_name not in area_analysis:
                            area_analysis[area_name] = {}
                        if adt_path not in area_analysis[area_name]:
                            area_analysis[area_name][adt_path] = {'M2': [], 'WMO': [], 'BLP': [], 'Ground Effects': []}

                        area_analysis[area_name][adt_path]['Ground Effects'].append(effect_id)

        # Display organized by area (aggregated, not per-ADT)
        if area_analysis:
            self.log(f'\n  Affected Areas:')
            self.log(f'  {"="*78}')

            for area_name in sorted(area_analysis.keys()):
                # Aggregate all missing assets for this area
                area_m2s = set()
                area_wmos = set()
                area_blps = set()
                area_ground_effects = set()

                for adt_path, missing_data in area_analysis[area_name].items():
                    area_m2s.update(missing_data['M2'])
                    area_wmos.update(missing_data['WMO'])
                    area_blps.update(missing_data['BLP'])
                    area_ground_effects.update(missing_data['Ground Effects'])

                # Only show area if it has missing content
                has_missing = area_m2s or area_wmos or area_blps or area_ground_effects

                if has_missing:
                    self.log(f'\n  AREA: {area_name}')

                    if area_m2s:
                        self.log(f'    - M2 models: {len(area_m2s)} missing')
                    if area_wmos:
                        self.log(f'    - WMO files: {len(area_wmos)} missing')
                    if area_blps:
                        self.log(f'    - BLP textures: {len(area_blps)} missing')
                    if area_ground_effects:
                        effect_ids = sorted(area_ground_effects)
                        self.log(f'    - Ground effect IDs: {effect_ids}')

    def generate_duplicate_wmo_report(self):
        """Generate separate report for duplicate WMO detections and fixes"""
        if not self.duplicate_wmos:
            return

        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')

        # Determine report filename based on whether fixes were applied
        if self.fixed_adts:
            report_path = Path(__file__).parent / f'duplicate_wmos_fixed_{timestamp}.txt'
            report_title = 'DUPLICATE WMO FIX REPORT'
        else:
            report_path = Path(__file__).parent / f'duplicate_wmos_{timestamp}.txt'
            report_title = 'DUPLICATE WMO DETECTION REPORT'

        lines = []
        lines.append('='*80)
        lines.append(report_title)
        lines.append('='*80)
        lines.append(f'Generated: {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')
        lines.append(f'Threshold: {self.options.get("duplicate_wmo_threshold", 1.0)} game units')
        lines.append('')

        total_duplicates = sum(len(dups) for dups in self.duplicate_wmos.values())
        lines.append(f'Total Duplicate Pairs Found: {total_duplicates}')
        lines.append(f'Affected ADT Files: {len(self.duplicate_wmos)}')

        # Add fix summary if fixes were applied
        if self.fixed_adts:
            total_removed = sum(fix['removed_count'] for fix in self.fixed_adts.values())
            lines.append(f'ADTs Fixed and Exported: {len(self.fixed_adts)}')
            lines.append(f'Total WMO Instances Removed: {total_removed}')
            lines.append(f'Export Location: {self.paths["export"] / "WORLD" / "maps"}')

        lines.append('')
        lines.append('='*80)
        lines.append('AFFECTED ADT FILES')
        lines.append('='*80)
        lines.append('')

        # Sort by number of duplicates (descending)
        sorted_adts = sorted(
            self.duplicate_wmos.items(),
            key=lambda x: len(x[1]),
            reverse=True
        )

        for adt_path, duplicates in sorted_adts:
            adt_name = Path(adt_path).name
            lines.append('─'*80)
            lines.append(f'FILE: {adt_name}')
            lines.append(f'PATH: {adt_path}')
            lines.append(f'DUPLICATES: {len(duplicates)} pair(s)')
            lines.append('')

            # Get fix info if this ADT was fixed
            fix_info = self.fixed_adts.get(adt_path)

            for idx, (entry1, entry2, distance, wmo_name) in enumerate(duplicates, 1):
                lines.append(f'  Duplicate #{idx}:')
                lines.append(f'    WMO: {wmo_name}')
                lines.append(f'    Distance: {distance:.3f} units')
                lines.append('')
                lines.append(f'    Instance 1:')
                lines.append(f'      UniqueId: {entry1.unique_id}')
                lines.append(f'      Position: ({entry1.position[0]:.2f}, {entry1.position[1]:.2f}, {entry1.position[2]:.2f})')
                lines.append(f'      Rotation: ({entry1.rotation[0]:.2f}, {entry1.rotation[1]:.2f}, {entry1.rotation[2]:.2f})')
                lines.append(f'      Flags: {entry1.flags}, DoodadSet: {entry1.doodad_set}, Scale: {entry1.scale}')
                lines.append('')
                lines.append(f'    Instance 2:')
                lines.append(f'      UniqueId: {entry2.unique_id}')
                lines.append(f'      Position: ({entry2.position[0]:.2f}, {entry2.position[1]:.2f}, {entry2.position[2]:.2f})')
                lines.append(f'      Rotation: ({entry2.rotation[0]:.2f}, {entry2.rotation[1]:.2f}, {entry2.rotation[2]:.2f})')
                lines.append(f'      Flags: {entry2.flags}, DoodadSet: {entry2.doodad_set}, Scale: {entry2.scale}')
                lines.append('')

                # Add fix details if available
                if fix_info and 'removal_log' in fix_info:
                    removal_log = fix_info['removal_log']
                    if entry1.unique_id in removal_log:
                        log_entry = removal_log[entry1.unique_id]
                        lines.append(f'    ✗ REMOVED: Instance 1 (UniqueId: {entry1.unique_id})')
                        lines.append(f'      Reason: {log_entry["reason"]}')
                        lines.append(f'      Kept: Instance 2 (UniqueId: {log_entry["kept_id"]})')
                    elif entry2.unique_id in removal_log:
                        log_entry = removal_log[entry2.unique_id]
                        lines.append(f'    ✗ REMOVED: Instance 2 (UniqueId: {entry2.unique_id})')
                        lines.append(f'      Reason: {log_entry["reason"]}')
                        lines.append(f'      Kept: Instance 1 (UniqueId: {log_entry["kept_id"]})')
                    lines.append('')

            # Add ADT fix summary
            if fix_info:
                lines.append(f'  FIX SUMMARY:')
                lines.append(f'    Original placements: {fix_info["original_count"]}')
                lines.append(f'    Duplicates removed: {fix_info["removed_count"]}')
                lines.append(f'    Final placements: {fix_info["deduplicated_count"]}')
                lines.append(f'    Export path: {Path(fix_info["export_path"]).relative_to(self.paths["export"])}')

            lines.append('')

        lines.append('='*80)
        lines.append('END OF REPORT')
        lines.append('='*80)

        with open(report_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(lines))

        self.log(f'\n  Duplicate WMO report saved: {report_path}')

    def generate_log(self):
        """Generate final log file"""
        self.log('\n' + '='*80)
        self.log('STEP 16: Generating log file')
        self.log('='*80)

        log_path = Path(__file__).parent / 'resource_parser.log'

        # Summary section
        summary = [
            '='*80,
            'OPEN AZEROTH RESOURCE PARSER - EXTRACTION LOG',
            '='*80,
            '',
            'CONFIGURATION',
            '-'*80,
            f'ADT Path: {self.paths["adt"]}',
            f'Assets Source: {self.paths["assets_source"]}',
            f'Export Path: {self.paths["export"]}',
            f'Stock Asset List: {self.paths["wotlk_base_assets"]}',
            '',
            'SUMMARY',
            '-'*80,
            f'Total Custom Assets Required: {self.total_wmo_required + self.total_m2_required + self.total_texture_required:,}',
            f'  - WMO Files: {self.total_wmo_required:,}',
            f'  - M2/MDX Models: {self.total_m2_required:,}',
            f'  - BLP Textures: {self.total_texture_required:,}',
            '',
            'ASSET SOURCES',
            '-'*80,
            f'  - M2 Models from ADTs: {len(set().union(*self.adt_models.values()) if self.adt_models else set()):,}',
            f'  - WMO Files from ADTs: {len(self.adt_wmos):,}',
            f'  - M2 Doodads from WMOs: {len(self.wmo_doodads):,}',
            f'  - BLP Textures from ADTs (terrain): {len(self.adt_textures):,}',
            f'  - BLP Textures from WMOs: {len(self.wmo_textures):,}',
            f'  - M2 Models from Ground Effects (DBC): {len(self.ground_effect_models):,}',
            '',
            f'Ground Effect Validation:',
            f'  - ADT Ground Effect IDs Found: {len(self.adt_ground_effect_ids)}',
            f'  - Missing from WotLK DBC: {len(self.missing_ground_effect_ids)}',
        ]

        if self.missing_ground_effect_ids:
            if self.modern_ground_effect_ids:
                summary.append(f'  - Modern content IDs (genuinely missing): {len(self.modern_ground_effect_ids)}')
                summary.append(f'    ⚠️  These WILL show blue cubes - need DBC entries')
                sample_modern = sorted(self.modern_ground_effect_ids)[:10]
                summary.append(f'    Sample: {sample_modern}{"..." if len(self.modern_ground_effect_ids) > 10 else ""}')
            if self.bad_ground_effect_ids:
                summary.append(f'  - Junk legacy IDs (safe to ignore): {len(self.bad_ground_effect_ids)}')
                summary.append(f'    ℹ️  These are legacy Blizzard ADT data, not in any client')
                sample_junk = sorted(self.bad_ground_effect_ids)[:10]
                summary.append(f'    Sample: {sample_junk}{"..." if len(self.bad_ground_effect_ids) > 10 else ""}')

        # Calculate missing assets by type
        still_missing_all = set()

        # Build normalized sets for efficient lookups
        already_exported_normalized = {a.upper().replace('\\', '/') for a in self.already_exported}
        found_assets_normalized = {fa.upper().replace('\\', '/') for fa in self.found_assets.keys()}

        # Collect all missing assets from each phase
        # Phase 1: Missing WMOs (only check custom WMOs from required_custom)
        missing_wmos = []
        for asset in self.required_custom:
            normalized = asset.upper().replace('\\', '/')
            if normalized.endswith('.WMO'):
                if normalized not in already_exported_normalized and normalized not in found_assets_normalized:
                    missing_wmos.append(asset)
                    still_missing_all.add(normalized)

        # Phase 2: Missing M2 models (only check custom M2s from required_custom)
        missing_m2s = []
        for asset in self.required_custom:
            normalized = asset.upper().replace('\\', '/')
            if normalized.endswith('.M2') or normalized.endswith('.MDX'):
                if normalized not in already_exported_normalized and normalized not in found_assets_normalized:
                    missing_m2s.append(asset)
                    still_missing_all.add(normalized)

        # Phase 3: Missing textures (not in other categories)
        missing_textures = []
        for asset in self.required_custom:
            normalized = asset.upper().replace('\\', '/')
            if normalized not in still_missing_all and normalized not in set(fa.upper().replace('\\', '/') for fa in self.found_assets.keys()):
                if asset.lower().endswith('.blp'):
                    missing_textures.append(asset)

        # Ground effects (missing IDs, excluding junk)
        # Only count genuinely missing IDs (modern content), not junk legacy ADT data
        genuinely_missing_ground_effects = self.missing_ground_effect_ids - self.bad_ground_effect_ids
        missing_ground_effects = len(genuinely_missing_ground_effects)

        # Calculate total custom assets from cumulative phase counts
        total_custom_required = self.total_wmo_required + self.total_m2_required + self.total_texture_required

        summary.extend([
            '',
            f'Stock Assets (in base client): {self.total_stock_assets:,}',
            f'Already Exported: {len(self.already_exported):,}',
            '',
            f'Assets Found and Extracted: {len(self.extracted):,}',
            f'Assets Still Missing: {len(missing_wmos) + len(missing_m2s) + len(missing_textures):,}',
            '',
        ])

        # Detailed missing assets by type section
        summary.append('')
        summary.append('')
        summary.append('MISSING ASSETS BY TYPE')
        summary.append('='*80)
        summary.append('')

        # WMO Files
        summary.append(f'WMO FILES ({len(missing_wmos):,} missing)')
        summary.append('-'*80)
        if missing_wmos:
            for wmo in sorted(missing_wmos):
                parent_chain = self.format_parent_chain(wmo)
                summary.append(f'  {wmo}')
                summary.append(f'    ↳ {parent_chain}')
        else:
            summary.append('  ✅ All WMO files found!')
        summary.append('')

        # M2/MDX Models
        summary.append(f'M2/MDX MODELS ({len(missing_m2s):,} missing)')
        summary.append('-'*80)
        if missing_m2s:
            for m2 in sorted(missing_m2s):
                parent_chain = self.format_parent_chain(m2)
                summary.append(f'  {m2}')
                summary.append(f'    ↳ {parent_chain}')
        else:
            summary.append('  ✅ All M2 models found!')
        summary.append('')

        # BLP Textures
        summary.append(f'BLP TEXTURES ({len(missing_textures):,} missing)')
        summary.append('-'*80)
        if missing_textures:
            for texture in sorted(missing_textures):
                parent_chain = self.format_parent_chain(texture)
                summary.append(f'  {texture}')
                summary.append(f'    ↳ {parent_chain}')
        else:
            summary.append('  ✅ All textures found!')
        summary.append('')

        # Ground Effect IDs (only show genuinely missing, not junk legacy IDs)
        summary.append(f'GROUND EFFECT IDs ({missing_ground_effects:,} genuinely missing from DBC)')
        summary.append('-'*80)
        if genuinely_missing_ground_effects:
            summary.append('  Modern content missing from WotLK DBC (will show blue cubes):')
            for effect_id in sorted(genuinely_missing_ground_effects):
                summary.append(f'    - Effect ID: {effect_id}')
        else:
            summary.append('  ✅ All ground effect IDs found in DBC!')
            if self.bad_ground_effect_ids:
                summary.append(f'  ℹ️  ({len(self.bad_ground_effect_ids)} junk legacy IDs ignored)')
        summary.append('')
        summary.append('')

        # Missing assets by area (comprehensive view)
        # Build area analysis including both regular assets and ground effects
        area_analysis_log = {}  # {area_name: {adt_path: {asset_type: [assets]}}}

        # Add regular missing assets
        for asset in still_missing_all:
            # Get parent chain
            chain = []
            current = asset
            while current in self.asset_parents:
                parent = self.asset_parents[current]
                chain.append(parent)
                current = parent

            area_name = None
            adt_path = None

            # Extract area and ADT from chain
            for item in chain:
                if item.startswith("Area_"):
                    area_name = item.replace("Area_", "")
                elif item.upper().endswith('.ADT'):
                    adt_path = item

            if area_name and adt_path:
                if area_name not in area_analysis_log:
                    area_analysis_log[area_name] = {}
                if adt_path not in area_analysis_log[area_name]:
                    area_analysis_log[area_name][adt_path] = {'M2': [], 'WMO': [], 'BLP': [], 'Ground Effects': []}

                # Categorize by asset type
                if asset.upper().endswith(('.M2', '.MDX')):
                    area_analysis_log[area_name][adt_path]['M2'].append(asset)
                elif asset.upper().endswith('.WMO'):
                    area_analysis_log[area_name][adt_path]['WMO'].append(asset)
                elif asset.upper().endswith('.BLP'):
                    area_analysis_log[area_name][adt_path]['BLP'].append(asset)

        # Add missing ground effect IDs by ADT (exclude junk legacy IDs)
        if genuinely_missing_ground_effects:
            for effect_id in genuinely_missing_ground_effects:
                if effect_id in self.ground_effect_to_adts:
                    for adt_path in self.ground_effect_to_adts[effect_id]:
                        area_name = self._get_area_name(adt_path)

                        if area_name not in area_analysis_log:
                            area_analysis_log[area_name] = {}
                        if adt_path not in area_analysis_log[area_name]:
                            area_analysis_log[area_name][adt_path] = {'M2': [], 'WMO': [], 'BLP': [], 'Ground Effects': []}

                        area_analysis_log[area_name][adt_path]['Ground Effects'].append(effect_id)

        # Display organized by area (aggregated, not per-ADT)
        if area_analysis_log:
            summary.append('')
            summary.append('')
            summary.append('MISSING ASSETS BY AREA')
            summary.append('='*80)
            summary.append('')

            for area_name in sorted(area_analysis_log.keys()):
                # Aggregate all missing assets for this area
                area_m2s = set()
                area_wmos = set()
                area_blps = set()
                area_ground_effects = set()

                for adt_path, missing_data in area_analysis_log[area_name].items():
                    area_m2s.update(missing_data['M2'])
                    area_wmos.update(missing_data['WMO'])
                    area_blps.update(missing_data['BLP'])
                    area_ground_effects.update(missing_data['Ground Effects'])

                # Only show area if it has missing content
                has_missing = area_m2s or area_wmos or area_blps or area_ground_effects

                if has_missing:
                    summary.append(f'AREA: {area_name}')
                    summary.append('-'*80)

                    if area_m2s:
                        summary.append(f'  M2 models: {len(area_m2s)} missing')
                        for m2 in sorted(area_m2s)[:10]:  # Show first 10
                            summary.append(f'    - {m2}')
                        if len(area_m2s) > 10:
                            summary.append(f'    ... and {len(area_m2s) - 10} more')
                        summary.append('')

                    if area_wmos:
                        summary.append(f'  WMO files: {len(area_wmos)} missing')
                        for wmo in sorted(area_wmos)[:10]:
                            summary.append(f'    - {wmo}')
                        if len(area_wmos) > 10:
                            summary.append(f'    ... and {len(area_wmos) - 10} more')
                        summary.append('')

                    if area_blps:
                        summary.append(f'  BLP textures: {len(area_blps)} missing')
                        for blp in sorted(area_blps)[:10]:
                            summary.append(f'    - {blp}')
                        if len(area_blps) > 10:
                            summary.append(f'    ... and {len(area_blps) - 10} more')
                        summary.append('')

                    if area_ground_effects:
                        effect_ids = sorted(area_ground_effects)
                        summary.append(f'  Ground effect IDs: {len(area_ground_effects)} missing from DBC')
                        summary.append(f'    {effect_ids}')
                        summary.append('')

                    summary.append('')
        else:
            summary.append('')
            summary.append('')
            summary.append('MISSING ASSETS BY AREA')
            summary.append('='*80)
            summary.append('')
            summary.append('  ✅ NO MISSING ASSETS - All required assets found!')
            summary.append('')

        summary.append('')
        summary.append('='*80)
        summary.append('DETAILED EXECUTION LOG')
        summary.append('='*80)
        summary.append('')

        # Write log file
        with open(log_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(summary))
            f.write('\n'.join(self.log_lines))

        self.log(f'\nLog file saved: {log_path}')

        return log_path

    def run(self):
        """
        Execute full extraction workflow (Three-Phase Approach).

        Phase 1: WMO Hunting - Extract WMO files first
        Phase 2: M2 Hunting - Extract M2 models (from ADTs, ground effects, and Phase 1 WMOs)
        Phase 3: Texture/Skin Hunting - Extract textures and skins from Phase 2 M2s
        """
        self.log('='*80)
        self.log('OPEN AZEROTH RESOURCE PARSER (Three-Phase Extraction)')
        self.log('='*80)

        try:
            # Build folder cache for fast asset lookups
            assets_dir = Path(self.paths['assets_source'])
            self.build_folder_cache(assets_dir)

            # ============================================================
            # PHASE 1: WMO HUNTING
            # ============================================================
            self.log('\n' + '='*80)
            self.log('PHASE 1: WMO HUNTING')
            self.log('='*80)

            # Parse ADTs (gets both M2s and WMOs, but only process WMOs in this phase)
            self.parse_adts()
            self.detect_duplicate_wmos()  # Optional: Detect duplicate WMO placements

            # Load stock assets list
            self.load_stock_assets()

            # Process WMOs only
            self.all_dependencies.clear()
            self.all_dependencies.update(self.adt_wmos)

            self.filter_stock_assets(step_number=3, asset_type="WMO files")
            self.total_wmo_required = len(self.required_custom)  # Save WMO count
            self.find_assets(step_number=4, asset_type="WMO files")
            self.extract_assets(step_number=5, asset_type="WMO files")
            self.report_missing_assets(asset_type="WMO files")

            # ============================================================
            # PHASE 2: M2 HUNTING
            # ============================================================
            self.log('\n' + '='*80)
            self.log('PHASE 2: M2 HUNTING')
            self.log('='*80)

            # Parse ground effects
            self.parse_ground_effects()

            # Parse exported WMOs from Phase 1 for M2 doodads
            self.parse_exported_wmos()

            # Now process all M2 sources: ADTs + ground effects + WMO doodads
            self.all_dependencies.clear()
            # Add M2s from ADTs
            for models in self.adt_models.values():
                self.all_dependencies.update(models)
            # Add ground effect doodads (only those referenced by ADTs)
            ground_effects_from_adts = set()
            for effect_id, models in self.ground_effect_id_to_models.items():
                ground_effects_from_adts.update(models)
            self.all_dependencies.update(ground_effects_from_adts)
            # Add WMO doodads
            self.all_dependencies.update(self.wmo_doodads)

            self.required_custom.clear()
            self.filter_stock_assets(step_number=8, asset_type="M2 models")
            self.total_m2_required = len(self.required_custom)  # Save M2 count
            self.find_assets(step_number=9, asset_type="M2 models")
            self.extract_assets(step_number=10, asset_type="M2 models")
            self.report_missing_assets(asset_type="M2 models")

            # ============================================================
            # PHASE 3: TEXTURE/SKIN HUNTING
            # ============================================================
            self.log('\n' + '='*80)
            self.log('PHASE 3: TEXTURE/SKIN HUNTING')
            self.log('='*80)

            # Parse exported M2s from Phase 2 for textures
            self.parse_exported_m2s()

            # all_dependencies already updated by parse_exported_m2s()
            # but we need to reset for Phase 3
            self.required_custom.clear()
            self.filter_stock_assets(step_number=12, asset_type="textures")
            self.total_texture_required = len(self.required_custom)  # Save texture count
            self.find_assets(step_number=13, asset_type="textures")
            self.extract_assets(step_number=14, asset_type="textures")
            self.report_missing_assets(asset_type="textures")

            # ============================================================
            # REPORTING
            # ============================================================
            self.analyze_missing_by_area()
            self.generate_duplicate_wmo_report()  # Generate duplicate WMO report if enabled
            log_path = self.generate_log()

            self.log('\n' + '='*80)
            self.log('EXTRACTION COMPLETE')
            self.log('='*80)
            self.log(f'Log File: {log_path}')
            self.log('='*80)

        except Exception as e:
            self.log(f'\nERROR: {str(e)}')
            import traceback
            self.log(traceback.format_exc())
            raise


def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Open Azeroth Resource Parser - Extract custom assets for patches'
    )
    parser.add_argument(
        '--config',
        type=Path,
        default=None,
        help='Path to config.json (default: config.json in script directory)'
    )

    args = parser.parse_args()

    # Run parser
    rp = ResourceParser(config_path=args.config)
    rp.run()


if __name__ == '__main__':
    main()
