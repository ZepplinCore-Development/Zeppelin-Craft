#!/usr/bin/env python3
"""
GroundEffectDoodad.dbc Parser
Reads M2 model references from GroundEffectDoodad.dbc for ground scatter models.

Ground effect doodads are small decorative M2 models scattered across terrain:
- Bushes, flowers, grass clumps
- Small rocks, pebbles
- Ivy, ferns, vines
- Ground cover vegetation

These are NOT referenced in ADT files - they're defined in GroundEffectDoodad.dbc
and GroundEffectTexture.dbc, which map terrain textures to scattered doodads.
"""

import struct
from pathlib import Path
from typing import Dict, Set, List, Optional
from .dbc_binary_reader import DBCReader


class GroundEffectDoodadReader:
    """
    GroundEffectDoodad.dbc reader for WoW 3.3.5a

    Structure (based on WoWDev.wiki):
    - ID (uint32) - Ground effect doodad ID
    - Filename (string_ref) - Path to M2 model file
    - ... more fields (flags, etc.)

    Purpose: Extract all M2 models used for ground scatter effects
    """

    def __init__(self, dbc_path: str = None):
        """
        Initialize GroundEffectDoodad.dbc reader.

        Args:
            dbc_path: Path to GroundEffectDoodad.dbc file
        """
        if dbc_path is None:
            # Default to Open Azeroth DBC location
            dbc_path = '/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/DBFilesClient/GroundEffectDoodad.dbc'

        self.dbc_path = Path(dbc_path)
        self.dbc = DBCReader(str(dbc_path))
        self.dbc.read()

        # {doodad_id: {'filename': str, 'flags': int}}
        self.doodads = {}

        # Set of all M2 model paths
        self.model_paths = set()

        self._parse_doodads()

    def _parse_doodads(self):
        """
        Parse GroundEffectDoodad records.

        GroundEffectDoodad.dbc structure (WoW 3.3.5a):
        Field offsets (each field is 4 bytes):
        - Offset 0: ID (uint32) - Doodad ID
        - Offset 4: Filename (string_ref) - Offset into string block for M2 path
        - Offset 8+: Additional fields (flags, scale, etc.)
        """
        for i in range(self.dbc.record_count):
            record = self.dbc.records[i]

            # Read doodad ID
            doodad_id = struct.unpack('<I', record[0:4])[0]

            # Read filename string reference (offset into string block)
            filename_offset = struct.unpack('<I', record[4:8])[0]
            filename = self.dbc.read_string(filename_offset)

            # Read flags (if available)
            flags = struct.unpack('<I', record[8:12])[0] if len(record) > 8 else 0

            # Skip empty entries
            if not filename or filename.strip() == '':
                continue

            # Normalize path (convert to uppercase, use backslashes)
            normalized_path = filename.upper().replace('/', '\\')

            # Store doodad info
            self.doodads[doodad_id] = {
                'filename': normalized_path,
                'flags': flags,
                'original': filename
            }

            # Add to model paths set
            self.model_paths.add(normalized_path)

    def get_all_models(self) -> Set[str]:
        """
        Get all M2 model paths referenced by ground effect doodads.

        Returns:
            Set of normalized M2 model paths (uppercase, backslashes)
        """
        return self.model_paths.copy()

    def get_doodad_count(self) -> int:
        """Get total number of ground effect doodads."""
        return len(self.doodads)

    def get_model_count(self) -> int:
        """Get total number of unique M2 models."""
        return len(self.model_paths)

    def print_summary(self):
        """Print summary of ground effect doodads."""
        print(f'\n{"="*80}')
        print(f'GROUND EFFECT DOODAD SUMMARY')
        print(f'{"="*80}')
        print(f'DBC File: {self.dbc_path}')
        print(f'Total doodad entries: {self.dbc.record_count}')
        print(f'Valid doodads: {len(self.doodads)}')
        print(f'Unique M2 models: {len(self.model_paths)}')
        print(f'{"="*80}\n')

    def list_models(self, limit: int = 20):
        """
        List ground effect M2 models (for debugging).

        Args:
            limit: Maximum number of models to print (0 = unlimited)
        """
        print(f'\nGround Effect M2 Models:')
        print(f'{"="*80}')

        models = sorted(self.model_paths)
        display_models = models[:limit] if limit > 0 else models

        for model in display_models:
            print(f'  {model}')

        if limit > 0 and len(models) > limit:
            print(f'  ... and {len(models) - limit} more')

        print(f'{"="*80}')


