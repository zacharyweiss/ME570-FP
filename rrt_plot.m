function rrt_plot(world,tree)
    polygonworld_draw(world,tree(1).x)
    
    hold on
    idxChildren = tree(1).children;
    while ~isempty(idxChildren)
        idxSubChild = tree_plotChild(tree,idxChildren(1));
        idxChildren = [idxChildren idxSubChild];
        idxChildren(1) = [];
    end
end