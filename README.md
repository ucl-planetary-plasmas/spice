
Date: 24 July 2014
==================

Introduction
-------------

The Navigation and Ancillary Information Facility (NAIF) provides NASA
planetary flight projects and NASA funded professional planetary researchers
an information system named "SPICE" to assist scientists in planning and
interpreting scientific observations from space-based instruments. SPICE is
also widely used in engineering tasks associated with planetary missions.

SPICE is focused on solar system geometry. The SPICE system includes a large
suite of software, mostly in the form of subroutines, that customers
incorporate in their own application programs to read SPICE files and to
compute derived observation geometry, such as altitude, lattitude/longitude,
and lighting angles. SPICE data and software may be used within many popular
computing environments. The software is offered in FORTRAN, C, IDL® and
MATLAB®. 

More information is available at the SPICE project website at
http://naif.jpl.nasa.gov/naif/

Kernels installation
---------------------

In order to run SPICE you need to load generic kernels. These kernels can
be downloaded from the anonymous ftp server at
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels

SPICE kernels that exist independent of any particular flight project are
called generic Kernels. These may be obtained from the generic kernels area
of the NAIF server. Included under this category are:

* Ephemerides for planets, satellites, and some comets and asteroids (SPK)
* Planetary constants kernels, including special binary versions for the 
  earth and the moon (PCK)
* Special frames kernels associated with the moon (FK)
* Current leapseconds kernel (LSK)
* Topocentric locations (SPK) and reference frame
* definitions (FK) for some earth stations
* Star catalogs (PPM, Tycho2 and Hipparcos, in SPICE Type 1 format) 

A wide assortment of source data are used in producing these generic
kernels. Be sure to understand the provenance of any generic kernel you may
consider using. 

As of the date of this document, the following current kernels available are

Leapseconds kernel (LSK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0010.tls

Planetary and lunar ephemeris (SPK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp

Jupiter and satellite ephemeris (SPK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup310.bsp

Saturn and satellite ephemeris (SPK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/sat365.bsp

Uranus and satellite ephemeris (SPK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/ura112.bsp

Orientation data for planets, natural satellites, the Sun, and selected
asteroids (PCK)
ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc


These kernel files can be downloaded using a non-interactive network
downloader such as wget. For example to download the mentioned files, just
run the following commands:

wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0010.tls
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup310.bsp
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/sat365.bsp
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/ura112.bsp
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc

and corresponding comment files

ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430_tech-comments.txt
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/jup310.cmt
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/sat365.cmt
wget ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/ura112.cmt

Installation scripts
--------------------

or run the shell script downloadGenericKernels.sh in data directory

% cd data

% sh downloadGenericKernels.sh

then install the meta kernels

% sh generateMetaKernels.sh


