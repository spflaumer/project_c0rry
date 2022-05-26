prog_space equ 0x7e00

read_disk:
    mov ah, 0x02
    mov bx, prog_space
    mov al, 4 ; amount of sectors to read
    mov dl, [boot_disk] ; disk to read from
    mov ch, 0x00 ; cylinder
    mov dh, 0x00 ; disk head
    mov cl, 0x02 ; sector

    int 0x13 ; bios read interrupt

    jc diskreaderr

    ret

boot_disk:
    db 0

diskreaderrstr:
    db "Failed to read from Disk!.. idk why tho", 13, 10, "Have fun tinkering! >:]", 0
diskreaderr:
    mov bx, diskreaderrstr
    call printstr
    
    jmp $