[org 0x7e00]
mov bx, pminfo
call printstr

jmp enterpm

%include "extra/protected/enagdt.asm"
%include "extra/real/print.asm"

ena20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

enterpm:
    call ena20 ; enable A20 line function
    cli ; disable interrupts or we will crash the machine
    lgdt [g_desc] ; load gdt
    mov eax, cr0 ; actual switch to protected mode
    or eax, 1
    mov cr0, eax
    jmp code_seg:pmstart ; far jump into 32-bit sector

[bits 32] ; 32-bit from this point on

%include "extra/long/cpuid.asm"
%include "extra/long/paging.asm"

pmstart: ; protected mode entry
    mov ax, data_seg ; switching to the new data segment
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; moving stack base to a different point
    mov esp, ebp ; moving stack pointer there as well; now our stack is a little larger

    mov [0xb8000], byte 'G' ; a very basic way to print a letter to the screen

    call cpuidsupport ; check for cpuid support
    call lmcap ; check for 64-bit/long mode support

    call setpagingident ; sets up paging identity
    call gdt64edit ; edit the gdt entries for 64-bit mode

    jmp code_seg:lmstart

[bits 64] ; everything is 64-bit now ( ͡° ͜ʖ ͡°)
lmstart:
    mov edi, 0xb8000 ; store, in the text mode video memory address,
    mov rax, 0x1f201f201f201f20 ; "space" with a white font on blue background
    mov ecx, 500 ; 500
    rep stosq ; times repeatedly

    jmp $ ; just loop for now

pminfo:
    db 13, 10, "Trying to enter Protected Mode and Long Mode afterwards... see you on the other side!", 0
success:
    db 13, 10, "Success!"
times 2048-($-$$) db 0