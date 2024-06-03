% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function setfigposition(position)
if nargin == 0
    fig_size = [0 0 1 1];
else
    if ischar(position)
        switch position
            case 'left'
                fig_size = [.0 .0 .5 1];
            case 'right'
                fig_size = [.5 .0 .5 1];
            case 'full'
                fig_size = [0 0 1 1];
            case 'middle'
                fig_size = [0.25 0 .5 1];
            case 'upleft'
                fig_size = [.0 .5 .5 .5];
            case 'upright'
                fig_size = [.5 .5 .5 .5];
            case 'downleft'
                fig_size = [.0 .0 .5 .5];
            case 'downright'
                fig_size = [.5 .0 .5 .5];
            otherwise
                error('Unknow fig postion!')
        end
    elseif isnumeric(position) && length(position)==4
        fig_size = position;
    else
        error('wrong input arguments!')
    end
end
set(gcf,'unit','normalized','outerposition', fig_size);