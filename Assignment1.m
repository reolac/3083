%% ICP 3083 - Assignment 1 - Michael Smith <eeu213>

%% Task 1.
close all, clear all, clc
load('Example_MNIST_digits.mat');
% Gives us; 'b' and 'labb'

c = sortrows([labb b],1);
c1(1,:) = mean(c(1:sum(labb==1),2:end));
start = 0;
for i = 2:10
    start = start + (sum(labb==i-1));
    cP = start + sum(labb==i);
    c1(i,:) = mean(c(start:cP,2:end));
end

for i = 1:10
     subplot(3,4,i);
     j = randi(size(b,1));
     m=reshape(c1(i,:), 28, 28);
     imshow(uint8(m'));
     title(i-1);
end
 
%% Task 2.
close all, clear all, clc
load('Example_MNIST_digits.mat')

r = mean(b'>120,1);
a = zeros(size(r));
for i = 1:size(b,1) % from 1 to number of rows in b (first dimension(rows) for every example in b
    c = reshape(b(i,:), 28, 28); % extracts every row in b, pulling out each example induvidually
    [row, col] = find(c); % gives position of the row index and the column index of every value of c which is not zero
    % entry in row and col that is not zero
    a(i) = (max(row) - min(row)) / ... % find the maximum row for the width(top) minus the minumum row (bottom) to find the width
            (max(col)-min(col)); % find the maximum column for the height(right) minus th minumum column (left) divided together gives a scalar 
end

Z = [a(:) r(:)];


%% Task 2 D

hold on
plot(r(labb == 1), a(labb == 1), 'r.');
plot(r(labb == 2), a(labb == 2), 'gx');
plot(r(labb == 3), a(labb == 3), 'bs');
legend('Digit 0', 'Digit 1');

%% Task 3 A.
clc
ltp = [1:10]; %labels to plot against

ind = labb == 1 | labb == 2;
ZZ = Z(ind,:); YY = labb(ind);
NY = classifier(ZZ,YY);

%mean(NY == YY) 
%uses the 
%confusion matrix 
CM(1,1) = sum(YY==1 & NY == 1);
CM(1,2) = sum(YY==1 & NY == 2);
CM(2,1) = sum(YY==2 & NY == 1);
CM(2,2) = sum(YY==2 & NY == 2);

errorRate = (CM(1,2) + CM(2,1)) / sum(CM(:));
errorRate = 0
for i = 1:10
    for j = 2:10
        ind = labb == 1 | labb == j;
        ZZ = Z(ind,:); YY = labb(ind);
        NY = classifier(ZZ,YY);
        CM(1,1) = sum(YY==1 & NY == 1);
        CM(1,2) = sum(YY==1 & NY == j);
        CM(2,1) = sum(YY==j & NY == 1);
        CM(2,2) = sum(YY==j & NY == j);
        errorRate(j) = (CM(1,2) + CM(2,1)) / sum(CM(:));
    end
end
%CM
%% Task 3B.
close all, clear all, clc

load('Example_MNIST_digits.mat')

tstD = randn(200,2);
TrnL = randi(3,200,1);  
trnD = randn(200,2);





    



tsD2 = tstD(ind,:);
tsD2m = mean(tstD);

figure
hold on
plot (tstD(:,1), tstD(:,2), 'k.');
plot (tsD2m(:,1), tsD2m(:,2), 'r.');

TrnL2 = TrnL(ind);


%%
%d
hold on 
plot(r(labb == 1), a(labb ==1), 'r.');
plot(r(labb == 2), a(labb ==2), 'gx');
legend('Digit 0', 'Digit 1'); % plot explains the two digits are seperate.
%digit 1 is vertical small hight / small with / large heigt or with 0 its
%pretty much a circle 
%