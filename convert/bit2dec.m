% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function dec = bit2dec(bit_val)
bit_str = '';
for i=1:length(bit_val)
    bit_str(i) = num2str(bit_val(i));
end
dec = bin2dec(bit_str);
