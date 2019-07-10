# glaucuslinux
Named after the smallest and most venemous sea slug *glaucus bennettae*, glaucus is a highly optimized and extremely lightweight suckless Linux distribution built from scratch.

## Supported Architectures
* x86_64-pc-linux-musl

## Minimum Requirements
* 32 MB RAM (qemu limit)
* qemu CPU

## Features
* musl libc
* suckless sbase + ubase
* OpenBSD lobase
* s6 init system
* s6-rc service manager
* latest developmental sources (gcc 10+, gmp developmental, mpfr, mpc)
* built with ISL and graphite optimizations enabled
* built with PGO and LTO

## Optimizations
* -Ofast
* GCSE
* GRAPHITE
* PGO
* SMS
* OpenMP
* IRA
* IPA
* LTO
* STRIP
* OTHERS

## Components
glaucus's core system is built up from the following main components:

* musl
* mawk
* byacc
* suckless sbase
* suckless ubase 
* lobase
* suckless smdev
* suckless nldev
* suckless nlmon
* netbsd-curses
* procps (htop built with netbsd-curses)
* dash
* loksh
* e2fsprogs
* linux
* skalibs
* execline
* s6
* s6-linux-init
* s6-rc
* glaucus-s6-boot-scripts

## Extra Features
* LibreSSL
* re2c
* mandoc
* vim (built with netbsd-curses)
* wayland only

## Philosophy
* If it ain't small, we ain't using it.
* If it ain't fast, we ain't using it.
* If it ain't simple, we ain't using it.
* If it ain't active, we ain't using it.

## Naming Scheme
Named after the:

* smallest
* most venemous
* albino exists (libre version)

## Screenshots
* sub 5 or sub 10 MB RAM (plus earliest images of snail with 1-2 MB RAM)

## Artwork
* glaucus bennettae swimming with tux and openbsd fish in the ocean

## Wiki
* Installation instructions
* Either Binary or from Source (add march=native)

## Benchmarks
* vs Void Linux
* vs Clear Linux
* vs Gentoo Linux
* vs Crux Linux
* vs Adelie Linux
* vs Arch Linux
* vs Obarun Linux
* vs Alpine Linux

* vs morpheus
* vs stali
* vs Sabotage Linux

* Phoronix Test Suite

## Author
Firas Khalil Khana (firasuke@gmail.com)

## License
glaucuslinux is licensed under the internet s c ISC license. see LICENSE.

## Donations
* PayPal
* Patreon