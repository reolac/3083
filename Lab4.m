%% Task 1 a

close all, clear all, clc

C1 = randn(200, 2);
C2 = randn(200, 2) + 2;

figure
hold on
grid on
axis ([-3 5 -3 5])

X = -3:5; 
Y = X*0;

for i = 1:numel(X)
    Y(i) = X(i) * (-1) + 2;
end

Y(1)
-2 * (-1) + 5;

    


plot(C1(:,1), C1(:,2),'r.');
plot(C2(:,1), C2(:,2),'g.');

error = 0;
for i = 1:size(C1)      
        g = C1(i,1) * (-1) + 2;
        g2 = C2(i,1) * (-1) + 2;
        if C1(i,1) == C1(i,1) & C1(i,2) >= g
            plot(C1(i,1),C1(i,2), 'ok')
            error = error + 1;
        end
        if C2(i,1) == C2(i,1) & C2(i,2) <= g2
            plot(C2(i,1),C2(i,2), 'ok')
            error = error + 1;
        end
    
end

error = error/400;
plot(Y, X);

            
            
            
            