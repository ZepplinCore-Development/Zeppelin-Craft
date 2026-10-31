"""F-230: offline software head renderer (proof renders for facial_graft_proof.py): chosen geosets + composited character texture.
env: ZR race, ZS sex, ZD model dir (default zep-hd-curated parsed-assets), ZF file stem override."""
import struct, sys, math, functools, os
import numpy as np
from PIL import Image, ImageDraw
CRAFT='/workspace/project/Zeppelin-Craft'
sys.path[:0]=[CRAFT+'/cli',CRAFT,CRAFT+'/Scripts/Character Skins']
import skin_preview as sp
from lib.wardrobe.blp import read_blp
from lib.wardrobe.compositor import REGIONS, SCALE
RACE=int(os.environ.get('ZR','1')); SEX=int(os.environ.get('ZS','0'))
FOLD={1:'HUMAN',2:'ORC',3:'DWARF',4:'NIGHTELF',5:'SCOURGE',6:'TAUREN',7:'GNOME',8:'TROLL',10:'BLOODELF',11:'DRAENEI'}[RACE]; SX=['MALE','FEMALE'][SEX]
D=os.environ.get('ZD') or CRAFT+f'/zpaks/zep-hd-curated/mpq/parsed-assets/CHARACTER/{FOLD}/{SX}/'
STEM=os.environ.get('ZF') or f'{FOLD}{SX}'
def _ci(name):
    want = name.upper()
    return next((os.path.join(D, f) for f in os.listdir(D) if f.upper() == want), D + name)
m=open(_ci(f'{STEM}.M2'),'rb').read()
def arr(o): return struct.unpack_from('<II',m,o)
nv,ov=arr(60)
raw=np.frombuffer(m,dtype=np.uint8,count=48*nv,offset=ov).reshape(nv,48)
POS=raw[:,0:12].copy().view('<f4').reshape(nv,3)
NRM=raw[:,20:32].copy().view('<f4').reshape(nv,3)
UV=raw[:,32:40].copy().view('<f4').reshape(nv,2)
nt,ot=arr(80); TEX=[]
for i in range(nt):
    ty,fl,ln,lo=struct.unpack_from('<IIII',m,ot+16*i); TEX.append((ty,m[lo:lo+ln].rstrip(b'\0').decode(errors='replace')))
nm,om=arr(112); MAT=[struct.unpack_from('<HH',m,om+4*i) for i in range(nm)]
ntl,otl=arr(128); TL=[struct.unpack_from('<H',m,otl+2*i)[0] for i in range(ntl)]
s=open(_ci(f'{STEM}{os.environ.get("ZV","00")}.SKIN'),'rb').read()
ni,oi=struct.unpack_from('<II',s,4); IDX=np.frombuffer(s,dtype='<u2',count=ni,offset=oi).astype(np.int64)
ntr,otr=struct.unpack_from('<II',s,12); TRI=np.frombuffer(s,dtype='<u2',count=ntr,offset=otr).astype(np.int64)
nsm,osm=struct.unpack_from('<II',s,28); nb,ob=struct.unpack_from('<II',s,36)
SUB=[]
for k in range(nsm):
    gid,lvl,vs,vc,is_,ic=struct.unpack_from('<6H',s,osm+48*k)
    SUB.append(dict(id=gid,istart=is_+(lvl<<16),icount=ic))
BAT=[]
for b in range(nb):
    f=struct.unpack_from('<BbHHHhHHHH',s,ob+24*b)
    BAT.append(dict(sub=f[3],prio=f[1],mat=f[6],tex=TL[f[9]]))
files=sp.files_resolver()
query=sp._dbc_query_fn('live')
@functools.lru_cache(None)
def blp(p):
    f=files.find(p)
    if not f and os.environ.get('MODELS'):     # a texture a not-yet-landed graft ships (facial_graft.py preview)
        cand=os.path.join(os.environ['MODELS'], *p.replace('\\','/').upper().split('/')[1:])
        f=cand if os.path.exists(cand) else None
    if not f: raise SystemExit('missing '+p)
    return read_blp(f).convert('RGBA')
def section_rows(sec,typ,col):
    r=query(f'SELECT texture_1,texture_2,texture_3 FROM charsections WHERE race={RACE} AND gender={SEX} AND base_section={sec} AND type={typ} AND color_index={col} ORDER BY id DESC LIMIT 1')
    return r[0] if r else None
def blit(canvas,im,region):
    x,y,w,h=[v*SCALE for v in REGIONS[region]]
    canvas.alpha_composite(im.resize((w,h),Image.LANCZOS),(x,y))
def put_face(canvas,r):
    if r and r['texture_1']: blit(canvas,blp(r['texture_1']),'FaceLower')
    if r and r['texture_2']: blit(canvas,blp(r['texture_2']),'FaceUpper')
@functools.lru_cache(None)
def body_texture(skin=0,face=0,facial=None,haircol=0,pieces=()):
    """facial = legacy section-2 variation (None = none); pieces = section-10 piece types."""
    canvas,extra=sp.bake(files,query,RACE,SEX,skin,face,(0,0,0))
    if facial is not None: put_face(canvas,section_rows(2,facial,haircol))
    for p in pieces: put_face(canvas,section_rows(10,p,haircol))
    return np.asarray(canvas).astype(np.float32)/255, (np.asarray(extra.convert('RGBA')).astype(np.float32)/255 if extra else None)
