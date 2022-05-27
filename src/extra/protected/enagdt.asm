g_null_desc:
    dd 0
    dd 0
g_code_seg_desc:
    dw 0xFFFF ; limit; 0xFFFF is the highest address available, so we effectively cover all memory available to us
    dw 0x0000 ; base(low); 0x0000 is the very first bit of memory; again, so we can cover all available to us memory
    db 0x00 ; base(medium), 0x00 again so we cover all available to us memory
    db 10011010b ; flags (description in enagdt.asm.md, section "enagdt.asm - line 7")
    db 11001111b ; flags and upper limit (description in enagdt.asm.md, section "enagdt.asm -line 8")
    db 0x00 ; base(high)
g_data_seg_desc:
    ; same as code segment, except the executable bit is set to 0,
    ; to mark the segment as a data segment
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b ; 5th bit from left to right is the executable bit
    db 11001111b
    db 0x00

g_end:

g_desc: ; some info in enagdt.asm.md section "enagdt.asm - g_desc"
    g_size:
        dw (g_end - g_null_desc - 1)
        dq g_null_desc

code_seg equ (g_code_seg_desc - g_null_desc)
data_seg equ (g_data_seg_desc - g_null_desc)

[bits 32] ; to be compatible with the 32.bit address space

gdt64edit:
    mov [g_code_seg_desc + 6], byte 10101111b ; change the flags of the code segment
    mov [g_data_seg_desc + 6], byte 10101111b ; change the flags of the data segment
    ret ; return

[bits 16] ; so we wont break anything else