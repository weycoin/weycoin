
Debian
====================
This directory contains files used to package weycoind/weycoin-qt
for Debian-based Linux systems. If you compile weycoind/weycoin-qt yourself, there are some useful files here.

## weycoin: URI support ##


weycoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install weycoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your weycoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/weycoin128.png` to `/usr/share/pixmaps`

weycoin-qt.protocol (KDE)

