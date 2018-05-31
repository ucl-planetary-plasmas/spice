#!/bin/sh

#
# $Id: downloadJunoKernels.sh,v 1.2 2017/11/08 12:26:30 patrick Exp $
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
JUNO="$NAIF/JUNO/kernels/"

# -N Turn on time-stamping for wget
# -# Progress meter for curl 
CMD="curl -#"

# trajectory 
# spk_*_YYMMDD_YYMMDD_yymmdd*
# YYMMDD   coverage start and STOP UTC/SCET
# yymmdd   file release date
file=spk_pre_151003_160713_160223_joiPB_final
if [ ! -e $file.bsp ] ; then
  echo "Downloading spk data for Juno $file"
  $CMD $JUNO/spk/$file.bsp -o $file.bsp 
fi
