function w = PerCep( b, labb )
features = size(b,2); % amount of weights for the features
w = randn(1,features+1); % row of weights plus 1 for the bias
eta = 0.3; % learning weights 
errors = true; % set flag to true
passes = 0; % amount of iterations
while errors > 0 || passes ~= 50 % until there are no errors or ...
    % after 1000 iterations
    passes = passes + 1; % increment the amount of interation
    errors = false; % reset error flag 
    for j = 1:size(b,1) % from 1 to size of the data
        x = b(j,:); % pulling out each row of the data
        aX = [1 x]; % adding the bias
        netsum = sum(aX .* w); % element wise 
        if netsum < 0 % if the netsum was negative
            v = 0; % assign class 0
        else % the netsum was positive
            v = 1; % assign class 1
        end
        if labb(j) ~= v % if the actual lab does not ...
            % match the assigned label
            errors = true; % there is an error
            w = w - (2*v -1) * eta * aX; % calculate new weights
        end
    end
end
end