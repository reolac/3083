function a = kruskals_mst_with_comments(b,c)
d = size(b,1); % number of points
e = nchoosek(1:d,2); % array with all edges (d*(d-1)/2 rows, 2 columns)
f = b(e(:,1),:) - b(e(:,2),:); % differences between point
% coordinates (these will be
% squared later to get the
% squared lengths)
[~,g] = sort(sum(f.*f,2)); % g is the index which will sort the
% edges from shortest to longest
e = e(g,:); % sorted edges according to length
a = 1:d; % forest with d trees (returned labels)
orig = 1:d;
step = 1;
fprintf('Step %d J = 0, #Cl %d: %s\n', step, numel(unique(a)), sprintf('( %d )',a))
while numel(unique(a)) > c % check if the desired number of clusters
    % has been reached;
    % if not, go through the loop
    if a(e(1,1)) ~= a(e(1,2)) % if the vertices of the shortest
        % remaining edge are NOT in the same
        % cluster,
        a(a==a(e(1,1))) = a(e(1,2)); % relabel all vertices from
        % cluster A into cluster B
        % (This eliminates cluster A.)
        step = step + 1;
        cDist(step) = sum(sqrt((e(1,:) - e(2,:)).^2));        
        uA = unique(a);
        stepText(:,step) = sprintf('Step %d J = %d, #Cl %d: ', step, cDist(step), numel(unique(a)));
        fprintf(stepText(:,step));
        for i = 1:numel(unique(a))
            clusterData{step, i} = sprintf('( %s)', sprintf('%d ', orig(a == uA(i))));
            fprintf(clusterData{step, i})
        end   
        fprintf('\n')
    end
    e(1,:) = []; % remove the shortest edge after use 
end
mInd = max(find(cDist==max(cDist)))-1;
a = cmunique(a) + 1;

fprintf('\nLargest jump == Step: %d >> return %s%s\n',mInd+1,...
    stepText(:,mInd), sprintf ('%s', clusterData{mInd,:}))
% as the labels for the c clusters may be
% any integers between 1 and d, "squeeze"
% them to be consecutive numbers 1, 2, 3,..., c
end