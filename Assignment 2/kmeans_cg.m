function [c, m] = kmeans_cg(d, k)
    szd = size(d,1);
    m = d(randperm(szd, k),:);
    
    [lm, c] = deal(zeros(size(m)), zeros(szd, 1));
    while (m ~= lm)
        lm = m;
        [~, c]=cellfun(@(x)min(sum(bsxfun(@minus,x,m).^2')),num2cell(d,2));
        m = cell2mat(arrayfun(@(x) mean(d(c==x,:)), unique(c), 'Uni', 0));
    end
end