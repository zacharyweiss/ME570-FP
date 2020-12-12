function tree = rrt_generate(world,xStart,k,deltaT)
    tree = tree_initialize(xStart,k);
    for iVertex = 2:k
        isValidConfig = false;
        while ~isValidConfig
            xRand = state_random(world);
            idxNear = nearest_neighbor(tree,xRand);
            u = select_input(xRand,tree(idxNear).x,deltaT);
            xNew = state_new(tree(idxNear).x,u,deltaT);
            isValidConfig = state_new_isValid(world,xNew,tree(idxNear).x);
        end
        tree = tree_makeChild(tree,iVertex,xNew,idxNear);
    end
end