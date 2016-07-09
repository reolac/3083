%% ICP 3083 - Assignment 1 - Michael Smith <eeu213>

%% Task 1.
close all, clear all, clc
load('Example_MNIST_digits.mat'); % Gives us; 'b' and 'labb'

for i = 1:numel(unique(labb)) % from 1 to the different number of labels
    subplot(3,4,i) % create a sub plot of 3 by 4 and plot in the ith element
    imshow(uint8(reshape(mean(b(labb == i,:)), 28, 28)')); %finds the index
    % all rows which have label i, extracting only the rows which match and
    % calculate the mean of them column by column then reshaping the image
    % to make it square, transposing the image so it appears the right away
    % up, converting it to an image then plotting it before moving on to
    % the next one
    title(i-1); % puts a title to represent the number it is showing i-1
    % because the first number is zero not one and the last number is nine
    % and not ten
end

%% Task 2.
clc, close all

D = b<120; % converts the image to binary, any number less than 120 gets converted
% to a 1 any number higher gets converted to a 0 meaning you would get an
% image of black (0) and white (1) pixels, the actual number would
% typically be the black pixels as those values would of been greater than
% 120 originally, the background would be white because it was less
r = 1-(mean(D',1)); % adds up all of the 1s and divides it by the total amount
% of pixels in that row gives the proporition of white, so we do minus-1 to
% get the proportion of black pixels
a = zeros(size(r)); % creates a blank vector to store the aspect ratio of the
% same size as r
for i = 1:size(D,1) % from 1 to the number of elements in a row
    c = reshape(D(i,:), 28, 28); % pulls out every row of that number induvidually
    [row, col] = find(not(c)); % finds the row and column index for every
    % element that is 0, ignoring 1 as that is the background
    a(1, i) = (max(row) - min(row)) / (max(col)-min(col));
    % left most point minus right most point
    % top most point minus bottom most point
    % divided totals together to get aspect ratio
end
Z = [a(:) r(:)]; % creates a dataset with 2 features 'a' aspect ratio
% r proportion of black pixels to white pixels
%% Task 3A
clc, close all
errorRate = zeros(10,1); % initalize matrix to store the error rates out of the loop
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2); % reset confusion matrix for the next digit
    for j = 1:9 % testing against
        ind = labb == i | labb == ltp(j); % index of the test and training data
        ZZ = Z(ind,:); % index used to extract corresponding aspect ratio
        % and proporition from dataset Z
        YY = labb(ind); % index used to extract corresponding labels
        NY = classifier(ZZ,YY); % extracted dataset and labels as input to
        % the function
        
        % confusion matrix
        CM(1,1) = CM(1,1) + sum(YY==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive)
        CM(1,2) = CM(1,2) + sum(YY==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM(2,1) = CM(2,1) + sum(YY==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM(2,2) = CM(2,2) + sum(YY==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)       
    end
    
    errorRate(i) = (CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the error rate by
    % adding up the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements
end

errorRate


%% Task 3B.
close all, clc

NewLabels = MyNMC(training, trainingL, testing);

%% Task 3C.
clc, close all

errorRate = zeros(10,1); % initalize matrix to store the error rates out of the loop
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2); % reset confusion matrix for next digit
    training = Z; % a copy of the training data
    digitLabels = labb; % a copy of the labels
    
    
    
    for j = 1:9 % testing against
        ind = digitLabels == i | digitLabels == ltp(j); % index of the test and training data
        % index used to extract corresponding aspect ratio
        % and proporition from dataset Z
        % index used to extract corresponding labels
        ZZ = training(ind,:); % a copy of the data to be tested using the ind
        % of all those which meet the requirement
        for k = 1:size(ZZ,1)-1 % for every element to be trained 
            %removeIndex = find (labb == i);  
            ZZ = training(ind,:); % reset the training data
            YY = digitLabels(ind); % reset the labels
            testing = ZZ((k),:); % take the kth element from the data for testing
            testingL = YY((k)); % take the kth labe from the data for testing
            ZZ((k),:) = []; % delete that element from the training
            YY((k)) = []; % delete that label from the training
            NY = MyNMC(ZZ, YY, testing); % ZZ is the training data, YY is the 
            % training labels 'testing' is the 1 element of the initial data which 
            % was removed from zz and added here this changes every
            % iteration until it has gone through each possible element
            
            
            % confusion matrix
            CM(1,1) = CM(1,1) + sum(testingL==i & NY == i); % calculates elements which were
            % assigned positive and were positive (true positive)
            CM(1,2) = CM(1,2) + sum(testingL==i & NY == ltp(j)); % calculates elements which were
            % actually negative but assigned positive (false positive)
            CM(2,1) = CM(2,1) + sum(testingL==ltp(j) & NY == i); % calculates elements which were
            % actually positive but were assigned negative (false negative)
            CM(2,2) = CM(2,2) + sum(testingL==ltp(j) & NY == ltp(j)); % calcuales elements which were
            % assigned negative and were negative (true negative)
        end
        
    end
    
    
    errorRate(i) = (CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the error rate by
    % adding up the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements
end

%% Task 4 original data set
close all, clc


errorRate = zeros(10,1);
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2);
    for j = 1:9 % testing against
        ind = labb == i | labb == ltp(j); % index of the test and training data
        ZZ = b(ind,:); % index used to extract corresponding aspect ratio
        % and proporition from dataset Z
        YY = labb(ind); % index used to extract corresponding labels
        NY = classifier(ZZ,YY); % extracted dataset and labels as input to
        % the function
        
        % confusion matrix
        CM(1,1) = CM(1,1) + sum(YY==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive)
        CM(1,2) = CM(1,2) + sum(YY==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM(2,1) = CM(2,1) + sum(YY==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM(2,2) = CM(2,2) + sum(YY==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)
        
    end
    
    errorRate(i) = (CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the error rate by
    % adding up the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements
end

%% Task 4 with dataset D

close all, clc


errorRate = zeros(10,1);
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2);
    for j = 1:9 % testing against
        ind = labb == i | labb == ltp(j); % index of the test and training data
        ZZ = D(ind,:); % index used to extract corresponding aspect ratio
        % and proporition from dataset Z
        YY = labb(ind); % index used to extract corresponding labels
        NY = classifier(ZZ,YY); % extracted dataset and labels as input to
        % the function
        
        % confusion matrix
        CM(1,1) = CM(1,1) + sum(YY==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive)
        CM(1,2) = CM(1,2) + sum(YY==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM(2,1) = CM(2,1) + sum(YY==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM(2,2) = CM(2,2) + sum(YY==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)
        
    end
    
    errorRate(i) = (CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the error rate by
    % adding up the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements
end


%% Task 6.

close all, clc

[coords] = MyRoc(Z(:,1), labb); % aspect ratio with corressponding labels into roc function
[coords2] = MyRoc(Z(:,2), labb); % proportion of dots with corressponding labels into roc function
figure, hold on, grid on;

title('ROC curve of class positive (digit 1) against class negative (digit 2:10)')
xlabel('1-Specificity') % x-axis label
ylabel('Sensitivity') % y-axis label
plot(coords(:,1),coords(:,2),'b'); % plotting aspect ratio 
plot(coords2(:,1),coords2(:,2),'r'); % plotting proportion 
legend('Aspect Ratio','Proportion black')


%% Task 7. 9 NMC
clc
training = b; % using the original data 
digitLabels = labb; % labels 
M = zeros(2,2);
CM2 = zeros(2,2); % reset confusion matrix
errorRate = zeros(10,1); % initialize array outside loop
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2); % reset confusion matrix
    
    for j = 1:9 % testing against
        ind = digitLabels == i | digitLabels == ltp(j); % index of the test and training data
        ZZ = training(ind,:); % index used to extract corresponding aspect ratio
      for k = 1:9 % from 1 to 9 samples to classify with
        rndIDX = randperm(size(ZZ,1)); % randomizes the indexes in the dataset
        
        newSample = ZZ(rndIDX(k), :); % takes a the kth sample out of the randomly
        % assorted data set (takes a random sample)

        YY = digitLabels(ind); % index used to extract corresponding labels
        nL = YY(rndIDX(k)); % takes the kth label to match the k sample taken
        NY = MyNMC(ZZ, YY, newSample); % extracted dataset and labels as input to
        % the function to test against sample k
        
        
        
        % confusion matrix which resets per digit
        CM(1,1) = CM(1,1) + sum(nL==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive) 
        CM(1,2) = CM(1,2) + sum(nL==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM(2,1) = CM(2,1) + sum(nL==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM(2,2) = CM(2,2) + sum(nL==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)
        
        % confusion matrix to save
        CM2(1,1) = CM2(1,1) + sum(nL==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive)
        CM2(1,2) = CM2(1,2) + sum(nL==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM2(2,1) = CM2(2,1) + sum(nL==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM2(2,2) = CM2(2,2) + sum(nL==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)
      end  
    end
    
    accuracy(i) = 1-(CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the accuracy by
    % 1 minus the adding up of the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements
end

CM2




%% Task 7. 1 NMC

clc
training = b;
digitLabels = labb;

errorRate = zeros(10,1);
for i = 1:10 % each actual digit
    ltp = unique((labb(labb ~= i))); % labels to test against, reassigned everytime we change
    % the training data
    CM = zeros(2,2);
    
    %testing = Z(newSample);
    
    for j = 1:9 % testing against
        ind = digitLabels == i | digitLabels == ltp(j); % index of the test and training data
        ZZ = training(ind,:); % index used to extract corresponding aspect ratio
        
        
        % and proporition from dataset Z
        YY = digitLabels(ind); % index used to extract corresponding labels

        NY = MyNMC(ZZ, YY, ZZ); % extracted dataset and labels as input to
        % the function
        
        
        
        % confusion matrix
        CM(1,1) = CM(1,1) + sum(YY==i & NY == i); % calculates elements which were
        % assigned positive and were positive (true positive)
        CM(1,2) = CM(1,2) + sum(YY==i & NY == ltp(j)); % calculates elements which were
        % actually negative but assigned positive (false positive)
        CM(2,1) = CM(2,1) + sum(YY==ltp(j) & NY == i); % calculates elements which were
        % actually positive but were assigned negative (false negative)
        CM(2,2) = CM(2,2) + sum(YY==ltp(j) & NY == ltp(j)); % calcuales elements which were
        % assigned negative and were negative (true negative)
        
    end
    
    acurracy1(i) = (CM(1,2) + CM(2,1)) / sum(CM(:)); % gets the accuracy rate by
    % 1 minus the adding up of the elements which were wrongly assigned, which are false
    % positive and false negative and divided them by the total amount of
    % elements 
end