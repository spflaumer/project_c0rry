[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, greetings
call printstr
mov bx, version
call printstr

call read_disk

jmp prog_space

jmp exit

%include "rlm_print.asm"
%include "read_disk.asm"

exit:
    jmp $

greetings:
    db "Good Morning, Mothafucka!", 13, 10, 0
version:
    db "Welcome to project_c0rry v0.0", 13, 10, 10, 10, 0

times 510-($-$$) db 0
db 0x55, 0xaa