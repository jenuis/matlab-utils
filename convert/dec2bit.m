% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function bit_val = dec2bit(dec, bits_no)
bin_str = dec2bin(dec);
bit_val = [];
for i=1:length(bin_str)
    bit_val(i) = str2double(bin_str(i));
end
bit_val = logical(bit_val);
if nargin == 2 && length(bit_val) < bits_no
    bit_val = flip(bit_val);
    bit_val(end+1:end+bits_no-length(bit_val)) = false;
    bit_val = flip(bit_val);
end