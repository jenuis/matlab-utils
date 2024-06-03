% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function new_cell = cellremove(cell_in, cell_rm)
if ~iscell(cell_in)
    error('cell_in should be a cell!')
end
if ~iscell(cell_rm)
    cell_rm = {cell_rm};
end

inds = [];
for i=1:length(cell_rm)
    [res, ind] = haselement(cell_in, cell_rm{i});
    if res
        inds(end+1) = ind;
    end
end

new_cell = cell_in;
new_cell(inds) = [];