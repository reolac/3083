function [D] = MyRoc ( Z, Y )

% initialize empty variables outside of loop
Tp = Z*0;  % true positive
Fp = Tp; % false positive
Tn = Tp; % true negative
Fn = Tp; % false negative
startP = [0,0]; % add the starting point
endP = [1,1]; % add the ending point


for i = 1:(numel(Z))-1 % 1 to all but the last element
    mid = ((Z(i)) + (Z(i+1))) / 2; % mid point between the current and next elment
    for j = 1:numel(Z) % number of actual elements
        if Z(j) < mid & Y(j) == 1 % if the point is less than the mid and the class is 1
            Tp(i) = Tp(i) + 1; % increment true positive
        elseif Z(j) < mid & Y(j) ~= 1 % if the point is less than the mid and the class is 2
            Fp(i) = Fp(i) + 1; % increment false positive
        elseif Z(j) > mid & Y(j) == 2 % if the point is greater than mind and the class is 2
            Tn(i) = Tn(i) + 1; % increment true negative
        else                   % if not the point is greater than mind and the class is 1
            Fn(i) = Fn(i) + 1; % increment false negative
        end
    end
    % stores senstivity and specificty in a 2D array these are the
    % coordinates for the roc curve
    A(i, 1) = sum(Tp)/((sum(Tp)+sum(Fn))); % calculate the sensitivity
    A(i, 2) = 1-(sum(Tn)/((sum(Tn)+sum(Fp)))); % 1 minus the sum of specificity
    D = [startP; A; endP]; % put start and end points as well as the data points
    
end
end
