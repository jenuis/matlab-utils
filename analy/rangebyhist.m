function range = rangebyhist(data, histno)
if nargin < 2
    histno = 50;
end

[n,x] = hist(data, histno);
len_bin = (x(end)-x(1))/(histno-1);

min_val = [];
max_val = [];
for i=2:round(length(data)/2)
    if n(i)
        min_val = x(i);
    end
    if n(end-i+1)
        max_val = x(end-i+1);
    end
    if ~isempty(min_val) && ~isempty(max_val)
        break
    end
end

range = [min_val-len_bin/2, max_val+len_bin/2];