# project_c0rry

## What is project_c0rry?

project_c0rry is an attempt to create a Minimalistic Operating System.
Currently, the OS will be trxt based with no GUI support planned, *yet*.

## What is the idea behind c0rry?

The main idea behind (project_)c0rry is to create a lightweight OS, capable doing as many things in a text based environment as modern day \*NIX-like OS's.
It's currently planned to make c0rry have an exokernel. However it will be as UNIX compatible as only possible, allowing the use of Linux/UNIX Programms on c0rry with almost no Porting needed.

## Source Code Folder Structure
    src/              contains the source code

## How the development is planned to progress
    - c0rry v0.1
        - Bootable under i*86
        - Text output/input
        - Colored Text
    - c0rry v0.* - v0.9
        - bug fixes
        - x86_64
    - c0rry v1.0
        - basic shell
        - basic filesystem support (most likely FAT(32) or other common, easily portable POSIX compliant FS)
        - keyboard support
        - networking(most likely only ethernet without dhcp support)
    - c0rry v1.*-1.9
        - bug fixes, etc.
    - c0rry v2
        - mouse support
        - images/video to ASCII
        - maybe proper networking(ipv6, dhcp, wifi(maybe a few chipsets))
        - maybe more filesystems