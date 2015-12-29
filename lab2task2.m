%% TASK 2

close all, clear all, clc

X = -20 : 20;
Y = -20 : 20;

figure;
hold on;

for i = 1 : numel(X)
    
    g1(i) = -3 * X(i) + 5 * Y(i);
    g2(i) = X(i) * Y(i)^2 - 4 * X(i)^2 + 3;
    
     if g1(i) > g2(i)
         plot(X(i), g1(i))
         plot(Y(i), g1(i))
         
     else
         plot(X(i), g2(i))
         plot(Y(i), g2(i))
     end
    
    
end



% plot(X, g1);
% plot(Y, g1);
%plot(X, g2);
%plot(Y, g2);