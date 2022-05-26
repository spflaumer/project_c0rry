build:
	nasm boot.asm -f bin -o bootloader.bin
	nasm extended.asm -f bin -o extended.bin
	cat bootloader.bin extended.bin > boot.flp
	@rm extended.bin bootloader.bin
clean:
	rm extended.bin boot.flp bootloader.bin