[org 0x7e00]
mov bx, pogchamp
call printstr

%include "rlm_print.asm"

exit:
    jmp $

pogchamp:
    db "Good Morning, Mothafucka!", 13, 10, "wait... WE ARE FROM ANOTHER BINARY :O POGCHAMP", 13, 10, "hang on... WE ACTUALLY jmp'd INTO THE OTHER BINARY!? EPIC G4M3R MOMENT!!!", 13, 10, "CLIP THAT CLIP THAT CLIP THAT!!!", 0

times 2048-($-$$) db 0