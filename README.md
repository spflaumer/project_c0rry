# project_c0rry

## What is project_c0rry?

project_c0rry is an attempt to create a Minimalistic Operating System, including a yet to be named Bootloader and a yet to be named Kernel, with a yet to be named Text(perhaps somewhere down the line even Graphical) User Environment.

## What is the idea behind c0rry?

The main idea behind (project_)c0rry is to create a lightweight OS with an Exokernel, capable doing as many things in a text based environment as modern day \*NIX-like OS's.
There will be also the attempt to make the OS POSIX and UNIX compatible, however even I'm not sure how well that'll go.
And this is a way to sharpen my skills in OSDevving.

### And UEFI?
coming soon(trademark)


## Source Code Folder Structure
    src/              contains the source code and Makefile

## How to Compile?

Simply change the working directory to `src` in the Terminal and execute `make` then `make qemu` for your own safety.
In case you would want to use a different emulator like bochs, add boot.flp, that will appear within "src/" after running `make`, as a Floppy and set it up to Boot from it. Also make sure the Emulator is Legacy BIOS compatible, as this Project isn't UEFI, *yet*
