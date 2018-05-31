function loadPlanetSpiceKernels(planet,verbose)
% function loadPlanetSpiceKernels(planet,verbose)

%
% $Id: loadPlanetSpiceKernels.m,v 1.5 2015/09/21 11:59:24 patrick Exp $
%
% Copyright (c) 2015 Patrick Guio <patrick.guio@gmail.com>
% All Rights Reserved.
%
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% Free Software Foundation; either version 3 of the License, or (at your
% option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
% Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program. If not, see <http://www.gnu.org/licenses/>.

if ~exist('verbose') || isempty(verbose),
  verbose = 0;
end

% generic kernel path
spiceKernelsPath = getSpiceGenericKernelsPath();

% load standard meta-kernel
standard = [spiceKernelsPath 'standard.tm'];
cspice_furnsh(standard);

filename = [spiceKernelsPath lower(planet) '.tm'];
% Load meta-kernel
if exist(filename,'file'),
  if ~strcmp(filename,standard),
    cspice_furnsh(filename);
  end
else
  error(['file ' filename ' not found']);
end

infoSpiceKernels(verbose);

return

% Load a leapseconds kernel.
% ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/
lskfile = dir([spiceKernelsPath '*.tls']);
fprintf(1,'Loading Leapseconds Kernel : %s\n', upper(lskfile.name));
cspice_furnsh([spiceKernelsPath lskfile.name]);

% Load planetary ephemeris 
% ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/
spkfile = dir([spiceKernelsPath 'de*.bsp']);
fprintf(1,'Loading Planetary Ephemeris: %s\n', upper(spkfile.name));
cspice_furnsh([spiceKernelsPath spkfile.name]);

% Load satellite ephemeris 
% ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/
switch lower(planet)

  case 'jupiter',
	  spkfile = dir([spiceKernelsPath 'jup*.bsp']);

  case 'saturn',
	  spkfile = dir([spiceKernelsPath 'sat*.bsp']);
	  
	case 'uranus',
	  spkfile = dir([spiceKernelsPath 'ura*.bsp']);

end

if ~isempty(spkfile),
  fprintf(1,'Loading Satellite Ephemeris: %s\n', upper(spkfile.name));
  cspice_furnsh([spiceKernelsPath spkfile.name]);
end

% Load orientation data Saturn's natural satellites and rings
% ftp://naif.jpl.nasa.gov/pub/naif/CASSINI/kernels/
if strcmp(lower(planet),'saturn'),
pckfile = dir([spiceKernelsPath 'cpck*.tpc']);
fprintf(1,'Loading satellite orientation data %s\n', pckfile.name);
cspice_furnsh([spiceKernelsPath pckfile.name]);
end

% Load orientation data for planets, natural 
% satellites, the Sun, and selected asteroids
% ftp://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/
pckfile = dir([spiceKernelsPath 'pck*.tpc']);
fprintf(1,'Loading Orientation Data   : %s\n', upper(pckfile.name));
cspice_furnsh([spiceKernelsPath pckfile.name]);


