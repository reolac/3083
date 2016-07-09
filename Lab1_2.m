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
plot (X(:,1), X(:,2),'k.')

%% Task 1 c
close all, clear all, clc

X = randn(100, 100, 100);

figure
hold
plot3 (X(:,1), X(:,2), X(:,3), 'r.')
rotate3d
grid on

%% Task 1 d

close all, clear all, clc

X = randn(1000, 2);


figure
hold
axis ([-10 10 -10 10])


for i = 1:size(X)
    if  (X(i,1) >= X(i,1) & X(i,2) >= (X(i, 1) + 1.5))
        plot (X(i,1), X(i,2),'b+')
    
    else
        plot (X(i,1), X(i,2),'k.')
    end
        
end

%% Task 1 e

close all, clear all, clc

C1 = randn(500, 2) * 2;
C1(:,1) = C1(:,1)*2-10;
C1(:,2) = C1(:,2)+5;

C2 = randn(500, 2);
C2(:,1) = C2(:,1)/4;
C2(:,2) = C2(:,2)*2+7;


C3 = randn(500, 2)/1.25;
C3(:,1) = C3(:,1) - 20;

C4 = randn(500, 2) * 3;
C4(:,1) = C4(:,1) + 15;

C5 = randn(1000, 2);
C6 = randn(1000, 2);
C7 = randn(1000, 2);
C8 = randn(1000, 2);

figure
hold on
axis square

plot (C1(:,1), C1(:,2),'r.')
plot (C2(:,1), C2(:,2),'b.')
plot (C3(:,1), C3(:,2),'g.')
plot (C4(:,1), C4(:,2),'y.')
%plot (C5(:,1), C5(:,2),'k.')
%plot (C6(:,1), C6(:,2),'p.')
%plot (C7(:,1), C7(:,2),'r.')
%plot (C8(:,1), C8(:,2),'r.')




