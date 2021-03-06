# System Scripts

## Variables

This file defines all variables needed to build glaucus from scratch

basic will be called whenever this script is sourced, so only common and
mutual variables between both the toolchain and the system should be defined
here

Although ARCH should be x86-64, some packages won't build successfully
without x86_64, so the main approach is to use x86-64 whenever possible
and switch to x86_64 once an error occurs

Decided to go with quadruplets for tuples,
Replaced unknown with pc because it's shorter and more expressive

cerata is for storing upstream sources and glaucus' recipe format
logs contains log files for both System and Toolchain
temporary is where all the magic happens ;)

The system wide symlink to the toolchain for chroot purposes

Resolves the pod2man related error until perl is added

It's highly recommended that MAKEFLAGS value stays at -j1 for now as any
higher value might cause weird problems (segfaults included).

Toolchain-only related variables, this function will only be called when
building the toolchain

Similarly, this will only be called when building the system
think of this file as Gentoo's make.conf

where the final system will be stored
once the building process is done, you can take this directory and do
whatever you want with it. Chrooting into it and creating .img/.iso
files is what you'll normally be doing

the cerata directory here contains the result of the build process
the sources directory is just an rsync of the packages that need some
sort of source modification

Some packages need this like musl

Variables pointing to executables are sorted alphabetically
Also, notice how AR, NM and RANLIB are using LTO
The resulting mawk is used since it's faster and more minimal

The basic four all pointing to the sysroot GLAD
the sysroot here should be honored and should remove the need for
explicitly specifying sysroot whenever compiling a package

The resulting byacc is being used as it's lighter and more minimal
yacc is just a symlink to byacc intended for compatibility purposes

Optimization hell, proceed with caution!
You have been warned!

All performance related flags listed on the internet that are still
relevant are being used here, and compiling the entire system from 
source when all of them are enabled without actually testing them
individually will most likely result in a bloated system with big 
(and most likely slow) binaries

Again they are all listed in alphabetical order

First we have Global Common Subexpression Elimination

Then we have Graphite and ISL for loop optimization

The regular march flag, change to `x86-64` if you want to help
maintain a certain ceras for a number of users, else leave it at 
`native` if you're only going to use the resulting cerata on your system

Extra performance related flags

The purpose of PGO is to check whether it's beneficial or not to 
enable these 2 flags. The current method enables both of them for all
packages without checking if it's beneficial or not

Enables Swing Modulo Scheduling

Your regular flags, ordered by the order in which they appear in 
`man gcc`, the gcc `configure` file and the following link 
https://gcc.gnu.org/install/configure.html

Additional optimizations are listed in the flags below without 
defining them as variables these include pipe, OpenMP, the dangerous 
Ofast, IRA and IPA.

Changing Ofast to O3, O2 or even Os is highly recommended after 
testing the results.

A benchmarking method should be picked to evaluate the performance,
size and latencies of the resulting cerata

Additional flavors were added, one without LTO and one without OpenMP
since some packages have troubles with these two enabled

Everything is stripped and all symbols are being removed

Notice how LDFLAGS uses CFLAGS as well since we have LTO enabled

## Configure

pipes/fifos can be copied, rsynced and tarred but can't be hashed, they also
magically turn into regular files when using fakeroot (this must be related
to using img files, but it's still magical)

## Envenomate

### Core

It's easier and quicker to edit separate calls of envenomate that to edit a
variable holding its arguments or split the arguments into multiple lines

### Extra

s6-linux-utils needs to be built before nsss or it'll error out with undefined
references to `nsss_all_getgrgid` and `nsss_all_getpwuid`

### Xorg
