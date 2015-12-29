function NewLabels = MyNMC(Ztr,Ytr,Zts)
% Ztr training set
% Ytr training labels
% Zts testing set

for i = 1:numel(unique(Ytr)) % for the amount of possible classifications
    ind = Ztr == i; % index of all training points which match this label
    tstDm(i, :) = mean(Ztr(ind,:)); % calculates the mean x and mean y of...
    % these testing points, returning i means for i classes
    
     for j = 1:size(Ztr,1) % for all of the points to be tested
         d1(j,i) = sqrt((Ztr(j,1) - tstDm(i,1))^2 + (trnD(j,2) - tstDm(i,2))^2); 
         % ... the euclidean distance: x1 of testing data minus x1 of the
         % mean of class i of the training data, then x2 of the testing data minus
         % x2 of the mean of class i of the training data, looping through every
         % object in the training data then against every mean of the class
         % storing the results in a j*i array, j being the amount of
         % objects, i being the amount of classes
         
         [M I] = min(d1(j,:)); % finds the index of the minimum value of each column
         % the minumum value is the distance from the object i of
         % the training data to the closest class
         nmI(j,1) = I; % creates a new label vector for the labels of the testing data
         % using the index of the column for the value whic had the minumum distance
     end     
end

 

end
