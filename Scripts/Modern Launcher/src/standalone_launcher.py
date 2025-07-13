#!/usr/bin/env python3
"""
Zeppelin Launcher - Standalone Version
Single-file launcher with hardcoded settings for easy PyInstaller packaging.
"""

import tkinter as tk
from tkinter import ttk, messagebox
import threading
import json
import hashlib
import subprocess
import sys
import os
import tempfile
import time
from pathlib import Path
from datetime import datetime, timezone
from typing import Dict, Optional, List
import urllib.request
import urllib.error
import urllib.parse
import base64
from io import BytesIO

# Image handling
try:
    from PIL import Image, ImageTk
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False


# =============================================================================
# HARDCODED CONFIGURATION
# =============================================================================

CONFIG = {
    'server': {
        'name': 'Zeppelin Craft',
        'base_url': 'http://159.196.84.172:8111/',
        'timeout': 30
    },
    'client': {
        'wow_executable': 'Wow.exe',
        'data_directory': 'data',
        'backup_files': False,
        'validate_downloads': False
    },
    'ui': {
        'theme': 'default',
        'check_updates_on_start': True,
        'minimize_on_launch': False
    }
}

# Derived URLs
MANDATORY_LIST_URL = CONFIG['server']['base_url'] + 'mandatory/mandatory_file_list.txt'
OPTIONAL_LIST_URL = CONFIG['server']['base_url'] + 'optional/optional_file_list.txt'
PATCH_DESCRIPTIONS_URL = CONFIG['server']['base_url'] + 'patch_descriptions.json'
MANDATORY_DOWNLOAD_URL = CONFIG['server']['base_url'] + 'mandatory/'
OPTIONAL_DOWNLOAD_URL = CONFIG['server']['base_url'] + 'optional/'


# =============================================================================
# UTILITY FUNCTIONS
# =============================================================================

def get_app_directory():
    """Get the directory where the application is running from."""
    if getattr(sys, 'frozen', False):
        # Running as compiled executable
        return Path(sys.executable).parent
    else:
        # Running as script
        return Path(__file__).parent


def get_resource_path(resource_name):
    """Get path to a resource file (works with PyInstaller)."""
    if getattr(sys, 'frozen', False):
        # Running as compiled executable
        base_path = Path(sys._MEIPASS)
    else:
        # Running as script
        base_path = Path(__file__).parent.parent
    
    return base_path / resource_name


def load_background_image():
    """Load the background image."""
    if not PIL_AVAILABLE:
        return None
    
    try:
        # Try to load from assets
        image_path = get_resource_path("assets/images/Zeppelin2.JPG.webp")
        if image_path.exists():
            image = Image.open(image_path)
            # Resize to fit new window size (900x700)
            image = image.resize((900, 500), Image.Resampling.LANCZOS)
            return ImageTk.PhotoImage(image)
    except Exception as e:
        log_message(f"Failed to load background image: {e}", "WARNING")
    
    return None


def ensure_directories():
    """Ensure required directories exist."""
    app_dir = get_app_directory()
    data_dir = app_dir / CONFIG['client']['data_directory']
    logs_dir = app_dir / 'logs'
    
    data_dir.mkdir(exist_ok=True)
    logs_dir.mkdir(exist_ok=True)
    
    return data_dir, logs_dir


def log_message(message: str, level: str = "INFO"):
    """Simple logging function."""
    timestamp = datetime.now().strftime("%H:%M:%S")
    print(f"{timestamp} - {level} - {message}")


def find_wow_installation():
    """Try to find WoW installation directory."""
    app_dir = get_app_directory()
    
    # Check if Wow.exe is in the same directory as the launcher
    wow_exe = app_dir / CONFIG['client']['wow_executable']
    if wow_exe.exists():
        return app_dir
    
    # Check common installation paths
    common_paths = [
        Path("C:/Program Files/World of Warcraft"),
        Path("C:/Program Files (x86)/World of Warcraft"),
        Path("C:/Games/World of Warcraft"),
        Path("D:/Games/World of Warcraft"),
        Path("E:/Games/World of Warcraft"),
        Path.home() / "Desktop/World of Warcraft"
    ]
    
    for path in common_paths:
        if path.exists() and (path / CONFIG['client']['wow_executable']).exists():
            return path
    
    return None


def download_file_list(url: str) -> Optional[str]:
    """Download file list from server."""
    try:
        with urllib.request.urlopen(url, timeout=CONFIG['server']['timeout']) as response:
            return response.read().decode('utf-8')
    except Exception as e:
        log_message(f"Failed to download file list: {e}", "ERROR")
        return None


def parse_file_list(content: str) -> Dict[str, str]:
    """Parse file list content into filename->version mapping."""
    file_dict = {}
    for line in content.strip().split('\n'):
        line = line.strip()
        if line and ':' in line:
            parts = line.split(':', 1)
            if len(parts) == 2:
                filename, version = parts
                file_dict[filename.strip()] = version.strip()
    return file_dict


