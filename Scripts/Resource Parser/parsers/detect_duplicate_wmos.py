#!/usr/bin/env python3
"""
Duplicate WMO Detection Script

Scans ADT files for duplicate WMO placements at identical or nearby coordinates.
This addresses the known Open Azeroth issue (I-017) where duplicated WMOs cause
glitching in locations like Exodar and Thunder Bluff caves.

Usage:
    python3 detect_duplicate_wmos.py <adt_directory> [--threshold DISTANCE] [--output REPORT_FILE]

Example:
    python3 detect_duplicate_wmos.py /path/to/open_azeroth/adt --threshold 1.0 --output duplicates.txt
"""

import sys
import argparse
from pathlib import Path
from typing import Dict, List, Tuple
from parsers.adt_parser import ADTParser, MODFEntry


class DuplicateWMOReport:
    """Generates reports of duplicate WMO placements across ADT files."""

    def __init__(self, threshold: float = 1.0):
        self.threshold = threshold
        self.total_adts_scanned = 0
        self.total_wmo_placements = 0
        self.total_duplicates_found = 0
        self.adt_reports: Dict[str, List[Tuple[MODFEntry, MODFEntry, float, str]]] = {}

    def scan_adt_directory(self, adt_dir: Path, pattern: str = "*.adt"):
        """
        Scan all ADT files in directory for duplicate WMO placements.

        Args:
            adt_dir: Directory containing ADT files
            pattern: File pattern to match (default: *.adt)
        """
        adt_files = list(adt_dir.rglob(pattern))

        if not adt_files:
            print(f"No ADT files found in {adt_dir} with pattern '{pattern}'")
            return

        print(f"Scanning {len(adt_files)} ADT files for duplicate WMOs...")
        print(f"Distance threshold: {self.threshold} game units\n")

        for adt_file in adt_files:
            self.scan_adt_file(adt_file)

        print(f"\n{'='*80}")
        print(f"SCAN COMPLETE")
        print(f"{'='*80}")
        print(f"ADTs scanned: {self.total_adts_scanned}")
        print(f"Total WMO placements: {self.total_wmo_placements}")
        print(f"Duplicate pairs found: {self.total_duplicates_found}")
        print(f"ADTs with duplicates: {len(self.adt_reports)}")

    def scan_adt_file(self, adt_path: Path):
        """Scan a single ADT file for duplicate WMO placements."""
        parser = ADTParser(adt_path)
        parser.parse()

        self.total_adts_scanned += 1
        self.total_wmo_placements += len(parser.wmo_placements)

        if not parser.wmo_placements:
            return

        # Find duplicates in this ADT
        duplicates = parser.find_duplicate_wmos(self.threshold)

        if duplicates:
            # Augment duplicates with WMO filename
            duplicates_with_names = []
            for entry1, entry2, distance in duplicates:
                # Get WMO filename from index
                wmo_name = "Unknown"
                if entry1.wmo_id < len(parser.wmo_list):
                    wmo_name = parser.wmo_list[entry1.wmo_id]

                duplicates_with_names.append((entry1, entry2, distance, wmo_name))

            self.adt_reports[str(adt_path)] = duplicates_with_names
            self.total_duplicates_found += len(duplicates)

            print(f"  [{len(duplicates)} duplicates] {adt_path.name}")

    def generate_report(self, output_file: Path = None):
        """
        Generate detailed duplicate WMO report.

        Args:
            output_file: Optional file to write report to (prints to stdout if None)
        """
        lines = []
        lines.append("="*80)
        lines.append("DUPLICATE WMO DETECTION REPORT")
        lines.append("="*80)
        lines.append(f"Distance Threshold: {self.threshold} game units")
        lines.append(f"ADTs Scanned: {self.total_adts_scanned}")
        lines.append(f"Total WMO Placements: {self.total_wmo_placements}")
        lines.append(f"Duplicate Pairs Found: {self.total_duplicates_found}")
        lines.append(f"ADTs With Duplicates: {len(self.adt_reports)}")
        lines.append("")

        if not self.adt_reports:
            lines.append("No duplicates found!")
            lines.append("")
        else:
            lines.append("="*80)
            lines.append("AFFECTED ADT FILES")
            lines.append("="*80)
            lines.append("")

            # Sort by number of duplicates (descending)
            sorted_adts = sorted(
                self.adt_reports.items(),
                key=lambda x: len(x[1]),
                reverse=True
            )

            for adt_path, duplicates in sorted_adts:
                adt_name = Path(adt_path).name
                lines.append(f"{'─'*80}")
                lines.append(f"FILE: {adt_name}")
                lines.append(f"PATH: {adt_path}")
                lines.append(f"DUPLICATES: {len(duplicates)} pair(s)")
                lines.append("")

                for idx, (entry1, entry2, distance, wmo_name) in enumerate(duplicates, 1):
                    lines.append(f"  Duplicate #{idx}:")
                    lines.append(f"    WMO: {wmo_name}")
                    lines.append(f"    Distance: {distance:.3f} units")
                    lines.append("")
                    lines.append(f"    Instance 1:")
                    lines.append(f"      UniqueId: {entry1.unique_id}")
                    lines.append(f"      Position: ({entry1.position[0]:.2f}, {entry1.position[1]:.2f}, {entry1.position[2]:.2f})")
                    lines.append(f"      Rotation: ({entry1.rotation[0]:.2f}, {entry1.rotation[1]:.2f}, {entry1.rotation[2]:.2f})")
                    lines.append(f"      Flags: {entry1.flags}, DoodadSet: {entry1.doodad_set}, Scale: {entry1.scale}")
                    lines.append("")
                    lines.append(f"    Instance 2:")
                    lines.append(f"      UniqueId: {entry2.unique_id}")
                    lines.append(f"      Position: ({entry2.position[0]:.2f}, {entry2.position[1]:.2f}, {entry2.position[2]:.2f})")
                    lines.append(f"      Rotation: ({entry2.rotation[0]:.2f}, {entry2.rotation[1]:.2f}, {entry2.rotation[2]:.2f})")
                    lines.append(f"      Flags: {entry2.flags}, DoodadSet: {entry2.doodad_set}, Scale: {entry2.scale}")
                    lines.append("")

                lines.append("")

        lines.append("="*80)
        lines.append("END OF REPORT")
        lines.append("="*80)

        report_text = "\n".join(lines)

        if output_file:
            with open(output_file, 'w') as f:
                f.write(report_text)
            print(f"\nReport saved to: {output_file}")
        else:
            print(report_text)


