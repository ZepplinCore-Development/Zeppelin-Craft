"""Capture the X display with XGetImage (bypasses xwd's multi-visual path, see I-380).

    grab.py <out.png> [x,y,w,h]     save the screen (optionally cropped) as PNG
    grab.py --probe                 exit 0 if $DISPLAY is reachable
"""
import ctypes
import ctypes.util
import sys

x = ctypes.CDLL(ctypes.util.find_library('X11'))
vp = ctypes.c_void_p


class XImage(ctypes.Structure):
    _fields_ = [('width', ctypes.c_int), ('height', ctypes.c_int), ('xoffset', ctypes.c_int),
                ('format', ctypes.c_int), ('data', vp), ('byte_order', ctypes.c_int),
                ('bitmap_unit', ctypes.c_int), ('bitmap_bit_order', ctypes.c_int),
                ('bitmap_pad', ctypes.c_int), ('depth', ctypes.c_int),
                ('bytes_per_line', ctypes.c_int), ('bits_per_pixel', ctypes.c_int)]


x.XOpenDisplay.restype = vp
x.XDefaultRootWindow.restype = ctypes.c_ulong
x.XGetImage.restype = ctypes.POINTER(XImage)
x.XGetImage.argtypes = [vp, ctypes.c_ulong, ctypes.c_int, ctypes.c_int,
                        ctypes.c_uint, ctypes.c_uint, ctypes.c_ulong, ctypes.c_int]

d = x.XOpenDisplay(None)
if not d:
    sys.exit('cannot open display')
if sys.argv[1] == '--probe':
    sys.exit(0)

from PIL import Image  # noqa: E402  (not needed for --probe)

W, H = x.XDisplayWidth(vp(d), 0), x.XDisplayHeight(vp(d), 0)
im = x.XGetImage(vp(d), x.XDefaultRootWindow(vp(d)), 0, 0, W, H, 0xFFFFFFFF, 2).contents  # ZPixmap
if im.bits_per_pixel != 32:
    sys.exit(f'unexpected {im.bits_per_pixel} bpp root image')
raw = ctypes.string_at(im.data, im.bytes_per_line * H)
img = Image.frombuffer('RGBX', (W, H), raw, 'raw', 'BGRX', im.bytes_per_line, 1).convert('RGB')
if len(sys.argv) > 2:
    cx, cy, cw, ch = map(int, sys.argv[2].split(','))
    img = img.crop((cx, cy, cx + cw, cy + ch))
img.save(sys.argv[1])
