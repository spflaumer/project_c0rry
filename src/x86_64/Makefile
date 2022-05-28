# you can choose a different compiler by using `CC=<compiler prefix> make`
# the compiler needs to be capable of producing x86_64 compatible ELF binaries

CC = x86_64-elf-

build:
	nasm boot.asm -f bin -o bootloader.bin
	nasm extended.asm -f elf64 -o extended.o
	${CC}gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -Wall -m64 -c ../testkernel.c -o kernel.o
	${CC}ld -T"linker.ld"
	cat bootloader.bin kernel.bin > boot.flp
	@rm bootloader.bin kernel.bin extended.o kernel.o
clean:
	rm bootloader.bin kernel.o kernel.bin extended.o || rm boot.flp
qemu:
	qemu-system-x86_64 -fda boot.flp -d int -no-reboot
