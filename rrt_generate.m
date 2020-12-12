function tree = rrt_generate(world,xStart,k,deltaT)
    tree = tree_initialize(xStart,k);
    for vertex = 1:k
        xRand = random_state(world);
        idxNear = nearest_neighbor(tree,xRand);
        u = select_input(xRand,tree(idxNear).x);
        xNew = new_state(idxNear,u,deltaT);
        tree = tree_addVertex(tree,xNew);
        tree = tree_addEdge(tree,idxNear,xNew,u);
    end
end