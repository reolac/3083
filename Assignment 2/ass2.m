%% Assessment 2

%% Task 1

%% (a)

close all, clear all, clc;

A = randi([1 5],10,2); % 10 objects with 2 features varying from 1 to 5

while size(unique(A,'rows'),1) ~= 10 % while there are not 10 different objects
    A = randi([1 5],10,2);
end

hold on;
grid on;
set(gca,'Xtick',1:5, 'Ytick',1:5);
xlabel('x1');
ylabel('x2');

plot (A(:,1),A(:,2), 'k.', 'MarkerSize', 20);
text(A(:,1)+0.06, A(:,2), cellstr(num2str((1:size(A,1))')),'FontSize',12);
% converts the index of the point into a number and displays it


%% (b)

clc

B = zeros(10,10);

for i = 1:size(A,1)
    for j = 1:size(A,1)
        B(i,j) = sum((A(i,:) - A(j,:)).^2);
    end
end

%% (c & d & e)

clc, close all;

C = kruskals_mst_with_comments(A,3);

hold on;
grid on;
set(gca,'Xtick',1:5, 'Ytick',1:5);
xlabel('x1');
ylabel('x2');
plot(A(C==1,1), A(C==1,2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red');
plot(A(C==2,1), A(C==2,2), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'green');
plot(A(C==3,1), A(C==3,2), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'blue');

plot (A(:,1),A(:,2), 'k.', 'MarkerSize', 20);
text(A(:,1)+0.06, A(:,2), cellstr(num2str((1:size(A,1))')),'FontSize',12);

%% Task 2

%% (a)

close all, clear all, clc

D = randn(1200,2);
labD = repmat((1:5)', numel(D(:,1))/5,1);

D(labD==2,1) = D(labD==2,1) + 3;
D(labD==3,1) = D(labD==3,1) - 3;
D(labD==4,2) = D(labD==4,2) + 3;
D(labD==5,2) = D(labD==5,2) - 3;

hold on;
grid on;
xlabel('x1');
ylabel('x2');
for i = 1:numel(unique(labD))
    plot(D(labD==i,1),D(labD==i,2),'.','color',rand(1,3),'MarkerSize',20)
end
%% (b)
close all, clc;

for i = 2:7
    subplot(2, 3, i-1);
    title(i);
    axis off;
    hold on;
    E = kmeans_cg(D,i);
    for j = 1:i
        plot(D(E==j,1),D(E==j,2),'.','color',rand(1,3))
    end
end

%% Task 3

%% (a)

close all, clear all, clc

load 'Example_MNIST_digits.mat'

D38 = b(labb==4 | labb==9,:);
D38lab = labb(labb==4 | labb==9);


% (b)

close all, clc

F = sqrt((mean(D38(D38lab == 4,:),1) - mean(D38(D38lab == 9,:),1)).^2);
[G, indG] = sort(F,'descend');
D38 = D38(:,indG);

fprintf('\t\t\t\t\t\t\t\t\t\t\t\t\tTop 10 Features\n\nIndex ::');
fprintf('\t\t\t%d', indG(1:10));
fprintf('\n\nCriterion Value ::');
fprintf('\t%f', G(1:10));


%% (c)

close all, clc

axis square;
axis off;
imagesc(reshape(F,28,28))
colormap(jet);

%% (d)

close all, clc

fprintf('Number of Irrelevant Values ::\t%d\n', numel(G(G==0)));

hold on;
xlabel('index');
ylabel('value');
title('Graph showing a visual representation of the Criterion');

plot(G, 'k');
plot(find(G==0),0,'r.');

legend('Relevent Criterion Values','Irrelevant Criterion Values');

D38_clean = D38(:,G~=0);

%% (e)

close all, clc

[~, pc] = pca(D38_clean);

hold on;
grid on;
xlabel('x1');
ylabel('x2');

plot(pc(D38lab == 4,1), pc(D38lab == 4,2), '.k', 'MarkerSize', 15);
plot(pc(D38lab == 9,1), pc(D38lab == 9,2), '.r', 'MarkerSize', 15);

legend('Digit 3', 'Digit 8', 'Location', 'southwest');

%% (f)

close all, clc

J = my_nmc(D38(1:round(size(D38,1)/2),1:8),...
    D38lab(1:round(size(D38lab)/2)), D38(round(size(D38,1)/2)+1:end,1:8));
K = sum(D38lab(round(size(D38lab)/2)+1:end) ~= J)/numel(J);

L = my_nmc(pc(1:round(size(D38,1)/2),1:8), ...
    D38lab(1:round(size(D38lab)/2)), pc(round(size(D38,1)/2)+1:end,1:8));
M = sum(D38lab(round(size(D38lab)/2)+1:end) ~= L)/numel(L);

fprintf('D38 NMC Error = %f\\n', K);
fprintf('PC NMC Error = %f\n', M);
fprintf('Difference = %f\n', K - M);

%% Task 4

close all, clear all, clc

N = 1*rand(100,2);
labN =  0.4 * N(:,1) + 0.4 * N(:,2) - 0.4 > 0;

O = perceptron(N, labN, 0.5);
O = perceptron(N, labN, 1);

%% Task 5
close all, clear all, clc;

[xx, yy] = meshgrid(0:0.005:1, 0:0.005:1);

cx = [0.84, 0.49, 0.67, 0.92, 0.94, 0.22, 0.21, 0.81,...
    0.10, 0.21]';

cy = [0.55, 0.61, 0.25, 0.50, 0.66, 0.85, 0.78, 0.92,...
    0.44 0.70]';

s = [0.08, 0.70, 0.59, 0.18, 0.30, 0.70, 0.84, 0.44,...
    0.07, 0.41]';

w = [0.28, -0.64, 0.51, 1.06, 0.51, -0.35, -1.49, 1.53, -0.50, 0.58, 1.89]';

P = zeros(201, 201);

for i = 1:size(xx,1)
    for j = 1:size(yy,1)
        P(i, j) = sum([1; exp(-(((repmat(xx(i, j), 10, 1) - cx).^2) +...
            ((repmat(yy(i, j), 10, 1) - cy).^2)) ./ (2 * s.^2))] .* w);
    end
end


imagesc(P);
axis off;
colormap(jet);