%% Find indices of the times in a time array.
% -------------------------------------------------------------------------
% Copyright 2019 Xiang Liu
% Contact: Xiang Liu, xliu.fusion@outlook.com
% This file is part of MATLAB-UTILS. You should have recieved a copy of the
% MIT license. If not, see <https://mit-license.org>
% -------------------------------------------------------------------------
function [inds, new_times] = findtime(time_array, time_slices, critical)
if nargin == 2
    critical = 0;
end
time_diff = diff(time_array);
dt = median(time_diff);
if ~isempty(find(time_diff < 0, 1))
    error('Time array is not monotonically increasing!');
end
[~,~,all_in] = inrange(time_array([1 end]), time_slices);
if ~all_in
    error('Some time slice is out of range!')
end
if critical
    inds = findvaluecrit(time_array, time_slices, dt);
else
    inds = findvalue(time_array, time_slices);
end
if ~isnan(inds)
    new_times = time_array(inds);
end