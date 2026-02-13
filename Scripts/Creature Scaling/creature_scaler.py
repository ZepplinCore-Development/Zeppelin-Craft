#!/usr/bin/env python3
"""
Creature Scaler - Orchestrator Script

Central CLI for running creature scaling scripts. Loads database credentials
from .env and passes them to sub-scripts.

Scripts:
    --normal    Normal Convertor - Reverts IPP elite restorations to normal
    --elite     Elite Scaler - Balances elite dungeon creatures (e.g., BRS)
    --heroic    Heroic Convertor - Creates heroic/mythic dungeon versions
    --all       Run all three scripts

Usage:
    python3 creature_scaler.py --normal
    python3 creature_scaler.py --elite --heroic
    python3 creature_scaler.py --all
"""

import argparse
import os
import sys
from pathlib import Path


# Base directory for this project
BASE_DIR = Path(__file__).parent


def load_config():
    """Load database configuration from .env file."""
    env_file = BASE_DIR / ".env"

    if not env_file.exists():
        print(f"Error: .env file not found at {env_file}")
        print("Copy .env.example to .env and configure your database credentials.")
        sys.exit(1)

    config = {}

    with open(env_file, 'r') as f:
        for line in f:
            line = line.strip()
            if line and not line.startswith('#') and '=' in line:
                key, value = line.split('=', 1)
                config[key.strip()] = value.strip()

    db_config = {
        "host": config.get("DB_HOST", "192.168.0.55"),
        "port": int(config.get("DB_PORT", "3306")),
        "user": config.get("DB_USER"),
        "password": config.get("DB_PASSWORD"),
        "database": config.get("DB_NAME", "acore_world")
    }

    if not db_config["user"] or not db_config["password"]:
        print("Error: Database credentials not configured in .env file.")
        print("Required: DB_USER and DB_PASSWORD")
        sys.exit(1)

    return db_config


def run_normal(db_config):
    """Run the Normal Creature Convertor."""
    print("\n" + "=" * 60)
    print("RUNNING: Normal Creature Convertor")
    print("Purpose: Revert IPP elite restorations to normal rank")
    print("=" * 60 + "\n")

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "normal_convertor",
            BASE_DIR / "scripts" / "normal_convertor.py"
        )
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)

        module.run(db_config)
        print("\n✓ Normal Creature Convertor completed successfully")
        return True

    except Exception as e:
        print(f"\n✗ Normal Creature Convertor failed: {e}")
        return False


def run_elite(db_config):
    """Run the Elite Creature Scaler."""
    print("\n" + "=" * 60)
    print("RUNNING: Elite Creature Scaler")
    print("Purpose: Balance elite dungeon creatures (e.g., BRS)")
    print("=" * 60 + "\n")

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "elite_scaler",
            BASE_DIR / "scripts" / "elite_scaler.py"
        )
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)

        module.run(db_config)
        print("\n✓ Elite Creature Scaler completed successfully")
        return True

    except Exception as e:
        print(f"\n✗ Elite Creature Scaler failed: {e}")
        return False


def run_heroic(db_config):
    """Run the Heroic Creature Convertor."""
    print("\n" + "=" * 60)
    print("RUNNING: Heroic Creature Convertor")
    print("Purpose: Create heroic/mythic dungeon creature versions")
    print("=" * 60 + "\n")

    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location(
            "heroic_convertor",
            BASE_DIR / "scripts" / "heroic_convertor.py"
        )
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)

        module.run(db_config)
        print("\n✓ Heroic Creature Convertor completed successfully")
        return True

    except Exception as e:
        print(f"\n✗ Heroic Creature Convertor failed: {e}")
        return False


def interactive_mode():
    """Prompt user to select which scripts to run when no CLI args provided."""
    print("=" * 60)
    print("CREATURE SCALER - INTERACTIVE MODE")
    print("=" * 60)
    print("\nAvailable scripts:")
    print("  [1] Normal Convertor  - Revert IPP elite restorations to normal")
    print("  [2] Elite Scaler      - Balance elite dungeon creatures (BRS)")
    print("  [3] Heroic Convertor  - Create heroic/mythic dungeon versions")
    print("  [4] All scripts       - Run all three")
    print("  [0] Exit")
    print()

    while True:
        try:
            choice = input("Select option (0-4, or comma-separated like 1,2): ").strip()

            if choice == '0':
                print("Exiting.")
                sys.exit(0)

            # Parse selection
            run_normal = False
            run_elite = False
            run_heroic = False

            if choice == '4':
                run_normal = run_elite = run_heroic = True
            else:
                selections = [s.strip() for s in choice.split(',')]
                for sel in selections:
                    if sel == '1':
                        run_normal = True
                    elif sel == '2':
                        run_elite = True
                    elif sel == '3':
                        run_heroic = True
                    elif sel not in ('', '0'):
                        print(f"Invalid option: {sel}")
                        continue

            if run_normal or run_elite or run_heroic:
                return run_normal, run_elite, run_heroic

            print("Please select at least one script (1-4)")

        except KeyboardInterrupt:
            print("\nExiting.")
            sys.exit(0)
        except EOFError:
            print("\nExiting.")
            sys.exit(0)


