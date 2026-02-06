#!/usr/bin/env python3
"""
Per-ADT Missing Model Logger
Generates detailed reports showing which models are missing for each ADT file.

This helps identify exactly which map tiles have blue square issues and
what models need to be added to fix them.
"""

from pathlib import Path
from typing import Set, Dict, List, Optional
import json

try:
    from dbc_reader import DBCAreaReader
except ImportError:
    DBCAreaReader = None


class ADTMissingLogger:
    """Tracks and reports missing models per ADT file."""

    def __init__(self, stock_registry=None, use_dbc_areas=True):
        self.stock_registry = stock_registry
        self.adt_models = {}  # {adt_path: set(model_paths)}
        self.adt_missing = {}  # {adt_path: set(missing_model_paths)}
        self.model_to_adts = {}  # {model_path: set(adt_paths)}

        # DBC area name integration
        self.dbc_reader: Optional[DBCAreaReader] = None
        if use_dbc_areas and DBCAreaReader is not None:
            try:
                self.dbc_reader = DBCAreaReader()
                self.dbc_reader.connect()
                print('✅ DBC area reader initialized - reports will include zone names')
            except Exception as e:
                print(f'⚠️  Could not initialize DBC area reader: {e}')
                print('   Reports will use coordinates only.')
                self.dbc_reader = None

    def register_adt_models(self, adt_path: str, models: Set[str]):
        """Register models for a specific ADT file."""
        self.adt_models[adt_path] = models

        # Build reverse index (which ADTs use each model)
        for model in models:
            if model not in self.model_to_adts:
                self.model_to_adts[model] = set()
            self.model_to_adts[model].add(adt_path)

    def check_missing_models(self, available_models: Set[str]):
        """
        Check which models are missing for each ADT.

        Args:
            available_models: Set of model paths that exist in custom asset dirs
        """
        for adt_path, models in self.adt_models.items():
            missing = set()

            for model in models:
                # Skip if in stock client
                if self.stock_registry and self.stock_registry.is_stock(model):
                    continue

                # Check if available in custom assets
                if model.upper() not in {m.upper() for m in available_models}:
                    missing.add(model)

            if missing:
                self.adt_missing[adt_path] = missing

    def generate_per_adt_report(self, output_path: Path):
        """
        Generate detailed report of missing models per ADT.

        Format:
        # Missing Models by ADT

        ## Azeroth_32_45.adt
        **Area**: Eastern Kingdoms [32,45]  (or Lost Isles (Kalimdor 43,12) if DBC available)
        - CREATURE/BEAR/BEAR.M2
        - WORLD/EXPANSION01/DOODADS/TREE01.M2

        ## Kalimdor_12_34.adt
        - CREATURE/BIRD/BIRD.M2
        """
        with open(output_path, 'w') as f:
            f.write('# Missing Models by ADT\n\n')
            f.write('This report shows which models are missing for each ADT file.\n')
            f.write('Use this to diagnose blue square issues on specific map tiles.\n\n')

            if not self.adt_missing:
                f.write('✅ **No missing models!** All ADT dependencies are satisfied.\n')
                return

            f.write(f'**Total ADTs with missing models**: {len(self.adt_missing)}\n\n')
            f.write('---\n\n')

            # Sort by ADT filename for easier navigation
            sorted_adts = sorted(self.adt_missing.keys(), key=lambda x: Path(x).name)

            for adt_path in sorted_adts:
                missing_models = sorted(self.adt_missing[adt_path])
                adt_name = Path(adt_path).name

                f.write(f'## {adt_name}\n\n')
                f.write(f'**File**: `{adt_path}`\n')

                # Add area name if DBC reader is available
                if self.dbc_reader:
                    area_name = self.dbc_reader.get_area_name_for_adt(adt_path)
                    f.write(f'**Area**: {area_name}\n')

                f.write(f'**Missing models**: {len(missing_models)}\n\n')

                for model in missing_models:
                    f.write(f'- `{model}`\n')

                f.write('\n')

        print(f'✅ Per-ADT missing model report saved to: {output_path}')

    def generate_per_model_report(self, output_path: Path):
        """
        Generate report organized by missing model (showing which ADTs use it).

        Format:
        # Missing Models by Usage

        ## CREATURE/BEAR/BEAR.M2
        Used by 5 ADTs:
        - Azeroth_32_45.adt (Lost Isles)
        - Azeroth_32_46.adt (Azshara)
        - ...
        """
        # Collect all missing models
        all_missing = set()
        for missing_set in self.adt_missing.values():
            all_missing.update(missing_set)

        with open(output_path, 'w') as f:
            f.write('# Missing Models by Usage\n\n')
            f.write('This report shows which ADTs reference each missing model.\n')
            f.write('Prioritize models used by many ADTs for maximum impact.\n\n')

            if not all_missing:
                f.write('✅ **No missing models!**\n')
                return

            f.write(f'**Total missing models**: {len(all_missing)}\n\n')
            f.write('---\n\n')

            # Build usage map
            model_usage = {}
            for model in all_missing:
                # Find which ADTs are missing this model
                affected_adts = []
                for adt_path, missing_models in self.adt_missing.items():
                    if model in missing_models:
                        affected_adts.append(adt_path)

                model_usage[model] = sorted(affected_adts, key=lambda x: Path(x).name)

            # Sort by usage count (most used first)
            sorted_models = sorted(model_usage.items(), key=lambda x: len(x[1]), reverse=True)

            for model, adt_paths in sorted_models:
                f.write(f'## {model}\n\n')
                f.write(f'**Used by {len(adt_paths)} ADT(s)**:\n\n')

                for adt_path in adt_paths:
                    adt_name = Path(adt_path).name

                    # Add area name if DBC reader is available
                    if self.dbc_reader:
                        area_name = self.dbc_reader.get_area_name_for_adt(adt_path)
                        f.write(f'- `{adt_name}` - {area_name}\n')
                    else:
                        f.write(f'- `{adt_name}` ({adt_path})\n')

                f.write('\n')

        print(f'✅ Per-model usage report saved to: {output_path}')

    def generate_json_export(self, output_path: Path):
        """
        Export missing model data as JSON for programmatic use.

        Format:
        {
          "summary": {
            "total_adts": 1231,
            "adts_with_missing": 45,
            "total_missing_models": 23
          },
          "adt_missing": {
            "/path/to/Azeroth_32_45.adt": {
              "area": "Lost Isles (Kalimdor 43,12)",
              "models": [
                "CREATURE/BEAR/BEAR.M2",
                "WORLD/TREE01.M2"
              ]
            }
          },
          "model_usage": {
            "CREATURE/BEAR/BEAR.M2": [
              {
                "path": "/path/to/Azeroth_32_45.adt",
                "area": "Lost Isles (Kalimdor 43,12)"
              }
            ]
          }
        }
        """
        # Collect all missing models
        all_missing = set()
        for missing_set in self.adt_missing.values():
            all_missing.update(missing_set)

        # Build model usage map
        model_usage = {}
        for model in all_missing:
            affected_adts = []
            for adt_path, missing_models in self.adt_missing.items():
                if model in missing_models:
                    adt_info = {'path': adt_path}
                    if self.dbc_reader:
                        adt_info['area'] = self.dbc_reader.get_area_name_for_adt(adt_path)
                    affected_adts.append(adt_info)
            model_usage[model] = sorted(affected_adts, key=lambda x: x['path'])

        # Build ADT missing map with area info
        adt_missing_with_areas = {}
        for adt, models in self.adt_missing.items():
            adt_data = {
                'models': sorted(list(models))
            }
            if self.dbc_reader:
                adt_data['area'] = self.dbc_reader.get_area_name_for_adt(adt)
            adt_missing_with_areas[adt] = adt_data

        # Build JSON structure
        data = {
            'summary': {
                'total_adts': len(self.adt_models),
                'adts_with_missing': len(self.adt_missing),
                'total_missing_models': len(all_missing)
            },
            'adt_missing': adt_missing_with_areas,
            'model_usage': model_usage
        }

        with open(output_path, 'w') as f:
            json.dump(data, f, indent=2)

        print(f'✅ JSON export saved to: {output_path}')

    def print_summary(self):
        """Print summary statistics to console."""
        all_missing = set()
        for missing_set in self.adt_missing.values():
            all_missing.update(missing_set)

        print('\n' + '='*80)
        print('PER-ADT MISSING MODEL SUMMARY')
        print('='*80)
        print(f'Total ADTs parsed: {len(self.adt_models)}')
        print(f'ADTs with missing models: {len(self.adt_missing)}')
        print(f'Total unique missing models: {len(all_missing)}')

        if self.adt_missing:
            # Find ADT with most missing models
            worst_adt = max(self.adt_missing.items(), key=lambda x: len(x[1]))
            worst_adt_name = Path(worst_adt[0]).name
            worst_count = len(worst_adt[1])

            print(f'\nWorst ADT: {worst_adt_name} ({worst_count} missing models)')

            # Find most commonly missing model
            model_counts = {}
            for missing_set in self.adt_missing.values():
                for model in missing_set:
                    model_counts[model] = model_counts.get(model, 0) + 1

            most_common = max(model_counts.items(), key=lambda x: x[1])
            print(f'Most common missing model: {most_common[0]} (used by {most_common[1]} ADTs)')
        else:
            print('\n✅ All models satisfied!')

        print('='*80 + '\n')
