#!/bin/sh

#
# $Id: downloadJunoKernels.sh,v 1.3 2020/04/24 10:19:00 patrick Exp $
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
KERNELS="$NAIF/JUNO/kernels/"
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

# trajectory 
# spk_*_YYMMDD_YYMMDD_yymmdd*
# YYMMDD   coverage start and STOP UTC/SCET
# yymmdd   file release date
file=spk_pre_151003_160713_160223_joiPB_final.bsp
downloadFile "spk data file for Juno" spk $file

