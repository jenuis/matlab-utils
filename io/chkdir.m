% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function path = chkdir(varargin)
path = '';
for i=1:length(varargin)
    path = fullfile(path, varargin{i});
end
if ~exist(path, 'dir')
    mkdir(path)
    disp(['mkdir: ' path]);
end