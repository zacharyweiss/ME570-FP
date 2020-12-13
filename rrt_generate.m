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
            % collision observations, increment for idxNear and children
            if ~isValidConfig
                idxChildren = idxNear;
                while ~isempty(idxChildren)
                    tree(idxChildren(1)).obs.col = tree(idxChildren(1)).obs.col + 1;
                    idxSubChild = tree(idxChildren(1)).children;
                    idxChildren = [idxChildren idxSubChild];
                    idxChildren(1) = [];
                end
            end
        end
        tree = tree_makeChild(tree,iVertex,xNew,idxNear);
    end
end