% Input:
% - 开始时间，day/month/year
% - list数量
%
% Output: 学习/复习计划表

start_day = 4;
num_list = 30;

% period = [0, 1, 2, 4, 7, 15];
% period = [0, 1, 4, 7, 15];
period = [0, 1, 4, 10];

max_data = num_list + max(period);
num_p = length(period);
C = cell(ceil(max_data / 7), 7);
for idx_l = 1:num_list
    for idx_p = 1:num_p
        idx_d = idx_l + (start_day - 1) + period(idx_p);
        if idx_d > 7
            idx_w = ceil(idx_d / 7);
            idx_d = mod(idx_d, 7);
            if idx_d == 0
                idx_d = 7;
            end
        else
            idx_w = 1;
        end
        disp([idx_w, idx_d]);
        str = sprintf('%s %02d', 'Unit', idx_l);
        C{idx_w, idx_d} = [C{idx_w, idx_d}, str];
    end
end
T = cell2table(C);
T.Properties.VariableNames = {'Mon.', 'Tue.', 'Wes.', 'Thu.', 'Fri.', 'Sat.', 'Sun.'};
row_names = cell(1,idx_w);
for idx_ww = 1:idx_w
    row_names_temp = sprintf('%s %02d', 'Week', idx_ww);
    row_names{1,idx_ww} = row_names_temp;
end