class GroundEffectTextureReader:
    """
    GroundEffectTexture.dbc reader for WoW 3.3.5a

    Structure:
    - ID (uint32)
    - DoodadID[4] (4x uint32) - References to GroundEffectDoodad.dbc
    - Density (uint32) - Spawn density
    - TerrainType (uint32)

    Purpose: Maps terrain textures to ground effect doodads
    Links terrain types to specific scatter models
    """

    def __init__(self, dbc_path: str = None):
        """
        Initialize GroundEffectTexture.dbc reader.

        Args:
            dbc_path: Path to GroundEffectTexture.dbc file
        """
        if dbc_path is None:
            # Default to Open Azeroth DBC location
            dbc_path = '/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/DBFilesClient/GroundEffectTexture.dbc'

        self.dbc_path = Path(dbc_path)
        self.dbc = DBCReader(str(dbc_path))
        self.dbc.read()

        # {texture_id: {'doodads': [id1, id2, ...], 'density': int, 'terrain': int}}
        self.textures = {}

        # Set of all doodad IDs referenced
        self.doodad_ids = set()

        self._parse_textures()

    def _parse_textures(self):
        """
        Parse GroundEffectTexture records.

        GroundEffectTexture.dbc structure (WoW 3.3.5a):
        - Offset 0: ID (uint32)
        - Offset 4-19: DoodadID[4] (4x uint32) - Up to 4 doodad references
        - Offset 20+: Density, terrain type, etc.
        """
        for i in range(self.dbc.record_count):
            record = self.dbc.records[i]

            # Read texture ID
            texture_id = struct.unpack('<I', record[0:4])[0]

            # Read 4 doodad IDs
            doodad_ids = []
            for j in range(4):
                offset = 4 + (j * 4)
                if len(record) > offset + 3:
                    doodad_id = struct.unpack('<I', record[offset:offset+4])[0]
                    if doodad_id > 0:  # Skip 0 (no doodad)
                        doodad_ids.append(doodad_id)
                        self.doodad_ids.add(doodad_id)

            # Read density (if available)
            density = struct.unpack('<I', record[20:24])[0] if len(record) > 20 else 0

            # Read terrain type (if available)
            terrain = struct.unpack('<I', record[24:28])[0] if len(record) > 24 else 0

            # Store ALL texture entries, even if they have no doodads
            # Textures with doodadID=0 are valid (no scatter objects, just visual effects)
            self.textures[texture_id] = {
                'doodads': doodad_ids,  # Can be empty list
                'density': density,
                'terrain': terrain
            }

    def get_all_doodad_ids(self) -> Set[int]:
        """Get all doodad IDs referenced by textures."""
        return self.doodad_ids.copy()

    def get_texture_count(self) -> int:
        """Get number of texture entries."""
        return len(self.textures)

    def print_summary(self):
        """Print summary of ground effect textures."""
        print(f'\n{"="*80}')
        print(f'GROUND EFFECT TEXTURE SUMMARY')
        print(f'{"="*80}')
        print(f'DBC File: {self.dbc_path}')
        print(f'Total texture entries: {self.dbc.record_count}')
        print(f'Textures with doodads: {len(self.textures)}')
        print(f'Unique doodad IDs referenced: {len(self.doodad_ids)}')
        print(f'{"="*80}\n')


def parse_ground_effects(doodad_dbc_path: str = None, texture_dbc_path: str = None, verbose: bool = False) -> Set[str]:
    """
    Parse GroundEffectDoodad.dbc and GroundEffectTexture.dbc to extract all M2 models.

    Args:
        doodad_dbc_path: Path to GroundEffectDoodad.dbc (optional)
        texture_dbc_path: Path to GroundEffectTexture.dbc (optional)
        verbose: If True, print detailed summaries (default: False)

    Returns:
        Set of all M2 model paths referenced by ground effects
    """
    # Parse ground effect doodads
    doodad_reader = GroundEffectDoodadReader(doodad_dbc_path)

    # Parse ground effect textures (validates doodad references)
    texture_reader = GroundEffectTextureReader(texture_dbc_path)

    # Print summaries only if verbose
    if verbose:
        doodad_reader.print_summary()
        texture_reader.print_summary()

        # Validate: check if all texture doodad IDs exist in doodad table
        missing_doodads = texture_reader.get_all_doodad_ids() - set(doodad_reader.doodads.keys())
        if missing_doodads:
            print(f'⚠️  Warning: {len(missing_doodads)} doodad IDs in GroundEffectTexture not found in GroundEffectDoodad')
            print(f'   Missing IDs: {sorted(missing_doodads)[:10]}{"..." if len(missing_doodads) > 10 else ""}')

    # Return all M2 model paths
    return doodad_reader.get_all_models()


def main():
    """Test ground effect DBC parsers."""
    print('Testing GroundEffectDoodad.dbc and GroundEffectTexture.dbc readers...\n')

    # Parse both DBCs (with verbose output for testing)
    models = parse_ground_effects(verbose=True)

    print(f'\nExtracted {len(models)} unique M2 models from ground effects')

    # Show sample models
    print(f'\nSample ground effect models:')
    print(f'{"="*80}')
    for model in sorted(models)[:20]:
        print(f'  {model}')
    if len(models) > 20:
        print(f'  ... and {len(models) - 20} more')
    print(f'{"="*80}')

    # Check for Lost Isles models
    lost_isles_models = [m for m in models if 'LOSTISLES' in m or 'LI_' in m]
    if lost_isles_models:
        print(f'\nLost Isles ground effects found: {len(lost_isles_models)}')
        for model in sorted(lost_isles_models):
            print(f'  {model}')
    else:
        print(f'\n⚠️  No Lost Isles ground effects found in GroundEffectDoodad.dbc')
        print(f'   This may explain blue cubes in Lost Isles zone')


if __name__ == '__main__':
    main()
