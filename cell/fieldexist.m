% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function [bool, var] = fieldexist(var, cell_array_str)
bool = 1;
if ischar(cell_array_str)
    cell_array_str = {cell_array_str};
end
for i = 1:length(cell_array_str)
    if ~isfield(var, cell_array_str{i})
        bool = 0;
        return
    end
    var = var.(cell_array_str{i});
end