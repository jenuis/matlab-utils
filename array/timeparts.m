function part_ind_list = timeparts(time, circle_time)
%% for nonuniform
% part_ind_list = [];
% while(~isempty(time))
%     s_ind = 1;
%     s = time(s_ind);
%     
% end
%% check uniform of time
diff_time = diff(time);
dt = mean(diff_time);
div = std(diff_time);
if div > dt*1e-2
    error('time is not increasing linearly!')
end
%% gather circle ind info
total_len  = length(time);
circle_len = round(circle_time/dt);
circle_no  = floor(total_len/circle_len);
%% initialize outputs
part_ind_list = {};
%% gen parts ind
for i=1:circle_no
    part_ind_list{end+1} = (1:circle_len)+(i-1)*circle_len;
end
last_ind = circle_len*circle_no+1;
if last_ind <= total_len
    part_ind_list{end+1} = last_ind:total_len;
end
