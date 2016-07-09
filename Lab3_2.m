%% Task 1 b

close all, clear all, clc

%import MyRoc.m

X = (-20:0.5:20)';

Y = randi(2,numel(X),1);



[coords] = MyRoc(X, Y);



figure
hold

plot(coords(:,1),coords(:,2));

%(X(1) + X(2)) / 2 