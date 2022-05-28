/*
   a kernel to test if everything is working as intended
   compile with a x86_64-elf capable crosscompiler
   gcc example: gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -Wall -m64 -c testkernel.c -o kernel.o
*/

void _start(){
    int *ptr = (int*)0xb8000;
    *ptr = 0x50505050;
    return;
}