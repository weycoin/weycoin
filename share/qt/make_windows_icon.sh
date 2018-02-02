#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/weycoin.png
ICON_DST=../../src/qt/res/icons/weycoin.ico
convert ${ICON_SRC} -resize 16x16 weycoin-16.png
convert ${ICON_SRC} -resize 32x32 weycoin-32.png
convert ${ICON_SRC} -resize 48x48 weycoin-48.png
convert weycoin-16.png weycoin-32.png weycoin-48.png ${ICON_DST}

