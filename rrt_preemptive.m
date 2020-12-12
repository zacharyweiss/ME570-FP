function rrt_preemptive()
    nVerts = 250;
    deltaT = 0.1;
    
    load polygonWorld.mat
    
    clf
    tree = rrt_generate(world,xStart(:,1),nVerts,deltaT)
    axis equal
    rrt_plot(world,tree)
    
    % pick best here
end

