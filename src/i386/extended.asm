jmp enterpm

%include "extra/protected/enagdt.asm"
%include "extra/real/print.asm"

ena20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

enterpm:
    mov bx, pminfo
    call printstr

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

    ;mov ebp, 0x90000 ; moving stack base to a different point
    ;mov esp, ebp ; moving stack pointer there as well; now our stack is a little larger

    mov edi, 0xb8000 ; store, in the text mode video memory address,
    mov eax, 0x1f201f201f201f20 ; "space" with a white font on blue background
    mov ecx, 1000 ; 1000
    rep stosd ; times repeatedly

    call enasse ; enable sse extension

    [extern _start] ; start from kernel
    call _start ; enter kernel

    jmp $ ; jump endlessly once we return from the kernel

enasse:
    mov eax, 0x1
    cpuid ; get cpuid
    test edx, 1<<25 ; test for SSE support
    jz .nsprt ; end the bootloader

    mov eax, cr0 ; get cr0
    and ax, 0b11111101 ; set them up
    or ax, 0b00000001 
    mov cr0, eax ; apply changes

    xor eax, eax ; clear the register just in case

    mov eax, cr4 ; get cr4
    or ax, 0b1100000000 ; set bits 9 and 10 to 1
    mov cr4, eax ; apply changes

    .nsprt:
        jmp $

    ret

pminfo:
    db 13, 10, "Trying to enter Protected Mode and Long Mode afterwards... see you on the other side!", 0
success:
    db 13, 10, "Success!"
times 2048-($-$$) db 0
