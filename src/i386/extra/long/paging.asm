ptentry equ 0x1000

setpagingident:
    mov edi, ptentry ; set edi to the page table entry
    mov cr3, edi ; set control register 3 to the table entry

    mov dword [edi], 0x2003 ; create paging entries
    add edi, 0x1000
    mov dword [edi], 0x3003
    add edi, 0x1000
    mov dword [edi], 0x4003
    add edi, 0x1000

    mov ebx, 0x00000003
    mov ecx, 512 ; loop 512 times
    
    .setentry:
        mov dword [edi], ebx
        add ebx, 0x1000
        add edi, 8
        loop .setentry

    mov eax, cr4 ; move control register 4 into eax
    or eax, 1 << 5 ; set bit 6 to 1 enabling PAE
    mov cr4, eax ; apply changes

    mov ecx, 0xC0000080 ; set ecx to the memory address that we will be modifying
    rdmsr ; read from the model specific register
    or eax, 1 << 8 ; set bit 8 to 1, enabling the long mode bit(LM-bit) in the efer msr and putting us into compatibility mode
    wrmsr ; write the changes to the model specific register

    mov eax, cr0 ; copy control register 0 to eax
    or eax, 1 << 31 ; set bit 31 to 1
    mov cr0, eax ; set cr0 to eax, setting the paging-bit(PG-bit)

    ret