HAIR=None
def set_hair(col,style=0):
    global HAIR
    r=section_rows(3,style,col)
    HAIR=np.asarray(blp(r['texture_1'])).astype(np.float32)/255 if r and r['texture_1'] else None
def texarr(i,body,extra):
    ty,name=TEX[i]
    if ty==1: return body
    if ty==8: return extra
    if ty==6: return HAIR
    if ty==0 and name: return np.asarray(blp(name)).astype(np.float32)/255
    return None
def render(geosets,body,extra,view='front',size=300,box=(0,1.8,0.25)):
    yaw={'front':0,'side':90,'q':40}[view] if isinstance(view,str) else view
    a=math.radians(yaw)
    R=np.array([[math.cos(a),-math.sin(a),0],[math.sin(a),math.cos(a),0],[0,0,1]])
    P=POS@R.T; N=NRM@R.T
    cx,cz,half=box
    sx=(P[:,1]-cx)/(2*half)*size+size/2; sy=(cz-P[:,2])/(2*half)*size+size/2; depth=P[:,0]
    img=np.zeros((size,size,3),np.float32); img[:]=0.18
    zb=np.full((size,size),-1e9,np.float32)
    light=np.array([0.8,0.3,0.5]); light/=np.linalg.norm(light)
    passes=[[],[]]
    for b in BAT:
        gid=SUB[b['sub']]['id']
        if gid!=0 and gid not in geosets: continue
        if gid==0 and b['tex']<len(TEX) and TEX[b['tex']][0] not in (1,8,6): continue
        blend=MAT[b['mat']][1]
        passes[1 if blend>=2 else 0].append((b,blend))
    for pi,lst in enumerate(passes):
        for b,blend in lst:
            T=texarr(b['tex'],body,extra)
            if T is None: continue
            th,tw=T.shape[:2]
            sm=SUB[b['sub']]
            tri=IDX[TRI[sm['istart']:sm['istart']+sm['icount']]].reshape(-1,3)
            for t in tri:
                xs=sx[t]; ys=sy[t]
                if P[t,2].max()<cz-half*1.2: continue
                x0=max(int(xs.min()),0); x1=min(int(xs.max())+1,size-1); y0=max(int(ys.min()),0); y1=min(int(ys.max())+1,size-1)
                if x0>x1 or y0>y1: continue
                gx,gy=np.meshgrid(np.arange(x0,x1+1)+0.5,np.arange(y0,y1+1)+0.5)
                d=(ys[1]-ys[2])*(xs[0]-xs[2])+(xs[2]-xs[1])*(ys[0]-ys[2])
                if abs(d)<1e-9: continue
                w0=((ys[1]-ys[2])*(gx-xs[2])+(xs[2]-xs[1])*(gy-ys[2]))/d
                w1=((ys[2]-ys[0])*(gx-xs[2])+(xs[0]-xs[2])*(gy-ys[2]))/d
                w2=1-w0-w1
                ins=(w0>=0)&(w1>=0)&(w2>=0)
                if not ins.any(): continue
                z=w0*depth[t[0]]+w1*depth[t[1]]+w2*depth[t[2]]
                u=w0*UV[t[0],0]+w1*UV[t[1],0]+w2*UV[t[2],0]; v=w0*UV[t[0],1]+w1*UV[t[1],1]+w2*UV[t[2],1]
                tx=((u%1)*tw).astype(int).clip(0,tw-1); ty=((v%1)*th).astype(int).clip(0,th-1)
                c=T[ty,tx]
                n=w0[...,None]*N[t[0]]+w1[...,None]*N[t[1]]+w2[...,None]*N[t[2]]
                n/=np.linalg.norm(n,axis=-1,keepdims=True)+1e-9
                sh=0.45+0.55*np.clip(n@light,0,1)
                zs=zb[y0:y1+1,x0:x1+1]
                vis=ins&(z>zs)
                if blend==1: vis&=c[...,3]>0.5
                if pi==0:
                    img[y0:y1+1,x0:x1+1][vis]=c[...,:3][vis]*sh[...,None][vis]
                    zs[vis]=z[vis]
                else:
                    al=c[...,3:4][vis]
                    if blend in (3,4): img[y0:y1+1,x0:x1+1][vis]=np.clip(img[y0:y1+1,x0:x1+1][vis]+c[...,:3][vis]*al,0,1)
                    else: img[y0:y1+1,x0:x1+1][vis]=img[y0:y1+1,x0:x1+1][vis]*(1-al)+c[...,:3][vis]*al
    return Image.fromarray((img.clip(0,1)*255).astype(np.uint8))
def label(im,text):
    d=ImageDraw.Draw(im); d.rectangle((0,0,im.width,14),fill=(0,0,0)); d.text((3,1),text,fill=(255,255,0)); return im
def sheet(tiles,cols,out):
    w,h=tiles[0].size; rows=(len(tiles)+cols-1)//cols
    S=Image.new('RGB',(w*cols,h*rows),(10,10,10))
    for i,t in enumerate(tiles): S.paste(t,((i%cols)*w,(i//cols)*h))
    S.save(out,optimize=True); print('wrote',out,S.size)
