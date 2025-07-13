"""
Main application window for the Zeppelin Launcher.
"""

import tkinter as tk
from tkinter import ttk, messagebox
import threading
import sys
from pathlib import Path
from typing import Dict, List, Callable, Optional
import webbrowser

# Add parent directory to path for imports
src_dir = Path(__file__).parent.parent
sys.path.insert(0, str(src_dir))

from core.launcher import ZeppelinLauncher
from core.config_manager import ConfigManager
from utils.logger import get_logger


class MainWindow:
    def __init__(self):
        self.logger = get_logger()
        self.root = tk.Tk()
        self.launcher = ZeppelinLauncher()
        self.config = ConfigManager()
        
        # Window state
        self.is_updating = False
        self.update_thread: Optional[threading.Thread] = None
        
        self._setup_window()
        self._create_widgets()
        self._setup_layout()
        self._bind_events()
        
        # Initialize with current state
        self._refresh_file_status()
        
    def _setup_window(self):
        """Configure the main window properties."""
        self.root.title(f"Zeppelin Launcher v1.0.0-dev")
        self.root.geometry("800x600")
        self.root.minsize(600, 400)
        
        # Center window on screen
        self.root.update_idletasks()
        x = (self.root.winfo_screenwidth() // 2) - (800 // 2)
        y = (self.root.winfo_screenheight() // 2) - (600 // 2)
        self.root.geometry(f"800x600+{x}+{y}")
        
        # Configure style
        style = ttk.Style()
        style.theme_use('clam')
        
    def _create_widgets(self):
        """Create all GUI widgets."""
        # Main container
        self.main_frame = ttk.Frame(self.root, padding="10")
        
        # Header frame
        self.header_frame = ttk.Frame(self.main_frame)
        self.title_label = ttk.Label(
            self.header_frame, 
            text="Zeppelin Craft Launcher",
            font=("Arial", 16, "bold")
        )
        self.server_label = ttk.Label(
            self.header_frame,
            text=f"Server: {self.config.get('server', 'name')}",
            font=("Arial", 10)
        )
        
        # Status frame
        self.status_frame = ttk.LabelFrame(self.main_frame, text="Server Status", padding="5")
        self.connection_label = ttk.Label(self.status_frame, text="Connection: Checking...")
        self.files_label = ttk.Label(self.status_frame, text="Files: Loading...")
        
        # File list frame
        self.file_frame = ttk.LabelFrame(self.main_frame, text="File Status", padding="5")
        
        # Create treeview for file list
        columns = ("file", "status", "version", "size")
        self.file_tree = ttk.Treeview(self.file_frame, columns=columns, show="headings", height=10)
        
        # Configure columns
        self.file_tree.heading("file", text="File")
        self.file_tree.heading("status", text="Status")
        self.file_tree.heading("version", text="Version")
        self.file_tree.heading("size", text="Size")
        
        self.file_tree.column("file", width=200)
        self.file_tree.column("status", width=100)
        self.file_tree.column("version", width=80)
        self.file_tree.column("size", width=100)
        
        # Scrollbar for file list
        self.file_scrollbar = ttk.Scrollbar(self.file_frame, orient="vertical", command=self.file_tree.yview)
        self.file_tree.configure(yscrollcommand=self.file_scrollbar.set)
        
        # Progress frame (initially hidden)
        self.progress_frame = ttk.LabelFrame(self.main_frame, text="Download Progress", padding="5")
        self.progress_bar = ttk.Progressbar(self.progress_frame, mode="determinate")
        self.progress_label = ttk.Label(self.progress_frame, text="Ready")
        
        # Button frame
        self.button_frame = ttk.Frame(self.main_frame)
        
        self.update_button = ttk.Button(
            self.button_frame,
            text="Check for Updates",
            command=self._on_check_updates
        )
        
        self.launch_button = ttk.Button(
            self.button_frame,
            text="Launch Game",
            command=self._on_launch_game
        )
        
        self.settings_button = ttk.Button(
            self.button_frame,
            text="Settings",
            command=self._on_settings
        )
        
        # Status bar
        self.status_bar = ttk.Label(
            self.main_frame,
            text="Ready",
            relief="sunken",
            anchor="w"
        )
        
    def _setup_layout(self):
        """Arrange widgets in the window."""
        self.main_frame.grid(row=0, column=0, sticky="nsew")
        
        # Configure main window grid
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        self.main_frame.columnconfigure(0, weight=1)
        self.main_frame.rowconfigure(2, weight=1)  # File frame expands
        
        # Header
        self.header_frame.grid(row=0, column=0, sticky="ew", pady=(0, 10))
        self.title_label.grid(row=0, column=0, sticky="w")
        self.server_label.grid(row=1, column=0, sticky="w")
        
        # Status
        self.status_frame.grid(row=1, column=0, sticky="ew", pady=(0, 10))
        self.status_frame.columnconfigure(0, weight=1)
        self.connection_label.grid(row=0, column=0, sticky="w")
        self.files_label.grid(row=1, column=0, sticky="w")
        
        # File list
        self.file_frame.grid(row=2, column=0, sticky="nsew", pady=(0, 10))
        self.file_frame.columnconfigure(0, weight=1)
        self.file_frame.rowconfigure(0, weight=1)
        
        self.file_tree.grid(row=0, column=0, sticky="nsew")
        self.file_scrollbar.grid(row=0, column=1, sticky="ns")
        
        # Progress (initially hidden)
        self.progress_frame.grid(row=3, column=0, sticky="ew", pady=(0, 10))
        self.progress_frame.columnconfigure(0, weight=1)
        self.progress_bar.grid(row=0, column=0, sticky="ew", pady=(0, 5))
        self.progress_label.grid(row=1, column=0, sticky="w")
        self.progress_frame.grid_remove()  # Hide initially
        
        # Buttons
        self.button_frame.grid(row=4, column=0, sticky="ew", pady=(0, 10))
        self.update_button.grid(row=0, column=0, padx=(0, 5))
        self.launch_button.grid(row=0, column=1, padx=5)
        self.settings_button.grid(row=0, column=2, padx=(5, 0))
        
        # Status bar
        self.status_bar.grid(row=5, column=0, sticky="ew")
        
    def _bind_events(self):
        """Bind event handlers."""
        self.root.protocol("WM_DELETE_WINDOW", self._on_close)
        
    def _refresh_file_status(self):
        """Update the file list display with current status."""
        # Clear existing items
        for item in self.file_tree.get_children():
            self.file_tree.delete(item)
            
        # Check server connectivity in background
        threading.Thread(target=self._check_server_status, daemon=True).start()
        
    def _check_server_status(self):
        """Check server connectivity and file status."""
        try:
            # Test connection
            self.launcher.test_connection()
            self.root.after(0, lambda: self.connection_label.config(text="Connection: Online"))
            
            # Get file lists
            mandatory_files = self.launcher.get_mandatory_files()
            files_info = []
            
            for filename, server_version in mandatory_files.items():
                local_version = self.launcher.version_manager.get_file_version(filename)
                status = "Up to date" if local_version == server_version else "Needs update"
                
                files_info.append({
                    'file': filename,
                    'status': status,
                    'version': f"{local_version or 'None'} -> {server_version}",
                    'size': 'Unknown'
                })
            
            # Update UI from main thread
            self.root.after(0, lambda: self._update_file_list(files_info))
            
        except Exception as e:
            self.logger.error(f"Failed to check server status: {e}")
            self.root.after(0, lambda: self.connection_label.config(text="Connection: Failed"))
            
    def _update_file_list(self, files_info: List[Dict]):
        """Update the file list display."""
        needs_update = 0
        
        for file_info in files_info:
            self.file_tree.insert("", "end", values=(
                file_info['file'],
                file_info['status'],
                file_info['version'],
                file_info['size']
            ))
            
            if file_info['status'] == "Needs update":
                needs_update += 1
                
        self.files_label.config(text=f"Files: {len(files_info)} total, {needs_update} need updates")
        
        # Enable/disable update button
        self.update_button.config(state="normal" if needs_update > 0 else "disabled")
        
    def _on_check_updates(self):
        """Handle update button click."""
        if self.is_updating:
            return
            
        self.is_updating = True
        self.update_button.config(state="disabled", text="Updating...")
        self.progress_frame.grid()  # Show progress
        
        # Start update in background
        self.update_thread = threading.Thread(target=self._perform_updates, daemon=True)
        self.update_thread.start()
        
    def _perform_updates(self):
        """Perform file updates in background thread."""
        try:
            # Get files that need updating
            mandatory_files = self.launcher.get_mandatory_files()
            files_to_update = []
            
            for filename, server_version in mandatory_files.items():
                local_version = self.launcher.version_manager.get_file_version(filename)
                if local_version != server_version:
                    files_to_update.append((filename, server_version))
            
            if not files_to_update:
                self.root.after(0, self._update_complete, "No updates needed")
                return
                
            # Update progress
            total_files = len(files_to_update)
            
            for i, (filename, version) in enumerate(files_to_update):
                # Update progress label
                progress_text = f"Downloading {filename} ({i+1}/{total_files})"
                self.root.after(0, lambda text=progress_text: self.progress_label.config(text=text))
                
                # Update progress bar
                progress = (i / total_files) * 100
                self.root.after(0, lambda p=progress: self.progress_bar.config(value=p))
                
                # Download file
                success = self.launcher.download_file(filename)
                
                if success:
                    # Update version tracking
                    self.launcher.version_manager.set_file_version(filename, version)
                else:
                    self.root.after(0, self._update_complete, f"Failed to download {filename}")
                    return
                    
            # Final progress
            self.root.after(0, lambda: self.progress_bar.config(value=100))
            self.root.after(0, self._update_complete, f"Successfully updated {total_files} files")
            
        except Exception as e:
            self.logger.error(f"Update failed: {e}")
            self.root.after(0, self._update_complete, f"Update failed: {str(e)}")
            
    def _update_complete(self, message: str):
        """Handle update completion."""
        self.is_updating = False
        self.update_button.config(state="normal", text="Check for Updates")
        self.progress_frame.grid_remove()  # Hide progress
        self.status_bar.config(text=message)
        
        # Refresh file status
        self._refresh_file_status()
        
        # Show completion message
        if "Successfully" in message:
            messagebox.showinfo("Update Complete", message)
        elif "Failed" in message:
            messagebox.showerror("Update Failed", message)
            
    def _on_launch_game(self):
        """Handle launch game button click."""
        try:
            self.status_bar.config(text="Launching game...")
            success = self.launcher.launch_game()
            
            if success:
                self.status_bar.config(text="Game launched successfully")
                # Optionally minimize launcher
                if self.config.get('ui', 'minimize_on_launch', fallback='false').lower() == 'true':
                    self.root.iconify()
            else:
                self.status_bar.config(text="Failed to launch game")
                messagebox.showerror("Launch Failed", "Could not launch the game. Check that Wow.exe exists in the game directory.")
                
        except Exception as e:
            self.logger.error(f"Failed to launch game: {e}")
            self.status_bar.config(text="Launch failed")
            messagebox.showerror("Launch Failed", f"Failed to launch game: {str(e)}")
            
    def _on_settings(self):
        """Handle settings button click."""
        # TODO: Implement settings dialog
        messagebox.showinfo("Settings", "Settings dialog not yet implemented")
        
    def _on_close(self):
        """Handle window close event."""
        if self.is_updating and self.update_thread and self.update_thread.is_alive():
            result = messagebox.askyesno(
                "Download in Progress",
                "Downloads are in progress. Are you sure you want to exit?"
            )
            if not result:
                return
                
        self.root.destroy()
        
    def run(self):
        """Start the GUI application."""
        self.logger.info("Starting GUI application")
        self.root.mainloop()