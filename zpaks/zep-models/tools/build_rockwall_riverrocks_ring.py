#!/usr/bin/env python3
"""Build rockwall_riverrocks.m2 = 6 copies of the backported river-rock clump arranged
in a 60-deg ring around the caster, all weighted to the root bone, with the root bone
yawed by a GLOBAL SEQUENCE so the whole ring orbits continuously (independent of
animation playback — this is why the prior anim-driven version didn't move)."""
import struct, math

STAGE="/tmp/claude-99/-workspace/cb471941-1bbf-4c9e-a099-2d5d47b62890/scratchpad/riverrock_convert"
DST="/workspace/project/Zeppelin-Craft/zpaks/zep-models/mpq/source-assets/Spells"
SCALE=0.20; R=1.5; H=1.2; N=6; PERIOD=4000   # ms per full orbit
NEWTEX=b"SPELLS\\rockwall_riverrocks.blp"
VSZ=48

def rotz(x,y,a):
    c,s=math.cos(a),math.sin(a); return x*c-y*s, x*s+y*c
def enc_q(v):  # float[-1,1] -> M2 compressed int16
    v=max(-1.0,min(1.0,v))
    return int(round(v*32767))-32768 if v>=0 else int(round(v*32767))+32767

d=bytearray(open(f"{STAGE}/uldum_riverrocksgrass_06.m2","rb").read())
assert d[:4]==b'MD20'
g=lambda o: struct.unpack_from('<I',d,o)[0]

# --- repath texture ---
ot=g(0x54); fcount,fofs=struct.unpack_from('<II',d,ot+8)
assert fcount>=len(NEWTEX)+1
d[fofs:fofs+fcount]=NEWTEX+b'\x00'*(fcount-len(NEWTEX)); struct.pack_into('<I',d,ot+8,len(NEWTEX)+1)

# --- read clean verts, compute clump center ---
nv,ov=g(0x3C),g(0x40)
raw=[bytes(d[ov+i*VSZ:ov+i*VSZ+VSZ]) for i in range(nv)]
pts=[struct.unpack_from('<3f',v,0) for v in raw]
cx=sum(p[0] for p in pts)/nv; cy=sum(p[1] for p in pts)/nv; cz=sum(p[2] for p in pts)/nv

def base_vert(v):  # scale about clump center, place base clump at (R,0,H)
    b=bytearray(v)
    x,y,z=struct.unpack_from('<3f',b,0)
    struct.pack_into('<3f',b,0,(x-cx)*SCALE+R,(y-cy)*SCALE+0.0,(z-cz)*SCALE+H)
    return bytes(b)
def ring_copy(v,ang):  # rotate a base vert (pos+normal) about Z by ang
    b=bytearray(v)
    x,y,z=struct.unpack_from('<3f',b,0); nx,ny,nz=struct.unpack_from('<3f',b,20)
    x,y=rotz(x,y,ang); nx,ny=rotz(nx,ny,ang)
    struct.pack_into('<3f',b,0,x,y,z); struct.pack_into('<3f',b,20,nx,ny,nz)
    return bytes(b)

base=[base_vert(v) for v in raw]
new_verts=[]
for k in range(N):
    a=math.radians(k*360.0/N)
    new_verts += [ring_copy(v,a) for v in base]
newnV=len(new_verts)   # 233*6 = 1398

# --- relocate vertex block to EOF ---
ovN=len(d); d+=b''.join(new_verts)
struct.pack_into('<I',d,0x3C,newnV); struct.pack_into('<I',d,0x40,ovN)

# --- bbox ---
xs=[struct.unpack_from('<f',v,0)[0] for v in new_verts]
ys=[struct.unpack_from('<f',v,4)[0] for v in new_verts]
zs=[struct.unpack_from('<f',v,8)[0] for v in new_verts]
rad=max(math.sqrt(x*x+y*y+z*z) for x,y,z in zip(xs,ys,zs))
struct.pack_into('<6f',d,0xA0,min(xs),min(ys),min(zs),max(xs),max(ys),max(zs)); struct.pack_into('<f',d,0xB8,rad)
struct.pack_into('<6f',d,0xBC,min(xs),min(ys),min(zs),max(xs),max(ys),max(zs)); struct.pack_into('<f',d,0xD4,rad)

# --- bone[0]: pivot to vertical axis through origin + set 0x200 "transformed" flag
#     (without 0x200 the client treats the bone as static and skips its animation) ---
ob=g(0x30); struct.pack_into('<3f',d,ob+76,0.0,0.0,0.0)
bflags=struct.unpack_from('<I',d,ob+4)[0]; struct.pack_into('<I',d,ob+4,bflags|0x200)

