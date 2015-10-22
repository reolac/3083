%% Task 1

close all, clear all, clc

training = rand(400, 2) 

class1 = zeros(200, 1)
class2 = zeros(200, 1)+
ctraining = [class1; class2]
training = [training, ctraining]



testing = randn(400, 2)*5;




figure;
hold;

scatter(training(:,1), training(:,2));


%% V Diagrams

clear all 
close all
clc

data = rand(20, 2);
[x, y] = meshgrid(0:0.005:1, 0:0.005:1)

for i = 1:size(x, 1)
    for j = 1:size(y,2)
        dist = ((data(:,1)-x(i,j)).^2+(data(:,2)-y(i,j)).^2); % euclidean distance
        [~, lab(i,j)] = min(dist); % each point given the label of which class it closest too (based on minimum of the eucliean distances) 
        % 4000 calculations, 201 x 201 matrix of just labels
    end
end

hold on % because you want to plot them all
for i = 1:size(data,1) % from 1 to the number of means (classes) 
    plot(x(lab == i), y(lab == i), '.', 'Color', rand(1,3)); % plot every x position that is that label and every y position that is that label with a dot with a random colour
    pause
end % selecting every y position that is classified in that label to plot it at the same time 


plot(data(:,1), data(:,2), 'k.');
axis square off; % picture rather than a graph makes the image square and turns the grid lines off