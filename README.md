# project_c0rry

## What is project_c0rry?

project_c0rry is the bootloader of the attempt to create a Minimalistic Operating System, including and a yet to be named Kernel, with a yet to be named Text(perhaps somewhere down the line even Graphical) User Environment.

## Is this for UEFI?
No, UEFI is coming soon ish(trademark)

## How to Compile?

Simply change the working directory to `src` in the Terminal and execute `make` then `make qemu` for your own safety.
In case you would want to use a different emulator like bochs, add boot.flp, that will appear within "src/" after running `make`, as a Floppy and set it up to Boot from it. Also make sure the Emulator is Legacy BIOS compatible, as this Project isn't UEFI, *yet*

## Folder Structure
    src/                        contains the source code and Makefile
        x86_64/ or i386/        contain the code for the 64-bit and 32-bit versions of the BIOS Bootloader
            extra/              some code that is useful but hidden; should probably rename it at some point
                  real/         real mode specific code
                  protected/    protected mode specific code
                  long/         long mode specific code
