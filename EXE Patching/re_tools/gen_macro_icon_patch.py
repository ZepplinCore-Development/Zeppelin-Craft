#!/usr/bin/env python3
# F-181: make CreateMacro/EditMacro accept a STRING icon (texture name relative to
# Interface\Icons), not just a numeric icon index. Macros already store the icon as a
# bare name string at macro+0x60; GetMacroInfo returns "Interface\Icons\"+stored. So a
# string icon round-trips through the macro UI, action bars, and save/load.
#
# Hooks:
#   A1) CreateMacro gate 0x568180: lua_isnumber(arg2) -> lua_isstring (accepts str+num)
#   A2) CreateMacro icon-resolution 0x5681CB..0x568208 (62B) -> jmp caveA (str|num -> [ebp-8])
#   B)  EditMacro   icon-resolution 0x567001..0x567059 (89B) -> jmp caveB (str|num|nil -> [ebp-0xc])
import wowre as w
from keystone import *

ks = Ks(KS_ARCH_X86, KS_MODE_32)
TEXT_DELTA = 0x400C00            # VA - file_off for .text
def fileoff(va): return va - TEXT_DELTA

CAVE_A_VA = 0xDD1200            # file 0x72D000
CAVE_B_VA = 0xDD1300            # file 0x72D100
ZBASE_VA, ZBASE_FOFF = 0xDD1000, 0x72CE00
def zfileoff(va): return ZBASE_FOFF + (va - ZBASE_VA)

# ---- Cave A : CreateMacro icon arg2 (number or string) -> [ebp-8] ----
caveA = f"""
    push 2
    push esi
    call 0x84df20            ; lua_isnumber(L,2)
    add esp, 8
    test eax, eax
    jz a_str
    push 2
    push esi
    call 0x84e030            ; lua_tonumber(L,2)
    fnstcw word ptr [ebp-2]
    movzx eax, word ptr [ebp-2]
    or eax, 0xC00
    mov dword ptr [ebp-0xC], eax
    add esp, 8
    fldcw word ptr [ebp-0xC]
    fistp qword ptr [ebp-0x10]
    mov edi, dword ptr [ebp-0x10]
    sub edi, 1
    fldcw word ptr [ebp-2]
    call 0x565c20            ; macro-icon count -> eax
    cmp edi, eax
    jae a_done
    push edi
    call 0x564d70            ; iconArray[edi] -> eax (bare name ptr)
    add esp, 4
    mov dword ptr [ebp-8], eax
    jmp a_done
a_str:
    push 0
    push 2
    push esi
    call 0x84e0e0            ; lua_tolstring(L,2,NULL) -> eax
    add esp, 0xC
    mov dword ptr [ebp-8], eax
a_done:
    jmp 0x568209
"""

# ---- Cave B : EditMacro icon arg3 (number | string | nil) -> [ebp-0xC] ----
caveB = f"""
    push 3
    push esi
    call 0x84df20            ; lua_isnumber(L,3)
    add esp, 8
    test eax, eax
    jz b_notnum
    push 3
    push esi
    call 0x84e030            ; lua_tonumber(L,3)
    fnstcw word ptr [ebp-2]
    movzx eax, word ptr [ebp-2]
    or eax, 0xC00
    mov dword ptr [ebp-0x14], eax
    add esp, 8
    fldcw word ptr [ebp-0x14]
    fistp qword ptr [ebp-0x18]
    mov edi, dword ptr [ebp-0x18]
    sub edi, 1
    cmp dword ptr [0xBEAF94], 0
    fldcw word ptr [ebp-2]
    jne b_skipinit
    call 0x565840            ; populate macro-icon list if empty
b_skipinit:
    cmp edi, dword ptr [0xBEAF94]
    jae b_done
    push edi
    call 0x564d70
    add esp, 4
    mov dword ptr [ebp-0xC], eax
    jmp b_done
b_notnum:
    push 3
    push esi
    call 0x84df60            ; lua_isstring(L,3) -> true only for string (number handled)
    add esp, 8
    test eax, eax
    jz b_done                ; nil/other -> leave iconval 0 (no change)
    push 0
    push 3
    push esi
    call 0x84e0e0            ; lua_tolstring(L,3,NULL) -> eax
    add esp, 0xC
    mov dword ptr [ebp-0xC], eax
b_done:
    jmp 0x56705a
"""

def strip_comments(src):
    return "\n".join(line.split(";", 1)[0] for line in src.splitlines())

encA, _ = ks.asm(strip_comments(caveA), CAVE_A_VA)
encB, _ = ks.asm(strip_comments(caveB), CAVE_B_VA)
encA = bytes(encA); encB = bytes(encB)

def jmp_rel(src_va, dst_va):
    return b"\xE9" + ((dst_va - (src_va + 5)) & 0xFFFFFFFF).to_bytes(4, "little")

# Hook A2 / B : jmp into cave + nop pad to original length
A2_VA, A2_LEN = 0x5681CB, 62
B_VA,  B_LEN  = 0x567001, 89
hookA2 = jmp_rel(A2_VA, CAVE_A_VA);  hookA2 += b"\x90" * (A2_LEN - len(hookA2))
hookB  = jmp_rel(B_VA,  CAVE_B_VA);  hookB  += b"\x90" * (B_LEN  - len(hookB))

# Hook A1 gate: retarget call 0x84df20 -> 0x84df60 at 0x568180
gate_va = 0x568180
gate_new = b"\xE8" + ((0x84DF60 - (gate_va + 5)) & 0xFFFFFFFF).to_bytes(4, "little")

def orig(va, n):
    o = fileoff(va); return w.DATA[o:o+n]

def hx(b): return b.hex(" ").upper()

print("=== sizes ===")
print("caveA", len(encA), "B (fits at", hex(CAVE_A_VA), "-> ends", hex(CAVE_A_VA+len(encA)), ")")
print("caveB", len(encB), "B (fits at", hex(CAVE_B_VA), "-> ends", hex(CAVE_B_VA+len(encB)), ")")
assert CAVE_A_VA+len(encA) <= CAVE_B_VA, "caveA overruns caveB"
assert CAVE_B_VA+len(encB) <= 0xDD2000, "caveB overruns .zdata"
assert len(hookA2)==A2_LEN and len(hookB)==B_LEN

print("\n=== EDIT: gate A1  off", hex(fileoff(gate_va)), "===")
print(" original:", hx(orig(gate_va,5)))
print(" patched :", hx(gate_new))

print("\n=== EDIT: hook A2  off", hex(fileoff(A2_VA)), "===")
print(" original:", hx(orig(A2_VA,A2_LEN)))
print(" patched :", hx(hookA2))

print("\n=== EDIT: caveA   off", hex(zfileoff(CAVE_A_VA)), "===")
print(" original:", hx(b"\x00"*len(encA)))
print(" patched :", hx(encA))

print("\n=== EDIT: hook B  off", hex(fileoff(B_VA)), "===")
print(" original:", hx(orig(B_VA,B_LEN)))
print(" patched :", hx(hookB))

print("\n=== EDIT: caveB   off", hex(zfileoff(CAVE_B_VA)), "===")
print(" original:", hx(b"\x00"*len(encB)))
print(" patched :", hx(encB))

# verify cave target zones are currently zero
for va,enc in [(CAVE_A_VA,encA),(CAVE_B_VA,encB)]:
    o=zfileoff(va); assert w.DATA[o:o+len(enc)]==b"\x00"*len(enc), f"cave @ {hex(va)} not zero!"
print("\nboth cave zones confirmed zero-filled in stock exe.")
