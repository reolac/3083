%% Task 1

close all, clear all clc

C1 = randn(300,2) + 2;
C2 = randn(300,2) - 2;
C3 = randn(300,2);

C1 = [C1, (C1(:,1) * 0 + 1)];
C2 = [C2, (C2(:,1) * 0 + 2)];
C3 = [C3, (C3(:,1) * 0 + 3)];

All = [C1; C2; C3;]


figure, hold on
plot(C1(:,1),C1(:,2),'r.');
plot(C2(:,1),C2(:,2),'b.');
plot(C3(:,1),C3(:,2),'g.');

%% Part b

diary MyWekaFile.arff




for i = 1:size(All)
    fprintf('%f %f %d \n', All(i,1), All(i,2), All(i,3));
    
    
end
diary off

%%  Part C

% 1-nn  73%
% SVM 87%
% Decision-tree 85%
% Bagging = 87%

%% Part D

close all, clear all clc

C1 = randn(300,2) + 1;
C2 = randn(300,2) - 1;
C3 = randn(300,2);

C1 = [C1, (C1(:,1) * 0 + 1)];
C2 = [C2, (C2(:,1) * 0 + 2)];
C3 = [C3, (C3(:,1) * 0 + 3)];

All = [C1; C2; C3;]


figure, hold on
plot(C1(:,1),C1(:,2),'r.');
plot(C2(:,1),C2(:,2),'b.');
plot(C3(:,1),C3(:,2),'g.');

diary MyWekaFile2.arff




for i = 1:size(All)
    fprintf('%f %f %d \n', All(i,1), All(i,2), All(i,3));
        
end
diary off


% 1-nn 53.666%
% SVM 68.888%
% Decision-tree 68.222%
% Bagging 68.889%


%% Task 2
close all, clear all, clc

DS = randn(8,2);

Z = linkage(DS);
c = cluster(Z, 'maxclust', 2);
figure, hold on
plot(DS(c==1,1),DS(c==1,2),'mo','linewidth',3)
plot(DS(c==2,1),DS(c==2,2),'bo','linewidth',3)

