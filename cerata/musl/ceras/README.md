# musl

## Native

### Configure
Tread with care as the destination directories for some of these options
are tricky.

Specifying --prefix alone will install everything into that directory and
will attempt to link the libc.so installed there to a system wide linker in
/lib.
So (prefix alone | installs/libc.so in $PREFIX | linker (to OUR $PREFIX
libc.so) in host's /lib and needs sudo because of that)

Specifying $DESTDIR with make install, and --prefix here (don't forget
the trailing slash if you intend to use both of them) will install
everything into $DESTDIR$PREFIX (yup, there exists no forward slash between
these two so be careful). This will also symlink the libc.so residing in
$DESTDIR$PREFIX to $DESTDIR alone.
So (prefix + destdir | installs/libc in $DESTDIR$PREFIX | linker (to OUR 
$PREFIX libc.so even though the relative path is wrong) in DESTDIR) so no
sudo required

Specifying --prefix and --syslibdir, will get musl installed (+ libc.so) in
--prefix as intended and will get the tricky linker installed in the host's
/usr/lib (which is why make install requires sudo). This is easier to
manage especially if the distribution is glibc based, as it makes it easier
for target executables to find the path of the linker on the host and on
the system (when separately booting) as they share the same path /usr/lib.
Although this makes it easier to build without chrooting, chrooting is still
required, and this whole approach might be changed, as the graphics stack
is very picky about its libdirs.

wrongly passing `--prefix` as `--prefix=$CRSS` will cause problems such as
isl not finding libgmp.so and zstd complaining of missing header files such
as `string.h`...

CROSS_COMPILE can be removed if --host is detected correctly as $TUPL,
otherwise leave it here.

Remove both the symlink to the original Makefile and the system's musl
dynamic linker (this is dangerous if you're already running a musl based
distribution as it's assumed that the host is using glibc, so this shouldn't
exist in the first place).

We then copy the original makefile, and prefix the command responsible
for creating the dyanmic linker with sudo so that it installs in /usr/lib
(this is the intended behaviour since our host uses glibc so it won't
overwrite any existing musl dynamic linker, and it makes it possible to
build without chrooting, so this will changed later as glaucus' graphics
stack requires a separate chroot)

Tread with care as the destination directories for some of these options
are tricky.

Specifying --prefix alone will install everything into that directory and
will attempt to link the libc.so installed there to a system wide linker in
/lib.
So (prefix alone | installs/libc.so in $PREFIX | linker (to OUR $PREFIX
libc.so) in host's /lib and needs sudo because of that)

Specifying $DESTDIR with make install, and --prefix here (don't forget
the trailing slash if you intend to use both of them) will install
everything into $DESTDIR$PREFIX (yup, there exists no forward slash between
these two so be careful). This will also symlink the libc.so residing in
$DESTDIR$PREFIX to $DESTDIR alone.
So (prefix + destdir | installs/libc in $DESTDIR$PREFIX | linker (to OUR 
$PREFIX libc.so even though the relative path is wrong) in DESTDIR) so no
sudo required

Specifying --prefix and --syslibdir, will get musl installed (+ libc.so) in
--prefix as intended and will get the tricky linker installed in the host's
/usr/lib (which is why make install requires sudo). This is easier to
manage especially if the distribution is glibc based, as it makes it easier
for target executables to find the path of the linker on the host and on
the system (when separately booting) as they share the same path /usr/lib.
Although this makes it easier to build without chrooting, chrooting is still
required, and this whole approach might be changed, as the graphics stack
is very picky about its libdirs.

Remove both the symlink to the original Makefile and the system's musl
dynamic linker (this is dangerous if you're already running a musl based
distribution as it's assumed that the host is using glibc, so this shouldn't
exist in the first place).

We then copy the original makefile, and prefix the command responsible
for creating the dyanmic linker with sudo so that it installs in /usr/lib
(this is the intended behaviour since our host uses glibc so it won't
overwrite any existing musl dynamic linker, and it makes it possible to
build without chrooting, so this will changed later as glaucus' graphics
stack requires a separate chroot)

## System

### Configure

CFLAGS are passed to configure and not as an environment variable.

musl doesn't build with LTO enabled, which is shocking but true.

here --prefix and --syslibdir are both given, since DESTDIR is also given
this will produce the intended effect of being installed similary to all
other cerata, however the resulting dynamic linker will be messed up and
probably will point to the wrong path, but this is easily fixable.

Remove both the symlink to the original Makefile and the system's musl
dynamic linker (this is dangerous if you're already running a musl based
distribution as it's assumed that the host is using glibc, so this shouldn't
exist in the first place).

We then copy the original makefile, and modify the command responsible
for wrongly linking the resulting dynamic linker with the wrong libc.so, so
that the dynamic linker it links to the resulting libc.so is located in the
exact same location of the libc.so

### install

we then create a symlink to the dyanimc linker called ldd (list dynamic
dependencies)

and finish it off with stripping some resulting unstripped files
we can also further remove all resulting `*.a` files, but those were left
for compatibility purposes, and hopefully will soon be removed if everything
builds fine without them