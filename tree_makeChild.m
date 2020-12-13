function tree = tree_makeChild(tree,iVertex,xNew,idxNear)
    tree(iVertex).x = xNew;
    tree(iVertex).edge = xNew - tree(idxNear).x;
    tree(iVertex).parent = idxNear;
    tree(idxNear).children = [tree(idxNear).children iVertex];
    
    % observations
    tree(iVertex).obs.idx = iVertex;
    tree(iVertex).obs.nodes = tree(idxNear).obs.nodes + 1;
    tree(iVertex).obs.dist = tree(idxNear).obs.dist + norm(tree(iVertex).edge);
    tree(iVertex).obs.col = tree(idxNear).obs.col;
end

