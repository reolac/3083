%% Task 1 A

close all, clear all, clc

DataSet = rand(100, 2);
Labels = randi(3,numel(DataSet(:,1)),1);

numel(DataSet(1,:));



one_r(DataSet, Labels);

%% Lab 5 Task 1 A Lucy Demo

close all, clear all, clc

Z = [-24 -16 -14 -13 -6 8 9 11 12 16 20 24]';
labZ = [2 1 2 1 1 2 1 1 2 3 2 3]';

[Feature, Threshold, Labels] = one_rr(Z, labZ)
