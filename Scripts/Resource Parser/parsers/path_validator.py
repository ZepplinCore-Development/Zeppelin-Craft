#!/usr/bin/env python3
"""
Path Validator for WoW Resource Parser
Checks for path mismatches between ADT references and actual asset locations.

Detects issues like:
- Case sensitivity mismatches (Windows vs Linux)
- Slash direction (forward vs backslash)
- Spaces in paths
- Files in wrong directories
- Missing associated files (.skin, .blp)
"""

import sys
from pathlib import Path
from typing import Dict, List, Set, Tuple


class PathValidator:
    """Validates model paths between ADT references and filesystem."""

    def __init__(self, adt_models_file: Path, asset_base_dir: Path):
        self.adt_models_file = adt_models_file
        self.asset_base_dir = asset_base_dir
        self.adt_models: Set[str] = set()
        self.asset_files: Dict[str, List[Path]] = {}  # model_name -> [paths]

    def load_adt_models(self) -> None:
        """Load model list from ADT parser output."""
        print(f"Loading ADT model references from: {self.adt_models_file}")

        with open(self.adt_models_file, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    # Normalize: uppercase, backslash
                    normalized = line.replace('/', '\\').upper()
                    self.adt_models.add(normalized)

        print(f"  Loaded {len(self.adt_models)} unique model references")

    def scan_asset_directory(self) -> None:
        """Recursively scan asset directory for all .m2 files."""
        print(f"\nScanning asset directory: {self.asset_base_dir}")

        # Find all .m2 files
        m2_files = list(self.asset_base_dir.rglob("*.[mM]2"))
        print(f"  Found {len(m2_files)} .m2 files")

        # Build lookup by filename (case-insensitive)
        for m2_path in m2_files:
            # Get relative path from asset base
            try:
                rel_path = m2_path.relative_to(self.asset_base_dir)
                # Normalize for comparison
                normalized = str(rel_path).replace('/', '\\').upper()

                # Also store by just filename for finding relocated files
                filename = m2_path.name.upper()

                if filename not in self.asset_files:
                    self.asset_files[filename] = []
                self.asset_files[filename].append((normalized, m2_path))

            except ValueError:
                # Path not relative to base (shouldn't happen)
                pass

    def validate_paths(self) -> Dict[str, any]:
        """
        Validate all ADT model references against asset directory.

        Returns dict with:
        - exact_matches: Models with correct paths
        - case_mismatches: Files exist but wrong case
        - slash_mismatches: Files exist but wrong slash direction
        - relocated_files: Files exist but in wrong directory
        - missing_files: Files don't exist anywhere
        - orphan_assets: Assets not referenced by any ADT
        """
        print("\nValidating paths...")

        results = {
            'exact_matches': [],
            'case_mismatches': [],
            'slash_mismatches': [],
            'relocated_files': [],
            'missing_files': [],
            'path_space_issues': [],
        }

        for adt_model in sorted(self.adt_models):
            # Expected path in filesystem
            expected_fs_path = self.asset_base_dir / adt_model.replace('\\', '/')

            # Check 1: Exact match (case-insensitive on Windows, case-sensitive on Linux)
            if expected_fs_path.exists():
                results['exact_matches'].append(adt_model)
                continue

            # Check 2: Case mismatch - file exists but different case
            # Try lowercase version
            lowercase_path = self.asset_base_dir / adt_model.replace('\\', '/').lower()
            if lowercase_path.exists():
                results['case_mismatches'].append({
                    'adt_reference': adt_model,
                    'expected': str(expected_fs_path),
                    'actual': str(lowercase_path)
                })
                continue

            # Check 3: File exists somewhere but in different location
            filename = Path(adt_model).name.upper()
            if filename in self.asset_files:
                # Found file(s) with this name
                for normalized_path, actual_path in self.asset_files[filename]:
                    if normalized_path != adt_model:
                        # Path doesn't match ADT reference
                        results['relocated_files'].append({
                            'adt_reference': adt_model,
                            'expected': adt_model,
                            'actual': normalized_path,
                            'actual_path': str(actual_path)
                        })
                        break
                else:
                    # Filename matches exactly, must be exact match we already found
                    results['exact_matches'].append(adt_model)
                continue

            # Check 4: Space in path issues (e.g., "PASSIVE DOODADS" vs "PASSIVEDOODADS")
            if ' ' in adt_model:
                # Try without spaces
                no_space = adt_model.replace(' ', '')
                no_space_path = self.asset_base_dir / no_space.replace('\\', '/')
                if no_space_path.exists():
                    results['path_space_issues'].append({
                        'adt_reference': adt_model,
                        'expected_with_space': str(expected_fs_path),
                        'actual_no_space': str(no_space_path)
                    })
                    continue

            # Check 5: Completely missing
            results['missing_files'].append(adt_model)

        return results

    def find_orphan_assets(self, validated_results: Dict) -> List[str]:
        """Find assets that exist but aren't referenced by any ADT."""
        print("\nFinding orphan assets (not referenced by ADTs)...")

        # Get all models that were found (exact matches + mismatches)
        referenced_files = set()
        referenced_files.update(validated_results['exact_matches'])

        for item in validated_results['case_mismatches']:
            referenced_files.add(item['actual'].upper().replace('/', '\\'))

        for item in validated_results['relocated_files']:
            referenced_files.add(item['actual'])

        for item in validated_results['path_space_issues']:
            # Normalize the actual path
            actual_rel = Path(item['actual_no_space']).relative_to(self.asset_base_dir)
            referenced_files.add(str(actual_rel).upper().replace('/', '\\'))

        # Compare against all asset files
        orphans = []
        for filename, paths in self.asset_files.items():
            for normalized_path, actual_path in paths:
                if normalized_path not in referenced_files:
                    orphans.append(str(actual_path))

        return orphans

    def check_associated_files(self, model_path: str) -> Dict[str, bool]:
        """Check if associated .skin and .blp files exist for a model."""
        model_full_path = self.asset_base_dir / model_path.replace('\\', '/')

        # Check for .skin files (model00.skin, model01.skin, etc.)
        base_name = model_full_path.stem  # Remove .m2
        parent_dir = model_full_path.parent

        results = {
            'has_skin': False,
            'has_texture': False,
            'skin_files': [],
            'texture_files': []
        }

        # Look for .skin files
        for i in range(10):  # Check model00.skin through model09.skin
            skin_file = parent_dir / f"{base_name}{i:02d}.skin"
            if skin_file.exists():
                results['has_skin'] = True
                results['skin_files'].append(str(skin_file))

        # Look for .blp texture files (usually in same directory or texture subdirectory)
        blp_files = list(parent_dir.glob("*.blp")) + list(parent_dir.glob("*.BLP"))
        if blp_files:
            results['has_texture'] = True
            results['texture_files'] = [str(f) for f in blp_files[:5]]  # First 5

        return results

    def print_report(self, results: Dict, show_orphans: bool = False) -> None:
        """Print validation report."""
        total = len(self.adt_models)

        print("\n" + "="*80)
        print("PATH VALIDATION REPORT")
        print("="*80)

        print(f"\nTotal ADT Model References: {total}")
        print(f"  ✅ Exact Matches:           {len(results['exact_matches'])} ({len(results['exact_matches'])/total*100:.1f}%)")
        print(f"  ⚠️  Case Mismatches:         {len(results['case_mismatches'])}")
        print(f"  ⚠️  Relocated Files:         {len(results['relocated_files'])}")
        print(f"  ⚠️  Space Path Issues:       {len(results['path_space_issues'])}")
        print(f"  ❌ Missing Files:           {len(results['missing_files'])}")

        # Case mismatches
        if results['case_mismatches']:
            print("\n" + "-"*80)
            print("CASE MISMATCHES (File exists but wrong case)")
            print("-"*80)
            for item in results['case_mismatches']:
                print(f"\nADT Reference: {item['adt_reference']}")
                print(f"Expected:      {item['expected']}")
                print(f"Actual:        {item['actual']}")

        # Relocated files
        if results['relocated_files']:
            print("\n" + "-"*80)
            print("RELOCATED FILES (File exists but in wrong directory)")
            print("-"*80)
            for item in results['relocated_files'][:10]:  # Show first 10
                print(f"\nADT Reference: {item['adt_reference']}")
                print(f"Expected:      {item['expected']}")
                print(f"Actual:        {item['actual']}")
                print(f"Full Path:     {item['actual_path']}")

            if len(results['relocated_files']) > 10:
                print(f"\n... and {len(results['relocated_files']) - 10} more relocated files")

        # Space issues
        if results['path_space_issues']:
            print("\n" + "-"*80)
            print("SPACE IN PATH ISSUES")
            print("-"*80)
            for item in results['path_space_issues']:
                print(f"\nADT Reference:      {item['adt_reference']}")
                print(f"Expected (space):   {item['expected_with_space']}")
                print(f"Actual (no space):  {item['actual_no_space']}")

        # Missing files
        if results['missing_files']:
            print("\n" + "-"*80)
            print("MISSING FILES (Not found anywhere)")
            print("-"*80)
            for model in results['missing_files']:
                print(f"  {model}")

                # Check for associated files to help diagnose
                assoc = self.check_associated_files(model)
                if assoc['has_skin'] or assoc['has_texture']:
                    print(f"    Note: Found associated files (textures/skins) - model may have wrong name")

        # Orphans
        if show_orphans:
            orphans = self.find_orphan_assets(results)
            print("\n" + "-"*80)
            print(f"ORPHAN ASSETS (In asset dir but not referenced by ADTs)")
            print("-"*80)
            print(f"Total: {len(orphans)}")
            if orphans:
                print("\nFirst 20 orphans:")
                for orphan in sorted(orphans)[:20]:
                    print(f"  {orphan}")
                if len(orphans) > 20:
                    print(f"\n... and {len(orphans) - 20} more orphan assets")


def main():
    if len(sys.argv) < 3:
        print("Usage: python3 path_validator.py <adt_models.txt> <asset_directory> [--show-orphans]")
        print("\nExample:")
        print('  python3 path_validator.py oa_all_models.txt "/path/to/OA Assets from Parser"')
        print("\nOptions:")
        print("  --show-orphans    Show assets not referenced by any ADT")
        sys.exit(1)

    adt_models_file = Path(sys.argv[1])
    asset_base_dir = Path(sys.argv[2])
    show_orphans = '--show-orphans' in sys.argv

    if not adt_models_file.exists():
        print(f"Error: ADT models file not found: {adt_models_file}")
        sys.exit(1)

    if not asset_base_dir.exists():
        print(f"Error: Asset directory not found: {asset_base_dir}")
        sys.exit(1)

    # Run validation
    validator = PathValidator(adt_models_file, asset_base_dir)
    validator.load_adt_models()
    validator.scan_asset_directory()
    results = validator.validate_paths()
    validator.print_report(results, show_orphans=show_orphans)

    print("\n" + "="*80)
    print("Validation complete!")
    print("="*80)


if __name__ == "__main__":
    main()