def main():
    parser = argparse.ArgumentParser(
        description="Detect duplicate WMO placements in WoW ADT files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Scan Open Azeroth ADTs with default 1.0 unit threshold
  python3 detect_duplicate_wmos.py /path/to/open_azeroth/World/Maps

  # Use custom threshold and save report
  python3 detect_duplicate_wmos.py /path/to/adts --threshold 0.5 --output report.txt

  # Scan specific map directory
  python3 detect_duplicate_wmos.py /path/to/World/Maps/Azuremyst
        """
    )

    parser.add_argument(
        'adt_directory',
        type=Path,
        help='Directory containing ADT files to scan'
    )

    parser.add_argument(
        '--threshold',
        '-t',
        type=float,
        default=1.0,
        help='Distance threshold in game units to consider duplicates (default: 1.0)'
    )

    parser.add_argument(
        '--output',
        '-o',
        type=Path,
        default=None,
        help='Output file for report (default: print to stdout)'
    )

    parser.add_argument(
        '--pattern',
        '-p',
        type=str,
        default='*.adt',
        help='File pattern to match (default: *.adt)'
    )

    args = parser.parse_args()

    # Validate directory
    if not args.adt_directory.exists():
        print(f"Error: Directory not found: {args.adt_directory}")
        sys.exit(1)

    if not args.adt_directory.is_dir():
        print(f"Error: Not a directory: {args.adt_directory}")
        sys.exit(1)

    # Run scan
    reporter = DuplicateWMOReport(threshold=args.threshold)
    reporter.scan_adt_directory(args.adt_directory, args.pattern)

    # Generate report
    print("\nGenerating detailed report...\n")
    reporter.generate_report(args.output)


if __name__ == "__main__":
    main()
