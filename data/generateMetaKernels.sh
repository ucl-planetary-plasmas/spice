#!/bin/bash

#
# $Id: generateMetaKernels.sh,v 1.2 2020/05/01 14:25:58 patrick Exp $
#
# Copyright (c) 2017 Patrick Guio <patrick.guio@gmail.com>
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.



function createmetakernel {

  echo "generating $1 from $1.in"
	cat $1.in | sed -e "s=DATAROOT=$PWD=g" | tee $1 1> /dev/null

}

METAKERNELS="standard.tm mars.tm jupiter.tm saturn.tm uranus.tm"

for metakernel in $METAKERNELS; do
  createmetakernel $metakernel
done

echo "linking moon.tm to standard.tm"
ln -fs standard.tm moon.tm
