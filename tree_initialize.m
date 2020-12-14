function tree = tree_initialize(xStart,k)
    tree = repmat(struct('parent',[],'children',[],'edge',[],'x',[],'obs',struct('idx',[],'nodes',[],'dist',[],'col',[])),k,1);
    tree(1).parent = 0;
    tree(1).x = xStart;
    
    % observations
    tree(1).obs.idx = 1;
    tree(1).obs.nodes = 1;
    tree(1).obs.dist = 0;
    tree(1).obs.col = 0;
end