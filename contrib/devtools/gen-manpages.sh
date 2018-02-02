#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

WEYCOIND=${WEYCOIND:-$SRCDIR/weycoind}
WEYCOINCLI=${WEYCOINCLI:-$SRCDIR/weycoin-cli}
WEYCOINTX=${WEYCOINTX:-$SRCDIR/weycoin-tx}
WEYCOINQT=${WEYCOINQT:-$SRCDIR/qt/weycoin-qt}

[ ! -x $WEYCOIND ] && echo "$WEYCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
WAEVER=($($WEYCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for weycoind if --version-string is not set,
# but has different outcomes for weycoin-qt and weycoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$WEYCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $WEYCOIND $WEYCOINCLI $WEYCOINTX $WEYCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${WAEVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${WAEVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
