%% Lab 8 Task b
close all, clear all, clc

d = rand(100, 2); % random data set

%to do: work out weights from task 1 (a)
% using wrong initial weights for labd
labd = -0.4 * d(:,1) + 0.4 * d(:,2) + 0.0 > 0; % line equation ...
% to split the classes

figure;
hold on;
axis equal;

plot(d(labd==1,1), d(labd==1,2), 'bs'); % plot initial data and labels

plot(d(labd==0,1), d(labd==0,2), 'rs');

w = PerCep(d, labd); % run Task A to find new weights 

alabd = w(2) * d(:,1) + w(3) * d(:,2) + w(1) > 0; % update line ...
% equation based on the new weights

plot(d(alabd==1,1), d(alabd==1,2), 'bo', 'MarkerSize', 10); % plot ...
% updated data set with their new labels

plot(d(alabd==0,1), d(alabd==0,2), 'ro', 'MarkerSize', 10);