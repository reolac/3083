%% Task 1 a

close all, clear all, clc

X = randn(100000, 1);

Y = numel(X(X > -1 & X < 1))/numel(X);

%% Task 1 b
close all, clear all, clc

X = randn(1000, 1000);


figure
hold
axis ([-10 10 -10 10])
scatter (X(:,1), X(:,2))
