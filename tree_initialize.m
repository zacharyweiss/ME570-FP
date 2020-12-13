function tree = tree_initialize(xStart,k)
    tree = repmat(struct('parent',[],'children',[],'edge',[],'x',[],'obs',struct('idx',-1,'nodes',-1,'dist',-1,'col',-1)),k,1);
    tree(1).parent = 0;
    tree(1).x = xStart;
    
    % observations
    tree(1).obs.idx = 1;
    tree(1).obs.nodes = 1;
end