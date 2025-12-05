# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['y:\\wow-server\\Zeppelin-Craft\\Scripts\\Launcher\\src\\standalone_launcher.py'],
    pathex=[],
    binaries=[],
    datas=[('y:\\wow-server\\Zeppelin-Craft\\Scripts\\Launcher\\assets', 'assets')],
    hiddenimports=['tkinter', 'tkinter.ttk', 'tkinter.messagebox', 'tkinter.filedialog', 'PIL', 'PIL.Image', 'PIL.ImageTk'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='ZeppelinLauncher',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['y:\\wow-server\\Zeppelin-Craft\\Scripts\\Launcher\\assets\\icons\\zeppelin.png'],
)
