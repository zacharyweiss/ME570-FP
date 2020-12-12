function rrt_plot(world,tree)
    polygonworld_draw(world,tree(0).x)
    
    hold on
    idxChildren = tree(0).children;
    while ~empty(idxChildren)
        idxSubChild = tree_plotChild(tree,idxChildren(1));
        idxChildren = [idxChildren idxSubChild];
        idxChildren(1) = [];
    end
end