def main():
    parser = argparse.ArgumentParser(
        description="Creature Scaler - Orchestrator for creature scaling scripts",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python3 creature_scaler.py --normal           # Run Normal Convertor only
    python3 creature_scaler.py --elite            # Run Elite Scaler only
    python3 creature_scaler.py --heroic           # Run Heroic Convertor only
    python3 creature_scaler.py --normal --elite   # Run multiple scripts
    python3 creature_scaler.py --all              # Run all scripts
    python3 creature_scaler.py                    # Interactive mode

Output:
    Each script generates a SQL file in the output/ directory:
    - Normal:  output/zz_[AUTO,F-074]_de-L33TER.sql
    - Elite:   output/zz_[AUTO,F-074]_elite_scaler.sql
    - Heroic:  output/zz_[AUTO,F-074]_heroic_convertor.sql

Configuration:
    Database credentials are loaded from .env file in this directory.
    Copy .env.example to .env and configure before running.

Structure:
    Creature Scaling/
    ├── creature_scaler.py      # This orchestrator
    ├── .env                    # Database credentials
    ├── data/                   # JSON creature definitions
    │   ├── creatures.json
    │   ├── creatures_elite.json
    │   └── creatures_heroic.json
    ├── scripts/                # Sub-scripts
    │   ├── normal_convertor.py
    │   ├── elite_scaler.py
    │   └── heroic_convertor.py
    └── output/                 # Generated SQL files
        """
    )

    parser.add_argument(
        "--normal", "-n",
        action="store_true",
        help="Run Normal Convertor (reverts IPP elite restorations)"
    )
    parser.add_argument(
        "--elite", "-e",
        action="store_true",
        help="Run Elite Scaler (balances dungeon elites like BRS)"
    )
    parser.add_argument(
        "--heroic", "-r",
        action="store_true",
        help="Run Heroic Convertor (creates heroic/mythic versions)"
    )
    parser.add_argument(
        "--all", "-a",
        action="store_true",
        help="Run all three scripts"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be run without executing"
    )

    args = parser.parse_args()

    # If --all is specified, enable all scripts
    if args.all:
        args.normal = True
        args.elite = True
        args.heroic = True

    # If no script selected, enter interactive mode
    if not (args.normal or args.elite or args.heroic):
        args.normal, args.elite, args.heroic = interactive_mode()

    # Show what will be run
    scripts_to_run = []
    if args.normal:
        scripts_to_run.append("Normal Convertor")
    if args.elite:
        scripts_to_run.append("Elite Scaler")
    if args.heroic:
        scripts_to_run.append("Heroic Convertor")

    print("=" * 60)
    print("CREATURE SCALER - ORCHESTRATOR")
    print("=" * 60)
    print(f"\nScripts to run: {', '.join(scripts_to_run)}")

    if args.dry_run:
        print("\n[DRY RUN] Would execute the above scripts.")
        print("Remove --dry-run to actually run them.")
        sys.exit(0)

    # Load database configuration
    print("\nLoading database configuration from .env...")
    db_config = load_config()
    print(f"  Host: {db_config['host']}:{db_config['port']}")
    print(f"  Database: {db_config['database']}")
    print(f"  User: {db_config['user']}")

    # Run selected scripts
    results = {}

    if args.normal:
        results["Normal"] = run_normal(db_config)

    if args.elite:
        results["Elite"] = run_elite(db_config)

    if args.heroic:
        results["Heroic"] = run_heroic(db_config)

    # Summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)

    all_success = True
    for name, success in results.items():
        status = "✓ Success" if success else "✗ Failed"
        print(f"  {name}: {status}")
        if not success:
            all_success = False

    if all_success:
        print("\nAll scripts completed successfully!")
        print("\nGenerated SQL files:")
        output_dir = BASE_DIR / "output"
        if args.normal:
            print(f"  - {output_dir / 'zz_[AUTO,F-074]_de-L33TER.sql'}")
        if args.elite:
            print(f"  - {output_dir / 'zz_[AUTO,F-074]_elite_scaler.sql'}")
        if args.heroic:
            print(f"  - {output_dir / 'zz_[AUTO,F-074]_heroic_convertor.sql'}")
    else:
        print("\nSome scripts failed. Check output above for details.")
        sys.exit(1)


if __name__ == "__main__":
    main()
