printstr:
    mov ah, 0x0e
    .loop:
        mov al, [bx]
        int 0x10

        inc bx

        cmp byte [bx], 0
        jne .loop
    ret
