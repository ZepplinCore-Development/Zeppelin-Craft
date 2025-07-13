#!/usr/bin/env python3
"""
Build script for Zeppelin Launcher
Creates a standalone executable using PyInstaller
"""

import os
import sys
import shutil
import subprocess
from pathlib import Path

def main():
    """Main build process"""
    print("🚀 Zeppelin Launcher Build Script")
    print("=" * 50)
    
    # Get project root (we're in build directory, so go up one level)
    build_script_dir = Path(__file__).parent
    project_root = build_script_dir.parent
    src_dir = project_root / "src"
    config_dir = project_root / "config"
    
    # Output directories
    dist_dir = project_root / "dist"
    pyinstaller_work_dir = project_root / "pyinstaller_temp"
    
    # Clean previous builds (but don't delete our own directory)
    print("🧹 Cleaning previous builds...")
    if dist_dir.exists():
        shutil.rmtree(dist_dir)
    if pyinstaller_work_dir.exists():
        shutil.rmtree(pyinstaller_work_dir)
    
    # Check if PyInstaller is installed
    try:
        import PyInstaller
        print(f"✅ PyInstaller {PyInstaller.__version__} found")
    except ImportError:
        print("❌ PyInstaller not found. Installing...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pyinstaller"])
    
    # Check if Pillow is installed
    try:
        import PIL
        print(f"✅ Pillow found")
    except ImportError:
        print("❌ Pillow not found. Installing...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pillow"])
    
    # Build command - use standalone version
    main_script = src_dir / "standalone_launcher.py"
    assets_dir = project_root / "assets"
    
    pyinstaller_args = [
        "pyinstaller",
        str(main_script),
        "--name", "ZeppelinLauncher",
        "--onefile",
        "--windowed",
        "--distpath", str(dist_dir),
        "--workpath", str(pyinstaller_work_dir),
        "--specpath", str(project_root),
        "--add-data", f"{assets_dir};assets",
        "--hidden-import", "tkinter",
        "--hidden-import", "tkinter.ttk",
        "--hidden-import", "tkinter.messagebox",
        "--hidden-import", "tkinter.filedialog",
        "--hidden-import", "PIL",
        "--hidden-import", "PIL.Image",
        "--hidden-import", "PIL.ImageTk",
        "--clean",
        "--noconfirm"
    ]
    
    # Add icon if available (use PNG since Pillow is now installed)
    icon_path = project_root / "assets" / "icons" / "zeppelin.png"
    if icon_path.exists():
        pyinstaller_args.extend(["--icon", str(icon_path)])
    
    print("🔨 Building executable...")
    print(f"Command: {' '.join(pyinstaller_args)}")
    
    try:
        result = subprocess.run(pyinstaller_args, cwd=project_root, check=True, 
                              capture_output=True, text=True)
        print("✅ Build completed successfully!")
        
        # Copy additional files
        print("📦 Setting up runtime directories...")
        
        # Note: The standalone launcher creates data and logs directories automatically
        # No need to copy config files as settings are hardcoded
        
        print("✅ Standalone launcher ready")
        
        # Create README for distribution
        readme_content = """# Zeppelin Launcher

## Installation
1. Place ZeppelinLauncher.exe in your WoW client directory
2. Run the launcher to check for updates and launch the game

## Files
- ZeppelinLauncher.exe - Main launcher executable (standalone, no config needed)
- data/ - Version tracking files (created automatically)
- logs/ - Application logs (created automatically)

## Features
- Automatic server connection to Zeppelin Craft server
- File version checking and updates
- One-click game launch with realmlist updates
- Beautiful Zeppelin background artwork
- Optional patches support
- All settings hardcoded for simplicity

## Support
For issues, please check the logs directory for detailed error information.
"""
        
        with open(dist_dir / "README.txt", "w") as f:
            f.write(readme_content)
        
        print("✅ README.txt created")
        
        # Clean up temporary PyInstaller files
        if pyinstaller_work_dir.exists():
            shutil.rmtree(pyinstaller_work_dir)
        
        # Show build results
        exe_path = dist_dir / "ZeppelinLauncher.exe"
        if exe_path.exists():
            size_mb = exe_path.stat().st_size / (1024 * 1024)
            print(f"📊 Final executable: {exe_path}")
            print(f"📊 Size: {size_mb:.2f} MB")
        
        print("\n🎉 Build completed successfully!")
        print(f"📁 Output directory: {dist_dir}")
        print("💡 You can now copy ZeppelinLauncher.exe to your WoW client directory")
        
    except subprocess.CalledProcessError as e:
        print(f"❌ Build failed: {e}")
        if e.stdout:
            print("STDOUT:", e.stdout)
        if e.stderr:
            print("STDERR:", e.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()