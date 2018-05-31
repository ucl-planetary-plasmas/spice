function kernelsPath = getSpiceGenericKernelsPath()
% function kernelsPath = getSpiceGenericKernelsPath()

%
% $Id: getSpiceGenericKernelsPath.m,v 1.1 2015/09/01 11:41:47 patrick Exp $
%
% Copyright (c) 2009 
% Patrick Guio <p.guio@ucl.ac.uk>
%
% All Rights Reserved.
%
% This program is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% Free Software Foundation; either version 2.  of the License, or (at your
% option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
% Public License for more details.
%

% generic kernel path
persistent genericKernelsPath

% if matlab spice mex-file present
if exist('mice','file') == 3,
  if isempty(genericKernelsPath), % variable not initialised
    genericKernelsPath = which('mice');
    genericKernelsPath(strfind(genericKernelsPath,'matlab/mice'):end) = [];
    genericKernelsPath = [genericKernelsPath 'data/'];
    fprintf(1,'*** genericKernelsPath = %s\n', genericKernelsPath);
  end
else
  error('mice (Matlab driver for SPICE) not found in `path''.')
end

kernelsPath = genericKernelsPath;
