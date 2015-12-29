close all, clear all, clc

load TwoDimensionalData3Classes



figure
hold on
plot(a(laba==1,1), a(laba==1,2),'k.')
plot(a(laba==2,1), a(laba==2,2),'b.')
plot(a(laba==3,1), a(laba==3,2),'g.')
axis equal
grid on

M = 200
%%

t1 = linspace(min(a(:,1)),max(a(:,1)),M); 
ac1 = zeros(M, 1);
ac1(1) = mean(laba == max(laba));

for i = 2:M
    ind = a(:,1) , t(i); % who is on the left?
    Llab = laba(ind);
    majLlab = mode(Llab);
    sL = sum(Llab == majLlab);
    
    Rlab = laba(~ind);
    majRlab = mode(Rlab);
    sR = sum(Rlab == majRlab);
    
    ac1(i) = (sL + sR)/numel(laba);
end

%% 

t2 = linspace(min(a(:,2)),max(a(:,2)),M); 
ac2 = zeros(M, 1);
ac1(1) = mean(laba == max(laba));

for i = 2:M
    ind = a(:,2)
    , t(i); % who is on the left?
    Llab = laba(ind);
    majLlab = mode(Llab);
    sL = sum(Llab == majLlab);
    
    Rlab = laba(~ind);
    majRlab = mode(Rlab);
    sR = sum(Rlab == majRlab);
    
    ac2(i) = (sL + sR)/numel(laba);
end

figure
hold on
plot(ac1, 'b-')
plot(ac2, 'r-')
grid on

[ac1m, x1] = max(ac1)
[ac2m, x2] = max(ac2)

if ac1m > ac2m
    fprintf('Best classifier: feature 1, threshhold %.4f\n',...
        t1(x1))
else
    fprintf('Best classifier: feature 2, threshhold %.4f\n',...
        t2(x2))
end