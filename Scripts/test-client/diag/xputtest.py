# XPutImage a 32bpp R/G/B/W strip into a window with/without a private colormap (no GL).
import ctypes,ctypes.util,sys,time
x=ctypes.CDLL(ctypes.util.find_library('X11')); vp=ctypes.c_void_p
x.XOpenDisplay.restype=vp; x.XDefaultRootWindow.restype=ctypes.c_ulong; x.XDefaultVisual.restype=vp; x.XCreateColormap.restype=ctypes.c_ulong
x.XCreateColormap.argtypes=[vp,ctypes.c_ulong,vp,ctypes.c_int]
class SWA(ctypes.Structure): _fields_=[('bg_pixmap',ctypes.c_ulong),('bg_pixel',ctypes.c_ulong),('border_pixmap',ctypes.c_ulong),('border_pixel',ctypes.c_ulong),('bit_gravity',ctypes.c_int),('win_gravity',ctypes.c_int),('backing_store',ctypes.c_int),('backing_planes',ctypes.c_ulong),('backing_pixel',ctypes.c_ulong),('save_under',ctypes.c_int),('event_mask',ctypes.c_long),('dnp',ctypes.c_long),('override',ctypes.c_int),('colormap',ctypes.c_ulong),('cursor',ctypes.c_ulong)]
d=x.XOpenDisplay(None); root=x.XDefaultRootWindow(vp(d)); vis=x.XDefaultVisual(vp(d),0)
swa=SWA(); mask=0x8
if sys.argv[1]=='cmap': swa.colormap=x.XCreateColormap(vp(d),root,vp(vis),0); mask|=0x2000
x.XCreateWindow.restype=ctypes.c_ulong; x.XCreateWindow.argtypes=[vp,ctypes.c_ulong,ctypes.c_int,ctypes.c_int,ctypes.c_uint,ctypes.c_uint,ctypes.c_uint,ctypes.c_int,ctypes.c_uint,vp,ctypes.c_ulong,ctypes.c_void_p]
w=x.XCreateWindow(vp(d),root,0,0,400,100,0,24,1,vp(vis),mask,ctypes.byref(swa)); x.XMapWindow(vp(d),ctypes.c_ulong(w)); x.XSync(vp(d),0); time.sleep(0.5)
buf=bytearray()
for y in range(100):
    for i in range(400): buf+=bytes([(0,0,255,0),(0,255,0,0),(255,0,0,0),(255,255,255,0)][i//100])
cb=(ctypes.c_char*len(buf)).from_buffer(buf)
x.XCreateImage.restype=vp; x.XCreateImage.argtypes=[vp,vp,ctypes.c_uint,ctypes.c_int,ctypes.c_int,ctypes.c_char_p,ctypes.c_uint,ctypes.c_uint,ctypes.c_int,ctypes.c_int]
img=x.XCreateImage(vp(d),vp(vis),24,2,0,ctypes.cast(cb,ctypes.c_char_p),400,100,32,0)
x.XCreateGC.restype=vp; gc=x.XCreateGC(vp(d),ctypes.c_ulong(w),0,None)
x.XPutImage.argtypes=[vp,ctypes.c_ulong,vp,vp]+[ctypes.c_int]*4+[ctypes.c_uint]*2
x.XPutImage(vp(d),w,vp(gc),vp(img),0,0,0,0,400,100); x.XSync(vp(d),0); time.sleep(6)
