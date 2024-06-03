function range = rangebystat(data, thres_ratio)
if nargin < 2
    thres_ratio = 0.02;
end

thres_no = round(length(data)*thres_ratio);

data = sort(data);
range = data([thres_no+1 end-thres_no]);