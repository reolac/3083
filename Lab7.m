%% Lab 7

%% Task 1 k-means clustering

%% (A) plot a dataset with three classes

close all, clear all, clc

C1 = randn(100,2);
C2 = randn(100, 2) - 1;
C3 = randn(100, 2) + 1;


lab1 = zeros(100, 1) + 1;
labD = [lab1; lab1+1; lab1+2];


C1 = [C1 lab1];
C2 = [C2 (lab1+1)];
C3 = [C3 (lab1+2)];


D = [C1; C2; C3];

figure, hold on;
plot (D(labD == 1,1),(D(labD == 1,2)), 'k.');
plot (D(labD == 2,1),(D(labD == 2,2)),  'ks');
plot (D(labD == 3,1),(D(labD == 3,2)), 'kx');

%% (b) use functions k-means and linkage to cluster data

%% k-means

close all, clc

Z = kmeans(D, 3);
%c = cluster(Z, 'maxclust', 2);

figure, hold on
title('k-means clustering with 3 classes');
plot (D(labD == 1,1),(D(labD == 1,2)), 'k.');
plot (D(labD == 2,1),(D(labD == 2,2)),  'ks');
plot (D(labD == 3,1),(D(labD == 3,2)), 'kx');

plot (D(Z == 1,1),(D(Z == 1,2)), 'mo');
plot (D(Z == 2,1),(D(Z == 2,2)),  'co');
plot (D(Z == 3,1),(D(Z == 3,2)), 'ro');

%% single linkage

SL = linkage(D);
c = cluster(SL, 'maxclust', 3);

figure, hold on
title('single linkage clustering with 3 classes');
plot (D(labD == 1,1),(D(labD == 1,2)), 'k.');
plot (D(labD == 2,1),(D(labD == 2,2)),  'ks');
plot (D(labD == 3,1),(D(labD == 3,2)), 'kx');

plot (D(c == 1,1),(D(c == 1,2)), 'mo');
plot (D(c == 2,1),(D(c == 2,2)),  'co');
plot (D(c == 3,1),(D(c == 3,2)), 'ro');

%% Task 2 Feature selection

%% (a) rank the digit data set from best to worst

close all, clear all, clc

load 'Example_MNIST_digits.mat'

figure, hold on;

for i = 1:10    
    m(1,:) = mean(b(labb == 1,:));
    
    x = b(labb == 1,:);
    
    for j = 1:size(x,1)
        D(j,:) = (x(j,:) - m(1,j));
    for k = 1:size(x,2)
     
        S(k) = sum(D(j,:)); % sum up columns rather than rows
    end
    
       % M = find(S==(max(S)));
    end
    %plot sum of all the criterion J's
    %plot(D(i,:), 'k.');
end

%mn = D(M,:);

figure;
hold on;

plot(S, 'k.');


imshow(uint8(reshape(mn), 28, 28))';





