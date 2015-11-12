function [ Feature, Threshold, Labels ] = one_r(Z, labz )
[N, n] = size(Z);
    for i = 1:n
        [sZ sLab] = sort(Z(:,i));
        Y = labz(sLab);
        for j = 1:N-1
            LabelsLeft = mode(Y(1:j));
            LabelsRight = mode(Y(j+1:end));
            sl(j, i) = sum(Y(i:j) ~= LabelsLeft);
            sr(j, 1) = sum(Y(i:j) ~= LabelsRight);           
        end
    end
    
end

