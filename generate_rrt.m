function tree = generate_rrt(world,xStart,k,deltaT)
    tree = tree_initialize(xStart,k);
    for vertex = 1:k
        xRand = random_state(world);
        xNear = nearest_neighbor(tree,xRand);
        u = select_input(world,xRand,xNear);
        xNew = new_state(xNear,u,deltaT);
        tree = tree_addVertex(tree,xNew);
        tree = tree_addEdge(tree,xNear,xNew,u);
    end
end