cpuidsupport: ; checks if cpuid is supported by flipping the funny bit aka bit 21 in the flags register
    pushfd ; push flags onto stack
    pop eax ; pull flags from stack into eax

    mov ecx, eax ; save flags for later

    xor eax, 1 << 21 ; set bit 21 (cpuid support) to 1

    push eax ; push eax onto stack
    popfd ; pull the stack into the flags register

    pushfd ; copy flags back to eax
    pop eax ; using the stack

    push ecx ; push ecx onto the stack
    popfd ; pull the values into the flags register to restore it to its original state

    xor eax, ecx ; check eax and ecx for similarity; if they are similar that means there is
    jz cpuiderr ; no cpuid support
    ret

lmcap:
    mov eax, 0x80000001 ; this checks for long mode support
    cpuid
    test edx, 1 << 29 ; check if bit 29 is 1 aka long mode is supported
    jz nolong ; if not supported jump to the nolong function
    ret ; return otherwise

nolong:
    hlt ; halt the cpu
cpuiderr:
    hlt ; halt the cpu