def download_file(url: str, local_path: Path, progress_callback=None) -> bool:
    """Download a file with progress tracking."""
    try:
        def report_progress(block_num, block_size, total_size):
            if progress_callback and total_size > 0:
                downloaded = min(block_num * block_size, total_size)
                progress_callback(downloaded, total_size)
        
        urllib.request.urlretrieve(url, local_path, reporthook=report_progress)
        return True
    except Exception as e:
        log_message(f"Failed to download {url}: {e}", "ERROR")
        return False


# =============================================================================
# VERSION MANAGER
# =============================================================================

class SimpleVersionManager:
    """Simplified version manager for standalone launcher."""
    
    def __init__(self, data_dir: Path):
        self.data_dir = data_dir
        self.version_file = data_dir / "client_versions.json"
        self.versions = {}
        self.load_versions()
    
    def load_versions(self):
        """Load version data from file."""
        try:
            if self.version_file.exists():
                with open(self.version_file, 'r') as f:
                    data = json.load(f)
                    self.versions = data.get('files', {})
        except Exception as e:
            log_message(f"Failed to load versions: {e}", "WARNING")
            self.versions = {}
    
    def save_versions(self):
        """Save version data to file."""
        try:
            data = {
                'format_version': '1.0',
                'last_updated': datetime.now(timezone.utc).isoformat(),
                'files': self.versions
            }
            with open(self.version_file, 'w') as f:
                json.dump(data, f, indent=2)
        except Exception as e:
            log_message(f"Failed to save versions: {e}", "ERROR")
    
    def get_file_version(self, filename: str) -> Optional[str]:
        """Get version of a file."""
        return self.versions.get(filename)
    
    def set_file_version(self, filename: str, version: str):
        """Set version of a file."""
        self.versions[filename] = version
        self.save_versions()


# =============================================================================
# MAIN LAUNCHER CLASS
# =============================================================================

class ZeppelinLauncher:
    """Main launcher functionality."""
    
    def __init__(self):
        self.data_dir, self.logs_dir = ensure_directories()
        self.version_manager = SimpleVersionManager(self.data_dir)
        log_message("Zeppelin Launcher initialized")
    
    def test_connection(self) -> bool:
        """Test server connection."""
        try:
            content = download_file_list(MANDATORY_LIST_URL)
            return content is not None
        except Exception as e:
            log_message(f"Connection test failed: {e}", "ERROR")
            return False
    
    def get_mandatory_files(self) -> Dict[str, str]:
        """Get mandatory files list from server."""
        content = download_file_list(MANDATORY_LIST_URL)
        if content:
            return parse_file_list(content)
        return {}
    
    def get_optional_files(self) -> Dict[str, str]:
        """Get optional files list from server."""
        content = download_file_list(OPTIONAL_LIST_URL)
        if content:
            return parse_file_list(content)
        return {}
    
    def download_file(self, filename: str, is_optional: bool = False, progress_callback=None) -> bool:
        """Download a file from server."""
        # Use appropriate URL based on file type
        base_url = OPTIONAL_DOWNLOAD_URL if is_optional else MANDATORY_DOWNLOAD_URL
        file_url = base_url + filename
        
        # Download patches to Data directory, other files to root
        if filename.lower().endswith('.mpq'):
            # MPQ files go to Data directory
            data_dir = get_app_directory() / "Data"
            data_dir.mkdir(exist_ok=True)
            local_path = data_dir / filename
        else:
            # Other files go to root directory
            local_path = get_app_directory() / filename
        
        success = download_file(file_url, local_path, progress_callback)
        if success:
            log_message(f"Successfully downloaded {filename} to {local_path}")
        return success
    
    def get_patch_descriptions(self) -> Dict:
        """Get patch descriptions from server."""
        try:
            content = download_file_list(PATCH_DESCRIPTIONS_URL)
            if content:
                import json
                return json.loads(content)
            return {}
        except Exception as e:
            log_message(f"Failed to get patch descriptions: {e}", "WARNING")
            return {}
    
    def launch_game(self) -> bool:
        """Launch WoW game."""
        try:
            wow_path = find_wow_installation()
            if not wow_path:
                wow_exe = get_app_directory() / CONFIG['client']['wow_executable']
                if not wow_exe.exists():
                    log_message("WoW executable not found", "ERROR")
                    return False
                wow_path = get_app_directory()
            
            # Update realmlist
            self._update_realmlist(wow_path)
            
            # Launch game
            wow_exe = wow_path / CONFIG['client']['wow_executable']
            if not wow_exe.exists():
                log_message(f"WoW executable not found: {wow_exe}", "ERROR")
                return False
            
            log_message(f"Launching game: {wow_exe}")
            subprocess.Popen([str(wow_exe)], cwd=str(wow_path))
            return True
            
        except Exception as e:
            log_message(f"Failed to launch game: {e}", "ERROR")
            return False
    
    def _update_realmlist(self, wow_path: Path):
        """Update realmlist.wtf file."""
        try:
            realmlist_path = wow_path / "Data" / "enUS" / "realmlist.wtf"
            realmlist_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Extract server address from URL
            server_url = CONFIG['server']['base_url'].rstrip('/')
            server_address = server_url.replace('http://', '').replace('https://', '')
            if ':' in server_address:
                server_address = server_address.split(':')[0]
            
            realmlist_content = f"set realmlist {server_address}\n"
            
            with open(realmlist_path, 'w') as f:
                f.write(realmlist_content)
            
            log_message(f"Updated realmlist: {server_address}")
            
        except Exception as e:
            log_message(f"Failed to update realmlist: {e}", "WARNING")


