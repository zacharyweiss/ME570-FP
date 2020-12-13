function xPath = tree_path(tree,idxNode)
% from a given end node, returns the path from root that leads to said node

% could be optimized by using # of nodes in path up to node under 
% observation (stored in tree.obs.nodes) to preallocate path and index
% into, but for sake of simplicity, written in slower but more generalized
% form
    xPath = [];
    % while not root node
    while(tree(idxNode).parent~=0)
        xPath = [tree(idxNode).x xPath];
        idxNode = tree(idxNode).parent;
    end
    
    xPath = [tree(1).x xPath];
end