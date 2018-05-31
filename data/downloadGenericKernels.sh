#!/bin/sh

#
# $Id: downloadGenericKernels.sh,v 1.15 2017/11/08 12:26:30 patrick Exp $
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
CMD="curl -#"

# Upload a leapseconds kernel
file=naif0012.tls
if [ ! -e $file ] ; then
  echo "Downloading leapseconds kernel $file"
  $CMD $KERNELS/lsk/$file -o $file
fi

# Upload planetary ephemeris 
file=de430
if [ ! -e $file.bsp ] || [ ! -e ${file}_tech-comments.txt ] ; then
  echo "Downloading planetary ephemeris $file"
  $CMD $KERNELS/spk/planets/${file}_tech-comments.txt -o ${file}_tech-comments.txt
  $CMD $KERNELS/spk/planets/$file.bsp -o $file.bsp
fi

# Upload satellite ephemeris 

file=mar097
if [ ! -e $file.bsp ] || [ ! -e $file.cmt ] ; then
  echo "Downloading Mars satellites ephemeris $file"
  $CMD $KERNELS/spk/satellites/$file.cmt -o $file.cmt
  $CMD $KERNELS/spk/satellites/$file.bsp -o $file.bsp
fi
file=jup329
if [ ! -e $file.bsp ] || [ ! -e $file.cmt ] ; then
  echo "Downloading Jupiter satellites ephemeris $file"
  $CMD $KERNELS/spk/satellites/$file.cmt -o $file.cmt
  $CMD $KERNELS/spk/satellites/$file.bsp -o $file.bsp
fi
file=sat393
if [ ! -e $file.bsp ] || [ ! -e $file.cmt ] ; then
  echo "Downloading Saturn satellites ephemeris $file"
  $CMD $KERNELS/spk/satellites/$file.cmt -o $file.cmt
  $CMD $KERNELS/spk/satellites/$file.bsp -o $file.bsp
fi
file=ura112
if [ ! -e $file.bsp ] || [ ! -e $file.cmt ] ; then
  echo "Downloading Uranus satellites ephemeris $file"
  $CMD $KERNELS/spk/satellites/$file.cmt -o $file.cmt
  $CMD $KERNELS/spk/satellites/$file.bsp -o $file.bsp
fi

# Upload orientation data for planets, natural
# satellites, the Sun, and selected asteroids
file=pck00010.tpc
if [ ! -e $file ] ; then
  echo "Downloading PcK data $file"
  $CMD $KERNELS/pck/$file -o $file
fi
