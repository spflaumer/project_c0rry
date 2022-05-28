CP = i386-elf-
CC = gcc
NT = elf
M = -m32

build:
	nasm boot.asm -f bin -o bootloader.bin
	nasm extended.asm -f ${NT} -o extended.o
	${CP}${CC} -Ttext 0x8000 -ffreestanding -mno-red-zone -Wall ${M} -c ../testkernel.c -o kernel.o
	${CP}ld -T"linker.ld"
	cat bootloader.bin kernel.bin > boot.flp
	@rm bootloader.bin kernel.bin extended.o kernel.o
clean:
	rm bootloader.bin kernel.o kernel.bin extended.o || rm boot.flp
qemu:
	qemu-system-x86_64 -fda boot.flp -d int -no-reboot
