%
% Input:
% - 开始时间（周几）
% - 复习总数
%
% Output: 学习/复习计划表

start_day = 1;
num_list = 10;
period = [0, 1, 2, 4, 7, 15];
% period = [0, 1, 4, 7, 15];
% period = [0, 1, 4, 10];

max_data = num_list + max(period); % 最后以添
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
        unit_str = sprintf('%d', idx_l);
        if isempty(C{idx_w, idx_d})
            C{idx_w, idx_d} = ['Unit ', unit_str];
        else
            C{idx_w, idx_d} = [C{idx_w, idx_d}, '+', unit_str];
        end
    end
end
row_names = cell(1,idx_w);
for idx_ww = 1:idx_w
    row_names_temp = sprintf('%s %02d', 'Week', idx_ww);
    row_names{1,idx_ww} = row_names_temp;
end
study_table = cell2table(C);
study_table.Properties.VariableNames = {'Mon.', 'Tue.', 'Wes.', 'Thu.', 'Fri.', 'Sat.', 'Sun.'};
study_table.Properties.RowNames = row_names;
disp(study_table)