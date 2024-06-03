% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function h = contourfjet(x, y, z, N)
if nargin < 4
    N = 50;
end
if nargin == 1
    [~, h] = contourf(x, N,'linestyle','none');
else
    [~, h] = contourf(x, y, z, N,'linestyle','none');
end
shading flat
colormap(jet)
