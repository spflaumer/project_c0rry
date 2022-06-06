;    boot.asm, print.asm, read_disk.asm, extended.asm, enagdt.asm, cpuid.asm, paging.asm - Legacy BIOS Bootloader for c0rry 
;    Copyright (C) 2022  1nekomata
;
;    This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.

[bits 16]

[org 0x7c00]

jmp 0:entry

entry:
    xor ax, ax
    mov ds, ax
    cld

    mov ax, 0
    mov bp, 0x7c00
    mov ss, ax
    mov sp, bp

    mov bx, greetings
    call printstr
    mov bx, version
    call printstr

    call read_disk

    jmp prog_space


jmp exit

%include "extra/real/print.asm"
%include "extra/real/read_disk.asm"

exit:
    jmp $

greetings:
    db "Good Morning, Mothafucka!", 13, 10, 0
version:
    db "Welcome to project_c0rry v0.1", 13, 10, 10, 10, 0

times 510-($-$$) db 0
db 0x55, 0xaa
