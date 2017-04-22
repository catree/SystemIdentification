%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Hrishik\Documents\MATLAB\data_trajectory_T6_45\trajectory_T6_45_out_estimates_quater.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2017/03/07 10:51:36
t_0 = 200;
t_f = 400;
%% Initialize variables.
filename = '\data_trajectory_T6_45\trajectory_T6_45_out_estimates_quater.txt';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%16f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
time = dataArray{:, 1};
t_f = min([t_f,time(end)]);

q_0 = dataArray{:, 2};
q_1 = dataArray{:, 3};
q_2 = dataArray{:, 4};
q_3 = dataArray{:, 5};
r_x = dataArray{:, 6};
r_y = dataArray{:, 7};
r_z = dataArray{:, 8};
% r_11 = dataArray{:, 9};
% r_12 = dataArray{:, 10};
% r_13 = dataArray{:, 11};
% r_21 = dataArray{:, 12};
% r_22 = dataArray{:, 13};
% r_23 = dataArray{:, 14};
% r_31 = dataArray{:, 15};
% r_32 = dataArray{:, 16};
% r_33 = dataArray{:, 17};

Mu_4 = q_0(t_0:t_f);
Mu_1 = q_1(t_0:t_f);
Mu_2 = q_2(t_0:t_f);
Mu_3 = q_3(t_0:t_f);
Mu = [Mu_1,Mu_2,Mu_3,Mu_4];

r_c_x = r_x(t_0:t_f)/1000;
r_c_y = r_y(t_0:t_f)/1000;
r_c_z = r_z(t_0:t_f)/1000;
r_c = [r_c_x,r_c_y,r_c_z];

t_dat = time(t_0:t_f);
TS = timeseries([r_c,Mu],t_dat,'Name','MeasSignal');
save('data_trajectory_T6_45\Data_01.mat','TS');

%% Clear temporary variables
clearvars filename formatSpec fileID dataArray ans;
clear q_0 q_1 q_2 q_3 r_11 r_x r_y r_z Mu_1 Mu_2 Mu_3 Mu_4 r_c_x r_c_y r_c_z t_dat t_0 t_f time Mu r_c;