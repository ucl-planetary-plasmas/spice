#!/bin/sh

#
# $Id: downloadCassiniKernels.sh,v 1.10 2020/04/24 10:19:00 patrick Exp $
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
KERNELS="$NAIF/CASSINI/kernels/"
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

# orientation data for planets, natural
# satellites, the Sun, and selected asteroids
file=171017R_SCPSE_17117_17146.bsp
downloadFile "spk data file for Cassini" spk $file
downloadFile "spk data file for Cassini" spk $file.lbl

file=cpck15Dec2017.tpc    
downloadFile "pck data file for Cassini" pck $file

