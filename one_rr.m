function [Feature, Threshold, Labels] = one_rr(Z, labZ)

[N, n] = size(Z);
% N number of objects
% n number of features

for i = 1:n
    x = Z(:,i);
    [sx, index] = sort(x);
    Y = labZ(index);
    for j = 1:N-1
        LabelsLeft(j) = mode(Y(1:j));
        el = sum(Y(1:j) ~= LabelsLeft(j));
        LabelsRight(j) = mode(Y(j+1:end));
        er = sum(Y(j+1:end) ~= LabelsRight(j));
        e(j) = el + er;
        Th(j) = (sx(j) + sx(j+1))/2;
    end
    [me(i), index_min_error] = min(e);
    LL(i) = LabelsLeft(index_min_error);
    LR(i) = LabelsRight(index_min_error);
    TT(i) = Th(index_min_error);
end
    [~, Feature] = min(me);
    Threshold = TT(Feature);
    Labels = [LL(Feature), LR(Feature)];
    
