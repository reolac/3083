function a = kruskals_mst(b,c)
% Kruskal’s algorithm (1956) MINIMUM SPANNING TREE
% 1. Create a forest F (a set of trees), where each vertex in
% in the graph is a separate tree
% 2. Create a set S containing all the edges in the graph
% 3. While S is nonempty and F is not yet spanning
% a. Remove an edge with minimum weight from S
% b. If that edge connects two different trees, then add
% it to the forest, combining two trees into a single tree
% c. Otherwise discard that edge.
% 4. At the termination of the algorithm, the forest forms
% a minimum spanning forest of the graph. If the graph is
% connected, the forest has a single component and forms a
% minimum spanning tree.
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
while numel(unique(a)) > c % check if the desired number of clusters
    % has been reached;
    % if not, go through the loop
    if a(e(1,1)) ~= a(e(1,2)) % if the vertices of the shortest
        % remaining edge are NOT in the same
        % cluster,
        a(a==a(e(1,1))) = a(e(1,2)); % relabel all vertices from
        % cluster A into cluster B
        % (This eliminates cluster A.)
    end
    e(1,:) = []; % remove the shortest edge after use
end
a = cmunique(a) + 1; % as the labels for the c clusters may be
% any integers between 1 and d, "squeeze"
% them to be consecutive numbers 1, 2, 3,..., c
end