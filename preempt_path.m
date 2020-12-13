function preempt_path()
    nVerts = 500;
    deltaT = 0.1;
    
    load polygonWorld.mat
    tree = rrt_generate(world,xStart(:,1),nVerts,deltaT);
    
    clf
    axis equal
    rrt_plot(world,tree)
    
    % pick best here
end

