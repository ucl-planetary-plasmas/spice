#!/bin/sh

#
# $Id: downloadGenericKernels.sh,v 1.18 2022/02/17 08:48:09 patrick Exp $
#
# Copyright (c) 2009
# Patrick Guio <p.guio@ucl.ac.uk>
#
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2.  of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
#

# NAIF service site
NAIF="https://naif.jpl.nasa.gov/pub/naif"
# generic kernels data
KERNELS="$NAIF/generic_kernels"
# -N Turn on time-stamping
CMD="wget -N"
# curl preferred
CMD="curl -# --fail --fail-early"

die () {
  echo "Problem accessing $1"
	exit 1
}

function downloadFile {
  if [ ! -e $3 ] ; then
    echo "Downloading" $1 $3
    $CMD $KERNELS/$2/$3 -o $3 || die $KERNELS/$2/$3
  fi
}

# leapseconds kernel
file=naif0012.tls
downloadFile "leapseconds kernel" lsk $file

# planetary ephemeris 
file=de440
downloadFile "planetary ephemeris file" spk/planets ${file}_tech-comments.txt
downloadFile "planetary ephemeris file" spk/planets $file.bsp

# satellite ephemeris 
file=mar097
downloadFile "Mars satellites ephemeris file" spk/satellites $file.cmt
downloadFile "Mars satellites ephemeris file" spk/satellites $file.bsp

file=jup365
downloadFile "Jupiter satellites ephemeris" spk/satellites $file.cmt
downloadFile "Jupiter satellites ephemeris" spk/satellites $file.bsp

file=sat450
downloadFile "Saturn satellites ephemeris" spk/satellites $file.cmt
downloadFile "Saturn satellites ephemeris" spk/satellites $file.bsp

file=ura116
downloadFile "Uranus satellites ephemeris" spk/satellites $file.cmt
downloadFile "Uranus satellites ephemeris" spk/satellites $file.bsp

# orientation data for planets, natural
# satellites, the Sun, and selected asteroids
file=pck00010.tpc
downloadFile "PcK data" pck $file

