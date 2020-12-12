function idxSubChildren = tree_plotChild(tree,idxChild)
    xChild = tree(idxChild).x;
    idxSubChildren = tree(idxChild).children;

    hold on
    quiver(tree(idxChild).edge)
    plot(xChild(1),xChild(2))
end

