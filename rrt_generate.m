function tree = rrt_generate(world,xStart,k,deltaT)
    tree = tree_initialize(xStart,k);
    for iVertex = 2:k
        isValidConfig = false;
        while ~isValidConfig
            xRand = state_random(world);
            idxNear = nearest_neighbor(tree,xRand);
            u = select_input(xRand,tree(idxNear).x);
            xNew = state_new(tree(idxNear).x,u,deltaT);
            isValidConfig = state_new_isValid(world,xNew);
        end
        tree = tree_makeChild(tree,iVertex,idxNear);
    end
end