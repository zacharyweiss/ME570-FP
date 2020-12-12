function tree = tree_makeChild(tree,iVertex,xNew,idxNear)
    tree(iVertex).x = xNew;
    tree(iVertex).edge = xNew - tree(idxNear).x;
    tree(iVertex).parent = idxNear;
    tree(idxNear).children = [tree(idxNear).children iVertex];
end

