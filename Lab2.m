%% Task 1 a

close all, clear all, clc

X = (-5:0.05:5)';
G1 = 2*X + 12;
G2 = (X - 4).^2;
G3 = X.^3 - 2*X + 2;

cLabel = zeros(size(X));

X = [X, cLabel];

figure
hold on
axis square

for i = 1:size(X)
    if  (X(i,1) <= 0.4)
        plot(X(i,1),0, 'r.');
        X(i,2) = 2;
    elseif (X(i,1) <= 2.75)
        plot(X(i,1),0, 'k.');
        X(i,2) = 1;
    else
        plot(X(i,1),0, 'b.');
        X(i,2) = 3;
    end
end

% plot(X(:,1), G1, 'k');
% plot(X(:,1), G2, 'r');
% plot(X(:,1), G3, 'b');

%% Task 1 b

close all, clear all, clc

x1 = [-20:20];
y1 = [-20:20];

[xx, yy] = meshgrid(x1, y1);

figure
hold on
grid on


for i = 1:size(xx)
    for j = 1:size(yy)  
       g1 = -3 * xx(i,j) + 6 * yy(i,j);
       g2 = xx(i,j) * yy(i,j).^2 - 5 * xx(i,j) - 100;    
       if g1 <= g2
           plot(xx(i,j), yy(i,j),'rs','MarkerFaceColor',[1 0 0]);
           
       else
           plot(xx(i,j), yy(i,j),'ks','MarkerFaceColor',[0 0 0]);
       end
       
    end
end









    
        



