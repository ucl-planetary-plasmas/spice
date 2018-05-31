#!/bin/sh

#
# $Id: downloadCassiniKernels.sh,v 1.9 2017/11/08 12:26:30 patrick Exp $
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
# CASSINI SPICE data
CASSINI="$NAIF/CASSINI/kernels/"

# -N Turn on time-stamping for wget
# -# Progress meter for curl 
CMD="curl -#"

# Upload orientation data for planets, natural
# satellites, the Sun, and selected asteroids
file=171017R_SCPSE_17117_17146
if [ ! -e $file.bsp ] || [ ! -e $file.bsp.lbl ] ; then
  echo "Downloading spk data for Cassini $file"
  $CMD $CASSINI/spk/$file.bsp -o $file.bsp 
  $CMD $CASSINI/spk/$file.bsp.lbl -o $file.bsp.lbl
fi
file=cpck21Oct2017
if [ ! -e $file.tpc ] ; then
  echo "Downloading pck data for Cassini $file"
  $CMD $CASSINI/pck/$file.tpc -o $file.tpc 
fi
