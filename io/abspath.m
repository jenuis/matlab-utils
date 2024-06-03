% -------------------------------------------------------------------------
% Copyright 2023 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function paths = abspath(dir_struct, single_element_output_char)
    %% check arguments
    if nargin < 2
        single_element_output_char = true;
    end
    %% call array fun to gen paths
    paths = arrayfun(@(d) fullfile(d.folder, d.name), dir_struct, 'UniformOutput', false);
    %% check output
    if single_element_output_char && length(paths) == 1
        paths = paths{1};
    end
end