# --- add a global sequence (PERIOD ms) ---
gs_ofs=len(d); d+=struct.pack('<I',PERIOD)
struct.pack_into('<I',d,0x14,1); struct.pack_into('<I',d,0x18,gs_ofs)   # nGlobalSeq=1, ofs

# --- global-sequence yaw track on bone[0] (5 keys 0..360 deg about Z) ---
keys=5; ts=[round(PERIOD*i/(keys-1)) for i in range(keys)]
quats=[]
for i in range(keys):
    th=math.radians(i*360.0/(keys-1)); z=math.sin(th/2); w=math.cos(th/2)
    quats.append(struct.pack('<4h',enc_q(0),enc_q(0),enc_q(z),enc_q(w)))
ts_data=len(d); d+=b''.join(struct.pack('<I',t) for t in ts)
val_data=len(d); d+=b''.join(quats)
ts_outer=len(d); d+=struct.pack('<II',keys,ts_data)
val_outer=len(d); d+=struct.pack('<II',keys,val_data)
struct.pack_into('<HH',d,ob+36,1,0)            # interp=linear, global_sequence=0
struct.pack_into('<II',d,ob+40,1,ts_outer)     # timestamps outer (1 sub-array)
struct.pack_into('<II',d,ob+48,1,val_outer)    # values outer

open(f"{DST}/rockwall_riverrocks.m2","wb").write(d)

# ================= SKIN =================
s=bytearray(open(f"{STAGE}/uldum_riverrocksgrass_0600.skin","rb").read())
def sa(i): return struct.unpack_from('<II',s,4+i*8)
ic,io=sa(0); tc,to=sa(1); pc,po=sa(2); mc,mo=sa(3); uc,uo=sa(4)
clean_tris=[struct.unpack_from('<H',s,to+2*i)[0] for i in range(tc)]
clean_props=[bytes(s[po+4*i:po+4*i+4]) for i in range(pc)]
_ = clean_props  # (replaced below: static doodad props are (0,1,2,3) junk vs our 1-bone lookup)
SUBSZ=48; sub0=bytes(s[mo:mo+SUBSZ])
USZ=24; tu0=bytes(s[uo:uo+USZ])
# build new arrays
new_indices=list(range(newnV))                                   # identity local->global
new_props=[b'\x00\x00\x00\x00']*newnV   # all verts -> boneLookup[0] = bone0 (matches donor)
assert len(new_props)==newnV
new_tris=[]
for k in range(N):
    new_tris += [t + k*nv for t in clean_tris]                   # nv=233 verts per clump
# one submesh covering everything
sub=bytearray(sub0)
struct.pack_into('<HHHH',sub,4,0,newnV,0,len(new_tris))          # vstart,vcount,tstart,tcount
ns=bytearray(s)
def app(b):
    o=len(ns); ns.extend(b); return o
io2=app(b''.join(struct.pack('<H',i) for i in new_indices))
to2=app(b''.join(struct.pack('<H',t) for t in new_tris))
po2=app(b''.join(new_props))
mo2=app(bytes(sub))
uo2=app(tu0)
struct.pack_into('<II',ns,4+0*8,newnV,io2)
struct.pack_into('<II',ns,4+1*8,len(new_tris),to2)
struct.pack_into('<II',ns,4+2*8,newnV,po2)
struct.pack_into('<II',ns,4+3*8,1,mo2)
struct.pack_into('<II',ns,4+4*8,1,uo2)
open(f"{DST}/rockwall_riverrocks00.skin","wb").write(ns)
import shutil; shutil.copyfile(f"{STAGE}/uldum_riverrocksgrass.blp", f"{DST}/rockwall_riverrocks.blp")

print(f"verts {newnV} (={N}x{nv}) tris {len(new_tris)} | ring R={R} H={H} period={PERIOD}ms | bbox r={rad:.2f}")
# validate
vd=open(f"{DST}/rockwall_riverrocks.m2","rb").read(); vg=lambda o: struct.unpack_from('<I',vd,o)[0]
assert vg(0x3C)==newnV and vg(0x40)+newnV*VSZ<=len(vd)
assert vg(0x14)==1
vs=open(f"{DST}/rockwall_riverrocks00.skin","rb").read()
c0,o0=struct.unpack_from('<II',vs,4); c1,o1=struct.unpack_from('<II',vs,12)
assert c0==newnV and max(struct.unpack_from('<H',vs,o1+2*i)[0] for i in range(c1))<newnV
print("VALIDATION OK: m2 verts",vg(0x3C),"gseq",vg(0x14),"| skin idx",c0,"tris",c1)
