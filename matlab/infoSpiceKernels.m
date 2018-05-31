function infoSpiceKernels(verbose)
% function infoSpiceKernels(verbose)

%
% $Id: infoSpiceKernels.m,v 1.1 2015/09/18 11:09:51 patrick Exp $
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
  verbose = 1;
end

% Count the number of loaded kernel files.
count = cspice_ktotal( 'ALL' );

% Loop over the count, outputting file information as we loop.
% The loop tells us all files loaded via cspice_furnsh, their
% type, and how they were loaded.

if verbose,
  if count>0,
    fprintf(1,'SPICE kernels loaded:\n');
  else
    fprintf(1,'no SPICE kernels loaded.\n');
  end
  for i = 1:count,

    [file,type,source,handle,found] = cspice_kdata(i, 'ALL');

	  if found,
      if verbose>1,
	      fprintf('Index : %d\n', i);
		    fprintf('File  : %s\n', file);
		    fprintf('Type  : %s\n', type);
		    fprintf('Source: %s\n\n', source);
		  else
		    fprintf('%s\n', file);
		  end
	  else
	    fprintf( 'No kernel found with index: %d\n', i );
	  end
  end
end

