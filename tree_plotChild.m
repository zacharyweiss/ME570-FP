function idxSubChildren = tree_plotChild(tree,idxChild)
    xChild = tree(idxChild).x;
    xParent = tree(tree(idxChild).parent).x;
    edge = tree(idxChild).edge;
    idxSubChildren = tree(idxChild).children;

    hold on
    quiver(xParent(1),xParent(2),edge(1),edge(2))
    plot(xChild(1),xChild(2))
end

