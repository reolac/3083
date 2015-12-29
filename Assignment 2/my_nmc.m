function NewLabels = my_nmc(Ztr,Ytr,Zts)
% Ztr training set
% Ytr training labels
% Zts testing set
u = unique(Ytr); % existing class labels
c = numel(u); % number of classes
% Train the NMC
for i = 1:numel(u)
 m(i,:) = mean(Ztr(Ytr == u(i),:)); % mean for class u(i)
end
% Calculate the testing labels
for i = 1:size(Zts,1) % for every testing object
 x = Zts(i,:); % training object x
 d = sqrt(sum((repmat(x,c,1) - m).^2,2));
 % Euclidean distances from x to the c class means
 [~,LabelIndex(i)] = min(d);
end
NewLabels = u(LabelIndex); % retrieve the class labels
NewLabels = NewLabels(:); % return a column vector
