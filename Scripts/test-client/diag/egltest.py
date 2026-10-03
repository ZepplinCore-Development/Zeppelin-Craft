# Minimal EGL+X11 colour test, no Wine: draws R/G/B/W quarters, swaps, captures via xwd.
import ctypes,ctypes.util,sys,subprocess,os,time
want_alpha=int(sys.argv[1]); want_vis=int(sys.argv[2]) if len(sys.argv)>2 else 0
egl=ctypes.CDLL(ctypes.util.find_library('EGL')); gl=ctypes.CDLL(ctypes.util.find_library('GL')); x=ctypes.CDLL(ctypes.util.find_library('X11'))
vp=ctypes.c_void_p
x.XOpenDisplay.restype=vp; x.XDefaultRootWindow.restype=ctypes.c_ulong; x.XCreateSimpleWindow.restype=ctypes.c_ulong
x.XCreateSimpleWindow.argtypes=[vp,ctypes.c_ulong]+[ctypes.c_int]*2+[ctypes.c_uint]*3+[ctypes.c_ulong]*2
egl.eglGetDisplay.restype=vp; egl.eglGetDisplay.argtypes=[vp]; egl.eglCreateWindowSurface.restype=vp; egl.eglCreateContext.restype=vp
egl.eglCreateWindowSurface.argtypes=[vp,vp,ctypes.c_ulong,vp]; egl.eglCreateContext.argtypes=[vp,vp,vp,vp]; egl.eglMakeCurrent.argtypes=[vp]*4; egl.eglSwapBuffers.argtypes=[vp,vp]
xd=x.XOpenDisplay(None); d=egl.eglGetDisplay(xd); egl.eglInitialize(vp(d),None,None); egl.eglBindAPI(0x30A2)
att=(ctypes.c_int*9)(0x3024,8,0x3023,8,0x3022,8,0x3021,want_alpha,0x3038)
cf=(vp*64)(); n=ctypes.c_int(); egl.eglChooseConfig(vp(d),att,cf,64,ctypes.byref(n))
pick=None
for i in range(n.value):
    a=ctypes.c_int(); b=ctypes.c_int(); egl.eglGetConfigAttrib(vp(d),vp(cf[i]),0x3021,ctypes.byref(a)); egl.eglGetConfigAttrib(vp(d),vp(cf[i]),0x3020,ctypes.byref(b))
    v=ctypes.c_int(); egl.eglGetConfigAttrib(vp(d),vp(cf[i]),0x302E,ctypes.byref(v))
    if a.value==want_alpha and (not want_vis or v.value==want_vis): pick=cf[i]; print('config alpha',a.value,'buffer',b.value,'visual',v.value); break
class VI(ctypes.Structure): _fields_=[('visual',vp),('visualid',ctypes.c_ulong),('screen',ctypes.c_int),('depth',ctypes.c_int),('cls',ctypes.c_int),('r',ctypes.c_ulong),('g',ctypes.c_ulong),('b',ctypes.c_ulong),('cms',ctypes.c_int),('bits',ctypes.c_int)]
class SWA(ctypes.Structure): _fields_=[('bg_pixmap',ctypes.c_ulong),('bg_pixel',ctypes.c_ulong),('border_pixmap',ctypes.c_ulong),('border_pixel',ctypes.c_ulong),('bit_gravity',ctypes.c_int),('win_gravity',ctypes.c_int),('backing_store',ctypes.c_int),('backing_planes',ctypes.c_ulong),('backing_pixel',ctypes.c_ulong),('save_under',ctypes.c_int),('event_mask',ctypes.c_long),('dnp',ctypes.c_long),('override',ctypes.c_int),('colormap',ctypes.c_ulong),('cursor',ctypes.c_ulong)]
vid=ctypes.c_int(); egl.eglGetConfigAttrib(vp(d),vp(pick),0x302E,ctypes.byref(vid))
t=VI(); t.visualid=vid.value; n2=ctypes.c_int(); x.XGetVisualInfo.restype=ctypes.POINTER(VI); vi=x.XGetVisualInfo(vp(xd),1,ctypes.byref(t),ctypes.byref(n2))[0]
root=x.XDefaultRootWindow(vp(xd)); x.XCreateColormap.restype=ctypes.c_ulong; x.XCreateColormap.argtypes=[vp,ctypes.c_ulong,vp,ctypes.c_int]
swa=SWA(); swa.colormap=x.XCreateColormap(vp(xd),root,vp(vi.visual),0); swa.border_pixel=0
x.XCreateWindow.restype=ctypes.c_ulong; x.XCreateWindow.argtypes=[vp,ctypes.c_ulong,ctypes.c_int,ctypes.c_int,ctypes.c_uint,ctypes.c_uint,ctypes.c_uint,ctypes.c_int,ctypes.c_uint,vp,ctypes.c_ulong,ctypes.c_void_p]
mode=sys.argv[3] if len(sys.argv)>3 else 'cmap'
if mode=='parent': w=x.XCreateWindow(vp(xd),root,0,0,400,100,0,0,1,None,0x8,ctypes.byref(swa))
elif mode=='vis': w=x.XCreateWindow(vp(xd),root,0,0,400,100,0,vi.depth,1,vp(vi.visual),0x8,ctypes.byref(swa))
else: w=x.XCreateWindow(vp(xd),root,0,0,400,100,0,vi.depth,1,vp(vi.visual),0x2000|0x8,ctypes.byref(swa))
print('mode',mode); print('window visual',hex(vi.visualid),'class',vi.cls); x.XMapWindow(vp(xd),ctypes.c_ulong(w)); x.XSync(vp(xd),0)
s=egl.eglCreateWindowSurface(vp(d),vp(pick),w,None); c=egl.eglCreateContext(vp(d),vp(pick),None,None); egl.eglMakeCurrent(vp(d),vp(s),vp(s),vp(c))
gl.glClearColor.argtypes=[ctypes.c_float]*4; gl.glEnable(0x0C11)
for i,col in enumerate([(1,0,0),(0,1,0),(0,0,1),(1,1,1)]):
    gl.glScissor(i*100,0,100,100); gl.glClearColor(*col,1.0); gl.glClear(0x4000)
egl.eglSwapBuffers(vp(d),vp(s)); x.XSync(vp(xd),0); time.sleep(6)
