import pefile, struct
from capstone import *

EXE = "/workspace/project/Zeppelin-Craft/EXE Patching/Chromie EXE/Wow.exe"
DATA = open(EXE,'rb').read()
pe = pefile.PE(EXE, fast_load=True)
IB = pe.OPTIONAL_HEADER.ImageBase
SECS = []
for s in pe.sections:
    SECS.append((s.Name.rstrip(b'\x00').decode(errors='replace'),
                 IB+s.VirtualAddress, s.Misc_VirtualSize, s.PointerToRawData, s.SizeOfRawData))

def va_to_off(va):
    for name,vstart,vsize,roff,rsize in SECS:
        if vstart <= va < vstart+max(vsize,rsize):
            return roff + (va - vstart)
    return None

def off_to_va(off):
    for name,vstart,vsize,roff,rsize in SECS:
        if roff <= off < roff+rsize:
            return vstart + (off - roff)
    return None

def sec_of(va):
    for name,vstart,vsize,roff,rsize in SECS:
        if vstart <= va < vstart+max(vsize,rsize):
            return name
    return None

md = Cs(CS_ARCH_X86, CS_MODE_32)
md.detail = True

def disasm_va(va, n=40, count=None):
    off = va_to_off(va)
    code = DATA[off:off+n]
    out=[]
    for i in md.disasm(code, va):
        out.append((i.address, i.mnemonic, i.op_str, i.bytes.hex()))
        if count and len(out)>=count: break
    return out

def show(va, n=120, count=60):
    for addr,m,o,b in disasm_va(va,n,count):
        print(f"0x{addr:08X}  {b:<20} {m} {o}")

def find_bytes(pat, start=0):
    # pat = bytes; returns list of file offsets
    res=[]
    i=DATA.find(pat,start)
    while i!=-1:
        res.append(i)
        i=DATA.find(pat,i+1)
    return res

def find_str(s):
    if isinstance(s,str): s=s.encode()
    return find_bytes(s+b'\x00')

# find references to a VA (as absolute 4-byte little-endian) anywhere
def find_refs_to_va(va):
    pat = struct.pack('<I', va)
    offs = find_bytes(pat)
    return [(o, off_to_va(o)) for o in offs]

if __name__=="__main__":
    print("ImageBase", hex(IB))