# =============================================================================
# GUI APPLICATION
# =============================================================================

class MainWindow:
    """Main GUI window."""
    
    def __init__(self):
        self.root = tk.Tk()
        self.launcher = ZeppelinLauncher()
        self.is_updating = False
        self.update_thread = None
        self.background_image = None
        
        self._setup_window()
        self._load_images()
        self._create_widgets()
        self._setup_layout()
        self._bind_events()
        
        # Start with connection check
        self._refresh_file_status()
    
    def _setup_window(self):
        """Setup main window."""
        self.root.title(f"Zeppelin Launcher v1.0.0")
        self.root.geometry("900x700")
        self.root.resizable(False, False)  # Disable resizing for now
        
        # Center window
        self.root.update_idletasks()
        x = (self.root.winfo_screenwidth() // 2) - (900 // 2)
        y = (self.root.winfo_screenheight() // 2) - (700 // 2)
        self.root.geometry(f"900x700+{x}+{y}")
        
        style = ttk.Style()
        style.theme_use('clam')
    
    def _load_images(self):
        """Load background images."""
        self.background_image = load_background_image()
    
    def _create_widgets(self):
        """Create GUI widgets."""
        # Background canvas
        if self.background_image:
            self.canvas = tk.Canvas(self.root, width=900, height=700, highlightthickness=0)
            self.canvas.create_image(450, 250, image=self.background_image)
            
            # Create a more subtle overlay for better text readability
            # Top area - very light overlay
            self.canvas.create_rectangle(0, 0, 900, 200, fill='white', stipple='gray12')
            # Bottom area - semi-transparent for controls
            self.canvas.create_rectangle(0, 200, 900, 700, fill='white', stipple='gray25')
        
        # Main frame - transparent background to show image
        if self.background_image:
            self.main_frame = tk.Frame(self.root, bg='', highlightthickness=0)
            self.main_frame.configure(bg='')
        else:
            self.main_frame = ttk.Frame(self.root, padding="10")
        
        # Header
        self.header_frame = ttk.Frame(self.main_frame)
        self.title_label = ttk.Label(
            self.header_frame, 
            text="Zeppelin Craft Launcher",
            font=("Arial", 16, "bold")
        )
        self.server_label = ttk.Label(
            self.header_frame,
            text=f"Server: {CONFIG['server']['name']}",
            font=("Arial", 10)
        )
        
        # Status frame
        self.status_frame = ttk.LabelFrame(self.main_frame, text="Server Status", padding="5")
        self.connection_label = ttk.Label(self.status_frame, text="Connection: Checking...")
        self.files_label = ttk.Label(self.status_frame, text="Files: Loading...")
        
        # Create notebook for tabbed interface
        self.notebook = ttk.Notebook(self.main_frame)
        
        # Mandatory files tab
        self.mandatory_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.mandatory_frame, text="Required Files")
        
        # Mandatory file list (merged status column)
        columns = ("status", "filename", "name", "version", "size")
        self.mandatory_tree = ttk.Treeview(self.mandatory_frame, columns=columns, show="headings", height=8)
        
        # Configure column headings
        self.mandatory_tree.heading("status", text="Status")
        self.mandatory_tree.heading("filename", text="File")
        self.mandatory_tree.heading("name", text="Name")
        self.mandatory_tree.heading("version", text="Version")
        self.mandatory_tree.heading("size", text="Size")
        
        # Configure column widths
        self.mandatory_tree.column("status", width=150)
        self.mandatory_tree.column("filename", width=140)
        self.mandatory_tree.column("name", width=180)
        self.mandatory_tree.column("version", width=140)
        self.mandatory_tree.column("size", width=80)
        
        # Scrollbar for mandatory files
        self.mandatory_scrollbar = ttk.Scrollbar(self.mandatory_frame, orient="vertical", command=self.mandatory_tree.yview)
        self.mandatory_tree.configure(yscrollcommand=self.mandatory_scrollbar.set)
        
        # Bind click events for checkbox simulation
        self.mandatory_tree.bind("<Button-1>", self._on_mandatory_tree_click)
        
        # Optional patches tab
        self.optional_frame = ttk.Frame(self.notebook)
        self.notebook.add(self.optional_frame, text="Optional Patches")
        
        # Optional patches list (merged status column)
        columns = ("status", "filename", "name", "version", "size")
        self.optional_tree = ttk.Treeview(self.optional_frame, columns=columns, show="headings", height=8)
        
        # Configure column headings (same as mandatory)
        self.optional_tree.heading("status", text="Status")
        self.optional_tree.heading("filename", text="File")
        self.optional_tree.heading("name", text="Name")
        self.optional_tree.heading("version", text="Version")
        self.optional_tree.heading("size", text="Size")
        
        # Configure column widths (same as mandatory)
        self.optional_tree.column("status", width=150)
        self.optional_tree.column("filename", width=140)
        self.optional_tree.column("name", width=180)
        self.optional_tree.column("version", width=140)
        self.optional_tree.column("size", width=80)
        
        # Scrollbar for optional patches
        self.optional_scrollbar_new = ttk.Scrollbar(self.optional_frame, orient="vertical", command=self.optional_tree.yview)
        self.optional_tree.configure(yscrollcommand=self.optional_scrollbar_new.set)
        
        # Bind click events for checkbox simulation and selection tracking
        self.optional_tree.bind("<Button-1>", self._on_optional_tree_click)
        self.optional_tree.bind("<Double-1>", self._on_optional_tree_double_click)
        self.optional_tree.bind("<<TreeviewSelect>>", self._on_optional_tree_select)
        self.mandatory_tree.bind("<Button-1>", self._on_mandatory_tree_click)
        self.mandatory_tree.bind("<Double-1>", self._on_mandatory_tree_double_click)
        self.mandatory_tree.bind("<<TreeviewSelect>>", self._on_mandatory_tree_select)
        
        # Dictionary to store patch states
        self.mandatory_states = {}  # For mandatory files: 'missing', 'downloading', 'updated'
        self.optional_states = {}   # For optional files: 'missing', 'downloading', 'updated' 
        self.patch_descriptions = {}
        
        # Download queue management
        self.download_queue = []  # Queue of files to download
        self.current_download = None  # Currently downloading file info
        self.is_updating = False  # Global download state
        
        # State symbols
        self.STATE_SYMBOLS = {
            'missing': '⚠',     # Missing or out of date (yellow warning)
            'downloading': '⟲', # Downloading (rotating arrow)
            'updated': '✓'      # Up to date (green checkmark)
        }
        
        # Progress tracking (now in status bar)
        self.download_start_time = None
        self.download_total_size = 0
        self.download_current_size = 0
        
        # Description frame
        self.description_frame = ttk.LabelFrame(self.main_frame, text="Patch Description", padding="5")
        self.description_text = tk.Text(
            self.description_frame, 
            height=3, 
            wrap="word", 
            state="disabled",
            font=("TkDefaultFont", 9)
        )
        self.description_text.insert("1.0", "Select a patch to view its description.")
        
        # Button frame
        self.button_frame = ttk.Frame(self.main_frame)
        
        self.launch_button = ttk.Button(
            self.button_frame,
            text="Launch Game",
            command=self._on_launch_game,
            state="disabled"  # Start disabled until mandatory patches are ready
        )
        
        # Status bar
        self.status_bar = ttk.Label(
            self.main_frame,
            text="Ready",
            relief="sunken",
            anchor="w"
        )
    
    def _setup_layout(self):
        """Setup widget layout."""
        # Place background canvas
        if self.background_image:
            self.canvas.place(x=0, y=0, width=900, height=700)
        
        # Place main frame on top
        if self.background_image:
            self.main_frame.place(x=10, y=10, width=880, height=680)
        else:
            self.main_frame.place(x=0, y=0, width=900, height=700)
        
        # Configure grid weights for main frame
        self.main_frame.columnconfigure(0, weight=1)
        self.main_frame.rowconfigure(2, weight=1)
        
        # Layout widgets
        self.header_frame.grid(row=0, column=0, sticky="ew", pady=(0, 10))
        self.title_label.grid(row=0, column=0, sticky="w")
        self.server_label.grid(row=1, column=0, sticky="w")
        
        self.status_frame.grid(row=1, column=0, sticky="ew", pady=(0, 10))
        self.connection_label.grid(row=0, column=0, sticky="w")
        self.files_label.grid(row=1, column=0, sticky="w")
        
        # Notebook (tabbed interface)
        self.notebook.grid(row=2, column=0, sticky="nsew", pady=(0, 10))
        
        # Mandatory files tab layout
        self.mandatory_frame.columnconfigure(0, weight=1)
        self.mandatory_frame.rowconfigure(0, weight=1)
        self.mandatory_tree.grid(row=0, column=0, sticky="nsew")
        self.mandatory_scrollbar.grid(row=0, column=1, sticky="ns")
        
        # Optional patches tab layout
        self.optional_frame.columnconfigure(0, weight=1)
        self.optional_frame.rowconfigure(0, weight=1)
        self.optional_tree.grid(row=0, column=0, sticky="nsew")
        self.optional_scrollbar_new.grid(row=0, column=1, sticky="ns")
        
        # Description frame layout
        self.description_frame.grid(row=3, column=0, sticky="ew", pady=(0, 10))
        self.description_frame.columnconfigure(0, weight=1)
        self.description_text.grid(row=0, column=0, sticky="ew")
        
        # Button frame layout
        self.button_frame.grid(row=4, column=0, sticky="ew", pady=(0, 10))
        self.button_frame.columnconfigure(0, weight=1)
        self.launch_button.grid(row=0, column=0, sticky="ew")
        
        self.status_bar.grid(row=5, column=0, sticky="ew")
    
    def _bind_events(self):
        """Bind event handlers."""
        self.root.protocol("WM_DELETE_WINDOW", self._on_close)
    
    def _populate_file_trees(self):
        """Populate both mandatory and optional file trees with consistent data."""
        # Clear existing items
        for item in self.mandatory_tree.get_children():
            self.mandatory_tree.delete(item)
        for item in self.optional_tree.get_children():
            self.optional_tree.delete(item)
            
        try:
            # Get file lists from server
            mandatory_files = self.launcher.get_mandatory_files()
            optional_files = self.launcher.get_optional_files()
            patch_descriptions = self.patch_descriptions
            
            # Track files that need auto-download
            mandatory_to_download = []
            
            # Populate mandatory files tree
            for filename, server_version in mandatory_files.items():
                local_version = self.launcher.version_manager.get_file_version(filename)
                
                # Check if file actually exists on disk
                file_exists = self._check_file_exists(filename)
                
                # If version manager says we have it but file doesn't exist, clear the version
                if local_version and not file_exists:
                    self.launcher.version_manager.set_file_version(filename, "")
                    local_version = None
                    log_message(f"Detected missing file {filename}, cleared version tracking")
                    
                needs_update = (local_version != server_version) or not file_exists
                
                # Determine state and status
                if needs_update:
                    state = 'missing'
                    if not file_exists:
                        status = "Missing"
                    elif local_version != server_version:
                        status = "Needs update"
                    else:
                        status = "Missing"
                    mandatory_to_download.append(filename)
                else:
                    state = 'updated'
                    status = "Up to date"
                
                self.mandatory_states[filename] = state
                state_symbol = self.STATE_SYMBOLS[state]
                
                # Get patch info if available
                patch_info = {}
                if patch_descriptions and 'patches' in patch_descriptions:
                    patch_info = patch_descriptions['patches'].get(filename, {})
                
                name = patch_info.get('name', filename)
                version_text = f"{local_version or 'None'} → {server_version}"
                size_text = self._get_file_size(filename, False, patch_info)
                
                # Combine symbol and status text
                status_combined = f"{state_symbol} {status}"
                
                self.mandatory_tree.insert("", "end", values=(
                    status_combined, filename, name, version_text, size_text
                ))
            
            # Auto-download mandatory files that need updates
            if mandatory_to_download:
                self.root.after(1000, lambda: self._auto_download_mandatory(mandatory_to_download))
            
            # Update launch button state
            self._update_launch_button_state()
            
            # Populate optional files tree
            for filename, server_version in optional_files.items():
                # Skip if this is also in mandatory files
                if filename in mandatory_files:
                    continue
                    
                local_version = self.launcher.version_manager.get_file_version(filename)
                
                # Check if file actually exists on disk
                file_exists = self._check_file_exists(filename)
                
                # If version manager says we have it but file doesn't exist, clear the version
                if local_version and not file_exists:
                    self.launcher.version_manager.set_file_version(filename, "")
                    local_version = None
                    log_message(f"Detected missing file {filename}, cleared version tracking")
                
                # Determine state and status
                if not local_version or not file_exists:
                    state = 'missing'
                    status = "Available"
                elif local_version != server_version:
                    state = 'missing'
                    status = "Update available"
                else:
                    state = 'updated'
                    status = "Up to date"
                
                self.optional_states[filename] = state
                state_symbol = self.STATE_SYMBOLS[state]
                
                # Get patch info
                patch_info = {}
                if patch_descriptions and 'patches' in patch_descriptions:
                    patch_info = patch_descriptions['patches'].get(filename, {})
                
                name = patch_info.get('name', filename)
                version_text = f"{local_version or 'None'} → {server_version}"
                size_text = self._get_file_size(filename, True, patch_info)
                
                # Combine symbol and status text
                status_combined = f"{state_symbol} {status}"
                
                self.optional_tree.insert("", "end", values=(
                    status_combined, filename, name, version_text, size_text
                ))
                
        except Exception as e:
            log_message(f"Failed to populate file trees: {e}", "ERROR")
        finally:
            # Always update launch button state after populating trees
            self._update_launch_button_state()
    
    def _get_file_size(self, filename, is_optional, patch_info):
        """Get file size with fallback options."""
        try:
            # Try to get real file size by making a HEAD request
            import requests
            folder = 'optional' if is_optional else 'mandatory'
            file_url = f"{CONFIG['server']['base_url']}{folder}/{filename}"
            response = requests.head(file_url, timeout=3)
            if response.status_code == 200 and 'content-length' in response.headers:
                size_bytes = int(response.headers['content-length'])
                size_mb = size_bytes / (1024 * 1024)
                return f"{size_mb:.1f} MB"
        except:
            pass
            
        # Fallback to patch_info size or default
        if 'size_mb' in patch_info:
            return f"{patch_info['size_mb']} MB"
        
        return "Unknown"
    
    def _check_file_exists(self, filename):
        """Check if a file actually exists on disk."""
        try:
            # Determine file path based on type
            if filename.lower().endswith('.mpq'):
                # MPQ files go to Data directory
                data_dir = get_app_directory() / "Data"
                file_path = data_dir / filename
            else:
                # Other files go to root directory
                file_path = get_app_directory() / filename
            
            return file_path.exists() and file_path.is_file()
            
        except Exception as e:
            log_message(f"Error checking file existence for {filename}: {e}", "WARNING")
            return False
    
    def _auto_download_mandatory(self, files_to_download):
        """Queue mandatory files for auto-download."""
        for filename in files_to_download:
            if filename in self.mandatory_states and self.mandatory_states[filename] == 'missing':
                self._add_to_download_queue(filename, False)
        
        # Start processing the queue
        self._process_download_queue()
    
    def _add_to_download_queue(self, filename, is_optional):
        """Add a file to the download queue."""
        download_info = {
            'filename': filename,
            'is_optional': is_optional
        }
        self.download_queue.append(download_info)
        log_message(f"Added {filename} to download queue")
    
    def _process_download_queue(self):
        """Process the next item in the download queue."""
        if self.is_updating or not self.download_queue:
            return
            
        # Get next download
        download_info = self.download_queue.pop(0)
        filename = download_info['filename']
        is_optional = download_info['is_optional']
        
        log_message(f"Starting download from queue: {filename}")
        self._download_individual_file(filename, is_optional)
    
    def _download_individual_file(self, filename, is_optional):
        """Download a single file and update UI."""
        if self.is_updating:
            # If busy, add to queue instead
            self._add_to_download_queue(filename, is_optional)
            return
            
        self.is_updating = True
        self.current_download = {'filename': filename, 'is_optional': is_optional}
        
        # Update state to downloading
        if is_optional:
            self.optional_states[filename] = 'downloading'
        else:
            self.mandatory_states[filename] = 'downloading'
            
        # Update UI to show downloading state
        self._update_file_state_in_tree(filename, is_optional, 'downloading')
        
        # Initialize progress tracking
        self.download_start_time = time.time()
        self.download_current_size = 0
        self.download_total_size = 0
        
        # Update status bar
        self.status_bar.config(text=f"Preparing to download {filename}...")
        
        # Disable all optional patches during download
        if is_optional:
            self._set_optional_patches_state("disabled")
        
        # Start download in background
        download_thread = threading.Thread(
            target=self._perform_individual_download, 
            args=(filename, is_optional), 
            daemon=True
        )
        download_thread.start()
    
    def _perform_individual_download(self, filename, is_optional):
        """Perform individual file download in background."""
        try:
            # Get file size first for progress tracking
            try:
                import requests
                folder = 'optional' if is_optional else 'mandatory'
                file_url = f"{CONFIG['server']['base_url']}{folder}/{filename}"
                response = requests.head(file_url, timeout=5)
                if response.status_code == 200 and 'content-length' in response.headers:
                    self.download_total_size = int(response.headers['content-length'])
                else:
                    self.download_total_size = 0
            except:
                self.download_total_size = 0
            
            # Get server version
            if is_optional:
                files_dict = self.launcher.get_optional_files()
            else:
                files_dict = self.launcher.get_mandatory_files()
                
            if filename not in files_dict:
                raise Exception(f"File {filename} not found in server list")
                
            server_version = files_dict[filename]
            
            # Download the file with progress callback
            success = self.launcher.download_file(filename, is_optional, progress_callback=self._download_progress_callback)
            
            if success:
                # Update version tracking
                self.launcher.version_manager.set_file_version(filename, server_version)
                
                # Update state to completed
                if is_optional:
                    self.optional_states[filename] = 'updated'
                else:
                    self.mandatory_states[filename] = 'updated'
                
                # Update UI to show completed state and refresh version
                self.root.after(0, lambda: self._update_file_state_in_tree(filename, is_optional, 'updated'))
                self.root.after(0, lambda: self._refresh_file_version(filename, is_optional, server_version))
                
                # Show completion message
                message = f"Successfully downloaded {filename}"
                self.root.after(0, lambda: self.status_bar.config(text=message))
            else:
                message = f"Failed to download {filename}"
                self.root.after(0, lambda: self.status_bar.config(text=message))
                
                # Reset state to missing on failure
                if is_optional:
                    self.optional_states[filename] = 'missing'
                else:
                    self.mandatory_states[filename] = 'missing'
                    
                # Update UI to show missing state
                self.root.after(0, lambda: self._update_file_state_in_tree(filename, is_optional, 'missing'))
                    
        except Exception as e:
            log_message(f"Download failed for {filename}: {e}", "ERROR")
            message = f"Download failed: {filename} - {str(e)}"
            self.root.after(0, lambda: self.status_bar.config(text=message))
            
            # Reset state to missing on error
            if is_optional:
                self.optional_states[filename] = 'missing'
            else:
                self.mandatory_states[filename] = 'missing'
                
            # Update UI to show missing state
            self.root.after(0, lambda: self._update_file_state_in_tree(filename, is_optional, 'missing'))
        finally:
            # Re-enable UI and process next download
            self.root.after(0, self._download_individual_complete, is_optional)
    
    def _download_individual_complete(self, was_optional):
        """Clean up after individual download completion."""
        self.is_updating = False
        self.current_download = None
        
        # Re-enable optional patches
        if was_optional:
            self._set_optional_patches_state("normal")
        
        # Update launch button state
        self._update_launch_button_state()
        
        # Process next item in queue
        if self.download_queue:
            self.root.after(500, self._process_download_queue)  # Small delay before next download
    
    def _update_file_state_in_tree(self, filename, is_optional, new_state):
        """Update the visual state of a file in the appropriate tree."""
        tree = self.optional_tree if is_optional else self.mandatory_tree
        state_symbol = self.STATE_SYMBOLS[new_state]
        
        # Find and update the item in the tree
        for item in tree.get_children():
            values = list(tree.item(item, 'values'))
            if len(values) > 1 and values[1] == filename:  # filename column
                values[0] = state_symbol  # Update state symbol
                
                # Update status text based on state
                if new_state == 'missing':
                    values[3] = "Needs update" if not is_optional else "Available"
                elif new_state == 'downloading':
                    values[3] = "Downloading..."
                elif new_state == 'updated':
                    values[3] = "Up to date"
                
                tree.item(item, values=values)
                break
    
    def _refresh_file_version(self, filename, is_optional, new_version):
        """Update the version column and status for a specific file after download."""
        tree = self.optional_tree if is_optional else self.mandatory_tree
        
        # Find and update the item in the tree
        for item in tree.get_children():
            values = list(tree.item(item, 'values'))
            if len(values) > 1 and values[1] == filename:  # filename column
                # Update version text to show current version (up to date)
                values[3] = f"{new_version} → {new_version}"  # version column (index 3)
                
                # Also update the status to show it's up to date
                state_symbol = self.STATE_SYMBOLS['updated']
                values[0] = f"{state_symbol} Up to date"
                
                tree.item(item, values=values)
                break
    
    def _download_progress_callback(self, downloaded, total):
        """Callback for download progress updates."""
        if self.current_download and self.download_start_time:
            filename = self.current_download['filename']
            elapsed = time.time() - self.download_start_time
            
            if total > 0:
                progress_percent = (downloaded / total) * 100
                downloaded_mb = downloaded / (1024 * 1024)
                total_mb = total / (1024 * 1024)
                
                # Calculate speed and ETA
                if elapsed > 0:
                    speed_mbps = downloaded_mb / elapsed
                    remaining_mb = total_mb - downloaded_mb
                    eta_seconds = remaining_mb / speed_mbps if speed_mbps > 0 else 0
                    
                    # Format ETA
                    if eta_seconds < 60:
                        eta_str = f"{eta_seconds:.0f}s"
                    else:
                        eta_str = f"{eta_seconds/60:.1f}m"
                    
                    status_text = f"Downloading {filename}: {downloaded_mb:.1f}/{total_mb:.1f} MB ({progress_percent:.0f}%) - {speed_mbps:.1f} MB/s - ETA: {eta_str}"
                else:
                    status_text = f"Downloading {filename}: {downloaded_mb:.1f}/{total_mb:.1f} MB ({progress_percent:.0f}%)"
            else:
                status_text = f"Downloading {filename}: {downloaded / 1024:.0f} KB"
            
            # Update status bar from main thread
            self.root.after(0, lambda: self.status_bar.config(text=status_text))
    
    def _update_launch_button_state(self):
        """Update launch button enabled/disabled state based on mandatory patches."""
        try:
            # Check if all mandatory patches are up to date
            all_mandatory_ready = True
            for filename, state in self.mandatory_states.items():
                if state != 'updated':
                    all_mandatory_ready = False
                    break
            
            # Enable/disable launch button
            if all_mandatory_ready:
                self.launch_button.config(state="normal")
            else:
                self.launch_button.config(state="disabled")
                
        except Exception as e:
            log_message(f"Error updating launch button state: {e}", "ERROR")
    
    def _set_optional_patches_state(self, state):
        """Enable or disable optional patch tree."""
        # This is a simplified approach - in a full implementation,
        # you might want to grey out the tree or disable individual items
        if state == "disabled":
            self.optional_tree.config(selectmode="none")
        else:
            self.optional_tree.config(selectmode="extended")
    
    def _on_optional_selection_changed(self, *args):
        """Called when optional patch selection changes."""
        self._update_download_button_state()
    
    def _on_mandatory_tree_click(self, event):
        """Handle clicks on mandatory tree."""
        item = self.mandatory_tree.identify_row(event.y)
        if item:
            column = self.mandatory_tree.identify_column(event.x, event.y)
            if column == "#1":  # Status column (first column)
                self._handle_mandatory_click(item)
                return "break"
    
    def _on_mandatory_tree_double_click(self, event):
        """Handle double-clicks on mandatory tree."""
        item = self.mandatory_tree.identify_row(event.y)
        if item:
            self._handle_mandatory_click(item)
            return "break"
    
    def _on_optional_tree_click(self, event):
        """Handle clicks on optional tree."""
        item = self.optional_tree.identify_row(event.y)
        if item:
            column = self.optional_tree.identify_column(event.x, event.y)
            if column == "#1":  # Status column (first column)
                self._handle_optional_click(item)
                return "break"
    
    def _on_optional_tree_double_click(self, event):
        """Handle double-clicks on optional tree."""
        item = self.optional_tree.identify_row(event.y)
        if item:
            self._handle_optional_click(item)
            return "break"
    
    def _on_mandatory_tree_select(self, event):
        """Handle selection changes in mandatory tree."""
        selection = self.mandatory_tree.selection()
        if selection:
            item = selection[0]
            values = self.mandatory_tree.item(item, 'values')
            if len(values) >= 2:
                filename = values[1]  # filename column
                self._show_patch_description(filename)
    
    def _on_optional_tree_select(self, event):
        """Handle selection changes in optional tree."""
        selection = self.optional_tree.selection()
        if selection:
            item = selection[0]
            values = self.optional_tree.item(item, 'values')
            if len(values) >= 2:
                filename = values[1]  # filename column
                self._show_patch_description(filename)
    
    def _show_patch_description(self, filename):
        """Show description for the selected patch."""
        description = "No description available."
        
        # Get description from patch descriptions
        if (self.patch_descriptions and 
            'patches' in self.patch_descriptions and 
            filename in self.patch_descriptions['patches']):
            patch_info = self.patch_descriptions['patches'][filename]
            description = patch_info.get('description', 'No description available.')
        
        # Update description text
        self.description_text.config(state="normal")
        self.description_text.delete("1.0", "end")
        self.description_text.insert("1.0", description)
        self.description_text.config(state="disabled")
    
    def _handle_mandatory_click(self, item):
        """Handle click on mandatory file."""
        values = list(self.mandatory_tree.item(item, 'values'))
        if values:
            filename = values[1]  # filename column
            current_state = self.mandatory_states.get(filename, 'missing')
            
            # Only allow downloads for missing/outdated files
            if current_state == 'missing':
                if self.is_updating:
                    self._add_to_download_queue(filename, False)
                else:
                    self._download_individual_file(filename, False)
    
    def _handle_optional_click(self, item):
        """Handle click on optional file."""
        values = list(self.optional_tree.item(item, 'values'))
        if values:
            filename = values[1]  # filename column
            current_state = self.optional_states.get(filename, 'missing')
            
            # Only allow downloads for missing/outdated files
            if current_state == 'missing':
                if self.is_updating:
                    self._add_to_download_queue(filename, True)
                else:
                    self._download_individual_file(filename, True)
    
    def _refresh_file_status(self):
        """Refresh file status display."""
        # Clear mandatory files
        for item in self.mandatory_tree.get_children():
            self.mandatory_tree.delete(item)
        
        threading.Thread(target=self._check_server_status, daemon=True).start()
    
    def _check_server_status(self):
        """Check server status in background."""
        try:
            # Test connection
            if self.launcher.test_connection():
                self.root.after(0, lambda: self.connection_label.config(text="Connection: Online"))
                
                # Get patch descriptions first
                patch_descriptions = self.launcher.get_patch_descriptions()
                self.patch_descriptions = patch_descriptions
                
                # Populate both file trees with consistent data
                self.root.after(0, self._populate_file_trees)
                
                # Update file count display
                try:
                    mandatory_files = self.launcher.get_mandatory_files()
                    optional_files = self.launcher.get_optional_files()
                    
                    files_text = f"Files: {len(mandatory_files)} mandatory, {len(optional_files)} optional"
                    self.root.after(0, lambda: self.files_label.config(text=files_text))
                except:
                    pass
                
                # Update download button state
                self.root.after(0, self._update_download_button_state)
                
            else:
                self.root.after(0, lambda: self.connection_label.config(text="Connection: Failed"))
                
        except Exception as e:
            log_message(f"Server status check failed: {e}", "ERROR")
            self.root.after(0, lambda: self.connection_label.config(text="Connection: Failed"))
    
    
    def _update_download_button_state(self):
        """Update the download button state based on available updates."""
        # Check mandatory file selections
        mandatory_selected = sum(1 for selected in self.mandatory_selections.values() if selected)
        
        # Check optional file selections
        optional_selected = sum(1 for selected in self.optional_selections.values() if selected)
        
        # Enable if there are any files selected for download
        should_enable = mandatory_selected > 0 or optional_selected > 0
        self.update_button.config(state="normal" if should_enable else "disabled")
    
    
    def _on_launch_game(self):
        """Handle launch game button."""
        try:
            self.status_bar.config(text="Launching game...")
            success = self.launcher.launch_game()
            
            if success:
                self.status_bar.config(text="Game launched successfully")
                if CONFIG['ui']['minimize_on_launch']:
                    self.root.iconify()
            else:
                self.status_bar.config(text="Failed to launch game")
                messagebox.showerror("Launch Failed", "Could not launch the game. Check that Wow.exe exists in the game directory.")
        
        except Exception as e:
            log_message(f"Launch failed: {e}", "ERROR")
            self.status_bar.config(text="Launch failed")
            messagebox.showerror("Launch Failed", f"Failed to launch game: {str(e)}")
    
    def _on_close(self):
        """Handle window close."""
        if self.is_updating and self.update_thread and self.update_thread.is_alive():
            result = messagebox.askyesno(
                "Download in Progress",
                "Downloads are in progress. Are you sure you want to exit?"
            )
            if not result:
                return
        
        self.root.destroy()
    
    def run(self):
        """Run the application."""
        log_message("Starting GUI application")
        self.root.mainloop()


# =============================================================================
# MAIN ENTRY POINT
# =============================================================================

def main():
    """Main application entry point."""
    log_message("============================================================")
    log_message("Zeppelin Launcher v1.0.0 starting up")
    log_message(f"Start time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    try:
        app = MainWindow()
        app.run()
    except Exception as e:
        log_message(f"Fatal error: {e}", "ERROR")
        messagebox.showerror("Fatal Error", f"Application failed to start: {str(e)}")
        sys.exit(1)


if __name__ == "__main__":
    main()